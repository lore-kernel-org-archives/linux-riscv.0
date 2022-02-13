Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75096C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Feb 2022 12:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tWqwJrhTQZO75S8rE1VcI7z67saPQDDbFswazEtl0ao=; b=BXx50RmU21Hiij
	5B4ULzlE/ErhCAUXo31thSF+xbvmPY5nnO8XhfgqbAfPk79aub8XI3n7g6BOk2SwJtpNx4boSDCkw
	edWr121g6LAS8Zqh0F17uOoQ/i0YzHnxTXr7bEjEZDx9SSZwF5TeVqkfltmv7YSJ8VlVGq/X6oEz1
	UMnllObcNOOeaVQBfxejSYFUZOPnJQ+m2wpL2qG45y3AK5PFCRqQ7I6MYzeRcNL/XN8d0oMtYuqXK
	VS2h6sgLe6r6H8BA5W5DvuJfhDF/II/NUtfAfaCPA5atg7sGkcS0w52OyTOM7MhbQ/FO16Tgg0NwF
	TxcaueGWWTpGbUM3oXQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJEFo-00BggB-Sx; Sun, 13 Feb 2022 12:45:24 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJEFc-00BgeH-SB; Sun, 13 Feb 2022 12:45:15 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id AA29492009C; Sun, 13 Feb 2022 13:45:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 9BEB192009B;
 Sun, 13 Feb 2022 12:45:09 +0000 (GMT)
Date: Sun, 13 Feb 2022 12:45:09 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH] parport_pc: Also enable driver for PCI systems
Message-ID: <alpine.DEB.2.21.2202122313460.34636@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_044513_112367_B7DE96F6 
X-CRM114-Status: GOOD (  19.66  )
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

Nowadays PC-style parallel ports come in the form of PCI and PCIe option 
cards and there are some combined parallel/serial option cards as well 
that we handle in the parport subsystem.  There is nothing in particular 
that would prevent them from being used in any system equipped with PCI 
or PCIe connectivity, except that we do not permit the PARPORT_PC config 
option to be selected for platforms for which ARCH_MIGHT_HAVE_PC_PARPORT 
has not been set for.

The only PCI platforms that actually can't make use of PC-style parallel 
port hardware are those newer PCIe systems that have no support for I/O 
cycles in the host bridge, required by such parallel ports.  An example 
of such a host bridge is the POWER9 PHB4 device, but it is an exception 
rather than the norm.  Also it is not clear whether the serial port side 
of devices enabled by the PARPORT_SERIAL option uses port I/O or MMIO. 
Therefore for PCI platforms PARPORT_PC should generally be available, 
except for Super I/O solutions, which are either ISA or platform 
devices.

Make the PARPORT_PC option selectable also for PCI systems then, however 
limit the availability of PARPORT_PC_SUPERIO to platforms that have 
ARCH_MIGHT_HAVE_PC_PARPORT enabled.  Update platforms accordingly for 
the required <asm/parport.h> header.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
Hi,

 I have verified this lightly by booting a kernel with PARPORT_PC and 
PARPORT_SERIAL enabled on a RISC-V HiFive Unmatched system.  While I do 
have a PCIe parallel port option available that I could use with my RISC-V 
machine (based on the OxSemi OXPCIe952 chip) it is currently plugged in 
the wrong system, and both machines are in my remote lab I have currently 
no visit scheduled to in the near future.  For the record the device 
reports as:

PCI parallel port detected: 1415:c118, I/O at 0x1000(0x1008), IRQ 18
parport1: PC-style at 0x1000 (0x1008), irq 18, using FIFO [PCSPP,TRISTATE,COMPAT,EPP,ECP]

in the other system.  I'll see if I can verify it with the Unmatched at 
the next opportunity, though it seems like an overkill to me given that a 
PC-style parallel port is a generic PCIe device.  The OXPCIe952 implements 
a multifunction device, so it doesn't rely on PARPORT_SERIAL.

 NB platforms to be updated for <asm/parport.h> generation were chosen by 
the presence of the HAVE_PCI or FORCE_PCI option from ones that do not 
already have or generate that header.  Let me know if I got anything wrong 
here.

  Maciej
---
 arch/arm64/include/asm/Kbuild  |    1 +
 arch/csky/include/asm/Kbuild   |    1 +
 arch/riscv/include/asm/Kbuild  |    1 +
 arch/s390/include/asm/Kbuild   |    1 +
 arch/um/include/asm/Kbuild     |    1 +
 arch/xtensa/include/asm/Kbuild |    1 +
 drivers/parport/Kconfig        |    4 ++--
 7 files changed, 8 insertions(+), 2 deletions(-)

linux-parport-pc-pci.diff
Index: linux-macro/arch/arm64/include/asm/Kbuild
===================================================================
--- linux-macro.orig/arch/arm64/include/asm/Kbuild
+++ linux-macro/arch/arm64/include/asm/Kbuild
@@ -3,6 +3,7 @@ generic-y += early_ioremap.h
 generic-y += mcs_spinlock.h
 generic-y += qrwlock.h
 generic-y += qspinlock.h
+generic-y += parport.h
 generic-y += user.h
 
 generated-y += cpucaps.h
Index: linux-macro/arch/csky/include/asm/Kbuild
===================================================================
--- linux-macro.orig/arch/csky/include/asm/Kbuild
+++ linux-macro/arch/csky/include/asm/Kbuild
@@ -4,5 +4,6 @@ generic-y += extable.h
 generic-y += gpio.h
 generic-y += kvm_para.h
 generic-y += qrwlock.h
+generic-y += parport.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
Index: linux-macro/arch/riscv/include/asm/Kbuild
===================================================================
--- linux-macro.orig/arch/riscv/include/asm/Kbuild
+++ linux-macro/arch/riscv/include/asm/Kbuild
@@ -2,5 +2,6 @@
 generic-y += early_ioremap.h
 generic-y += flat.h
 generic-y += kvm_para.h
+generic-y += parport.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
Index: linux-macro/arch/s390/include/asm/Kbuild
===================================================================
--- linux-macro.orig/arch/s390/include/asm/Kbuild
+++ linux-macro/arch/s390/include/asm/Kbuild
@@ -8,3 +8,4 @@ generic-y += asm-offsets.h
 generic-y += export.h
 generic-y += kvm_types.h
 generic-y += mcs_spinlock.h
+generic-y += parport.h
Index: linux-macro/arch/um/include/asm/Kbuild
===================================================================
--- linux-macro.orig/arch/um/include/asm/Kbuild
+++ linux-macro/arch/um/include/asm/Kbuild
@@ -17,6 +17,7 @@ generic-y += mcs_spinlock.h
 generic-y += mmiowb.h
 generic-y += module.lds.h
 generic-y += param.h
+generic-y += parport.h
 generic-y += percpu.h
 generic-y += preempt.h
 generic-y += softirq_stack.h
Index: linux-macro/arch/xtensa/include/asm/Kbuild
===================================================================
--- linux-macro.orig/arch/xtensa/include/asm/Kbuild
+++ linux-macro/arch/xtensa/include/asm/Kbuild
@@ -4,6 +4,7 @@ generic-y += extable.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
 generic-y += param.h
+generic-y += parport.h
 generic-y += qrwlock.h
 generic-y += qspinlock.h
 generic-y += user.h
Index: linux-macro/drivers/parport/Kconfig
===================================================================
--- linux-macro.orig/drivers/parport/Kconfig
+++ linux-macro/drivers/parport/Kconfig
@@ -42,7 +42,7 @@ if PARPORT
 
 config PARPORT_PC
 	tristate "PC-style hardware"
-	depends on ARCH_MIGHT_HAVE_PC_PARPORT
+	depends on ARCH_MIGHT_HAVE_PC_PARPORT || PCI
 	help
 	  You should say Y here if you have a PC-style parallel port. All
 	  IBM PC compatible computers and some Alphas have PC-style
@@ -77,7 +77,7 @@ config PARPORT_PC_FIFO
 
 config PARPORT_PC_SUPERIO
 	bool "SuperIO chipset support"
-	depends on PARPORT_PC && !PARISC
+	depends on ARCH_MIGHT_HAVE_PC_PARPORT && PARPORT_PC && !PARISC
 	help
 	  Saying Y here enables some probes for Super-IO chipsets in order to
 	  find out things like base addresses, IRQ lines and DMA channels.  It

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
