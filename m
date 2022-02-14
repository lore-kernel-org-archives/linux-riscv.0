Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FE7C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 20:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vW2GusglumqFKpakiOvDaoY2pgF1Rt+DrOmEgKQAFvw=; b=HkSoRs6lpAH1Ig
	6wRy+EyPh5Nuv8FWJ33ROqiR28o3+4Lfxk6NAvhNhy27DNLE3JJYnVDzsJk+5SKvU8oDJQKLBXi4M
	k/Rsfu4QL+BjWN/W2oWm3x8r718STRIi+uzV18AhJL+GN8qzefElha9NfV/zaktk9s88lLTMtgt8p
	RD0iMGmHJuemzppRp82lE08cnQ4i9TaW3mdMvHAuwGsvMrn40q6AXoDiaGqeBgsOtpWxD6EyumZrd
	D70RbL8U+08C6TobSwYZhixaJdIKYPJToxG/Hn8CDWL/nqqSemvtf+q2iub4P8+DloHhqxqbCiD05
	q3/wyesq/pej1ORSJqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJiAr-00Grbg-V9; Mon, 14 Feb 2022 20:42:18 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJiAg-00Grap-Ba; Mon, 14 Feb 2022 20:42:08 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 2C98292009E; Mon, 14 Feb 2022 21:42:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 221CC92009D;
 Mon, 14 Feb 2022 20:42:05 +0000 (GMT)
Date: Mon, 14 Feb 2022 20:42:05 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Niklas Schnelle <schnelle@linux.ibm.com>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
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
In-Reply-To: <624931c5da90387324a97be57745b13af4738bda.camel@linux.ibm.com>
Message-ID: <alpine.DEB.2.21.2202142018060.34636@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2202122313460.34636@angie.orcam.me.uk>
 <CAMuHMdW-utcFzCZTgqONjxs=U662nF0=aBQu7Zi7FBQouwiA3g@mail.gmail.com>
 <alpine.DEB.2.21.2202140833290.34636@angie.orcam.me.uk>
 <624931c5da90387324a97be57745b13af4738bda.camel@linux.ibm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_124206_615115_29C380E4 
X-CRM114-Status: GOOD (  31.57  )
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

On Mon, 14 Feb 2022, Niklas Schnelle wrote:

> > While older versions of the driver did have to be explicitly configured 
> > for MMIO rather than port I/O, a feature added with commit e89a2cfb7d7b 
> > ("[TC] defxx: TURBOchannel support"), the driver has been improved with 
> > commit 795e272e5474 ("FDDI: defxx: Implement dynamic CSR I/O address space 
> > selection") and the selection of the I/O space to use now fully automatic.
> 
> Very interesting and thanks for the input! On s390 we really only have
> very few different PCI devices and I can only test another hand full
> with my private x86 and ARM systems.

 Note that for TURBOchannel support, which is likewise MMIO only, the 
driver has this:

#if defined(CONFIG_EISA) || defined(CONFIG_PCI)
#define dfx_use_mmio bp->mmio
#else
#define dfx_use_mmio true
#endif

so if your proposal to add HAS_IOPORT goes forward it'll be enough if we 
update the condition to:

#if defined(CONFIG_HAS_IOPORT)

or maybe even rewrite the entire piece as:

#define dfx_use_mmio (!IS_ENABLED(CONFIG_HAS_IOPORT) || bp->mmio)

and all the port I/O stuff will be optimised away by the compiler.  The 
only part of the driver that actually cannot do without port I/O is EISA 
support, which uses the EISA slot port I/O space for BAR accesses even 
if the actual CSR block has been set up to be decoded in the MMIO space.

> >  Then what about the other FDDI driver there, SKFP?  It's not marked as
> > LEGACY_PCI, although it's not selectable anyway due to the dependency of 
> > FDDI on LEGACY_PCI.
> > 
> >  Niklas, what was the criterion for placing the LEGACY_PCI dependency?
> 
> Hmm, honestly I haven't really worked on this recently. There were some
> open questions from Bjorn towards Arnd and I was waiting for his reply
> but I guess he missed those. I think what you noticed was the main
> problem, there wasn't really a clear set of criteria for LEGACY_PCI and
> even for HAS_IOPORT we missed some uses if they were not compiled on
> s390's allyesconfig due to other dependencies.

 A dynamic boolean variable might be good having for platforms which may 
or may not have PCI port I/O available depending on the specific system 
model in addition to a compile-time constant of HAS_IOPORT.  I looked 
into it briefly in the context of the POWER9 system when I got it back 
in 2020, but figured out it wasn't straightforward enough and decided I 
could not afford the time for a proper investigation.

> >  Also do you plan to post an updated series anytime soon?  I'm asking 
> > because like with the m68k port also the MIPS one needs a more finegrained 
> > approach and I suspect there may be other corner cases and I'd rather look 
> > at the most recent version of your series.  Otherwise I'll have a look 
> > through your original submission, but it may have to wait until the next 
> > weekend due to my other commitments.
> 
> That sounds like you do see a need for something like HAS_IOPORT too,
> correct? Maybe with some input what you need and possibly stripping the
> LEGACY_PCI option it might make sense to do a new version. Rather than
> possibly getting in your way could directly work in your input.

 Yes, it does seem to me like a good direction, but will surely require 
some coordination from platform and driver maintainers, as it's not 
always easy for someone not familiar with a specific piece what the 
context is (such as with the defxx driver as I noted above).

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
