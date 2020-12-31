# Reproduction Repo

Start the container with `docker-compose up --build -d`. Which installs all esy dependencies and starts the container in
detached mode.

After the installation is finished, you can attach to the container using `docker-compose exec test bash`. This opens a
new bash inside of the container, so you can run any command inside it.

Once you try to build the project by running `esy` or `esy b`, the following error shows up:

```
         ppx lib/ReasonNativeTest.re.pp.ml (exit 127)
(cd /app/_esy/default/store/b/reason_native_test-f4aa9368/default && .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe --cookie 'library-name="ReasonNativeTest"' -o lib/ReasonNativeTest.re.pp.ml --impl lib/ReasonNativeTest.re.ml -corrected-suffix .ppx-corrected -diff-cmd - -dump-ast)
Error loading shared library libffi.so.6: No such file or directory (needed by .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe)
Error relocating .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe: ffi_closure_free: symbol not found
Error relocating .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe: ffi_prep_closure_loc: symbol not found
Error relocating .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe: ffi_call: symbol not found
Error relocating .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe: ffi_prep_cif: symbol not found
Error relocating .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe: ffi_closure_alloc: symbol not found
Error relocating .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe: ffi_type_sint16: symbol not found
Error relocating .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe: ffi_type_double: symbol not found
Error relocating .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe: ffi_type_uint8: symbol not found
Error relocating .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe: ffi_type_pointer: symbol not found
Error relocating .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe: ffi_type_sint64: symbol not found
Error relocating .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe: ffi_type_void: symbol not found
Error relocating .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe: ffi_type_uint16: symbol not found
Error relocating .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe: ffi_type_sint32: symbol not found
Error relocating .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe: ffi_type_uint64: symbol not found
Error relocating .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe: ffi_type_sint8: symbol not found
Error relocating .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe: ffi_type_uint32: symbol not found
Error relocating .ppx/b27d71588ab1f780eec6d53c67c88416/ppx.exe: ffi_type_float: symbol not found
```

Which is currently fixed by adding the following configuration under the `esy` key in the `esy.json`.

```
"buildEnv": {
  "LD_LIBRARY_PATH": "#{@esy-ocaml/libffi.lib}:$LD_LIBRARY_PATH"
},
```
