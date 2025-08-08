const registro = document.getElementById("Registro");
const plantilla = document.getElementById("plantilla");
const plantilla02 = document.getElementById("plantilla02");
const formulario = document.getElementById("Formulario_Login");
const titulo = document.getElementById("t_bienvenida");

registro.addEventListener("click", visible);

function visible(e) {
    e.preventDefault();

    // Animar la desaparición del primer formulario
    formulario.style.transition = "opacity 0.5s ease";
    formulario.style.opacity = "0";

    titulo.style.transition = "opacity 0.1s ease";
    titulo.style.opacity = "0";

    // Preparar el segundo contenedor
    plantilla.style.backgroundColor = "transparent";
    plantilla.style.textAlign = "center";
    plantilla.style.paddingTop = "250px";
    plantilla02.style.opacity = "0"; // empieza invisible
    plantilla02.style.display = "block";

    // Después de la animación del primero
    setTimeout(() => {
        formulario.style.display = "none";
        titulo.style.display = "none";
        plantilla.innerHTML = `<h1 id="t_bienvenida">Nos alegra tenerte</h1>`;

        // Ahora sí, hacer visible el segundo con animación
        plantilla02.style.transition = "opacity 0.5s ease";
        plantilla02.style.opacity = "1";
    }, 500);
}
