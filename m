Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73888C3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 23:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8F6q/6ydn2E1GZ+yUws2W7sMXEEXRZCVInPevg09XQ=; b=rXy/uq+EnVB5Jw
	OOyS7dDR+bseBKQZhz/KYyXRp0y+qWVktBokHSJcCP6fU8DQjNrsV598AtGBcB5SlapCfRcWLkwn2
	Fmt0sjFH/igQa6WlWKCu1GuUyIxRRInUq+BkXeCewsJFQrrIqr4dcvPfDI8CaDebYIHUx2LYZkF9h
	9Kr8vF/zcAbZgaBd+g/HIjGa0cNEx7CDDaHDSEFqJ1TBL6QwfXyAlwLVEK6erNh5aXPZynFDD/J9N
	heBfDhdPwlw9FzmYfJQSBjXLvxG82NJy3HVyLM1P0r0qF48gOBzAPozDhRGqEd3E0nVDx022zTELD
	h+HxqSQhLjHTQ620bGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDZew-00G8tV-M2; Thu, 05 Jan 2023 23:28:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDXSS-00EutK-PH
	for linux-riscv@lists.infradead.org; Thu, 05 Jan 2023 21:07:30 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pDXSQ-0002l9-3p; Thu, 05 Jan 2023 22:07:26 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, christoph.muellner@vrull.eu, Conor Dooley <conor@kernel.org>, philipp.tomsich@vrull.eu, ajones@ventanamicro.com
Subject: Re: [PATCH v2] RISC-V: fix compile error from deduplicated __ALTERNATIVE_CFG_2
Date: Thu, 05 Jan 2023 22:07:25 +0100
Message-ID: <2446503.NgBsaNRSFp@diego>
In-Reply-To: <mhng-025b9fe5-fa23-4930-997a-e4aca277fe47@palmer-ri-x1c9>
References: <mhng-025b9fe5-fa23-4930-997a-e4aca277fe47@palmer-ri-x1c9>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_130728_901858_68C20681 
X-CRM114-Status: GOOD (  24.58  )
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

Am Donnerstag, 5. Januar 2023, 21:47:47 CET schrieb Palmer Dabbelt:
> On Thu, 05 Jan 2023 11:26:10 PST (-0800), heiko@sntech.de wrote:
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
> 
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> I'm going to hold off on this one for this week, though -- at least to 
> give it some time on the lists, but it appears this hasn't landed at 
> lore/patchwork yet and thus might be stuck.  It is in the mailman 
> archives...

No worries - there isn't any real-word breakage happening with 6.2-rc
So we're in no particular rush to fix somebodies broken boardfarm :-)

Heiko

> http://lists.infradead.org/pipermail/linux-riscv/2023-January/024682.html
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
