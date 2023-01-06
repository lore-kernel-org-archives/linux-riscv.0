Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B18C3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 08:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0n7UXoyLXRDDkj+gE3VGanR0DaFBfJKS0O1Cpr1WBjk=; b=ymSvTbUhLoTnm8
	zfKvBW5yJVPZTfvAHNDDqfLe4Tn1QKABkoMcBwsSSXsN+CcWu2+ccGFGTMzNco/sesSwj1kb0OcH5
	w2L0qMw7941db+5/9JuhR/l0SILT+/Hhe5mXkfCWaEkOThVlHMrqPcxs17V6bB6dOlcXK5esFIpSe
	0Pzp9A84b0PxuRMb8yV5zYHaeMVwBQDSHI1NWwORyS+WFKBq3NVmCf51uH2jxEoCHXyKGRYbW6dUd
	FUWpS9uicVo4W1MRShvEozBaLHvXCUx6T22+Gl3KY43GKwUxGeK+l/WnB/X8ELdznBpoQAqWreWye
	H5NeDmWqrDFkGmV4QOdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDi1C-006aMt-Ux; Fri, 06 Jan 2023 08:24:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDi10-006aCm-NG
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 08:23:52 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pDi0w-000762-Ho; Fri, 06 Jan 2023 09:23:46 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu
Subject: Re: [PATCH v2] RISC-V: fix compile error from deduplicated __ALTERNATIVE_CFG_2
Date: Fri, 06 Jan 2023 09:23:45 +0100
Message-ID: <4401184.1IzOArtZ34@diego>
In-Reply-To: <20230106065449.nycjn6mlkmrwqfo7@orel>
References: <20230105192610.1940841-1-heiko@sntech.de> <20230106065449.nycjn6mlkmrwqfo7@orel>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_002350_778573_0EAAC539 
X-CRM114-Status: GOOD (  25.49  )
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

Am Freitag, 6. Januar 2023, 07:54:49 CET schrieb Andrew Jones:
> On Thu, Jan 05, 2023 at 08:26:10PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > On the non-assembler-side wrapping alternative-macros inside other macros
> > to prevent duplication of code works, as the end result will just be a
> > string that gets fed to the asm instruction.
> > 
> > In real assembler code, wrapping .macro blocks inside other .macro blocks
> > brings more restrictions on usage it seems and the optimization done by
> > commit 2ba8c7dc71c0 ("riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2")
> > results in a compile error like:
> > 
> > ../arch/riscv/lib/strcmp.S: Assembler messages:
> > ../arch/riscv/lib/strcmp.S:15: Error: too many positional arguments
> > ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "886:"
> > ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "887:"
> > ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "886:"
> > ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "887:"
> > ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "886:"
> > ../arch/riscv/lib/strcmp.S:15: Error: attempt to move .org backwards
> > 
> > Wrapping the variables containing assembler code in quotes solves this issue,
> > compilation and the code in question still works and objdump also shows sane
> > decompiled results of the affected code.
> > 
> > Fixes: 2ba8c7dc71c0 ("riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2")
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > ---
> > changes in v2:
> > - don't revert the affected cleanup but use quotes around the parts
> > 
> > Tested on qemu + Allwinner D1 + specially created test-cases using
> > ALTERNATIVE_2 in full assembler .S files
> > 
> >  arch/riscv/include/asm/alternative-macros.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> > index 7226e2462584..2c0f4c887289 100644
> > --- a/arch/riscv/include/asm/alternative-macros.h
> > +++ b/arch/riscv/include/asm/alternative-macros.h
> > @@ -46,7 +46,7 @@
> >  
> >  .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
> >  				new_c_2, vendor_id_2, errata_id_2, enable_2
> > -	ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1
> > +	ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \errata_id_1, \enable_1
> >  	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
> >  .endm
> >  
> >
> 
> I was sort of hoping we'd change the vararg "hack" at the same time, with
> a separate patch, but I guess we can focus on getting this breakage fixed
> first and worry about the vararg later.

I was debating with myself about that :-) . But then did go with the
minimal variant, as I expect this to go into 6.2-rc and thus not wanting
to introduce too much changes here.


> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

thanks :-)


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
