<cfoutput>
    <section id="deletar" class="box">
        <div class="container-exclusao">
            <h2>Certeza que deseja Excluir o usu&aacute;rio #url.nome#?</h2>

            <form action="deletaUsuario.cfm?id=#id#&nome=#nome#" method="POST">
                <input type="hidden" name="id" value="#url.id#">
                <button class="confirma" type="submit">Sim</button>
            </form>
        
            <form action="listagem.cfm" method="get">
                <button class="cancela" type="submit">N&atilde;o</button>
            </form>
        </div>
    </section>
</cfoutput>

<cfif structKeyExists(session, "tipoUsuario") AND session.tipoUsuario EQ "admin">
    <cfif isDefined("form.id")>
        <cftry>
            <cfquery name="informacoesInativadas" datasource="cadastro-vegus">
                SELECT nome, sobrenome, cpf, dataNascimento 
                FROM Usuarios 
                WHERE UsuarioID = <cfqueryparam value="#form.id#" cfsqltype="cf_sql_integer">
            </cfquery>

            <cfquery name="inativar" datasource="cadastro-vegus">
                UPDATE Usuarios
                SET 
                    usuarioAtivo = 0
                WHERE UsuarioID = <cfqueryparam value="#form.id#" cfsqltype="cf_sql_integer">
            </cfquery>

            <cfset detalhes = "Usuário #informacoesInativadas.nome# #informacoesInativadas.sobrenome#, " &
                "de CPF #informacoesInativadas.cpf#, nascido em #informacoesInativadas.dataNascimento#, " & 
                "ID #form.id# foi inativado" />

            <cfquery name="registrarLog" datasource="cadastro-vegus">
                INSERT INTO userLogs (userAdmin, usuarioAlterado, acao, detalhes)
                VALUES (
                    <cfqueryparam value="#session.tipoUsuario#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#form.id#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="Exclusão" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#detalhes#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>

            <cfset mensagemAlteracao = "Usuário excluído com sucesso!" />
            <cflocation url="./listagem.cfm?mensagemAlteracao=#urlEncodedFormat(mensagemAlteracao)#">
            <cfcatch>
                <cfoutput>
                    <p class="errorMessage">Erro ao excluir usu&aacute;rio.</p>
                </cfoutput>
            </cfcatch>
        </cftry>
    </cfif>
<cfelse>
    <cflocation url="./login.cfm">
</cfif>