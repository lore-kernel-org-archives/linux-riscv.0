Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568B1C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 15:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfTcTb1QJKQFY+Rag8RK8wccWf3BqcM5eyRKGKjCkgI=; b=tHpfzRTIdUfzTx
	1c1NDe77PzuzLnyzyJiwfSuPYSbZisaViNf/whbrB+RZYRMB0p8CK55q/1gdmeaUJcmwNYyGGiKvl
	jYuPwEubk/K4Zvrx/7z9afhT4QA4bPm9GfOFpxe8QiBInGulWOBu7Bn8Dh2k7dCtfyfQCjKCIHhHc
	Ik88R/WLM4Wmju6uFuf3be2DgBOZPPKTFOUciaL8Bc0u0FAmb6+gDMpVM2Ry7rdgQ2yM0y1VydDYM
	F3KBrTaloQ8wBkAk8NEsD82fR+LHUKcaR3Gt6QwNb5I3B+Ftzitsieeui47IbmjIKrkJxmK2L/UYE
	rL0LntI5GRmYrkzymEMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmzUu-003wzF-7c; Fri, 06 May 2022 15:04:00 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmzUE-003wYM-Lv; Fri, 06 May 2022 15:03:20 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 022B79200C3; Fri,  6 May 2022 17:03:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id F242C9200C1;
 Fri,  6 May 2022 16:03:14 +0100 (BST)
Date: Fri, 6 May 2022 16:03:14 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
cc: David Laight <David.Laight@aculab.com>, Arnd Bergmann <arnd@kernel.org>, 
 Rich Felker <dalias@libc.org>, 
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
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
In-Reply-To: <CAMuHMdVsjRUKYqS0nkKsT08A4a4ipuhn7AG+ZqcHBqZvVX02OQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2205061558430.52331@angie.orcam.me.uk>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
 <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
 <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com>
 <alpine.DEB.2.21.2205061412080.52331@angie.orcam.me.uk>
 <3669a28a055344a792b51439c953fd30@AcuMS.aculab.com>
 <alpine.DEB.2.21.2205061440260.52331@angie.orcam.me.uk>
 <CAMuHMdVsjRUKYqS0nkKsT08A4a4ipuhn7AG+ZqcHBqZvVX02OQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_080318_953075_AB462D0F 
X-CRM114-Status: GOOD (  11.31  )
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

Hi Geert,
> >  Sane access would require a single CPU instruction to read or write from
> > the configuration space.  To access the conventional PCI configuration
> > space in a direct linear manner you need 256 * 21 * 8 * 256 = 10.5MiB of
> > address space.  Such amount of address space seems affordable even with
> > 32-bit systems.
> 
> Won't have fit in the legacy 1 MiB space ("640 KiB...").

 Haha, but anyway you're supposed to use BIOS calls under DOS and the like 
so it doesn't really matter.  You can't poke at the APIC in the legacy 
space either.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
