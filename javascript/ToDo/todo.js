let todoList = [{ item: 'Amir', dueDate: '' }];
displayItems();

function addTodo() {
    const inputElement = document.querySelector('#input-todo');
    const dateElement = document.querySelector('#input-date');
    const todoItem = inputElement.value.trim();
    const dueDate = dateElement.value;

    if (todoItem) {
        todoList.push({ item: todoItem, dueDate: dueDate });
        inputElement.value = '';
        dateElement.value = '';
        displayItems();
    }
}

function displayItems() {
    const containerElement = document.querySelector('.display-items');
    containerElement.innerHTML = todoList.map((todo, index) => `
        <div>
            <span>${todo.item}</span>
            <span>${todo.dueDate}</span>
            <button class="btn btn-delete" onclick="deleteTodo(${index})">Delete</button>
        </div>
    `).join('');
}

function deleteTodo(index) {
    todoList.splice(index, 1);
    displayItems();
}
