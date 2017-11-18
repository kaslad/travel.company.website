package services;

import dao.ConcreteTourDao;
import entities.ConcreteTour;
import entities.Tour;
import entities.TourHotel;
import helpers.MyError;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

public class ConcreteTourService implements ConcereteTourServiceInterface {
    private ConcreteTourDao concreteTourDao;
    MyError err = null;
    public ConcreteTourService(){
        ConcreteTourDao concreteTourDao = new ConcreteTourDao();
    }
    @Override
    public List<ConcreteTour> getAllConcreteTours() {
        return null;
    }

    @Override
    public ConcreteTour getConcreteTourById(int id) {
        return null;
    }

    @Override
    public List<ConcreteTour> getAllConcreteToursByTourId(int id) {

        List<ConcreteTour> list = concreteTourDao.getAllConcreteToursByTourId(id);
        err = null;

        if(list == null){
            err = new MyError("", "No concrete Tours by id = " + id);
            return null;
        }
        return list;
    }

    @Override
    public Map<TourHotel, List<ConcreteTour>> getTourAndItsConcreteTours(String fromCity, String toCity, Calendar fromDate, Calendar toDate, int fromPrice, int toPrice) {

        Map<TourHotel, List<ConcreteTour>> map = null;
        map = concreteTourDao.getAllConcreteToursByTourParams(fromCity, toCity, fromDate, toDate, fromPrice, toPrice);

        err = null;

        if(map == null){
            err = new MyError("", "No tours and its Concrete Tours by this request = " );
            return null;
        }
        return map;
    }

}
