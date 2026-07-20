# Contributing

Thanks for taking the time to contribute! These guidelines are the shared baseline for **every repository** under the
[Bitwise Media Group][org] organisation — they live here in the `.github` repo so they apply by default everywhere.

Individual repositories may refine these rules in their own `AGENTS.md`, `CONTRIBUTING.md`, or `README.md` (for example,
which changes count as a `feat:` versus a `ci:`). When a repository says something more specific than this guide, follow
the repository.

## Code of conduct

Keep things friendly, constructive, and respectful. Assume good faith, critique the work rather than the person, and
remember there's a human on the other side of every issue and pull request. Behaviour that makes others unwelcome isn't
acceptable here.

## Using AI

We build with AI and encourage you to as well — coding agents and assistants are welcome on every contribution. One rule
doesn't bend, though:

> **You must understand your code** — if you can't explain what a change does and how it fits the wider system _without_
> an AI tool, it isn't ready to submit.

AI is a tool for writing _and_ learning; use it to understand a change, not to skip understanding it. When you
[sign off and sign your commits](#signing-and-signing-off-every-commit), you certify the work is yours to submit, and
"the AI wrote it" doesn't cover code you can't stand behind. See the full [AI policy](AI_POLICY.md) for what's
encouraged and what isn't.

## Licensing

Our projects are released under the [MIT License](LICENSE). **By contributing, you agree that your contributions are
licensed under the same MIT License**, and you certify that you have the right to submit them under those terms.

In practice that means anyone can use, copy, modify, and redistribute your work — including in commercial products — as
long as the copyright notice and licence text are preserved. If you aren't comfortable with that, please don't submit
the contribution. The [sign-off](#signing-and-signing-off-every-commit) on each commit is how you certify this for the
record, and the [signature](#signing-and-signing-off-every-commit) is how we tie that certification to a real account.

## How to contribute

There's more than one way to help, and all of them are welcome:

- **Report a bug** — open an issue describing what happened, what you expected, and how to reproduce it.
- **Suggest a feature or improvement** — open an issue and describe the problem you're trying to solve, not just the
  solution you have in mind.
- **Improve the docs** — typos, broken links, and clearer wording are genuinely valuable and always appreciated.
- **Submit code or content** — fix a bug, build a feature, or tidy something up via a pull request.

For anything beyond a small, obvious fix, please **open an issue first** to discuss the change. It saves you from
spending effort on something that might not be merged, and gives us a chance to point you in the right direction.

## Development workflow

We use the standard [fork-and-pull][fork-pull] model: you won't have push access to the upstream repository, so changes
arrive as pull requests from your own fork.

1. **Fork** the repository on GitHub and **clone** your fork (swap in the repository you're working on):

   ```bash
   git clone git@github.com:<your-username>/<repository>.git
   cd <repository>
   ```

2. **Add the upstream remote** so you can keep your fork in sync:

   ```bash
   git remote add upstream git@github.com:bitwise-media-group/<repository>.git
   ```

3. **Create a branch** with a short, descriptive name:

   ```bash
   git switch -c docs/fix-readme-typo
   ```

4. **Make your changes**, then run the repository's checks (see [Before you commit](#before-you-commit)).
5. **Commit** using [Conventional Commits](#commit-messages). Every commit must be
   [signed off and signed](#signing-and-signing-off-every-commit) — once signing is configured, `-s` adds the sign-off
   and Git signs:

   ```bash
   git commit -s -m "docs: fix typo in the README"
   ```

6. **Push** to your fork and **open a pull request** against the upstream `main` branch:

   ```bash
   git push origin docs/fix-readme-typo
   ```

We keep a **linear history** (no merge commits on the default branch), so sync your branch by **rebasing** onto the
latest `upstream/main` rather than merging it in:

```bash
git fetch upstream
git rebase upstream/main
```

## Before you commit

Every public repository we accept contributions to ships a `make pr` target that runs the same gate CI enforces — it
injects licence headers, formats and lints prose and code, builds, and runs the tests. Run it before you commit, and
stage everything it changes:

```bash
make pr
```

Running it locally keeps diffs clean and review quick, and spares you a follow-up "fix lint" commit.

## Commit messages

We follow the [Conventional Commits][conventional] specification. The format is load-bearing rather than cosmetic:
[release-please][release-please] derives the next version and changelog straight from these prefixes, so the type you
choose decides whether (and how) a change ships.

```text
type(scope): short summary

optional body explaining the what and why

optional footer(s)
```

Common types:

- `feat:` — a new feature
- `fix:` — a bug fix
- `docs:` — documentation-only changes
- `refactor:` — a change that neither fixes a bug nor adds a feature
- `test:` — adding or correcting tests
- `chore:` — tooling, config, and other housekeeping
- `ci:` — changes to CI and automation
- `build:` — changes to the build system or dependencies

A few rules of thumb:

- Keep the summary in the imperative mood and under ~72 characters: _"add"_, not _"added"_ or _"adds"_.
- The `scope` is optional but helps — `docs(readme):` is clearer than `docs:`.
- Signal a **breaking change** with a `!` after the type (`feat!:`) or a `BREAKING CHANGE:` footer.
- One logical change per commit. Smaller, focused commits are far easier to review.
- Some repositories assign extra meaning to a type (for instance, reserving `ci:` for changes that must not cut a
  release). Check the repository's `AGENTS.md` when in doubt.

Examples:

```text
fix: correct broken link in the contributing guide
feat(merge): add fork-PR review acknowledgement
docs(readme): clarify how to follow the podcast

refactor!: rename the default branch references

BREAKING CHANGE: scripts that hard-coded the old branch name must be updated.
```

## Signing and signing off every commit

Every commit that lands in our repositories must be **both**:

- **Signed off** with a [Developer Certificate of Origin][dco] (DCO) `Signed-off-by:` trailer — `git commit -s`.
- **Cryptographically signed** with a key registered to your GitHub account — `git commit -S`.

The two work together. The sign-off is your _certification_ that you wrote the patch (or otherwise have the right to
submit it under the MIT licence); the signature is how we _verify_ that the sign-off genuinely comes from a real,
verified account rather than from someone typing your name. Our branch protection **rejects unsigned commits**, so a
pull request whose commits aren't signed cannot be merged — please set both up before you start.

The smoothest approach is to configure Git once so it signs automatically, then add `-s` whenever you commit:

```bash
git commit -s -m "docs: fix typo in the README"
```

### Sign off (DCO)

The sign-off appends a trailer using your configured name and email:

```text
Signed-off-by: Jane Doe <jane@example.com>
```

The name and email **must match** your commit author details (and a verified email on your GitHub account), so make sure
they're set:

```bash
git config --global user.name "Jane Doe"
git config --global user.email "jane@example.com"
```

By signing off, you certify the following:

```text
Developer Certificate of Origin
Version 1.1

By making a contribution to this project, I certify that:

(a) The contribution was created in whole or in part by me and I have
    the right to submit it under the open source license indicated in
    the file; or

(b) The contribution is based upon previous work that, to the best of my
    knowledge, is covered under an appropriate open source license and I
    have the right under that license to submit that work with
    modifications, whether created in whole or in part by me, under the
    same open source license (unless I am permitted to submit under a
    different license), as indicated in the file; or

(c) The contribution was provided directly to me by some other person
    who certified (a), (b) or (c) and I have not modified it.

(d) I understand and agree that this project and the contribution are
    public and that a record of the contribution (including all personal
    information I submit with it, including my sign-off) is maintained
    indefinitely and may be redistributed consistent with this project
    or the open source license(s) involved.
```

### Sign your commits

Tell Git to sign every commit with a key GitHub can verify. The quickest route is SSH signing, reusing the key you
already push with:

```bash
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519.pub
git config --global commit.gpgsign true
```

Then add that same key to GitHub a second time as a _Signing key_ (Settings → SSH and GPG keys → New SSH key → key type
**Signing Key**). GitHub will mark your commits **Verified**. Prefer GPG or S/MIME? GitHub's [commit signature
verification docs][signing] cover every option.

With `commit.gpgsign` enabled, `git commit -s` both signs and signs off. Note that signing (`-S`) and sign-off (`-s`)
are different things — we require both, so don't drop the `-s`. Made commits before configuring this? Re-sign and sign
off the whole branch at once:

```bash
git rebase --signoff --force-rebase upstream/main
```

Or fix just the latest commit with `git commit --amend -S -s --no-edit`.

## Opening a pull request

Pull requests target the upstream `main` branch, and our branch protection sets the bar for merging:

- **At least one approving review**, including from a code owner where a `CODEOWNERS` file defines one.
- **All review conversations resolved**, and a **green CI run** — run `make pr` locally first.
- **Signed, signed-off commits** throughout (see [above](#signing-and-signing-off-every-commit)).

To make review smooth:

- **Describe the change** and link the issue it addresses (for example, `Closes #123`).
- **Keep it focused.** One concern per pull request — split unrelated changes into separate ones.
- **Push before you request review.** New commits dismiss earlier approvals, so get the branch ready, then ask.
- **Be responsive** to feedback and resolve threads as you address them. We aim to be timely and kind in return.

We may ask for changes — that's a normal part of the process, not a judgement on you. Once it's approved and green, a
maintainer merges it: our automation fast-forwards your signed commits onto `main`, preserving their signatures and
keeping history linear.

## Questions?

If anything here is unclear, or you're not sure where to start, ask in [GitHub Discussions][discussions] — questions
live there rather than in the issue tracker, and we're happy to help. Thanks again for contributing, and welcome aboard.

[org]: https://github.com/bitwise-media-group
[discussions]: https://github.com/orgs/bitwise-media-group/discussions
[fork-pull]:
  https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/getting-started/about-collaborative-development-models#fork-and-pull-model
[conventional]: https://www.conventionalcommits.org/
[release-please]: https://github.com/googleapis/release-please
[dco]: https://developercertificate.org/
[signing]: https://docs.github.com/en/authentication/managing-commit-signature-verification
