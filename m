Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6874C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 16:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ee4xUtqGe7hM4dU/mOZ3RL1DNjyc4dQrk7rgJbaw4Hw=; b=rPkTd4aAngFOSk
	k9YIwUuRIqXcxIZjyfQBrNeOfeys3iWiZlvQXBhPUHLGmEVwLjCGJTHRydEL47qyNv84qK/XS3rbE
	lFcxqHdEgPKpYcgVh3GLiTfOzc81d7aidcRGe7wh8aTYY++8JcPbY+RJIQu6qBFB+nyEozsaMBylD
	HUfWnIk00ugUVK0NbjBbEvmDCypE9gtZjyxBwZXc6xw7BNTX1QMHvb04NOt2p0ZWw1uBOZapG3TWH
	LJdRY3hTFAeCMI7QWO5Se+JvY51K6KdQH0J6uc7l6f4NPkAF2CD3FJMAHfc8M719XOc8MhdKRE9h9
	H9tnHEow3+ll8+wnjflg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow4FO-005KJS-Ty; Fri, 18 Nov 2022 16:29:46 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow4FL-005KHA-VZ
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 16:29:45 +0000
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AE7933F222
	for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 16:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1668788982;
	bh=n1AmhPidXStte0cr7nALfz6QHVHOy3+6QsUv/gwlQZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=NRX9svCKgLumKXTC9eHZmpfHmbspFYcRC920hDYaHtUZqiZodUzP3U3krlpxecu8h
	 7VXC4QYZZJTtIWk7cbO7W3zm3bDs2QxJ6V1VEEGggGb3MGPBDS//Nv5aZtvQyWK/mJ
	 VgGApKq+5nEbeMyfCfp/wn79EpEIpo5cdjMLVnclXsiA1rJBEEd2Qqhwe6vCLSm1Xi
	 zr/ebWh9onAV6u9UNEyG1cZNZjaNt9s/0KRcbTJ5gTGztNkg7zuweAaRPSYlKBO8Gy
	 xR74r/RtCrdwKRfRZ3h4f5p/TCAYas1hCAbkdrB9aBPwst6goEXy9uNApzf2D8s1/s
	 xH0TbHSN9E+0w==
Received: by mail-yb1-f197.google.com with SMTP id b17-20020a25b851000000b006e32b877068so4927004ybm.16
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 08:29:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1AmhPidXStte0cr7nALfz6QHVHOy3+6QsUv/gwlQZ0=;
        b=5nE9CK23xwA1VDtykcg0MIev5KsY4SLLSANIMvUBiCFDnxtnaAcSAJE9LcttR5kegs
         wS076OfocQHyQtdLkuA1+Rm0cApaSLvvUWTFZzwlBw55jNs8PCCmXFaKnOiF7lrtGQhx
         yuSwl5uYQzcdNyGa2n8Ns0O8vtvPlf9MyjpTf/LHQPBN4X9HojBCMXQPVOt1skAhTzM7
         gBPGuqepZD8DsA9IaWDLp4Amp4dGDrI4f/hXh2Vnn7exbS6AxKVGMNtbdVst9NVzJ8Jt
         /0azdsWExIre1CqO/QtmdXsGHHz30cWCwk3MFkYdLqXYGGueNGyr/+6q4tiRcM7kVZNV
         ortA==
X-Gm-Message-State: ANoB5pnD4O6GEOjBautzHiEkEN/Sq4i5NmVO85f3Y1xUoHLYuBfhkazy
	FWN3cTrFn8SgRP05FM+6oseT/r/OC+UhISZJ9LJDhin1v1T0WlmnSGZt80J9L4TmiZPDRXJhP5R
	OZW6J7faVbU9kEl79afdCkGxiIesrHKB+Jzb2K2ZOSNiCVvsAzYtcR76vIr9bhQ==
X-Received: by 2002:a25:abe4:0:b0:6e7:cbc4:1ac3 with SMTP id v91-20020a25abe4000000b006e7cbc41ac3mr5843270ybi.559.1668788981696;
        Fri, 18 Nov 2022 08:29:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7fF79tJ28ERAh84fO3zpC9Fb4cpHbLnel5aGbro1UBa0wzKWcqUZPvwK4sIlnHd/HGGprh2pvRWohAMVTvypE=
X-Received: by 2002:a25:abe4:0:b0:6e7:cbc4:1ac3 with SMTP id
 v91-20020a25abe4000000b006e7cbc41ac3mr5843258ybi.559.1668788981430; Fri, 18
 Nov 2022 08:29:41 -0800 (PST)
MIME-Version: 1.0
References: <20221118010627.70576-1-hal.feng@starfivetech.com> <20221118010627.70576-4-hal.feng@starfivetech.com>
In-Reply-To: <20221118010627.70576-4-hal.feng@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 18 Nov 2022 17:29:25 +0100
Message-ID: <CAJM55Z_f3K43TKpMKH6x8dQOW4jZMtPvHSvzG+Oeh3qWLWoj4Q@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] reset: Create subdirectory for StarFive drivers
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_082944_216395_26115EF6 
X-CRM114-Status: GOOD (  21.39  )
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

On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> From: Emil Renner Berthing <kernel@esmil.dk>
>
> This moves the StarFive JH7100 reset driver to a new subdirectory in
> preparation for adding more StarFive reset drivers.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  MAINTAINERS                                          | 4 ++--
>  drivers/reset/Kconfig                                | 8 +-------
>  drivers/reset/Makefile                               | 2 +-
>  drivers/reset/starfive/Kconfig                       | 8 ++++++++
>  drivers/reset/starfive/Makefile                      | 2 ++
>  drivers/reset/{ => starfive}/reset-starfive-jh7100.c | 0
>  6 files changed, 14 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/reset/starfive/Kconfig
>  create mode 100644 drivers/reset/starfive/Makefile
>  rename drivers/reset/{ => starfive}/reset-starfive-jh7100.c (100%)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d43daa89d5f1..e6f1060e7964 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19613,11 +19613,11 @@ F:    Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
>  F:     drivers/pinctrl/starfive/
>  F:     include/dt-bindings/pinctrl/pinctrl-starfive-jh7100.h
>
> -STARFIVE JH7100 RESET CONTROLLER DRIVER
> +STARFIVE JH7100 RESET CONTROLLER DRIVERS
>  M:     Emil Renner Berthing <kernel@esmil.dk>
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> -F:     drivers/reset/reset-starfive-jh7100.c
> +F:     drivers/reset/starfive/

When this entry covers all StarFive reset drivers the header should
also match. Eg.
STARFIVE RESET CONTROLLER DRIVERS

>  F:     include/dt-bindings/reset/starfive-jh7100.h
>
>  STATIC BRANCH/CALL
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index de176c2fbad9..1e8e1c4954cd 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -232,13 +232,6 @@ config RESET_SOCFPGA
>           This enables the reset driver for the SoCFPGA ARMv7 platforms. This
>           driver gets initialized early during platform init calls.
>
> -config RESET_STARFIVE_JH7100
> -       bool "StarFive JH7100 Reset Driver"
> -       depends on SOC_STARFIVE || COMPILE_TEST
> -       default SOC_STARFIVE
> -       help
> -         This enables the reset controller driver for the StarFive JH7100 SoC.
> -
>  config RESET_SUNPLUS
>         bool "Sunplus SoCs Reset Driver" if COMPILE_TEST
>         default ARCH_SUNPLUS
> @@ -320,6 +313,7 @@ config RESET_ZYNQ
>         help
>           This enables the reset controller driver for Xilinx Zynq SoCs.
>
> +source "drivers/reset/starfive/Kconfig"
>  source "drivers/reset/sti/Kconfig"
>  source "drivers/reset/hisilicon/Kconfig"
>  source "drivers/reset/tegra/Kconfig"
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 3e7e5fd633a8..fee17a0e3a16 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-y += core.o
>  obj-y += hisilicon/
> +obj-$(CONFIG_SOC_STARFIVE) += starfive/
>  obj-$(CONFIG_ARCH_STI) += sti/
>  obj-$(CONFIG_ARCH_TEGRA) += tegra/
>  obj-$(CONFIG_RESET_A10SR) += reset-a10sr.o
> @@ -30,7 +31,6 @@ obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) += reset-rzg2l-usbphy-ctrl.o
>  obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
>  obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
>  obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
> -obj-$(CONFIG_RESET_STARFIVE_JH7100) += reset-starfive-jh7100.o
>  obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
>  obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
>  obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
> diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
> new file mode 100644
> index 000000000000..cddebdba7177
> --- /dev/null
> +++ b/drivers/reset/starfive/Kconfig
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config RESET_STARFIVE_JH7100
> +       bool "StarFive JH7100 Reset Driver"
> +       depends on SOC_STARFIVE || COMPILE_TEST
> +       default SOC_STARFIVE
> +       help
> +         This enables the reset controller driver for the StarFive JH7100 SoC.
> diff --git a/drivers/reset/starfive/Makefile b/drivers/reset/starfive/Makefile
> new file mode 100644
> index 000000000000..670d049423f5
> --- /dev/null
> +++ b/drivers/reset/starfive/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_RESET_STARFIVE_JH7100)            += reset-starfive-jh7100.o
> diff --git a/drivers/reset/reset-starfive-jh7100.c b/drivers/reset/starfive/reset-starfive-jh7100.c
> similarity index 100%
> rename from drivers/reset/reset-starfive-jh7100.c
> rename to drivers/reset/starfive/reset-starfive-jh7100.c
> --
> 2.38.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
