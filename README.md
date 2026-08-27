# Kujo OpenAI Provider

[![Version](https://img.shields.io/badge/version-0.1.2-black)](https://github.com/kujolang/openai/releases/tag/v0.1.2)
[![License](https://img.shields.io/badge/license-MIT-lightgrey)](LICENSE)
[![built with Kujo](https://img.shields.io/badge/built%20with-Kujo-white.svg)](https://github.com/kujolang/kujo)

Native OpenAI Responses API support for Kujo, with normalized AI SDK integration.

## Install

```bash
kujo run /path/to/kennel/kennel.kujo \
  --interpreter \
  -- add github:kujolang/openai@v0.1.2 \
  --alias openai
kujo run /path/to/kennel/kennel.kujo --interpreter -- install
export OPENAI_API_KEY=your-key
```

## 30-second quick start

```kujo
from openai import create_client, client_responses

client := create_client({})
request := {
    "model": "gpt-5.5",
    "input": "Hello from Kujo!"
}

result := client_responses(client, request)

print(result["data"]["output"][0]["content"][0]["text"])
```

## Native API

The native client preserves Responses output items, built-in tools, reasoning, structured output, request IDs, streaming, embeddings, and usage. Use it for OpenAI-specific features.

## AI SDK integration

`openai_provider({"model": "gpt-5.5"})` supplies normalized AI SDK chat and streaming semantics. The existing AI SDK `openai_provider()` remains compatible; this package is the richer native path.

## Authentication and security

Set `OPENAI_API_KEY`. Remote endpoints require HTTPS; embedded URL credentials, header injection, and credential leakage are rejected.

## Testing and documentation

```bash
bash scripts/release_quality_gate.sh
bash scripts/verify_installed_package.sh
```

The default gate is deterministic and offline. See [docs/](docs/) for implementation and Contract v1 evidence.
