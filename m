From: paul@paul-moore.com (Paul Moore)
Date: Thu, 25 Oct 2018 16:36:41 -0400
Subject: [PATCH 2/2] RISC-V: Add support for SECCOMP
In-Reply-To: <CAEn-LTovzRncSKCGv8wUTL6FkzcC+Hw1EBGe+Rc4GQyEgcK1uA@mail.gmail.com>
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-3-palmer@sifive.com>
 <CAEn-LTovzRncSKCGv8wUTL6FkzcC+Hw1EBGe+Rc4GQyEgcK1uA@mail.gmail.com>
Message-ID: <CAHC9VhT015tz4qZZ=vM6FowsUXLv-RYeBrH4C8d6jvg=XHumHA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Oct 25, 2018 at 2:31 PM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
> On Wed, Oct 24, 2018 at 10:40 PM Palmer Dabbelt <palmer@sifive.com> wrote:
> > From: "Wesley W. Terpstra" <wesley@sifive.com>

...

> Palmer,
>
> Half of the patch seems to touch audit parts. I started working on audit
> support this morning, and I can boot Fedora with audit traces.
>
> [root at fedora-riscv ~]# dmesg | grep audit
> [    0.312000] audit: initializing netlink subsys (disabled)
> [    0.316000] audit: type=2000 audit(0.316:1): state=initialized
> audit_enabled=0 res=1
> [    7.288000] audit: type=1130 audit(1529665913.772:2): pid=1 uid=0
> auid=4294967295 ses=4294967295 msg='unit=systemd-remount-fs
> comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
> terminal=? res=success'
> [    7.684000] audit: type=1130 audit(1529665914.176:3): pid=1 uid=0
> auid=4294967295 ses=4294967295 msg='unit=systemd-sysctl comm="systemd"
> exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=?
> res=success'
> [..]
>
> I am still working on audit user-space support for better testing.
>
> I suggest we first implement audit and then seccomp.

FYI, while small and far from comprehensive, we do have a test suite
we use for basic validation of the audit kernel bits which may be
helpful while you're working on the audit enablement:

* https://github.com/linux-audit/audit-testsuite

-- 
paul moore
www.paul-moore.com
