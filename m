Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099C2C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 09:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CwZF4R7yLYFYZj6BY8bjpjONX7KKkFeTuSinEgGCXF0=; b=0bGuSORpk/IzRn
	oGxXmEaF0h4XDKyBFkhf3Csuw0bo34qBtyX+1U+SM3wmrhgflIRKE0UPW6gj28DDvuTRnka8Zsrq7
	R3wl5pRO9nsKCge/uSEXaN84FzvYCP+l/ylgNre9a4qqcrvju6fFAWsfnJCN5GDgM/+AA812R1tGN
	8R2of6vmPHKtIsWjodzX7tGxKuhbwhabnZ7XuATHfA+U2V38lOvx3+NDMv4jRmniowZBw3xARbbbf
	922RlSSPqaQzsZ/N7TjPY5cK1GS72qv5o3svr+6kKfoxJoDC/NE+iG7T8mxWWt46ko7lK4dkqUmW6
	SLz+Dl5xFyp9w5N/qhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJXqw-00EITV-Pw; Mon, 14 Feb 2022 09:41:02 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJXXz-00EDTa-JD; Mon, 14 Feb 2022 09:21:29 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 9FDA792009C; Mon, 14 Feb 2022 10:21:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 973DC92009B;
 Mon, 14 Feb 2022 09:21:25 +0000 (GMT)
Date: Mon, 14 Feb 2022 09:21:25 +0000 (GMT)
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
In-Reply-To: <e5ec2e3be2e70e690bd9112bd23297d05a2993e6.camel@linux.ibm.com>
Message-ID: <alpine.DEB.2.21.2202140917540.34636@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2202122313460.34636@angie.orcam.me.uk>
 <CAMuHMdW-utcFzCZTgqONjxs=U662nF0=aBQu7Zi7FBQouwiA3g@mail.gmail.com>
 <e5ec2e3be2e70e690bd9112bd23297d05a2993e6.camel@linux.ibm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_012127_853478_6CD69B06 
X-CRM114-Status: GOOD (  12.32  )
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

> > > --- linux-macro.orig/drivers/parport/Kconfig
> > > +++ linux-macro/drivers/parport/Kconfig
> > > @@ -42,7 +42,7 @@ if PARPORT
> > > 
> > >  config PARPORT_PC
> > >         tristate "PC-style hardware"
> > > -       depends on ARCH_MIGHT_HAVE_PC_PARPORT
> > > +       depends on ARCH_MIGHT_HAVE_PC_PARPORT || PCI
> 
> This would allow selecting PARPORT_PC on s390 e.g. for allyesconfig and
> randconfig and like POWER9 we definitely do not support I/O port
> access.

 I guess we'll have to stop it with !S390 then short-term.  I don't think 
an issue with s390 should be blocking all the other platforms that can use 
these drivers just fine.  I'll post v2 with that installed if you agree.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
