function fn() {

  function generateUniqueTitle(previous) {
    var titles = ['Mr', 'Mrs', 'Miss', 'Ms', 'Dr'];
    var filtered = titles.filter(function(t) { return t !== previous; });
    var index = Math.floor(Math.random() * filtered.length);
    return filtered[index];
  }

  return {
    generateUniqueTitle: generateUniqueTitle
  };

}
