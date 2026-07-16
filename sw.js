// PDX Ops Hub — service worker
// A propósito NO guarda nada en caché: cada vez que abras la app instalada
// pedirá siempre la versión más reciente de GitHub Pages. Así, cualquier
// cambio que subamos al repositorio se ve reflejado sin tener que
// reinstalar ni borrar caché a mano.

self.addEventListener('install', (event) => {
  self.skipWaiting();
});

self.addEventListener('activate', (event) => {
  event.waitUntil(self.clients.claim());
});

self.addEventListener('fetch', (event) => {
  event.respondWith(fetch(event.request));
});
