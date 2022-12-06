package BusinessLogic.TurnManagement;

import javafx.collections.ObservableList;

public class TurnManager {
    private WorkshiftBoard wb;

    public TurnManager(){
        this.wb = new WorkshiftBoard();
    }

    public ObservableList<Turn> getTurns(){
        return wb.getTurns();
    }
}
