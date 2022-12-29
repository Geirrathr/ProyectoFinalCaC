function populate() {
    var formState = document.getElementById("state");
    var formCity = document.getElementById("city");

    // Array con las ciudades a usar en el form
    var cities = {
        "Buenos Aires": ["La Matanza", "La Plata", "Lomas de Zamora", "Mar del Plata", "Quilmes", "Almirante Brown"],
        "Córdoba": ["Córdoba", "Río Cuarto", "Villa María", "Villa Carlos Paz", "San Francisco", "Alta Gracia"],
        "Entre Ríos": ["Paraná", "Concordia", "Gualeguaychú", "Concepción del Uruguay", "Gualeguay", "Villaguay"],
        "Mendoza": ["Guaymallén", "Godoy Cruz", "Las Heras", "San Rafael", "Mendoza", "Maipú"],
        "Neuquén": ["Neuquén", "Cutral Có", "Centenario", "Plottier", "Zapala", "San Martín de los Andes"],
        "Santa Fe": ["Rosario", "Santa Fe", "Rafaela", "Villa Gobernador Gálvez", "Venado Tuerto", "Reconquista"]
    };

    //limpia el dropdown de las localidades
    formCity.length = 0;

    //primer opción del form
    var opcion = document.createElement("option");
    opcion.value = "";
    opcion.text = "Seleccioná una localidad...";
    opcion.disabled = true;
    opcion.selected = true;

    formCity.appendChild(opcion);

    //provincia seleccionada
    var provincia = formState.value;

    //crea las opciones de las localidades según lo seleccionado
    for (var i in cities[provincia]) {
        opcion = document.createElement("option");

        opcion.value = cities[provincia][i];
        opcion.text = cities[provincia][i];

        formCity.appendChild(opcion);
    }
}