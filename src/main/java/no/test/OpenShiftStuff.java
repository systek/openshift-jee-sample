package no.test;

import com.openshift.restclient.ClientBuilder;
import com.openshift.restclient.IClient;
import com.openshift.restclient.NoopSSLCertificateCallback;
import com.openshift.restclient.model.IList;
import com.openshift.restclient.model.IResource;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class OpenShiftStuff {

    private final IClient client;
    private final String namespace;

    public OpenShiftStuff() throws IOException {
        String host = System.getenv("KUBERNETES_SERVICE_HOST");
        String port = System.getenv("KUBERNETES_SERVICE_PORT");
        String token = new String(Files.readAllBytes(Paths.get("/run/secrets/kubernetes.io/serviceaccount/token")), "UTF-8");
        namespace = new String(Files.readAllBytes(Paths.get("/run/secrets/kubernetes.io/serviceaccount/namespace")), "UTF-8");
        client = new ClientBuilder("https://" + host + ":" + port).usingToken(token)
                .sslCertCallbackWithDefaultHostnameVerifier(false)
                .sslCertificateCallback(new NoopSSLCertificateCallback())
                .build();
    }

    public List<String> getRunningPods() {
        IList build = client.get("builds", namespace);
        List<String> builds = new ArrayList<String>();
        int counter = 0;
        for(IResource r : build.getItems()) {
            counter++;
            builds.add("Build #" + counter + r.getName());
        }
        return builds;
    }

    
}
