

document.getElementById("formCadastro").addEventListener("submit", function(e) {
    e.preventDefault();

    const nome = document.getElementById("nome").value.trim();
    const sobrenome = document.getElementById("sobrenome").value.trim();
    const cpf = document.getElementById("cpf").value.trim();
    const nascimento = document.getElementById("nascimento").value.trim();
    const usuario = document.getElementById("usuario").value.trim();
    const senha = document.getElementById("senha").value.trim();
    const confirmaSenha = document.getElementById("confirmaSenha").value.trim();

    if (senha !== confirmaSenha) {
        document.getElementById("errorMessage").textContent = "As senhas devem ser iguais!";
    } else {
        document.getElementById("errorMessage").textContent = "";
        alert("Usuário cadastrado com sucesso!");
    }

});

document.getElementById("verSenha").addEventListener("click", function () {
    const senhaUsuario = document.getElementById("senha")
    if (senhaUsuario.type === "password") {
        senhaUsuario.type = "text";
        this.textContent = "X"
    } else {
        senhaUsuario.type = "password";
        this.textContent = "O"
    }
});

const verSenhaLogin = document.getElementById("verSenhaLogin");
if (verSenhaLogin) {
    verSenhaLogin.addEventListener("click", function () {
        const senhaUsuarioLogin = document.getElementById("senhaLogin")
        if (senhaUsuarioLogin.type === "password") {
            senhaUsuarioLogin.type = "text";
            this.textContent = "X"
        } else {
            senhaUsuarioLogin.type = "password";
            this.textContent = "O"
        }
    });
}
