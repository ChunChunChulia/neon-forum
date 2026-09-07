async function includeHTML(id, file) {
  const response = await fetch(file);
  const html = await response.text();

  document.getElementById(id).innerHTML = html;
}

includeHTML("menu", "components/menu.html");