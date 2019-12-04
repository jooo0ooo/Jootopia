import "@babel/polyfill";
import React from 'react';
import ReactDOM from 'react-dom';
import './../../webapp/css/movie_app/MovieApp.css';
import Movie from './Movie.jsx';

class MovieApp extends React.Component {

  // Render: componentWillMount() -> render() -> componentDidMount()
  // Update: componentWillReceiveProps() -> shouldComponentUpdate() == true -> componentWillUpdate() -> render() -> componentDidUpdate()

  state = {};

  componentDidMount(){
    this._getMovies();
  }

  _renderMovies = () => {
    const movies = this.state.movies.map(movie => {
      return (
        <Movie
          title={movie.title_english}
          poster={movie.large_cover_image}
          key={movie.id}
          genres={movie.genres}
          synopsis={movie.synopsis}
        />
      );
    });
    return movies
  };

  _getMovies = async () => {
    const movies = await this._callApi();
    this.setState({
      movies
    });
  };

  _callApi = () => {
    return fetch(
      'https://yts.lt/api/v2/list_movies.json?sort_by=download_count'
    )
      .then(potato => potato.json())
      .then(json => json.data.movies)
      .catch(err => console.log(err))
  };

  render() {
    const { movies } = this.state;
    return (
      <div className={movies ? "App" : "App--loading"}>
        {movies ? this._renderMovies() : "Loading"}
      </div>
    );
  }
}

ReactDOM.render(<MovieApp/>, document.getElementById('root'));
//export default MovieApp;
