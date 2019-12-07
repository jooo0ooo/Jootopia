import "@babel/polyfill";
import React from 'react';
import ReactDOM from 'react-dom';
import TodoListTemplate from './components/TodoListTemplate.jsx';
import Form from './components/Form.jsx';
import TodoItemList from './components/TodoItemList.jsx';
import Palette from "./components/Palette.jsx";
import './../../webapp/css/todo/Todo.css';


const colors = ['#343a40', '#f03e3e', '#12b886', '#228ae6'];

class Todo extends React.Component {

    id = 3

    state = {
        input: '',
        todos: [
            {id: 0, text: 'Watching TV', checked: false},
            {id: 1, text: 'Going to work', checked: true},
            {id: 2, text: 'Studying React', checked: false}
        ],
        color: '#343a40'
    }

    handleChange = (e) => {
        this.setState({
            input: e.target.value
        });
    }

    handleCreate = () => {
        const {input, todos, color} = this.state;
        this.setState({
            input: '',
            todos: todos.concat({
                id: this.id++,
                text: input,
                checked: false,
                color
            })
        });
    }

    handleKeyPress = (e) => {
        if(e.key === 'Enter') {
            this.handleCreate();
        }
    }

    handleToggle = (id) => {
        const {todos} = this.state;

        const index = todos.findIndex(todo => todo.id === id);
        const selected = todos[index];

        const nextTodos = [...todos];

        nextTodos[index] = {
            ...selected,
            checked: !selected.checked
        };

        this.setState({
            todos: nextTodos
        });
    }

    handleRemove = (id) => {
        const {todos} = this.state;
        this.setState({
            todos: todos.filter(todo => todo.id !== id)
        });
    }

    handleSelectColor = (color) => {
        this.setState({
            color
        })
    }

    render() {
        const {input, todos, color} = this.state;
        const {
            handleChange,
            handleCreate,
            handleKeyPress,
            handleToggle,
            handleRemove,
            handleSelectColor
        } = this;

        return(
            <TodoListTemplate
                form={(
                    <Form
                        value={input}
                        onKeyPress={handleKeyPress}
                        onChange={handleChange}
                        onCreate={handleCreate}
                        color={color}
                    />
                )}
                palette={(
                    <Palette
                        colors={colors}
                        selected={color}
                        onSelect={handleSelectColor}
                    />
                )}
            >
                <TodoItemList todos={todos} onToggle={handleToggle} onRemove={handleRemove}/>
            </TodoListTemplate>
        );
    }
}

//export default App;
ReactDOM.render(<Todo/>, document.getElementById('root'));