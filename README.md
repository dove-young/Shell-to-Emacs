Shell-to-Emacs 
==============

Interact with Emacs from ordinary Shell.

Many many years ago, people used to **live** in Emacs because it is so comfortable to live in. But
as time goes on, we find its harder and harder to live in Emacs.  We used to live in Shells
today. And we still enjoy with Emacs, all the time.

But you know, switching between Emacs & Shells are very bad, because a switch means an
**interrupt**, and you'd need to switch a countless times a day.

In order to sweep these interruptions away, I'd like to trigger my favorite Emacs functions directly
in Shell. Just in the place where I am working on, and just in the time when I am thinking about
it. Technically it is not complex to have Emacs run as a daemon and accomplish these by calling
**emacsclient** in a Shell.

When we get there, we can step a little further -- We used to think Emacs as a text editor (of
course someone think it is actually an OS), that is it. But we can also think Emacs as a fantastic
**Library**. We can customize some eLisp code and expose them through **emacsclient**. That's
treasures.

And I don't mean EShell. It's a fantastic implementation but it is still not powerful enough in my
daily work.

This would be a long way to go. Let's initiate it and keep walking.

Example: 
----------

These examples are very straightforward if you are familiar with EShell.

```
vc-dir ~/Shell/branch_dev
dired ~/Shell/branch_dev
ff ~/Shell/branch_dev/bashrc
ec
manual-entry wget
esh
```
