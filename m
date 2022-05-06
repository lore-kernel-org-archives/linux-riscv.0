Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE15C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 14:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RaIv8E6Cjj+doBZufBafbTqJq7PciW/ltokDMpHjDz0=; b=q6+2a0zKWD4c4V
	h16xXT8f3WAZb5g11vBkxU/p5ytrgXMmI3o9cFKvKMVmQy02ykdXF6t5iiCrph1b5L7MldDZU66Rr
	L9R5jYRCH+H21lu9AmhRPrPa127RvH1aJxxtbTkHaAcLSmYjl+r/vcPEIenuXkfO2gQAjGy3sznyE
	SIzXZBu1dTrD8I4dj6T5z/nYCZPHega0EOP2kYKhk+D4fE2MhoExxzWMJu6Vv8LtBdeNJFTSk7HIm
	ZuKUcmsbXhGUdGaQDfNZKyowbhcBKFlJfxNv8aaLjUXTvMO6aP6LYiCFzKKCGY9cNuLY2ks4P5Ob0
	lbOtY4DoMLZcLZ2h8FWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmyYG-003drB-Qh; Fri, 06 May 2022 14:03:24 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmyYD-003dpe-Ld
 for linux-riscv@lists.infradead.org; Fri, 06 May 2022 14:03:23 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-195-nik8eVn6MbSMYKVVi8RBBA-1; Fri, 06 May 2022 15:03:17 +0100
X-MC-Unique: nik8eVn6MbSMYKVVi8RBBA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Fri, 6 May 2022 15:03:15 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Fri, 6 May 2022 15:03:15 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Geert Uytterhoeven' <geert@linux-m68k.org>
CC: "Maciej W. Rozycki" <macro@orcam.me.uk>, Arnd Bergmann <arnd@kernel.org>, 
 Rich Felker <dalias@libc.org>, "open list:IA64 (Itanium) PLATFORM"
 <linux-ia64@vger.kernel.org>, "open list:SUPERH" <linux-sh@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "open
 list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>, "open
 list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, Will Deacon
 <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, "maintainer:X86
 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, linux-pci
 <linux-pci@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, Matt Turner
 <mattst88@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann
 <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, "open list:M68K
 ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>, Ivan Kokshaysky
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
Thread-Index: AQHYYUSwX3QwDKjE7kKG/gGNt1cnA60Rx6Pg///55gCAABIk4A==
Date: Fri, 6 May 2022 14:03:15 +0000
Message-ID: <62c1bf6687ac4abc98d4015852930241@AcuMS.aculab.com>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
 <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
 <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com>
 <CAMuHMdWj5rmrP941DF7bsUXbiiemE-o2=8XqnAS-chgmpFFPQg@mail.gmail.com>
In-Reply-To: <CAMuHMdWj5rmrP941DF7bsUXbiiemE-o2=8XqnAS-chgmpFFPQg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220506_070322_044463_0D762E08 
X-CRM114-Status: GOOD (  17.96  )
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

From: Geert Uytterhoeven
> Sent: 06 May 2022 14:09
...
> > The same is really true for other bus type - including ISA and EISA.
> > (Ignoring the horrid of probing ISI bus devices - hopefully they
> > are in the ACPI tables??_
> > If a driver is probed on a ISA bus there ought to be functions
> > equivalent to pci_ioremap() (for both memory and IO addresses)
> > that return tokens appropriate for the specific bus.
> >
> > That is all a different load of churn.
> 
> A loooong time ago,  it was suggested to add register accessor
> functions to struct device, so e.g. readl(dev, offset) would call
> into these accessors, which would implement the bus-specific behavior.
> No more worries about readl(), __raw_readl(), ioread32b(), or whatever
> quirk is needed, at the (small on nowadays' machines) expense of
> some indirection...

I was just thinking that the access functions might need a 'device'.
Although you also need the BAR (or equivalent).
So readl(dev, bar_token, offset) or readl(dev, bar_token + offset).
Clearly the 'dev' parameter could be compiled out for non-DEBUG
build on x86 - leaving the current(ish) object code.

You don't want an indirect call (this year), but maybe real
function call and a few tests won't make that much difference.
They might affect PCIe writes, but PCIe reads are so slow you
need to avoid them whenever possible.
I've not timed reads into something like an ethernet chip,
but into our fpga they are probably 1000 clocks+.

OTOH I wouldn't want any overhead on the PIO fifo reads
on one of our small ppc devices.
We push a lot of data though that fifo and anything extra
would kill performance.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
