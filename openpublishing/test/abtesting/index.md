# A/B Testing

<script type="text/javascript">
(function(){
  var doc = document;
  var head = doc.getElementsByTagName('HEAD')[0];
  var status = {complete: 0};
  var script = doc.createElement('SCRIPT');
  script.type = 'text/javascript';
  script.src = '/_chrome/lib/Tartarus.js';
  script.onload = function() {
    script.onload = script.onreadystatechange = null;
    Tartarus.load(
      '/_chrome/lib/Prelude.js',
      '/_chrome/lib/Intermezzo.js',
      '/_chrome/lib/URI.js',
      function() {
        Intermezzo.RemoveNode(script);
        if (window.top === window) {
          window.location.href = URI.NormalizeURI('/_chrome/experiment.htm', URI.GetCurrentURI()) + '#' + URI.GetCurrentURI();
        }
      }
    );
  };
  script.onreadystatechange = function(){
    if(status.hasOwnProperty(script.readyState)) {
      script.onload();
    } else if(script.readyState === 'loading') {
      status['loaded'] = 0;
    }
  };
  head.appendChild(script);
})();
</script>

## Content Level A/B Testing
Content Level A/B Testing allows content authors to self-service, having variants of contents delivered from the same URL, specifying the split ratio and getting the BI statistics.

For example, writers can have **hello.md** and **hello.experimental.md**, and specify that only 10% of the end users would see the experimental version of the document.

### Design Principles:

1. Keep things **simpler** if possible, avoid over design - especially piling up features that are not actually used.
2. All **types of contents** should be able to run A/B testing, including markdown files, plain HTML files, images and audio/video files.
2. The A/B testing **granularity** should be flexible, either covering a single document, or a large group of assets (e.g. images).
3. Users should be **affinitized**, which means once a user was routed to version A, he/she should always see version A document unless the browser session info has been explicitly wiped out.
4. Should be **fast**, creating a new test, turning on/off an A/B testing, or updating the split ratio should take effect in **less than 30 seconds**.
5. **Corner cases should be covered properly**, A/B testing should work smoothly in a **CDN environment**. Also, special logic should be in place to make sure only the default variant *"the A version"* is retrieved by **search crawlers** like Google and Bing.
6. Naturally **integrated** into BI and Insights.

### Internal Flow Diagram:

   ![](./ab-testing-flow.png)
