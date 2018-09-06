From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 6 Sep 2018 12:37:28 +0200
Subject: [PATCH] y2038: Remove newstat family from default syscall set
In-Reply-To: <mhng-a047b20f-8546-4762-bcf0-f884be595b92@palmer-si-x1c4>
References: <20180901174353.GA14271@roeck-us.net>
 <mhng-a047b20f-8546-4762-bcf0-f884be595b92@palmer-si-x1c4>
Message-ID: <CAK8P3a2kS-vF954NA6QmN=d6DsnhCqESCBu_X2cdrx5gkR8HKg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Sep 6, 2018 at 11:45 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> On Sat, 01 Sep 2018 10:43:53 PDT (-0700), linux at roeck-us.net wrote:
> >
> > +#define __ARCH_WANT_NEW_STAT
> >  #define __ARCH_WANT_SYS_CLONE
> >  #include <uapi/asm/unistd.h>
> >  #include <uapi/asm/syscalls.h>
>
> I'm afraid I'm not sure what the right thing to do here is either, but from the
> patch description it does seem like we should have this guarded by an "#ifdef
> CONFIG_32BIT" so we can keep it out of our 32-bit ABI (which isn't in glibc
> yet, so isn't stable) in favor of statx() (or maybe stat64()?).

I think the patch is correct.

> The one
> problem here is that I can't find "newstat" anywhere in glibc to verify it's
> actually supposed to be part of our 64-bit ABI, though I can find a bunch of
> references to "statx" that seem to indicate it's meant to be present.
>
> That said, assuming you don't have anything wacky going on in userspace if this
> breaks the ABI then it breaks the ABI, so however newstat got into a binary we
> still need to keep it around.  Poking around my Fedora glibc image I see
>
>     000000000009b040 <__xstat>:
>        9b040:       e51d                    bnez    a0,9b06e <__xstat+0x2e>
>        9b042:       04f00893                li      a7,79
>        9b046:       f9c00513                li      a0,-100
>        9b04a:       4681                    li      a3,0
>        9b04c:       00000073                ecall
>
> which seems to coorespond with sys_newfstatat, which indicates to me we should
> have it in the 64-bit ABI.

In uapi/asm-generic/unistd.h we have

#if defined(__ARCH_WANT_NEW_STAT) || defined(__ARCH_WANT_STAT64)
#define __NR3264_fstatat 79
__SC_3264(__NR3264_fstatat, sys_fstatat64, sys_newfstatat)
#define __NR3264_fstat 80
__SC_3264(__NR3264_fstat, sys_fstat64, sys_newfstat)
#endif
#define __NR_newfstatat __NR3264_fstatat
#define __NR_fstat __NR3264_fstat
#if __BITS_PER_LONG == 64 && !defined(__SYSCALL_COMPAT)
#else
#define __NR_fstatat64 __NR3264_fstatat
#define __NR_fstat64 __NR3264_fstat
#endif

So in the kernel, we have two families of implementations, both
with awful historic names:

On 64-bit systems, we have __NR_newfstatat pointing to sys_newfstatat
(with a 'struct stat argument), and on 32-bit systems we have
__NR_fstatat64 pointing to sys_fstatat64 (with a struct stat64 argument).

In glibc, we have __xstat, which calls __NR_newfstatat on 64-bit systems,
and __NR_fstatat64 on 32-bit systems. The result is the same in both
cases, the only user-visible difference is the layout of the atime/mtime/ctime
fields.

       Arnd
