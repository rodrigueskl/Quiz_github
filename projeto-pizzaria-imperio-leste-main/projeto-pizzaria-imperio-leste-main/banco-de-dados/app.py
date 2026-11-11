
from flask import Flask, render_template, request, redirect
import sqlite3

app = Flask(__name__)


def conectar_banco():
    conexao = sqlite3.connect("banco.db")
    conexao.row_factory = sqlite3.Row
    return conexao


# DASHBOARD
@app.route("/")
def inicio():
    conexao = conectar_banco()

    produtos = conexao.execute(
        "SELECT * FROM produto"
    ).fetchall()

    total_produtos = conexao.execute(
        "SELECT COUNT(*) FROM produto"
    ).fetchone()[0]

    total_ingredientes = conexao.execute(
        "SELECT COUNT(*) FROM ingrediente"
    ).fetchone()[0]

    total_clientes = conexao.execute(
        "SELECT COUNT(*) FROM cliente"
    ).fetchone()[0]

    total_vendas = conexao.execute(
        "SELECT COUNT(*) FROM venda"
    ).fetchone()[0]

    conexao.close()

    return render_template(
        "index.html",
        produtos=produtos,
        total_produtos=total_produtos,
        total_ingredientes=total_ingredientes,
        total_clientes=total_clientes,
        total_vendas=total_vendas
    )


# LISTAGEM DE INGREDIENTES
@app.route("/ingredientes")
def pagina_ingredientes():
    conexao = conectar_banco()

    ingredientes = conexao.execute(
        "SELECT * FROM ingrediente"
    ).fetchall()

    conexao.close()

    return render_template(
        "ingredientes.html",
        ingredientes=ingredientes
    )


# CADASTRO DE INGREDIENTES
@app.route("/novo-ingrediente", methods=["GET", "POST"])
def novo_ingrediente():
    if request.method == "POST":
        nome = request.form["nome"]
        unidade_medida = request.form["unidade_medida"]
        custo_unitario = request.form["custo_unitario"]
        fornecedor = request.form["fornecedor"] or None
        data_atualizacao = request.form["data_atualizacao"]
        status = request.form["status"]

        conexao = conectar_banco()

        conexao.execute(
            """
            INSERT INTO ingrediente
            (nome, unidade_medida, custo_unitario, fornecedor, data_atualizacao, status)
            VALUES (?, ?, ?, ?, ?, ?)
            """,
            (nome, unidade_medida, custo_unitario, fornecedor, data_atualizacao, status)
        )

        conexao.commit()
        conexao.close()

        return redirect("/ingredientes")

    return render_template("novo_ingrediente.html")


# EDIÇÃO DE INGREDIENTES
@app.route("/editar-ingrediente/<int:id_ingrediente>", methods=["GET", "POST"])
def editar_ingrediente(id_ingrediente):
    conexao = conectar_banco()

    if request.method == "POST":
        nome = request.form["nome"]
        unidade_medida = request.form["unidade_medida"]
        custo_unitario = request.form["custo_unitario"]
        fornecedor = request.form["fornecedor"] or None
        data_atualizacao = request.form["data_atualizacao"]
        status = request.form["status"]

        conexao.execute(
            """
            UPDATE ingrediente
            SET nome = ?,
                unidade_medida = ?,
                custo_unitario = ?,
                fornecedor = ?,
                data_atualizacao = ?,
                status = ?
            WHERE id_ingrediente = ?
            """,
            (
                nome,
                unidade_medida,
                custo_unitario,
                fornecedor,
                data_atualizacao,
                status,
                id_ingrediente
            )
        )

        conexao.commit()
        conexao.close()

        return redirect("/ingredientes")

    ingrediente = conexao.execute(
        "SELECT * FROM ingrediente WHERE id_ingrediente = ?",
        (id_ingrediente,)
    ).fetchone()

    conexao.close()

    if ingrediente is None:
        return "Ingrediente não encontrado", 404

    return render_template(
        "editar_ingrediente.html",
        ingrediente=ingrediente
    )
# ATIVAR/DESATIVAR INGREDIENTE
@app.route("/alternar-status-ingrediente/<int:id_ingrediente>", methods=["POST"])
def alternar_status_ingrediente(id_ingrediente):
    conexao = conectar_banco()

    ingrediente = conexao.execute(
        "SELECT status FROM ingrediente WHERE id_ingrediente = ?",
        (id_ingrediente,)
    ).fetchone()

    if ingrediente is None:
        conexao.close()
        return "Ingrediente não encontrado", 404

    novo_status = "INATIVO" if ingrediente["status"] == "ATIVO" else "ATIVO"

    conexao.execute(
        "UPDATE ingrediente SET status = ? WHERE id_ingrediente = ?",
        (novo_status, id_ingrediente)
    )

    conexao.commit()
    conexao.close()

    return redirect("/ingredientes")
# CADASTRO DE CLIENTES
@app.route("/novo-cliente", methods=["GET", "POST"])
def novo_cliente():
    if request.method == "POST":
        nome = request.form["nome"]
        cpf = request.form["cpf"] or None
        cep = request.form["cep"] or None
        telefone = request.form["telefone"] or None
        whatsapp = request.form["whatsapp"] or None
        email = request.form["email"] or None
        endereco = request.form["endereco"] or None
        data_cadastro = request.form["data_cadastro"]
        status = request.form["status"]

        conexao = conectar_banco()

        conexao.execute(
            """
            INSERT INTO cliente (
                nome, cpf, cep, telefone, whatsapp,
                email, endereco, data_cadastro, status
            )
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
            """,
            (
                nome, cpf, cep, telefone, whatsapp,
                email, endereco, data_cadastro, status
            )
        )

        conexao.commit()
        conexao.close()

        return redirect("/clientes")

    return render_template("novo_cliente.html")
# ATIVAR/DESATIVAR CLIENTE
@app.route("/alternar-status-cliente/<int:id_cliente>", methods=["POST"])
def alternar_status_cliente(id_cliente):
    conexao = conectar_banco()

    cliente = conexao.execute(
        "SELECT status FROM cliente WHERE id_cliente = ?",
        (id_cliente,)
    ).fetchone()

    if cliente is None:
        conexao.close()
        return "Cliente não encontrado", 404

    novo_status = "INATIVO" if cliente["status"] == "ATIVO" else "ATIVO"

    conexao.execute(
        "UPDATE cliente SET status = ? WHERE id_cliente = ?",
        (novo_status, id_cliente)
    )

    conexao.commit()
    conexao.close()

    return redirect("/clientes")
# CADASTRO DE VENDAS
@app.route("/nova-venda", methods=["GET", "POST"])
def nova_venda():
    conexao = conectar_banco()

    if request.method == "POST":
        id_cliente = request.form["id_cliente"] or None
        observacao = request.form["observacao"] or None

        cursor = conexao.execute(
            """
            INSERT INTO venda (id_cliente, observacao)
            VALUES (?, ?)
            """,
            (id_cliente, observacao)
        )

        id_venda = cursor.lastrowid

        conexao.commit()
        conexao.close()

        return redirect(f"/adicionar-itens/{id_venda}")

    clientes = conexao.execute(
        """
        SELECT id_cliente, nome
        FROM cliente
        WHERE status = 'ATIVO'
        ORDER BY nome
        """
    ).fetchall()

    conexao.close()

    return render_template(
        "nova_venda.html",
        clientes=clientes
    )
# ADICIONAR PRODUTOS À VENDA
@app.route("/adicionar-itens/<int:id_venda>", methods=["GET", "POST"])
def adicionar_itens(id_venda):
    conexao = conectar_banco()

    venda = conexao.execute(
        "SELECT * FROM venda WHERE id_venda = ?",
        (id_venda,)
    ).fetchone()

    if venda is None:
        conexao.close()
        return "Venda não encontrada."

    if request.method == "POST":
        id_produto = request.form["id_produto"]
        quantidade = int(request.form["quantidade"])

        produto = conexao.execute(
            """
            SELECT preco_venda
            FROM produto
            WHERE id_produto = ?
            AND status = 'ATIVO'
            """,
            (id_produto,)
        ).fetchone()

        if produto is None or quantidade < 1:
            conexao.close()
            return "Produto inválido ou quantidade incorreta."

        conexao.execute(
            """
            INSERT INTO item_venda
            (id_venda, id_produto, quantidade, preco_unitario)
            VALUES (?, ?, ?, ?)
            """,
            (
                id_venda,
                id_produto,
                quantidade,
                produto["preco_venda"]
            )
        )

        conexao.commit()

    produtos = conexao.execute(
        """
        SELECT id_produto, nome, preco_venda
        FROM produto
        WHERE status = 'ATIVO'
        ORDER BY nome
        """
    ).fetchall()

    conexao.close()

    return render_template(
        "adicionar_itens.html",
        id_venda=id_venda,
        produtos=produtos
    )
# DETALHES DA VENDA
@app.route("/detalhes-venda/<int:id_venda>")
def detalhes_venda(id_venda):
    conexao = conectar_banco()

    venda = conexao.execute(
        """
        SELECT
            venda.id_venda,
            venda.data_venda,
            venda.observacao,
            cliente.nome AS nome_cliente
        FROM venda
        LEFT JOIN cliente
            ON venda.id_cliente = cliente.id_cliente
        WHERE venda.id_venda = ?
        """,
        (id_venda,)
    ).fetchone()

    if venda is None:
        conexao.close()
        return "Venda não encontrada."

    itens = conexao.execute(
        """
        SELECT
            produto.nome AS nome_produto,
            item_venda.quantidade,
            item_venda.preco_unitario,
            (item_venda.quantidade * item_venda.preco_unitario) AS subtotal
        FROM item_venda
        INNER JOIN produto
            ON item_venda.id_produto = produto.id_produto
        WHERE item_venda.id_venda = ?
        """,
        (id_venda,)
    ).fetchall()

    total = sum(item["subtotal"] for item in itens)

    conexao.close()

    return render_template(
        "detalhes_venda.html",
        venda=venda,
        itens=itens,
        total=total
    )
# LISTAGEM DE CUSTOS FIXOS
@app.route("/custos-fixos")
def pagina_custos_fixos():
    conexao = conectar_banco()

    custos = conexao.execute(
        "SELECT * FROM custo_fixo"
    ).fetchall()

    conexao.close()

    return render_template(
        "custos_fixos.html",
        custos=custos
    )
# LISTAGEM DE MARGENS DE LUCRO
@app.route("/margem-lucro")
def pagina_margem_lucro():
    conexao = conectar_banco()

    margens = conexao.execute(
        "SELECT * FROM margem_lucro"
    ).fetchall()

    conexao.close()

    return render_template(
        "margem_lucro.html",
        margens=margens
    )
# LISTAGEM DE CONCORRENTES
@app.route("/concorrentes")
def pagina_concorrentes():
    conexao = conectar_banco()

    concorrentes = conexao.execute(
        "SELECT * FROM concorrente"
    ).fetchall()

    conexao.close()

    return render_template(
        "concorrentes.html",
        concorrentes=concorrentes
    )
# LISTAGEM DE VENDAS
@app.route("/vendas")
def pagina_vendas():
    conexao = conectar_banco()

    vendas = conexao.execute(
        """
        SELECT
            venda.id_venda,
            venda.data_venda,
            venda.observacao,
            cliente.nome AS nome_cliente,
            COALESCE(
                SUM(item_venda.quantidade * item_venda.preco_unitario),
                0
            ) AS total
        FROM venda
        LEFT JOIN cliente
            ON venda.id_cliente = cliente.id_cliente
        LEFT JOIN item_venda
            ON venda.id_venda = item_venda.id_venda
        GROUP BY venda.id_venda
        ORDER BY venda.id_venda DESC
        """
    ).fetchall()

    conexao.close()

    return render_template(
        "vendas.html",
        vendas=vendas
    )
# LISTAGEM DE CLIENTES
@app.route("/clientes")
def pagina_clientes():
    conexao = conectar_banco()

    clientes = conexao.execute(
        "SELECT * FROM cliente ORDER BY id_cliente DESC"
    ).fetchall()

    conexao.close()

    return render_template(
        "clientes.html",
        clientes=clientes
    )
# EDIÇÃO DE CLIENTES
@app.route("/editar-cliente/<int:id_cliente>", methods=["GET", "POST"])
def editar_cliente(id_cliente):
    conexao = conectar_banco()

    if request.method == "POST":
        nome = request.form["nome"]
        cpf = request.form["cpf"] or None
        cep = request.form["cep"] or None
        telefone = request.form["telefone"] or None
        whatsapp = request.form["whatsapp"] or None
        email = request.form["email"] or None
        endereco = request.form["endereco"] or None
        data_cadastro = request.form["data_cadastro"]
        status = request.form["status"]

        conexao.execute(
            """
            UPDATE cliente
            SET nome = ?,
                cpf = ?,
                cep = ?,
                telefone = ?,
                whatsapp = ?,
                email = ?,
                endereco = ?,
                data_cadastro = ?,
                status = ?
            WHERE id_cliente = ?
            """,
            (
                nome, cpf, cep, telefone, whatsapp,
                email, endereco, data_cadastro, status,
                id_cliente
            )
        )

        conexao.commit()
        conexao.close()

        return redirect("/clientes")

    cliente = conexao.execute(
        "SELECT * FROM cliente WHERE id_cliente = ?",
        (id_cliente,)
    ).fetchone()

    conexao.close()

    if cliente is None:
        return "Cliente não encontrado", 404

    return render_template(
        "editar_cliente.html",
        cliente=cliente
    )
# LISTAGEM DE PRODUTOS
@app.route("/produtos")
def pagina_produtos():
    conexao = conectar_banco()

    produtos = conexao.execute(
        "SELECT * FROM produto"
    ).fetchall()

    conexao.close()

    return render_template(
        "produtos.html",
        produtos=produtos
    )


# CADASTRO DE PRODUTOS
@app.route("/novo-produto", methods=["GET", "POST"])
def novo_produto():
    if request.method == "POST":
        nome = request.form["nome"]
        descricao = request.form["descricao"]
        categoria = request.form["categoria"]
        preco_venda = request.form["preco_venda"]
        id_margem = request.form["id_margem"]
        status = request.form["status"]

        conexao = conectar_banco()

        conexao.execute(
            """
            INSERT INTO produto
            (nome, descricao, categoria, preco_venda, id_margem, status)
            VALUES (?, ?, ?, ?, ?, ?)
            """,
            (nome, descricao, categoria, preco_venda, id_margem, status)
        )

        conexao.commit()
        conexao.close()

        return redirect("/produtos")

    return render_template("novo_produto.html")


# EDIÇÃO DE PRODUTOS
@app.route("/editar-produto/<int:id_produto>", methods=["GET", "POST"])
def editar_produto(id_produto):
    conexao = conectar_banco()

    if request.method == "POST":
        nome = request.form["nome"]
        descricao = request.form["descricao"]
        categoria = request.form["categoria"]
        preco_venda = request.form["preco_venda"]
        id_margem = request.form["id_margem"]
        status = request.form["status"]

        conexao.execute(
            """
            UPDATE produto
            SET nome = ?,
                descricao = ?,
                categoria = ?,
                preco_venda = ?,
                id_margem = ?,
                status = ?
            WHERE id_produto = ?
            """,
            (nome, descricao, categoria, preco_venda, id_margem, status, id_produto)
        )

        conexao.commit()
        conexao.close()

        return redirect("/produtos")

    produto = conexao.execute(
        "SELECT * FROM produto WHERE id_produto = ?",
        (id_produto,)
    ).fetchone()

    conexao.close()

    if produto is None:
        return "Produto não encontrado", 404

    return render_template(
        "editar_produto.html",
        produto=produto
    )


# EXCLUSÃO DE PRODUTOS
@app.route("/excluir-produto/<int:id_produto>", methods=["POST"])
def excluir_produto(id_produto):
    conexao = conectar_banco()

    conexao.execute(
        "DELETE FROM produto WHERE id_produto = ?",
        (id_produto,)
    )

    conexao.commit()
    conexao.close()

    return redirect("/produtos")


if __name__ == "__main__":
    app.run(debug=True)
