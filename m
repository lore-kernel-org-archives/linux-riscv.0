From: arnd@arndb.de (Arnd Bergmann)
Date: Fri, 6 Jul 2018 13:42:46 +0200
Subject: [PATCH v2 3/7] riscv: Include asm-generic/compat.h
In-Reply-To: <CABeXuvoj_WwvnaqY1wao+axx1JLpPte-iXP=Ti7jsT+r6VrVUg@mail.gmail.com>
References: <20180705213604.18883-1-deepa.kernel@gmail.com>
 <20180705213604.18883-4-deepa.kernel@gmail.com>
 <20180705222110.GA5698@infradead.org>
 <CABeXuvoj_WwvnaqY1wao+axx1JLpPte-iXP=Ti7jsT+r6VrVUg@mail.gmail.com>
Message-ID: <CAK8P3a2L9z+Ok1Wd0=5F=Xt7nvqL6be+AS++F3rZzByN+a+9QA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Jul 6, 2018 at 1:56 AM, Deepa Dinamani <deepa.kernel@gmail.com> wrote:
> On Thu, Jul 5, 2018 at 3:21 PM, Christoph Hellwig <hch@infradead.org> wrote:
>> On Thu, Jul 05, 2018 at 02:36:00PM -0700, Deepa Dinamani wrote:
>>> defconfig, allmodconfig and nomodconfig.
>>> And hence does not inlude definitions for compat data types.
>>>
>>> Now that time syscalls are being reused in non CONFIG_COMPAT
>>> modes, include asm-generic definitions for riscv.
>>>
>>> Alternative would be to make compat_time.h to be conditional on
>>> CONFIG_COMPAT_32BIT_TIME. But, since riscv is already has an
>>> asm/compat.h include the generic version instead.
>>
>> Two comments here:
>>
>> First I think the current riscv compat.h is completely bogus.
>> As you mentioned riscv does not actually have a compat mode, so
>> having a compat.h makes no sensse at all, and the COMPAT_UTS_MACHINE
>> override which is the only thing implemented is included in that
>> statement.
>
> I was leaving the decision on how to clean up compat mode to the
> architecture maintainers.
> I wasn't sure if they were still in the middle of implementing it.

If we only need it for 32 bit time_t, we can probably just use the
asm-generic/compat.h for now.

>> Second I think abusing compat.h for old syscall compatibility of any
>> form is a really bad idea.  I think you need to split that part out,
>> and preferably not using compat in the name, but something like
>> old-time.h or time32.h for the name.
>
> Are you talking about just the header file or the way we are reusing
> compat syscalls?
> Either way, we have merged quite a few patches this way already.
> I agree that having something like time32.h might be less confusing.
> But, if you are worried about the former, then maybe we should propose
> a cleanup after we finish what we are doing or back out the merged
> patches.
> For instance, posix_clock apis have already been changed this way.

It would be easy to rename compat_time_t, compat_timespec and
compat_timeval to something else if we could come up with a good
name for them (we already have too many variants of each of
them though, otherwise we end up being more confusing rather
than less).

We can also rename all the compat syscalls that are now shared
with 32-bit, e.g. using sys_waitid_time32() instead of
compat_sys_waitid(), and that would be consistent with the
new _time64() naming that we are introducing for some of them.
Right now, this affects around 30 syscalls; with my test tree on
ARM, I have this set of calls, the exact set is architecture
dependent of course:

compat_sys_time
compat_sys_stime
compat_sys_utime
compat_sys_gettimeofday
compat_sys_settimeofday
compat_sys_old_select
compat_sys_setitimer
compat_sys_getitimer
compat_sys_select
compat_sys_sched_rr_get_interval
compat_sys_nanosleep
compat_sys_rt_sigtimedwait
compat_sys_futex
compat_sys_io_getevents
compat_sys_timer_settime
compat_sys_timer_gettime
compat_sys_clock_settime
compat_sys_clock_gettime
compat_sys_clock_getres
compat_sys_clock_nanosleep
compat_sys_utimes
compat_sys_mq_timedsend
compat_sys_mq_timedreceive
compat_sys_futimesat
compat_sys_pselect6
compat_sys_ppoll
compat_sys_utimensat
compat_sys_timerfd_settime
compat_sys_timerfd_gettime
compat_sys_recvmmsg
compat_sys_io_pgetevents

Completely separating them from the compat code
would add further complexity though, as some of the
system calls take another argument that is different
between 32-bit and 64-bit kernels, in particular
pselect6, ppoll, io_pgetevents, recvmmsg, and waitid.

       Arnd
