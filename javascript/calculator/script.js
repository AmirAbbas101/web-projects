let currentOutput = '';

function appendNumber(number) {
    currentOutput += number;
    updateDisplay(currentOutput);
}

function appendOperator(operator) {
    currentOutput += ` ${operator} `;
    updateDisplay(currentOutput);
}

function appendDecimal() {
    if (!currentOutput.includes('.')) {
        currentOutput += '.';
        updateDisplay(currentOutput);
    }
}

function updateDisplay(output) {
    document.querySelector('.calculator-display').value = output;
}

function clearDisplay() {
    currentOutput = '';
    updateDisplay('0000');
}

function deleteLastEntry() {
    currentOutput = currentOutput.trim().slice(0, -1);
    if (currentOutput === '') {
        updateDisplay('0000');
    } else {
        updateDisplay(currentOutput);
    }
}

function calculateResult() {
    try {
        currentOutput = eval(currentOutput.replace(/%/g, '*0.01'));
        updateDisplay(currentOutput);
    } catch {
        updateDisplay('Error');
        currentOutput = '';
    }
}
