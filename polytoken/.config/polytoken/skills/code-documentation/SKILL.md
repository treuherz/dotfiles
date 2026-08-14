---
description: Write useful comments, READMEs, and other code documentation that explains durable intent, behaviour, and non-obvious constraints.
---

# Code documentation

Write for a future reader who does not have the history of the change or the conversation that produced it. For code comments, assume the source is visible; for READMEs and guides, provide the context and prerequisites their intended audience needs.

## Explain intent and behaviour

- Explain why the code exists, what contract it provides, and what behaviour or constraint is not obvious from the code itself.
- Describe inputs, outputs, side effects, failure modes, invariants, operational constraints, and user-facing consequences when they matter.
- Prefer a concise explanation of purpose over a line-by-line narration of the implementation.
- Keep documentation factual, specific, and consistent with the current code. Update nearby documentation when a change makes it inaccurate.
- Write comments for the reader's benefit, not to demonstrate that a task was completed.

## Do not document the author's process

- Do not discuss shapes the code used to have, discarded implementations, or alternatives that were not chosen unless that history is an enduring constraint that future maintainers genuinely need to know.
- Do not document agent conversations, prompts, review exchanges, or the circumstances in which the comment was written.
- Avoid wording such as "we changed", "previously", "now instead", or "the old implementation" when it only records development history.
- State the positive purpose and current behaviour directly.

Before keeping a comment, ask: would this still help a reader if they had never seen the issue, task, or discussion that prompted it? If not, rewrite it around the lasting intent or remove it.

## Comments in code

- Add comments where names and control flow are insufficient to explain durable intent, an unavoidable non-obvious mechanism, or a constraint—especially around ordering, concurrency, protocols, compatibility, or safety.
- Keep comments close to the code they explain and make them precise enough to guide a safe change.
- For exported Go declarations, write a complete comment beginning with the declaration's name when the package's documentation conventions require it.
- Do not repeat what a clear name, type, or straightforward statement already says.
- If a comment describes a requirement or invariant, make it clear what must remain true and, where useful, what code should do when changing it.

## READMEs and other guides

- Start with what the project, component, or tool is for and who should use it.
- Give the shortest reliable path to installation, setup, and a first successful use. State prerequisites and required configuration.
- Document normal operation, important commands, configuration, interfaces, and troubleshooting information in the places readers will look for them.
- Prefer runnable commands and concrete examples over vague prose. Keep examples aligned with the current repository layout and behaviour.
- Organise information around reader tasks. Remove background that does not help a reader understand, use, operate, or safely modify the subject.
- Call out security, data-loss, compatibility, or operational constraints when omitting them could lead to an unsafe or misleading result.
