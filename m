Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA84C6FA86
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 21:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cyQ2hoiVh4CbIOni1oxEZUcTZ8FUeCnw1sHaU8cXII0=; b=IxF0GpX8EolpQT
	d9IokfnUOwBNRHOOt3pY9XsT2xOJ3hNCNxZoJcdFB22YHBW5jriNpZDnl5stvNJTR6iYDLJh+3Pc3
	X36hJY1mjKCsOuSjE1VaWyfCEdOEFHm3Xkfyu1+EoaEUO2R8kYDzuFr+hQPQYQzCvCotqUDkpcQcG
	BPGApo9GSGYJAaxcNs2ip3y6UHCXEdADOqAxloCvm1T+MsvZCSE4FcxdSJFW0evMQHeSBCpTqka0l
	M141coSz27MU2B3AlYmsBzDBQmydndnweglFqL/m7MFl7iSM+izihKx5J1m/xUv67IMxaN0zDhjhq
	VE9PjISFcZ0QUdcGYc6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obUB8-000QIi-Eq; Thu, 22 Sep 2022 21:56:18 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obUB5-000QGw-B6
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 21:56:17 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id C603B92009C; Thu, 22 Sep 2022 23:56:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id B734292009B;
	Thu, 22 Sep 2022 22:56:06 +0100 (BST)
Date: Thu, 22 Sep 2022 22:56:06 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: Make port I/O string accessors actually work
Message-ID: <alpine.DEB.2.21.2209220223080.29493@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_145615_587236_8F03607A 
X-CRM114-Status: GOOD (  12.77  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Fix port I/O string accessors such as `insb', `outsb', etc. which use 
the physical PCI port I/O address rather than the corresponding memory 
mapping to get at the requested location, which in turn breaks at least 
accesses made by our parport driver to a PCIe parallel port such as:

PCI parallel port detected: 1415:c118, I/O at 0x1000(0x1008), IRQ 20
parport0: PC-style at 0x1000 (0x1008), irq 20, using FIFO [PCSPP,TRISTATE,COMPAT,EPP,ECP]

causing a memory access fault:

Unable to handle kernel access to user memory without uaccess routines at virtual address 0000000000001008
Oops [#1]
Modules linked in:
CPU: 1 PID: 350 Comm: cat Not tainted 6.0.0-rc2-00283-g10d4879f9ef0-dirty #23
Hardware name: SiFive HiFive Unmatched A00 (DT)
epc : parport_pc_fifo_write_block_pio+0x266/0x416
 ra : parport_pc_fifo_write_block_pio+0xb4/0x416
epc : ffffffff80542c3e ra : ffffffff80542a8c sp : ffffffd88899fc60
 gp : ffffffff80fa2700 tp : ffffffd882b1e900 t0 : ffffffd883d0b000
 t1 : ffffffffff000002 t2 : 4646393043330a38 s0 : ffffffd88899fcf0
 s1 : 0000000000001000 a0 : 0000000000000010 a1 : 0000000000000000
 a2 : ffffffd883d0a010 a3 : 0000000000000023 a4 : 00000000ffff8fbb
 a5 : ffffffd883d0a001 a6 : 0000000100000000 a7 : ffffffc800000000
 s2 : ffffffffff000002 s3 : ffffffff80d28880 s4 : ffffffff80fa1f50
 s5 : 0000000000001008 s6 : 0000000000000008 s7 : ffffffd883d0a000
 s8 : 0004000000000000 s9 : ffffffff80dc1d80 s10: ffffffd8807e4000
 s11: 0000000000000000 t3 : 00000000000000ff t4 : 393044410a303930
 t5 : 0000000000001000 t6 : 0000000000040000
status: 0000000200000120 badaddr: 0000000000001008 cause: 000000000000000f
[<ffffffff80543212>] parport_pc_compat_write_block_pio+0xfe/0x200
[<ffffffff8053bbc0>] parport_write+0x46/0xf8
[<ffffffff8050530e>] lp_write+0x158/0x2d2
[<ffffffff80185716>] vfs_write+0x8e/0x2c2
[<ffffffff80185a74>] ksys_write+0x52/0xc2
[<ffffffff80185af2>] sys_write+0xe/0x16
[<ffffffff80003770>] ret_from_syscall+0x0/0x2
---[ end trace 0000000000000000 ]---

For simplicity address the problem by adding PCI_IOBASE to the physical 
address requested in the respective wrapper macros only, observing that 
the raw accessors such as `__insb', `__outsb', etc. are not supposed to 
be used other than by said macros.  Remove the cast to `long' that is no 
longer needed on `addr' now that it is used as an offset from PCI_IOBASE 
and add parentheses around `addr' needed for predictable evaluation in 
macro expansion.  No need to make said adjustments in separate changes 
given that current code is gravely broken and does not ever work.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Fixes: fab957c11efe2 ("RISC-V: Atomic and Locking Code")
Cc: stable@vger.kernel.org # v4.15+
---
 arch/riscv/include/asm/io.h |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

linux-riscv-ins-outs-pci-iobase.diff
Index: linux-macro/arch/riscv/include/asm/io.h
===================================================================
--- linux-macro.orig/arch/riscv/include/asm/io.h
+++ linux-macro/arch/riscv/include/asm/io.h
@@ -101,9 +101,9 @@ __io_reads_ins(reads, u32, l, __io_br(),
 __io_reads_ins(ins,  u8, b, __io_pbr(), __io_par(addr))
 __io_reads_ins(ins, u16, w, __io_pbr(), __io_par(addr))
 __io_reads_ins(ins, u32, l, __io_pbr(), __io_par(addr))
-#define insb(addr, buffer, count) __insb((void __iomem *)(long)addr, buffer, count)
-#define insw(addr, buffer, count) __insw((void __iomem *)(long)addr, buffer, count)
-#define insl(addr, buffer, count) __insl((void __iomem *)(long)addr, buffer, count)
+#define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
+#define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
+#define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
 
 __io_writes_outs(writes,  u8, b, __io_bw(), __io_aw())
 __io_writes_outs(writes, u16, w, __io_bw(), __io_aw())
@@ -115,22 +115,22 @@ __io_writes_outs(writes, u32, l, __io_bw
 __io_writes_outs(outs,  u8, b, __io_pbw(), __io_paw())
 __io_writes_outs(outs, u16, w, __io_pbw(), __io_paw())
 __io_writes_outs(outs, u32, l, __io_pbw(), __io_paw())
-#define outsb(addr, buffer, count) __outsb((void __iomem *)(long)addr, buffer, count)
-#define outsw(addr, buffer, count) __outsw((void __iomem *)(long)addr, buffer, count)
-#define outsl(addr, buffer, count) __outsl((void __iomem *)(long)addr, buffer, count)
+#define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
+#define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
+#define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
 
 #ifdef CONFIG_64BIT
 __io_reads_ins(reads, u64, q, __io_br(), __io_ar(addr))
 #define readsq(addr, buffer, count) __readsq(addr, buffer, count)
 
 __io_reads_ins(ins, u64, q, __io_pbr(), __io_par(addr))
-#define insq(addr, buffer, count) __insq((void __iomem *)addr, buffer, count)
+#define insq(addr, buffer, count) __insq(PCI_IOBASE + (addr), buffer, count)
 
 __io_writes_outs(writes, u64, q, __io_bw(), __io_aw())
 #define writesq(addr, buffer, count) __writesq(addr, buffer, count)
 
 __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
-#define outsq(addr, buffer, count) __outsq((void __iomem *)addr, buffer, count)
+#define outsq(addr, buffer, count) __outsq(PCI_IOBASE + (addr), buffer, count)
 #endif
 
 #include <asm-generic/io.h>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
