function bubbleSort(arr, arraySize) {
    let temp = 0;
    for(let i = 0; i < arraySize - 1; i++) {
        for(let j = 0; j < arraySize - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j+1] = temp
            }
        }
    }
}

const arr = [3,5,1,7,0,8,9,4,6,2];
console.log(arr)
const arraySize = arr.length;
bubbleSort(arr, arraySize)
console.log(arr);


