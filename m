From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Tue, 6 Nov 2018 22:25:20 +0100
Subject: [PATCH 0/2] riscv: add audit support
In-Reply-To: <CAHC9VhSaGo0BmX5AsTcnppiVz2Lz8BFkjRA0jg_uuPix3Ziiog@mail.gmail.com>
References: <20181029104854.17432-1-david.abdurachmanov@gmail.com>
 <CAHC9VhSaGo0BmX5AsTcnppiVz2Lz8BFkjRA0jg_uuPix3Ziiog@mail.gmail.com>
Message-ID: <CAEn-LTqQgQkA1XyihEg0MpADLPQADf3Ej2noUp29UtbcEaf0RA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Nov 6, 2018 at 9:06 PM Paul Moore <paul@paul-moore.com> wrote:
>
> On Mon, Oct 29, 2018 at 6:49 AM David Abdurachmanov
> <david.abdurachmanov@gmail.com> wrote:
> > This patchset adds system call audit support on riscv (riscv32 &
> > riscv64).
> >
> > The pachset was prepared on top of v4.19 tag.
> >
> > audit-userspace changes were submitted. See:
> > https://github.com/linux-audit/audit-userspace/pull/73
> >
> > Tested the following manually:
> > - auditctl (checked several different example rules from internet)
> > - aulast
> > - aulastlog
> > - ausearch
> > - ausyscall
> > - aureport
> > - autrace (compared some syscalls to strace: order and return
> >   value/input arguments seem to be correct)
> > - /proc/self/loginuid (required by DNF [package manager])
> >
> > I looked into audit-testsuite and with some adjustments results are:
> >
> > Failed 4/14 test programs. 19/88 subtests failed.
>
> I realize that the test suite failures are likely not due to your
> code, but rather shortcomings in the test suite itself, but I think it
> is important to resolve these problems before we commit the kernel
> changes.
>
> You mention Fedora 29/RISCV below, is that the distro you are using
> for testing?  Also, are you using a stock kernel config from the
> distro or your own?
>
> > The failing tests were due to missing CONFIG_IP_NF_MANGLE ...
>
> Assuming a general purpose like Fedora, that seems like an odd
> omission.  Any chance you can rebuild your kernel with the mangle
> table?

When we build Fedora, the kernel is not built in a standard way. It's only
build statically and contains minimal setup. We also don't do loadable
kernel modules, because there wasn't support for it months ago. It's
not tested yet by us.

I did rebuild with CONFIG_IP_NF_MANGLE, but I think, there was more
stuff missing. Have to look again.

I am experimenting on building kernel in normal Fedora way, but there
are some issues right now. It also takes 12-24 hours for a single attempt.

>
> > ... 'id -Z' not printing categories (don't know why) ...
>
> Are you seeing the MLS/MCS sensitivity level, s0, or are you not
> seeing any of the MLS/MCS fields?

I boot my VM "selinux=1 enforcing=0".

[root at fedora-riscv ~]# semanage login -l

Login Name           SELinux User         MLS/MCS Range        Service

__default__          unconfined_u         s0-s0:c0.c1023       *
root                 unconfined_u         s0-s0:c0.c1023       *
[root at fedora-riscv ~]# id -Z
unconfined_u:unconfined_r:unconfined_t:s0

>
> > ... not having loadable kernel module support enablled ...
>
> Much like the netfilter config, any chance you can enable this in your kernel?

Experimenting, not sure if it works yet.

>
> > ... and syscall_socketcall not being relevant for new arches.
>
> We will probably need to make that ABI dependent in the test suite.
>
> > audit-testsuite with adjustments:
> > https://github.com/davidlt/audit-testsuite/tree/riscv64
> >
> > Depends on:
> > [PATCH 1/2] Move EM_RISCV into elf-em.h
> > http://lists.infradead.org/pipermail/linux-riscv/2018-October/001885.html
> >
> > This should solve DNF issues in Fedora 29/RISCV.
>
> --
> paul moore
> www.paul-moore.com
