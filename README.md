# Building (micro)services with WebAssembly

## wasm
WebAssembly (abbreviated Wasm) is a binary instruction format for a stack-based virtual machine. Wasm is designed as a portable compilation target for programming languages, enabling deployment on the web for client and server applications. ([Reference](https://webassembly.org/))

## wasmtime
A fast and secure runtime for WebAssembly. ([Reference](https://wasmtime.dev/))

## wasi
WASI is a modular system interface for WebAssembly. As described in the [initial announcement](https://hacks.mozilla.org/2019/03/standardizing-wasi-a-webassembly-system-interface/), it’s focused on security and portability. ([Reference](https://wasi.dev/))

## wagi
WAGI allows you to run WebAssembly WASI binaries as HTTP handlers. Write a "command line" application that prints a few headers, and compile it to WASM32-WASI. Add an entry to the modules.toml matching URL to WASM module. That's it. ([Reference](https://github.com/deislabs/wagi))

## general
All examples are implemented in Rust. However, no language-specific knowledge is necessary to understand the code snippets. To execute more complex shell commands the [justfile project](https://github.com/casey/just) was used.

## Run wasm outside the Browser 
[Package](./example1)

Simple start by implementing a `Hello World` program written in Rust. The code can be found [here](./example1/src/main.rs). To build the project with `cargo`, execute the following command:
````SHELL
just example1-build
````
To run the generated executable run the following command:
````SHELL
just example1-run
````
The same program can be compiled to `wasi`. Therefore the target of `cargo build` has to be set to `--target wasm32-wasi`. Furthermore it is possible to execute it via the wasmtime runtime. Just run the following command:
````SHELL
just example1-with-wasmtime
````
All detailed commands can be found in [justfile](./justfile).

## Wagi http request handler 
[Package](./example2)

The next examples use `watchexec` which simply recompiles the source code if it gets updated.
````SHELL
just watch example2
````

````SHELL
curl -X GET http://localhost:3000/example2-ping \
     -H "Content-Type: text/plain"
````

![example1 response](./_img/example1-response.png)

## Advanced http request handler 
[Package](./example3)

````SHELL
just watch example3
````

````SHELL
curl -X POST http://localhost:3000/example3?someQuery=test \
     -H "Content-Type: application/json" \
     -d '{ "firstname": "michael", "lastname": "neuhold" }'
````

![example2 response](./_img/example2-response.png)

## With hosting static files
[Package](./example4)

````SHELL
just watch example4
````

![example4 404](./_img/example4-404.png)

![example4 200](./_img/example4-200.png)

## Allow request to other host
[Package](./example5)

````SHELL
just watch example5
````