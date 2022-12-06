package BusinessLogic;

import BusinessLogic.EventManagement.EventManager;
import BusinessLogic.MenuManagement.MenuManager;
import BusinessLogic.RecipeManagement.RecipeManager;
import BusinessLogic.TaskManagement.TaskManager;
import BusinessLogic.TurnManagement.TurnManager;
import BusinessLogic.UserManagement.UserManager;
import Persistence.MenuPersistence;

public class CatERing {
    private static CatERing singleInstance;

    public static CatERing getInstance() {
        if (singleInstance == null) {
            singleInstance = new CatERing();
        }
        return singleInstance;
    }

    private MenuManager menuMgr;
    private RecipeManager recipeMgr;
    private UserManager userMgr;
    private EventManager eventMgr;
    private TaskManager taskMgr;
    private TurnManager turnMgr;
    private MenuPersistence menuPersistence;

    private CatERing() {
        menuMgr = new MenuManager();
        recipeMgr = new RecipeManager();
        userMgr = new UserManager();
        eventMgr = new EventManager();
        menuPersistence = new MenuPersistence();
        taskMgr = new TaskManager();
        turnMgr = new TurnManager();
        menuMgr.addEventReceiver(menuPersistence);
    }


    public MenuManager getMenuManager() {
        return menuMgr;
    }

    public RecipeManager getRecipeManager() {
        return recipeMgr;
    }

    public UserManager getUserManager() {
        return userMgr;
    }
    public EventManager getEventManager() { return eventMgr; }

    public TaskManager getTaskManager() { return taskMgr; }

    public TurnManager getTurnManager() { return turnMgr; }
}
