# Systemd is awesome as a shell script replacement but probably overkill

I was working on making some of my i3 startup programs into SystemD user
units, which allow me to just trigger `systemctl --user start <program>`
to run things like picom (an X11 compositor, lets me have a transparent
terminal). However, when I came across wanting to translate all my
`xrandr` fuckery to SystemD, I thought "Ah, no, can't do this, it dies
after it runs".

But then I wondered if SystemD _could_ do that. Would shell scripts be
the proper way to do this for a personal user? Almost definitely. But
that'd be boring in my opinion, so I looked it up.

It can! SystemD has a service unit type called `oneshot` which is
basically the same as a service but it reports as "active" if all the
`Exec*` commands succeed. You can also use it to call multiple
consecutive commands.

For example:

```ini
[Unit]
Description=unga bunga

[Service]
Type=oneshot
RemainAfterExit=yet
ExecStart=/bin/bash -c "echo First"
ExecStart=/bin/bash -c "echo Second"
ExecStart=/bin/bash -c "echo Third"

[Install]
WantedBy=multi-user.target
```

Then I can just run `systemctl --user start <name>` like I would other
services, but it just runs a set of commands instead of a persistent
daemon.

Interesting stuff.

## References

- https://www.redhat.com/sysadmin/systemd-oneshot-service

