Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E708C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOtrHAmDiNkGET24WEXt6VacO3ZiRFmTDV/9IgkEyoE=; b=jyruwlkdmJAmPA
	MJk8wbdKgT2W7oGgys2yi/aihqPw0KwmYlEXPum/W8+Ep+zFdPVkyMecTuKahsm1fMvnbtdcoRML1
	eUrUazAprS90yx481kOiyVfopn6FYi9Yp0GO3fHy3/PGyU8HJkxwdfjC1t1QLTE1BK/Pz6htj5LvY
	4rBvZgk+isEu7TjW/CHbvvqQ5KDNfXQIaJ5xHZjDuwtBpmCCBCWvozaLhxu36/rfwXB9ZcenNqIVR
	uavIbLOVQiEM8QWMEYvKu4nKvEenPyWyfKC2ZTjS3qXHxJAQthXm+oQJ03nZI1PMxIsCcJiMfRqHF
	0AqksZJ+BL6/Xp2YTTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQH1-007hN0-Jn; Tue, 22 Nov 2022 10:13:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQGv-007hHs-Pe
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 10:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669111977; x=1700647977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pkfiL1SWiTBuzefA52pcy+2yr5O15Ewlk9gdi/xHclw=;
  b=viRwSKnlbHEYVhhVHPoXgDYAPmSK7T8+qwgqF6OH2WIA/untCxKq7apB
   XDiIyuS82pF9Aq+ovoymzWZVMkS1niLSiQlqEv0Rq9OHgypcInh7gWv7+
   Ql1Chm8ozqKjktqWtbDQHrfhct01VBpx28nP51n8Z06uyj79dTgW6KJ7A
   zzWaAT4izXeS6AFOjpyMwB8ZmfqN2IGDrwnFnwUFcIkCuUGMjkJPRGeeG
   i8SatA3dSsAvJWmu8OWc1ZeSRDUAiKoMSbgzKK4KEbyzoWmM+ZOKAGECn
   SQLpAdB4yu7PU7bWdHGvg9yjyKILh6SG/lkoRbz0O43jfhi9MM1yOzrCZ
   A==;
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="124566194"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Nov 2022 03:12:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 22 Nov 2022 03:12:51 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 22 Nov 2022 03:12:48 -0700
Date: Tue, 22 Nov 2022 10:12:30 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	<hal.feng@starfivetech.com>
CC: Hal Feng <hal.feng@starfivetech.com>, Conor Dooley <conor@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier
	<maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Linus
 Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/8] soc: sifive: ccache: Add StarFive JH7110 support
Message-ID: <Y3ygjlEhu41dvT9k@wendy>
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-6-hal.feng@starfivetech.com>
 <Y3dwdXExRRltyp8A@spud>
 <b4afb821-f899-a2b6-46e1-a31b5e3f974e@starfivetech.com>
 <CAJM55Z_LqTNEoo7CF-zfwqbKPTXEjji7aeLLeEgcLnacZ0z1Og@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z_LqTNEoo7CF-zfwqbKPTXEjji7aeLLeEgcLnacZ0z1Og@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_021257_939143_5A9C78E8 
X-CRM114-Status: GOOD (  32.65  )
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

On Tue, Nov 22, 2022 at 10:54:34AM +0100, Emil Renner Berthing wrote:
> On Tue, 22 Nov 2022 at 10:03, Hal Feng <hal.feng@starfivetech.com> wrote:
> > On Fri, 18 Nov 2022 19:45:57 +0800, Conor Dooley wrote:
> > > Hey Emil/Hal,
> > > On Fri, Nov 18, 2022 at 09:17:11AM +0800, Hal Feng wrote:
> > > > From: Emil Renner Berthing <kernel@esmil.dk>

> > > > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > > > index 69774bb362d6..5a40e05f8cab 100644
> > > > --- a/arch/riscv/Kconfig.socs
> > > > +++ b/arch/riscv/Kconfig.socs
> > > > @@ -22,6 +22,7 @@ config SOC_STARFIVE
> > > >     bool "StarFive SoCs"
> > > >     select PINCTRL
> > > >     select RESET_CONTROLLER
> > > > +   select SIFIVE_CCACHE
> > >
> > > Please no. I am trying to get rid of these selects + I cannot figure out
> > > why this driver is so important that you *need* to select it. Surely the
> > > SoC is useable without it>
> > > Is this a hang over from your vendor tree that uses the driver to do
> > > non-coherent stuff for the jh7100?
> >
> > I have tested that the board can successfully boot up without the cache
> > driver. The `select` can be removed for JH7110. @Emil, what do you think
> > of this?
> 
> Yes, for the JH7110 this is not strictly needed, just like the
> Unmatched board. For the StarFive JH7100 it is though.
> So if you're only adding support for the JH7110 then it's not needed.

Even for the JH7100 there are other ways to do this than selects in
arch/riscv - for example
config SIFIVE_CCACHE
	default SOC_STARFIVE

But you don't need that either if you're not adding the JH7100 :)

> > > >  config SIFIVE_CCACHE
> > > >     bool "Sifive Composable Cache controller"
> > > > diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
> > > > index 1c171150e878..9489d1a90fbc 100644
> > > > --- a/drivers/soc/sifive/sifive_ccache.c
> > > > +++ b/drivers/soc/sifive/sifive_ccache.c
> > > > @@ -107,6 +107,7 @@ static const struct of_device_id sifive_ccache_ids[] = {
> > > >     { .compatible = "sifive,fu540-c000-ccache" },
> > > >     { .compatible = "sifive,fu740-c000-ccache" },
> > > >     { .compatible = "sifive,ccache0" },
> > > > +   { .compatible = "starfive,jh7110-ccache" },
> > >
> > > Per my second reply to the previous patch, I am not sure why you do not
> > > just have a fallback compatible in the binding/dt for the fu740 ccache
> > > since you appear to have identical configuration?
> >
> > Yeah, I will use the compatible of fu740 and modify this patch.
> 
> No, the JH7110 should not pretend to be a fu740, but if you add
> 
> compatible = "starfive,jh7110-ccache", "sifive,ccache0";
> 
> then this driver should still match "sifive,ccache0" without adding
> the "starfive,jh7110-ccache" entry.

Either works for me :) If you go for "sifive,ccache0", just make sure to
add the correct property enforcement - you can just copy the fu740 by
the looks of things (although that'd imply that it is compatible and can
fall back to it...)

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
