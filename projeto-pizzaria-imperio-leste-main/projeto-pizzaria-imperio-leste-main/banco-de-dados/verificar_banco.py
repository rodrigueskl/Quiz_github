import sqlite3

conexao = sqlite3.connect("banco.db")

print("RELACIONAMENTOS DE ITEM_VENDA:")

relacionamentos = conexao.execute(
    "PRAGMA foreign_key_list(item_venda)"
).fetchall()

for relacionamento in relacionamentos:
    print(relacionamento)

print("\nRELACIONAMENTOS DE VENDA:")

relacionamentos = conexao.execute(
    "PRAGMA foreign_key_list(venda)"
).fetchall()

for relacionamento in relacionamentos:
    print(relacionamento)

conexao.close()