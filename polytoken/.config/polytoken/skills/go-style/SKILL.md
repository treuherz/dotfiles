---
description: Apply the user's preferred Go style, including modern slices and maps usage, deliberate vertical whitespace, and restrained testify assertions.
---

# Go style

Apply these preferences when writing or reviewing Go code. Keep the result idiomatic and readable; do not use a rule mechanically when the standard library, the supported Go version, or the surrounding package makes another choice clearer.

## Prefer standard-library collection helpers

- Use the `slices` and `maps` packages when they provide the operation needed for a slice or map.
- Prefer these helpers over slice-tricks, hand-written loops that merely reproduce their functionality, and `sort.Slice`.
- Use the appropriate specialised helper, such as `slices.Sort`, `slices.SortFunc`, `maps.Clone`, `maps.Copy`, or `maps.DeleteFunc`, rather than rebuilding the operation inline.
- Check the package's supported Go version before introducing an API that is not available to it.
- Do not force a helper into code when a short, direct loop expresses domain logic rather than generic collection manipulation.

## Timers and tickers

- Call `Stop` when stopping delivery is part of the program's behaviour, such as preventing a pending timer event or future ticks. `Stop` does not cancel work that has already started.

## Use vertical whitespace deliberately

Use blank lines to make function bodies easier to scan.

- In most cases, put a blank line after a closed block before the next thought, and before a return.
- Cuddle trivial lines that handle the same variables and form one thought, such as declaring a value and immediately using or returning it.
- Separate distinct operations, error-handling branches, and changes of purpose with vertical whitespace.
- Do not add blank lines between every statement; whitespace should expose the structure of the function, not fragment it.

For example:

```go
value, err := loadValue()
if err != nil {
    return err
}

if value.NeedsUpdate() {
    if err := updateValue(value); err != nil {
        return err
    }
}

return saveValue(value)
```

## Use testify sparingly

- Prefer the standard library and the package's existing testing conventions for new packages; do not introduce `testify` merely for convenience.
- Where `testify` is already established, use vertical whitespace to keep setup, actions, and assertions clear.
- When checking the error returned by an operation, do not bury the operation inside `require.NoError` or `assert.NoError`. Assign the error, then check it on the next line. A read-only status accessor such as `rows.Err()` or `ctx.Err()` may remain inline when naming its result adds no clarity:

  ```go
  err := writeValue(value)
  require.NoError(t, err)
  ```

- Do not introduce f-suffixed assertion variants. Use the unsuffixed function and make the test clear through names, structure, and separate assertions.
- Use the most specific assertion available: `NoError` rather than `Nil` for an error, and `Len` rather than `True(len(values) == expected)`.
- Keep assertions focused on the behaviour under test rather than on incidental implementation details.

## Table-driven tests

- Name the test table `tests`.
- Name each iteration element `test`.
- Keep those names consistent across table definitions and subtest iteration.
- When every case exercises the same operation and assertions, keep table entries focused on inputs and expected outputs, and put the shared operation and assertions in the loop body. Per-case setup, comparison, or check functions are appropriate when cases genuinely require different behaviour; do not use them merely to hide a uniform test body.
