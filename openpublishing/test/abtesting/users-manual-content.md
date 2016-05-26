# User's Manual - Content Level A/B Testing

##Prerequisite:

![](./UM-Prerequisite.png)
- Please follow the step [How to Join the Microsoft GitHub Organization](http://https://opensourcehub.microsoft.com/articles/how-to-join-microsoft-github-org-self-service) to link your GitHub account with Microsoft organization.
- Read the CSI instruction to understand the process how to `CREATE` / `EDIT` / `COMMIT` Markdown file to GitHub. Use working branch before merge into Live environment which is always a **BEST PRACTISE**.

##Step-by-step: 

###Create a new experiment - Part I: Set up the experimental files.

- The A/B test requires two separate markdown files, the A variant, and the B variant. You may already have an A variant as an existing published page.
	
	![](./UM-New-Content-Experiment.png)
	1. Switch to your Stage branch. 
		- If you are working locally, switch to your local staging branch. The staging branch is whichever branch you use to commit changes that will be published to [stage endpoint](https://stage.docs.microsoft.com).
	
	2. Edit Variant A Page:
		- Edit your source file (Page A) by adding the following metadata::
			```
			experiment:true
			experiment_id:
			```
			- experiment_id is the unique id for your experiment. We recommend that your experiment id be of the form &lt;youralias&gt;-&lt;experimentname&gt;-&lt;date&gt;
	
	3. Create Variant B Page:
		- Create a Variant B page for the topic in the same folder using all of Page A’s original metadata. Add the experiment_id field and use the same experiment ID you created for the A variant.
		- Use the following file name structure when you save the Variant B page: &lt;sourcefilename&gt;.experimental.md. For example: 
			- If Variant A is CSI-demo.md, then Variant B should be CSI-demo.experimental.md

	4. Add and commit your changes.
	 	- If you are working locally, you will have to merge these local changes with the staging branch on GitHub with a pull request. If you are working on GitHub, simply commit the changes. Once the files are committed to the staging branch on GitHub,  it will automatically trigger the OP build for the staging branch.

	5. Preview the result from portal 
	
		- Open OP Portal, wait until the build is completed without error message  

	6. Open stage site and preview the result 
