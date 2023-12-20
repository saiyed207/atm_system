package hellosaiyed;

import javax.jws.WebMethod;
import javax.jws.WebService;
@WebService
public interface afak {
   

    // Modify the method to accept a String argument for PIN
    @WebMethod
    String getUserInfoByPin(String pin);

    // You may add additional service methods here if needed
}
