package BusinessLogic.RecipeManagement;

import BusinessLogic.UserManagement.User;

import java.util.ArrayList;

public class KitchenTask {
    private String name;
    private boolean published;
    private String description;
    private int id;
    private ArrayList<Step> early;
    private ArrayList<Step> place;
    private Timing timing;
    private ArrayList<Tag> tags;
    private User owner;
    private User author;
    private ArrayList<Ingredient> ingredients;

    // ---------------------------- OPERATION METHODS ----------------------------
    public int getId() {
        return this.id;
    }
}
