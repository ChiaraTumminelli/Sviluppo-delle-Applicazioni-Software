package BusinessLogic.EventManagement;

import BusinessLogic.MenuManagement.Menu;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import Persistence.PersistenceManager;
import Persistence.ResultHandler;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

public class ServiceInfo implements EventItemInfo {
    private int id;
    private String name;
    private Date date;
    private Time timeStart;
    private Time timeEnd;
    private int participants;

    private Menu menuAssigned;

    public ServiceInfo(String name) {
        this.name = name;
    }

    public ServiceInfo(){}

    public static ServiceInfo loadServiceById(int id) {
        ServiceInfo service = new ServiceInfo();
        String query = "SELECT * FROM Service WHERE id=" + id;
        PersistenceManager.executeQuery(query, new ResultHandler() {
            @Override
            public void handle(ResultSet rs) throws SQLException {
                service.name = rs.getString("name");
                service.id = rs.getInt("id");
                service.date = rs.getDate("service_date");
                service.timeStart = rs.getTime("time_start");
                service.timeEnd = rs.getTime("time_end");
                service.menuAssigned = Menu.getMenuById(rs.getInt("id_menu"));
            }
        });
        return service;
    }


    public String toString() {
        return name + ": " + date + " (" + timeStart + "-" + timeEnd + "), " + participants + " pp.";
    }

    // STATIC METHODS FOR PERSISTENCE

    public static ObservableList<ServiceInfo> loadServiceInfoForEvent(int event_id) {
        ObservableList<ServiceInfo> result = FXCollections.observableArrayList();
        String query = "SELECT id, name, service_date, time_start, time_end, expected_participants " +
                "FROM Service WHERE event_id = " + event_id;
        PersistenceManager.executeQuery(query, new ResultHandler() {
            @Override
            public void handle(ResultSet rs) throws SQLException {
                String s = rs.getString("name");
                ServiceInfo serv = new ServiceInfo(s);
                serv.id = rs.getInt("id");
                serv.date = rs.getDate("service_date");
                serv.timeStart = rs.getTime("time_start");
                serv.timeEnd = rs.getTime("time_end");
                serv.participants = rs.getInt("expected_participants");
                result.add(serv);
            }
        });

        return result;
    }

    public Menu getMenuAssigned() {
        return menuAssigned;
    }

    public int getId() {
        return this.id;
    }
}
