Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D943C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 09:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/gIsyP1gN3q9OTU1wmdY0+E5EJPxvr5sBJfhr41zXU=; b=n0VdGl4+6K6fQd
	fQA8TGebmA3Z1mRgWJSPGqqIf6eGu6QrC3SjyGdyp4bBse0eIYDkU4MSxajC5BnVYMz6zxtzIL9wr
	YjkKGfzR0mksvrLimniH/c7lcWVPYnOZ2p+JixAMLUzNwwE38oBuiHidAK+tFKFREhvOfZ+X6tPAJ
	72vYfdsF0UDpRtzuhz5jokDwemuB2hwACFSrSGLFvsKdAFO1wyuoYoJcDMx2E0FQkI7t6xXXrO9PA
	5i2iNxVutJNJwM3PsGtRmYMzVFItnFGSsEqRpGPPM1j+jBdHq/dcYOMoaGSNAqYj6JA+vqxLX8XJw
	rP9fXWNU9xeojx7Jc2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPzc-007QhA-28; Tue, 22 Nov 2022 09:55:04 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPzY-007QbL-6O
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 09:55:02 +0000
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E03EE3F336
	for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 09:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1669110892;
	bh=HrNRI9fm8I0LThHGHUBPDlRXDYp2/ZQuA5vUnE2da2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=plcwTDQok4/ot1omim3xzUtlk65gTUF9oNViFrnDLc1x9/TL6X92jMrOAwxcD5P5E
	 0FM16FX6bDNzDeWqJjAKyXWq7b5lYFOSRIaKzXgOYtgIkVMwHD2loUJXZv/6zWB6yV
	 1I8XwWp4eH9aPLQfKX1jMRgN0feLsNmfMmywPGbzWHfNmxcAoHgIdIn96SpJ9XdLI1
	 9WdiY+hyziF+tJ6lG9VZO854Wn+DuRPz3mAbWwthHPRKwClc07xdDuWgGaAlVBdEHS
	 nixs9NBB0YM1KX8QEWgOyS5QlaxzhhzVauaUuwaOQCZUxP79Ya+E3dohbkpx3a/rDj
	 Kz3lEptGOU0fw==
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-3a0e59c5ad7so52736077b3.20
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 01:54:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrNRI9fm8I0LThHGHUBPDlRXDYp2/ZQuA5vUnE2da2k=;
        b=mWJ145lLgKwKk1X0FC2xTfwIKE5Hqw3pOOM74M3RcxtgHISVZVsGMYA7uiCKPhRhUh
         Axek0Vz7okyRR5sKnhthqiyC7JDuSMCloNVXy86HIPSjjTSkYf4xEVxP4EK8Ci3Zktdv
         XHfQStPphc/uUIy6tNJeM5fEukWLzfQtBo5CeCrbsWYgsh9gFQuTugBAYJ3gAe1AFYKN
         WNqm2Xhu46Fc+0qiRRTujeeHSS7JkhrDO9XmI29Ym8iu2dmCZH9kyfsicGDP8Agf/5J3
         tdsFXSH1AvYNVFBhGN9lWllh6VpGFf5DkG/qX8LxppxHp8QmTKRvxbRzvKz4yi7OZ90U
         tJJA==
X-Gm-Message-State: ANoB5pl7t6C0PCR5IvIBdYpbdS1EVcmfBhJe5kLMxxsjfAeiX68WN/Pv
	rAkLhF7ac8xEZlxXTRXjwNXWfAg147h1gHL07pPDnQ3EfWUs+7CaxpiwRPP45iKAebObXZbieSd
	nm5Njk0qkJOP0IEsJvlENxj0NklSEkgQvdduZq2jXezhPJXdqQn+7hfinvzaCWw==
X-Received: by 2002:a05:690c:582:b0:391:fccf:db48 with SMTP id bo2-20020a05690c058200b00391fccfdb48mr20755474ywb.257.1669110891988;
        Tue, 22 Nov 2022 01:54:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6OK15UZBqnryc+w5BhbprE3eAfz63iGGiAiaXGRZC0tWbzgLL947UV8Nm6SDyTrSz6leyms8QhLAhqXN7lRyE=
X-Received: by 2002:a05:690c:582:b0:391:fccf:db48 with SMTP id
 bo2-20020a05690c058200b00391fccfdb48mr20755458ywb.257.1669110891749; Tue, 22
 Nov 2022 01:54:51 -0800 (PST)
MIME-Version: 1.0
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-6-hal.feng@starfivetech.com> <Y3dwdXExRRltyp8A@spud> <b4afb821-f899-a2b6-46e1-a31b5e3f974e@starfivetech.com>
In-Reply-To: <b4afb821-f899-a2b6-46e1-a31b5e3f974e@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 22 Nov 2022 10:54:34 +0100
Message-ID: <CAJM55Z_LqTNEoo7CF-zfwqbKPTXEjji7aeLLeEgcLnacZ0z1Og@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] soc: sifive: ccache: Add StarFive JH7110 support
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ben Dooks <ben.dooks@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_015500_420863_2A5004DA 
X-CRM114-Status: GOOD (  37.56  )
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

On Tue, 22 Nov 2022 at 10:03, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> On Fri, 18 Nov 2022 19:45:57 +0800, Conor Dooley wrote:
> > Hey Emil/Hal,
> >
> > On Fri, Nov 18, 2022 at 09:17:11AM +0800, Hal Feng wrote:
> > > From: Emil Renner Berthing <kernel@esmil.dk>
> > >
> > > This adds support for the StarFive JH7110 SoC which also
> > > features this SiFive cache controller.
> > >
> > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > > ---
> > >  arch/riscv/Kconfig.socs            | 1 +
> > >  drivers/soc/Makefile               | 2 +-
> > >  drivers/soc/sifive/Kconfig         | 2 +-
> > >  drivers/soc/sifive/sifive_ccache.c | 1 +
> > >  4 files changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > > index 69774bb362d6..5a40e05f8cab 100644
> > > --- a/arch/riscv/Kconfig.socs
> > > +++ b/arch/riscv/Kconfig.socs
> > > @@ -22,6 +22,7 @@ config SOC_STARFIVE
> > >     bool "StarFive SoCs"
> > >     select PINCTRL
> > >     select RESET_CONTROLLER
> > > +   select SIFIVE_CCACHE
> >
> > Please no. I am trying to get rid of these selects + I cannot figure out
> > why this driver is so important that you *need* to select it. Surely the
> > SoC is useable without it>
> > Is this a hang over from your vendor tree that uses the driver to do
> > non-coherent stuff for the jh7100?
>
> I have tested that the board can successfully boot up without the cache
> driver. The `select` can be removed for JH7110. @Emil, what do you think
> of this?

Yes, for the JH7110 this is not strictly needed, just like the
Unmatched board. For the StarFive JH7100 it is though.
So if you're only adding support for the JH7110 then it's not needed.

> >
> > >     select SIFIVE_PLIC
> > >     help
> > >       This enables support for StarFive SoC platform hardware.
> > > diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> > > index 69ba6508cf2c..534669840858 100644
> > > --- a/drivers/soc/Makefile
> > > +++ b/drivers/soc/Makefile
> > > @@ -26,7 +26,7 @@ obj-y                             += qcom/
> > >  obj-y                              += renesas/
> > >  obj-y                              += rockchip/
> > >  obj-$(CONFIG_SOC_SAMSUNG)  += samsung/
> > > -obj-$(CONFIG_SOC_SIFIVE)   += sifive/
> > > +obj-y                              += sifive/
> >
> > This bit is fine.
> >
> > >  obj-y                              += sunxi/
> > >  obj-$(CONFIG_ARCH_TEGRA)   += tegra/
> > >  obj-y                              += ti/
> > > diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
> > > index ed4c571f8771..e86870be34c9 100644
> > > --- a/drivers/soc/sifive/Kconfig
> > > +++ b/drivers/soc/sifive/Kconfig
> > > @@ -1,6 +1,6 @@
> > >  # SPDX-License-Identifier: GPL-2.0
> > >
> > > -if SOC_SIFIVE
> > > +if SOC_SIFIVE || SOC_STARFIVE
> >
> > As I suppose is this - but hardly scalable. I suppose it doesn't really
> > matter.
> >
> > >  config SIFIVE_CCACHE
> > >     bool "Sifive Composable Cache controller"
> > > diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
> > > index 1c171150e878..9489d1a90fbc 100644
> > > --- a/drivers/soc/sifive/sifive_ccache.c
> > > +++ b/drivers/soc/sifive/sifive_ccache.c
> > > @@ -107,6 +107,7 @@ static const struct of_device_id sifive_ccache_ids[] = {
> > >     { .compatible = "sifive,fu540-c000-ccache" },
> > >     { .compatible = "sifive,fu740-c000-ccache" },
> > >     { .compatible = "sifive,ccache0" },
> > > +   { .compatible = "starfive,jh7110-ccache" },
> >
> > Per my second reply to the previous patch, I am not sure why you do not
> > just have a fallback compatible in the binding/dt for the fu740 ccache
> > since you appear to have identical configuration?
>
> Yeah, I will use the compatible of fu740 and modify this patch.

No, the JH7110 should not pretend to be a fu740, but if you add

compatible = "starfive,jh7110-ccache", "sifive,ccache0";

then this driver should still match "sifive,ccache0" without adding
the "starfive,jh7110-ccache" entry.

>
> Best regards,
> Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
