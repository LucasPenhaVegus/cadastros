

const formCadastro = document.getElementById("formCadastro");
if (formCadastro) {

    formCadastro.addEventListener("submit", function(event) {
        event.preventDefault();

        const nome = document.getElementById("nome").value.trim();
        const sobrenome = document.getElementById("sobrenome").value.trim();
        const cpf = document.getElementById("cpf").value.trim();
        const nascimento = document.getElementById("nascimento").value.trim();
        const usuario = document.getElementById("usuario").value.trim();
        const senha = document.getElementById("senha").value.trim();
        const confirmaSenha = document.getElementById("confirmaSenha").value.trim();

        const temMaiuscula = /[A-Z]/;
        const temMinuscula = /[a-z]/;
        const temNumero = /\d/;
        const temEspaco = /\s/;
    

        if (senha !== confirmaSenha) {
            document.getElementById("errorMessage").innerHTML = "As senhas devem ser iguais!";
        } else if (!temMaiuscula.test(senha) || !temMinuscula.test(senha) || !temNumero.test(senha)) {
            document.getElementById("errorMessage").innerHTML = "A senha deve conter:<br>• No mínimo 8 dígitos<br>• Uma letra maíuscula<br>• Uma letra minúscula<br>• Um número";
        } else if (temEspaco.test(usuario)){
            document.getElementById("errorMessage").innerHTML = "O Nome de Usuário não pode conter espaços!"
        } else {
            document.getElementById("errorMessage").innerHTML = "";
            alert("Usuário cadastrado com sucesso!");
            formCadastro.submit();
        }

    });

    document.getElementById("verSenha").addEventListener("click", function () {
        const senhaUsuario = document.getElementById("senha")
        if (senhaUsuario.type === "password") {
            senhaUsuario.type = "text";
            this.textContent = "\u203F"
        } else {
            senhaUsuario.type = "password";
            this.textContent = "\uD83D\uDC41"
        }
    });

    document.getElementById("cpf").addEventListener("input", function (numerocpf) {
        
        let input = numerocpf.target;
        let value = input.value;

        value = value.replace(/\D/g, "");

        if (value.length > 3) value = value.replace(/(\d{3})(\d)/, "$1.$2");
        if (value.length > 6) value = value.replace(/(\d{3})\.(\d{3})(\d)/, "$1.$2.$3");
        if (value.length > 9) value = value.replace(/(\d{3})\.(\d{3})\.(\d{3})(\d)/, "$1.$2.$3-$4");
    
        input.value = value;
    
    })

}

const verSenhaLogin = document.getElementById("verSenhaLogin");
if (verSenhaLogin) {
    verSenhaLogin.addEventListener("click", function () {
        const senhaUsuarioLogin = document.getElementById("senhaLogin")
        if (senhaUsuarioLogin.type === "password") {
            senhaUsuarioLogin.type = "text";
            this.textContent = "\u203F"
        } else {
            senhaUsuarioLogin.type = "password";
            this.textContent = "\uD83D\uDC41"
        }
    });
}
