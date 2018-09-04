From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 4 Sep 2018 11:58:26 -0700
Subject: [RFC PATCH 5/5] clocksource: riscv_timer: Make timer interrupt
 as a per-CPU interrupt
In-Reply-To: <20180904124514.6290-6-anup@brainfault.org>
References: <20180904124514.6290-1-anup@brainfault.org>
 <20180904124514.6290-6-anup@brainfault.org>
Message-ID: <20180904185826.GE25119@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Sep 04, 2018 at 06:15:14PM +0530, Anup Patel wrote:
> Instead of directly calling RISC-V timer interrupt handler from
> RISC-V local interrupt conntroller driver, this patch implements
> RISC-V timer interrupt as a per-CPU interrupt using per-CPU APIs
> of Linux IRQ subsystem.

And the point of that is?  Except for introducing lots of pointless
code of course..
