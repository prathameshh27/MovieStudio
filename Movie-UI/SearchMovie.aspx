<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="SearchMovie.aspx.cs" Inherits="Movie_UI.SearchMovie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Search Movies</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="QueryContentPlaceHolder" runat="server">
    <div>
        <table class="table-style">
            <tr>
                <td colspan="2" class="header">
                    <a>Search Movie</a>
                </td>
            </tr>
        
            <tr>
                <td>
                    <asp:Label ID="NameLabel" runat="server" Text="Movie Name" Width="100px"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="NameTextBox" runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="GenreLabel" runat="server" Text="Movie Genre"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="GenreTextBox" runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="ReleaseLabel" runat="server" Text="Release Date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="ReleaseTextBox" TextMode="Date" runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="RatingLabel" runat="server" Text="Movie Rating"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="RatingDropDownList" runat="server" AppendDataBoundItems="True" Width="155px">
                        <asp:ListItem Selected="True" Value="">Selected</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr><td></td></tr>

            <tr>
                <td></td>
                <td>
                    <asp:Button ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click" Width="75px" />
                    <asp:Button ID="ResetButton" runat="server" Text="Reset" OnClick="ResetButton_Click" Width="75px" />
                </td>
            </tr>
        
            <tr><td></td></tr>

        </table>
    </div>
        
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="TableContentPlaceHolder" runat="server">

    <div>
        <table class="table-style">
            <tr>
                <td colspan="3" class="header">
                    <a>Movie Details</a>
                </td>
            </tr>
            
            <tr>
                <td>
                    Movie Title
                </td>
                <td>
                    <asp:Label ID="DetailNameLabel" runat="server" Text=" " Width="150px"></asp:Label>
                </td>
                
                <td rowspan="5">
                    <div Class="gridview-style">
                        <asp:GridView ID="DetailsGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                            <Columns>
                                <asp:BoundField DataField="ActorName" HeaderText="Actor Name" SortExpression="ActorName" />
                                <asp:BoundField DataField="GenderName" HeaderText="Gender" SortExpression="GenderName" />
                                <asp:BoundField DataField="MovieCastRole" HeaderText="Role" SortExpression="MovieCastRole" />
                            </Columns>

                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            
                        </asp:GridView>            
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    Movie Description &nbsp;</td>
                <td>
                    <asp:Label ID="DetailDescriptionLabel" runat="server" Text=" " Width="150px"></asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                    Release Date<a> </a>
                </td>
                <td>
                    <asp:Label ID="DetailReleaseLabel" runat="server" Text=" " Width="150px"></asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                    Movie Genre
                </td>
                <td>
                    <asp:Label ID="DetailGenreLabel" runat="server" Text=" " Width="150px"></asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                    Critics Rating</td>
                <td>
                    <asp:Label ID="DetailRatingLabel" runat="server" Text=" " Width="150px"></asp:Label>
                </td>
            </tr>

            <%--<tr>
                <td colspan="2">
                    <div>
                        <asp:GridView ID="DetailsGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>            
                    </div>                
                </td>
            </tr>--%>
            
        </table>
    </div>
    
    

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="DetailsContentPlaceHolder" runat="server">
    
    <div class="error-style">
      <asp:Label  ID="ErrorLabel" runat="server" Width="100%" Font-Size="Large" Text=""></asp:Label>
    </div>
   
    <div>
        <asp:GridView ID="SearchResultGridView" runat="server" AutoGenerateColumns="False" CellPadding="5" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="SearchResultGridView_SelectedIndexChanged"  CellSpacing="1"  >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="MovieId" HeaderText="Movie ID" SortExpression="MovieId" />
                <asp:BoundField DataField="MovieTitle" HeaderText="Movie Title" SortExpression="MovieTitle" />
                <asp:BoundField DataField="GenreName" HeaderText="Movie Genre" SortExpression="GenreName" />
                <asp:BoundField DataField="MovieReleaseDate" HeaderText="Release Date" SortExpression="MovieReleaseDate" />
                <asp:BoundField DataField="RatingName" HeaderText="Movie Rating" SortExpression="RatingName" />
                <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Action" ShowHeader="True" Text="Full Details" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>
    
    
</asp:Content>