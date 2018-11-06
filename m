From: paul@paul-moore.com (Paul Moore)
Date: Tue, 6 Nov 2018 15:06:01 -0500
Subject: [PATCH 0/2] riscv: add audit support
In-Reply-To: <20181029104854.17432-1-david.abdurachmanov@gmail.com>
References: <20181029104854.17432-1-david.abdurachmanov@gmail.com>
Message-ID: <CAHC9VhSaGo0BmX5AsTcnppiVz2Lz8BFkjRA0jg_uuPix3Ziiog@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Oct 29, 2018 at 6:49 AM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
> This patchset adds system call audit support on riscv (riscv32 &
> riscv64).
>
> The pachset was prepared on top of v4.19 tag.
>
> audit-userspace changes were submitted. See:
> https://github.com/linux-audit/audit-userspace/pull/73
>
> Tested the following manually:
> - auditctl (checked several different example rules from internet)
> - aulast
> - aulastlog
> - ausearch
> - ausyscall
> - aureport
> - autrace (compared some syscalls to strace: order and return
>   value/input arguments seem to be correct)
> - /proc/self/loginuid (required by DNF [package manager])
>
> I looked into audit-testsuite and with some adjustments results are:
>
> Failed 4/14 test programs. 19/88 subtests failed.

I realize that the test suite failures are likely not due to your
code, but rather shortcomings in the test suite itself, but I think it
is important to resolve these problems before we commit the kernel
changes.

You mention Fedora 29/RISCV below, is that the distro you are using
for testing?  Also, are you using a stock kernel config from the
distro or your own?

> The failing tests were due to missing CONFIG_IP_NF_MANGLE ...

Assuming a general purpose like Fedora, that seems like an odd
omission.  Any chance you can rebuild your kernel with the mangle
table?

> ... 'id -Z' not printing categories (don't know why) ...

Are you seeing the MLS/MCS sensitivity level, s0, or are you not
seeing any of the MLS/MCS fields?

> ... not having loadable kernel module support enablled ...

Much like the netfilter config, any chance you can enable this in your kernel?

> ... and syscall_socketcall not being relevant for new arches.

We will probably need to make that ABI dependent in the test suite.

> audit-testsuite with adjustments:
> https://github.com/davidlt/audit-testsuite/tree/riscv64
>
> Depends on:
> [PATCH 1/2] Move EM_RISCV into elf-em.h
> http://lists.infradead.org/pipermail/linux-riscv/2018-October/001885.html
>
> This should solve DNF issues in Fedora 29/RISCV.

-- 
paul moore
www.paul-moore.com
