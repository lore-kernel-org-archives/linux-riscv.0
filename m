Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEC0C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 14:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cacFsAPNTdtLn4O9LH6H5xVQ43Fk8uXoJKr7pF91cus=; b=JKxQmUr/EERa2W
	fniKYxGN9lmtqzY2s+Ry0DDu6Ayf0xzsnc3PQjeCtPxiT46/CmT4RSQXg2eCPcKoKvte7FqdXrfiy
	AsKeQUqOCyi3LknhhZK7Bm6xSd+m3FzAuCk7nZK9KhdUE4l4s6s8KK9FmSxkbx52LNRggRx3czfMl
	0oSOORJMQNTDKvo0cy/dFHAJ3qzuUBfLyXMThcZT4do8zUlvKFMchHJOdNMe46aIvyZWlTC3mmELV
	xWZlFbycmttntglQJ34b/Biccf42Muvq7U7FgKvlg9t4yA4cVFY78caEK91Tqrpkbx8iNMNbBqbD6
	X6sO4qyYEssgWwRlcO1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmzCg-003rpK-MI; Fri, 06 May 2022 14:45:10 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmzBy-003rLB-6U; Fri, 06 May 2022 14:44:28 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id AEF9F9200BF; Fri,  6 May 2022 16:44:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id AAE6792009B;
 Fri,  6 May 2022 15:44:19 +0100 (BST)
Date: Fri, 6 May 2022 15:44:19 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: David Laight <David.Laight@ACULAB.COM>
cc: Arnd Bergmann <arnd@kernel.org>, Rich Felker <dalias@libc.org>, 
 "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>, 
 "open list:SUPERH" <linux-sh@vger.kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "open list:MIPS" <linux-mips@vger.kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
 "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>, 
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
 Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, 
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, 
 Matt Turner <mattst88@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, 
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, 
 Richard Henderson <rth@twiddle.net>, Michal Simek <monstr@monstr.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, 
 Borislav Petkov <bp@alien8.de>, 
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Subject: RE: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
In-Reply-To: <3669a28a055344a792b51439c953fd30@AcuMS.aculab.com>
Message-ID: <alpine.DEB.2.21.2205061440260.52331@angie.orcam.me.uk>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
 <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
 <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com>
 <alpine.DEB.2.21.2205061412080.52331@angie.orcam.me.uk>
 <3669a28a055344a792b51439c953fd30@AcuMS.aculab.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_074426_473322_2C13C0B6 
X-CRM114-Status: GOOD (  13.54  )
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

On Fri, 6 May 2022, David Laight wrote:

> >  It was retrofitted in that x86 systems already existed for ~15 years when
> > PCI came into picture.  Therefore the makers of the CPU ISA couldn't have
> > envisaged the need for config access instructions like they did for memory
> > and port access.
> 
> Rev 2.0 of the PCI spec (1993) defines two mechanisms for config cycles.
> #2 is probably the first one and maps all of PCI config space into
> 4k of IO space (PCI bridges aren't supported).

 This one is even more horrid than #1 in that it requires two separate 
preparatory I/O writes rather than just one, one to the Forward Register 
(at 0xcfa) to set the bus number, and another to the Configuration Space 
Enable Register (at 0xcf8) to set the function number, before you can 
issue a configuration read or write to a device.  So you need MP locking 
too.

 NB only peer bridges aren't supported with this mechanism, normal PCI-PCI 
bridges are, via the Forward Register.

> #1 requires a pair of accesses (and SMP locking).
> 
> Neither is really horrid.

 Both are.  First neither is MP-safe and second both are indirect in that 
you need to poke at some chipset registers before you can issue the actual 
read or write.

 Sane access would require a single CPU instruction to read or write from 
the configuration space.  To access the conventional PCI configuration 
space in a direct linear manner you need 256 * 21 * 8 * 256 = 10.5MiB of 
address space.  Such amount of address space seems affordable even with 
32-bit systems.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
