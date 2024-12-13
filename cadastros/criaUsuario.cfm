<cfinvoke
component="controller"
method="validarDados"
returnvariable="validacao"
>
    <cfinvokeargument name="nome" value="#form.nome#">
    <cfinvokeargument name="sobrenome" value="#form.sobrenome#">
    <cfinvokeargument name="cpf" value="#form.cpf#">
    <cfinvokeargument name="nascimento" value="#form.nascimento#">
    <cfinvokeargument name="usuario" value="#form.usuario#">
    <cfinvokeargument name="senha" value="#form.senha#">
    <cfinvokeargument name="confirmaSenha" value="#form.confirmaSenha#">
    
</cfinvoke>

<cfif validacao EQ true>
    <cfinvoke
    component="controller"
    method="registrarNovoUsuario"
    >
        <cfinvokeargument name="nome" value="#form.nome#">
        <cfinvokeargument name="sobrenome" value="#form.sobrenome#">
        <cfinvokeargument name="cpf" value="#form.cpf#">
        <cfinvokeargument name="nascimento" value="#form.nascimento#">
        <cfinvokeargument name="usuario" value="#form.usuario#">
        <cfinvokeargument name="senha" value="#form.senha#">
        
    </cfinvoke>

<cfelse>
    <cfoutput>Erro</cfoutput>
    <cfreturn false>
</cfif>

<cfinvoke
component="controller"
method="limparCpf"
returnvariable="cpfLimpo"
>
    <cfinvokeargument name="cpf" value="000.000.000-00">

</cfinvoke>
