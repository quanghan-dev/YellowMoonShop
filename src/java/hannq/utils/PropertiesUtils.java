package hannq.utils;

import java.io.Serializable;
import java.util.Properties;
import java.io.IOException;

/**
 *
 * @author Han Quang
 */
public class PropertiesUtils implements Serializable{
    private static final String FILE_CONFIG = "dispatcher.properties";
    
    public String getProperties(String resource) throws IOException{
        Properties properties = new Properties();
        properties.load(getClass().getClassLoader().getResourceAsStream(FILE_CONFIG));
        return properties.getProperty(resource);
    }
}
