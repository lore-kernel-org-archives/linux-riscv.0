From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Sun, 28 Oct 2018 12:07:55 +0100
Subject: [PATCH 2/2] RISC-V: Add support for SECCOMP
In-Reply-To: <CAHC9VhT015tz4qZZ=vM6FowsUXLv-RYeBrH4C8d6jvg=XHumHA@mail.gmail.com>
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-3-palmer@sifive.com>
 <CAEn-LTovzRncSKCGv8wUTL6FkzcC+Hw1EBGe+Rc4GQyEgcK1uA@mail.gmail.com>
 <CAHC9VhT015tz4qZZ=vM6FowsUXLv-RYeBrH4C8d6jvg=XHumHA@mail.gmail.com>
Message-ID: <CAEn-LTonSqSG8GtgVmwt7ToJ2NZKsGEaWndmA0Q7Lzm316CFbA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Oct 25, 2018 at 10:36 PM Paul Moore <paul@paul-moore.com> wrote:
>
> On Thu, Oct 25, 2018 at 2:31 PM David Abdurachmanov
> <david.abdurachmanov@gmail.com> wrote:
> > On Wed, Oct 24, 2018 at 10:40 PM Palmer Dabbelt <palmer@sifive.com> wrote:
> > > From: "Wesley W. Terpstra" <wesley@sifive.com>
>
> ...
>
> > Palmer,
> >
> > Half of the patch seems to touch audit parts. I started working on audit
> > support this morning, and I can boot Fedora with audit traces.
> >
> > [root at fedora-riscv ~]# dmesg | grep audit
> > [    0.312000] audit: initializing netlink subsys (disabled)
> > [    0.316000] audit: type=2000 audit(0.316:1): state=initialized
> > audit_enabled=0 res=1
> > [    7.288000] audit: type=1130 audit(1529665913.772:2): pid=1 uid=0
> > auid=4294967295 ses=4294967295 msg='unit=systemd-remount-fs
> > comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
> > terminal=? res=success'
> > [    7.684000] audit: type=1130 audit(1529665914.176:3): pid=1 uid=0
> > auid=4294967295 ses=4294967295 msg='unit=systemd-sysctl comm="systemd"
> > exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=?
> > res=success'
> > [..]
> >
> > I am still working on audit user-space support for better testing.
> >
> > I suggest we first implement audit and then seccomp.
>
> FYI, while small and far from comprehensive, we do have a test suite
> we use for basic validation of the audit kernel bits which may be
> helpful while you're working on the audit enablement:
>
> * https://github.com/linux-audit/audit-testsuite

Currently I checked the following to work:
- /proc/self/loginuid (required by DNF [package manager])
- auditctl (checked several different example rules from internet)
- aulast
- aulastlog
- ausearch
- ausyscall
- aureport
- autrace (compared some syscalls to strace: order and
  return value/input arguments seems to be correct)

I checked audit-testsuite yesterday and it seems to be only for
x86-64 / x86-32. After adjusting it (MODE, syscalls) I am at:

Failed 4/14 test programs. 19/88 subtests failed.

I don't plan to look further in the failure, e.g.:
- syscall_socketcall: that's an old stuff and not relevant to
  new arches
- syscall_module: Fedora kernel currently is not compiled
  with kernel loadable module support
- filter_exclude: two tests fail because id -Z doesn't print
  any categories, but "semanage login -l" output is identical
  between x86_64 and riscv64
- netfilter_pkt: don't have CONFIG_IP_NF_MANGLE enabled

Fedora kernel currently has minimal CONFIG_* options
and is built without loadable module support.

I will send the patches for review soon.

david
