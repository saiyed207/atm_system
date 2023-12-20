package pkg;

import javax.jws.WebMethod;
import javax.jws.WebService;

@WebService(endpointInterface="pkg.helloserver")
public class newserverImpl implements helloserver {

	@WebMethod
	public String helloserver1(String name) {
		// TODO Auto-generated method stub
		return "welcome" + name;
	}

	

}
