From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 12 Jul 2018 15:51:10 +0200
Subject: [PATCH v2 3/7] riscv: Include asm-generic/compat.h
In-Reply-To: <CAMuHMdUOVdmeM9GohMQ6Ass8hWVDxezA0f+bKqGyH1OanMJtXA@mail.gmail.com>
References: <20180705213604.18883-1-deepa.kernel@gmail.com>
 <20180705213604.18883-4-deepa.kernel@gmail.com>
 <20180705222110.GA5698@infradead.org>
 <CABeXuvoj_WwvnaqY1wao+axx1JLpPte-iXP=Ti7jsT+r6VrVUg@mail.gmail.com>
 <CAK8P3a2L9z+Ok1Wd0=5F=Xt7nvqL6be+AS++F3rZzByN+a+9QA@mail.gmail.com>
 <CAMuHMdUOVdmeM9GohMQ6Ass8hWVDxezA0f+bKqGyH1OanMJtXA@mail.gmail.com>
Message-ID: <CAK8P3a0JS6Rc4FXKu80MHAxc4b8JGqEQ9M-=4gACRk4OQ+VN8Q@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Jul 12, 2018 at 2:42 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, Jul 6, 2018 at 1:43 PM Arnd Bergmann <arnd@arndb.de> wrote:
>> On Fri, Jul 6, 2018 at 1:56 AM, Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>> > On Thu, Jul 5, 2018 at 3:21 PM, Christoph Hellwig <hch@infradead.org> wrote:
>> >> On Thu, Jul 05, 2018 at 02:36:00PM -0700, Deepa Dinamani wrote:
>>
>> It would be easy to rename compat_time_t, compat_timespec and
>> compat_timeval to something else if we could come up with a good
>> name for them (we already have too many variants of each of
>> them though, otherwise we end up being more confusing rather
>> than less).
>
> legacy_time_t etc.?

I think it should have '32' in the name, otherwise it might lead to confusion
regarding the size, as we also need legacy types that use 'long' (either
32-bit or 64-bit) seconds, besides the modern types that are always
64-bit.

In the previous patches, we introduced in the uapi

__kernel_timespec:     always 64-bit (both seconds and nanoseconds)
__kernel_old_timeval: replaces timeval (variable 'long' seconds/nanoseconds)

The __kernel_ prefix here signifies structures that are used in the
uapi headers and are possibly included in user space but must not
conflict with user space defined types like 'timeval' that can use either
'long' or 'long long' seconds in user space.

I would suggest we use __kernel_old_timespec for the equivalent
timespec variant (long/long) for consistency. I originally thought we
wouldn't need that one, but now it looks more likely that we do.
I still think we won't need a 64-bit '__kernel_timeval' type, but
it depends on what we do about getrusage(), getitimer() and
adjtimex().

For the pure 32-bit types, I'd prefer 'old' over 'legacy', which is
similar to the existing  __kernel_old_dev_t, __kernel_gid_t, and
__kernel_old_uid_t types, but we don't need the __kernel_
prefix because we would not use them in uapi headers.

I don't see a need for replacing compat_time_t right now
(I may be missing something I had in mind earlier), but
for timespec/timeval/itimerspec, how about old_timespec32,
old_timeval32 and old_itimerspec32 to replace
compat_timespec, compat_timeval and compat_itimerspec?

For itimerval, we probably need a __kernel_old_itimerval,
but no __kernel_itimerval or old_itimerval, similar to what we
do for timeval.

      Arnd
