#include <iostream>
using namespace std;

// Function to perform bubble sort
void bubbleSort(int arr[], int arraySize) {
    int temp;
    for(int i = 0; i < arraySize - 1; i++) { // 5-1 = 4 -> 0, 1, 2, 3
    cout<<"i = "<<i<<endl;
        for(int j = 0; j < arraySize - i - 1; j++) { 
            // 5 - 0 - 1 = 4 -> 0, 1, 2 , 3 
            cout<<"j = "<<j<<endl;

            if (arr[j] > arr[j + 1]) {  // Swap if the element found is greater than the next element
                temp  = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

int main() {
    int data[] = {9,3,5,1,56,23,2,4};
    
    // Find array's length
    int size = sizeof(data) / sizeof(data[0]);
    
    // Perform bubble sort
    bubbleSort(data, size);
    
    // Print sorted array
    cout << "Sorted Array in Ascending Order:\n";
    for(int i = 0; i < size; ++i) {
        cout << data[i] << " ";
    }
    cout << endl;
    
    return 0;
}
