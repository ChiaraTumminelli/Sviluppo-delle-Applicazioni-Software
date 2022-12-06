package Test.TestKitchenTasks;

import BusinessLogic.CatERing;
import BusinessLogic.EventManagement.ServiceInfo;
import BusinessLogic.General.TaskException;
import BusinessLogic.General.UseCaseLogicException;
import BusinessLogic.MenuManagement.Menu;
import BusinessLogic.TaskManagement.SummarySheet;
import BusinessLogic.TurnManagement.Turn;
import BusinessLogic.UserManagement.User;

import java.util.List;

public class TestCatERing {
    public static void main(String[] args) throws UseCaseLogicException, TaskException {
        try {
            System.out.println("TEST FAKE LOGIN");
            CatERing.getInstance().getUserManager().fakeLogin("Lidia");
            System.out.println(CatERing.getInstance().getUserManager().getCurrentUser());
            Menu.loadAllMenus();
            ServiceInfo service = ServiceInfo.loadServiceById(1);

            System.out.println("\nTEST GENERATE SUMMARY SHEET");
            SummarySheet sheet = CatERing.getInstance().getTaskManager().createSheet(service);
            System.out.println(sheet);

            System.out.println("\nTEST REORDER SUMMARY SHEET TASKS");
            CatERing.getInstance().getTaskManager().sortTask(sheet.getTasks().get(0), 3);
            System.out.println(sheet);

            System.out.println("\nTEST GET WORKSHIFTBOARD");
            List<Turn> turns = CatERing.getInstance().getTurnManager().getTurns();
            System.out.println(turns);

            System.out.println("\nTEST TASK ASSIGNMENT (WITH COOK), FIRST TASK");
            CatERing.getInstance().getTaskManager().assignTask(sheet.getTasks().get(0), turns.get(0), User.loadUserById(5));
            System.out.println(sheet);

            System.out.println("\nTEST TASK ASSIGNMENT (WITH COOK), SECOND TASK");
            CatERing.getInstance().getTaskManager().assignTask(sheet.getTasks().get(1), turns.get(0), User.loadUserById(5));
            System.out.println(sheet);

            System.out.println("\nTEST TASK ASSIGNMENT (NO COOK), THIRD TASK");
            CatERing.getInstance().getTaskManager().assignTask(sheet.getTasks().get(2), turns.get(0));
            System.out.println(sheet);

            System.out.println("\nTEST TASK INFO DEFINITION");
            CatERing.getInstance().getTaskManager().setTaskDetails(sheet.getTasks().get(0), 90, 2);
            System.out.println(sheet);

        } catch (UseCaseLogicException | TaskException e) {
            System.out.println("ERRORE SULLO SCENARIO PRINCIPALE\t" + e);
        }
    }
}
