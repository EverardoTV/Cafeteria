//Funcion para obtener la geolocalizacion

$(document).ready(function () {
    obtenerUbicacion();
})

function obtenerUbicacion(){
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(mostrarUbicacion, mostrarError);
    } else {
        alert("La geolocalizacion no es soportada por este navegador");
    }
}

//Funcion para mostrar la ubicacion (si es que podemos recuperarla)

function mostrarUbicacion(position) {
    console.log(position);
    const lat = position.coords.latitude;
    const lon = position.coords.longitude;

    //Muestro la latitud y la longitud

    console.log("Latitud:" + lat + ", Longitud: " + lon);

    // LLamar a la funcion para obtener la direccion
    obtenerDireccion(lat, lon);

    // Inicializar el mapa y el Street View
    initMapComponents(lat, lon);

}

//Funcion que se ejecuta en caso de algun error al recuperar la geolocalizacion

function mostrarError(error) {
    switch (error.code) {
        case error.PERMISSION_DENIED:
            alert("El usuario negó el permiso de ubicación.");
            break;
        case error.POSITION_UNAVAILABLE:
            alert("La ubicación no está disponible.");
            break;
        case error.TIMEOUT:
            alert("Se agotó el tiempo de espera.");
            break;
        default:
            alert("Error desconocido: " + error.message);
            break;
    }
}

//Funcion para obtener la direccion de las coordenadas

function obtenerDireccion(lat,lon) {
    const latLng = { lat: lat, lng: lon };
    const geocoder = new google.maps.Geocoder();

    geocoder.geocode({ location: latLng }, function (results, status) {
        if (status === 'OK') {
            console.log(results);
            if (results[0]) {
                const direccion = results[0].formatted_address;
                // Mostrar la dirección obtenida en el HTML
                document.getElementById('direccion').innerText = "Dirección:" + direccion;
            } else {
                alert("No se encontraron resultados de dirección");
            }

        } else {
            alrt("Geocodificacion fallida: " + status);
        }

    });
}

//Funcion para

function initMapComponents(lat, lon) {
    const ubicacion = { lat: lat, lng: lon };

    //Iniciar el mapa
    const mapa = new google.maps.Map(document.getElementById("map"), {
        zoom: 15,
        center: ubicacion
    });

    //Añadir un marcador en el mapa
    new google.maps.Marker({
        position: ubicacion,
        map: mapa,
        title: "Ubicacion Actual"
    });

    //Configurar Street View
    const panorama = new google.maps.StreetViewPanorama(
        document.getElementById("street"), {
        position: ubicacion,
        pov: { heading: 90, pitch: 5 }
    });
    //Vincular el Street View al mapa
    mapa.setStreetView(panorama);
}

