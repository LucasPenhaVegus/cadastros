<cfoutput>
    <section id="login" class="box">
        <div class="container-login">
            <h2 class="title">Login</h2>
            <form id="formLogin" autocomplete="off" enctype="multipart/form-data" method="POST" action="validaLogin.cfm">
                <label for="usuarioLogin">Nome de Usu&aacute;rio</label>
                <input id="usuarioLogin" type="text" name="usuarioLogin" required>
                <br />
                <label for="senhaLogin">Senha</label>
                <div class="exibirSenha">
                    <input class="boxSenha" id="senhaLogin" type="password" name="senhaLogin" minlength="8"
                        placeholder="m&iacute;nimo de 8 d&iacute;gitos" required>
                    <button type="button" id="verSenhaLogin">&##128065;</button>
                </div>
                <br />
                <button type="submit" class="submit">
                    Entrar
                </button>
            </form>
        </div>
    </section>

    <script src="./frontend/js/verSenha.js"></script>
</cfoutput>