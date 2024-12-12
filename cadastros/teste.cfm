<cfoutput>
    <cfscript>
        usuarioDAO = new UsuarioDAO();
        usuarios = usuarioDAO.getUsuarios();
    </cfscript>
</cfoutput>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Nome</th>
    </tr>
    <cfoutput query="usuarios">
        <tr>
            <td>#UsuarioID#</td>
            <td>#Nome#</td>
        </tr>
    </cfoutput>
</table>

