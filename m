Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7867FC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gaTV9gFZOYfQIPAa/Q1L+Wg1DHZ08t2cX8iBZfugXPc=; b=AvmsMb8HbelrUl
	l/NMAXp2cCajNy6NcLz7a53TpS1VFy9Ni/aDGugLiLd5AFO6dxyeew9Mvdlsc2XBMOFPZqUhc66lu
	LS4a3Jtw8UE6tOuh5dMszvWarsq5xGRmlgSGUPsojZLoiQdgmLoduQn0XZvQe7sb7QE7JUcWyLOfM
	AFP78bg5lQm4mDDIPZ25jFuFpNzEchXqkLkwxucXGMduu9xv8LKAYPNug3eN6IByEirRby4q7YVp8
	GpyI6afSQXT3OZiSW56uA+ix6AVcrexxAukyAbktDmyZp9zRWZr12VNVnGp9/HM6lJFpEg+jxlV1Z
	UwgG3eMQ6TCtwXdKkZdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5SC-009zzy-E3; Wed, 04 Jan 2023 15:13:20 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD4Rb-009aSh-Cc
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 14:08:41 +0000
Received: by mail-ej1-x631.google.com with SMTP id jo4so82872092ejb.7
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jan 2023 06:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zcal7rN8nmM+ZJoGg9jtNeC1LO+XM2qL/mzuTnrlICI=;
        b=iOByBljTxscI4KKf7ngHSpqeKigRVvRL9BX87Usr85wrijpgs7Kgfcy5utZIH/xObV
         kn3RcUr4faEKthGi/ZE29xgVJD9FILlhFAcne+xWleONoa+MfRsiVrig/I3podYAy5d0
         XrXqyrZynuwor1SrZXRn0A1L7+o4RV/nnzqs7iO3r60+rxFGpSoZ8vCbtF//FdtsoaRO
         +h8lSioP59ESDM8HscTw3/FDr7t/65bmVsvdvFG5NPK/vO7b/Hy8AebGO8cKovw1Evig
         svMgw2Dv8mCj7bgxEveDSetBHHg1UE3IIgMMtZYftOXIAy0Bs2dR5V9ih6gWEoYmUjtk
         No9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zcal7rN8nmM+ZJoGg9jtNeC1LO+XM2qL/mzuTnrlICI=;
        b=YA05vlyjuH6qNcGaSmX3zYA6Fzw97Y0P3oSZFKYX29BnN2oiA/hZyEEE12ZXcsUFdF
         3JyibB/PbFsZyBeMrfnQCyGmZx5Y+ZB4GZ3Zr1z9gTHWjulM8vIo/uuixxK1C97+dzWb
         rmh8ru9WoHd8YqnRjmDJL8HMw7xnUHxZSz7PKVEwrNbdhT8Wdebh+EtOiadseOV1ZkW/
         6vcGH0ERtFJUf+Xq+yfok76PhgTQLl7vYmiDsgEfliiFPLLPjTk3Z5ZnWOxBPtHUzKuh
         LW1f4Wgm9Qi/cyE+qHTxR9xbQJemwbg1fknVn+PcI/mMiMmUCnmcxkE2veqgGbbdZHBn
         ehCg==
X-Gm-Message-State: AFqh2koACLJLy0pnkZl6zyi6XOQBij3Xj1FBiNSwLeqeKKUgVhhHR0kk
	mIQPJdoFWRsD6UX3CWZcsYgOkg==
X-Google-Smtp-Source: AMrXdXuyq0RCg4kgtGT1NmBxNB1lmsRp6Pka2J4FWjwlduF8YqyZa64xsto+SaySZEu2xyXAd6UYXQ==
X-Received: by 2002:a17:906:3095:b0:7be:fb2c:c112 with SMTP id 21-20020a170906309500b007befb2cc112mr39417592ejv.66.1672841315119;
        Wed, 04 Jan 2023 06:08:35 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id k3-20020a17090632c300b00781dbdb292asm15332555ejk.155.2023.01.04.06.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 06:08:34 -0800 (PST)
Date: Wed, 4 Jan 2023 15:08:33 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, christoph.muellner@vrull.eu,
	philipp.tomsich@vrull.eu, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH] RISC-V: fix compile error from decuplicated
 __ALTERNATIVE_CFG_2
Message-ID: <20230104140833.nbulmdsgcm5x7d47@orel>
References: <20230103214228.841297-1-heiko@sntech.de>
 <Y7V/NZdDf4TpPBh9@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y7V/NZdDf4TpPBh9@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_060839_479143_3EB403B9 
X-CRM114-Status: GOOD (  35.05  )
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

On Wed, Jan 04, 2023 at 01:29:25PM +0000, Conor Dooley wrote:
> On Tue, Jan 03, 2023 at 10:42:28PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> > RISC-V: fix compile error from decuplicated __ALTERNATIVE_CFG_2
> 
> Hey Heiko/Palmer,
> 
> Was a little hard to tell from Drew's mail if he was objecting to this
> variant of the patch, but FWIW s/decup/dedup/ if this gets applied
> as-is.

I wasn't completely objecting, but rather suggesting we still try to
factor out what we can. However, after reading a bit more about macros
I tried this

 .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,   \
                                new_c_2, vendor_id_2, errata_id_2, enable_2
-       ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1
+       ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \errata_id_1, \enable_1
        ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
 .endm

which appears to work for my simple test. Does that work for you too,
Heiko? If so, then I think I'd prefer we do that. Also, we may want to add
quotes to all macro arguments which may contain spaces, even if things
seem to work now, e.g. the \new_c_2 argument passed to ALT_NEW_CONTENT.

Thanks,
drew


> 
> Thanks,
> Conor.
> 
> > On the non-assembler-side wrapping alternative-macros inside other macros
> > to prevent duplication of code works, as the end result will just be a
> > string that gets fed to the asm instruction.
> > 
> > In real assembler code, wrapping .macro blocks inside other .macro blocks
> > brings more restrictions on usage and the optimization done by
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
> > Going back to the original code for the non-assembler-part makes that
> > code work again. So this reverts the #ifdef ASSEMBLY part of that commit
> > to the previous variant with duplicated base.
> > 
> > Fixes: 2ba8c7dc71c0 ("riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2")
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > ---
> > I was of two minds about either to revert the full patch, or doing just
> > this partial one for the ASSEMBLY part. I did go with this variant, as I
> > still like the idea of deduplicating as much as possible :-)
> > 
> >  arch/riscv/include/asm/alternative-macros.h | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> > index 7226e2462584..e7bdb2a510a4 100644
> > --- a/arch/riscv/include/asm/alternative-macros.h
> > +++ b/arch/riscv/include/asm/alternative-macros.h
> > @@ -44,9 +44,20 @@
> >  	ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, \new_c
> >  .endm
> >  
> > +/*
> > + * Using ALTERNATIVE_CFG inside ALTERNATIVE_CFG_2 results in compile errors.
> > + * So the common code needs to stay duplicated.
> > + */
> >  .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
> >  				new_c_2, vendor_id_2, errata_id_2, enable_2
> > -	ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1
> > +886 :
> > +	.option push
> > +	.option norvc
> > +	.option norelax
> > +	\old_c
> > +	.option pop
> > +887 :
> > +	ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
> >  	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
> >  .endm
> >  
> > -- 
> > 2.35.1
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
