Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14B9C71153
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 19:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x8oXLNq4CL87QFoCYnlO6iEPKlH9dWZSrrgY/so/Gx0=; b=jaUIGBqQF4AvAj
	qQbLfxt2O2YqqdQlQvfkyuk7sRKW+hJttC1FeObtimXtZ+NEN+qXn2CS35hq6x7+oeKJOXEuWIAvS
	Qax5edb9/trXVd7TDqItwBxHhUQFAG1wiyn+RuinJss+7pP1Gwy6pkEwjueFHDTQXVSqwD2++bWWJ
	roWBS7gsqqx/2CXlhaeVni7Sr65WY3GuVBe/rblMYPk+mgQ1dzhkKvh2ZG06GhXuSY066PcFJvUI2
	1qak4Di2KuIJwloYI3eEVW+EGl4Obad41iIFXq1DbKGAAB20uMXEi8ivYxES9w00fYqa+sw0JsrgG
	t+0o3WvEAZf9BYkiEaFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdFj7-004jE8-10;
	Mon, 04 Sep 2023 19:59:13 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdFj3-004jDH-1v
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 19:59:11 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c1ff5b741cso13586945ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 12:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693857544; x=1694462344; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3fek8HxM1sqQEDL9Khn6Uyo9b2PBeQlrpLwpl5iq+Vg=;
        b=M8yoh00THctAtl85rvxkgD90h6kT70sr/CRq/OJHb+de7LBrbZKaRaX1NXADK5UVrI
         +OIrcow6j0xUG2pJIMXZa4YJGjkT9cf+ViOTabVq7k0omgPzrZv7rV7GlP+tZa0G5ugB
         HbVeUSZkumIKMOzt5KXK80wrCCIholGBoLhYCi6PAILKg1h6e/sGf0KRKTIInBNe+Q+4
         EcjmyNOEc6RmyJv8BM/nHljnKbW1E377l0p3JeqwpUuuhOnIjrvHydqgelVImageTflU
         r6fohlBXlkCLDIV5L4TR0Tdf1zDNghs0ZG9xzPT5nzMje0kM3BjQw9EDAO6e88KkxGjt
         96Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693857544; x=1694462344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fek8HxM1sqQEDL9Khn6Uyo9b2PBeQlrpLwpl5iq+Vg=;
        b=HajpQ57K+kPiQMAqMS6v5KU0uhMFv9KJTOlMsdZqF20ZA/os7aPPl5vYFYjo6E7/ml
         86ZOOX4Iz0beQYCoHsfDcM7gvbPb97n+ApPYZjol557UlCaKnsuAeC+RAOdYRiWScLjy
         R6RS9uRh9pRR7UJAa58MxR+xqVp0/0GGxiAMg6lq9IjxbMgAgCuLc2Fh5z8J/NevNrEP
         aAromf3StMWNXs4w10Yb+nT1H68ymXKXdleVSnoOY4PY8qooeKE5qp/GVtfhX5M2bNla
         c/4iuh3Ck6ZN6j7zeS3Ii779reht9Jayd2JLgtbH4/6//YbpqMJO5msw0u1XuEWfLdFK
         AIag==
X-Gm-Message-State: AOJu0Yw9EU9IJIccSB+CIpOEQq+Ze3+bUWoqd4T5UrM8XYieYbjef4l5
	oAKC02sH0Q1+PUic738RjKzzvAqLRD3IrK8/xnU=
X-Google-Smtp-Source: AGHT+IHPTpkZX6Wn7xLRr3ok2P/SuL60WGAoFAY1m9/iCjATnd2NwJiFdX9tASOBk2VR8QWrXxQ6pg==
X-Received: by 2002:a17:902:d504:b0:1c0:ec66:f2b5 with SMTP id b4-20020a170902d50400b001c0ec66f2b5mr13820261plg.57.1693857544593;
        Mon, 04 Sep 2023 12:59:04 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:5de2:2323:20de:e26d])
        by smtp.gmail.com with ESMTPSA id d1-20020a170903230100b001b9dab0397bsm7896702plh.29.2023.09.04.12.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 12:59:04 -0700 (PDT)
Date: Mon, 4 Sep 2023 12:59:02 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 1/2] riscv: errata: fix T-Head dcache.cva encoding
Message-ID: <ZPY3BpYMzs6FbrNS@x1>
References: <20230827090813.1353-1-jszhang@kernel.org>
 <20230827090813.1353-2-jszhang@kernel.org>
 <ZPYzXeYGyGCxJUuK@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZPYzXeYGyGCxJUuK@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_125909_671359_D4EE596B 
X-CRM114-Status: GOOD (  24.06  )
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
Cc: Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 04, 2023 at 12:43:25PM -0700, Drew Fustini wrote:
> On Sun, Aug 27, 2023 at 05:08:12PM +0800, Jisheng Zhang wrote:
> > From: Icenowy Zheng <uwu@icenowy.me>
> > 
> > The dcache.cva encoding shown in the comments are wrong, it's for
> > dcache.cval1 (which is restricted to L1) instead.
> > 
> > Fix this in the comment and in the hardcoded instruction.
> > 
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Tested-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > Reviewed-by: Guo Ren <guoren@kernel.org>
> > ---
> >  arch/riscv/include/asm/errata_list.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> > index fb1a810f3d8c..feab334dd832 100644
> > --- a/arch/riscv/include/asm/errata_list.h
> > +++ b/arch/riscv/include/asm/errata_list.h
> > @@ -100,7 +100,7 @@ asm volatile(ALTERNATIVE(						\
> >   * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> >   *   0000001    01001      rs1       000      00000  0001011
> >   * dcache.cva rs1 (clean, virtual address)
> > - *   0000001    00100      rs1       000      00000  0001011
> > + *   0000001    00101      rs1       000      00000  0001011
> >   *
> >   * dcache.cipa rs1 (clean then invalidate, physical address)
> >   * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> > @@ -113,7 +113,7 @@ asm volatile(ALTERNATIVE(						\
> >   *   0000000    11001     00000      000      00000  0001011
> >   */
> >  #define THEAD_inval_A0	".long 0x0265000b"
> > -#define THEAD_clean_A0	".long 0x0245000b"
> > +#define THEAD_clean_A0	".long 0x0255000b"
> >  #define THEAD_flush_A0	".long 0x0275000b"
> >  #define THEAD_SYNC_S	".long 0x0190000b"
> >  
> > -- 
> > 2.40.1
> > 
> 
> Tested-by: Drew Fustini <dfustini@baylibre.com>
> 
> I applied this on top of the emmc series [1] and the dma-noncoherent dts
> patch [2]. SDMA is now working with this patch applied. Before this
> patch, the filesystems on the emmc were corrupted after mounting. It
> makes sense that problem is solved by the correct cache clean
> instruction being used.

Even better, ADMA is now working in sdhci-of-dwcmshc too.

I'll respin my eMMC series.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
