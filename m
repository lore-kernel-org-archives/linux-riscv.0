Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C80BC369A2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 01:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZHwA7yo00zCw2WLS3x/Wh1hc+gpwgQI0HAZ3P4WqLM=; b=BzJyaJ+Li1KLxj
	ZTy3gg16ukI+MSet3rm1Shkpo3o5Wo0qFIq3xDaB/oVX+w3FfOKjpNJCeLXEiPW04QHkid8VHKXFG
	dm99a3d6tshFk3Mha+t+WmtyvTMyQfu0Hv0/TYObHgj6DQSr4PfVX++OU/rp31F08aL9/XwwZYrOl
	5IEhNXxFMOMj+kFyeOHUQbgaRLEodz4KQtNQuvN86v7ZVHdWbCAMNl7l8z0i/SoI/ehUVZRQmiFxy
	VecVBiEm4fZ73D07goZVQzK39jG8QSjo2EpVOVM/5FRge7J9Z8CKOxGRawg4xRCOCFMOYeZhvj5wa
	6PpTf+AKymZGrE2UYdjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gbT-00000008vZU-2Sj6;
	Thu, 10 Apr 2025 01:21:16 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gbQ-00000008vYC-2kRH
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 01:21:14 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-47690a4ec97so2287591cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 18:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744248071; x=1744852871; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pS6d3AN8lttz2UBagEPNT7oB3nkS/KEu1Jsz1U5vt+0=;
        b=hq9qtArJP5aYYu8jIeRs+VllrGwUXUVVHDhWIhhp2/SPMo/o2DTjre3rL4rKpgdvcK
         4qSVGwRkUGaZK83T/BoLCZcPqKci1+GAp0McOnW3ND7yL+cT3TeW5ame2PWnFKTtj73Z
         qScZ2Jm8+9b80CCleHBvcx5InFolMM4gJC0/oEY9mMOlb+kUGS6Pj6Ty1SfLxQdCYlZJ
         U/asn5aq6MCZLj7oZnKPlKGS/Ez2QSnxl9GMAIa66ZAZ9e25aiTh+kIIjl20kBToPqBV
         mYQkVyfTZElE2XxaKsGTMghVqnDmVMRscVDI9tNBX0AD93755LFCiochmIf1oFzMEriM
         f4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744248071; x=1744852871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pS6d3AN8lttz2UBagEPNT7oB3nkS/KEu1Jsz1U5vt+0=;
        b=JCfrgbFqk6/mjaQF1inxIALNcsmBkGl3CqCLN2V5FK5yV8fsBWBh2XB9sUhP24rx2O
         hcjsGA7rtKG+FC6Z6aeRmGJaN7bsxJRt5XEPtgucilu1vzXxJS1KpGMmgUmWG/IPY5xr
         mQBB1qd18YSCXdASilQNliHSTkwgS8p2bOxH3Mrzy8gyuaVYzogjxpdwFjOdEGNpZnES
         qizffBP07N6TY25BmeL/GkH+JgFlDz8KQCFIgHVXpL8NP7vbXTEI4BzUdCPy9J89H7nt
         BtnmU3Ww1/d2sawyCU545AZZ8jFpK7cIBxO6MmEhNA6DiC769qBoMwTa/EAB6eAOiviT
         Qc4w==
X-Forwarded-Encrypted: i=1; AJvYcCVijSr2S1LEfBXYQFj2xHL12j87YZ3u+jiXwg9BOKwzljev3ZDht9i3G2htHuyTBqMjOIviUlPgWFom0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YweqhV2uBFc/KEtfdDvH+nn2asSgOJOcGHpNYrKF4lObz8qj+n2
	WwUgk6nQzYfabm015XmvosdPFKFy6NLSX+dxC58zxYIFmkPdNK+y
X-Gm-Gg: ASbGnctd69z1OO/6Zkp7qvousxAGEIX648g0fgeOgfPIoKAsXbq9Xdb6Yr26hYezgD5
	aNJiuC/sJrsspeubQt73EswU022u6MKArlHNxhZceLB+WLEhOEQXr3ceI6T78XVr6sk9mbSgLbK
	bzWQQtJs0Whoqjw6OoUTP/qZqNsFbvR5RKk4zMzOtyRGeuJUOL5bu2UhmbTned7R5x7P97cUWC0
	2gX57oLGSu8YXSEj+E1cWnCvGPfzUR6iKkl2LQAT7sxR5uWlYf+JNKf5TymqfxiNuKOr2Z5Fo9E
	nliSdCvxZVbESpqD4MS/bW+5e5Y=
X-Google-Smtp-Source: AGHT+IG8syti+yUH9KMAV4gl0fZ6aSPAfqkjK2G+9Pu2agDv4XCz3CIBPgGk+tD7029TOWlX0vLivA==
X-Received: by 2002:ac8:5e4e:0:b0:476:80ce:a614 with SMTP id d75a77b69052e-4796cbb6131mr12911801cf.19.1744248071267;
        Wed, 09 Apr 2025 18:21:11 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796ed9ccd0sm1065881cf.57.2025.04.09.18.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 18:21:10 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:20:33 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>
Cc: Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <sl752im2sn5sz6yzc23ctprh3rwryuhgtggsaauxixn3b267ag@6sf5fahu6b5i>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
 <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_182112_691958_70CA98FB 
X-CRM114-Status: GOOD (  25.19  )
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

On Wed, Apr 09, 2025 at 08:10:53PM -0500, Alex Elder wrote:
> On 4/9/25 7:57 PM, Inochi Amaoto wrote:
> > > > > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > > > > > new file mode 100644
> > > > > > index 000000000000..4c4df845b3cb
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/clk/spacemit/Kconfig
> > > > > > @@ -0,0 +1,18 @@
> > > > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > > > +
> > > > > > +config SPACEMIT_CCU
> > > > > > +	tristate "Clock support for SpacemiT SoCs"
> > > > > I don't know the answer to this, but...  Should this be a Boolean
> > > > > rather than tristate?  Can a SpacemiT K1 SoC function without the
> > > > > clock driver built in to the kernel?
> > > > > 
> > > > I agree to make it a Boolean, we've already made pinctrl driver Boolean
> > > > and pinctrl depend on clk, besides, the SoC is unlikely functional
> > > > without clock built in as it's such critical..
> > > > 
> > > I disagree. The kernel is only for spacemit only, and the pinctrl
> > Sorry for a mistake, this first "only" should be "not".
> 
> This is a general problem.  You can't make a bootable
> SpacemiT kernel unless you define this as built-in (at
> least, that's what Yixun is saying). 

Why not putting the module in the initramfs? I have tested
this in quite a lot of boards (Allwinner, rockchip, sophgo,
starfive and etc.), all of them work well.

> But we'd really rather *only* build it in to the kernel
> for SpacemiT builds. You clearly want to minimize what
> must be built in, but what if this is indeed required?
> What goes in defconfig?
> 

As defconfig is more like for a minimum example system. It
is OK to put a y in the defconfig. But for a custom system,
you do give a choice for the builder to remove your module
in non spacemit system.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
