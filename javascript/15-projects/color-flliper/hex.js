const hex = [0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F'];
const btn = document.querySelector('.flipper');
let color = document.querySelector('.color');

btn.addEventListener('click', function() {
    let background = '#';
    for(let i = 0; i < 6; i++) {
        background += hex[getRandomNumber()];
    }

    btn.style.backgroundColor = background;
    document.body.style.backgroundColor = background;
    color.textContent = background;
});


function getRandomNumber() {
    return Math.floor(Math.random() * hex.length)
}