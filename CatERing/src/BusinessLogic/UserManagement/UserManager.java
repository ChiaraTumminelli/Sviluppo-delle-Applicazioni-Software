package BusinessLogic.UserManagement;

public class UserManager {
    private User currentUser;

    public void fakeLogin(String username)
    {
        this.currentUser = User.loadUser(username);
    }

    // Operation methods

    //Method to get current user
    public User getCurrentUser() {
        return this.currentUser;
    }
}
