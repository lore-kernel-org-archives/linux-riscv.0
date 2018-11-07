From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Wed, 7 Nov 2018 11:45:53 +0100
Subject: [PATCH 0/2] riscv: add audit support
In-Reply-To: <CAEn-LTqQgQkA1XyihEg0MpADLPQADf3Ej2noUp29UtbcEaf0RA@mail.gmail.com>
References: <20181029104854.17432-1-david.abdurachmanov@gmail.com>
 <CAHC9VhSaGo0BmX5AsTcnppiVz2Lz8BFkjRA0jg_uuPix3Ziiog@mail.gmail.com>
 <CAEn-LTqQgQkA1XyihEg0MpADLPQADf3Ej2noUp29UtbcEaf0RA@mail.gmail.com>
Message-ID: <CAEn-LTqizbzTkbE3vvdxKsb-cHOWbRStOZaNfNo5sNuC5LhxMQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Nov 6, 2018 at 10:25 PM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
>
> On Tue, Nov 6, 2018 at 9:06 PM Paul Moore <paul@paul-moore.com> wrote:
> >
> > On Mon, Oct 29, 2018 at 6:49 AM David Abdurachmanov
> > <david.abdurachmanov@gmail.com> wrote:
> > > This patchset adds system call audit support on riscv (riscv32 &
> > > riscv64).
> > >
> > > The pachset was prepared on top of v4.19 tag.
> > >
> > > audit-userspace changes were submitted. See:
> > > https://github.com/linux-audit/audit-userspace/pull/73
> > >
> > > Tested the following manually:
> > > - auditctl (checked several different example rules from internet)
> > > - aulast
> > > - aulastlog
> > > - ausearch
> > > - ausyscall
> > > - aureport
> > > - autrace (compared some syscalls to strace: order and return
> > >   value/input arguments seem to be correct)
> > > - /proc/self/loginuid (required by DNF [package manager])
> > >
> > > I looked into audit-testsuite and with some adjustments results are:
> > >
> > > Failed 4/14 test programs. 19/88 subtests failed.
> >
> > I realize that the test suite failures are likely not due to your
> > code, but rather shortcomings in the test suite itself, but I think it
> > is important to resolve these problems before we commit the kernel
> > changes.

I did some extra work this evening (well, after midnight) and I am passing
all bits I would expect to pass.

Test Summary Report
-------------------
syscall_socketcall/test (Wstat: 0 Tests: 3 Failed: 3)
  Failed tests:  1-3
Files=14, Tests=88, 107 wallclock secs ( 1.07 usr  0.38 sys + 58.77
cusr 19.32 csys = 79.54 CPU)
Result: FAIL
Failed 1/14 test programs. 3/88 subtests failed.

The only failing test now is syscall_socketcall, which is not supported on
riscv and others.

>From man page:

On a some architectures-for example, x86-64 and ARM?there is no
       socketcall() system call; instead socket(2), accept(2), bind(2), and
       so on really are implemented as separate system calls.

Then I redone syscall_socketcall test to fit new 64-bit arches. It still
mostly checks the same thing, but uses different syscall. Instead of
socketcall(SYS_CONNECT, ..) we check for connect(..). This will not
generate SOCKETCALL record, thus instead check for SYSCALL
record where syscall=connect.

All is here: https://github.com/davidlt/audit-testsuite/commits/riscv64

With that:

Running as   user    root
        with context unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
        on   system  Fedora

exec_execve/test ......... ok
exec_name/test ........... ok
file_create/test ......... ok
file_delete/test ......... ok
file_rename/test ......... ok
filter_exclude/test ...... ok
filter_sessionid/test .... ok
login_tty/test ........... ok
lost_reset/test .......... ok
netfilter_pkt/test ....... ok
syscalls_file/test ....... ok
syscall_module/test ...... ok
syscall_socketcall/test .. ok
user_msg/test ............ ok
All tests successful.
Files=14, Tests=88, 123 wallclock secs ( 1.26 usr  0.59 sys + 70.85
cusr 22.60 csys = 95.30 CPU)
Result: PASS

Same audit kernel patch and libaudit, nothing changed here.

Hopefully this allows to move forward as I would love to have
audit & seccomp in the next kernel version (and thus Fedora).

Thanks,
david
