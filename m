Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655B2C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 16:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaF5Z8ANFQD+vn1y1GX/el3k59GKYYNtE7jCOLYHBAY=; b=pyPzsR8YxV0XtY
	hCvRNqARMmGxxyOMZZ0GKf7EutGBxiOVGdrUSzcdyNvRK1eZYUABhouP05gxfadv/TNmiNNej7z1E
	nM5nM8IR4eiKuMDFwJQF2Udf6ehaqml5XsZSGkjKTfuGBt/ev7kA+TWGncw4Vm4s12eu0hCPflMs0
	Xb/RH5OGcSudnXs82/kus+Jlrzdst5FzQtiT/9m302FD1Si+P2LNIXGCLV5VugEjopPOOiKIV4S30
	UZSHK1MVGjHJJv+KpiAl90MH6Z43iLx8kMRgQSxxeDCEVkfz6qPt9IRqHFPJApGreUzdo1tiSwMrv
	8EpU7YScrVJrwHOFP/TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow4Y9-005V01-OP; Fri, 18 Nov 2022 16:49:09 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow4Wk-005TtP-KK
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 16:47:44 +0000
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4E17D3F12E
	for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 16:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1668790059;
	bh=bqUmREpKqp419mokmhm4Yfd6ZwVhvAs8FgLzRjDgzu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=IgxmfyKlG3D42S3z4rPELgYAPSRJyG6yGBGS5MFcLwSi+YyDfFlaT9+3SvSARD2IH
	 evsQrHA3oyySt6W0QcaR3NPRxXyrX5V0UMvmBUFHryVmLO2bc19+YMuq1j9+eS6N2r
	 aGX0CpE4cauKhZz8oJ/Jz/A3x6RVCuDmGOhUZt4cf6Bmc7nK/sff60fO0bgxqI2Cs0
	 AiYXmIsOYQIz3LKUhI1l5Whm0fPsQxBhOXU/aGWEBqGpl1NAwRWk/nGeiXtBeZlm55
	 s0Pe0+YKVzJEzQNUq7U4Ubb2q6C8+bWdSZOSWxxhDWb855RX3LWRWSDsypZVvmbQDN
	 XA+rXzcmBYadg==
Received: by mail-yb1-f199.google.com with SMTP id h67-20020a252146000000b006ccc4702068so4946863ybh.12
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 08:47:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bqUmREpKqp419mokmhm4Yfd6ZwVhvAs8FgLzRjDgzu8=;
        b=PL882G8wlCLjHruRsCo9ntHG5oDxO8/8i5qqpg5oX+mrFYNFddZUPU0PTnmYc4Kecc
         pMnMga6VHqLxGISax9mKpM0yisLfLfoSS/3NncM77paM3waLELVf0xk7q9vs4YFp3Jya
         FRhIkrPdlXN06LmRgnkNen/61/A4Y47Y0owSYYvgNE2mwX2qS/yngMxPmnCdyYBPF1cz
         s6IfBY7CSMgaevSiqVHBfDyBplmWvM4RTRgZaAHdMWQTmJ6/EKBcPgWk+VdaENqMZOcg
         O4uAYYl8cC4ZB4tet9h9GfLdRuWlEsMif/V8ZDFPv2QE0N8zGAkGaeBp/XxBUQFyMLue
         xLnQ==
X-Gm-Message-State: ANoB5pnxILh0wvaH5kyZbUlAIgPtgK99ZmE7QD/ddhG3vgOg0i5S7n01
	olxxBmWwmI3H+IVc/nnNjhMUepIJfhzH3vDIpikM19vxmotXH8lc0TMunDmieh0Fcez3EsXTFzA
	KB6UP1+VyvLJoUk7Raq8S42fP1SBALoBB87jUwYuW8ijFeMt5jPpFh6uStPZ7hw==
X-Received: by 2002:a25:7492:0:b0:6d3:6341:2cb2 with SMTP id p140-20020a257492000000b006d363412cb2mr7432017ybc.551.1668790058341;
        Fri, 18 Nov 2022 08:47:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Zd4kEY4nMPFhuKdN3ImmQqdGWeYpHUC0cuxx5m60Am9dqXXSjTEpe/WBI+epfWbWIt8gub/Cr3c45ZoldbuQ=
X-Received: by 2002:a25:7492:0:b0:6d3:6341:2cb2 with SMTP id
 p140-20020a257492000000b006d363412cb2mr7432003ybc.551.1668790058111; Fri, 18
 Nov 2022 08:47:38 -0800 (PST)
MIME-Version: 1.0
References: <20221118010627.70576-1-hal.feng@starfivetech.com> <20221118010627.70576-9-hal.feng@starfivetech.com>
In-Reply-To: <20221118010627.70576-9-hal.feng@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 18 Nov 2022 17:47:21 +0100
Message-ID: <CAJM55Z80xyve9JHXT__E2FfsLUH5njmj75Wj8B3H81dxp9Zh-w@mail.gmail.com>
Subject: Re: [PATCH v2 08/14] dt-bindings: reset: Add StarFive JH7110 system
 and always-on reset definitions
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_084742_864855_CD6C0D99 
X-CRM114-Status: GOOD (  18.96  )
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
> Add resets for the StarFive JH7110 system (SYS) and always-on (AON)
> reset controller.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  MAINTAINERS                                 |   5 +-
>  include/dt-bindings/reset/starfive-jh7110.h | 154 ++++++++++++++++++++
>  2 files changed, 157 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/reset/starfive-jh7110.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e97dac9c0ee4..eeab26f5597c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19614,12 +19614,13 @@ F:    Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
>  F:     drivers/pinctrl/starfive/
>  F:     include/dt-bindings/pinctrl/pinctrl-starfive-jh7100.h
>
> -STARFIVE JH7100 RESET CONTROLLER DRIVERS
> +STARFIVE RESET CONTROLLER DRIVERS
>  M:     Emil Renner Berthing <kernel@esmil.dk>
> +M:     Hal Feng <hal.feng@starfivetech.com>
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
>  F:     drivers/reset/starfive/
> -F:     include/dt-bindings/reset/starfive-jh7100.h
> +F:     include/dt-bindings/reset/starfive*
>
>  STATIC BRANCH/CALL
>  M:     Peter Zijlstra <peterz@infradead.org>
> diff --git a/include/dt-bindings/reset/starfive-jh7110.h b/include/dt-bindings/reset/starfive-jh7110.h
> new file mode 100644
> index 000000000000..1a5bab671161
> --- /dev/null
> +++ b/include/dt-bindings/reset/starfive-jh7110.h
> @@ -0,0 +1,154 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/*
> + * Copyright (C) 2021-2022 Emil Renner Berthing <kernel@esmil.dk>

I'm not sure how this ended up here, but I definitely didn't start
working on this before 2022.

> + */
> +
> +#ifndef __DT_BINDINGS_RESET_STARFIVE_JH7110_H__
> +#define __DT_BINDINGS_RESET_STARFIVE_JH7110_H__
> +
> +/* SYSCRG resets */
> +#define JH7110_SYSRST_JTAG2APB                 0
> +#define JH7110_SYSRST_SYSCON                   1
> +#define JH7110_SYSRST_IOMUX                    2
> +#define JH7110_SYSRST_BUS                      3
> +#define JH7110_SYSRST_DEBUG                    4
> +#define JH7110_SYSRST_CORE0                    5
> +#define JH7110_SYSRST_CORE1                    6
> +#define JH7110_SYSRST_CORE2                    7
> +#define JH7110_SYSRST_CORE3                    8
> +#define JH7110_SYSRST_CORE4                    9
> +#define JH7110_SYSRST_CORE0_ST                 10
> +#define JH7110_SYSRST_CORE1_ST                 11
> +#define JH7110_SYSRST_CORE2_ST                 12
> +#define JH7110_SYSRST_CORE3_ST                 13
> +#define JH7110_SYSRST_CORE4_ST                 14
> +#define JH7110_SYSRST_TRACE0                   15
> +#define JH7110_SYSRST_TRACE1                   16
> +#define JH7110_SYSRST_TRACE2                   17
> +#define JH7110_SYSRST_TRACE3                   18
> +#define JH7110_SYSRST_TRACE4                   19
> +#define JH7110_SYSRST_TRACE_COM                        20
> +#define JH7110_SYSRST_GPU_APB                  21
> +#define JH7110_SYSRST_GPU_DOMA                 22
> +#define JH7110_SYSRST_NOC_BUS_APB_BUS          23
> +#define JH7110_SYSRST_NOC_BUS_AXICFG0_AXI      24
> +#define JH7110_SYSRST_NOC_BUS_CPU_AXI          25
> +#define JH7110_SYSRST_NOC_BUS_DISP_AXI         26
> +#define JH7110_SYSRST_NOC_BUS_GPU_AXI          27
> +#define JH7110_SYSRST_NOC_BUS_ISP_AXI          28
> +#define JH7110_SYSRST_NOC_BUS_DDRC             29
> +#define JH7110_SYSRST_NOC_BUS_STG_AXI          30
> +#define JH7110_SYSRST_NOC_BUS_VDEC_AXI         31
> +
> +#define JH7110_SYSRST_NOC_BUS_VENC_AXI         32
> +#define JH7110_SYSRST_AXI_CFG1_DEC_AHB         33
> +#define JH7110_SYSRST_AXI_CFG1_DEC_MAIN                34
> +#define JH7110_SYSRST_AXI_CFG0_DEC_MAIN                35
> +#define JH7110_SYSRST_AXI_CFG0_DEC_MAIN_DIV    36
> +#define JH7110_SYSRST_AXI_CFG0_DEC_HIFI4       37
> +#define JH7110_SYSRST_DDR_AXI                  38
> +#define JH7110_SYSRST_DDR_OSC                  39
> +#define JH7110_SYSRST_DDR_APB                  40
> +#define JH7110_SYSRST_DOM_ISP_TOP_N            41
> +#define JH7110_SYSRST_DOM_ISP_TOP_AXI          42
> +#define JH7110_SYSRST_DOM_VOUT_TOP_SRC         43
> +#define JH7110_SYSRST_CODAJ12_AXI              44
> +#define JH7110_SYSRST_CODAJ12_CORE             45
> +#define JH7110_SYSRST_CODAJ12_APB              46
> +#define JH7110_SYSRST_WAVE511_AXI              47
> +#define JH7110_SYSRST_WAVE511_BPU              48
> +#define JH7110_SYSRST_WAVE511_VCE              49
> +#define JH7110_SYSRST_WAVE511_APB              50
> +#define JH7110_SYSRST_VDEC_JPG_ARB_JPG         51
> +#define JH7110_SYSRST_VDEC_JPG_ARB_MAIN                52
> +#define JH7110_SYSRST_AXIMEM0_AXI              53
> +#define JH7110_SYSRST_WAVE420L_AXI             54
> +#define JH7110_SYSRST_WAVE420L_BPU             55
> +#define JH7110_SYSRST_WAVE420L_VCE             56
> +#define JH7110_SYSRST_WAVE420L_APB             57
> +#define JH7110_SYSRST_AXIMEM1_AXI              58
> +#define JH7110_SYSRST_AXIMEM2_AXI              59
> +#define JH7110_SYSRST_INTMEM                   60
> +#define JH7110_SYSRST_QSPI_AHB                 61
> +#define JH7110_SYSRST_QSPI_APB                 62
> +#define JH7110_SYSRST_QSPI_REF                 63
> +
> +#define JH7110_SYSRST_SDIO0_AHB                        64
> +#define JH7110_SYSRST_SDIO1_AHB                        65
> +#define JH7110_SYSRST_GMAC1_AXI                        66
> +#define JH7110_SYSRST_GMAC1_AHB                        67
> +#define JH7110_SYSRST_MAILBOX                  68
> +#define JH7110_SYSRST_SPI0_APB                 69
> +#define JH7110_SYSRST_SPI1_APB                 70
> +#define JH7110_SYSRST_SPI2_APB                 71
> +#define JH7110_SYSRST_SPI3_APB                 72
> +#define JH7110_SYSRST_SPI4_APB                 73
> +#define JH7110_SYSRST_SPI5_APB                 74
> +#define JH7110_SYSRST_SPI6_APB                 75
> +#define JH7110_SYSRST_I2C0_APB                 76
> +#define JH7110_SYSRST_I2C1_APB                 77
> +#define JH7110_SYSRST_I2C2_APB                 78
> +#define JH7110_SYSRST_I2C3_APB                 79
> +#define JH7110_SYSRST_I2C4_APB                 80
> +#define JH7110_SYSRST_I2C5_APB                 81
> +#define JH7110_SYSRST_I2C6_APB                 82
> +#define JH7110_SYSRST_UART0_APB                        83
> +#define JH7110_SYSRST_UART0_CORE               84
> +#define JH7110_SYSRST_UART1_APB                        85
> +#define JH7110_SYSRST_UART1_CORE               86
> +#define JH7110_SYSRST_UART2_APB                        87
> +#define JH7110_SYSRST_UART2_CORE               88
> +#define JH7110_SYSRST_UART3_APB                        89
> +#define JH7110_SYSRST_UART3_CORE               90
> +#define JH7110_SYSRST_UART4_APB                        91
> +#define JH7110_SYSRST_UART4_CORE               92
> +#define JH7110_SYSRST_UART5_APB                        93
> +#define JH7110_SYSRST_UART5_CORE               94
> +#define JH7110_SYSRST_SPDIF_APB                        95
> +
> +#define JH7110_SYSRST_PWMDAC_APB               96
> +#define JH7110_SYSRST_PDM_DMIC                 97
> +#define JH7110_SYSRST_PDM_APB                  98
> +#define JH7110_SYSRST_I2SRX_APB                        99
> +#define JH7110_SYSRST_I2SRX_BCLK               100
> +#define JH7110_SYSRST_I2STX0_APB               101
> +#define JH7110_SYSRST_I2STX0_BCLK              102
> +#define JH7110_SYSRST_I2STX1_APB               103
> +#define JH7110_SYSRST_I2STX1_BCLK              104
> +#define JH7110_SYSRST_TDM_AHB                  105
> +#define JH7110_SYSRST_TDM_CORE                 106
> +#define JH7110_SYSRST_TDM_APB                  107
> +#define JH7110_SYSRST_PWM_APB                  108
> +#define JH7110_SYSRST_WDT_APB                  109
> +#define JH7110_SYSRST_WDT_CORE                 110
> +#define JH7110_SYSRST_CAN0_APB                 111
> +#define JH7110_SYSRST_CAN0_CORE                        112
> +#define JH7110_SYSRST_CAN0_TIMER               113
> +#define JH7110_SYSRST_CAN1_APB                 114
> +#define JH7110_SYSRST_CAN1_CORE                        115
> +#define JH7110_SYSRST_CAN1_TIMER               116
> +#define JH7110_SYSRST_TIMER_APB                        117
> +#define JH7110_SYSRST_TIMER0                   118
> +#define JH7110_SYSRST_TIMER1                   119
> +#define JH7110_SYSRST_TIMER2                   120
> +#define JH7110_SYSRST_TIMER3                   121
> +#define JH7110_SYSRST_INT_CTRL_APB             122
> +#define JH7110_SYSRST_TEMP_APB                 123
> +#define JH7110_SYSRST_TEMP_CORE                        124
> +#define JH7110_SYSRST_JTAG_CERTIFICATION       125
> +
> +#define        JH7110_SYSRST_END                       126
> +
> +/* AONCRG resets */
> +#define JH7110_AONRST_GMAC0_AXI                        0
> +#define JH7110_AONRST_GMAC0_AHB                        1
> +#define JH7110_AONRST_AON_IOMUX                        2
> +#define JH7110_AONRST_PMU_APB                  3
> +#define JH7110_AONRST_PMU_WKUP                 4
> +#define JH7110_AONRST_RTC_APB                  5
> +#define JH7110_AONRST_RTC_CAL                  6
> +#define JH7110_AONRST_RTC_32K                  7
> +
> +#define        JH7110_AONRST_END                       8
> +
> +#endif /* __DT_BINDINGS_RESET_STARFIVE_JH7110_H__ */
> --
> 2.38.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
