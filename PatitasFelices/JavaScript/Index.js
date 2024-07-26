function showH2() {
    const titulosh2 = document.querySelectorAll('.banner-h2');
    let currentIndex = 0;

    function showTituloh2(index) {
        titulosh2.forEach((titulo, i) => {
            titulo.style.opacity = i === index ? '1' : '0';
        });
    }

    function cicloTitulosh2() {
        showTituloh2(currentIndex);
        currentIndex = (currentIndex + 1) % titulosh2.length;
    }

    cicloTitulosh2();
    setInterval(cicloTitulosh2, 5000);
}

document.addEventListener("DOMContentLoaded", () => {
    showH2();
});