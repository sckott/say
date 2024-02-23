## demo repo to demonstrate pull request preview deploys

Steps:

1. Netlify
	- Login https://app.netlify.com/
	- Add new site
	- Import an existing project
	- Deploy with GitHub
	- Find project, Click Deploy project
2. In your repo
	- Add a gh actions yml file with contents from https://github.com/getwilds/getwilds.github.io/blob/buttons/.github/workflows/preview.yaml
	- 
	- push the gh action file
3. Do a PR
	- Make a change on a branch
	- Push to the repo
	- Open a pull request
	- After a little while you should see a ping back from Netlify
