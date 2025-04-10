Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D38C369A2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 01:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jXCrdcF/OdzF/IfBb8yEWJJGLjnB47EhQ5FpNLPG1ys=; b=3U4tTx+/61KnCb
	nQUDuv+ZxYg8pA5q97fXD5DHDwXiNA4zNctx8+mj4is/yFHGxcn5RjPTxa6CxMRNXQod7JfV4ihez
	243xHf0ja3THw082iY07+Z4pRfpce6TSs5klSIZqwG5uTaDg+GGQo8x6LnxkFVXRyRI/RRB3edfqZ
	8KBDAV0Uh80xHfwucXAuCjqtcsxnH4boRrTKGItJs8urcLxLzbOh4kseRh/0IAR0hvk2mMk2URSVI
	LkEyO4DU4nm7Wj0AFR+7xYAHTXqOtOPfTqJa+qFmik8wJBL+mjpXl2VOUE6wjN2ScC4CmkIlUw1am
	CbykKM1tFkUuhJgZ3IXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gy6-00000008y7C-35CC;
	Thu, 10 Apr 2025 01:44:38 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gpp-00000008x8r-1thF
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 01:36:06 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7c592764e54so42777485a.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 18:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744248964; x=1744853764; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mn77HHPqYcQPNS+D6QKMYch27BNofJCne2UJ+gPfHFk=;
        b=NFeqxuhwisFUY3DWi6gOnXUds4krQS3Q2NyciOIcGUGbm2FI2xueOq61pO0Vt4zk3+
         TH7t4iN15qDXbX75XgBbiLFOAakcy1FMJ6oO0PTDKzZOsgJWg/L/tzyHnha86+2YcBse
         W1wkulCBpBZTCNDU3aTeEc9Gxjw74dvmnRqDUwQft7frMD/+C7nHfZ3ZTlwk0ib65Vl1
         Y9neYtEJR4NHSkPwiV92NUH1LYqecCfoz1itgGsaTX6G680o8j1yOF+IkPbKqr1XkUtm
         JlZDvXJBZiJ0VIgmfeI+ZcbdXuKowpStjcEh7NDB93+uDrnnjbSzpfIyuwlCjcnMoBEV
         AQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744248964; x=1744853764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mn77HHPqYcQPNS+D6QKMYch27BNofJCne2UJ+gPfHFk=;
        b=vDKSjgum7NLGMcpCrJWXzYgbIYT9E+9G4zPHVaBPPgnOX/xrHMU70YrDx9yw5onIrC
         EuJm1+jgUS8Cq7bnf4fBs/L68Y22uNR2VlHGcVPTbrO7brAzKdqVX6f6Ng/WwWYNsIs9
         rh7fB6a1wIBLDqGXfteeI+dkIpuv4BSwzGTvYHZyT2eKQE4K5/oO3PVdiWKk9AGueWCI
         Hy4aE2w8I1P+YcW4mH46+5oXL0RjBx+Rnx2aY5qPEUS8hgAOqBUVve3S4q26TVxWKpJj
         hPDkUMmNW9gJXkR1V/zepTj2I/Dh122lBuFSS/AZbhs706d2xf6uJF0ZoGMEVrb5oOI9
         9wVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOCF3vRPBHfYuU2/WUg91IvKNIQRahwxupmERsRNGBYwPEgTowt+QmterHY6H+iRQX7j9HHH/+zZtiVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YztpgjAZCdQ8YnSFNV+A8MPAzz8+3MBZEFOT3sXPwwqotHCekLJ
	4ALv8x53/1LSrBleMAqAkI+2hDgsjFO6mGorz69NpD1zXkHB/uuS
X-Gm-Gg: ASbGncvgMNK9ZDzRr7ZxVDS0W+I4DOiPdolmYB94cgWrvnH9LnIaEBfqwtsNfU4koGp
	pyE/A7o7x1+HCArOwFH/3KYT1nWZzZJHmrI3gyzX1s8JagnmkW2Smm8fRN+PsdN50yo7UgivR7r
	MHcmQdKRqbDHrulnuyt32SwsA+uaTvTjA0I+ffQP82f/11mrW0i8Fw5DVIKrRxO22qnyfh34K9G
	cvaXi6+uDWvDz/pEfgLmHc9LjQVx37Rb1Zcs8R/MrM60xFoFTXrjzpTDL9RdX4siJDpeUY5aZ3s
	YQurzSmWxfIKSdBM7yCYAv9UiPY=
X-Google-Smtp-Source: AGHT+IEcWmffQfvCuChtXQXpnroPXYRrhJX1q2n+tT6bZYpbzl+MegNQoZB3XFLgQsUM9dwmK7XvZA==
X-Received: by 2002:a05:620a:3941:b0:7c5:5a51:d2d1 with SMTP id af79cd13be357-7c7a81c7994mr96263385a.55.1744248964263;
        Wed, 09 Apr 2025 18:36:04 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8969e5bsm13726985a.53.2025.04.09.18.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 18:36:03 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:35:25 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
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
Message-ID: <mnkjxqswewyr7agadnv7rprckqafpryotmmi64ckmocwily2yy@mzjwc2qp2wdd>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
 <20250410011611-GYC19359@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250410011611-GYC19359@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_183605_494682_39A3A513 
X-CRM114-Status: GOOD (  35.07  )
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

On Thu, Apr 10, 2025 at 01:16:11AM +0000, Yixun Lan wrote:
> Hi Inochi,
> 
> On 08:57 Thu 10 Apr     , Inochi Amaoto wrote:
> > On Thu, Apr 10, 2025 at 08:54:51AM +0800, Inochi Amaoto wrote:
> > > On Thu, Apr 10, 2025 at 12:37:56AM +0000, Yixun Lan wrote:
> > > > On 14:37 Tue 08 Apr     , Alex Elder wrote:
> > > > > On 4/1/25 12:24 PM, Haylen Chu wrote:
> > > > > > The clock tree of K1 SoC contains three main types of clock hardware
> > > > > > (PLL/DDN/MIX) and has control registers split into several multifunction
> > > > > > devices: APBS (PLLs), MPMU, APBC and APMU.
> > > > > > 
> > > > > > All register operations are done through regmap to ensure atomiciy
> > > > > > between concurrent operations of clock driver and reset,
> > > > > > power-domain driver that will be introduced in the future.
> > > > > > 
> > > > > > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > > > > 
> > > > > I have a few more comments here but I think this is getting very
> > > > > close to ready.  You addressed pretty much everything I mentioned.
> > > > > 
> > > > > > ---
> > > > > >   drivers/clk/Kconfig               |    1 +
> > > > > >   drivers/clk/Makefile              |    1 +
> > > > > >   drivers/clk/spacemit/Kconfig      |   18 +
> > > > > >   drivers/clk/spacemit/Makefile     |    5 +
> > > > > >   drivers/clk/spacemit/apbc_clks    |  100 +++
> > > > > >   drivers/clk/spacemit/ccu-k1.c     | 1316 +++++++++++++++++++++++++++++
> > > > > >   drivers/clk/spacemit/ccu_common.h |   48 ++
> > > > > >   drivers/clk/spacemit/ccu_ddn.c    |   83 ++
> > > > > >   drivers/clk/spacemit/ccu_ddn.h    |   47 ++
> > > > > >   drivers/clk/spacemit/ccu_mix.c    |  268 ++++++
> > > > > >   drivers/clk/spacemit/ccu_mix.h    |  218 +++++
> > > > > >   drivers/clk/spacemit/ccu_pll.c    |  157 ++++
> > > > > >   drivers/clk/spacemit/ccu_pll.h    |   86 ++
> > > > > >   13 files changed, 2348 insertions(+)
> > > > > >   create mode 100644 drivers/clk/spacemit/Kconfig
> > > > > >   create mode 100644 drivers/clk/spacemit/Makefile
> > > > > >   create mode 100644 drivers/clk/spacemit/apbc_clks
> > > > > >   create mode 100644 drivers/clk/spacemit/ccu-k1.c
> > > > > >   create mode 100644 drivers/clk/spacemit/ccu_common.h
> > > > > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> > > > > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> > > > > >   create mode 100644 drivers/clk/spacemit/ccu_mix.c
> > > > > >   create mode 100644 drivers/clk/spacemit/ccu_mix.h
> > > > > >   create mode 100644 drivers/clk/spacemit/ccu_pll.c
> > > > > >   create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > > > > > 
> > > > > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > > > > > index 713573b6c86c..19c1ed280fd7 100644
> > > > > > --- a/drivers/clk/Kconfig
> > > > > > +++ b/drivers/clk/Kconfig
> > > > > > @@ -517,6 +517,7 @@ source "drivers/clk/samsung/Kconfig"
> > > > > >   source "drivers/clk/sifive/Kconfig"
> > > > > >   source "drivers/clk/socfpga/Kconfig"
> > > > > >   source "drivers/clk/sophgo/Kconfig"
> > > > > > +source "drivers/clk/spacemit/Kconfig"
> > > > > >   source "drivers/clk/sprd/Kconfig"
> > > > > >   source "drivers/clk/starfive/Kconfig"
> > > > > >   source "drivers/clk/sunxi/Kconfig"
> > > > > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > > > > index bf4bd45adc3a..42867cd37c33 100644
> > > > > > --- a/drivers/clk/Makefile
> > > > > > +++ b/drivers/clk/Makefile
> > > > > > @@ -145,6 +145,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> > > > > >   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> > > > > >   obj-y					+= socfpga/
> > > > > >   obj-y					+= sophgo/
> > > > > > +obj-y					+= spacemit/
> > > > > >   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
> > > > > >   obj-y					+= sprd/
> > > > > >   obj-$(CONFIG_ARCH_STI)			+= st/
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
> > > > > 
> > > > > I don't know the answer to this, but...  Should this be a Boolean
> > > > > rather than tristate?  Can a SpacemiT K1 SoC function without the
> > > > > clock driver built in to the kernel?
> > > > > 
> > > > I agree to make it a Boolean, we've already made pinctrl driver Boolean
> > > > and pinctrl depend on clk, besides, the SoC is unlikely functional
> > > > without clock built in as it's such critical..
> > > > 
> > > 
> > > I disagree. The kernel is only for spacemit only, and the pinctrl
> > 
> > Sorry for a mistake, this first "only" should be "not".
> > 
> > > should also be a module. It is the builder's right to decide whether
> > > the driver is builtin or a module. In this view, you should always
> > > allow the driver to be built as a module if possible.
> > > 
> No, we've already made pinctrl as Boolean (still depend on ARCH_SPACEMIT)
> if people don't want this feature, he/she can disable CONFIG_ARCH_SPACEMIT
> 
> https://github.com/torvalds/linux/blob/master/drivers/pinctrl/spacemit/Kconfig#L7

I have a question for this. Does the minimum system can boot without
pinctrl (I mean purge the pinctrl node in dts and use uart only)? If
so, why you treat it a must? In some cases, probe fail without pinctrl
driver is a expected behavior. And if the pin config can be optional,
it will be better to fix the driver and the pinctrl framework, but
not to just convert the module as built-in. It is a waste of space.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
