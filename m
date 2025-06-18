Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD42C71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 22:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S/QGZHJJE/y+ydfWw+E+5btLkmWMpvmly6fifbXbJ0I=; b=lV9/Cz2p2i6cyR
	YJO0Q63QwLRU2pAtLhY1eKgG9BS2dVhhadzTii+l/MhvYmK/M3JumOWr/t3fBz8atCFo9SR791Bnl
	3k63GYarwmbyEH2aDErNopHuAEi5C+sQepPIrSwu6t2uOC6Q2TbGSh2baRaFRZvNz8knd7GEQ3OQ9
	uHEMcc16WLM3VXWFjRwq/t1AgID/b6TZtV+H5z0BO3lq0x0DpzWd1YkpkbvQMeAlw4fvKECpl2Kes
	VgBpLmP+4uqOvvwCMElvW5ifYkP6Df3cseoNnMx0gVJ+VS2fMCuaEPA7dByTz9PiDveZ9DyEVutMr
	GRBHd8pNb/PiCXdQ0TEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS1gY-0000000BXXn-4BVy;
	Wed, 18 Jun 2025 22:55:15 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS1gL-0000000BXUh-2III
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 22:55:02 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b2c49373c15so154405a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 15:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750287300; x=1750892100; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/5NwaPDyOETWv2pDddwa/aKZNaAck4pdMU751257ncI=;
        b=RHtbbEvPXTcNKjpY5yHot3SETW3yW/dJxgSFGRULKHQqejwlivJxFCi4qh7I7QIvB9
         P+JUHsCUWuiSynoZetNfiRC+5/TnEuOQ8oXy9SOlEigYuE91euMuj/hPOWvWPcrc60MZ
         oQw2cZ2w7MbmBMttES+Hp8d5YULJwgV7jxS3LrwjVLFGZmVxba3catZPk3cR2fAdKc8J
         zrjoPKabqpNmvKZEFsRxaLL6ZNjenVzRG2zvhCI3DBMSDtsgn7YMpO8MxUytM6ZnAEoR
         8gNrEyp2RI8qUx3NKKko8AghUCDjQpyfAY6ZZL43lENe/PXsKiJ+cAku9D5ZkLEyIYuL
         2hUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750287300; x=1750892100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5NwaPDyOETWv2pDddwa/aKZNaAck4pdMU751257ncI=;
        b=umt2bA9/ZIM1n1V185r7lMp1B8f9N1ikh7yLENwPZct/3CSxIUh+3Hn4d3UqDlXAYC
         Ip/kZ2fc7hm6VgcmNXvADA8QOwpvewk4bn0PRMI+asMOeY8CZLo4XvTXeWY0Y9b6IaqQ
         hCj232watUrxVeHH/hnsORvloOaSufA0W0EJsz5FVus4EDRYbAP65+n/6QvScfHWY36a
         67GXTQAKjC8s0ZFrtce+5DUmugy4OmxO27O50X8miJdo9WaV7p11RHoRY/TdBGl1yYKt
         3LJ9/FhCXbmOUvJ+OPr9zjHv9BQEt18dtPQUMKc/1c/t7QLByg8Z5s3TyIBwM3o/hlat
         fLCg==
X-Forwarded-Encrypted: i=1; AJvYcCVq6jkUlnkmwZv2mM+Ws+Z6YwJm0BnH4J+Es+IRTk3qAU3zptw1SnDdH0Q+rzuxcpeWJ6sDlfs4zkLhog==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQGRYqxEpJBuseQKJGIgDHE3fU6ph/2JuBXINXKfOYMfbTaWOy
	fGu4GL7lcDd40FAaQdAC705xD3io7IAN2bmaF9M0JbdI8ggEnR/msSAGv4gFP1UWXOw=
X-Gm-Gg: ASbGncs/+2WqAQsNnJt2vuAGNeNW0gDLjW+jehdTRLvtxpH2+yxpoUE9uSkIUchUM9J
	3Z1PywS4qeAuJPFD0L/w2FsTd2ztTCnsfNhtAcunXo2IADLG48HbLN04A+pRIKs88Pac4k9B9pd
	jaHRosrYI0qRGtdMdpN+/J+vNnoL40lJAyGpSf9ZdAiexc5H0fqTJoWCq/ro42bY/7B3OjqUYxe
	RW+pDXiTvWBFVhq9NWna79o3h4IYtYsbzuyt2RmGp3zyVl+nNKa7QfUf1Mc1UfD0IoL9KLZwgBc
	oKibCcQmQg/XIIdQtpBUGQoCXEumCMGDyKej+k6vbSdos5LyEiMGPeWqZKv9FqIFmHs1e2nccpU
	48LJHjA==
X-Google-Smtp-Source: AGHT+IHgVrtzzhpW+oJLMdXuYbVuOtesVP9Nvp/NylotZPQenDpgvWchZUgnqqSWky9m7BlwSjYVnw==
X-Received: by 2002:a17:90a:dfcb:b0:313:d346:f347 with SMTP id 98e67ed59e1d1-313f1e27e38mr28887847a91.35.1750287300056;
        Wed, 18 Jun 2025 15:55:00 -0700 (PDT)
Received: from x1 (97-120-250-80.ptld.qwest.net. [97.120.250.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a24be89sm591076a91.23.2025.06.18.15.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 15:54:59 -0700 (PDT)
Date: Wed, 18 Jun 2025 15:54:57 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 1/8] power: sequencing: Add T-HEAD TH1520 GPU power
 sequencer driver
Message-ID: <aFNDwcK5+ZuHBdrw@x1>
References: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <CGME20250618102226eucas1p112dacf9670f68b4a8581aa1a8b5ced9d@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-1-27ed33ea5c6f@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250618-apr_14_for_sending-v5-1-27ed33ea5c6f@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_155501_779728_BC726922 
X-CRM114-Status: GOOD (  23.85  )
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

On Wed, Jun 18, 2025 at 12:22:07PM +0200, Michal Wilczynski wrote:
> Introduce the pwrseq-thead-gpu driver, a power sequencer provider for
> the Imagination BXM-4-64 GPU on the T-HEAD TH1520 SoC. This driver
> controls an auxiliary device instantiated by the AON power domain.
> 
> The TH1520 GPU requires a specific sequence to correctly initialize and
> power down its resources:
>  - Enable GPU clocks (core and sys).
>  - De-assert the GPU clock generator reset (clkgen_reset).
>  - Introduce a short hardware-required delay.
>  - De-assert the GPU core reset. The power-down sequence performs these
>    steps in reverse.
> 
> Implement this sequence via the pwrseq_power_on and pwrseq_power_off
> callbacks.
> 
> Crucially, the driver's match function is called when a consumer (the
> Imagination GPU driver) requests the "gpu-power" target. During this
> match, the sequencer uses clk_bulk_get() and
> reset_control_get_exclusive() on the consumer's device to obtain handles
> to the GPU's "core" and "sys" clocks, and the GPU core reset.  These,
> along with clkgen_reset obtained from parent aon node, allow it to
> perform the complete sequence.
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  MAINTAINERS                                 |   1 +
>  drivers/power/sequencing/Kconfig            |   8 +
>  drivers/power/sequencing/Makefile           |   1 +
>  drivers/power/sequencing/pwrseq-thead-gpu.c | 231 ++++++++++++++++++++++++++++
>  4 files changed, 241 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0183c028fa18c397d30ec82fd419894f1f50a448..3283ff592215249bcf702dbb4ab710477243477e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21395,6 +21395,7 @@ F:	drivers/mailbox/mailbox-th1520.c
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
>  F:	drivers/pinctrl/pinctrl-th1520.c
>  F:	drivers/pmdomain/thead/
> +F:	drivers/power/sequencing/pwrseq-thead-gpu.c
>  F:	drivers/reset/reset-th1520.c
>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
>  F:	include/dt-bindings/power/thead,th1520-power.h
> diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
> index ddcc42a984921c55667c46ac586d259625e1f1a7..7fa912c9af2479cdce909467c29fe335788f0bd7 100644
> --- a/drivers/power/sequencing/Kconfig
> +++ b/drivers/power/sequencing/Kconfig
> @@ -27,4 +27,12 @@ config POWER_SEQUENCING_QCOM_WCN
>  	  this driver is needed for correct power control or else we'd risk not
>  	  respecting the required delays between enabling Bluetooth and WLAN.
>  
> +config POWER_SEQUENCING_THEAD_GPU
> +	tristate "T-HEAD TH1520 GPU power sequencing driver"
> +	depends on ARCH_THEAD && AUXILIARY_BUS
> +	help
> +	  Say Y here to enable the power sequencing driver for the TH1520 SoC
> +	  GPU. This driver handles the complex clock and reset sequence
> +	  required to power on the Imagination BXM GPU on this platform.

This is a minor nit but maybe this should be POWER_SEQUENCING_TH1520_GPU?

I often grep for TH1520 to make sure I have all the options enabled and
it took me a second to realize it was 'THEAD' instead of 'TH1520'.

In retrospect, I probably should have have used CONFIG_DWMAC_TH1520 for
the ethernet driver instead of CONFIG_DWMAC_THEAD.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
