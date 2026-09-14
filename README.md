# 💰 NoVerdinho

> Sistema web desenvolvido em ASP.NET Core MVC com foco em gestão financeira, cálculo de pró-labore/salário, controle de despesas e integração com automações. Projeto desenvolvido no contexto acadêmico (NP1 - Programação de Banco de Dados (SQLServer)).

---

## 🚀 Tecnologias Utilizadas

Este projeto foi construído utilizando as seguintes tecnologias e ferramentas:

* **Linguagem:** C# (.NET 8)
* **Arquitetura:** ASP.NET Core MVC
* **Banco de Dados:** SQL Server Express (LocalDB) via `Microsoft.Data.SqlClient`
* **Frontend:** HTML5, CSS3, JavaScript, Tailwind CSS
* **Controle de Versão:** Git & GitHub

---

## ⚙️ Funcionalidades Principais

* **Autenticação de Usuários:** Sistema de login seguro com controle de sessão.
* **Dashboard Financeiro:** Visão geral de gastos, entradas, faturamentos e regime de trabalho (CLT / PJ).
* **Gestão de Compras e Despesas:** Registro e categorização de gastos fixos e variáveis, além de controle de itens de mercado.
* **Simuladores e Cálculos:** Ferramentas integradas para suporte a cálculos financeiros.
* **Logs de Erro Centralizados:** Tratamento de exceções robusto gravado diretamente em banco de dados para facilitar a depuração.

---

## 📁 Estrutura do Repositório

* `Controllers/` — Controladores da aplicação ASP.NET Core MVC.
* `Models/` — Classes de modelo e requisição.
* `Views/` — Interfaces de usuário (Razor Pages / Views).
* `Services/` — Camada de serviços e gerenciamento de banco de dados (`DbService`).
* `Database/` — Scripts SQL para criação de tabelas e carga inicial de dados.

---

## 🗄️ Configuração do Banco de Dados

Caso queira clonar e rodar a aplicação localmente:

1. Certifique-se de ter o **SQL Server Express (LocalDB)** instalado na sua máquina.
2. Crie um banco de dados chamado `NoVerdinhoDB`.
3. Execute o script contido na pasta `Database/` para gerar a estrutura de tabelas e os dados iniciais.
4. O projeto já está configurado por padrão para utilizar a seguinte string de conexão no `appsettings.json`:
   ```json
   "ConnectionStrings": {
     "DefaultConnection": "Server=(localdb)\\MSSQLLocalDB;Database=NoVerdinhoDB;Trusted_Connection=True;MultipleActiveResultSets=true"
   }
