From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 4 Sep 2018 11:50:02 -0700
Subject: [RFC PATCH 1/5] RISC-V: Make IPI triggering flexible
In-Reply-To: <20180904124514.6290-2-anup@brainfault.org>
References: <20180904124514.6290-1-anup@brainfault.org>
 <20180904124514.6290-2-anup@brainfault.org>
Message-ID: <20180904185001.GA25119@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Sep 04, 2018 at 06:15:10PM +0530, Anup Patel wrote:
> The mechanism to trigger IPI is generally part of interrupt-controller
> driver for various architectures. On RISC-V, we have an option to trigger
> IPI using SBI or SOC vendor can implement RISC-V CPU where IPI will be
> triggered using SOC interrupt-controller (e.g. custom PLIC).

Which is exactly what we want to avoid, and should not make it easy.

The last thing we need is non-standard whacky IPI mechanisms, and
that is why we habe SBI calls for it.  I think we should simply
stat that if an RISC-V cpu design bypasse the SBI for no good reason
we'll simply not support it.

So NAK for this patch.
