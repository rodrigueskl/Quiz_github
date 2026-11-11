
import sqlite3

# Conecta ao banco SQLite
conexao = sqlite3.connect("banco.db")

# Lê o arquivo SQL
with open("main.sql", "r", encoding="utf-8") as arquivo:
    script_sql = arquivo.read()

# Executa o script SQL
conexao.executescript(script_sql)

# Salva as alterações e fecha a conexão
conexao.commit()
conexao.close()

print("Banco de dados criado com sucesso!")
