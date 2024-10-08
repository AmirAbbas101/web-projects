const myInfo = Symbol();

const myInformation = {
    name : 'Amir Abbas',
    age: 22,
    [myInfo]: 'abc@google.com',
}

console.log(typeof myInformation[myInfo])
console.log(typeof myInfo)