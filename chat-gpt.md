## ChatGPT from terminal

One option is to use [shellGPT](https://github.com/TheR1D/shell_gpt) but it requires OPENAI_KEY_API not available for free.

An open-source free option is [Terminal GPT](https://github.com/aandrew-me/tgpt).

### Useful commands (add to your .bashrc)

```
# tgpt -s "prompt" outputs shell commands
shell () {
  prompt="$@"
  tgpt -s "$prompt"
}

# tgpt -c "prompt" outputs code-oriented answers
coding () {
  prompt="$@"
  tgpt -c "$prompt"
}
```

Examples:
```
shell find a file in this folder
```

```
coding create a new c++ class
```


