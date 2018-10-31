From: olof@lixom.net (Olof Johansson)
Date: Tue, 30 Oct 2018 17:05:19 -0700
Subject: [PATCH] RISC-V: lib: Fix build error for 64-bit
In-Reply-To: <20181031000413.30123-1-olof@lixom.net>
References: <20181031000413.30123-1-olof@lixom.net>
Message-ID: <CAOesGMg6L8+=ZFbH_ThUG3VrePrbBY0Bg5HWi+AiaEbNSOn_qA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Oct 30, 2018 at 5:04 PM Olof Johansson <olof@lixom.net> wrote:
>
> Fixes the following build error from tinyconfig:
>
> riscv64-unknown-linux-gnu-ld: kernel/sched/fair.o: in function `.L8':
> fair.c:(.text+0x70): undefined reference to `__lshrti3'
> riscv64-unknown-linux-gnu-ld: kernel/time/clocksource.o: in function `.L0 ':
> clocksource.c:(.text+0x334): undefined reference to `__lshrti3'

Err, fixed the whitespace in tishift.S while I was at it. Undo if you want.


-Olof
