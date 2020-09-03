# Firedancer Template (with Heaps.io)

Minimum project using [Firedancer](https://github.com/fal-works/firedancer) and [Heaps.io](http://heaps.io/).


## Prerequisites

Install [Haxe](https://haxe.org/) (recommended version: 4.1.3).

Then install the libraries below:

```sh
haxelib install firedancer
haxelib install heaps
```

Additionally, if you'd like to run on HashLink:

Install [HashLink](https://hashlink.haxe.org/) (recommended version: 1.11.0),  
and the libraries below as well.

```sh
haxelib install hashlink
haxelib install hldx # or hlsdl if you prefer SDL than DirectX
```


## Usage

- Edit `BulletPatterns.create()` to define your own bullet patterns.
- Edit `Emitter`, `EndCodeHandler` or `EventHandler` if you'd like to define additional behavior.
- Edit `Settings` to change constants.


## Build & Run

### HashLink/JIT

```sh
haxe hl-jit-test.hxml
```

### JavaScript

```sh
haxe js.hxml
```

Then open `index.html` to run.


## Dependencies

- [firedancer](https://github.com/fal-works/firedancer) v0.1.0 or compatible
- [heaps](http://heaps.io/) v1.8.0 or compatible
