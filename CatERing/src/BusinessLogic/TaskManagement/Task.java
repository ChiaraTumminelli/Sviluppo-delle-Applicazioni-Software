package BusinessLogic.TaskManagement;

import BusinessLogic.MenuManagement.Menu;
import BusinessLogic.RecipeManagement.KitchenTask;
import BusinessLogic.TurnManagement.Turn;
import BusinessLogic.UserManagement.User;
import Persistence.BatchUpdateHandler;
import Persistence.PersistenceManager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Task {

    private int id;
    private boolean completed;
    private int timeEstimate;
    private int quantity;
    private Turn turnAssigned;
    private User cookAssigned;
    private KitchenTask ktAssigned;

    public static final String TEXT_CYAN = "\u001B[36m";

    public static final String TEXT_RESET = "\u001B[0m";

    public Task(KitchenTask tkAssigned) {
        this.ktAssigned = tkAssigned;
    }

    // ---------------------------- PERSISTENCE METHODS ----------------------------
    
    public static void saveAllNewTasks(SummarySheet sheet, Menu m) {
        String sheetInsert = "INSERT INTO catering.Task (id_sheet, id_recipe, position) VALUES (?, ?, ?);";
        int[] result = PersistenceManager.executeBatchUpdate(sheetInsert, m.getAllRecipes().size(), new BatchUpdateHandler() {
            @Override
            public void handleBatchItem(PreparedStatement ps, int batchCount) throws SQLException {
                ps.setInt(1, sheet.getId());
                ps.setInt(2, m.getAllRecipes().get(batchCount).getId());
                ps.setInt(3, batchCount);
            }

            @Override
            public void handleGeneratedIds(ResultSet rs, int count) throws SQLException {
                sheet.getTasks().get(count).id = rs.getInt(1);
            }
        });
    }

    public static void saveNewTask(int sheet_id, Task task, int p_index) {
        String taskInsert = "INSERT INTO catering.Task (id_sheet, position, id_recipe) " + "VALUES (" + sheet_id + ", " + p_index + ", " + task.getKtAssigned().getId() + ");";
        PersistenceManager.executeUpdate(taskInsert);
        task.id = PersistenceManager.getLastId();
    }

    public static void resetTasks(SummarySheet sheet) {
        deleteAllTasks(sheet);
        saveAllNewTasks(sheet, sheet.getServiceAssigned().getMenuAssigned());
    }


    public static void deleteTask(Task task) {
        String taskDelete = "DELETE FROM Task WHERE id = " + task.getId();
        PersistenceManager.executeUpdate(taskDelete);
    }

    private static void deleteAllTasks(SummarySheet sheet) {
        String deleteAll = "DELETE FROM Task WHERE id_sheet = " + sheet.getId();
        PersistenceManager.executeUpdate(deleteAll);
    }

    public static void setTaskCompleted(Task task) {
        String deleteAll = "UPDATE Task SET completed = 1 WHERE id = " + task.getId();
        PersistenceManager.executeUpdate(deleteAll);
    }

    public static void setCookChanged(Task task) {
        String update = "UPDATE Task SET id_cook = " + (task.getCookAssigned() == null ? "null" : task.getCookAssigned().getId()) +
                " WHERE id = " + task.getId();
        PersistenceManager.executeUpdate(update);
    }

    public static void setTurnChanged(Task task) {
        String deleteAll = "UPDATE Task SET id_turn = " + task.getTurnAssigned().getId() +
                " WHERE id = " + task.getId();
        PersistenceManager.executeUpdate(deleteAll);
    }

    public static void taskTimeChanged(Task task) {
        String deleteAll = "UPDATE Task SET timeEstimate = " + task.getTimeEstimate() +
                " WHERE id = " + task.getId();
        PersistenceManager.executeUpdate(deleteAll);
    }

    public static void taskQuantityChanged(Task task) {
        String deleteAll = "UPDATE Task SET quantity = " + task.getQuantity() +
                " WHERE id = " + task.getId();
        PersistenceManager.executeUpdate(deleteAll);
    }

    // ---------------------------- OPERATION METHODS ----------------------------

    public void assignTask(Turn turn, User cook) {
        this.turnAssigned = turn;
        this.cookAssigned = cook;
    }

    public void setCompleted(boolean toAssign) {
        this.completed = toAssign;
    }

    public void setDetails(int timeEstimate, int quantity) {
        this.timeEstimate = timeEstimate;
        this.quantity = quantity;
    }

    public int getId() {
        return this.id;
    }

    public Turn getTurnAssigned() {
        return this.turnAssigned;
    }

    public void setTurnAssigned(Turn toAssign) {
        this.turnAssigned = toAssign;
    }

    public User getCookAssigned() {
        return this.cookAssigned;
    }

    public void setCookAssigned(User toAssign) {
        this.cookAssigned = toAssign;
    }

    private KitchenTask getKtAssigned() {
        return this.ktAssigned;
    }

    public int getTimeEstimate() {
        return this.timeEstimate;
    }
    public void setTimeEstimate(int timeEstimate) {
        this.timeEstimate = timeEstimate;
    }
    public int getQuantity() {
        return this.quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "\n\t\t " + TEXT_CYAN + "Task ID: " + TEXT_RESET + id + TEXT_CYAN +
                "\t\t\t Kitchen Task Assigned: " + TEXT_RESET + ktAssigned + TEXT_CYAN +
                "\t\t\t Turn Assigned: " + TEXT_RESET + turnAssigned + TEXT_CYAN +
                "\t\t\t Cook Assigned: " + TEXT_RESET + cookAssigned + TEXT_CYAN +
                "\t\t\t Time Estimate: " + TEXT_RESET + timeEstimate + TEXT_CYAN +
                "\t\t\t Completed: " + TEXT_RESET + completed + TEXT_CYAN +
                "\t\t\t Quantity: " + TEXT_RESET + quantity;
    }
}
