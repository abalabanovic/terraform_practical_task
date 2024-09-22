const { SecretManagerServiceClient } = require('@google-cloud/secret-manager');

// Initialize the Secret Manager client
const client = new SecretManagerServiceClient();

exports.readSecret = async (req, res) => {
  try {
    // Replace 'my-secret' with the actual secret name
    const secretName = 'projects/devops-t2-development/secrets/abalabanovic-secret/versions/latest';

    // Access the secret version
    const [version] = await client.accessSecretVersion({ name: secretName });

    // Extract the secret payload
    const secretPayload = version.payload.data.toString('utf8');
    
    console.log(`Secret: ${secretPayload}`);
    
    // Send the secret payload in the HTTP response
    res.status(200).send(`Secret: ${secretPayload}`);
  } catch (err) {
    console.error(`Error accessing secret: ${err}`);
    res.status(500).send('Error accessing secret');
  }
};
