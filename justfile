## example 1 ##

# build native rust example
example1-build:
    cd {{justfile_directory()}}/example1; cargo build

# run native rust example
example1-run:
    cd {{justfile_directory()}}/example1; cargo run

# run example in wasmtime runtime
example1-with-wasmtime: (build "example1" "--target wasm32-wasi")
    wasmtime target/wasm32-wasi/debug/example1.wasm

## other examples ##

# watch if source file changes and run via wagi
watch example:
    watchexec -e rs -r -w ./{{example}} just run {{example}}

# run module via wagi
run example: (build example "--target wasm32-wasi")
    ./wagi -c modules.toml --log-dir ./logs

## general ##

# build example to given target
build example target:
    cd {{justfile_directory()}}/{{example}}; cargo build {{target}}


