package Test.TestKitchenTasks;

import BusinessLogic.CatERing;
import BusinessLogic.EventManagement.ServiceInfo;
import BusinessLogic.General.UseCaseLogicException;
import BusinessLogic.MenuManagement.Menu;
import BusinessLogic.TaskManagement.SummarySheet;

public class TestCatERing5a {
    public static void main(String[] args) throws UseCaseLogicException {
        try {
            System.out.println("TEST FAKE LOGIN");
            CatERing.getInstance().getUserManager().fakeLogin("Lidia");
            System.out.println(CatERing.getInstance().getUserManager().getCurrentUser());
            Menu.loadAllMenus();
            ServiceInfo service1 = ServiceInfo.loadServiceById(1);

            System.out.println("\nTEST GENERATING SUMMARY SHEET");
            SummarySheet sheet1 = CatERing.getInstance().getTaskManager().createSheet(service1);
            System.out.println(sheet1);

            System.out.println("\nTEST SET TASK COMPLETED");
            CatERing.getInstance().getTaskManager().setTaskCompleted(sheet1.getTasks().get(0));
            System.out.println(sheet1);

        } catch (Exception e) {
            System.out.println("ERROR IN EXTENTION 5a");
            e.printStackTrace();
        }
    }
}
