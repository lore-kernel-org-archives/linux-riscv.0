From: olof@lixom.net (Olof Johansson)
Date: Tue, 30 Oct 2018 23:43:12 -0700
Subject: [PATCH] RISC-V: lib: Fix build error for 64-bit
In-Reply-To: <CAOesGMg6L8+=ZFbH_ThUG3VrePrbBY0Bg5HWi+AiaEbNSOn_qA@mail.gmail.com>
References: <20181031000413.30123-1-olof@lixom.net>
 <CAOesGMg6L8+=ZFbH_ThUG3VrePrbBY0Bg5HWi+AiaEbNSOn_qA@mail.gmail.com>
Message-ID: <CAOesGMh8zq=vK0ARqK-1S4MYn7kg541u+dziKqnGuswrCi=n1A@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Oct 30, 2018 at 5:05 PM Olof Johansson <olof@lixom.net> wrote:
>
> On Tue, Oct 30, 2018 at 5:04 PM Olof Johansson <olof@lixom.net> wrote:
> >
> > Fixes the following build error from tinyconfig:
> >
> > riscv64-unknown-linux-gnu-ld: kernel/sched/fair.o: in function `.L8':
> > fair.c:(.text+0x70): undefined reference to `__lshrti3'
> > riscv64-unknown-linux-gnu-ld: kernel/time/clocksource.o: in function `.L0 ':
> > clocksource.c:(.text+0x334): undefined reference to `__lshrti3'
>
> Err, fixed the whitespace in tishift.S while I was at it. Undo if you want.

Ended up with a few more fixes, so I split this in two and will repost
as a series. Apologies for the noise.


-Olof
