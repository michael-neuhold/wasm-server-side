# Building (micro)services with WebAssembly

## wasm
WebAssembly (abbreviated Wasm) is a binary instruction format for a stack-based virtual machine. Wasm is designed as a portable compilation target for programming languages, enabling deployment on the web for client and server applications. ([Reference](https://webassembly.org/))

## wasmtime
A fast and secure runtime for WebAssembly. ([Reference](https://wasmtime.dev/))

## wasi
WASI is a modular system interface for WebAssembly. As described in the [initial announcement](https://hacks.mozilla.org/2019/03/standardizing-wasi-a-webassembly-system-interface/), it’s focused on security and portability. ([Reference](https://wasi.dev/))

## wagi
WAGI allows you to run WebAssembly WASI binaries as HTTP handlers. Write a "command line" application that prints a few headers, and compile it to WASM32-WASI. Add an entry to the modules.toml matching URL to WASM module. That's it. ([Reference](https://github.com/deislabs/wagi))

## Run wasm outside the Browser 
[Package](./example1)

````SHELL
just example1-build
````

````SHELL
just example1-run
````

````SHELL
just example1-with-wasmtime
````

## Wagi http request handler 
[Package](./example2)

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