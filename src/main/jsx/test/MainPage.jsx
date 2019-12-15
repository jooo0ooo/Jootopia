import './../../webapp/css/test/custom.css';

import React from 'react';
import ReactDOM from 'react-dom';
import axios from 'axios';

class MainPage extends React.Component {

    handleCreate = () => {
        axios.get('/get_name')
        .then(function(response) {
            alert(response.data.seq + " : " + response.data.name);
        }).catch(function(err){
        });
    }

    render() {

        const {
            handleCreate
        } = this;

        return <div className="main">CoinShot Inquiry Page<button onClick={handleCreate}>test</button></div>;
        
    }
    
}

ReactDOM.render(<MainPage/>, document.getElementById('root'));