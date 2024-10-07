const { SecretManagerServiceClient } = require('@google-cloud/secret-manager');
const { Storage } = require('@google-cloud/storage');


const secretManagerClient = new SecretManagerServiceClient();


const storage = new Storage();

exports.readSecret = async (req, res) => {
  try {
   
    const secretName = 'projects/devops-t2-development/secrets/abalabanovic-secret/versions/latest';

    
    const [version] = await secretManagerClient.accessSecretVersion({ name: secretName });

   
    const secretPayload = version.payload.data.toString('utf8');
    
    console.log(`Secret: ${secretPayload}`);

    
    const bucketName = 'abalabanovic-read-bucket';
    const bucket = storage.bucket(bucketName);

    
    const [files] = await bucket.getFiles();

   
    const fileNames = files.map(file => file.name);
    console.log('Files in bucket:', fileNames);

    
    res.status(200).send({
      secret: secretPayload,
      files: fileNames
    });

  } catch (err) {
    console.error(`Error: ${err}`);
    res.status(500).send('Error accessing secret or listing bucket files');
  }
};