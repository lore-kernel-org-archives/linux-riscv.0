From: anup@brainfault.org (Anup Patel)
Date: Wed, 5 Sep 2018 13:51:00 +0530
Subject: [RFC PATCH 5/5] clocksource: riscv_timer: Make timer interrupt as
 a per-CPU interrupt
In-Reply-To: <20180904185826.GE25119@infradead.org>
References: <20180904124514.6290-1-anup@brainfault.org>
 <20180904124514.6290-6-anup@brainfault.org>
 <20180904185826.GE25119@infradead.org>
Message-ID: <CAAhSdy2BBuuJbT5Rp8GG2baOXM++ERr1JuZoKTrmWqxhPxu5Cg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Sep 5, 2018 at 12:28 AM, Christoph Hellwig <hch@infradead.org> wrote:
> On Tue, Sep 04, 2018 at 06:15:14PM +0530, Anup Patel wrote:
>> Instead of directly calling RISC-V timer interrupt handler from
>> RISC-V local interrupt conntroller driver, this patch implements
>> RISC-V timer interrupt as a per-CPU interrupt using per-CPU APIs
>> of Linux IRQ subsystem.
>
> And the point of that is?  Except for introducing lots of pointless
> code of course..

Instead of short-circuiting timer interrupt from low-level IRQ handler, we use
Linux per-CPU IRQ handling for timer interrupt.

Without this patch, output of "cat /proc/interrupts" looks as follows:
           CPU0       CPU1       CPU2       CPU3
  8:          8         12         18          6  SiFive PLIC   8  virtio0
 10:          9         11          3          5  SiFive PLIC  10  ttyS0

With this patchset, output of "cat /proc/interrupts" looks as follows:
           CPU0       CPU1       CPU2       CPU3
  5:        995       1012        997       1015  RISC-V INTC   5 Edge
     riscv_timer
  8:         23          6         10          7  SiFive PLIC   8 Edge
     virtio0
 10:          9         10          5          4  SiFive PLIC  10 Edge
     ttyS0

Regards,
Anup
