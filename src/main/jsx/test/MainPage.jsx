import './../../webapp/css/test/custom.css';

import React from 'react';
import ReactDOM from 'react-dom';

class MainPage extends React.Component {

    handleCreate = () => {
        return fetch(
            'http://localhost:9090/get_name'
          )
            .then(function(response) {
                alert(response);
            })
            //.then(potato => potato.json())
            //.then(json => json.data.movies)
            //.catch(err => console.log(err))
        /*
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
        */
    }

    render() {

        const {
            handleCreate
        } = this;

        return <div className="main">CoinShot Inquiry Page<button onClick={handleCreate}>test</button></div>;
        
    }
    
}

ReactDOM.render(<MainPage/>, document.getElementById('root'));