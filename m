Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1999EC282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 05:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tVYxirjXQSg4Iwn+GveRmOVf9k+Lu+m7pThxXuB7fSc=; b=bwrIxp4PuhQ6YR
	PYEdHjp+Fb2ccoVqLq/YNpjpvu31jQ5K4HkWsSBjRqZIM+UX1AyJ0dbZRLgb6Dt+v1vQr+YsDbpp6
	zjMOo0zF/boEIJNd18vj1WmISU5DBiTvSgSztaDgBHE48DNMLnAomCKa5nJ/NZ4u7Nb977L4L9MZl
	kOWgi+EjgPQbhmFQc4P16rxDab8gcuwIbV30gpxsVWRSZG4RfodWkXeA+p+J7JUgNqdITiBB70rsp
	8KbnRWemTWte9C17VW2O9L+KCUimEvX1nW3v67MIojTwOfQI/9tEmMcAzU7rpw0RODVNSoUKAdQ5B
	t67uFmyCVUIykCviZSRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuPkK-00000004kPH-1mbL;
	Tue, 18 Mar 2025 05:44:12 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuPkH-00000004kOK-3Lk1
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 05:44:11 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6e89a2501a0so51107086d6.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 22:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742276648; x=1742881448; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rwFdLf1c7kbfx/fdwSi1PJ2VuLIMc4Zv90ArV+gVLqE=;
        b=UICgoSxBZnBa7gwvfTKAgxl2rcv0rp4fYQ4Qkx7kSQobgh1cqMOTEUuZQQQyvG6zol
         C1lOngsdK4S/XQN3yhZau8BpEozeWkxRege4LkPtlJm+IaXzDKiixJtcmG2bC89ZI/Ky
         oJh0bbv1BjkRW4UXt5BLfBYKRE8zvIWjGx442kEpd4RBnbDaOmKxqtyw/N21Oareq6gF
         I3UICY71pAhimrCUeOjc7Emd+g0hwZ+b6bYYLKtOqGomJqSdIZjQGyBGwKeXCO1Ws02B
         jNv80Yfjf8rJZnZ3aVXqKo3S9UAajoyXrO/co56HosKXsPlwmDI00zMuAtNBf4rR0m2C
         pwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742276648; x=1742881448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwFdLf1c7kbfx/fdwSi1PJ2VuLIMc4Zv90ArV+gVLqE=;
        b=ZsXqaBoGLTDKejNH4MklCeOIw1xiyzydkEmFz2wrFtulvN3JpVkHomEOSCNiNtxkQ3
         sqY6XxOIpQUCPFFOvfBKjmgXNJ0w+M80R3R6ZUWGNQIrqZXdrMsxSLrghcx5n3bau6Cx
         g7WthTwXkjRdp7SufMB61kjiKEA0PNEO719Dj16n+NnVub+CQuUEmv0gmTfk8w3YktH5
         Xld9UX+zrUY5kXFeEhptPUdA1AnkByrrssIqM0ZxxzyPiN5K03yn4HT5vwhHy1PYrsMY
         dDCNsbu+idswH2NwKJavMnYxWQeu2ycMVkOPFBmdfnUWuNp1jo/tKi1YnRtVnx3NTOJZ
         Bpng==
X-Forwarded-Encrypted: i=1; AJvYcCUFrsQKmAGFh4owPlm7BSCUa/vSAyQxBUt7px18GpGG0fulS1ICHBJNek+Yl4DLkB9CQSeO4TLuTGFHyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlPObzyZAK0W4mAtCDvx0XxtM6YmqQExIpUxCdSaHSFX003aiV
	wPOT2n2laiyRK/FZ7jWFlpR23Ing6NB8TZmg7caQ5cJMMW5W4wo6
X-Gm-Gg: ASbGncv4CdU2q6N6HCnMff6WsRn7FRMD7yaGAA+T8CL1GnqOKBv0kK7aXJ1k4v5dWg9
	RtXW1KcA7gUxnxBgpclKcRKTxLXUQRApI5kj8994sR61LON9NOvokqg8v2nJ9wNJwdKXeQtyQvS
	kQlrkMxdi/gSBtHZuhsKCPHCHINPkR81VnRiXAQX7fW1qqeW2rqpXgwrDSKwqMMKQk2Tq4hUh/8
	Xk/2Fczn21ecIFe36YeKHWLX7dihYD0Fl2qYf3koK52Eqh9D9gld2BdaVuCszcvqFFAfZcErNKQ
	JLUXxP2NpJ1eSj0BaHMDCSoxB7EcyVI=
X-Google-Smtp-Source: AGHT+IGuMQhkzUcBs7MzT4DYgtuD7a9Q+hOatvcVV/vkg2Yr9NtbNUqUpAe6FnTc1MisRqrMXkfHwA==
X-Received: by 2002:ad4:5d65:0:b0:6e8:e8dd:30d1 with SMTP id 6a1803df08f44-6eaeaa5fa9amr264171126d6.22.1742276648364;
        Mon, 17 Mar 2025 22:44:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6eade231bcbsm63413776d6.36.2025.03.17.22.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 22:44:07 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:43:52 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Haylen Chu <heylenay@4d2.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v5 3/5] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <xwo2jjqy634z4rimgyrbjmxlgzxzauxmqzl57qr5oasph74qwj@7we45fnhwfzh>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-5-heylenay@4d2.org>
 <20250318053736-GYA2516@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250318053736-GYA2516@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_224409_837848_5395B382 
X-CRM114-Status: GOOD (  19.99  )
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

On Tue, Mar 18, 2025 at 05:37:36AM +0000, Yixun Lan wrote:
> Hi Haylen Chu:
> 
> On 17:57 Thu 06 Mar     , Haylen Chu wrote:
> > The clock tree of K1 SoC contains three main types of clock hardware
> > (PLL/DDN/MIX) and has control registers split into several multifunction
> > devices: APBS (PLLs), MPMU, APBC and APMU.
> > 
> > All register operations are done through regmap to ensure atomiciy
> > between concurrent operations of clock driver and reset,
> > power-domain driver that will be introduced in the future.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > ---
> >  drivers/clk/Kconfig               |    1 +
> >  drivers/clk/Makefile              |    1 +
> >  drivers/clk/spacemit/Kconfig      |   20 +
> >  drivers/clk/spacemit/Makefile     |    5 +
> >  drivers/clk/spacemit/ccu-k1.c     | 1714 +++++++++++++++++++++++++++++
> >  drivers/clk/spacemit/ccu_common.h |   47 +
> >  drivers/clk/spacemit/ccu_ddn.c    |   80 ++
> >  drivers/clk/spacemit/ccu_ddn.h    |   48 +
> >  drivers/clk/spacemit/ccu_mix.c    |  284 +++++
> >  drivers/clk/spacemit/ccu_mix.h    |  246 +++++
> >  drivers/clk/spacemit/ccu_pll.c    |  146 +++
> >  drivers/clk/spacemit/ccu_pll.h    |   76 ++
> >  12 files changed, 2668 insertions(+)
> >  create mode 100644 drivers/clk/spacemit/Kconfig
> >  create mode 100644 drivers/clk/spacemit/Makefile
> >  create mode 100644 drivers/clk/spacemit/ccu-k1.c
> >  create mode 100644 drivers/clk/spacemit/ccu_common.h
> >  create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> >  create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> >  create mode 100644 drivers/clk/spacemit/ccu_mix.c
> >  create mode 100644 drivers/clk/spacemit/ccu_mix.h
> >  create mode 100644 drivers/clk/spacemit/ccu_pll.c
> >  create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > 
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > index 713573b6c86c..19c1ed280fd7 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -517,6 +517,7 @@ source "drivers/clk/samsung/Kconfig"
> >  source "drivers/clk/sifive/Kconfig"
> >  source "drivers/clk/socfpga/Kconfig"
> >  source "drivers/clk/sophgo/Kconfig"
> > +source "drivers/clk/spacemit/Kconfig"
> >  source "drivers/clk/sprd/Kconfig"
> >  source "drivers/clk/starfive/Kconfig"
> >  source "drivers/clk/sunxi/Kconfig"
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index bf4bd45adc3a..42867cd37c33 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -145,6 +145,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> >  obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> >  obj-y					+= socfpga/
> >  obj-y					+= sophgo/
> > +obj-y					+= spacemit/
> >  obj-$(CONFIG_PLAT_SPEAR)		+= spear/
> >  obj-y					+= sprd/
> >  obj-$(CONFIG_ARCH_STI)			+= st/
> > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > new file mode 100644
> > index 000000000000..76090cd85668
> > --- /dev/null
> > +++ b/drivers/clk/spacemit/Kconfig
> > @@ -0,0 +1,20 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config SPACEMIT_CCU
> > +	tristate "Clock support for Spacemit SoCs"
> > +	default y
> similar reason to pinctrl with these patches [1], [2]
> I'd suggest switch to "bool + default ARCH_SPACEMIT" 
> 
> Link: https://lore.kernel.org/all/20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org [1]
> Link: https://lore.kernel.org/all/6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be [2]
> 

Clk subsystem prefers no defalt and set it in defconfig,
so should no default there.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
