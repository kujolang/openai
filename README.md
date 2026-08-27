# Kujo OpenAI Provider

Native OpenAI Responses API client plus a pure AI SDK provider driver.

```bash
kujo package-add github:kujolang/openai@v0.1.0
export OPENAI_API_KEY=your-key
```

```kujo
from openai import create_client, client_responses
c := create_client({})
r := client_responses(c, {"model":"gpt-5.5","input":"Hello"})
```

Native use preserves Responses output items, built-in tools, reasoning, structured output, and usage. `openai_provider()` supplies normalized AI SDK semantics. Default tests are deterministic and credential-free.
