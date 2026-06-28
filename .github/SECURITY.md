# Security Policy

This policy applies to every repository in the [Bitwise Media Group][org] organisation. Some repositories ship their
own `SECURITY.md` with a product-specific threat model; where one exists, it takes precedence over this policy.

## Reporting a vulnerability

Please report security vulnerabilities **privately** through GitHub Security Advisories on the affected repository: open
its **Security** tab and choose **Report a vulnerability**. Do not open public issues, discussions, or pull requests for
security reports.

So we can assess and reproduce the issue quickly, include the affected version or commit, the impact you've identified,
and steps to reproduce or a proof of concept where you can.

We'll acknowledge your report, work with you to confirm and understand the issue, and keep you updated as we prepare a
fix. We're grateful for coordinated disclosure — please give us a reasonable opportunity to ship a fix before any public
write-up.

## Supported versions

Unless a repository states otherwise, security fixes land on the latest release and the default branch. We don't
backport fixes to older releases, so upgrading to the latest version is the best way to stay protected.

## Code scanning triage

Repositories that run CodeQL triage their findings under `security/code-scanning/`, with a short report per finding
recording why it was dismissed or how it was remediated.

[org]: https://github.com/bitwise-media-group
