Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0F4C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Apr 2022 22:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rTdgbuhX4q8Imw4NC5g4d03snMG+GdT+7kFJcBt2D84=; b=lnrx8jjE+qk8wy
	GvtzIHv2PfosMwoa6bKCG4RDDY694ZsdrxLwrVV/74uw5pQj/ebZMhnx4iWb4qsfdKqNnPoGobL3m
	oWdr9SHbR7tp1J8EGXxgvjrrupUH7ggFRgfm0nx8wFis/l7BmeJjDHycuSQby5ahgKTrASEFVhTVl
	aOolHUHNZ2RwwKlwVYZrG1lZD0iCVS0Pc303MEWxO7DJqMalDvn4X1F5Shz2a/3rgoi8mfapOnTNv
	3NCZoO7alteTb4M50dpd+iMy8YK55zNseEZa31t1DddgLASIgvE3obW2hV8PSP5q9ZV+N3furHdFM
	T6m4Gma31Nbk0inaXD9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njpx1-003lfx-Gv; Wed, 27 Apr 2022 22:15:59 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njpwy-003lf5-5U
 for linux-riscv@lists.infradead.org; Wed, 27 Apr 2022 22:15:58 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 4E5C192009C; Thu, 28 Apr 2022 00:15:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 480CF92009B;
 Wed, 27 Apr 2022 23:15:47 +0100 (BST)
Date: Wed, 27 Apr 2022 23:15:47 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
cc: Bjorn Helgaas <bhelgaas@google.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: PCI: Avoid handing out address 0 to devices
Message-ID: <alpine.DEB.2.21.2204271207590.9383@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_151556_416118_081CD45D 
X-CRM114-Status: GOOD (  16.22  )
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

For RISC-V platforms we permit assigning addresses from 0 to PCI devices,
both in the memory and the I/O bus space, and we happily do so if there 
is no conflict, e.g.:

pci 0000:07:00.0: BAR 0: assigned [io  0x0000-0x0007]
pci 0000:07:00.1: BAR 0: assigned [io  0x0008-0x000f]
pci 0000:06:01.0: PCI bridge to [bus 07]
pci 0000:06:01.0:   bridge window [io  0x0000-0x0fff]

(with the SiFive HiFive Unmatched RISC-V board and a dual serial port 
option card based on the OxSemi OXPCIe952 device wired for the legacy 
UART mode).

Address 0 is treated specially however in many places, for example in 
`pci_iomap_range' and `pci_iomap_wc_range' we require that the start 
address is non-zero, and even if we let such an address through, then 
individual device drivers could reject a request to handle a device at 
such an address, such as in `uart_configure_port'.  Consequently given
devices configured as shown above only one is actually usable:

Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
serial 0000:07:00.0: enabling device (0000 -> 0001)
serial: probe of 0000:07:00.0 failed with error -12
serial 0000:07:00.1: enabling device (0000 -> 0001)
serial 0000:07:00.1: detected caps 00000700 should be 00000500
0000:07:00.1: ttyS0 at I/O 0x8 (irq = 39, base_baud = 15625000) is a 16C950/954

Therefore avoid handing out address 0, by bumping the lowest address 
available to PCI via PCIBIOS_MIN_IO and PCIBIOS_MIN_MEM up by 4 and 16 
respectively, which is the minimum allocation size for I/O and memory 
BARs.

With this in place the system in question we have:

pci 0000:07:00.0: BAR 0: assigned [io  0x1000-0x1007]
pci 0000:07:00.1: BAR 0: assigned [io  0x1008-0x100f]
pci 0000:06:01.0: PCI bridge to [bus 07]
pci 0000:06:01.0:   bridge window [io  0x1000-0x1fff]

and then devices work correctly:

Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
serial 0000:07:00.0: enabling device (0000 -> 0001)
serial 0000:07:00.0: detected caps 00000700 should be 00000500
0000:07:00.0: ttyS0 at I/O 0x1000 (irq = 38, base_baud = 15625000) is a 16C950/954
serial 0000:07:00.1: enabling device (0000 -> 0001)
serial 0000:07:00.1: detected caps 00000700 should be 00000500
0000:07:00.1: ttyS1 at I/O 0x1008 (irq = 39, base_baud = 15625000) is a 16C950/954

Especially I/O space ranges are particularly valuable, because bridges 
only decode bits from 12 up and consequently where 16-bit addressing is 
in effect, as few as 16 separate ranges can be assigned to individual 
buses only, however a generic change to avoid handing out address 0 only 
has turned out controversial as per the discussion referred via the link 
below.

Conversely sorting this out in platform code has been standard practice 
since forever to avoid a clash with legacy devices subtractively decoded 
by the southbridge where present.  This can be revised should a generic 
solution be adopted sometime.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Link: https://lore.kernel.org/r/alpine.DEB.2.21.2202260044180.25061@angie.orcam.me.uk
---
Hi,

 NB I have an OxSemi OXPCIe952 based card that can be wired to either the 
native or the legacy mode via a jumper block and I am so glad that I have 
checked whether it works in the legacy mode as well.  I guess there are so 
few legacy-free platforms still for nobody else to notice this issue yet.

  Maciej
---
 arch/riscv/include/asm/pci.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

linux-riscv-pcibios-min.diff
Index: linux-macro/arch/riscv/include/asm/pci.h
===================================================================
--- linux-macro.orig/arch/riscv/include/asm/pci.h
+++ linux-macro/arch/riscv/include/asm/pci.h
@@ -12,8 +12,8 @@
 
 #include <asm/io.h>
 
-#define PCIBIOS_MIN_IO		0
-#define PCIBIOS_MIN_MEM		0
+#define PCIBIOS_MIN_IO		4
+#define PCIBIOS_MIN_MEM		16
 
 /* RISC-V shim does not initialize PCI bus */
 #define pcibios_assign_all_busses() 1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
