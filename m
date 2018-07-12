From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 12 Jul 2018 01:32:58 -0700
Subject: [PATCH v2 3/7] riscv: Include asm-generic/compat.h
In-Reply-To: <CAK8P3a2L9z+Ok1Wd0=5F=Xt7nvqL6be+AS++F3rZzByN+a+9QA@mail.gmail.com>
References: <20180705213604.18883-1-deepa.kernel@gmail.com>
 <20180705213604.18883-4-deepa.kernel@gmail.com>
 <20180705222110.GA5698@infradead.org>
 <CABeXuvoj_WwvnaqY1wao+axx1JLpPte-iXP=Ti7jsT+r6VrVUg@mail.gmail.com>
 <CAK8P3a2L9z+Ok1Wd0=5F=Xt7nvqL6be+AS++F3rZzByN+a+9QA@mail.gmail.com>
Message-ID: <20180712083258.GE8802@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Jul 06, 2018 at 01:42:46PM +0200, Arnd Bergmann wrote:
> We can also rename all the compat syscalls that are now shared
> with 32-bit, e.g. using sys_waitid_time32() instead of
> compat_sys_waitid(), and that would be consistent with the
> new _time64() naming that we are introducing for some of them.

Yes, please.  You'll need to touch the syscall tables anyway to refer to
some new name, so it really isn't that much more work.

> Completely separating them from the compat code
> would add further complexity though, as some of the
> system calls take another argument that is different
> between 32-bit and 64-bit kernels, in particular
> pselect6, ppoll, io_pgetevents, recvmmsg, and waitid.

Why would that create further complexity?  IFF those calls need compat
work other than the time structures you will need additional variants of
them anyway.  If the only compat handling is the time structures they
will stay the same independent of the name.

> 
>        Arnd
---end quoted text---
