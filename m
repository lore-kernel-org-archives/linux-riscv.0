Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C8BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 19:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=lgQMk3yXNzS0qdV5O2DRM7DvwyOkEktlWm1ag3rJir4=; b=MudGyNOoPMb4J0
	C2YVC/wCnOAfUeuJay2EjUjE7hspQP8Abi65bnmO2l3jKzyYSOcnoUfY8fU8WnIZ+bjfmXtIEl9/P
	zPzu/8jaWUOK6vnRi4ZjCHKTzIQmyBFH/UPNX4CZ+rhQ3SJfIRfJGNB4GGYN/V97u0f6OhjjUwZht
	Y9dOOAXZN0g4aHvJZXQ8BPgpBU9plwHcSp3nzCm66vZlQQkTe4qVPY90FicQoV7ys6zDk9qQ1lIXw
	0NBjeAZey0/qMLFMdwnMKPYmB3M1O+I4xGAGsyoOYXHyFFCA6mnx1Q3ejS0coC2bw5az74fdMeuoL
	s5EIz2K4xBQNY00F084A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmhYi-0001zn-9E; Thu, 05 May 2022 19:54:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmhXo-0001X8-5Q; Thu, 05 May 2022 19:53:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6D166B82FCE;
 Thu,  5 May 2022 19:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68AFC385A4;
 Thu,  5 May 2022 19:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651780425;
 bh=fYxm3dr57owbquhz9mi2JlUgAayGWIYeuWXgYwjDgu0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=f2fc5oHeuzoxyJfE63Gjq/EPrO6txRg9hsHH/1s9bcAA7MB9R89IPW2XirzVZc74o
 JfbdqHGn2i9se2injqakFs9sJs55qbPwsXCW7U2z6292nsC5wpjZYOXUad+0rDxqWU
 dBktPS+QUeX5KA0qTdRvD/Jeg8g/VinXCSA1zNxox/sHlz0Qu+HDVGZRGj50as/vwO
 ee4WTtCWIAPTOcKicttAnfNz1to9P/EIAiFFNcHwyePB8PVEBnOd6hroIfxl+9c3Y0
 w8Ysllpp8ZwOIQgubSRRm20/01Cu9xOLyCR6eQMh+KyVf58T4+rzmnxImHp1ouw8wP
 UdmeA6sO/pypA==
Date: Thu, 5 May 2022 14:53:42 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
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
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
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
Message-ID: <20220505195342.GA509942@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_125348_517159_2F4185B2 
X-CRM114-Status: GOOD (  26.08  )
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

On Thu, May 05, 2022 at 07:39:42PM +0200, Arnd Bergmann wrote:
> On Thu, May 5, 2022 at 6:10 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Wed, May 04, 2022 at 11:31:28PM +0200, Arnd Bergmann wrote:
> > >
> > > The main goal is to avoid c), which is what happens on s390, but
> > > can also happen elsewhere. Catching b) would be nice as well,
> > > but is much harder to do from generic code as you'd need an
> > > architecture specific inline asm statement to insert a ex_table
> > > fixup, or a runtime conditional on each access.
> >
> > Or s390 could implement its own inb().
> >
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
> 
> The existing implementation gets flagged as a NULL pointer dereference
> by a compiler warning because it effectively is.

I think s390 currently uses the inb() in asm-generic/io.h, i.e.,
"__raw_readb(PCI_IOBASE + addr)".  I understand that's a NULL pointer
dereference because the default PCI_IOBASE is 0.

I mooted a s390 inb() implementation like "return ~0" because that's
what happens on most arches when there's no device to respond to the
inb().

The HAS_IOPORT dependencies are fairly ugly IMHO, and they clutter
drivers that use I/O ports in some cases but not others.  But maybe
it's the most practical way.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
