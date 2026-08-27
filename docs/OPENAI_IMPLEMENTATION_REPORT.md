# OpenAI Implementation Report

## Executive Summary

Initial Kujo OpenAI package centered on the current Responses API, with a pure AI SDK adapter and a separately preserved native layer.

## Official API Evidence

The official OpenAI Python SDK identifies Responses as the primary API and documents `client.responses.create`, SSE streaming, tools, structured outputs, usage, request IDs, and embeddings. Evidence date: 2026-08-27.

## Protocol Classification

OPENAI-COMPATIBLE PRIMARY PROTOCOL. Existing AI SDK `openai_provider()` compatibility remains untouched.

## Architecture

Native client: `src/openai.kujo`. AI SDK driver: `src/provider.kujo`. Root exports: `openai.kujo`.

## Native API Coverage

Responses, streaming parser, model listing, and embeddings. Native output items, tools, reasoning, structured output, and usage remain provider-owned.

## Public Exports

`create_client`, `responses`, client response operations, `list_models`, `embeddings`, `parse_stream`, `openai_provider`, `openai_driver`.

## Kujo Requirement

Kujo >= 1.0.2.

## AI SDK Dependency

`github:kujolang/ai-sdk@v1.1.0`.

## Authentication and Security

`OPENAI_API_KEY`, bearer auth, remote HTTPS enforcement, credential-bearing URL rejection, protected headers, redaction, malformed response and stream containment.

## Streaming, Tools, Structured Output, Reasoning, Multimodal, Embeddings

Responses SSE is parsed; native request options preserve tools, structured output, reasoning, and multimodal input. Embeddings are exposed. Realtime/WebSocket and file lifecycle APIs are outside this initial package.

## Usage, Finish Reasons, Errors

Reliable input/output usage maps to AI SDK usage; completed maps to stop. Native error payloads are retained subject to redaction.

## AI SDK Driver / Tests

Pure descriptor and decoder hooks; no network I/O or transport/retry/budget policy. Two deterministic offline test files and installed consumer smoke are included.

## Clean-Room Install / Installed Consumer Smoke

Passed with Kujo v1.0.2, including immutable Kennel add/install/reinstall/validate and installed consumer smoke with `KUJO_MODULE_PATH` unset.

## Live Validation

SKIPPED — credentials/environment unavailable.

## AI SDK Changes / Kujo Changes / Kennel Changes

None.

## Contract Conformance

See `OPENAI_PROVIDER_PACKAGE_CONFORMANCE.md`.

## Limitations

This initial release does not claim Realtime, batch, files, images, audio, or built-in tool execution as normalized operations.
