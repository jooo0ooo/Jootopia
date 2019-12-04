import './../../webapp/css/test/custom.css';

import React from 'react';
import ReactDOM from 'react-dom';

class Page1Page extends React.Component {

    render() {
        return <div className="page1">CoinShot Inquiry Page1</div>;
    }

}

ReactDOM.render(<Page1Page/>, document.getElementById('root'));