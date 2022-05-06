Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81939C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 13:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4LBXV9RPcS+ev6lL5XW14VRxjhLImKcKitcSq1j56I=; b=CUOo9pMzV2jcap
	Gn/8gOqIM1CkNkG3ogwRjCQH83C3ofys7rgdy4ErWFEhAmliHhFiSahKKVahrazn/bsjIkundcSJ4
	CZ37Ih/OnQNAGuQR7d+A5VI8Q2zK9JAXygpLEcGcQ9hUuNNtUHKrTa4kSImfIeigtgAjx42voTi64
	gc+h4SKUij365EZ1zECMPnAGIGP5FSWfIGD8cpsji27KhjiVLWEz4Vfg875t3LIGqVINQfYGWfEvS
	bIaoj1tKSH37ttG1Y+Wu4HGEskar2wEyRwtTnDYuxKGAFP1os09uiPs4AYsxW9xbPyYHvAq+axPYo
	1L07JW+V/FD1JqZetgUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmyC7-003Y5s-Rh; Fri, 06 May 2022 13:40:31 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmyBr-003XzA-Bh; Fri, 06 May 2022 13:40:18 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 418EA9200BC; Fri,  6 May 2022 15:40:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 3D20D92009E;
 Fri,  6 May 2022 14:40:09 +0100 (BST)
Date: Fri, 6 May 2022 14:40:09 +0100 (BST)
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
In-Reply-To: <CAMuHMdWj5rmrP941DF7bsUXbiiemE-o2=8XqnAS-chgmpFFPQg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2205061426390.52331@angie.orcam.me.uk>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
 <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
 <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com>
 <CAMuHMdWj5rmrP941DF7bsUXbiiemE-o2=8XqnAS-chgmpFFPQg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_064015_641554_3DD02C1D 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

On Fri, 6 May 2022, Geert Uytterhoeven wrote:

> A loooong time ago,  it was suggested to add register accessor
> functions to struct device, so e.g. readl(dev, offset) would call
> into these accessors, which would implement the bus-specific behavior.
> No more worries about readl(), __raw_readl(), ioread32b(), or whatever
> quirk is needed, at the (small on nowadays' machines) expense of
> some indirection...

 I guess you'd need an additional parameter for the endianness policy 
required (to match either bit or byte lanes, according to ultimate data 
interpretation) where crossing between buses of a different endianness 
each.  Otherwise you'd end up with the mess elsewhere.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
