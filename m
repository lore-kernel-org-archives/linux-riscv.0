Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BC4C61DA3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 08:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JlAKtetPxXlzewIurwezsLFV4aGfVQ74tgRe2i+kNaQ=; b=CaMWFLPMpZ9gwQ
	l2rpO8kRAta70TsHCSC+/s1qIWuliIPqbhLrWCPWWxVwsTxRZqcO5CC9PmOg7sCT1fb1gaHYKmUcm
	bWkmyawQzabTnBpwuBtXWz42NRiLLsmpZ6QQTqllu7h2fAHwmvsTTTTs5Q+drmcsdIHUB8QtRzVQv
	hT74+oezu/rWk4m+bxCjxXHrAAziVk5iXG8gK9NrYc5+0ajO/1ySLAA990NuOwnvmjKP6oGruU6bD
	hV7YIwl7bhock8EuuZsOjb4yy/fFoIGA+JZf/6TImbTACzorpJqZhadBtrzYMCvRzBrvd39pnpOnM
	scTrjBKJ+bMQ9J0oTMxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVT5m-001TZx-97; Fri, 24 Feb 2023 08:06:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVT5j-001TYt-GN
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 08:06:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so1479227wmb.5
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 00:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OwYWtYjN1CfjceQzav7b8+GgO5w58Bor29r/iGEEIRY=;
        b=G9dYB469tKwGs/z3gT+9nW9btYSFDZfOUHS/7IVAOnsSpXG2KRwG/B9uoLrGXKsuPH
         efAbMUVvRkvu7iSPDHbcRD6F6wPMXgbQm5ESx9VFFPq6e/BST01ZTHD8F83bwBQ35Cjz
         uVhqnJdLZ0ceqpLFpPkDBe2dPrMuqmdDtDHqHGCMSjNLoFfjwOKHBLQ4saLrLQrLa0s+
         wjQIeefsOD/lkzDqFcrzYSKUV3+QV+WFfUTtcJSDICh+ARWWftcvsue6su33Fgb5tHSw
         pDnVWP6yxOQN591AdbiVIHVzcaWSwt2QrqVM0XFJYViLCzDf5qqfzhnqhbP7+1jTjt2/
         mWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwYWtYjN1CfjceQzav7b8+GgO5w58Bor29r/iGEEIRY=;
        b=ZiPPvlDZ6S6y5RCfT529FoC9xlXcUCmjtqzawq7Lqacq+MErrQMKX75xK1FnN5O1W1
         BTXF8DaXD4bstPsVqDRYeyB91Eog2MCzrJChQm8Fqjta8Dsdb0CX2UXlTrSzYf+r0JQb
         QdlqIiTi6FNcyFDmuu2AXr2aqzJjk/3r8lQ2wHDoNkItwsJeUwZR3Z8lrJQyeQAUkc2s
         pSVNfBpoy1z5Gg1ppGwEqtyQgLFSuiKbzNBdScDIZS9vmdvUTMPIYUb+j+TzRQqppXuM
         0D0uVxOcY+6xo4cY18wy/5jfSefCD+1CW9G+WNsw2WcSBStsFKDfgEx1WsFWr6GveS7Y
         Igqg==
X-Gm-Message-State: AO0yUKXn+d8o/GuOcs+pQ9f6ULIQnQ+9jLOZlPpbqcQtV+9Y3/kDW640
	iZaJ1JB4CMdNM0D5mpgLj1uNXw==
X-Google-Smtp-Source: AK7set/xGoU0JTJ7OzYO1fNDranDDqgRd6SlZ5FsEeW/Bx6z6/j7UeiMcXG33tGIDYtktaW9jwQq3w==
X-Received: by 2002:a05:600c:2cd8:b0:3ea:d610:f068 with SMTP id l24-20020a05600c2cd800b003ead610f068mr2840268wmc.33.1677225964407;
        Fri, 24 Feb 2023 00:06:04 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j21-20020a5d6e55000000b002c3f81c51b6sm13639503wrz.90.2023.02.24.00.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 00:06:03 -0800 (PST)
Date: Fri, 24 Feb 2023 09:06:02 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, 'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 3/5] riscv: alternatives: Rename errata_id to patch_id
Message-ID: <20230224080602.eddclmcn2sbn6ca7@orel>
References: <20230221185603.570882-1-ajones@ventanamicro.com>
 <20230221185603.570882-4-ajones@ventanamicro.com>
 <Y/f1uRERxTU5kAgh@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y/f1uRERxTU5kAgh@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_000607_569974_80471CD4 
X-CRM114-Status: GOOD (  28.08  )
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

On Thu, Feb 23, 2023 at 11:24:41PM +0000, Conor Dooley wrote:
> On Tue, Feb 21, 2023 at 07:56:01PM +0100, Andrew Jones wrote:
> > Alternatives are used for both errata and cpufeatures. Use a more
> > generic name, 'patch_id', as in "ID of code patching site", to
> > avoid confusion when alternatives are used for cpufeatures.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/Kconfig                          |  6 +-
> >  arch/riscv/errata/sifive/errata.c           |  6 +-
> >  arch/riscv/errata/thead/errata.c            |  4 +-
> >  arch/riscv/include/asm/alternative-macros.h | 72 ++++++++++-----------
> >  arch/riscv/include/asm/alternative.h        |  2 +-
> >  arch/riscv/kernel/cpufeature.c              |  6 +-
> >  6 files changed, 48 insertions(+), 48 deletions(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 736f42f572aa..0c494c36e911 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -377,9 +377,9 @@ config RISCV_ALTERNATIVE
> >  	depends on !XIP_KERNEL
> >  	help
> >  	  This Kconfig allows the kernel to automatically patch the
> > -	  errata required by the execution platform at run time. The
> > -	  code patching is performed once in the boot stages. It means
> > -	  that the overhead from this mechanism is just taken once.
> > +	  erratum or cpufeature required by the execution platform at run
> > +	  time. The code patching is performed once in the boot stages. It
> > +	  means that the overhead from this mechanism is just taken once.
> 
> A line in this comment doesn't really make much sense to an unfamiliar
> reader. "Once in the boot stages"? That's just not true, is it?
> Code patching for alternatives happens more than once and not just
> during boot? Not this patch's doing though!

Right, code patching also happens at module load time. Reworking this
paragraph would be another nice cleanup. I can respin this series with
another patch doing that, along with picking up other suggestions you
have.

> 
> > diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> > index 3beef400a971..8f39d4e8598d 100644
> > --- a/arch/riscv/include/asm/alternative.h
> > +++ b/arch/riscv/include/asm/alternative.h
> > @@ -38,7 +38,7 @@ struct alt_entry {
> >  	s32 alt_offset;		/* offset relative to replacement instruction or data */
> >  	u16 vendor_id;		/* cpu vendor id */
> >  	u16 alt_len;		/* The replacement size */
> > -	u32 errata_id;		/* The errata id */
> > +	u32 patch_id;		/* The patch ID (erratum ID or cpufeature ID) */
> 
> The inconsistent use of ID versus id in these comments bothers my OCD!

I'll sneak a change in of vendor_id's comment to 'CPU vendor ID' for v2.

> 
> Either way, "patch" is a more accurate description of the usage than
> errata, so I am on board.
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
