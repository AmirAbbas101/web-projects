#include <iostream>
using namespace std;

void bubbleSort(int array[], int arraySize)
{
    int temp; // {8, 2, 1, 9, 5, 6}
    for (int i = 0; i < arraySize - 1; i++) // 1. 0 0<6-1 1 
    {
        for (int j = 0; j < arraySize - i - 1; j++) //1. 0 0<5 1 2. 1<5 2
        {
            if (array[j] > array[j + 1]) // 8 > 2 , 8>1
            {
                // Swap the elements
                temp = array[j]; // 1. temp=8 
                array[j] = array[j + 1]; //1. array[0] = 2, 1
                array[j + 1] = temp; // a1. rray[1] = 8 (1,2,5,6,8,9)
            }
        }
    }
}

void printArray(int array[], int arraySize)
{
    for (int i = 0; i < arraySize; i++)  // Corrected initialization of 'i'
    {
        cout << array[i] << " ";
    }
    cout << endl;
}

int main()
{
    int array[] = {8, 2, 1, 9, 5, 6};
    int arraySize = sizeof(array) / sizeof(array[0]);

    cout << "Unsorted array: ";
    printArray(array, arraySize);

    bubbleSort(array, arraySize);

    cout << "Sorted array: ";
    printArray(array, arraySize);

    return 0;
}
