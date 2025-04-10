Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413EEC369A2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 00:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pm9O/2nEkEgJf6hfF4SjzmO1/LJutNBIfPRnKoTqnPg=; b=renjEmzr6w4kjd
	NJLmaBCEu3qMH4y6Oa5WQhXl857p0DetDd2bH/9SwvSYwUPENxx5RERsWgHGYFeowVcquTHpYKzJb
	333GDlvybIpusY9thGnJxY75dlwVawlmTOnXx4tLzwvoPZ/Y+JhgWsTCjIdkpK8p9PyRSHAIuA8Ha
	DMfXkluXjOV9Y6/njRVr02LImmbDbL0p6QZVyjnF7pvI2yOmMy2A2NFEOXtdR+BFATjgQy8lAZdBy
	9Rk4SDqoCPCh8RbNm2+9hTGnAj2P1mJzAoY0SUa5iE8L0Rh5Ch4iYt4+EeswxTWk7/Jb7TV7g3L3u
	e5xizlhkxWq41njsNh8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gF2-00000008rwO-3WzM;
	Thu, 10 Apr 2025 00:58:04 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gEx-00000008rvQ-3kAK
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 00:58:03 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c7913bab2cso30702285a.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 17:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246678; x=1744851478; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I9iTZbextS/6RO2qTODUHsN3tyzaIcsCAslxYIXkL/0=;
        b=YxSDerXyHxwSwS9ySBTvo6NAlO8QhsScH3w1P3cTnMkif9Aiz36hFsSQjgyXs1XgiG
         D3PxOZxQCrWD5ho7mWwoxLc79HYMSiNBxrVAnArnGdFOp/YAgInPyrDSoxpQXp5Hyilb
         5kXcrgG66FT2v5jArIMllrqobHusvEU07Kx2TgePKsTqyuz4thDZ8dyCFJiK0D6yT+HR
         290EQRBKR4lEqCJuGu0QHA0S7PI3pVMD5KCdT/an9SQorWpYI2sI5x9NdM/ldqHUdRFg
         WZKJfkF+2CuXRq4Q8xPl71oujQq00TDNIZWpXqaVfBx0R5eX98NmMc00NfGLkYXBaJfb
         pQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246678; x=1744851478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9iTZbextS/6RO2qTODUHsN3tyzaIcsCAslxYIXkL/0=;
        b=jcHmTgALKETB/GFiWRQ6SXJGFBDV/V5SXkJ7H1IruVrAhWV9+Fd0hAW6wlJKK8DltT
         2ptukiCXpLTmrFhY6Lk1+U63UwafgKKsZU57pd3ETv+GfJl7spa7Xfm80GBWISyKQR7L
         MIm47n6Xdo9eAx88fjx60GaClT3GcoX4Mv+wcisOjsqgJvEzpVAysRW9EuNPGVGfncfw
         Bti71qrfJnkhFSALfRSa658H+GPt8vvHq3VU1WmWk3Q9RWepKvnyjb6QeKcmzF2TuJoG
         SlZrPIodMA8x9Z66QB3OsyeE0eH33JwcuPbcOkTUQ9xwniLO9pVy76NHAxqt5UI4aXgz
         FEHw==
X-Forwarded-Encrypted: i=1; AJvYcCWIpqm6jfG0qF2nE3hW11lVawecR7MbOu7Cb1kgVInzLDfIpAQ18JRhSiKE+iIiKCD3VbpZDhcZR10fNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSYOUwIzAqRPjvEVHpCqV1abo3UlrmVXC+AsskyLmH5kDhY3tl
	2x9F1mRucf/FIe/sRuaWbVHei13FgDvAYQOuLqT1IwuFTNw4nKe5
X-Gm-Gg: ASbGncsx2c6OcWCaISOGOHrZRJVy/1b/CXwWFuJFIb5wjKBhRRjqJwvcqFzCLjHnqJR
	U4bMw3qYeK41k72XQ7wqS3ocFkN4TP0IjSFr7Lg3BygVGrW0werV88GQX2geUn8q9xjwAe00JG+
	mGI+42NayZHBJbztARxPLqGBXrsrfZCipiesfUc1I+KOfTaK/BdxQ5Wz+9fIztvsNO6MfGHjDB7
	JwojypKckznRc9Um2Kg/jOtFTlYyuEcTbpzzIlwdM8wLZ9lbrALMoAxcnlH9qgrjSJRiw9zKrEf
	xZO5eP05rAYaCT73
X-Google-Smtp-Source: AGHT+IHrGSeffXI0VYRSl9GnvlywdVwYqlOpNJ0nBajlzAmynsAYh/0Dr6x3Qk/EjEDEI+gdM/HEVQ==
X-Received: by 2002:a05:620a:430e:b0:7c5:65ab:4ff2 with SMTP id af79cd13be357-7c7a76c3ae3mr127180985a.46.1744246678606;
        Wed, 09 Apr 2025 17:57:58 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a89f9938sm8543585a.69.2025.04.09.17.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:57:58 -0700 (PDT)
Date: Thu, 10 Apr 2025 08:57:20 +0800
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
Message-ID: <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_175759_944869_C309EA95 
X-CRM114-Status: GOOD (  29.82  )
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

On Thu, Apr 10, 2025 at 08:54:51AM +0800, Inochi Amaoto wrote:
> On Thu, Apr 10, 2025 at 12:37:56AM +0000, Yixun Lan wrote:
> > On 14:37 Tue 08 Apr     , Alex Elder wrote:
> > > On 4/1/25 12:24 PM, Haylen Chu wrote:
> > > > The clock tree of K1 SoC contains three main types of clock hardware
> > > > (PLL/DDN/MIX) and has control registers split into several multifunction
> > > > devices: APBS (PLLs), MPMU, APBC and APMU.
> > > > 
> > > > All register operations are done through regmap to ensure atomiciy
> > > > between concurrent operations of clock driver and reset,
> > > > power-domain driver that will be introduced in the future.
> > > > 
> > > > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > > 
> > > I have a few more comments here but I think this is getting very
> > > close to ready.  You addressed pretty much everything I mentioned.
> > > 
> > > > ---
> > > >   drivers/clk/Kconfig               |    1 +
> > > >   drivers/clk/Makefile              |    1 +
> > > >   drivers/clk/spacemit/Kconfig      |   18 +
> > > >   drivers/clk/spacemit/Makefile     |    5 +
> > > >   drivers/clk/spacemit/apbc_clks    |  100 +++
> > > >   drivers/clk/spacemit/ccu-k1.c     | 1316 +++++++++++++++++++++++++++++
> > > >   drivers/clk/spacemit/ccu_common.h |   48 ++
> > > >   drivers/clk/spacemit/ccu_ddn.c    |   83 ++
> > > >   drivers/clk/spacemit/ccu_ddn.h    |   47 ++
> > > >   drivers/clk/spacemit/ccu_mix.c    |  268 ++++++
> > > >   drivers/clk/spacemit/ccu_mix.h    |  218 +++++
> > > >   drivers/clk/spacemit/ccu_pll.c    |  157 ++++
> > > >   drivers/clk/spacemit/ccu_pll.h    |   86 ++
> > > >   13 files changed, 2348 insertions(+)
> > > >   create mode 100644 drivers/clk/spacemit/Kconfig
> > > >   create mode 100644 drivers/clk/spacemit/Makefile
> > > >   create mode 100644 drivers/clk/spacemit/apbc_clks
> > > >   create mode 100644 drivers/clk/spacemit/ccu-k1.c
> > > >   create mode 100644 drivers/clk/spacemit/ccu_common.h
> > > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> > > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> > > >   create mode 100644 drivers/clk/spacemit/ccu_mix.c
> > > >   create mode 100644 drivers/clk/spacemit/ccu_mix.h
> > > >   create mode 100644 drivers/clk/spacemit/ccu_pll.c
> > > >   create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > > > 
> > > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > > > index 713573b6c86c..19c1ed280fd7 100644
> > > > --- a/drivers/clk/Kconfig
> > > > +++ b/drivers/clk/Kconfig
> > > > @@ -517,6 +517,7 @@ source "drivers/clk/samsung/Kconfig"
> > > >   source "drivers/clk/sifive/Kconfig"
> > > >   source "drivers/clk/socfpga/Kconfig"
> > > >   source "drivers/clk/sophgo/Kconfig"
> > > > +source "drivers/clk/spacemit/Kconfig"
> > > >   source "drivers/clk/sprd/Kconfig"
> > > >   source "drivers/clk/starfive/Kconfig"
> > > >   source "drivers/clk/sunxi/Kconfig"
> > > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > > index bf4bd45adc3a..42867cd37c33 100644
> > > > --- a/drivers/clk/Makefile
> > > > +++ b/drivers/clk/Makefile
> > > > @@ -145,6 +145,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> > > >   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> > > >   obj-y					+= socfpga/
> > > >   obj-y					+= sophgo/
> > > > +obj-y					+= spacemit/
> > > >   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
> > > >   obj-y					+= sprd/
> > > >   obj-$(CONFIG_ARCH_STI)			+= st/
> > > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > > > new file mode 100644
> > > > index 000000000000..4c4df845b3cb
> > > > --- /dev/null
> > > > +++ b/drivers/clk/spacemit/Kconfig
> > > > @@ -0,0 +1,18 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +
> > > > +config SPACEMIT_CCU
> > > > +	tristate "Clock support for SpacemiT SoCs"
> > > 
> > > I don't know the answer to this, but...  Should this be a Boolean
> > > rather than tristate?  Can a SpacemiT K1 SoC function without the
> > > clock driver built in to the kernel?
> > > 
> > I agree to make it a Boolean, we've already made pinctrl driver Boolean
> > and pinctrl depend on clk, besides, the SoC is unlikely functional
> > without clock built in as it's such critical..
> > 
> 
> I disagree. The kernel is only for spacemit only, and the pinctrl

Sorry for a mistake, this first "only" should be "not".

> should also be a module. It is the builder's right to decide whether
> the driver is builtin or a module. In this view, you should always
> allow the driver to be built as a module if possible.
> 
> Regards,
> Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
