package pkg;

import javax.jws.WebMethod;
import javax.jws.WebService;

@WebService
public interface helloserver {
	@WebMethod
 public String helloserver1 (String name);
}
