<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Simple React Page</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    .header {
      background-color: #333;
      color: #fff;
      text-align: center;
      padding: 1rem;
    }

    .content {
      max-width: 800px;
      margin: 0 auto;
      padding: 2rem;
    }
  </style>
</head>
<body>
  <div id="root"></div>
  <script>
    function App() {
      return (
        '<div>' +
        '<header class="header">' +
        '<h1>Simple React Page</h1>' +
        '</header>' +
        '<div class="content">' +
        '<p>Welcome to my simple React webpage!</p>' +
        '<p>This is just a basic example to get you started already.</p>' +
        '</div>' +
        '</div>'
      );
    }

    const rootElement = document.getElementById('root');
    rootElement.innerHTML = App();
  </script>
</body>
</html>

