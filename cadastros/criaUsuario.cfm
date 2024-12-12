<cfinvoke
component="controller"
method="validarDados"
>
    <cfinvokeargument name="nome" value="#form.nome#">
    <cfinvokeargument name="sobrenome" value="#form.sobrenome#">
    <cfinvokeargument name="cpf" value="#form.cpf#">
    <cfinvokeargument name="nascimento" value="#form.nascimento#">
    <cfinvokeargument name="usuario" value="#form.usuario#">
    <cfinvokeargument name="senha" value="#form.senha#">
    <cfinvokeargument name="confirmaSenha" value="#form.confirmaSenha#">

</cfinvoke>

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