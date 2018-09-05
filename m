From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 5 Sep 2018 11:58:38 -0700
Subject: [RFC PATCH 4/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <CAAhSdy3-mM-zyYOvQBR+JsRTZGZWUF=4Y=0jTKhVMAYPxOfJ6Q@mail.gmail.com>
References: <20180904124514.6290-1-anup@brainfault.org>
 <20180904124514.6290-5-anup@brainfault.org>
 <20180904185755.GD25119@infradead.org>
 <CAAhSdy3-mM-zyYOvQBR+JsRTZGZWUF=4Y=0jTKhVMAYPxOfJ6Q@mail.gmail.com>
Message-ID: <20180905185838.GC15741@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Sep 05, 2018 at 11:39:01AM +0530, Anup Patel wrote:
> Previously submitted driver, registered separate irq_domain for
> each CPU and local IRQs were registered as regular IRQs to IRQ
> subsystem.
> (Refer, https://www.spinics.net/lists/devicetree/msg241230.html)

And we reject that driver approach for good reason and are now
doing the architectualy low-level irq handling in common code
without any need whatsover to duplicate information in the
privileged spec in DT. 
