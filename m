Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF780C369A6
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 00:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CHkqnifQDRZhWj814FoPj6OYFXjKuyoal2oh2rtFuEA=; b=QKMYSHH0gtxGL3
	KEZWXJ9rekSmO/ih8Kwho/dFUp8PobD88moexjRF1oMkkx8G+m8gKqFNmyMMjeKiZjD53jzrHzFxg
	38D84KwdkcHLn3YQVrQhEe33a7o0Qpe1BbHKKCgH+gAJfrhHMzJswdOjmrtaABp9WwVh8QJYBLdrR
	ajmOt7eS+2cI/tWwEnmC1gLs8vOteFIvyqLu7q1AGkOuWyJkPKkcDQ2MODk+7QoJkR2vmpG0dhzS9
	WqQctlzStzv3RnBA1gmFDzgeTVmvePy5/rEGeSao9Ou8t9575lYfeb5fSueKrOS2S1x33RecdmO1L
	i7W8l4Kp4abu1dbEozNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gCc-00000008rXy-2Bia;
	Thu, 10 Apr 2025 00:55:34 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gCY-00000008rXI-4A4I
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 00:55:32 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7c5e1b40f68so33007785a.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 17:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246529; x=1744851329; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xwkifruprja03lOjmLEiYD8iUCfTbujfomvweg3q04s=;
        b=nnDArjqUn/0FD9EWHol2ffmeTB8MIq8Z3w0a7G9Emju9RReixj2nnPjno1Nzti8S68
         LBrnMXizWNkzaGv3TkJ6v5BvWPIgmHc/vsZ5rf3UzKUqdgUPtcCK3T+5sw2a4WvSWGRN
         GpAelh8qOVDAW7FHQdk8AoMhy6XHExyXwijf1KUuQzjQAcFZOfCfqvKdtxXJMC608Q1i
         wY/8XEOrMc47UQjw3tnRLxNf44sX1y2qWOwm2Pbq2PEwTUUtG21hBvobBEJEGhcmRhBa
         ylDTu+89SU4Z3UWjf/UcucYKjTsMJg3PgyYenhoV2iLSVTeFm8YaAdZ6Ktwk0Yk71UNG
         Xzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246529; x=1744851329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwkifruprja03lOjmLEiYD8iUCfTbujfomvweg3q04s=;
        b=I9L/O5ena7IBe1A3SO+KUev4za7kyJ5Fr++5djvNzJF8rS9TY2OeRsoqyHuqSsAhkz
         AJ1I0lkLR0nAQ0gA357YYDLbJevv73NP6iHE85jwivrNK0DDvwGjsdQXPfGiL3/5fIrm
         APwUeUrNmYTU1ExbOYYzVIzTy90hFsfjqNs8pfNbx0vy7AL/c/Vd/plIh9eTieDazzf6
         pzN5UZ9eYVycM3Ffd4oKRZY9GWw2JMcZ8FEpzpfoebtFyOLbPa5pi9iHvZjxiKAMV7db
         TsXaaOyyFwtEFnNKyCX372yWLmfL9pi1EYay10FDMGm5FCn3aQedQdgC+iJ4Bd1drOry
         ujSA==
X-Forwarded-Encrypted: i=1; AJvYcCXuFCC5WkTIXDi6pFR54h3arlGeEIEOyVUj7rzKybCCjVCi6f5nBoC4mwbB4Mer2DH1RECJiCTx5mo6IQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQqviNxk3Grevt8yEwCTIzr4IPzPHxmMCdaAVXBGeJkxUNZAgk
	xcBZXzItx3M8dp0ekzp+2/3rrZkOj/917P3O9Y5sBMx/p9Cc+y2L
X-Gm-Gg: ASbGncvp6TffPyz44T77ZJjZ60FC/+lNy7PCTyr2dM3c+z2mpLMyR6NFKIiSlCwTAMT
	oaubx1OZROFp2NqfbGEh2UwLzPhDAXX0JHQhWqpfiqMJPKn+EMDVM0+gMgb94YxCfLo1KUr7sj0
	bxa+evIBgbr57eYeBNffGAvyhz4oD9iM3K+ok+LjXzX0Zsfgih+r1G5JOcMKJv4PvHkkhp0jpp7
	KYNRd6U6Ex8PDnz859kmMJoVIQi1/OXVIALIcUCq3vIDTH/7WCWAPpGYHGocfVs/O25j8feFUb1
	jRUJWqj1egif0N9W
X-Google-Smtp-Source: AGHT+IE60U0O3t2g/z0t8CojVDZ5ZM/gRTXCJPIa/XlR1ySwWZ4MEZOecT280WyJJ9QmFd0KPggOIQ==
X-Received: by 2002:a05:620a:4141:b0:7c5:42c8:ac82 with SMTP id af79cd13be357-7c7a8164bf9mr74285385a.23.1744246529432;
        Wed, 09 Apr 2025 17:55:29 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8942ec7sm9342585a.18.2025.04.09.17.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:55:29 -0700 (PDT)
Date: Thu, 10 Apr 2025 08:54:51 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>
Cc: Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250410003756-GYA19359@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_175531_037114_28A35CC8 
X-CRM114-Status: GOOD (  27.58  )
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

On Thu, Apr 10, 2025 at 12:37:56AM +0000, Yixun Lan wrote:
> On 14:37 Tue 08 Apr     , Alex Elder wrote:
> > On 4/1/25 12:24 PM, Haylen Chu wrote:
> > > The clock tree of K1 SoC contains three main types of clock hardware
> > > (PLL/DDN/MIX) and has control registers split into several multifunction
> > > devices: APBS (PLLs), MPMU, APBC and APMU.
> > > 
> > > All register operations are done through regmap to ensure atomiciy
> > > between concurrent operations of clock driver and reset,
> > > power-domain driver that will be introduced in the future.
> > > 
> > > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > 
> > I have a few more comments here but I think this is getting very
> > close to ready.  You addressed pretty much everything I mentioned.
> > 
> > > ---
> > >   drivers/clk/Kconfig               |    1 +
> > >   drivers/clk/Makefile              |    1 +
> > >   drivers/clk/spacemit/Kconfig      |   18 +
> > >   drivers/clk/spacemit/Makefile     |    5 +
> > >   drivers/clk/spacemit/apbc_clks    |  100 +++
> > >   drivers/clk/spacemit/ccu-k1.c     | 1316 +++++++++++++++++++++++++++++
> > >   drivers/clk/spacemit/ccu_common.h |   48 ++
> > >   drivers/clk/spacemit/ccu_ddn.c    |   83 ++
> > >   drivers/clk/spacemit/ccu_ddn.h    |   47 ++
> > >   drivers/clk/spacemit/ccu_mix.c    |  268 ++++++
> > >   drivers/clk/spacemit/ccu_mix.h    |  218 +++++
> > >   drivers/clk/spacemit/ccu_pll.c    |  157 ++++
> > >   drivers/clk/spacemit/ccu_pll.h    |   86 ++
> > >   13 files changed, 2348 insertions(+)
> > >   create mode 100644 drivers/clk/spacemit/Kconfig
> > >   create mode 100644 drivers/clk/spacemit/Makefile
> > >   create mode 100644 drivers/clk/spacemit/apbc_clks
> > >   create mode 100644 drivers/clk/spacemit/ccu-k1.c
> > >   create mode 100644 drivers/clk/spacemit/ccu_common.h
> > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> > >   create mode 100644 drivers/clk/spacemit/ccu_mix.c
> > >   create mode 100644 drivers/clk/spacemit/ccu_mix.h
> > >   create mode 100644 drivers/clk/spacemit/ccu_pll.c
> > >   create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > > 
> > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > > index 713573b6c86c..19c1ed280fd7 100644
> > > --- a/drivers/clk/Kconfig
> > > +++ b/drivers/clk/Kconfig
> > > @@ -517,6 +517,7 @@ source "drivers/clk/samsung/Kconfig"
> > >   source "drivers/clk/sifive/Kconfig"
> > >   source "drivers/clk/socfpga/Kconfig"
> > >   source "drivers/clk/sophgo/Kconfig"
> > > +source "drivers/clk/spacemit/Kconfig"
> > >   source "drivers/clk/sprd/Kconfig"
> > >   source "drivers/clk/starfive/Kconfig"
> > >   source "drivers/clk/sunxi/Kconfig"
> > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > index bf4bd45adc3a..42867cd37c33 100644
> > > --- a/drivers/clk/Makefile
> > > +++ b/drivers/clk/Makefile
> > > @@ -145,6 +145,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> > >   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> > >   obj-y					+= socfpga/
> > >   obj-y					+= sophgo/
> > > +obj-y					+= spacemit/
> > >   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
> > >   obj-y					+= sprd/
> > >   obj-$(CONFIG_ARCH_STI)			+= st/
> > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > > new file mode 100644
> > > index 000000000000..4c4df845b3cb
> > > --- /dev/null
> > > +++ b/drivers/clk/spacemit/Kconfig
> > > @@ -0,0 +1,18 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +
> > > +config SPACEMIT_CCU
> > > +	tristate "Clock support for SpacemiT SoCs"
> > 
> > I don't know the answer to this, but...  Should this be a Boolean
> > rather than tristate?  Can a SpacemiT K1 SoC function without the
> > clock driver built in to the kernel?
> > 
> I agree to make it a Boolean, we've already made pinctrl driver Boolean
> and pinctrl depend on clk, besides, the SoC is unlikely functional
> without clock built in as it's such critical..
> 

I disagree. The kernel is only for spacemit only, and the pinctrl
should also be a module. It is the builder's right to decide whether
the driver is builtin or a module. In this view, you should always
allow the driver to be built as a module if possible.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
