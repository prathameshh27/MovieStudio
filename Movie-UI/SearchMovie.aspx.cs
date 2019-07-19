using Movie_BAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movie_UI
{
    public partial class SearchMovie : System.Web.UI.Page
    {
        private DataTable _dataTable;
        public BAL BALObj;
        public int RatingId=1;

        protected void Page_Load(object sender, EventArgs e)
        {
            BALObj = new BAL();

            if (!IsPostBack)
            {
                RatingDropDownList.DataSource = BALObj.GetRatings();
                RatingDropDownList.DataTextField = "RatingName";
                RatingDropDownList.DataValueField = "RatingId";
                RatingDropDownList.DataBind();
            }
            
            
        }


        public void FillSearchGridView()
        {
            SearchResultGridView.DataSource = _dataTable;
            SearchResultGridView.DataBind();
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string name, genre, releaseDate, rating;
            
            name = NameTextBox.Text.ToString().Trim();
            genre = GenreTextBox.Text.ToString().Trim();
            releaseDate = ReleaseTextBox.Text.ToString().Trim();
            rating = RatingDropDownList.Text.ToString().Trim();

            ErrorLabel.Visible = false;

            if (name != "" || genre != "" || releaseDate != "" || rating != "")
            {
                try
                {

                    _dataTable = BALObj.SearchMovies(name, genre, releaseDate, rating);

                    FillSearchGridView();

                }

                catch (Exception)
                {
                    ErrorLabel.Visible = true;
                    ErrorLabel.Text = "Somthing went wrong";
                }
            }

            else
            {
                ErrorLabel.Visible = true;
                ErrorLabel.Text = "Input Error";
            }

            

        }

        protected void ResetButton_Click(object sender, EventArgs e)
        {
            NameTextBox.Text = "";
            GenreTextBox.Text = "";
            ReleaseTextBox.Text = "";
            RatingDropDownList.SelectedIndex = 0;
        }

        protected void SearchResultGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GridViewRow gridViewRow = SearchResultGridView.SelectedRow;
                DataTable dtMovieDetails, dtCastDetails;
                string id = gridViewRow.Cells[0].Text;

                dtMovieDetails = BALObj.GetMovieDetails(Convert.ToInt16(id));
                dtCastDetails = BALObj.GetCastDetails(Convert.ToInt16(id));

                DetailNameLabel.Text = dtMovieDetails.Rows[0][0].ToString();
                DetailDescriptionLabel.Text = dtMovieDetails.Rows[0][1].ToString();
                DetailReleaseLabel.Text = dtMovieDetails.Rows[0][2].ToString();
                DetailGenreLabel.Text = dtMovieDetails.Rows[0][3].ToString();
                DetailRatingLabel.Text = dtMovieDetails.Rows[0][4].ToString();

                DetailsGridView.DataSource = dtCastDetails;
                DetailsGridView.DataBind();
            }

            catch (Exception)
            {
                ErrorLabel.Visible = true;
                ErrorLabel.Text = "Somthing went wrong";
            }
        }

    }
}