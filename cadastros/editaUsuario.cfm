<cfoutput>
    <section id="cadastro" class="box">
        <div class="container-cadastro">
            <cfif session.tipoUsuario EQ "admin">
                <cfquery name="idUsuario" dataSource="cadastro-vegus">
                    SELECT * FROM Usuarios WHERE UsuarioID = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
                </cfquery>
                
                <form id="formCadastro" autocomplete="off" enctype="multipart/form-data" method="POST" action="editaUsuario.cfm?id=#id#">
                    <input type="hidden" name="id" value="#idUsuario.UsuarioID#">
                    <label for="nome">Nome</label>
                    <input id="nome" name="nome" value="#idUsuario.nome#" required>
                    <br />
                    <label for="sobrenome">Sobrenome</label>
                    <input id="sobrenome" name="sobrenome" value="#idUsuario.Sobrenome#" required>
                    <br />
                    <label for="cpf">CPF</label>
                    <input id="cpf" value="#idUsuario.cpf#" name="cpf" onkeyup="validaCpf(this)" type="text" maxlength="11" required>
                    <br />
                    <label for="nascimento">Data de Nascimento</label>
                    <input id="nascimento" value="#idUsuario.dataNascimento#" name="nascimento" type="date" min="1900-01-01" max="2099-12-31" required>
                    <br />
                    <button type="submit" class="submit">
                        Alterar
                    </button>
                </form>

            <cfelse>
                <p>Voc&ecirc; n&atilde;o tem permiss&atilde;o para editar este usu&aacute;rio.</p>
            </cfif>
        </div>
    </section>
    <script src="./frontend/js/validacaoCpf.js"></script>
</cfoutput>

<cfif structKeyExists(session, "tipoUsuario") AND session.tipoUsuario EQ "admin">
    <cfif isDefined("form.id") AND isDefined("form.nome") AND isDefined("form.sobrenome") AND isDefined("form.cpf") AND isDefined("form.nascimento")>
        <cftry>
            <cfquery name="valoresAntigos" datasource="cadastro-vegus">
                SELECT nome, sobrenome, cpf, dataNascimento 
                FROM Usuarios 
                WHERE UsuarioID = <cfqueryparam value="#form.id#" cfsqltype="cf_sql_integer">
            </cfquery>
            
            <cfquery name="alterar" datasource="cadastro-vegus">
                UPDATE Usuarios
                SET 
                    nome = <cfqueryparam value="#form.nome#" cfsqltype="cf_sql_varchar">,
                    Sobrenome = <cfqueryparam value="#form.sobrenome#" cfsqltype="cf_sql_varchar">,
                    cpf = <cfqueryparam value="#form.cpf#" cfsqltype="cf_sql_varchar">,
                    dataNascimento = <cfqueryparam value="#form.nascimento#" cfsqltype="cf_sql_varchar">
                WHERE UsuarioID = <cfqueryparam value="#form.id#" cfsqltype="cf_sql_integer">
            </cfquery>

            <cfset detalhes = "Alteração realizada no usuário ID #form.id#: " &
                "Nome antigo: #valoresAntigos.nome# - Novo nome: #form.nome#; " &
                "Sobrenome antigo: #valoresAntigos.sobrenome# - Novo sobrenome: #form.sobrenome#; " &
                "CPF antigo: #valoresAntigos.cpf# - Novo CPF: #form.cpf#; " &
                "Nascimento antigo: #valoresAntigos.dataNascimento# - Novo nascimento: #form.nascimento#" />
            
            <cfquery name="registrarLog" datasource="cadastro-vegus">
                INSERT INTO userLogs (userAdmin, usuarioAlterado, acao, detalhes)
                VALUES (
                    <cfqueryparam value="#session.tipoUsuario#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#form.id#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="Alteração" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#detalhes#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>

            <cfset mensagemAlteracao = "Usu&aacute;rio alterado com sucesso!" />
            <cflocation url="./listagem.cfm?mensagemAlteracao=#urlEncodedFormat(mensagemAlteracao)#">
            <cfcatch>
                <cfoutput>
                    <p class="errorMessage">Erro ao alterar usu&aacute;rio.</p>
                </cfoutput>
            </cfcatch>
        </cftry>
    </cfif>
<cfelse>
    <cflocation url="./login.cfm">
</cfif>