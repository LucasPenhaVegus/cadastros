<cfif session.tipoUsuario EQ "admin">
    <cfquery name="idUsuario" dataSource="cadastro-vegus">
        SELECT * FROM Usuarios WHERE id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer">
    </cfquery>
    
    <form id="formCadastro" autocomplete="off" enctype="multipart/form-data" method="POST" action="editaUsuario.cfm">
        <input type="hidden" name="id" value="#idUsuario.id#">
        <label for="nome">Nome</label>
        <input id="nome" name="nome" type="#idUsuario.nome#" required>
        <br />
        <label for="sobrenome">Sobrenome</label>
        <input id="sobrenome" name="sobrenome" type="#idUsuario.sobrenome#" required>
        <br />
        <label for="cpf">CPF</label>
        <input id="cpf" type="#idUsuario.cpf#" name="cpf" maxlength="14" required>
        <br />
        <label for="nascimento">Data de Nascimento</label>
        <input id="nascimento" type="#idUsuario.nascimento#" name="nascimento" min="1900-01-01" max="2099-12-31">
        <br />
        <button type="submit" class="submit">
            Alterar
        </button>
    </form>
<cfelse>
    <p>Voc&ecirc; n&atilde;o tem permiss&atilde;o para editar este usu&aacute;rio.</p>
</cfif>