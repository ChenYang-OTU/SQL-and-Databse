import java.sql.*;

import javax.naming.spi.DirStateFactory.Result;

public class DBconnect {

    private final String url =  "jdbc:postgresql://localhost:5432/Movie";
    private final String user = "postgres";
    private final String password = "jas8324938";
    
    public Connection connect() throws SQLException {
            return DriverManager.getConnection(url, user, password);

    }

    //without para
    public void insertMovies(){
        Strng sql1 = "Insert Into \"Movie\" (movie_title, release_date, rating, budget, gross) Values ('movie1', '2020-02-01', 'PG-16', 45320000, 1635000)"; 
        try(Connection conn = connect()){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql1);
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }

        Strng sql2 = "Insert Into genre (genre_name, description) Values ('Advanture', 'sword and magic')"; 
        try(Connection conn = connect()){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql2);
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        Strng sql3 = "Insert Into \"Festival\" (festival_name, description) Values ('Festival1', 'Korean movie festival')"; 
        try(Connection conn = connect()){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql3);
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }

        Strng sql4 = "Insert Into reward (reward_name, category) Values ('Best actor', 'actor')"; 
        try(Connection conn = connect()){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql4);
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }

        Strng sql5 = "Insert Into \"Location\" (city_name, state_name, country_name) Values ('New York', 'New York', 'U.S.A')"; 
        try(Connection conn = connect()){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql5);
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }

        Strng sql6 = "Insert Into educational_department (\"University_name\", location_id) Values ('NYU', (Select location_id From \"Location\" Where city_name = 'New York'))"; 
        try(Connection conn = connect()){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql6);
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }

        Strng sql7 = "Insert Into \"Actors\" (actor_name, \"University_name\", location_id, birth_date, birth_location, eye_color) Values ('Name 1', (SELECT \"University_name\" From educational_department Where \"University_name\"='NYU'), (SELECT location_id From \"Location\" Where city_name = 'New York'), '2000-02-10', 'Toronto', 'Blue')"; 
        try(Connection conn = connect()){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql7);
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }

        Strng sql8 = "Insert Into \"Director\" (director_name, location_id, \"University_name\", birth_date, birth_location) Values ('Name 2', (SELECT location_id From \"Location\" Where city_name = 'Toronto'), (SELECT \"University_name\" From educational_department Where \"University_name\"='University of Toronto'), '1960-10-09', 'London'))"; 
        try(Connection conn = connect()){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql8);
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }

        Strng sql9 = "Insert into \"Cinemas\" (cinema_name, location_id, location_name, type_cinema) Values ('Cinema City', (SELECT location_id From \"Location\" Where city_name = 'Toronto'), 'North York', 'Cool')"; 
        try(Connection conn = connect()){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql9);
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }

        Strng sql10 = "Insert into ticket (movie_name, cinema_name, location_id, price, time, duration, date) Values ('Noobs', 'Crab City', (SELECT location_id From \"Location\" Where city_name = 'Vancouver'), 20, 1606, 120, '2020-05-01')"; 
        try(Connection conn = connect()){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql10);
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }

        String sql11 = "Insert into cinema_movice (cinema_name, movie_title, location_id) Values ('Carb City','It',((Select location_id From \"Location\" Where city_name= 'Toronto'))";
        try(Connection conn = connect()){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql11);
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        
        Strng sql12 = "Insert into festival_movie (festival_name, movie_title) Values ('festival3', 'It')"; 
        try(Connection conn = connect()){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql12);
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }

        Strng sql13 = "Insert into movie_actors (movie_title, actor_name) Values ('It', 'name1')"; 
        try(Connection conn = connect()){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql13);
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }

        Strng sql14 = "Insert into movie_director (movie_title, director_name) Values ('It', 'Name 2')";
        try(Connection conn = connect()){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql14);
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }

        Strng sql15 = "Insert into movie_genre (movie_title, genre_name) Values ('It', 'Horror')";
        try(Connection conn = connect()){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql15);
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }

        Strng sql16 = "Insert into reward_movie (reward_name, movie_title) values ('Best Actor', 'It')";
        try(Connection conn = connect()){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql16);
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
    }

    //without para
    public void findMovie_budgetCAD(){
        String sql = "Select movie_title, budget *1.3 As \"CAD\" From \"Movie\" ";
        try(Connection conn = connect();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql)){
            displayResult1(rs);
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
    }
    //with para
    public void findActor_eye(String color){
        //quert string -- note the ?
        String sql1_1= "Select actor_name From \"Actors\" Where eye = ?" ;
        try (Connection conn = connect();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
                pstmt.setString(1,color);
                ResultSet rs = pstmt.executeQuery();
                displayResult2(rs);
            }catch(SQLException ex){
                System.out.println(ex.getMessage());
            }

    }

    public void findMovie(String genre){
        //quert string -- note the ?
        String sql= "Select movie_title From movie_genre Where genre_name = ?" ;
        try (Connection conn = connect();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
                pstmt.setString(1,genre);
                ResultSet rs = pstmt.executeQuery();
                displayResult3(rs);
            }catch(SQLException ex){
                System.out.println(ex.getMessage());
            }
    }

    public void findMovie_title(String name){
        //quert string -- note the ?
        String sql= "Select movie_title From movie_director Where director_name = ?" ;
        try (Connection conn = connect();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
                pstmt.setString(1,name);
                ResultSet rs = pstmt.executeQuery();
                displayResult4(rs);
            }catch(SQLException ex){
                System.out.println(ex.getMessage());
            }
    }

    public void displayResult1(ResultSet rs) throws SQLException {
        while(rs.next()){
            System.out.println(rs.getString("movie_title")+ "\t"
                                + rs.getInt("budget"));
        }
    }

    public void displayResult2(ResultSet rs) throws SQLException {
        while(rs.next()){
            System.out.println(rs.getString("actor_name"));
        }
    }

    public void displayResult3(ResultSet rs) throws SQLException {
        while(rs.next()){
            System.out.println(rs.getString("movie_title"));
        }
    }

    public void displayResult4(ResultSet rs) throws SQLException {
        while(rs.next()){
            System.out.println(rs.getString("movie_title"));
        }
    }


    public static void main (String[] args){
        DBconnect app = new DBconnect();
        try {
            app.connect();
            System.out.println("Successful Connection.");
            app.insertMovies();
            app.findMovie_budgetCAD();
            app.findActor_eye("Green");
            app.findMovie("Comedy");
            app.findMovie_title("Mike Amma");

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }    
    }

}

