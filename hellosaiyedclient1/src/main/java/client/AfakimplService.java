
package client;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceException;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.9-b130926.1035
 * Generated source version: 2.2
 * 
 */
@WebServiceClient(name = "afakimplService", targetNamespace = "http://hellosaiyed/", wsdlLocation = "http://localhost:8082/hellosaiyed/HelloWorldWS?wsdl")
public class AfakimplService
    extends Service
{

    private final static URL AFAKIMPLSERVICE_WSDL_LOCATION;
    private final static WebServiceException AFAKIMPLSERVICE_EXCEPTION;
    private final static QName AFAKIMPLSERVICE_QNAME = new QName("http://hellosaiyed/", "afakimplService");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url = new URL("http://localhost:8082/hellosaiyed/HelloWorldWS?wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        AFAKIMPLSERVICE_WSDL_LOCATION = url;
        AFAKIMPLSERVICE_EXCEPTION = e;
    }

    public AfakimplService() {
        super(__getWsdlLocation(), AFAKIMPLSERVICE_QNAME);
    }

    public AfakimplService(WebServiceFeature... features) {
        super(__getWsdlLocation(), AFAKIMPLSERVICE_QNAME, features);
    }

    public AfakimplService(URL wsdlLocation) {
        super(wsdlLocation, AFAKIMPLSERVICE_QNAME);
    }

    public AfakimplService(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, AFAKIMPLSERVICE_QNAME, features);
    }

    public AfakimplService(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public AfakimplService(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     * 
     * @return
     *     returns Afak
     */
    @WebEndpoint(name = "afakimplPort")
    public Afak getAfakimplPort() {
        return super.getPort(new QName("http://hellosaiyed/", "afakimplPort"), Afak.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns Afak
     */
    @WebEndpoint(name = "afakimplPort")
    public Afak getAfakimplPort(WebServiceFeature... features) {
        return super.getPort(new QName("http://hellosaiyed/", "afakimplPort"), Afak.class, features);
    }

    private static URL __getWsdlLocation() {
        if (AFAKIMPLSERVICE_EXCEPTION!= null) {
            throw AFAKIMPLSERVICE_EXCEPTION;
        }
        return AFAKIMPLSERVICE_WSDL_LOCATION;
    }

}
