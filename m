From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 12 Jul 2018 14:31:43 +0200
Subject: [PATCH v2 3/7] riscv: Include asm-generic/compat.h
In-Reply-To: <20180712083258.GE8802@infradead.org>
References: <20180705213604.18883-1-deepa.kernel@gmail.com>
 <20180705213604.18883-4-deepa.kernel@gmail.com>
 <20180705222110.GA5698@infradead.org>
 <CABeXuvoj_WwvnaqY1wao+axx1JLpPte-iXP=Ti7jsT+r6VrVUg@mail.gmail.com>
 <CAK8P3a2L9z+Ok1Wd0=5F=Xt7nvqL6be+AS++F3rZzByN+a+9QA@mail.gmail.com>
 <20180712083258.GE8802@infradead.org>
Message-ID: <CAK8P3a2fh7OD2pFDDkBpbzqLugUpNbUZP-w-uH-FZtbAWg8jMg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Jul 12, 2018 at 10:32 AM, Christoph Hellwig <hch@infradead.org> wrote:
> On Fri, Jul 06, 2018 at 01:42:46PM +0200, Arnd Bergmann wrote:
>> We can also rename all the compat syscalls that are now shared
>> with 32-bit, e.g. using sys_waitid_time32() instead of
>> compat_sys_waitid(), and that would be consistent with the
>> new _time64() naming that we are introducing for some of them.
>
> Yes, please.  You'll need to touch the syscall tables anyway to refer to
> some new name, so it really isn't that much more work.

Ok. The downside is that we probably have to change the existing
architectures using those compat syscalls together, with one patch
renaming them in x86, powerpc, s390, mips, sparc and parisc, but
at least that is a fairly simple rename.

For the tables that are used on native 32-bit architectures
(asm-generic, arm, m68k, microblaze, mips, parisc, powerpc,
sh, sparc, x86 and xtensa), I'd still prefer following the plan of
changing them one architecture at a time in a separate patch,
but hopefully all in the same merge window.

>> Completely separating them from the compat code
>> would add further complexity though, as some of the
>> system calls take another argument that is different
>> between 32-bit and 64-bit kernels, in particular
>> pselect6, ppoll, io_pgetevents, recvmmsg, and waitid.
>
> Why would that create further complexity?  IFF those calls need compat
> work other than the time structures you will need additional variants of
> them anyway.  If the only compat handling is the time structures they
> will stay the same independent of the name.

Right now, each of the five syscalls has three variants in the current
implementation, e.g.

/* new native call using 64-bit time_t */
SYSCALL_DEFINE5(ppoll, struct pollfd __user *, ufds, unsigned int, nfds,
                struct __kernel_timespec __user *, tsp, const sigset_t
__user *, sigmask,
                size_t, sigsetsize)
...

/* handler for 32-bit time_t, both native and compat */
#ifdef CONFIG_COMPAT_32BIT_TIME
#ifndef CONFIG_COMPAT
/* ugly redirect to native types on 32-bit kernels */
#define compat_get_fd_set get_fd_set
#define compat_set_fd_set set_fd_set
#define compat_sigset_t sigset_t
#endif /* !CONFIG_COMPAT
COMPAT_SYSCALL_DEFINE5(ppoll, struct pollfd __user *, ufds,
        unsigned int,  nfds, struct compat_timespec __user *, tsp,
        const compat_sigset_t __user *, sigmask, compat_size_t, sigsetsize)
...
#endif /* CONFIG_COMPAT_32BIT_TIME */

/* compat handler for 64-bit time_t on 64-bit kernel */
#ifdef CONFIG_COMPAT
COMPAT_SYSCALL_DEFINE5(ppoll_time64, struct pollfd __user *, ufds,
        unsigned int,  nfds, struct __kernel_timespec __user *, tsp,
        const compat_sigset_t __user *, sigmask, compat_size_t, sigsetsize)
...
#endif

Avoiding that set of #defines as you suggest would definitely
make it cleaner, but then we need to have four variants instead
of three:

/* old native call using 32-bit time_t */
#if defined(CONFIG_COMPAT_32BIT_TIME) && !defined (CONFIG_64BIT)
SYSCALL_DEFINE5(ppoll, struct pollfd __user *, ufds, unsigned int, nfds,
                struct __kernel_old_timespec __user *, tsp, const
sigset_t __user *, sigmask,
                size_t, sigsetsize)
...
#endif

/* new native call using 64-bit time_t */
SYSCALL_DEFINE5(ppoll, struct pollfd __user *, ufds, unsigned int, nfds,
                struct __kernel_timespec __user *, tsp, const sigset_t
__user *, sigmask,
                size_t, sigsetsize)
...

#ifdef CONFIG_COMPAT
#ifdef CONFIG_COMPAT_32BIT_TIME
/* handler for 32-bit time_t, both native and compat */
COMPAT_SYSCALL_DEFINE5(ppoll, struct pollfd __user *, ufds,
        unsigned int,  nfds, struct compat_timespec __user *, tsp,
        const compat_sigset_t __user *, sigmask, compat_size_t, sigsetsize)
...
#endif /* CONFIG_COMPAT_32BIT_TIME */

/* compat handler for 64-bit time_t on 64-bit kernel */
#ifdef CONFIG_COMPAT
COMPAT_SYSCALL_DEFINE5(ppoll_time64, struct pollfd __user *, ufds,
        unsigned int,  nfds, struct __kernel_timespec __user *, tsp,
        const compat_sigset_t __user *, sigmask, compat_size_t, sigsetsize)
...
#endif /* CONFIG_COMPAT


I prototyped that approach now and ended up with
(relative to my current tested version):

 fs/aio.c        |  70 ++++++++++++++++------
 fs/select.c     | 181 +++++++++++++++++++++++++++++++++++++++++++++++++++-----
 kernel/signal.c |  35 ++++++++++-
 net/compat.c    |  31 ++++++++++
 net/socket.c    |  21 ++++---
 5 files changed, 293 insertions(+), 45 deletions(-)

Full diff is at https://pastebin.com/j8USJpLq. I've changed ppoll, pselect6,
recvmmsg, rt_sigtimedwait, and io_pgetevents here; waitid() was already
done with four entry points, which happened to be simpler there either
way. There are now around 270 lines of additional duplicated system call
definitions, but in return the code does make more sense that way. Some of
that duplication (in particular in fs/select.c) can probably be recovered by
rearranging the code. By fully decoupling the 32-bit time handling from
compat mode, we also need yet another timespec variant besides
timespec (long/long), timespec64 (kernel internal s64/long),
__kernel_timespec (uapi s64/s64), and compat_timespec (s32/s32),
or rename all instances of compat_timespec to __kernel_timespec32.

I'm not convinced that one way or another is better here, please let me know
what you think.

       Arnd
