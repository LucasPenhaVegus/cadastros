<cfdump var="#url#">
<cfdump var="#form#">
<cfoutput>
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
            <input id="cpf" value="#idUsuario.cpf#" name="cpf" maxlength="14" required>
            <br />
            <label for="nascimento">Data de Nascimento</label>
            <input id="nascimento" value="#idUsuario.dataNascimento#" name="nascimento" min="1900-01-01" max="2099-12-31">
            <br />
            <button type="submit" class="submit">
                Alterar
            </button>
        </form>
        <cfdump var="#idUsuario#">
    <cfelse>
        <p>Voc&ecirc; n&atilde;o tem permiss&atilde;o para editar este usu&aacute;rio.</p>
    </cfif>
    
</cfoutput>

<cfif session.tipoUsuario EQ "admin">
    <cfif isDefined("form.id") AND isDefined("form.nome") AND isDefined("form.sobrenome") AND isDefined("form.cpf") AND isDefined("form.nascimento")>
        <cftry>
            <cfquery name="alterar" dataSource="cadastro-vegus">
                UPDATE Usuarios
                SET 
                UsuarioID = <cfqueryparam value="#form.id#" cfsqltype="cf_sql_integer">
                nome = <cfqueryparam value="#form.nome#" cfsqltype="cf_sql_varchar">,
                Sobrenome = <cfqueryparam value="#form.sobrenome#" cfsqltype="cf_sql_varchar">,
                cpf = <cfqueryparam value="#form.cpf#" cfsqltype="cf_sql_varchar">,
                dataNascimento = <cfqueryparam value="#form.nascimento#" cfsqltype="cf_sql_varchar">
            </cfquery>
            <cfcatch>
                #cfcatch.message#
            </cfcatch>
        </cftry>
    </cfif>
</cfif>