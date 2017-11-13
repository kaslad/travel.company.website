package dao;


import configs.DbSingleton;
import entities.Hotel;
import entities.Tour;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HotelDao implements HotelDaoInterface {
    @Override
    public Hotel getHotelById(int id) {
        String request = ("SELECT * FROM hotel where id = ?");
        try{
            PreparedStatement st = DbSingleton.getConnection().prepareStatement(request);
            ResultSet resultSet = st.executeQuery();
            return new Hotel(resultSet.getInt("id"), resultSet.getString("name"),
                    resultSet.getInt("count_star"),
                    resultSet.getString("description"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List getAllHotels() {
        String request = ("SELECT * FROM hotel");
        try {
            PreparedStatement st = DbSingleton.getConnection().prepareStatement(request);
            ResultSet resultSet = st.executeQuery();
            List<Hotel> a = new ArrayList<>();
            while (resultSet.next()) a.add(new Hotel(resultSet.getInt("id"), resultSet.getString("name"),
                    resultSet.getInt("count_star"),
                    resultSet.getString("description")));
            return a;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Hotel getHotelByName(String name) {
        String request = ("SELECT * FROM hotel where name = ?");
        try{
            PreparedStatement st = DbSingleton.getConnection().prepareStatement(request);
            ResultSet resultSet = st.executeQuery();
            return new Hotel(resultSet.getInt("id"), resultSet.getString("name"),
                    resultSet.getInt("count_star"),
                    resultSet.getString("description"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
