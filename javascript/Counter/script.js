 const number = document.querySelector('.count');

function reset() {
    number.innerHTML = '0';
}

function increament() {
    let num = Number(number.innerHTML);
    num += 1;
    number.innerHTML = num.toString();
    
}

function decreament() {
    let num = Number(number.innerHTML);
    num -= 1;
    number.innerHTML = num.toString();
    
}