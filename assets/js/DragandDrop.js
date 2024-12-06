//Los evento de JS son acciones o suscesos que ocurren en un docuemnto web y que pueden ser detectados y manejados por le código JS. Estos eventos puedes ser desencadenados por el usuario o generados automáticamente por le navegador

//En t+erminos más especificos, un evento es algo que sucede en el sistema que estámos programando. El sistema produce un señal de cierto tipo cuando en evento ocurre y proporciona un mecanismo para que una acción se lleve a cabo automáticamente como respuesta a dicho evento
console.log("Estoy aqui")
//Variables
var contador = 0;
var elemArrastrable = "";
var contadorA = 0;

// Funciones para los eventos del HTML

function start(e) {
    console.log(start);
    e.dataTransfer.effectAllowed = "move"; //Define el efecto de movimiento del elemento
    e.dataTransfer.setData("Data", e.target.id); //Guarda en memoria caché la info del elemento
    $("#" + e.target.id).css("opacity", "0.4") //Mediante Jquery busca el elemento en cuestión y cambia su propiedad CSS
    console.log(e.target.id);
    elemArrastrable = e.target.id // Guardamos la variable global del elemento en cuestión
}

function end(e) {
    // Funcion que se ejecuta con el evento ondragend, recibe como parametro el propio evento(como acción)
    console.log("end")
    e.target.style.opacity = ""; // reestablece la propiedad de opavidad a su valor por defecto
    e.dataTransfer.clearData("Data"); //Limpia del caché los datos almacenados como Data
    elemArrastrable = ""; //limpia la variable global
    console.log(e.target.id);
}

//Funcones de Movimiento
function enter(e) { //Funcion que se ejecuta con el evento ondragenter, recibe como parametro el propio evento
    console.log("enter");
    e.target.style.border = "12px dotted #555"; //añadimos un borde de puntos color negro cuado un cuadradito etre aun cuadro
}

function leave(e) { //Funcion que se ejecuta con el evento ondragleave, recibe como parametro el propio evento
    console.log("leave");
    $("#" + e.target.id).css("border", "") //Cuando el cuadradito abandona el cuadro, borramos el borde creado
}

function over(e) { //Funcion que se ejecuta con el evento ondragover, recibe como parametro el propio evento
    console.log("over");
    var id = e.target.id;
    if ((id == "cuadro1") || (id == "cuadro3") || (id == "papelera")) {
        return false; //falso significa que permitira dejar caer elementos sobre el
    } else {
        return true; //true significa que no permitira dejar caer elementos sobre el
    }
}


//Funcione de jugabilidad
function drop(e) { //Funcion que se ejecuta con el evento ondrop, recibe como parametro l propio evento
    console.log("drop");
    var elementoArrastrado = e.dataTransfer.getData("Data"); //guardamos el elemento que existe dentro del primer elemento para poder eliminarlo
    e.target.appendChild(document.getElementById(elementoArrastrado));
    e.target.style.border = "";
}



function remove(e) { //Funcion que se ejecuta con el evento ondrop, recibe como parametro l propio evento
    console.log("delete");
    var elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data")); //guardamos el elemento que existe dentro del primer elemento para poder eliminarlo
    elementoArrastrado.parentNode.removeChild(elementoArrastrado); //Parentnode sirve para meternos dentro de los elementos que pudiera tener el elemento padre, removeChild nos sirve para eliminar el elemento en cuestion
    e.target.style.border = "";
    contadorA--;
}

function clone(e) {//Funcion que se ejecuta con el evento ondrop, recibe como parametro el propio evento
    console.log("clone");
    var elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data")); //guardamos el elemento que existe dentro del primer elemento para poder clonarlo
    elementoArrastrado.style.opacity = "";
    if (contadorA < 3) {
        var elementoClonado = elementoArrastrado.cloneNode(true); //CloneNode copia todo un elemento/nodo, en este caso dentro de una variable
        elementoClonado.id = "CloneNode" + contador;
        contador++;
        contadorA++;
        elementoClonado.style.position = "static";
        e.target.appendChild(elementoClonado);
    }
    e.target.style.border = "";
}


