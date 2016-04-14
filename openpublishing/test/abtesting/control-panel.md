# A/B Testing Control Panel

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

You will see the A/B Testing Control Panel on the left side, this is expected, please have a try.
