console.log("Hola desde MiScript.js")

//Validar la Fecha y Hora
//Una reservación no puede hacerce con menos de 2 horas de antelación
//P/E
//si es medio día (12 pm) la reservación tiene que hacerse como mínimo a las 2 pm
//esto aplica solo si es para el dái de hoy, ya que si es para mañana o un día posterior, la reservación se puede realizar en el horario del restaurante (8am - 7pm)


//Validar el total de personas
//una reservación debe tener como mínimo 1 persona, como máximo 12 personas repartidas de la siguiente manera
// Personas por reservación (contact_people) min 1, max 8
// Personas adicionales (contact_add) min 0, max 4

//Sumar en tiempo real, la cantidad de personas
//al momento de escribir o modificar las personas de la reservación, deberá actualizarce el total en la pantalla (se mostrará en el output)

//NOTA ADICIONAL
//se deberá usar Sweet Alert, para mostrar mensajes de alerta en caso de que una validación falle


console.log("Hola desde MiScript.js");

// Actualiza el total en tiempo real
$(document).ready(function () {
    $('#contact_people, #contact_add').on('input', actualizarTotal);
});

// Función para actualizar el total en tiempo real
function actualizarTotal() {
    const personas = parseInt($('#contact_people').val()) || 0;
    const adicionales = parseInt($('#contact_add').val()) || 0;

    // Muestra el total en el output
    const total = personas + adicionales;
    $('#total').val(total);

    if (personas > 8) {
        Swal.fire("Error", "El total de personas no puede superar las 12.", "error");
    }
    if (adicionales > 4) {
        Swal.fire("Error", "El total de personas no puede superar las 12.", "error");
    }
    // Validar si excede el límite
    if (total > 12) {
        Swal.fire("Error", "El total de personas no puede superar las 12.", "error");
    }
}

// Función principal que valida todo al enviar
function enviar_formulario() {
    if (
        validarNombre() &&
        validarCorreo() &&
        validarFechaYHora() &&
        validarPersonas()
    ) {
        Swal.fire("¡Éxito!", "Reservación realizada correctamente.", "success");
    }
}

// Función para validar el nombre
function validarNombre() {
    const nombre = $('#contact_name').val().trim();
    if (nombre === "") {
        Swal.fire("Error", "El campo de nombre no puede estar vacío.", "error");
        return false;
    }
    return true;
}

// Función para validar el correo electrónico
function validarCorreo() {
    const correo = $('#contact_mail').val().trim();
    const regexCorreo = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!regexCorreo.test(correo)) {
        Swal.fire("Error", "Por favor, ingrese un correo electrónico válido.", "error");
        return false;
    }
    return true;
}

// Función para validar la fecha y hora
function validarFechaYHora() {
    const fechaSeleccionada = new Date($('#contact_fecha').val() + "T" + $('#contact_hora').val());
    const ahora = new Date();
    const dosHorasMas = new Date(ahora.getTime() + 2 * 60 * 60 * 1000);

    // Validar si la fecha es válida
    if (isNaN(fechaSeleccionada.getTime())) {
        Swal.fire("Error", "Fecha y hora inválidas. Por favor ingrese una válida.", "error");
        return false;
    }

    // Validar que la fecha seleccionada no sea en el pasado
    if (fechaSeleccionada < ahora) {
        Swal.fire("Error", "No se pueden hacer reservaciones en fechas u horas pasadas.", "error");
        return false;
    }

    // Si la reservación es para hoy, validar que sea con al menos 2 horas de anticipación
    //aaaa/MM/dd T mm:ss
    if (fechaSeleccionada.toDateString() === ahora.toDateString()) {
        if (fechaSeleccionada < dosHorasMas) {
            Swal.fire("Error", "La reservación debe hacerse con al menos 2 horas de anticipación.", "error");
            return false;
        }
    }

    // Validar que esté dentro del horario permitido (8:00 AM a 7:00 PM)
    const hora = fechaSeleccionada.getHours();
    const minutos = fechaSeleccionada.getMinutes();
    const fueraDeHorario = hora < 8 || (hora > 19 || (hora === 19 && minutos > 0));

    if (fueraDeHorario) {
        Swal.fire("Error", "El horario debe estar entre las 8:00 AM y las 7:00 PM.", "error");
        return false;
    }

    return true;
}

// Función para validar la cantidad de personas
function validarPersonas() {
    const personas = parseInt($('#contact_people').val()) || 0;
    const adicionales = parseInt($('#contact_add').val()) || 0;

    if (personas < 1) {
        Swal.fire("Alerta", "No puede ir un 0.", "warning");
        $('#contact_people').val('1')
        return false;
    }

    // Validar límites
    if (personas < 1 || personas > 8) {
        Swal.fire("Error", "El número de personas debe estar entre 1 y 8.", "error");
        return false;
    }

    if (adicionales < 0 || adicionales > 4) {
        Swal.fire("Error", "El número de personas adicionales debe estar entre 0 y 4.", "error");
        return false;
    }

    const total = personas + adicionales;
    if (total > 12) {
        Swal.fire("Error", "El total de personas no puede superar las 12.", "error");
        return false;
    }

    return true;
}

