# hells-kitchen

![Untitled](https://user-images.githubusercontent.com/20118856/175762981-bc98f86a-4c04-4471-a67d-a7cdd5579fea.png)

## Uploading to repository



**To add changes to a commit**

`$ git add <file>` **OR** use stage button in editor

![image](https://user-images.githubusercontent.com/20118856/148621774-85b32bd8-2872-4f7e-b9da-0ae03c07494f.png)


**To commit changes for a feature**

`$ git commit -m "Changed player animations"` **OR** use commit button in editor

![image](https://user-images.githubusercontent.com/20118856/148621906-64d1df5a-b569-4e83-b505-e364bcf1dbf1.png)


**To push changes from PC to Github:**

`$ git push <remote> <branch>`

`$ git push origin main`
###### *Hint:* 'Origin' is the name we gave our computer for the remote repository.

<br>

## Downloading from repository

`$ git pull <remote> <branch>`  

`$ git pull origin main` **Your repository**

`$ git pull upstream main`  **Parent/Original repository**

<br>

## Initial setup

`$ git init`
###### *Hint:* Creates a local repository on your machine. Notice the hidden `.git` folder.

`$ git remote add origin https://github.com/<username>/<repository>.git`
###### *Hint:* 'Origin' is now a shorthand for that remote repository link.

`$ git remote add upstream https://github.com/arthur-schevey/CollegeRPG.git`

<br>

## FAQ

#### How do I see if my local repository is the same as the remote one?
`$ git status` 
#### How do I push changes if my local repository is behind the remote repo (fast-forward error)?
`$ git pull origin <branch>` OR `$ git push -f origin <branch>` (forces a push)
#### How do I see what remotes I have?
`$ git remote -v`
