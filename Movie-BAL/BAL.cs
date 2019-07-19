using Movie_DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Movie_BAL
{
    public class BAL:IBAL
    {
        #region Variables
        private static DAL _DALObj;
        #endregion

        static BAL()
        {
            _DALObj = new DAL();
        }

        #region Methods
        public DataTable SearchMovies(string movieTitle = "", string movieGenre = "", string releaseDate = "", string rating = "")
        {
            return _DALObj.SearchMovies(movieTitle, movieGenre, releaseDate, rating);
        }

        public DataTable GetRatings()
        {
            return _DALObj.GetRatings();
        }

        public DataTable GetMovieDetails(int movieId)
        {
            return _DALObj.GetMovieDetails(movieId);
        }

        public DataTable GetCastDetails(int movieId)
        {
            return _DALObj.GetCastDetails(movieId);
        }
        #endregion
    }
}