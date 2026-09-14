USE [NoVerdinhoDB]
GO
/****** Objeto:  Table [dbo].[compra_itens]    Data do Script: 9/14/2026 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra_itens](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[compra_id] [int] NULL,
	[produto_id] [int] NULL,
	[quantidade] [int] NULL,
	[valor_unitario] [decimal](10, 2) NOT NULL,
	[mercado_id] [int] NOT NULL,
	[usuario_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[compras]    Data do Script: 9/14/2026 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compras](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario_id] [int] NULL,
	[mercado_id] [int] NULL,
	[data_compra] [date] NOT NULL,
	[valor_total] [decimal](10, 2) NULL,
	[descricao] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[descontos_perfil]    Data do Script: 9/14/2026 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[descontos_perfil](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario_id] [int] NULL,
	[nome_desconto] [varchar](50) NULL,
	[porcentagem] [decimal](5, 2) NULL,
	[valor_calculado] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[gastos]    Data do Script: 9/14/2026 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gastos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario_id] [int] NOT NULL,
	[descricao] [varchar](255) NOT NULL,
	[categoria] [varchar](50) NOT NULL,
	[valor] [decimal](10, 2) NOT NULL,
	[data_gasto] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[logs_erro]    Data do Script: 9/14/2026 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logs_erro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario_id] [int] NULL,
	[origem] [varchar](255) NOT NULL,
	[mensagem] [varchar](max) NOT NULL,
	[stack_trace] [varchar](max) NULL,
	[data_erro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[mercados]    Data do Script: 9/14/2026 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mercados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[usuario_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[produtos]    Data do Script: 9/14/2026 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[produtos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[usuario_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[usuarios]    Data do Script: 9/14/2026 7:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[cpfcnpj] [varchar](14) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[senha] [varchar](45) NOT NULL,
	[regime_trabalho] [varchar](3) NULL,
	[salario_bruto] [decimal](10, 2) NULL,
	[salario_liquido] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[compra_itens] ON 

INSERT [dbo].[compra_itens] ([id], [compra_id], [produto_id], [quantidade], [valor_unitario], [mercado_id], [usuario_id]) VALUES (1, 2, 2, 1, CAST(500.00 AS Decimal(10, 2)), 1, 1)
SET IDENTITY_INSERT [dbo].[compra_itens] OFF
GO
SET IDENTITY_INSERT [dbo].[compras] ON 

INSERT [dbo].[compras] ([id], [usuario_id], [mercado_id], [data_compra], [valor_total], [descricao]) VALUES (2, 1, 1, CAST(N'2026-04-28' AS Date), CAST(500.00 AS Decimal(10, 2)), N'Compra Mês')
SET IDENTITY_INSERT [dbo].[compras] OFF
GO
SET IDENTITY_INSERT [dbo].[descontos_perfil] ON 

INSERT [dbo].[descontos_perfil] ([id], [usuario_id], [nome_desconto], [porcentagem], [valor_calculado]) VALUES (25, 2, N'INSS (Previdência)', CAST(6.06 AS Decimal(5, 2)), CAST(908.85 AS Decimal(10, 2)))
INSERT [dbo].[descontos_perfil] ([id], [usuario_id], [nome_desconto], [porcentagem], [valor_calculado]) VALUES (26, 2, N'IRRF (Imposto de Renda)', CAST(19.86 AS Decimal(5, 2)), CAST(2979.07 AS Decimal(10, 2)))
INSERT [dbo].[descontos_perfil] ([id], [usuario_id], [nome_desconto], [porcentagem], [valor_calculado]) VALUES (27, 2, N'teste', CAST(10.00 AS Decimal(5, 2)), CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[descontos_perfil] ([id], [usuario_id], [nome_desconto], [porcentagem], [valor_calculado]) VALUES (28, 1, N'INSS (Previdência)', CAST(10.71 AS Decimal(5, 2)), CAST(588.82 AS Decimal(10, 2)))
INSERT [dbo].[descontos_perfil] ([id], [usuario_id], [nome_desconto], [porcentagem], [valor_calculado]) VALUES (29, 1, N'IRRF (Imposto de Renda)', CAST(8.26 AS Decimal(5, 2)), CAST(454.57 AS Decimal(10, 2)))
INSERT [dbo].[descontos_perfil] ([id], [usuario_id], [nome_desconto], [porcentagem], [valor_calculado]) VALUES (30, 1, N'teste 2', CAST(1.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[descontos_perfil] OFF
GO
SET IDENTITY_INSERT [dbo].[gastos] ON 

INSERT [dbo].[gastos] ([id], [usuario_id], [descricao], [categoria], [valor], [data_gasto]) VALUES (2, 1, N'Produtos Ilícitos', N'Fixo', CAST(500.00 AS Decimal(10, 2)), CAST(N'2026-04-28T22:46:17.000' AS DateTime))
INSERT [dbo].[gastos] ([id], [usuario_id], [descricao], [categoria], [valor], [data_gasto]) VALUES (3, 2, N'Produtos Ilícitos', N'Fixo', CAST(2500.00 AS Decimal(10, 2)), CAST(N'2026-05-06T20:28:11.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[gastos] OFF
GO
SET IDENTITY_INSERT [dbo].[logs_erro] ON 

INSERT [dbo].[logs_erro] ([id], [usuario_id], [origem], [mensagem], [stack_trace], [data_erro]) VALUES (1, NULL, N'HomeController >> CalculoCLTePJ', N'Connection must be Open; current state is Connecting', N'   at MySqlConnector.MySqlConnection.get_Session()', CAST(N'2026-04-28T20:38:31.000' AS DateTime))
INSERT [dbo].[logs_erro] ([id], [usuario_id], [origem], [mensagem], [stack_trace], [data_erro]) VALUES (2, NULL, N'HomeController >> CalculoCLTePJ', N'Connection must be Open; current state is Connecting', N'   at MySqlConnector.MySqlConnection.get_Session()', CAST(N'2026-04-28T20:50:58.000' AS DateTime))
INSERT [dbo].[logs_erro] ([id], [usuario_id], [origem], [mensagem], [stack_trace], [data_erro]) VALUES (3, NULL, N'HomeController >> CalculoCLTePJ', N'Connection must be Open; current state is Connecting', N'   at MySqlConnector.MySqlConnection.get_Session()', CAST(N'2026-04-28T20:51:50.000' AS DateTime))
INSERT [dbo].[logs_erro] ([id], [usuario_id], [origem], [mensagem], [stack_trace], [data_erro]) VALUES (4, NULL, N'HomeController >> CalculoCLTePJ', N'Connection must be Open; current state is Connecting', N'   at MySqlConnector.MySqlConnection.get_Session()', CAST(N'2026-04-28T20:55:52.000' AS DateTime))
INSERT [dbo].[logs_erro] ([id], [usuario_id], [origem], [mensagem], [stack_trace], [data_erro]) VALUES (5, NULL, N'HomeController >> CalculoCLTePJ', N'Connection must be Open; current state is Connecting', N'   at MySqlConnector.MySqlConnection.get_Session()', CAST(N'2026-04-28T20:58:37.000' AS DateTime))
INSERT [dbo].[logs_erro] ([id], [usuario_id], [origem], [mensagem], [stack_trace], [data_erro]) VALUES (6, 1, N'HomeController >> CalculoCLTePJ', N'Unknown column ''nome'' in ''field list''', N'   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync()', CAST(N'2026-04-28T21:07:43.000' AS DateTime))
INSERT [dbo].[logs_erro] ([id], [usuario_id], [origem], [mensagem], [stack_trace], [data_erro]) VALUES (7, 1, N'HomeController >> CalculoCLTePJ', N'Unknown column ''nome'' in ''field list''', N'   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync()', CAST(N'2026-04-28T21:09:02.000' AS DateTime))
INSERT [dbo].[logs_erro] ([id], [usuario_id], [origem], [mensagem], [stack_trace], [data_erro]) VALUES (8, 1, N'HomeController >> CalculoCLTePJ', N'Unknown column ''descricao'' in ''field list''', N'   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync()', CAST(N'2026-04-28T21:11:37.000' AS DateTime))
INSERT [dbo].[logs_erro] ([id], [usuario_id], [origem], [mensagem], [stack_trace], [data_erro]) VALUES (9, 1, N'HomeController >> CalculoCLTePJ', N'Unknown column ''descricao'' in ''field list''', N'   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync()', CAST(N'2026-04-28T21:11:41.000' AS DateTime))
INSERT [dbo].[logs_erro] ([id], [usuario_id], [origem], [mensagem], [stack_trace], [data_erro]) VALUES (10, 1, N'Erro no Index Dashboard', N'The column name ''id'' does not exist in the result set.', N'   at MySqlConnector.Core.ResultSet.GetOrdinal()', CAST(N'2026-04-28T21:46:54.000' AS DateTime))
INSERT [dbo].[logs_erro] ([id], [usuario_id], [origem], [mensagem], [stack_trace], [data_erro]) VALUES (11, 1, N'Erro no Index Dashboard', N'The column name ''id'' does not exist in the result set.', N'   at MySqlConnector.Core.ResultSet.GetOrdinal()', CAST(N'2026-04-28T21:48:20.000' AS DateTime))
INSERT [dbo].[logs_erro] ([id], [usuario_id], [origem], [mensagem], [stack_trace], [data_erro]) VALUES (12, 1, N'Erro ao Excluir Gasto', N'''System.Text.Json.JsonElement'' does not contain a definition for ''id''', N'   at CallSite.Target()', CAST(N'2026-04-28T21:49:12.000' AS DateTime))
INSERT [dbo].[logs_erro] ([id], [usuario_id], [origem], [mensagem], [stack_trace], [data_erro]) VALUES (13, 1, N'Erro ao salvar compra', N'Unknown column ''produto'' in ''field list''', N'   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync()', CAST(N'2026-04-28T22:43:57.000' AS DateTime))
INSERT [dbo].[logs_erro] ([id], [usuario_id], [origem], [mensagem], [stack_trace], [data_erro]) VALUES (14, 1, N'Erro no Dashboard', N'Expression #3 of SELECT list is not in GROUP BY clause...', N'   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync()', CAST(N'2026-04-28T23:10:59.000' AS DateTime))
INSERT [dbo].[logs_erro] ([id], [usuario_id], [origem], [mensagem], [stack_trace], [data_erro]) VALUES (15, 1, N'Erro no Dashboard', N'Expression #3 of SELECT list is not in GROUP BY clause...', N'   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync()', CAST(N'2026-04-28T23:12:16.000' AS DateTime))
INSERT [dbo].[logs_erro] ([id], [usuario_id], [origem], [mensagem], [stack_trace], [data_erro]) VALUES (16, 1, N'Erro no Dashboard', N'Expression #3 of SELECT list is not in GROUP BY clause...', N'   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync()', CAST(N'2026-04-28T23:13:08.000' AS DateTime))
INSERT [dbo].[logs_erro] ([id], [usuario_id], [origem], [mensagem], [stack_trace], [data_erro]) VALUES (17, NULL, N'HomeController >> ValidarLogin', N'Connection must be Open; current state is Connecting', N'   at MySqlConnector.MySqlConnection.get_Session()', CAST(N'2026-05-06T20:37:28.000' AS DateTime))
INSERT [dbo].[logs_erro] ([id], [usuario_id], [origem], [mensagem], [stack_trace], [data_erro]) VALUES (18, 1, N'Erro no Dashboard NoVerdinho', N'''ANY_VALUE'' is not a recognized built-in function name.
Incorrect syntax near the keyword ''GROUP''.', N'   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.Connection.SqlConnectionInternal.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, SqlCommand command, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.CompleteAsyncExecuteReader(Boolean isInternal, Boolean forDescribeParameterEncryption)
   at Microsoft.Data.SqlClient.SqlCommand.InternalEndExecuteReader(IAsyncResult asyncResult, Boolean isInternal, String endMethod)
   at Microsoft.Data.SqlClient.SqlCommand.EndExecuteReaderInternal(IAsyncResult asyncResult)
   at Microsoft.Data.SqlClient.SqlCommand.EndExecuteReaderAsync(IAsyncResult asyncResult)
   at Microsoft.Data.SqlClient.SqlCommand.<>c.<InternalExecuteReaderAsync>b__283_1(IAsyncResult asyncResult)
   at System.Threading.Tasks.TaskFactory`1.FromAsyncCoreLogic(IAsyncResult iar, Func`2 endFunction, Action`1 endAction, Task`1 promise, Boolean requiresSynchronization)
--- End of stack trace from previous location ---
   at NoVerdinho.Controllers.HomeController.NoVerdinho() in C:\Users\gmher\OneDrive\Desktop\treinamento\Documentos\PIM\NoVerdinho\Controllers\HomeController.cs:line 175', CAST(N'2026-09-14T19:09:51.170' AS DateTime))
SET IDENTITY_INSERT [dbo].[logs_erro] OFF
GO
SET IDENTITY_INSERT [dbo].[mercados] ON 

INSERT [dbo].[mercados] ([id], [nome], [usuario_id]) VALUES (1, N'testew', 1)
INSERT [dbo].[mercados] ([id], [nome], [usuario_id]) VALUES (2, N'Pague Mais', 1)
SET IDENTITY_INSERT [dbo].[mercados] OFF
GO
SET IDENTITY_INSERT [dbo].[produtos] ON 

INSERT [dbo].[produtos] ([id], [nome], [usuario_id]) VALUES (1, N'Feijão', 1)
INSERT [dbo].[produtos] ([id], [nome], [usuario_id]) VALUES (2, N'Arroz', 1)
INSERT [dbo].[produtos] ([id], [nome], [usuario_id]) VALUES (3, N'Picanha', 1)
SET IDENTITY_INSERT [dbo].[produtos] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id], [nome], [cpfcnpj], [email], [senha], [regime_trabalho], [salario_bruto], [salario_liquido]) VALUES (1, N'Gui', N'15614651651615', N'gui@teste.com', N'1234', N'CLT', CAST(5500.00 AS Decimal(10, 2)), CAST(4401.61 AS Decimal(10, 2)))
INSERT [dbo].[usuarios] ([id], [nome], [cpfcnpj], [email], [senha], [regime_trabalho], [salario_bruto], [salario_liquido]) VALUES (2, N'Guilherme Teste', N'16826594212', N'teste@teste.com.br', N'Aapp@1900', N'CLT', CAST(15000.00 AS Decimal(10, 2)), CAST(9612.08 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Objeto:  Index [UQ_usuarios_email]    Data do Script: 9/14/2026 7:22:30 PM ******/
ALTER TABLE [dbo].[usuarios] ADD  CONSTRAINT [UQ_usuarios_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[compra_itens] ADD  DEFAULT ((1)) FOR [quantidade]
GO
ALTER TABLE [dbo].[compras] ADD  DEFAULT ((0.00)) FOR [valor_total]
GO
ALTER TABLE [dbo].[gastos] ADD  DEFAULT (getdate()) FOR [data_gasto]
GO
ALTER TABLE [dbo].[logs_erro] ADD  DEFAULT (getdate()) FOR [data_erro]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT ('CLT') FOR [regime_trabalho]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT ((0.00)) FOR [salario_bruto]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT ((0.00)) FOR [salario_liquido]
GO
ALTER TABLE [dbo].[compra_itens]  WITH CHECK ADD  CONSTRAINT [FK_compra_itens_compras] FOREIGN KEY([compra_id])
REFERENCES [dbo].[compras] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[compra_itens] CHECK CONSTRAINT [FK_compra_itens_compras]
GO
ALTER TABLE [dbo].[compra_itens]  WITH CHECK ADD  CONSTRAINT [FK_compra_itens_produtos] FOREIGN KEY([produto_id])
REFERENCES [dbo].[produtos] ([id])
GO
ALTER TABLE [dbo].[compra_itens] CHECK CONSTRAINT [FK_compra_itens_produtos]
GO
ALTER TABLE [dbo].[compras]  WITH CHECK ADD  CONSTRAINT [FK_compras_mercados] FOREIGN KEY([mercado_id])
REFERENCES [dbo].[mercados] ([id])
GO
ALTER TABLE [dbo].[compras] CHECK CONSTRAINT [FK_compras_mercados]
GO
ALTER TABLE [dbo].[compras]  WITH CHECK ADD  CONSTRAINT [FK_compras_usuarios] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[compras] CHECK CONSTRAINT [FK_compras_usuarios]
GO
ALTER TABLE [dbo].[descontos_perfil]  WITH CHECK ADD  CONSTRAINT [FK_descontos_perfil_usuarios] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuarios] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[descontos_perfil] CHECK CONSTRAINT [FK_descontos_perfil_usuarios]
GO
ALTER TABLE [dbo].[gastos]  WITH CHECK ADD  CONSTRAINT [FK_gastos_usuarios] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[gastos] CHECK CONSTRAINT [FK_gastos_usuarios]
GO
ALTER TABLE [dbo].[logs_erro]  WITH CHECK ADD  CONSTRAINT [FK_logs_erro_usuarios] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuarios] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[logs_erro] CHECK CONSTRAINT [FK_logs_erro_usuarios]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD CHECK  (([regime_trabalho]='PJ' OR [regime_trabalho]='CLT'))
GO
