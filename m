Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE540C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 22:02:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6610361100
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 22:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6610361100
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NjlI+8dsSyHkSnc/iWBhlgId8+oAEi67jfP1tCHV3R8=; b=kAx7DV0xT9BkJL
	GgDlvEnynyJ7bSkUIUNikZcBLvq9FCzsc3jeIjQw6zlhFqs9Os+nYjAfTPpLuEdLWXfNLofVE1EMx
	i0sHwUHPu1Js9fX4caZir2T47s4E4Ksdyk26LBEk1yyEcvf2g60avCffnjPXVg6L3fQEtpJzlNfdj
	VvplrYiEzkHTF6nHkKwnPsReh2VImxZChobwK5n07A0AwiRkNMMn+VGBs9F6g5Sl9gXN5P7OWQxlJ
	A7ECnZ2qi0pRoIpndRXvX+/fjnMTy9H0fwo2oKdw9fdOvuk2Jx5pype3EjptGnpCLK2cpr6roSyV3
	W0pQMY8/oJNbYWyxHVfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO5dv-007gpk-8I; Wed, 08 Sep 2021 22:02:07 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO5dj-007gnN-LQ
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 22:01:57 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id v10so7279639ybm.5
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 15:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QrmGu/DrfyoJRjpghd3iKC2qArp95acLTRr1DpVzOXw=;
 b=HtOCYnqF+XNFihpSSOGepIIhsy0mk604rHmTDijAxbnCqHuL3964QWi8+AeYU4XsyM
 CIZPEbQeMeabtupTgTi6YAHyfgULH1rAMDazCcsTyO7+2h2Ew0XLMEXEiEQ7xYL06f+D
 ujnKxZXqc/J2NgGH2DAu/Jaz51Skk4SWS5R4W6o9n/9wUa7JFfrNFPykqON0rsfM6aIy
 oQPtuw48u3Gfbq2UI2739jAqRIw1QJC+K0bAIhW4qQFasPRzM7zGIhF1b6JDZTQ32aSr
 +erojPB0cSP2kaV9IxfbGgAWyMCiORgKpbh7f+84tLWov+D2Zc7Apg80uruu2zVqqgpX
 fXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QrmGu/DrfyoJRjpghd3iKC2qArp95acLTRr1DpVzOXw=;
 b=Ayy83P6lPZYFN1uKSIkqWj85+KbOE07zbzdP4noq+lClasD0i+w7SI5lK1cidtJmJD
 C7TNAiuDAXZL9Yf1erq/nrLop3auzU2ZrfuG99BvWjmt2ybXOgNxFYbFjGLwYxPuT1+a
 qYh4s8JKXFAWeyspxs889PDTw1e3K0C/rrqlh5Xdnfwb9yaGRqyyMeeuy427eG3Fcsk4
 kWQkFT8cdX8ruwfy1lCzuK6vkNubEuDxJKQW+uoHAp/wfoXayiPBfMBw8HBzqF3MGJBK
 XMiQcCKIzqkPnmzgN2PRvn/Y+vKRwAfdt697qgnScxFRFo5iee4hcGyNyY8P5nWPW74C
 LKYA==
X-Gm-Message-State: AOAM530CBjik1Ok7DQh+OYZ52Ol9UIiKYA2iP0nPAdqChsOJeHLOYcf/
 fjICK0eCghdh2Mx+vcxAF/eBewmFFNFL4l+P+A11jg==
X-Google-Smtp-Source: ABdhPJzcrGOFhcWqvJKmXAgREc3Jl+IJVplHAN9b5rURTUIIgccy4UFyMg6V6WbeOAMJPrDtQs11Lw3yJ0JnWwEIeB4=
X-Received: by 2002:a25:b94:: with SMTP id 142mr565239ybl.508.1631138510833;
 Wed, 08 Sep 2021 15:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
 <20210904000543.2019010-3-saravanak@google.com>
 <CAPDyKFqO9PLygSnNWSPg9OhnfFfiSUXsEmj7juYjNyYSn2C6og@mail.gmail.com>
In-Reply-To: <CAPDyKFqO9PLygSnNWSPg9OhnfFfiSUXsEmj7juYjNyYSn2C6og@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 8 Sep 2021 15:01:14 -0700
Message-ID: <CAGETcx-0-DN5U6JY0xTahAje0SkdhwAesdAwi2Lp19meLsfe8g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 Rob Herring <robh+dt@kernel.org>, Android Kernel Team <kernel-team@android.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-oxnas@groups.io,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_150155_733812_D0067CD6 
X-CRM114-Status: GOOD (  27.33  )
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

On Tue, Sep 7, 2021 at 3:29 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Sat, 4 Sept 2021 at 02:05, Saravana Kannan <saravanak@google.com> wrote:
> >
> > The simple-pm-bus driver is mandatory for CONFIG_OF based platforms to
> > work with fw_devlink. So, always compile it in for CONFIG_OF and delete
> > the config since it's no longer necessary.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
>
> Some comments, see below. Nevertheless, feel free to add:
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Thanks.

>
> Kind regards
> Uffe
>
> > ---
> >  arch/arm/configs/multi_v7_defconfig |  1 -
> >  arch/arm/configs/oxnas_v6_defconfig |  1 -
> >  arch/arm/configs/shmobile_defconfig |  1 -
> >  arch/arm/mach-omap2/Kconfig         |  1 -
> >  arch/arm64/configs/defconfig        |  1 -
> >  drivers/bus/Kconfig                 | 12 ------------
> >  drivers/bus/Makefile                |  2 +-
> >  drivers/soc/canaan/Kconfig          |  1 -
> >  8 files changed, 1 insertion(+), 19 deletions(-)
>
> Not sure what other people think (and it's not my call to make), but I
> would suggest to split this up in four pieces (drivers/bus,
> drivers/soc, arm, arm64)
>
> The important part is that the change in drivers/bus gets merged as
> part of your series, to make sure we don't break anything.

I think it'll be better if it's one commit like this and we have Greg
up the series. That way, there's no chance of broken trees anywhere.

-Saravana

>
> >
> > diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> > index d9abaae118dd..362720ae8d65 100644
> > --- a/arch/arm/configs/multi_v7_defconfig
> > +++ b/arch/arm/configs/multi_v7_defconfig
> > @@ -196,7 +196,6 @@ CONFIG_PCI_EPF_TEST=m
> >  CONFIG_DEVTMPFS=y
> >  CONFIG_DEVTMPFS_MOUNT=y
> >  CONFIG_OMAP_OCP2SCP=y
> > -CONFIG_SIMPLE_PM_BUS=y
> >  CONFIG_MTD=y
> >  CONFIG_MTD_CMDLINE_PARTS=y
> >  CONFIG_MTD_BLOCK=y
> > diff --git a/arch/arm/configs/oxnas_v6_defconfig b/arch/arm/configs/oxnas_v6_defconfig
> > index cae0db6b4eaf..de37f7e90999 100644
> > --- a/arch/arm/configs/oxnas_v6_defconfig
> > +++ b/arch/arm/configs/oxnas_v6_defconfig
> > @@ -46,7 +46,6 @@ CONFIG_DEVTMPFS=y
> >  CONFIG_DEVTMPFS_MOUNT=y
> >  CONFIG_DMA_CMA=y
> >  CONFIG_CMA_SIZE_MBYTES=64
> > -CONFIG_SIMPLE_PM_BUS=y
> >  CONFIG_MTD=y
> >  CONFIG_MTD_CMDLINE_PARTS=y
> >  CONFIG_MTD_BLOCK=y
> > diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> > index d9a27e4e0914..18d2a960b2d2 100644
> > --- a/arch/arm/configs/shmobile_defconfig
> > +++ b/arch/arm/configs/shmobile_defconfig
> > @@ -40,7 +40,6 @@ CONFIG_PCI_RCAR_GEN2=y
> >  CONFIG_PCIE_RCAR_HOST=y
> >  CONFIG_DEVTMPFS=y
> >  CONFIG_DEVTMPFS_MOUNT=y
> > -CONFIG_SIMPLE_PM_BUS=y
> >  CONFIG_MTD=y
> >  CONFIG_MTD_BLOCK=y
> >  CONFIG_MTD_CFI=y
> > diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
> > index 7df8f5276ddf..02f2f3157f07 100644
> > --- a/arch/arm/mach-omap2/Kconfig
> > +++ b/arch/arm/mach-omap2/Kconfig
> > @@ -112,7 +112,6 @@ config ARCH_OMAP2PLUS
> >         select PM_GENERIC_DOMAINS
> >         select PM_GENERIC_DOMAINS_OF
> >         select RESET_CONTROLLER
> > -       select SIMPLE_PM_BUS
> >         select SOC_BUS
> >         select TI_SYSC
> >         select OMAP_IRQCHIP
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index f423d08b9a71..474b1f2e3f06 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -245,7 +245,6 @@ CONFIG_DEVTMPFS_MOUNT=y
> >  CONFIG_FW_LOADER_USER_HELPER=y
> >  CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
> >  CONFIG_HISILICON_LPC=y
> > -CONFIG_SIMPLE_PM_BUS=y
> >  CONFIG_FSL_MC_BUS=y
> >  CONFIG_TEGRA_ACONNECT=m
> >  CONFIG_GNSS=m
> > diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> > index e7f7eee6ee9a..dc3801369488 100644
> > --- a/drivers/bus/Kconfig
> > +++ b/drivers/bus/Kconfig
> > @@ -141,18 +141,6 @@ config QCOM_EBI2
> >           Interface 2, which can be used to connect things like NAND Flash,
> >           SRAM, ethernet adapters, FPGAs and LCD displays.
> >
> > -config SIMPLE_PM_BUS
> > -       tristate "Simple Power-Managed Bus Driver"
> > -       depends on OF && PM
> > -       help
> > -         Driver for transparent busses that don't need a real driver, but
> > -         where the bus controller is part of a PM domain, or under the control
> > -         of a functional clock, and thus relies on runtime PM for managing
> > -         this PM domain and/or clock.
> > -         An example of such a bus controller is the Renesas Bus State
> > -         Controller (BSC, sometimes called "LBSC within Bus Bridge", or
> > -         "External Bus Interface") as found on several Renesas ARM SoCs.
> > -
> >  config SUN50I_DE2_BUS
> >         bool "Allwinner A64 DE2 Bus Driver"
> >           default ARM64
> > diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> > index 397e35392bff..86aacd36a56d 100644
> > --- a/drivers/bus/Makefile
> > +++ b/drivers/bus/Makefile
> > @@ -26,7 +26,7 @@ obj-$(CONFIG_OMAP_OCP2SCP)    += omap-ocp2scp.o
> >  obj-$(CONFIG_QCOM_EBI2)                += qcom-ebi2.o
> >  obj-$(CONFIG_SUN50I_DE2_BUS)   += sun50i-de2.o
> >  obj-$(CONFIG_SUNXI_RSB)                += sunxi-rsb.o
> > -obj-$(CONFIG_SIMPLE_PM_BUS)    += simple-pm-bus.o
> > +obj-$(CONFIG_OF)               += simple-pm-bus.o
> >  obj-$(CONFIG_TEGRA_ACONNECT)   += tegra-aconnect.o
> >  obj-$(CONFIG_TEGRA_GMI)                += tegra-gmi.o
> >  obj-$(CONFIG_TI_PWMSS)         += ti-pwmss.o
> > diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
> > index 8179b69518b4..853096b7e84c 100644
> > --- a/drivers/soc/canaan/Kconfig
> > +++ b/drivers/soc/canaan/Kconfig
> > @@ -5,7 +5,6 @@ config SOC_K210_SYSCTL
> >         depends on RISCV && SOC_CANAAN && OF
> >         default SOC_CANAAN
> >          select PM
> > -        select SIMPLE_PM_BUS
> >          select SYSCON
> >          select MFD_SYSCON
> >         help
> > --
> > 2.33.0.153.gba50c8fa24-goog
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
