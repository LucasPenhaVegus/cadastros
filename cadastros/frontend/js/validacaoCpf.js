function validaCpf(params) {
    let cpf = params.value;
    cpf = cpf.replace(/\D/g, "");
    params.value = cpf;
}