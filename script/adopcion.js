const mascotas = [
    {
        nombre: 'Rex',
        edad: '2 años',
        raza: 'Labrador',
        sexo: 'Macho',
        tipo: 'perro',
        edadCategoria: 'adulto',
        imagen: 'http://127.0.0.1:5500/multimedia/img/foto-labrador.jpg'
    },
    {
        nombre: 'Luna',
        edad: '1 año',
        raza: 'Siamés',
        sexo: 'Hembra',
        tipo: 'gato',
        edadCategoria: 'cachorro',
        imagen: 'http://127.0.0.1:5500/multimedia/img/foto-siames.jpg'
    },
    {
        nombre: 'Rex',
        edad: '2 años',
        raza: 'Labrador',
        sexo: 'Macho',
        tipo: 'perro',
        edadCategoria: 'adulto',
        imagen: 'http://127.0.0.1:5500/multimedia/img/foto-labrador.jpg'
    },
    {
        nombre: 'Luna',
        edad: '1 año',
        raza: 'Siamés',
        sexo: 'Hembra',
        tipo: 'gato',
        edadCategoria: 'cachorro',
        imagen: 'http://127.0.0.1:5500/multimedia/img/foto-siames.jpg'
    },
    {
        nombre: 'Rex',
        edad: '2 años',
        raza: 'Labrador',
        sexo: 'Macho',
        tipo: 'perro',
        edadCategoria: 'adulto',
        imagen: 'http://127.0.0.1:5500/multimedia/img/foto-labrador.jpg'
    },
    {
        nombre: 'Luna',
        edad: '1 año',
        raza: 'Siamés',
        sexo: 'Hembra',
        tipo: 'gato',
        edadCategoria: 'cachorro',
        imagen: 'http://127.0.0.1:5500/multimedia/img/foto-siames.jpg'
    },
    {
        nombre: 'Rex',
        edad: '2 años',
        raza: 'Labrador',
        sexo: 'Macho',
        tipo: 'perro',
        edadCategoria: 'adulto',
        imagen: 'http://127.0.0.1:5500/multimedia/img/foto-labrador.jpg'
    },
    {
        nombre: 'Luna',
        edad: '1 año',
        raza: 'Siamés',
        sexo: 'Hembra',
        tipo: 'gato',
        edadCategoria: 'cachorro',
        imagen: 'http://127.0.0.1:5500/multimedia/img/foto-siames.jpg'
    },
    {
        nombre: 'Rex',
        edad: '2 años',
        raza: 'Labrador',
        sexo: 'Macho',
        tipo: 'perro',
        edadCategoria: 'adulto',
        imagen: 'http://127.0.0.1:5500/multimedia/img/foto-labrador.jpg'
    },
    {
        nombre: 'Luna',
        edad: '1 año',
        raza: 'Siamés',
        sexo: 'Hembra',
        tipo: 'gato',
        edadCategoria: 'cachorro',
        imagen: 'http://127.0.0.1:5500/multimedia/img/foto-siames.jpg'
    },
];

const galeria = document.getElementById('galeria');

// mascotas.forEach(mascota => {
//     const tarjeta = document.createElement('div');
//     tarjeta.className = 'tarjeta';
//     tarjeta.innerHTML = `
//         <img src='${mascota.imagen}' alt='${mascota.nombre}'>
//         <div class='info'>
//             <h3>${mascota.nombre}</h3>
//             <p>Edad: ${mascota.edad}</p>
//             <p>Raza: ${mascota.raza}</p>
//             <p>Sexo: ${mascota.sexo}</p>
//         </div>
//     `;
//     galeria.appendChild(tarjeta);
// });

function mostrarMascotas(filtradas) {
    galeria.innerHTML = '';
    filtradas.forEach(mascota => {
        const tarjeta = document.createElement('div');
        tarjeta.className = 'tarjeta';
        tarjeta.innerHTML = `
            <img src='${mascota.imagen}' alt='${mascota.nombre}'>
            <div class='info'>
                <h3>${mascota.nombre}</h3>
                <p>Edad: ${mascota.edad}</p>
                <p>Raza: ${mascota.raza}</p>
                <p>Sexo: ${mascota.sexo}</p>
            </div>
        `;
        galeria.appendChild(tarjeta);
    });
}

function filtrarMascotas() {
    const tipo = document.getElementById('tipo').value;
    const edad = document.getElementById('edad').value;

    const filtradas = mascotas.filter(mascota => {
        return (tipo === 'todos' || mascota.tipo === tipo) &&
               (edad === 'todas' || mascota.edadCategoria === edad);
    });

    mostrarMascotas(filtradas);
}

// Inicializar con todas las mascotas
mostrarMascotas(mascotas);

// Añadir eventos de cambio a los selectores de filtro
document.getElementById('tipo').addEventListener('change', filtrarMascotas);
document.getElementById('edad').addEventListener('change', filtrarMascotas);