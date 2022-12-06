package BusinessLogic.RecipeManagement;

public interface RecipeEventReceiver {

    void updateKitchenTaskCreated(KitchenTask kt);

    void updateStepAdded(KitchenTask kt, Step step);

    void updatePrepExtracted(KitchenTask kt, Preparation preparation);
}
