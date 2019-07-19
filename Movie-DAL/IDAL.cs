using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Movie_DAL
{
    interface IDAL
    {
        DataTable SearchMovies(string movieTitle = "", string movieGenre = "", string releaseDate = "", string rating = "");
    }
}
