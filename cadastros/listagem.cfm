<cfoutput>
    <h2>Lista de Usu&aacute;rios</h2>

    <form action="listagem.cfm" method="get">
        <label for="buscar">Pesquisar:</label>
        <input type="text" name="buscar" id="buscar" placeholder="Digite para pesquisar">
        <button type="submit">Buscar</button>
    </form>

    <table border="1">
        <thead>
            <tr>
                <th><a href="?orderBy=nomeUsuario&orderDirection=<cfif structKeyExists(url, 'orderDirection') AND url.orderDirection EQ 'asc'>desc<cfelse>asc</cfif>">Nome de Usu&aacute;rio</a></th>
                <th><a href="?orderBy=nome&orderDirection=<cfif structKeyExists(url, 'orderDirection') AND url.orderDirection EQ 'asc'>desc<cfelse>asc</cfif>">Nome</a></th>
                <th><a href="?orderBy=sobrenome&orderDirection=<cfif structKeyExists(url, 'orderDirection') AND url.orderDirection EQ 'asc'>desc<cfelse>asc</cfif>">Sobrenome</a></th>
                <th><a href="?orderBy=cpf&orderDirection=<cfif structKeyExists(url, 'orderDirection') AND url.orderDirection EQ 'asc'>desc<cfelse>asc</cfif>">CPF</a></th>
                <th><a href="?orderBy=dataNascimento&orderDirection=<cfif structKeyExists(url, 'orderDirection') AND url.orderDirection EQ 'asc'>desc<cfelse>asc</cfif>">Data de Nascimento</a></th>
                <th><a href="?orderBy=dataRegistro&orderDirection=<cfif structKeyExists(url, 'orderDirection') AND url.orderDirection EQ 'asc'>desc<cfelse>asc</cfif>">Registrado em</a></th>
            </tr>
        </thead>

        <tbody>
            <cfquery name="usuarios" dataSource="cadastro-vegus">
                SELECT * FROM Usuarios
                <cfif len(trim(url.buscar))>
                    WHERE nome LIKE '%' + <cfqueryparam value="#url.buscar#" cfsqltype="cf_sql_varchar"> + '%'
                    OR Sobrenome LIKE '%' + <cfqueryparam value="#url.buscar#" cfsqltype="cf_sql_varchar"> + '%'
                    OR nomeUsuario LIKE '%' + <cfqueryparam value="#url.buscar#" cfsqltype="cf_sql_varchar"> + '%'
                    OR dataNascimento LIKE '%' + <cfqueryparam value="#url.buscar#" cfsqltype="cf_sql_varchar"> + '%'
                </cfif>
                <cfif url.orderBy>
                    ORDER BY <cfqueryparam value="#url.orderBy#" cfsqltype="cf_sql_varchar">
                    <cfif url.orderDirection EQ "desc">DESC<cfelse>ASC</cfif>
                </cfif>
            </cfquery>

            <cfloop query="usuarios">
                <tr>
                    <td>#nome#</td>
                    <td>#sobrenome#</td>
                    <td>#cpf#</td>
                    <td>#dateFormat(dataNascimento, "dd/MM/yyyy")#</td>
                    <td>#dateFormat(dataRegistro, "dd/MM/yyyy")#</td>
                    <td>
                        <cfif session.tipoUsuario EQ "admin">
                            <a href="editar.cfm?id=#id#">Editar</a>
                            <a href="excluir.cfm?id=#id#">Excluir</a>
                        </cfif>
                    </td>
                </tr>
            </cfloop>
        </tbody>
    </table>
</cfoutput>