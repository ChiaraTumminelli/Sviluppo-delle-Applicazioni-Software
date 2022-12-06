package BusinessLogic.RecipeManagement;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.util.ArrayList;

public class RecipeManager {

    private ArrayList<RecipeEventReceiver> eventReceivers;
    private CookBook cookbook = new CookBook();
    private KitchenTask currentKt;

    public RecipeManager() {
        Recipe.loadAllRecipes();
    }

    public ObservableList<Recipe> getRecipes() {
        return FXCollections.unmodifiableObservableList(Recipe.getAllRecipes());
    }


    // ---------------------------- EVENT SENDER METHODS ----------------------------

    private void notifyKitchenTaskCreated(KitchenTask kt){
        for (RecipeEventReceiver er : eventReceivers){
            er.updateKitchenTaskCreated(kt);
        }
    }

    private void notifyStepAdded(KitchenTask kt, Step step){
        for(RecipeEventReceiver er : eventReceivers){
            er.updateStepAdded(kt,step);
        }
    }

    private void notifyPrepExtracted(KitchenTask kt, Preparation preparation){
        for(RecipeEventReceiver er : eventReceivers){
            er.updatePrepExtracted(kt,preparation);
        }
    }

}
