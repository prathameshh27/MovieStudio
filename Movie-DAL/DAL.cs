using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Movie_DAL
{
    public class DAL: IDAL
    {
        #region Variables
        private static string _connString;
        private SqlConnection _conn;
        
        #endregion

        #region Constructor
        static DAL()
        {
            _connString = ConfigurationManager.ConnectionStrings["development"].ConnectionString;
        }
    	#endregion       
    
        #region Methods
        public DataTable SearchMovies(string movieTitle = "", string movieGenre = "", string releaseDate = "", string rating = "")
        {
            DataTable dataTable;
            _conn = new SqlConnection(_connString);

            SqlDataAdapter dataAdapter = new SqlDataAdapter("USP_Search_Movie", _conn);

            dataAdapter.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.AddWithValue("@name", movieTitle);
            dataAdapter.SelectCommand.Parameters.AddWithValue("@genre", movieGenre);
            dataAdapter.SelectCommand.Parameters.AddWithValue("@release_date", releaseDate);
            dataAdapter.SelectCommand.Parameters.AddWithValue("@rating", rating);

            dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            return dataTable;
        }

        
        public DataTable GetRatings()
        {
            DataTable dataTable;
            _conn = new SqlConnection(_connString);

            SqlDataAdapter dataAdapter = new SqlDataAdapter("USP_Get_Rating", _conn);

            dataAdapter.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;

            dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            return dataTable;
        }


        public DataTable GetMovieDetails(int movieId)
        {
            DataTable dataTable;
            _conn = new SqlConnection(_connString);

            SqlDataAdapter dataAdapter = new SqlDataAdapter("USP_Get_Movie_Details", _conn);

            dataAdapter.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.AddWithValue("@movieId", movieId);

            dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            return dataTable;
        }

        public DataTable GetCastDetails(int movieId)
        {
            DataTable dataTable;
            _conn = new SqlConnection(_connString);

            SqlDataAdapter dataAdapter = new SqlDataAdapter("USP_Get_Cast_Details", _conn);

            dataAdapter.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.AddWithValue("@movieId", movieId);

            dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            return dataTable;
        }

        #endregion
    }
}
