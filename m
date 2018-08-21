From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 21 Aug 2018 00:49:06 -0700
Subject: [RFC PATCH 4/5] RISC-V: Move interrupt cause declarations to irq.h
In-Reply-To: <1534377377-70108-5-git-send-email-atish.patra@wdc.com>
References: <1534377377-70108-1-git-send-email-atish.patra@wdc.com>
 <1534377377-70108-5-git-send-email-atish.patra@wdc.com>
Message-ID: <20180821074906.GB28079@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Aug 15, 2018 at 04:56:16PM -0700, Atish Patra wrote:
> CPU hotplug code in smpboot requires interrupt cause
> to identify the cause of cpu wakeup.
> 
> Move the IRQ cause declarations to appropriate header
> file.

asm/irq.h is a header indirectly included by just about every
driver.  This is a very bad place for such internal definitions.
