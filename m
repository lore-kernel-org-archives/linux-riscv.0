Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2646ED4A5FB
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 04:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksn82DlW5TIsz7lm5zQ4IIgEzk4wwvC6NIf8b3adnZY=; b=ySPlF092FaNmjM
	+s/MK39tSAqjwn49YYhN1/TI0LwYY3tZzojLAKR7QLVoPJpjSCck7pFSJH+IZhpIM0xyGMkdjSjcW
	yEPxo1qlegsLF6QTq4g+Q4Dz1PSkdy5JcMmR+IWl5BFB0aADFm/ohFf2Unwd0qs1kJGjGh7qe4gDW
	OX7NYXhLoiFjzCSxMtRbBQ/wHvlbbf9iNIB6aDeguywBgLGs4NmRXLPrco2/0BJWitNFcpHfIQSx9
	JoJBnZe2AN5mOYjMyQBbtCV/DWM5EYlqlS6n3ipIq+LGdIcO8KaAORTfZaysSEVKLg8En0KPpNbXj
	5AG3lGg7I4DTk/9xWs7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgb3d-0000000DYTb-05bu;
	Fri, 16 Jan 2026 04:03:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgb3b-0000000DYTV-1plG
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 04:03:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4070760160;
	Fri, 16 Jan 2026 04:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C623AC116C6;
	Fri, 16 Jan 2026 04:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768536209;
	bh=MvrK9/uXo8OFSpEzQ6EcGyw/fKZ3gWpMYC2KQfolEyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TE7SYle5eb62VsC6/7OpRUdRsmALY5NTQpe1m9JEtX4JXMSob+UeCBYSUqdxnUTU4
	 q9vSVFSoW9HQ2C5AUNdQue+z3YA14GuR0gS9eutRd0lADwDry9Jn2vALJqsQWR5V+3
	 78KWaldyz5rfGDtSUoqVFAbzMHeLpZZqj3u7+FbDj1lF1WknbgqDX6dDJ/PD/7FyLX
	 jM+1d2NHVGyhae6A0Xf2xXH1dJR2QsGRPpcR3y9ngBa8LGwJ2bt0tnq/sHe2FQet/2
	 iGlYibLWBa9/JtPVtyRoYL65IjqSLvzqcLg0OTmoXn61D7s1F2ZHSJSsrtRiKo0vFk
	 ydPqeRy3lIkgw==
Date: Thu, 15 Jan 2026 22:03:29 -0600
From: Rob Herring <robh@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, fustini@kernel.org, mpe@kernel.org,
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com,
	agross@kernel.org, agross@oss.tenstorrent.com
Subject: Re: [PATCH 1/8] dt-bindings: soc: tenstorrent: Add
 tenstorrent,atlantis-syscon
Message-ID: <20260116040329.GA1375823-robh@kernel.org>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-1-7356e671f28b@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115-atlantis-clocks-v1-1-7356e671f28b@oss.tenstorrent.com>
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

On Thu, Jan 15, 2026 at 05:42:00PM -0600, Anirudh Srinivasan wrote:
> Document bindings for Tenstorrent Atlantis syscon that manages clocks
> and resets. This syscon block is instantiated 4 times in the SoC.
> This commit documents the clocks from the RCPU syscon block.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  .../tenstorrent/tenstorrent,atlantis-syscon.yaml   | 58 +++++++++++++++++++

Filename should match compatible.

>  MAINTAINERS                                        |  2 +
>  .../clock/tenstorrent,atlantis-syscon.h            | 67 ++++++++++++++++++++++
>  3 files changed, 127 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
> new file mode 100644
> index 000000000000..3915d78dfeda
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tenstorrent Atlantis SoC System Controller
> +
> +maintainers:
> +  - Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> +
> +description:
> +  System controller found in Tenstorrent Atlantis SoC, which is capable of
> +  clock and reset functions.
> +
> +  RCPU syscon controls clocks and resets for low speed IO interfaces on chip
> +
> +properties:
> +  compatible:
> +    enum:
> +      - tenstorrent,atlantis-syscon-rcpu

If "RCPU" is what the h/w block is called and sufficient to identify it, 
then drop the "syscon-" part.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/tenstorrent,atlantis-syscon.h> for valid indices.

Be consistent with the compatible string for the file name.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clocks {
> +      osc_24m: clock-24m {
> +        compatible = "fixed-clock";
> +        clock-frequency = <24000000>;
> +        clock-output-names = "osc_24m";
> +        #clock-cells = <0>;
> +      };
> +    };

Drop this node. Not relevant to the example.

> +
> +    syscon_rcpu: system-controller@a8000000 {
> +      compatible = "tenstorrent,atlantis-sycon-rcpu";
> +      reg = <0x0 0xa8000000 0x0 0x10000>;
> +      clocks = <&osc_24m>;
> +      #clock-cells = <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dc731d37c8fe..19a98b1fa456 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22535,7 +22535,9 @@ L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  T:	git https://github.com/tenstorrent/linux.git
>  F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
> +F:	Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
>  F:	arch/riscv/boot/dts/tenstorrent/
> +F:	include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
>  
>  RISC-V THEAD SoC SUPPORT
>  M:	Drew Fustini <fustini@kernel.org>
> diff --git a/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h b/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
> new file mode 100644
> index 000000000000..a8518319642a
> --- /dev/null
> +++ b/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2026 Tenstorrent
> + */
> +
> +#ifndef _DT_BINDINGS_ATLANTIS_SYSCON_H
> +#define _DT_BINDINGS_ATLANTIS_SYSCON_H
> +
> +/*
> + * RCPU Domain Clock IDs
> + */
> +#define CLK_RCPU_PLL 0
> +#define CLK_RCPU_ROOT 1
> +#define CLK_RCPU_DIV2 2
> +#define CLK_RCPU_DIV4 3
> +#define CLK_RCPU_RTC 4
> +#define CLK_SMNDMA0_ACLK 5
> +#define CLK_SMNDMA1_ACLK 6
> +#define CLK_WDT0_PCLK 7
> +#define CLK_WDT1_PCLK 8
> +#define CLK_TIMER_PCLK 9
> +#define CLK_PVTC_PCLK 10
> +#define CLK_PMU_PCLK 11
> +#define CLK_MAILBOX_HCLK 12
> +#define CLK_SEC_SPACC_HCLK 13
> +#define CLK_SEC_OTP_HCLK 14
> +#define CLK_TRNG_PCLK 15
> +#define CLK_SEC_CRC_HCLK 16
> +#define CLK_SMN_HCLK 17
> +#define CLK_AHB0_HCLK 18
> +#define CLK_SMN_PCLK 19
> +#define CLK_SMN_CLK 20
> +#define CLK_SCRATCHPAD_CLK 21
> +#define CLK_RCPU_CORE_CLK 22
> +#define CLK_RCPU_ROM_CLK 23
> +#define CLK_OTP_LOAD_CLK 24
> +#define CLK_NOC_PLL 25
> +#define CLK_NOCC_CLK 26
> +#define CLK_NOCC_DIV2 27
> +#define CLK_NOCC_DIV4 28
> +#define CLK_NOCC_RTC 29
> +#define CLK_NOCC_CAN 30
> +#define CLK_QSPI_SCLK 31
> +#define CLK_QSPI_HCLK 32
> +#define CLK_I2C0_PCLK 33
> +#define CLK_I2C1_PCLK 34
> +#define CLK_I2C2_PCLK 35
> +#define CLK_I2C3_PCLK 36
> +#define CLK_I2C4_PCLK 37
> +#define CLK_UART0_PCLK 38
> +#define CLK_UART1_PCLK 39
> +#define CLK_UART2_PCLK 40
> +#define CLK_UART3_PCLK 41
> +#define CLK_UART4_PCLK 42
> +#define CLK_SPI0_PCLK 43
> +#define CLK_SPI1_PCLK 44
> +#define CLK_SPI2_PCLK 45
> +#define CLK_SPI3_PCLK 46
> +#define CLK_GPIO_PCLK 47
> +#define CLK_CAN0_HCLK 48
> +#define CLK_CAN0_CLK 49
> +#define CLK_CAN1_HCLK 50
> +#define CLK_CAN1_CLK 51
> +#define CLK_CAN0_TIMER_CLK 52
> +#define CLK_CAN1_TIMER_CLK 53
> +
> +#endif /* _DT_BINDINGS_ATLANTIS_SYSCON_H */
> 
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
