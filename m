Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394B4C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8sdJja1GGL1JTPHlDuFMmT79wtYozCjT5ACFkwPfHg=; b=jh9vi+a5wnWUVY
	JlTpgH0yf91Qde+GEgcscet5icfqVRThJeZB7n+DnKwvjFHw4UMTCVgbwxH1kNWwotDLcjsan4qNX
	6nXwNVx2juXnvE9WDHW6f9slPcze1edsIyqqIdppiO49OgooNr0NnWkLOqsEkHgpVo23PDxz4jfCX
	oSHuUt7LZjwt2GfmKAlanf+r9oQq/M7r7WDfLGoLS4wIsqpB9KPMP6qVDCC1MRFkwHZAmxnqjc2UG
	vjhRThAYwWbY5r3PNKKaeztUPaN+u0d1cnU2bluQq2diumrW9SaKUe3LgzS2ibOa3xTgS3nDI9Uw3
	/NiranHXHGOL4+PZmqIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmv4e-002fNt-Pn; Fri, 06 May 2022 10:20:36 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmv4S-002fGS-1o; Fri, 06 May 2022 10:20:26 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 245B192009C; Fri,  6 May 2022 12:20:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 1C7D492009B;
 Fri,  6 May 2022 11:20:17 +0100 (BST)
Date: Fri, 6 May 2022 11:20:17 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Arnd Bergmann <arnd@kernel.org>
cc: Bjorn Helgaas <helgaas@kernel.org>, 
 Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-pci <linux-pci@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, 
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, 
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, 
 "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>, 
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>, 
 "open list:MIPS" <linux-mips@vger.kernel.org>, 
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>, 
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, 
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
 "open list:SUPERH" <linux-sh@vger.kernel.org>, 
 "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
In-Reply-To: <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_032024_295339_B74CA931 
X-CRM114-Status: GOOD (  18.36  )
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

On Thu, 5 May 2022, Arnd Bergmann wrote:

> > I'm hearing that generic powerpc kernels have to run both on machines
> > that have I/O port space and those that don't.  That makes me think
> > s390 could do something similar.
> 
> No, this is actually the current situation, and it makes absolutely no
> sense. s390 has no way of implementing inb()/outb() because there
> are no instructions for it and it cannot tunnel them through a virtual
> address mapping like on most of the other architectures. (it has special
> instructions for accessing memory space, which is not the same as
> a pointer dereference here).

 I think I'm missing something here.  IIUC we're talking about a PCI/PCIe 
bus used with s390 hardware, right?

 (It has to be PCI/PCIe, because other than x86/IA-64 host buses there are 
only PCI/PCIe and EISA/ISA buses out there that define I/O access cycles 
and EISA/ISA have long been obsoleted except perhaps from some niche use.)

 If this is PCI/PCIe indeed, then an I/O access is just a different bit 
pattern put on the bus/in the TLP in the address phase.  So what is there 
inherent to the s390 architecture that prevents that different bit pattern 
from being used?

 If anything, I could imagine the same limitation as with current POWER9 
implementations, that is whatever glue is used to wire PCI/PCIe to the 
rest of the system does not implement a way to use said bit pattern (which 
has nothing to do with the POWER9 processor instruction set).

 But that has nothing to do with the presence or absence of any specific 
processor instructions.  It's just a limitation of bus glue.  So I guess 
it's just that all PCI/PCIe glue logic implementations for s390 have such 
a limitation, right?

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
