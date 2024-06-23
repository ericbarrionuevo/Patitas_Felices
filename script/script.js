function loadHeader() {
    fetch('header.html')
        .then(response => response.text())
        .then(data => {
            document.getElementById('header-placeholder').innerHTML = data;
            hideAdoptButtonIfOnAdoptionPage();
        })
        .catch(error => console.error('Error al cargar el header:', error));
}

function loadFooter() {
    fetch('footer.html')
        .then(response => response.text())
        .then(data => {
            document.getElementById('footer-placeholder').innerHTML = data;
        });
}

function hideAdoptButtonIfOnAdoptionPage() {
    const path = window.location.pathname;
    if (path.includes('adopcion')) {
        const btnAdoptar = document.querySelector('.btn-adoptar');
        if (btnAdoptar) {
            btnAdoptar.style.display = 'none';
        }
    }
}

window.addEventListener('DOMContentLoaded', function () {
    loadHeader();
    loadFooter();
});