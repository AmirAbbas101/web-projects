const vlaue = document.querySelector('#value');
const btnIncrease = document.querySelector('.increase');
const btnDecrease = document.querySelector('.decrease');
const btnReset = document.querySelector('.reset');
let num = 0;

function setValue() {
    if(num > 0) {
        vlaue.style.color = 'green';
    }
    else if(num < 0) {
        vlaue.style.color = 'red';
    }
    else {
        vlaue.style.color = 'black';
    }

    vlaue.innerHTML = num.toString();
}

btnIncrease.addEventListener('click', function() {
    num++;
    setValue();
});

btnDecrease.addEventListener('click', function() {
    num--;
    setValue();
});

btnReset.addEventListener('click', function() {
    num = 0;
    setValue();
});

