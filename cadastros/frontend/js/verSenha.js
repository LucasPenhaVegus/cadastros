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