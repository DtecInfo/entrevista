-- Gerado por Eduardo Oliveira Dantas
--   em:        2023-12-01 17:55:45 BRST
--   site:      Oracle Database 12cR2
--   tipo:      Oracle Database 12cR2



CREATE TABLE nbs.licenca (
    idlicenca      NUMBER(*, 0) NOT NULL,
    nomelicenca    VARCHAR2(50 BYTE),
    cnpj           VARCHAR2(18 BYTE),
    cep            VARCHAR2(9 BYTE),
    endereco       VARCHAR2(50 BYTE),
    numero         VARCHAR2(10 BYTE),
    bairro         VARCHAR2(30 BYTE),
    cidade         VARCHAR2(30 BYTE),
    estado         VARCHAR2(2 BYTE),
    telefones      VARCHAR2(30 BYTE),
    emailorigem    VARCHAR2(100 BYTE),
    nomeorigem     VARCHAR2(100 BYTE),
    smtp           VARCHAR2(100 BYTE),
    porta          VARCHAR2(5 BYTE),
    usuario        VARCHAR2(50 BYTE),
    senha          VARCHAR2(50 BYTE),
    tls            VARCHAR2(3 BYTE),
    ssl            VARCHAR2(3 BYTE),
    usuario_nbs    VARCHAR2(20 BYTE),
    senha_nbs      VARCHAR2(20 BYTE),
    think_cliente  VARCHAR2(50 BYTE),
    think_user     VARCHAR2(20 BYTE),
    think_pwd      VARCHAR2(20 BYTE),
    database       VARCHAR2(20 BYTE),
    email_link     VARCHAR2(400 BYTE),
    email_body     VARCHAR2(3000 BYTE)
);

CREATE UNIQUE INDEX nbs.pk_licenca ON
    nbs.licenca (
        idlicenca
    ASC );

ALTER TABLE nbs.licenca ADD CONSTRAINT pk_licenca PRIMARY KEY ( idlicenca );

CREATE TABLE nbs.menu (
    idmodulo   NUMBER(*, 0) NOT NULL,
    item       VARCHAR2(10 BYTE) NOT NULL,
    descricao  VARCHAR2(50 BYTE),
    nivelmenu  VARCHAR2(15 BYTE),
    icone      VARCHAR2(50 BYTE),
    nomeform   VARCHAR2(50 BYTE),
    tipo       VARCHAR2(15 BYTE),
    ativo      VARCHAR2(1 BYTE)
);

CREATE TABLE nbs.wc_empresas_usuarios (
    id           NUMBER(*, 0) NOT NULL,
    nome         VARCHAR2(50 BYTE),
    cod_empresa  NUMBER(*, 0),
    empresa      VARCHAR2(150 BYTE),
    tipo         VARCHAR2(1 BYTE)
);

CREATE UNIQUE INDEX nbs.id_emp_u ON
    nbs.wc_empresas_usuarios (
        id
    ASC );

ALTER TABLE nbs.wc_empresas_usuarios ADD CONSTRAINT id_emp_u PRIMARY KEY ( id );

CREATE TABLE nbs.wc_fin_check_doc (
    id        NUMBER(*, 0),
    id_finan  NUMBER(*, 0),
    doc       VARCHAR2(40 BYTE)
);

CREATE TABLE nbs.wc_fin_documentos (
    id            NUMBER(*, 0) NOT NULL,
    id_finan      NUMBER(*, 0) NOT NULL,
    id_documento  NUMBER(*, 0),
    descricao     VARCHAR2(100 BYTE),
    arq           BLOB,
    data          DATE,
    nome_anexo    VARCHAR2(100 BYTE)
);

CREATE UNIQUE INDEX nbs.pk_wc_doc_id ON
    nbs.wc_fin_documentos (
        id
    ASC );

ALTER TABLE nbs.wc_fin_documentos ADD CONSTRAINT pk_wc_doc_id PRIMARY KEY ( id );

CREATE TABLE nbs.wc_imagens (
    id         NUMBER(*, 0) NOT NULL,
    id_finan   NUMBER(*, 0) NOT NULL,
    imagem     BLOB,
    descricao  VARCHAR2(100 BYTE)
);

CREATE TABLE nbs.wc_lista_documentos (
    id           NUMBER(*, 0),
    descricao    VARCHAR2(100 BYTE),
    ativo        VARCHAR2(1 BYTE),
    obrigatorio  VARCHAR2(1 BYTE),
    origem       VARCHAR2(35 BYTE)
);

CREATE TABLE nbs.wc_motivos_recusa (
    id         NUMBER(*, 0),
    descricao  VARCHAR2(100 BYTE),
    ativo      VARCHAR2(1 BYTE)
);

CREATE TABLE nbs.wc_origens (
    id                 NUMBER(*, 0) NOT NULL,
    descricao          VARCHAR2(50 BYTE) NOT NULL,
    ativo              VARCHAR2(6 BYTE),
    aprova_acessorios  VARCHAR2(6 BYTE)
);

CREATE UNIQUE INDEX nbs.oidpk ON
    nbs.wc_origens (
        id
    ASC );

ALTER TABLE nbs.wc_origens ADD CONSTRAINT oidpk PRIMARY KEY ( id );

CREATE TABLE nbs.wc_origens_doc (
    id      NUMBER(*, 0) NOT NULL,
    origem  VARCHAR2(30 BYTE),
    doc     VARCHAR2(100 BYTE)
);

CREATE UNIQUE INDEX nbs.origens_doc ON
    nbs.wc_origens_doc (
        origem
    ASC,
        doc
    ASC );

ALTER TABLE nbs.wc_origens_doc ADD CONSTRAINT wc_origens_doc_pk PRIMARY KEY ( id );

ALTER TABLE nbs.wc_origens_doc ADD CONSTRAINT origens_doc UNIQUE ( origem,
                                                                   doc );

CREATE TABLE nbs.wc_sim_log (
    id          NUMBER(*, 0) NOT NULL,
    usuario     VARCHAR2(30 BYTE),
    data        DATE,
    log_antes   CLOB,
    log_depois  CLOB,
    id_finan    NUMBER(*, 0) NOT NULL
);

CREATE UNIQUE INDEX nbs.pk_sim_log ON
    nbs.wc_sim_log (
        id
    ASC );

ALTER TABLE nbs.wc_sim_log ADD CONSTRAINT pk_sim_log PRIMARY KEY ( id );

CREATE TABLE nbs.wc_sim_venda_finan (
    id                  NUMBER(*, 0) NOT NULL,
    cod_financiadora    NUMBER(*, 0),
    analista_credito    VARCHAR2(50 BYTE),
    status              VARCHAR2(30 BYTE),
    motivo_recusa       VARCHAR2(150 BYTE),
    valor_veiculo       NUMBER(9, 2),
    entrada             NUMBER(9, 2),
    valor_fin           NUMBER(9, 2),
    prazo               NUMBER(*, 0),
    parcela             NUMBER(9, 2),
    tabela              VARCHAR2(30 BYTE),
    coeficiente         NUMBER,
    tipo_tabela         VARCHAR2(30 BYTE),
    valor_aumento_parc  NUMBER(8, 2),
    observacoes         VARCHAR2(500 BYTE),
    id_finan            NUMBER(*, 0) NOT NULL,
    data                DATE,
    usuario             VARCHAR2(50 BYTE),
    financiadora        VARCHAR2(100 BYTE),
    despachante         NUMBER(9, 2)
);

CREATE UNIQUE INDEX nbs.pk_wc_finan_id ON
    nbs.wc_sim_venda_finan (
        id
    ASC );

ALTER TABLE nbs.wc_sim_venda_finan ADD CONSTRAINT pk_wc_finan_id PRIMARY KEY ( id );

CREATE TABLE nbs.wc_simulacao_venda (
    id                      NUMBER(*, 0) NOT NULL,
    cod_empresa             NUMBER(*, 0),
    vendedor                VARCHAR2(100 BYTE),
    origem                  VARCHAR2(20 BYTE),
    cod_cliente             NUMBER(*, 0),
    nome_cliente            VARCHAR2(100 BYTE),
    fone                    VARCHAR2(14 BYTE),
    cliente_cadastro        VARCHAR2(5 BYTE),
    cnh                     VARCHAR2(5 BYTE),
    tipo                    VARCHAR2(1 BYTE),
    tipo_proposta           VARCHAR2(1 BYTE),
    cod_marca               NUMBER(*, 0),
    cod_produto             NUMBER(*, 0),
    cod_modelo              NUMBER(*, 0),
    ano_modelo              VARCHAR2(10 BYTE),
    cor_externa             NUMBER(*, 0),
    renavam                 VARCHAR2(30 BYTE),
    chassi                  VARCHAR2(30 BYTE),
    opcionais               VARCHAR2(100 BYTE),
    s_valor_veic            NUMBER(9, 2),
    s_entrada               NUMBER(9, 2),
    s_valor_fin             NUMBER(9, 2),
    s_prazo                 NUMBER(*, 0),
    s_parcela               NUMBER(9, 2),
    s_tabela                VARCHAR2(30 BYTE),
    s_cod_fipe              VARCHAR2(30 BYTE),
    s_coeficiente           NUMBER,
    s2_valor_veic           NUMBER(9, 2),
    s2_entrada              NUMBER(9, 2),
    s2_valor_fin            NUMBER(9, 2),
    s_participacao          NUMBER(9, 2),
    s_despachante           NUMBER(9, 2),
    pg_contra_apresentacao  NUMBER(9, 2),
    pg_cartao               NUMBER(9, 2),
    pb_cheque               NUMBER(9, 2),
    pg_usado                NUMBER(9, 2),
    pg_outras_pg            NUMBER(9, 2),
    pg_consorcio            NUMBER(9, 2),
    pg_fin_externo          NUMBER(9, 2),
    pg_tr_usado             NUMBER(9, 2),
    pg_tr_acessorio         NUMBER(9, 2),
    pg_tr_emplacamento      NUMBER(9, 2),
    pg_tr_ipva              NUMBER(9, 2),
    pg_tr_outros            NUMBER(9, 2),
    pg_tr_hn                NUMBER(9, 2),
    cortesia                VARCHAR2(200 BYTE),
    obs_cortesia            VARCHAR2(300 BYTE),
    vendedor_acessorio      VARCHAR2(50 BYTE),
    valor_elegivel          NUMBER(9, 2),
    taxa_zero               VARCHAR2(1 BYTE),
    valor_acessorios        NUMBER(9, 2),
    gmac_plus               VARCHAR2(1 BYTE),
    gmac_plus_valor         NUMBER(9, 2),
    emplacamento            NUMBER(9, 2),
    pmc                     VARCHAR2(1 BYTE),
    pmc_tipo                VARCHAR2(30 BYTE),
    pmc_valor               NUMBER(9, 2),
    gap                     VARCHAR2(1 BYTE),
    gap_tipo                VARCHAR2(30 BYTE),
    gap_valor               NUMBER(9, 2),
    siga                    VARCHAR2(1 BYTE),
    siga_tipo               VARCHAR2(30 BYTE),
    siga_valor              NUMBER(9, 2),
    valor_seguro            NUMBER(9, 2),
    data_inclusao           DATE,
    usuario_inclusao        VARCHAR2(30 BYTE),
    rascunho                VARCHAR2(1 BYTE),
    s_perc_entrada          NUMBER,
    s_perc_entrada2         NUMBER,
    valor_aumento_parc      NUMBER,
    gerente                 VARCHAR2(100 BYTE),
    operador                VARCHAR2(100 BYTE),
    data_ap_gerente         DATE,
    data_ap_operador        DATE,
    cod_proposta            NUMBER(*, 0),
    acessorios              VARCHAR2(50 BYTE),
    data_aprovacao_acess    DATE,
    obs_despachante         VARCHAR2(300 BYTE),
    fin_valor_veiculo       NUMBER(9, 2),
    fin_entrada             NUMBER(9, 2),
    fin_financiado          NUMBER(9, 2),
    fin_prazo               NUMBER(*, 0),
    fin_parcela             NUMBER(9, 2),
    fin_tabela              VARCHAR2(30 BYTE),
    fin_cod_tabela          VARCHAR2(30 BYTE),
    fin_cof                 NUMBER,
    fin_tipo_tabela         VARCHAR2(30 BYTE),
    fin_despachante         NUMBER(9, 2),
    fin_acessorios          NUMBER(9, 2),
    fin_obs                 VARCHAR2(500 BYTE),
    fin_cod_financiadora    NUMBER(*, 0),
    fin_analista_credito    VARCHAR2(50 BYTE),
    fin_status              VARCHAR2(50 BYTE),
    fin_recusa              VARCHAR2(50 BYTE),
    a_valor_veic            NUMBER(9, 2),
    a_entrada               NUMBER(9, 2),
    a_financ                NUMBER(9, 2),
    a_perc_entrada          NUMBER(9, 2),
    a_prazo                 NUMBER(*, 0),
    a_parcela               NUMBER(9, 2),
    valor_entrada_a         NUMBER(9, 2),
    fin_banco               VARCHAR2(100 BYTE),
    empresa                 VARCHAR2(100 BYTE),
    fin_cod_status          NUMBER(*, 0),
    placa_usado             VARCHAR2(8 BYTE),
    pg_placa                VARCHAR2(20 BYTE),
    n1_ck_spmc              VARCHAR2(1 BYTE),
    n1_edit_spmc            NUMBER,
    n1_ck_gap               VARCHAR2(1 BYTE),
    n1_edit_gap             NUMBER,
    n1_ck_gmac_plus         VARCHAR2(1 BYTE),
    n1_edit_gmac_plus       NUMBER,
    n1_edit_perc            NUMBER,
    data_capitura_op        DATE,
    cod_evento              NUMBER(*, 0),
    fi_tac                  NUMBER(9, 2),
    fi_onstar               NUMBER(9, 2),
    fi_retorno_perc         NUMBER(9, 2),
    fi_retorno_masc         VARCHAR2(10 BYTE)
);

CREATE UNIQUE INDEX nbs.wc_sim_venda_pk ON
    nbs.wc_simulacao_venda (
        id
    ASC );

ALTER TABLE nbs.wc_simulacao_venda ADD CONSTRAINT wc_sim_venda_pk PRIMARY KEY ( id );

CREATE TABLE nbs.wc_status_finan (
    id         NUMBER(*, 0) NOT NULL,
    descricao  VARCHAR2(100 BYTE),
    ativo      VARCHAR2(1 BYTE),
    cor        VARCHAR2(30 BYTE),
    doc        VARCHAR2(1 BYTE)
);

CREATE UNIQUE INDEX nbs.id_status_finan ON
    nbs.wc_status_finan (
        id
    ASC );

ALTER TABLE nbs.wc_status_finan ADD CONSTRAINT id_status_finan PRIMARY KEY ( id );

CREATE TABLE nbs.wc_usuarios_acessos (
    id         NUMBER(*, 0) NOT NULL,
    usuario    VARCHAR2(50 BYTE),
    descricao  VARCHAR2(100 BYTE),
    acesso     VARCHAR2(30 BYTE) NOT NULL
);

CREATE UNIQUE INDEX nbs.un_acessos ON
    nbs.wc_usuarios_acessos (
        usuario
    ASC,
        acesso
    ASC );

CREATE UNIQUE INDEX nbs.wc_usuarios_acessos_pk ON
    nbs.wc_usuarios_acessos (
        id
    ASC );

ALTER TABLE nbs.wc_usuarios_acessos ADD CONSTRAINT wc_usuarios_acessos_pk PRIMARY KEY ( id );

ALTER TABLE nbs.wc_usuarios_acessos ADD CONSTRAINT un_acessos UNIQUE ( usuario,
                                                                       acesso );

CREATE TABLE nbs.wc_usuarios_origem (
    id         NUMBER(*, 0) NOT NULL,
    id_origem  NUMBER(*, 0) NOT NULL,
    usuario    VARCHAR2(50 BYTE) NOT NULL,
    origem     VARCHAR2(50 BYTE) NOT NULL
);

CREATE UNIQUE INDEX nbs.uoidpk ON
    nbs.wc_usuarios_origem (
        id
    ASC );

CREATE UNIQUE INDEX nbs.uouk ON
    nbs.wc_usuarios_origem (
        id_origem
    ASC,
        usuario
    ASC );

ALTER TABLE nbs.wc_usuarios_origem ADD CONSTRAINT uoidpk PRIMARY KEY ( id );

ALTER TABLE nbs.wc_usuarios_origem ADD CONSTRAINT uouk UNIQUE ( id_origem,
                                                                usuario );

ALTER TABLE nbs.wc_sim_venda_finan
    ADD CONSTRAINT fk_id_finan FOREIGN KEY ( id_finan )
        REFERENCES nbs.wc_simulacao_venda ( id );

ALTER TABLE nbs.wc_fin_documentos
    ADD CONSTRAINT fk_id_finan_doc FOREIGN KEY ( id_finan )
        REFERENCES nbs.wc_simulacao_venda ( id );

ALTER TABLE nbs.wc_imagens
    ADD CONSTRAINT fk_id_imagem FOREIGN KEY ( id_finan )
        REFERENCES nbs.wc_simulacao_venda ( id );

ALTER TABLE nbs.wc_sim_log
    ADD CONSTRAINT fk_log_id FOREIGN KEY ( id_finan )
        REFERENCES nbs.wc_simulacao_venda ( id );

ALTER TABLE nbs.wc_usuarios_origem
    ADD CONSTRAINT uofk FOREIGN KEY ( id_origem )
        REFERENCES nbs.wc_origens ( id );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            16
-- CREATE INDEX                            13
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
