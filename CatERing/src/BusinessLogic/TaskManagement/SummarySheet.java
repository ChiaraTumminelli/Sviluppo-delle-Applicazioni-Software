package BusinessLogic.TaskManagement;

import BusinessLogic.EventManagement.ServiceInfo;
import BusinessLogic.MenuManagement.Menu;
import BusinessLogic.RecipeManagement.KitchenTask;
import BusinessLogic.RecipeManagement.Recipe;
import BusinessLogic.UserManagement.User;
import Persistence.BatchUpdateHandler;
import Persistence.PersistenceManager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SummarySheet {

    private int id;
    private ArrayList<Task> tasks;
    private User creator;
    private ServiceInfo serviceAssigned;

    public static final String YELLOW_BOLD = "\033[1;33m";
    public static final String TEXT_RESET = "\u001B[0m";

    // ---------------------------- PERSISTENCE METHODS ----------------------------
    
    public static void saveSheet(SummarySheet sheet, Menu m) {
        String sheetInsert = "INSERT INTO catering.Summarysheet (id_chef, id_service) VALUES (?, ?);";
        int[] result = PersistenceManager.executeBatchUpdate(sheetInsert, 1, new BatchUpdateHandler() {
            @Override
            public void handleBatchItem(PreparedStatement ps, int batchCount) throws SQLException {
                ps.setInt(1, sheet.creator.getId());
                ps.setInt(2, sheet.serviceAssigned.getId());
            }

            @Override
            public void handleGeneratedIds(ResultSet rs, int count) throws SQLException {
                if (count == 0) {
                    sheet.id = rs.getInt(1);
                }
            }
        });
        if (result[0] > 0) {
            // SAVING ALL SHEET'S TASKS TOO
            Task.saveAllNewTasks(sheet, m);
        }
    }

    public static void reorderTasks(SummarySheet sheet) {
        String upd = "UPDATE catering.Task SET position = ? WHERE id = ?";
        PersistenceManager.executeBatchUpdate(upd, sheet.getTasks().size(), new BatchUpdateHandler() {
            @Override
            public void handleBatchItem(PreparedStatement ps, int batchCount) throws SQLException {
                ps.setInt(1, batchCount);
                ps.setInt(2, sheet.getTasks().get(batchCount).getId());
            }

            @Override
            public void handleGeneratedIds(ResultSet rs, int count) throws SQLException {
            }
        });
    }

    public static void setAssignment(Task task) {
        String update = "UPDATE Task SET " +
                "`id_turn` = " + task.getTurnAssigned().getId() + ", " +
                "`id_cook` = " + (task.getCookAssigned() == null ? "null" : task.getCookAssigned().getId()) + "" +
                " WHERE `id` = " + task.getId();
        PersistenceManager.executeUpdate(update);
    }

    public static void setDetails(Task task) {
        String update = "UPDATE Task SET " +
                "`timeEstimate` = " + task.getTimeEstimate() + ", " +
                "`quantity` = " + task.getQuantity() + "" +
                " WHERE `id` = " + task.getId();
        PersistenceManager.executeUpdate(update);
    }

    // ---------------------------- OPERATION METHODS ----------------------------

    public void initSheet() {
        Menu menuAssigned = this.serviceAssigned.getMenuAssigned();
        ArrayList<Recipe> allRecipes = menuAssigned.getAllRecipes();
        for (Recipe recipe : allRecipes) {
            tasks.add(new Task(recipe));
        }
    }

    public void resetSheet() {
        this.tasks = new ArrayList<>();
        initSheet();
    }


    public ArrayList<Task> getTasks() {
        return this.tasks;
    }

    public SummarySheet(ServiceInfo ser, User currentUser) {
        this.creator = currentUser;
        this.serviceAssigned = ser;
        tasks = new ArrayList<>();
    }

    public Task addTask(KitchenTask kt) {
        Task task = new Task(kt);
        tasks.add(task);
        return task;
    }

    public void addTask(Task task, int position) {
        this.tasks.add(position, task);
    }

    public void removeTask(Task task) {
        this.tasks.remove(task);
    }

    public boolean containsTask(Task task) {
        return this.tasks.contains(task);
    }

    public int tasksSize() {
        return this.tasks.size();
    }

    public boolean isCreator(User user) {
        return (user.getId() == creator.getId());
    }


    public ServiceInfo getServiceAssigned() {
        return serviceAssigned;
    }

    public int getTaskIndex(Task task) {
        return tasks.indexOf(task);
    }

    @Override
    public String toString() {
        return "-SUMMARY SHEET-" + YELLOW_BOLD +
                "\n| ID: " + TEXT_RESET + id + YELLOW_BOLD +
                "\n| Creator: " + TEXT_RESET+ creator + YELLOW_BOLD +
                "\n| Tasks: " + TEXT_RESET+ tasks + YELLOW_BOLD +
                "\n| Service Assigned: " + TEXT_RESET+ serviceAssigned +
                "\n--------------";
    }

    public int getId() {
        return id;
    }
}

