Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED228C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 09:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b90RVtgr6vr0ioIJZjTe22GuJZWTCFsNn0OK/ESfmPQ=; b=NI0EJi2j3YZLuc
	mjn7ikColMwUrj8ukYRqCmy1uBDzT6y/nlEWPvdTeaMxp8QwPL9YBp58lk4NfONDobatRK99fO5nU
	qQkHwp6HCMLVBf4P+ny9CgOlkd9fUetx++3K82ZOn/cz9OppsT2EGWJHRfmE2GDNpjh4pcreSxLcZ
	o9kaGixOYWaqxy1FJ8UWJJlLzkueVYvLwoLOMpCwApK5YT/C4HCqQTd3F3wTpi+5+Chsx5UM/rCY4
	d1aWI//sfJuhGuUEAxV+N/Y0s6D1onKtL6Um5ZE4HpDWOboCE0np+h/47vXW7ptoLg/iOq8cn3oRU
	sjJIfhC+mSpqsDHvh5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJXoK-00EHmV-8M; Mon, 14 Feb 2022 09:38:20 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJXTU-00ECYt-Ka; Mon, 14 Feb 2022 09:16:51 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 7C62292009C; Mon, 14 Feb 2022 10:16:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 7972092009B;
 Mon, 14 Feb 2022 09:16:43 +0000 (GMT)
Date: Mon, 14 Feb 2022 09:16:43 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Niklas Schnelle <schnelle@linux.ibm.com>
cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
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
Subject: Re: [PATCH] parport_pc: Also enable driver for PCI systems
In-Reply-To: <CAMuHMdW-utcFzCZTgqONjxs=U662nF0=aBQu7Zi7FBQouwiA3g@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2202140833290.34636@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2202122313460.34636@angie.orcam.me.uk>
 <CAMuHMdW-utcFzCZTgqONjxs=U662nF0=aBQu7Zi7FBQouwiA3g@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_011648_943302_709EDDFE 
X-CRM114-Status: GOOD (  23.60  )
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

On Mon, 14 Feb 2022, Geert Uytterhoeven wrote:

> > The only PCI platforms that actually can't make use of PC-style parallel
> > port hardware are those newer PCIe systems that have no support for I/O
> > cycles in the host bridge, required by such parallel ports.  An example
> > of such a host bridge is the POWER9 PHB4 device, but it is an exception
> > rather than the norm.  Also it is not clear whether the serial port side
> 
> Note that this hardware dependency is being addressed in
> "[RFC 00/32] Kconfig: Introduce HAS_IOPORT and LEGACY_PCI options"
> https://lore.kernel.org/all/20211227164317.4146918-1-schnelle@linux.ibm.com/

 Thanks for the pointer, I have missed the series in the LKML flood!

 The idea sounds good, although it's not clear to me if a config option is 
enough to get it properly covered as I don't know offhand if a single say 
ppc64le kernel can't run on systems that do and do not have support for 
port I/O over PCIe.  I got hit with that the hard way with a distribution 
kernel where a driver tried to do port I/O and poked at a random location 
in the address space causing weird errors to be reported by the system 
firmware.

 Also I have skimmed over the series and there appears to be confusion 
between legacy PCI and conventional PCI, which are obviously not the same.  
For example this piece:

diff --git a/drivers/net/fddi/Kconfig b/drivers/net/fddi/Kconfig
index 846bf41c2717..1753c08d6423 100644
--- a/drivers/net/fddi/Kconfig
+++ b/drivers/net/fddi/Kconfig
@@ -5,7 +5,7 @@
 
 config FDDI
 	tristate "FDDI driver support"
-	depends on PCI || EISA || TC
+	depends on LEGACY_PCI || EISA || TC
 	help
 	  Fiber Distributed Data Interface is a high speed local area network
 	  design; essentially a replacement for high speed Ethernet. FDDI can
@@ -29,7 +29,7 @@ config DEFZA
 
 config DEFXX
 	tristate "Digital DEFTA/DEFEA/DEFPA adapter support"
-	depends on FDDI && (PCI || EISA || TC)
+	depends on FDDI && (LEGACY_PCI || EISA || TC)
 	help
 	  This is support for the DIGITAL series of TURBOchannel (DEFTA),
 	  EISA (DEFEA) and PCI (DEFPA) controllers which can connect you

is clearly wrong.  While the DEFPA card is a conventional PCI option it 
does support MMIO and does run with my legacy-free POWER9 system just 
fine (with a suitable PCIe-to-PCI bridge installed at 0031:01:00.0):

# lspci
0000:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0001:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0001:01:00.0 Serial controller: Oxford Semiconductor Ltd OXPCIe952 Dual Native 950 UART
0002:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0002:01:00.0 Serial Attached SCSI controller: Adaptec Series 8 12G SAS/PCIe 3 (rev 01)
0003:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0003:01:00.0 USB controller: Texas Instruments TUSB73x0 SuperSpeed USB 3.0 xHCI Host Controller (rev 02)
0004:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0004:01:00.0 Ethernet controller: Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe (rev 01)
0004:01:00.1 Ethernet controller: Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe (rev 01)
0005:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0005:01:00.0 PCI bridge: ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge (rev 04)
0005:02:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics Family (rev 41)
0030:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0030:01:00.0 PCI bridge: PMC-Sierra Inc. PM8562 Switchtec PFX-L 32xG3 Fanout-Lite PCIe Gen3 Switch
0030:02:00.0 PCI bridge: PMC-Sierra Inc. PM8562 Switchtec PFX-L 32xG3 Fanout-Lite PCIe Gen3 Switch
0030:02:01.0 PCI bridge: PMC-Sierra Inc. PM8562 Switchtec PFX-L 32xG3 Fanout-Lite PCIe Gen3 Switch
0030:02:02.0 PCI bridge: PMC-Sierra Inc. PM8562 Switchtec PFX-L 32xG3 Fanout-Lite PCIe Gen3 Switch
0030:02:03.0 PCI bridge: PMC-Sierra Inc. PM8562 Switchtec PFX-L 32xG3 Fanout-Lite PCIe Gen3 Switch
0030:03:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller SM981/PM981/PM983
0030:04:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller SM981/PM981/PM983
0030:05:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller SM981/PM981/PM983
0030:06:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller SM981/PM981/PM983
0031:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0031:01:00.0 PCI bridge: Texas Instruments XIO2000(A)/XIO2200A PCI Express-to-PCI Bridge (rev 03)
0031:02:04.0 FDDI network controller: Digital Equipment Corporation PCI-to-PDQ Interface Chip [PFI] FDDI (DEFPA) (rev 02)
0031:02:05.0 ATM network controller: Microsemi / PMC / IDT IDT77201/77211 155Mbps ATM SAR Controller [NICStAR] (rev 03)
0032:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0033:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
# dmesg | grep 0031:02:04.0 | cut -c16-
pci 0031:02:04.0: [1011:000f] type 00 class 0x020200
pci 0031:02:04.0: reg 0x10: [mem 0x620c080020000-0x620c08002007f]
pci 0031:02:04.0: reg 0x14: [io  0x0000-0x007f]
pci 0031:02:04.0: reg 0x18: [mem 0x620c080030000-0x620c08003ffff]
pci 0031:02:04.0: BAR0 [mem size 0x00000080]: requesting alignment to 0x10000
pci 0031:02:04.0: BAR 0: assigned [mem 0x620c080020000-0x620c08002007f]
pci 0031:02:04.0: BAR 2: assigned [mem 0x620c080030000-0x620c08003ffff]
pci 0031:02:04.0: BAR 1: no space for [io  size 0x0080]
pci 0031:02:04.0: BAR 1: failed to assign [io  size 0x0080]
pci 0031:02:04.0: Configured PE#fc
pci 0031:02:04.0: Adding to iommu group 9
defxx 0031:02:04.0: enabling device (0140 -> 0142)
0031:02:04.0: DEFPA at MMIO addr = 0x620c080020000, IRQ = 57, Hardware addr = 00-60-6d-93-91-98
0031:02:04.0: registered as fddi0
$ ip link show dev fddi0
4: fddi0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 4470 qdisc pfifo_fast 
state UNKNOWN mode DEFAULT group default qlen 100
    link/fddi 00:60:6d:93:91:98 brd ff:ff:ff:ff:ff:ff
$

While older versions of the driver did have to be explicitly configured 
for MMIO rather than port I/O, a feature added with commit e89a2cfb7d7b 
("[TC] defxx: TURBOchannel support"), the driver has been improved with 
commit 795e272e5474 ("FDDI: defxx: Implement dynamic CSR I/O address space 
selection") and the selection of the I/O space to use now fully automatic.

 Then what about the other FDDI driver there, SKFP?  It's not marked as
LEGACY_PCI, although it's not selectable anyway due to the dependency of 
FDDI on LEGACY_PCI.

 Niklas, what was the criterion for placing the LEGACY_PCI dependency?  

 Also do you plan to post an updated series anytime soon?  I'm asking 
because like with the m68k port also the MIPS one needs a more finegrained 
approach and I suspect there may be other corner cases and I'd rather look 
at the most recent version of your series.  Otherwise I'll have a look 
through your original submission, but it may have to wait until the next 
weekend due to my other commitments.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
