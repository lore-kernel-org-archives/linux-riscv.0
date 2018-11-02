From: keescook@chromium.org (Kees Cook)
Date: Fri, 2 Nov 2018 08:51:55 -0700
Subject: [PATCH 2/2] RISC-V: Add support for SECCOMP
In-Reply-To: <CAEn-LTr6eTgy4HsxT2y_LhXXtQczJNZmQJdY-em-maDOcFL9fA@mail.gmail.com>
References: <CAEn-LTonSqSG8GtgVmwt7ToJ2NZKsGEaWndmA0Q7Lzm316CFbA@mail.gmail.com>
 <mhng-71c7a4db-432a-4f97-86cd-1fe16091a6c8@palmer-si-x1c4>
 <CAEn-LTr6eTgy4HsxT2y_LhXXtQczJNZmQJdY-em-maDOcFL9fA@mail.gmail.com>
Message-ID: <CAGXu5jLhDxRHYe2kZ3wDJThsbkDMsZHt3ufM7YG_L0y0fU+brw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Nov 2, 2018 at 6:32 AM, David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
> On Mon, Oct 29, 2018 at 9:27 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Sun, 28 Oct 2018 04:07:55 PDT (-0700), david.abdurachmanov at gmail.com wrote:
>> > On Thu, Oct 25, 2018 at 10:36 PM Paul Moore <paul@paul-moore.com> wrote:
>> >>
>> >> On Thu, Oct 25, 2018 at 2:31 PM David Abdurachmanov
>> >> <david.abdurachmanov@gmail.com> wrote:
>> >> > On Wed, Oct 24, 2018 at 10:40 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>> >> > > From: "Wesley W. Terpstra" <wesley@sifive.com>
>> >>
>> >> ...
>> >>
>> >> > Palmer,
>> >> >
>> >> > Half of the patch seems to touch audit parts. I started working on audit
>> >> > support this morning, and I can boot Fedora with audit traces.
>> >> >
>> >> > [root at fedora-riscv ~]# dmesg | grep audit
>> >> > [    0.312000] audit: initializing netlink subsys (disabled)
>> >> > [    0.316000] audit: type=2000 audit(0.316:1): state=initialized
>> >> > audit_enabled=0 res=1
>> >> > [    7.288000] audit: type=1130 audit(1529665913.772:2): pid=1 uid=0
>> >> > auid=4294967295 ses=4294967295 msg='unit=systemd-remount-fs
>> >> > comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
>> >> > terminal=? res=success'
>> >> > [    7.684000] audit: type=1130 audit(1529665914.176:3): pid=1 uid=0
>> >> > auid=4294967295 ses=4294967295 msg='unit=systemd-sysctl comm="systemd"
>> >> > exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=?
>> >> > res=success'
>> >> > [..]
>> >> >
>> >> > I am still working on audit user-space support for better testing.
>> >> >
>> >> > I suggest we first implement audit and then seccomp.
>> >>
>> >> FYI, while small and far from comprehensive, we do have a test suite
>> >> we use for basic validation of the audit kernel bits which may be
>> >> helpful while you're working on the audit enablement:
>> >>
>> >> * https://github.com/linux-audit/audit-testsuite
>> >
>> > Currently I checked the following to work:
>> > - /proc/self/loginuid (required by DNF [package manager])
>> > - auditctl (checked several different example rules from internet)
>> > - aulast
>> > - aulastlog
>> > - ausearch
>> > - ausyscall
>> > - aureport
>> > - autrace (compared some syscalls to strace: order and
>> >   return value/input arguments seems to be correct)
>> >
>> > I checked audit-testsuite yesterday and it seems to be only for
>> > x86-64 / x86-32. After adjusting it (MODE, syscalls) I am at:
>> >
>> > Failed 4/14 test programs. 19/88 subtests failed.
>> >
>> > I don't plan to look further in the failure, e.g.:
>> > - syscall_socketcall: that's an old stuff and not relevant to
>> >   new arches
>> > - syscall_module: Fedora kernel currently is not compiled
>> >   with kernel loadable module support
>> > - filter_exclude: two tests fail because id -Z doesn't print
>> >   any categories, but "semanage login -l" output is identical
>> >   between x86_64 and riscv64
>> > - netfilter_pkt: don't have CONFIG_IP_NF_MANGLE enabled
>> >
>> > Fedora kernel currently has minimal CONFIG_* options
>> > and is built without loadable module support.
>> >
>> > I will send the patches for review soon.
>>
>> Thanks!
>
> I fixed the last issue I see with SECCOMP this morning.

Can you CC me on the series? I'd love to take a look.

> I also have patch on top of libseccomp-2.3.3.

Nice! If you toss it up on github I can review that too. :)

-Kees

>
> Testsuite results for SIM:
>
> Regression Test Summary
>  tests run: 4434
>  tests skipped: 88
>  tests passed: 4434
>  tests failed: 0
>  tests errored: 0
>
> Testsuite results for LIVE:
>
> Regression Test Summary
>  tests run: 6
>  tests skipped: 0
>  tests passed: 6
>  tests failed: 0
>  tests errored: 0
>
> Then tested a couple examples manually w/ and w/o BPF and it
> performed the same as on x86_64 (also checked exit codes &
> strace output).
>
> Upstream libseccomp has now more tests. Once I rebase & re-test
> with master of libseccomp, I will send both.
>
> david



-- 
Kees Cook
