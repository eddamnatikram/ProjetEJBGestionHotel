import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import dao.IDaoRemote;
import entities.Hotel;
import entities.Ville;

public class TestHotel {
    public static IDaoRemote<Hotel> lookUpHotelRemote() throws NamingException {
        final Hashtable jndiProperties = new Hashtable();
        jndiProperties.put(Context.INITIAL_CONTEXT_FACTORY, "org.wildfly.naming.client.WildFlyInitialContextFactory");
        jndiProperties.put(Context.PROVIDER_URL, "http-remoting://localhost:8380");
        final Context context = new InitialContext(jndiProperties);

        return (IDaoRemote<Hotel>) context.lookup("ejb:ISICEJBEAR/ISICEJBServer/hotelService!dao.IDaoRemoteHotel");
    }

    public static void main(String[] args) {
        try {
            IDaoRemote<Hotel> dao = lookUpHotelRemote();
            dao.create(new Hotel("Hotel1", "EljadidaMorroco", "0621242526", new Ville("El Jadida")));

            for (Hotel h : dao.findAll()) {
                System.out.println(h.getNom());
            }
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }
}
