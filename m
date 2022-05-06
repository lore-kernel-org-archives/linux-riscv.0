Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D284C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 12:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isiIWHJDM1h7QJvCpYrj+O31aFpUHckZsmD0ETRUU5s=; b=nCRKsbJ2Sd0/fP
	dbDCbBTArNGyzgrECnvZwqsNc3fwWiLsGqldsozP5G7CP+ExeWvP7mLlhZOQWbijcR57EkDLX9xNj
	mru6DDnWbSzqrOFCilM3gBr5nYh7Z8bOWe9IwF6HGb1tEJ7KIyIsmHVoa+5LySGfWU5+yRkln6U6D
	8Z1eRsygTcOVPCtQnFNCAB0vhIR81vPC9eIZTvZDHVH2Agu57NbOX1bPXWzGAfYWR27bU4kfN3LNu
	U67BD8EOIBYzuaSCmNYu82yIGlXERSVZcBhfoqJpDT7xpNRjAazh7uah34kd2arKGHfHJkC/rjsqn
	aRuCUMQjmDDYZ90JAJog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmxSs-003JHt-Dj; Fri, 06 May 2022 12:53:46 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmxSo-003JD1-8X
 for linux-riscv@lists.infradead.org; Fri, 06 May 2022 12:53:44 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-209-ZJ1dDxuMNtSxZCO0jLpoxQ-1; Fri, 06 May 2022 13:53:34 +0100
X-MC-Unique: ZJ1dDxuMNtSxZCO0jLpoxQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Fri, 6 May 2022 13:53:32 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Fri, 6 May 2022 13:53:32 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'Maciej W. Rozycki'" <macro@orcam.me.uk>, Arnd Bergmann <arnd@kernel.org>
CC: Rich Felker <dalias@libc.org>, "open list:IA64 (Itanium) PLATFORM"
 <linux-ia64@vger.kernel.org>, "open list:SUPERH" <linux-sh@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "open
 list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>, "open
 list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, Will Deacon
 <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, "maintainer:X86
 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas
 <helgaas@kernel.org>, Matt Turner <mattst88@gmail.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle
 <schnelle@linux.ibm.com>, "open list:M68K ARCHITECTURE"
 <linux-m68k@lists.linux-m68k.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Paul Walmsley <paul.walmsley@sifive.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, "moderated list:ARM PORT"
 <linux-arm-kernel@lists.infradead.org>, Richard Henderson <rth@twiddle.net>,
 Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, "open list:PARISC ARCHITECTURE"
 <linux-parisc@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "open
 list:ALPHA PORT" <linux-alpha@vger.kernel.org>, Borislav Petkov
 <bp@alien8.de>, "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Subject: RE: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
Thread-Topic: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
Thread-Index: AQHYYUSwX3QwDKjE7kKG/gGNt1cnA60Rx6Pg
Date: Fri, 6 May 2022 12:53:32 +0000
Message-ID: <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
 <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_055342_651310_871CC07D 
X-CRM114-Status: GOOD (  31.33  )
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

From: Maciej W. Rozycki
> Sent: 06 May 2022 13:27
> 
> On Fri, 6 May 2022, Arnd Bergmann wrote:
> 
> > >  If this is PCI/PCIe indeed, then an I/O access is just a different bit
> > > pattern put on the bus/in the TLP in the address phase.  So what is there
> > > inherent to the s390 architecture that prevents that different bit pattern
> > > from being used?
> >
> > The hardware design for PCI on s390 is very different from any other
> > architecture, and more abstract. Rather than implementing MMIO register
> > access as pointer dereference, this is a separate CPU instruction that
> > takes a device/bar plus offset as arguments rather than a pointer, and
> > Linux encodes this back into a fake __iomem token.
> 
>  OK, that seems to me like a reasonable and quite a clean design (on the
> hardware side).
> 
>  So what happens if the instruction is given an I/O rather than memory BAR
> as the relevant argument?  Is the address space indicator bit (bit #0)
> simply ignored or what?

You don't understand something...

For a memory BAR pci_ioremap() returns a token that can be used with readl().
On most architectures readl() is just a memory access.
This all fails on an I/O BAR.

For an I/O BAR you want a similar pair of functions.
On x86 the access function would need to use the 'in/out' instructions but
there is no requirement for the token to be the native io port number.
On many non-x86 architectures the access function would be a simple memory
access - but a specific system (eg many ppc) may never actually allow
such mappings to succeed.

You might also want a third PCI mapping function that can map a memory
BAR or an I/O BAR - with a suitable access function.
On x86 this would need something like ioread8() for accesses.
Except that function uses small integers for io port numbers
(which is inherently dangerous).

Nothing except the architecture specific implementation of the function
to access an io BAR would ever go near a function called inb().

The same is really true for other bus type - including ISA and EISA.
(Ignoring the horrid of probing ISI bus devices - hopefully they
are in the ACPI tables??_
If a driver is probed on a ISA bus there ought to be functions
equivalent to pci_ioremap() (for both memory and IO addresses)
that return tokens appropriate for the specific bus.

That is all a different load of churn.


> > >  But that has nothing to do with the presence or absence of any specific
> > > processor instructions.  It's just a limitation of bus glue.  So I guess
> > > it's just that all PCI/PCIe glue logic implementations for s390 have such
> > > a limitation, right?
> >
> > There are separate instructions for PCI memory and config space, but
> > no instructions for I/O space, or for non-PCI MMIO that it could be mapped
> > into.
> 
>  The PCI configuration space was retrofitted into x86 systems (and is
> accessed in an awkward manner with them), but with a new design such a
> clean approach is most welcome IMHO.  Thank you for your explanation.

Actually I think x86 was the initial system for PCI.
The PCI config space 'mess' is all about trying to make
something that wouldn't break existing memory maps.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
