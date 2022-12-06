package BusinessLogic.TaskManagement;

import BusinessLogic.MenuManagement.Menu;

public interface TaskEventReceiver {

    void updateSheetCreated(SummarySheet sheet, Menu m);

    void updateSheetReset(SummarySheet sheet);

    void updateTasksSorted(SummarySheet sheet);

    void updateTaskAdded(SummarySheet sheet, Task task);

    void updateTaskDeleted(Task task);

    void updateTaskAssigned(Task task);

    void updateTaskCompleted(Task task);

    void updateCookChanged(Task task);

    void updateCookRemoved(Task task);

    void updateTurnChanged(Task task);

    void updateTaskDetailed(Task task);

    void updateTaskTimeChanged(Task task);

    void updateTaskQuantityChanged(Task task);


}
