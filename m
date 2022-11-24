Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5550CC43217
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 23:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FX9elbLnzJ40pV92B0ekVqRwdHCxPRCUjT8hPFBkmw=; b=kV+8CCJlJ+z8EN
	95wi5vcoI4ujSi8fvvj8+V2DND+yZ9ZGKR+l7n27Hmvy4azMcZiG577OBW7aIb8ulV9970L/19Mha
	cpdUqJyNG4HH/NfyuyLmsYX2tOTSk5L40z9+SkwU4FjUPmrV6R5bP0SNQIbq/eWYkEQEHVmHm2QvI
	gm7j7gGFKMv4kg8POK+P/pkMILHSrEVqppSf5lQVEmZeMNC5uI+H0NwlZRcdWchrmmEjKuZWOYK9e
	5Nxm9tWIyG2fdw+1DHhK5kHY1nNbZ0gTNcqdL1vEIXLT21jeAnAXtiX2TNtcDgd9rDkzI7rTAn3xz
	d73/mMAtZstHvy3MC8kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyM0g-00BrWr-Sd; Thu, 24 Nov 2022 23:52:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyM0e-00BrW7-5N
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 23:52:01 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oyM0Z-00008S-6U; Fri, 25 Nov 2022 00:51:55 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, emil.renner.berthing@canonical.com
Subject: Re: [PATCH 7/7] RISC-V: add zbb support to string functions
Date: Fri, 25 Nov 2022 00:51:54 +0100
Message-ID: <3259590.VLH7GnMWUR@phil>
In-Reply-To: <Y3/xGhkbf6qEr+5r@spud>
References: <20221110164924.529386-1-heiko@sntech.de> <14728581.RDIVbhacDa@diego> <Y3/xGhkbf6qEr+5r@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_155200_225064_E62E5D2F 
X-CRM114-Status: GOOD (  34.00  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Donnerstag, 24. November 2022, 23:32:58 CET schrieb Conor Dooley:
> On Thu, Nov 24, 2022 at 11:23:08PM +0100, Heiko St=FCbner wrote:
> > > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/as=
m/hwcap.h
> > > > index b22525290073..ac5555fd9788 100644
> > > > --- a/arch/riscv/include/asm/hwcap.h
> > > > +++ b/arch/riscv/include/asm/hwcap.h
> > > > @@ -59,6 +59,7 @@ enum riscv_isa_ext_id {
> > > >  	RISCV_ISA_EXT_ZIHINTPAUSE,
> > > >  	RISCV_ISA_EXT_SSTC,
> > > >  	RISCV_ISA_EXT_SVINVAL,
> > > > +	RISCV_ISA_EXT_ZBB,
> > > =

> > > With ZIHINTPAUSE before SSTC and SVINIVAL I assume this is not someth=
ing
> > > we are canonically ordering but I never, ever know which ones we are
> > > allowed to re-order at will.
> > =

> > I guess we could extend the comments with suitable hints,
> > which could help in the future.
> =

> Aye, for the likes of me that will never, ever remember I like the idea!

I'm 100% with you on this. I remember that this came up either with
svpbmt or zicbom in the past, but I still again forgot how the ordering
goes.

> =

> > > >  	RISCV_ISA_EXT_ID_MAX =3D RISCV_ISA_EXT_MAX,
> > > >  };
> > > =

> > > > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > > > index bf9dd6764bad..66ff36a57e20 100644
> > > > --- a/arch/riscv/kernel/cpu.c
> > > > +++ b/arch/riscv/kernel/cpu.c
> > > > @@ -166,6 +166,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] =
=3D {
> > > >  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> > > >  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> > > >  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> > > > +	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> > > >  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> > > >  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> > > >  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> > > =

> > > This one I do know that Palmer wants canonically ordered.
> =

> btw, idk if you noticed but I appear to have picked canonical ordering
> as today's thing to get confused about a lot.
> =

> You put zbb after the S extentions - does that meant it is *not* an
> "Additional Standard Extension" but rather a regular Z one?

This confuses me completely now :-) .

The list is still too short to see where other extensions
are placed. I guess I need to find that stuff again about
extension ordering.


> > > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpu=
feature.c
> > > > index 026512ca9c4c..f19b9d4e2dca 100644
> > > > --- a/arch/riscv/kernel/cpufeature.c
> > > > +++ b/arch/riscv/kernel/cpufeature.c
> > > > @@ -201,6 +201,7 @@ void __init riscv_fill_hwcap(void)
> > > >  			} else {
> > > >  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
> > > >  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> > > > +				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
> > > >  				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
> > > >  				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
> > > >  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> > > =

> > > This one looks like it is, sstc aside. Same question as above, can I
> > > reorder this one? I'll send a patch for it if I can...
> > =

> > hmm, I don't see the difference between cpu.c above
> > (..., svpbmt, zbb, zicbom, ...) and here
> > (..., svpbmt, zbb, zicbom, ...)
> =

> sstc appears last here but first in the cpu.c hunk above.
> =

> > > > diff --git a/arch/riscv/lib/strcmp_zbb.S b/arch/riscv/lib/strcmp_zb=
b.S
> > > > new file mode 100644
> > > > index 000000000000..aff9b941d3ee
> > > > --- /dev/null
> > > > +++ b/arch/riscv/lib/strcmp_zbb.S
> > > > @@ -0,0 +1,91 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +/*
> > > > + * Copyright (c) 2022 VRULL GmbH
> > > > + * Author: Christoph Muellner <christoph.muellner@vrull.eu>
> > > =

> > > Is a Co-developed-by: appropriate then?
> > =

> > I'd think so ... i.e. the assembly is from Christoph, but is originally
> > part of a pending glibc patchset, hence Christoph and me
> > decided on the co-developed thingy :-) .
> =

> Check your patch again, I don't see a Co-developed-by: tag. (That's what
> I was getting at, not the validity of "Author: Christoph...")

Now I remember, I talked with Christoph about that _after_ sending
this series. So my "git log" did show the Co-developed-by
all the time, which then confused me :-)


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
