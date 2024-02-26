## demo repo to demonstrate pull request preview deploys

**Steps**

1. Netlify
	- Login https://app.netlify.com/
	- Add new site
	- Import an existing project
	- Deploy with GitHub
	- Find project, Click Deploy project
	- Go to Site Configuration > Build & Deploy
		- Under Repository, unlink the repository so it's only hosting deploys you push to it from GitHub
	- Get a Netlify auth token
		- User settings > Applications > Personal access tokens > New access token
			- Give a description
			- Set expiration
			- Make sure to save your token somewhere you won't lose it
			- Set a reminder to rotate token if you didn't choose no expiration date

Using CLI tools:
- `netlify login` (login to Netlify)
- inside your project
	- `netlify init` 
	- `netlify open` to go the netlify page for the app. Site Configuration > Build & Deploy > Unlink github repo


2. In your GitHub repository
	- Add the token as an env var as `NETLIFY_AUTH_TOKEN` to your repo
		- Settings > Secrets and variables > Repository secrets, then click New repository secret. Set the name as `NETLIFY_AUTH_TOKEN` and the value as the token you just generated at Netlify
	- Permissions changes
		- Go to Settings > Actions > General, then change Workflow permissions to **Read and write permissions**, so that workflows have read and write permissions in the repository for all scopes. 

Using CLI tools:
- `gh secret set NETLIFY_AUTH_TOKEN -a actions -b <your token>`
- (looks like one cannot change workflow permissions from cli)

3. Setup the workflow file
	- Add a gh actions yml file with contents from https://github.com/getwilds/getwilds.github.io/blob/buttons/.github/workflows/preview.yaml
		- set the NETLIFY_SITE_ID to the site id in the Configuration page of your Netlify app
	- push the gh action file

Using CLI tools:
- not sure, possibly https://docs.github.com/en/actions/using-workflows/creating-starter-workflows-for-your-organization organization wide "starter workflows"?

4. Do a PR
	- Make a change on a branch
	- Push to the repo
	- Open a pull request
	- After a little while you should see a ping back from Netlify! like this:
	
![screenshot of deploy preview in a pull request](deploy-preview.png)

