package BusinessLogic.TurnManagement;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.util.Map;

public class WorkshiftBoard {
    private Map<Integer, Turn> turns;

    public ObservableList<Turn> getTurns() {
        loadWorkshiftBoard();
        return FXCollections.observableArrayList(turns.values());
    }

    private void loadWorkshiftBoard() {
        turns = Turn.loadAllTurns();
    }
}
