const textArrayH1 = ["Encuentra a tu mejor amigo hoy"];
const textArrayH3 = ["Adoptá, no compres", "Salva una vida"];
const typingSpeed = 50;
const erasingSpeed = 20;
const delayBetweenTextsH1 = 15000;
const delayBetweenTextsH3 = 10000;

let h1Index = 0;
let h3Index = 0;
let h1CharIndex = 0;
let h3CharIndex = 0;
let h1IsDeleting = false;
let h3IsDeleting = false;

function typeH1() {
    const currentTextH1 = textArrayH1[h1Index];
    const typewriterElementH1 = document.getElementById("typewriter-h1");

    if (h1IsDeleting) {
        typewriterElementH1.textContent = currentTextH1.substring(0, h1CharIndex - 1);
        h1CharIndex--;

        if (h1CharIndex === 0) {
            h1IsDeleting = false;
            h1Index = (h1Index + 1) % textArrayH1.length;
            setTimeout(typeH1, typingSpeed);
        } else {
            setTimeout(typeH1, erasingSpeed);
        }
    } else {
        typewriterElementH1.textContent = currentTextH1.substring(0, h1CharIndex + 1);
        h1CharIndex++;

        if (h1CharIndex === currentTextH1.length) {
            h1IsDeleting = true;
            setTimeout(typeH1, delayBetweenTextsH1);
        } else {
            setTimeout(typeH1, typingSpeed);
        }
    }
}

function typeH3() {
    const currentTextH3 = textArrayH3[h3Index];
    const typewriterElementH3 = document.getElementById("typewriter-h3");

    if (h3IsDeleting) {
        typewriterElementH3.textContent = currentTextH3.substring(0, h3CharIndex - 1);
        h3CharIndex--;

        if (h3CharIndex === 0) {
            h3IsDeleting = false;
            h3Index = (h3Index + 1) % textArrayH3.length;
            setTimeout(typeH3, 5000);
        } else {
            setTimeout(typeH3, erasingSpeed);
        }
    } else {
        typewriterElementH3.textContent = currentTextH3.substring(0, h3CharIndex + 1);
        h3CharIndex++;

        if (h3CharIndex === currentTextH3.length) {
            h3IsDeleting = true;
            setTimeout(typeH3, delayBetweenTextsH3);
        } else {
            setTimeout(typeH3, typingSpeed);
        }
    }
}

document.addEventListener("DOMContentLoaded", () => {
    setTimeout(typeH1, delayBetweenTextsH1);
    setTimeout(typeH3, delayBetweenTextsH3);
});