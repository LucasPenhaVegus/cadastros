<cfoutput>

    <section id="cadastro" class="box">
        <div class="container-cadastro">
            <h2 class="title">Criar Novo Usuário</h2>
            <form id="formCadastro" autocomplete="off" enctype="multipart/form-data" method="POST" action="criaUsuario.cfm">
                <label for="nome">Nome</label>
                <input id="nome" name="nome" type="text" required>
                <br />
                <label for="sobrenome">Sobrenome</label>
                <input id="sobrenome" name="sobrenome" type="text" required>
                <br />
                <label for="cpf">CPF</label>
                <input id="cpf" type="text" name="cpf" maxlength="14" placeholder="000.000.000-00" required>
                <br />
                <label for="nascimento">Data de Nascimento</label>
                <input id="nascimento" type="date" name="nascimento" min="1900-01-01" max="2099-12-31">
                <br />
                <label for="usuario">Nome de Usuário</label>
                <input id="usuario" type="text" name="usuario">
                <br />
                <label for="senha">Senha</label>
                <div class="exibirSenha">
                    <input class="boxSenha" id="senha" type="password" name="senha" minlength="8"
                        placeholder="mínimo de 8 dígitos" required>
                    <button type="button" id="verSenha">&##128065;</button>
                </div>
                <br />
                <label for="confirmaSenha">Confirmar senha</label>
                <input id="confirmaSenha" type="password" name="confirmaSenha" minlength="8"
                    placeholder="mínimo de 8 dígitos" required>
                <br />
                <button type="submit" class="submit">
                    Cadastrar
                </button>
            </form>
            <p class="errorMessage" id="errorMessage"></p>
        </div>
    </section>

    <script src="./frontend/js/cadastroUsuario.js"></script>
</cfoutput>