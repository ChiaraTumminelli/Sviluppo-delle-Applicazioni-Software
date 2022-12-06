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

public class TestCatERing2a {

    public static void main(String[] args) throws UseCaseLogicException, TaskException {
        try {

            System.out.println("TEST FAKE LOGIN");
            CatERing.getInstance().getUserManager().fakeLogin("Lidia");
            System.out.println(CatERing.getInstance().getUserManager().getCurrentUser());
            Menu.loadAllMenus();
            ServiceInfo service1 = ServiceInfo.loadServiceById(1);
            List<Turn> turns = CatERing.getInstance().getTurnManager().getTurns();
            System.out.println("\nTEST GENERATING SUMMARY SHEET");
            SummarySheet sheet1 = CatERing.getInstance().getTaskManager().createSheet(service1);
            System.out.println(sheet1);

            System.out.println("\nTEST TASK ASSIGNMENT (WITH COOK)");
            CatERing.getInstance().getTaskManager().assignTask(sheet1.getTasks().get(0), turns.get(0), User.loadUserById(5));
            System.out.println(sheet1);

            System.out.println("\nTEST TASK INFO DEFINITION");
            CatERing.getInstance().getTaskManager().setTaskDetails(sheet1.getTasks().get(0), 90, 2);
            System.out.println("Before removing: " + sheet1);

            System.out.println("\nTEST REMOVE TASK FROM SHEET");
            CatERing.getInstance().getTaskManager().deleteTask(sheet1.getTasks().get(0));
            System.out.println("After removing: " + sheet1);

            System.out.println("\nTEST RESET SHEET");
            CatERing.getInstance().getTaskManager().resetSheet(sheet1);
            System.out.println(sheet1);

        } catch (UseCaseLogicException | TaskException e) {
            System.out.println("ERROR IN EXTENTION 2a");
            e.printStackTrace();
        }
    }
}
