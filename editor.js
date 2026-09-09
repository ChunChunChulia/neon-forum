function ponerEmoji(id, emoji) {
    var caja = document.getElementById(id);
    caja.value = caja.value + emoji;
    caja.focus();
}