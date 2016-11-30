---
ms.prod: vs-devops-alm
ms.technology: vs-devops-integrate
title: Teams | REST API Reference for Visual Studio Team Services and Team Foundation Server
description: Work with teams programmatically using the REST APIs for Visual Studio Team Services and Team Foundation Server.
ms.assetid: 5DF98D4C-7E59-4C44-B495-D664AC2AC71B
ms.manager: douge
ms.author: elbatk
ms.date: 08/04/2016
---

```httprequest
GET https://{instance}/DefaultCollection/_apis/projects/{project}/teams?api-version={version}[&$top={integer}&$skip={integer}]
```

```
GET https://{instance}/DefaultCollection/_apis/projects/{project}/teams?api-version={version}[&$top={integer}&$skip={integer}]
```

```no-highlight
GET https://{instance}/DefaultCollection/_apis/projects/{project}/teams?api-version={version}[&$top={integer}&$skip={integer}]
```

| Parameter  | Type    | Default | Notes
|:-----------|:--------|:--------|:----------------------------------------------------------------------------------------------------------------------------
| URL
| instance    | string  |         |test
| project    | string  |         | Name or ID of the project.
| Query
| api-version | string  | test of the API to use.
| $top       | integer | 100     | Maximum number of teams to return.
| $skip      | integer | 0       | Number of teams to skip.

#### Sample Code

>[!div class="tabbedCodeSnippets" cs='C#' cl='.NET Client Library']
>```cs
>using System;
>using System.Net.Http;
>using System.Net.Http.Headers;
>using System.Text;
>using Newtonsoft.Json;
>
>...
>
>public class WebApiTeams 
>{
>    public WebApiTeam[] value { get; set; }
>    public int count { get; set; }
>}
>
>public class WebApiTeam
>{
>    public string id { get; set; }
>    public string name { get; set; }
>    public string url { get; set; }
>    public string description { get; set; }
>    public string identityUrl { get; set; }
>}
>
>public void GetTeams()
>{   
>    string _personalAccessToken = "your personal access token";
>    string _credentials = Convert.ToBase64String(System.Text.ASCIIEncoding.ASCII.GetBytes(string.Format("{0}:{1}", "", _personalAccessToken)));
>    string _project = "My project name";
>
>    //use the httpclient        
>    using (var client = new HttpClient())
>    {
>        //set our headers
>        client.BaseAddress = new Uri(_configuration.UriString);
>        client.DefaultRequestHeaders.Accept.Clear();
>        client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
>        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", _credentials);
>
>        //send the request and content
>        HttpResponseMessage response = client.GetAsync("https://accountname.visualstudio.com/_apis/projects/" + _project + "/teams?api-version=2.2").Result;
>
>        if (response.IsSuccessStatusCode)
>        {
>            WebApiTeams teams = response.Content.ReadAsAsync<WebApiTeams>().Result;       
>        }             
>    }
>}
>
> ```
>```cl
>using Microsoft.TeamFoundation.Core.WebApi;
>using Microsoft.VisualStudio.Services.Common;
>using Microsoft.VisualStudio.Services.WebApi;
>
>...
>
>public GetTeams()
>{
>    //create uri and VssBasicCredential variables
>    Uri _uri = new Uri(url);
>    string _personalAccessToken = "your personal access token";    
>    VssBasicCredential _credentials = new VssBasicCredential("", _personalAccessToken);
>
>    string _project = "My project name";
>
>    using (TeamHttpClient teamHttpClient = new TeamHttpClient(_uri, _credentials))
>    {
>        IEnumerable<WebApiTeam> results = teamHttpClient.GetTeamsAsync(_project).Result;     
>    }
>}
>
>```

## Get a team
<a id="GetTeam"></a>

```httprequest
GET https://{instance}/DefaultCollection/_apis/projects/{project}/teams/{team}?api-version={version}
```

| Parameter  | Type     | Notes
|:-----------|:---------|:----------------------------------------------------------------------------------------------------------------------------
| URL
| instance   | string   | test at test.
| project    | string   | Name or ID of the project.
| team       | string   | Name or ID of the team. 
| Query
| api-version | string  |test

#### Sample Code

>[!div class="tabbedCodeSnippets" cs='C#' cl='.NET Client Library']
>```cs
>using System;
>using System.Net.Http;
>using System.Net.Http.Headers;
>using System.Text;
>using Newtonsoft.Json;
>
>...
>
>public class WebApiTeam
>{
>    public string id { get; set; }
>    public string name { get; set; }
>    public string url { get; set; }
>    public string description { get; set; }
>    public string identityUrl { get; set; }
>}
>
>public void GetTeam()
>{   
>    string _personalAccessToken = "your personal access token";
>    string _credentials = Convert.ToBase64String(System.Text.ASCIIEncoding.ASCII.GetBytes(string.Format("{0}:{1}", "", _personalAccessToken)));
>    string _project = "My project name";
>    string _team = "My team";
>      
>    //use the httpclient        
>    using (var client = new HttpClient())
>    {
>        //set our headers
>        client.BaseAddress = new Uri(_configuration.UriString);
>        client.DefaultRequestHeaders.Accept.Clear();
>        client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
>        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", _credentials);
>
>        //send the request and content
>        HttpResponseMessage response = client.GetAsync("https://accountname.visualstudio.com/_apis/projects/" + _project + "/teams/" + _team + "?api-version=2.2").Result;
>        
>        if (response.IsSuccessStatusCode)
>        {
>            WebApiTeam team = response.Content.ReadAsAsync<WebApiTeam>().Result;       
>        }             
>    }
>}
>
>```
>```cl
>using Microsoft.TeamFoundation.Core.WebApi;
>using Microsoft.VisualStudio.Services.Common;
>using Microsoft.VisualStudio.Services.WebApi;
>
>...
>
>public GetTeam()
>{
>    //create uri and VssBasicCredential variables
>    Uri _uri = new Uri(url);
>    string _personalAccessToken = "your personal access token";    
>    VssBasicCredential _credentials = new VssBasicCredential("", _personalAccessToken);
>    
>    string _project = "My project name";
>    string _team = "My team";
>    
>    using (TeamHttpClient teamHttpClient = new TeamHttpClient(_uri, _credentials))
>    {
>        WebApiTeam result = teamHttpClient.GetTeamAsync(_project, _team).Result;     
>    }
>}
>
>```

## Get a team's members
<a id="GetTeamMembers"></a>
Append `/members` to the end of the URL to get a list of identity references for the team's members.

```httprequest
GET https://{instance}/DefaultCollection/_apis/projects/{project}/teams/{team}/members?api-version={version}[&$top={integer}&$skip={integer}]
```
| Parameter  | Type     | Default | Notes
|:-----------|:---------|:--------|:-----------------------------------------------------
| URL
| instance   | string   |         | test or test.
| project    | string   |         | Name or ID of the project.
| team       | string   |         | Name or ID of the team. 
| Query
| api-version| string   |         |test of the API to use.
| $top       | integer  | `100`   | Maximum number of teams to return.
| $skip      | integer  | `0`     | Number of teams to skip.

#### Sample Code
>[!div class="tabbedCodeSnippets" cs='C#' cl='.NET Client Library']
>```cs
>using System;
>using System.Net.Http;
>using System.Net.Http.Headers;
>using System.Text;
>using Newtonsoft.Json;
>
>...
>
>public class Members
>{
>    public Member[] value { get; set; }
>    public int count { get; set; }
>}
>
>public class Member
>{
>    public string id { get; set; }
>    public string displayName { get; set; }
>    public string uniqueName { get; set; }
>    public string url { get; set; }
>    public string imageUrl { get; set; }
>}
>
>public void GetTeamMembers()
>{   
>    string _personalAccessToken = "your personal access token";
>    string _credentials = Convert.ToBase64String(System.Text.ASCIIEncoding.ASCII.GetBytes(string.Format("{0}:{1}", "", _personalAccessToken)));
>    string _project = "My project name";
>    string _team = "My team";
>      
>    //use the httpclient        
>    using (var client = new HttpClient())
>    {
>        //set our headers
>        client.BaseAddress = new Uri(_configuration.UriString);
>        client.DefaultRequestHeaders.Accept.Clear();
>        client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
>        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", _credentials);
>
>        //send the request and content
>        HttpResponseMessage response = client.GetAsync("https://accountname.visualstudio.com/_apis/projects/" + _project + "/teams/" + _team + "/members?api-version=2.2").Result;
>        
>        if (response.IsSuccessStatusCode)
>        {
>            Members members = response.Content.ReadAsAsync<Members>().Result;       
>        }             
>    }
>}
>
>```
>```cl
>using Microsoft.TeamFoundation.Core.WebApi;
>using Microsoft.VisualStudio.Services.Common;
>using Microsoft.VisualStudio.Services.WebApi;
>
>...
>
>public GetTeamMembers()
>{
>    //create uri and VssBasicCredential variables
>    Uri _uri = new Uri(url);
>    string _personalAccessToken = "your personal access token";    
>    VssBasicCredential _credentials = new VssBasicCredential("", _personalAccessToken);    
>    
>    string _project = "My project name";
>    string _team = "My team"
>
>    using (TeamHttpClient teamHttpClient = new TeamHttpClient(_uri, _credentials))
>    {
>        IEnumerable<IdentityRef> results = teamHttpClient.GetTeamMembersAsync(_project, _team).Result;               
>    }
>}
>
>```

### A page at a time
         
## Create a team
<a id="Create"></a>
Create a team in a team project

```httprequest
POST https://{instance}.VisualStudio.com/DefaultCollection/_apis/projects/{project}/teams?api-version={version}
```
```http
Content-Type: application/json
```
```json
{
    "name": {string},
    "description": {string}
}
```

| Parameter    | Type   | Notes
|:-------------|:-------|:-------------------------------------------------------------------------------------------------------------
| URL
| account      | string | VS Team Services account ({account}.visualstudio.com) or TFS server ({server:port}).
| project      | string | Name or ID of the project.
| Query
| api-version  | string | test of the API to use.
| Body
| name         | string | Name of the team.
| description  | string | Description of the team.

#### Sample Code
>[!div class="tabbedCodeSnippets" cs='C#' cl='.NET Client Library']
>```cs
>using System;
>using System.Net.Http;
>using System.Net.Http.Headers;
>using System.Text;
>using Newtonsoft.Json;
>
>....
>
>public class WebApiTeam
>{
>    public string id { get; set; }
>    public string name { get; set; }
>    public string url { get; set; }
>    public string description { get; set; }
>    public string identityUrl { get; set; }
>}
>
>public void CreateTeam()
>{   
>    string _personalAccessToken = "your personal access token";
>    string _credentials = Convert.ToBase64String(System.Text.ASCIIEncoding.ASCII.GetBytes(string.Format("{0}:{1}", "", _personalAccessToken)));
>    string _project = "My project name"; 
>
>    //create a team object to save
>    Object teamData = new { name = "My new team" };
>
>    using (var client = new HttpClient())
>    {
>        client.DefaultRequestHeaders.Accept.Clear();
>        client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
>        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", _credentials);
>
>        // serialize the fields array into a json string         
>        var patchValue = new StringContent(JsonConvert.SerializeObject(teamData), Encoding.UTF8, "application/json"); // mediaType needs to be application/json-patch+json for a patch call
>        var method = new HttpMethod("POST");
>
>        var request = new HttpRequestMessage(method, "https://accountname.visualstudio.com/_apis/projects/" + _project + "/teams?api-version=2.2") { Content = patchValue };
>        var response = client.SendAsync(request).Result;
>
>        if (response.IsSuccessStatusCode)
>        {
>            WebApiTeam teamResponse = response.Content.ReadAsAsync<WebApiTeam>().Result;            
>        }
>    }
>}
>
>```
>```cl
>using Microsoft.TeamFoundation.Core.WebApi;
>using Microsoft.VisualStudio.Services.Common;
>using Microsoft.VisualStudio.Services.WebApi;
>
>...
>
>public CreateTeam()
>{
>    //create uri and VssBasicCredential variables
>    Uri _uri = new Uri(url);
>    string _personalAccessToken = "your personal access token";    
>    VssBasicCredential _credentials = new VssBasicCredential("", _personalAccessToken);
>    
>    string _project = "My project name";
>  
>    WebApiTeam teamData = new WebApiTeam()
>    {
>        Name = "My new team"
>    };
>
>    using (TeamHttpClient teamHttpClient = new TeamHttpClient(_uri, _credentials))
>    {
>        WebApiTeam result = teamHttpClient.CreateTeamAsync(teamData, _project).Result;
>    }
>}
>
>```

## Update a team
<a id="Update"></a>
Rename a team or change a team's description

```httprequest
PATCH https://{instance}.VisualStudio.com/DefaultCollection/_apis/projects/{project}/teams/{team}?api-version={version}
```
```http
Content-Type: application/json
```
```json
{
  "name": {string},
  "description": {string}
}
```

| Parameter    | Type   | Notes
|:-------------|:-------|:-------------------------------------------------------------------------------------------------------------
| URL
| account      | string | Your Visual Studio Online account.
| project      | string   | Name or ID of the project.
| team         | string   | Name or ID of the team.
| Query
| api-version  | string | test of the API to use.
| Body
| name         | string | New name of the team.
| description  | string | New description of the team.

#### Sample Code
>[!div class="tabbedCodeSnippets" cs='C#' cl='.NET Client Library']
>```cs
>using System;
>using System.Net.Http;
>using System.Net.Http.Headers;
>using System.Text;
>using Newtonsoft.Json;
>
>....
>
>public class WebApiTeam
>{
>    public string id { get; set; }
>    public string name { get; set; }
>    public string url { get; set; }
>    public string description { get; set; }
>    public string identityUrl { get; set; }
>}
>
>public void UpdateTeam()
>{   
>    string _personalAccessToken = "your personal access token";
>    string _credentials = Convert.ToBase64String(System.Text.ASCIIEncoding.ASCII.GetBytes(string.Format("{0}:{1}", "", _personalAccessToken)));
>    
>    string _project = "My project name"; 
>    string _team = "My team";
>
>    //create a team object to save
>    Object teamData = new { name = "My updated team", description = "my teams awesome description" };
>
>    using (var client = new HttpClient())
>    {
>        client.DefaultRequestHeaders.Accept.Clear();
>        client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
>        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", _credentials);
>
>        // serialize the fields array into a json string         
>        var patchValue = new StringContent(JsonConvert.SerializeObject(team), Encoding.UTF8, "application/json"); // mediaType needs to be application/json-patch+json for a patch call
>        var method = new HttpMethod("PATCH");
>
>        var request = new HttpRequestMessage(method, "https://accountname.visualstudio.com/_apis/projects/" + _project + "/teams/" + _team + "?api-version=2.2") { Content = patchValue };
>        var response = client.SendAsync(request).Result;
>
>        if (response.IsSuccessStatusCode)
>        {
>            WebApiTeam teamResponse = response.Content.ReadAsAsync<WebApiTeam>().Result;     
>        }  
>    }    
>}
>
>```
>```cl
>using Microsoft.TeamFoundation.Core.WebApi;
>using Microsoft.VisualStudio.Services.Common;
>using Microsoft.VisualStudio.Services.WebApi;
>
>...
>
>public UpdateTeam()
>{
>    //create uri and VssBasicCredential variables
>    Uri _uri = new Uri(url);
>    string _personalAccessToken = "your personal access token";    
>    VssBasicCredential _credentials = new VssBasicCredential("", _personalAccessToken);
>    
>    string _project = "My project name";
>    string _team = "My team";
>  
>    WebApiTeam teamData = new WebApiTeam()
>    {
>        Name = "My updated team",
>        Description = "my awesome team description"
>    };
>
>    using (TeamHttpClient teamHttpClient = new TeamHttpClient(_uri, _credentials))
>    {
>        WebApiTeam result = teamHttpClient.UpdateTeamAsync(teamData, _project, _team).Result;
>    }
>}
>
>```

## Delete a team
<a id="Delete"></a>
Permanently delete a team.

```httprequest
DELETE https://{instance}.VisualStudio.com/DefaultCollection/_apis/projects/{project}/teams/{team}?api-version={version}
```

| Parameter  | Type   | Notes
|:-----------|:-------|:-------------------------------------------------------------------------------------------------------------
| URL
| account    | string | VS Team Services account ({account}.visualstudio.com) or TFS server ({server:port}).
| project    | string | Name or ID of the project.
| team       | string | Name or ID of the team.
| Query
| api-version | string | test of the API to use.

#### Sample request
```httprequest
DELETE https://fabrikam.VisualStudio.com/DefaultCollection/_apis/projects/fabrikam-fiber/teams/2ddc9d25-b0fe-45ed-97d1-d94c5a562c0b?api-version=2.2
```

#### Sample Code

>[!div class="tabbedCodeSnippets" cs='C#' cl='.NET Client Library']
>```cs
>using System;
>using System.Net.Http;
>using System.Net.Http.Headers;
>using System.Text;
>using Newtonsoft.Json;
>
>....
>
>public void DeleteTeam()
>{   
>    string _personalAccessToken = "your personal access token";
>    string _credentials = Convert.ToBase64String(System.Text.ASCIIEncoding.ASCII.GetBytes(string.Format("{0}:{1}", "", _personalAccessToken)));
>    string _project = "My project name"; 
>    string _team = "My team";
>
>    using (var client = new HttpClient())
>    {
>        client.DefaultRequestHeaders.Accept.Clear();
>        client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
>        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", _credentials);
>
>        var method = new HttpMethod("DELETE");
>
>        var request = new HttpRequestMessage(method, "https://accountname.visualstudio.com/_apis/projects/" + _project + "/teams/" + _team + "?api-version=2.2");
>        var response = client.SendAsync(request).Result;        
>    }
>}
>
>```
>```cl
>using Microsoft.TeamFoundation.Core.WebApi;
>using Microsoft.VisualStudio.Services.Common;
>using Microsoft.VisualStudio.Services.WebApi;
>
>...
>
>public DeleteTeam()
>{
>    //create uri and VssBasicCredential variables
>    Uri _uri = new Uri(url);
>    string _personalAccessToken = "your personal access token";    
>    VssBasicCredential _credentials = new VssBasicCredential("", _personalAccessToken);
>   
>    string _project = "My project name";
>    string _team = "My team";  
>
>    using (TeamHttpClient teamHttpClient = new TeamHttpClient(_uri, _credentials))
>    {
>        WebApiTeam result = teamHttpClient.DeleteTeamAsync(_project, _team).SyncResult();
>    }
>}
>
>```
