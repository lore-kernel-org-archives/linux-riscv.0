Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA5EC43217
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 22:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptNzOt+Rz+9dHofUflU+u52bDOhfCK+VPTEyFkU75Sg=; b=xIuXtB2v237Ed0
	IPO6GXHeBTXnk5fw12ZSVnTvWwF9p3qIY7lc0bgd5bdhDE8xRCRRsYYh0M4qBvCDLdmny/GCMiyOE
	i6cCWHWfgYE7k8JZBFPaqJQajA2GG7eOeFEnyzWLbxTxrKwHYKrB/Yu88U4NnVtpeH7O7iYUN1xJN
	s+gMPB/mqGOd06GuqfkVygrQw5Ty104sLeZaYpe5UduzaGVhOuajF9ifwf67gtzzC4LbuRoqxJUMF
	THSLqeTNKthWb3Omy4qFHUBtJ+WcU/d14OmPh9oh0daant/2QdM4YCIeIydxGJldGGYLC1BClPzXO
	n40WYins6mqMG7sbFHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyKcm-00BhBk-Om; Thu, 24 Nov 2022 22:23:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyKcj-00BhAi-R8
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 22:23:15 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oyKcf-0008Gs-Ma; Thu, 24 Nov 2022 23:23:09 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, emil.renner.berthing@canonical.com
Subject: Re: [PATCH 7/7] RISC-V: add zbb support to string functions
Date: Thu, 24 Nov 2022 23:23:08 +0100
Message-ID: <14728581.RDIVbhacDa@diego>
In-Reply-To: <Y3F936DrR6SMcJvR@spud>
References: <20221110164924.529386-1-heiko@sntech.de> <20221110164924.529386-8-heiko@sntech.de> <Y3F936DrR6SMcJvR@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_142313_908428_D220E58A 
X-CRM114-Status: GOOD (  25.52  )
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

> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index b22525290073..ac5555fd9788 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -59,6 +59,7 @@ enum riscv_isa_ext_id {
> >  	RISCV_ISA_EXT_ZIHINTPAUSE,
> >  	RISCV_ISA_EXT_SSTC,
> >  	RISCV_ISA_EXT_SVINVAL,
> > +	RISCV_ISA_EXT_ZBB,
> 
> With ZIHINTPAUSE before SSTC and SVINIVAL I assume this is not something
> we are canonically ordering but I never, ever know which ones we are
> allowed to re-order at will.

I guess we could extend the comments with suitable hints,
which could help in the future.

> 
> >  	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
> >  };
> 
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index bf9dd6764bad..66ff36a57e20 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -166,6 +166,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
> >  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> >  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> >  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> > +	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> >  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> >  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> >  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> 
> This one I do know that Palmer wants canonically ordered.
> 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 026512ca9c4c..f19b9d4e2dca 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -201,6 +201,7 @@ void __init riscv_fill_hwcap(void)
> >  			} else {
> >  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
> >  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> > +				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
> >  				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
> >  				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
> >  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> 
> This one looks like it is, sstc aside. Same question as above, can I
> reorder this one? I'll send a patch for it if I can...

hmm, I don't see the difference between cpu.c above
(..., svpbmt, zbb, zicbom, ...) and here
(..., svpbmt, zbb, zicbom, ...)


> > diff --git a/arch/riscv/lib/strcmp_zbb.S b/arch/riscv/lib/strcmp_zbb.S
> > new file mode 100644
> > index 000000000000..aff9b941d3ee
> > --- /dev/null
> > +++ b/arch/riscv/lib/strcmp_zbb.S
> > @@ -0,0 +1,91 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2022 VRULL GmbH
> > + * Author: Christoph Muellner <christoph.muellner@vrull.eu>
> 
> Is a Co-developed-by: appropriate then?

I'd think so ... i.e. the assembly is from Christoph, but is originally
part of a pending glibc patchset, hence Christoph and me
decided on the co-developed thingy :-) .

> > +	/* Main loop for aligned string.  */
> > +	.p2align 3
> > +1:
> > +	REG_L	data1, 0(src1)
> > +	REG_L	data2, 0(src2)
> > +	orc.b	data1_orcb, data1
> > +	bne	data1_orcb, m1, 2f
> > +	addi	src1, src1, SZREG
> > +	addi	src2, src2, SZREG
> > +	beq	data1, data2, 1b
> > +
> > +	/* Words don't match, and no null byte in the first
> > +	 * word. Get bytes in big-endian order and compare.  */
> > +#ifndef CONFIG_CPU_BIG_ENDIAN
> 
> I know this is a lift from the reference implementation in the spec, but
> do we actually need this ifndef section?

I don't know, but _if_ big endian support comes in the future,
having one place less to break also might be helpful? :-)



Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
