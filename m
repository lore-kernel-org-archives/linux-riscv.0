Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2108CC25B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 16:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvvlpolMMJu8wfyd24QKxJ4ncgqNuPzlg1bw4gOr2Ds=; b=ChOs4b61hOxGc6
	Y+pOLWCGMrhxhTyGAiS7VwMu0RsffJAsywJtpgmo4p6Q/hDDk2uS0r++3ACdBWRrsWadGWabGkmg3
	EhsKLEJL4KG7eASbuwBaiMFXjZc4N5Fzrye2tIQkF2OVRqwU9wxixoz6gZjtK8Dq/OBNf1Bn83z9C
	5SOT/ZX2col4bLSdv7Gib0/FQzTcmNVWzBfMGHnPDUzSYO7NJUu24pTMkvzPwe161wMTotwkk04gl
	3uZN879Hlp6wK1umMQ8p/pW6R/ziwIRPqvkAO7sr8hgVNm2YZz/ud5D73FWIe1B8ahbSB3u157R8v
	w1ZNmqVReiF3cj4qaUIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNzlO-004qFu-CK; Tue, 16 Aug 2022 16:49:58 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNzlL-004qBk-Le
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 16:49:57 +0000
Received: by mail-ed1-x52c.google.com with SMTP id r4so14218449edi.8
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 09:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=eESoYwKpImCoaxIugOjniEJkQT2OCNtFIufUhKGJ9QQ=;
        b=gUPJqfORSBSI+qNKrEFjTwwbcDdC4IvT0TiimScMDlCuGBELGb2WKQnE7VXXlxYnum
         fjg3hqC8L34ZuKo3RGWwrad1QRRxM6zC3pQoQO9+d/qaPPICi6TCRzICYvC3jtNRTMwn
         XyxjhMV9LQETN8rEgfYsOoStpjz/NMuXl3xN7MwPEmoKC8G9G3/Lw/IyFnIgq77YTTvK
         AtoUg8gxLkDQnIv4cwoIRo+C0/GRDFkAzhx4zzFzwHwVQwB1LQkU/aaBgpWVIolECy5F
         +Kc3dpYQdHWsvS67JXG7DhN/zcFYBZbNWe1DQ7wjxjzFuKBouJubEHtMd0iKgVvCgd/7
         l4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=eESoYwKpImCoaxIugOjniEJkQT2OCNtFIufUhKGJ9QQ=;
        b=Ka1f01bTI3XOajENBXWq37105yF2SbgPFdcEFlseCYRg+5Iri+6SiKhL8wIvg4ck0K
         9ATL0cKp8NuKkiXY5hIGri4e2VPCG9vY3H46oTvA7jP05Ui/lfguH21jRRvrXp6tNPp1
         tYkUR6300WcNOXV/xEIRvVQhWTBvO6ROKLREHPmu8VG/OMiv0sjamuFvL9SW3fd0r+Ty
         smu+hNayM4Kw0jtwjf1oe17NE2B1w0eAU2zly1l+mQslCizvxjVxEJDfmWevsUyS80+A
         5XOhu6KmjFExKobILYMn6MziFxU0sij1QDBv48on+TdSmdhecct28C+N1oNqUXl+919I
         ZP9Q==
X-Gm-Message-State: ACgBeo02xsiBitRqObPAsx3Ym5P1JowTrWZiUO3z1eiBWnnLfl/1+LMe
	bmD0rfN4LX0/wGcGr6Y1SsglOw==
X-Google-Smtp-Source: AA6agR4Do7hhL5rTRE7cw5+BvG48GNXRfi2jdoZtUB8jli9rEhhAjmH1ksPUKgXX75yJYa5OcRoVsg==
X-Received: by 2002:a05:6402:3697:b0:443:1c6:acc3 with SMTP id ej23-20020a056402369700b0044301c6acc3mr19927913edb.421.1660668591977;
        Tue, 16 Aug 2022 09:49:51 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id g3-20020a170906538300b007307c4c8a5dsm5500149ejo.58.2022.08.16.09.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 09:49:51 -0700 (PDT)
Date: Tue, 16 Aug 2022 18:49:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor.Dooley@microchip.com
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, daolu@rivosinc.com,
	jszhang@kernel.org, palmer@dabbelt.com, re@w6rz.net,
	apatel@ventanamicro.com
Subject: Re: [PATCH] riscv: Ensure isa-ext static keys are writable
Message-ID: <20220816164950.vyo7iiiehhhasxpr@kamzik>
References: <20220816163058.3004536-1-ajones@ventanamicro.com>
 <bef1a711-506a-d07b-dbd6-3a0c5f90aef2@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bef1a711-506a-d07b-dbd6-3a0c5f90aef2@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_094955_740895_1509E53F 
X-CRM114-Status: GOOD (  19.01  )
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

On Tue, Aug 16, 2022 at 04:36:55PM +0000, Conor.Dooley@microchip.com wrote:
> On 16/08/2022 17:30, Andrew Jones wrote:
> > riscv_isa_ext_keys[] is an array of static keys used in the unified
> > ISA extension framework. The keys added to this array may be used
> > anywhere, including in modules. Ensure the keys remain writable by
> > placing them in the data section.
> > 
> > The need to change riscv_isa_ext_keys[]'s section was found when the
> > kvm module started failing to load. Commit 8eb060e10185 ("arch/riscv:
> > add Zihintpause support") adds a static branch check for a newly
> > added isa-ext key to cpu_relax(), which kvm uses.
> > 
> > Fixes: c360cbec3511 ("riscv: introduce unified static key mechanism for ISA extensions")
> 
> Hey Drew,
> How about adding:
> 
> Reported-by: Ron Economos <re@w6rz.net>
> Reported-by: Anup Patel <apatel@ventanamicro.com>
> Reported-by: Conor Dooley <conor.dooley@microchip.com>

Sure, should I repost or can those be picked up when/if the patch is
picked up?

Thanks,
drew

> 
> Thanks,
> Conor.
> 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 553d755483ed..3b5583db9d80 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -28,7 +28,7 @@ unsigned long elf_hwcap __read_mostly;
> >  /* Host ISA bitmap */
> >  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> >  
> > -__ro_after_init DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
> > +DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
> >  EXPORT_SYMBOL(riscv_isa_ext_keys);
> >  
> >  /**

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
