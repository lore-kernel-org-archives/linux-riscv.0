Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DC6C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 17:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oyKkat9a6mR25qVsF4nxjNXbHmvNkVDJaGXyhdNC9C8=; b=KdplBjhxByxKDd
	bLE9uA4tyXBK135b6jhKHFgIt9y1iIFPwgFNBlbOPQL7noADIab2gRV9bfdYBn9vN1AGnhi6hRNS+
	2IEghgrKxK/NxXo661lZdbao2cKtO0gACCI+ziCtFlLXWOk07nysTDo9qpmSxhqjMWBliVJire3S1
	l1nIT/4xvILsH2fqPHFvqqE1p7cyG9UGwzZQLBKDMDLDGkb7EQg219PV1z+htQ7c4NqdJEW+tFT1T
	psOBA0c/xAQDWZTG6bdxIoSqeTb6gQrAIIn3sogk+XKeGkJm/lR7y7hDmdGamHzWtAvWZjHaArx4R
	07/6GzaCj16JsyVXfEeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0nms-009KfG-Jc; Thu, 01 Dec 2022 17:55:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ndB-009AP1-Jk
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 17:45:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D8A53620AB;
	Thu,  1 Dec 2022 17:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1559DC433B5;
	Thu,  1 Dec 2022 17:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669916752;
	bh=diJq5nKrbt92ecplLzYvhikaJNLRnOYzNpmxyjrLq1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IJZZ9Cl/vvp5kYzx9XhdC1nEFqIeiWUf6wKNqyOId3y0wIY3M8frb1c6Hynzh9wM4
	 0Tj67odSTEFxeyKh/stoMFBJlfxoq7wLFYPDqz5PA9iIGMYiSLfXfjLfjNK4X+Clqp
	 2OQL9zx7h9jA4RQViXW+cpfHtyOchkLIw/MCZX+WAdlnWoDiRptnm4Q00N8ZIRR/Nj
	 ZOdkU9WRrXsk0p9lqSNvhhXytHk2q04yDz708B+3Dz9ojde+5d9CXSSnR/1LqHH3Kt
	 GIN+3saySD/4oFnvf9rvS0LzVC+T6oGwccOFJMdGXRwP6xrLiyxHtkAuLwh2jJ3ADQ
	 SMzTEeO0ddbLg==
Date: Thu, 1 Dec 2022 17:45:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v1 6/7] riscv: dts: starfive: jh7110: Add ethernet device
 node
Message-ID: <Y4joSiz0gKvyuecn@spud>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-7-yanhong.wang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221201090242.2381-7-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_094553_770528_82779356 
X-CRM114-Status: GOOD (  16.02  )
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

On Thu, Dec 01, 2022 at 05:02:41PM +0800, Yanhong Wang wrote:
> Add JH7110 ethernet device node to support gmac driver for the JH7110
> RISC-V SoC.
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 80 ++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index c22e8f1d2640..97ed5418d91f 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -433,5 +433,85 @@
>  			reg-shift = <2>;
>  			status = "disabled";
>  		};
> +
> +		stmmac_axi_setup: stmmac-axi-config {
> +			snps,wr_osr_lmt = <4>;
> +			snps,rd_osr_lmt = <4>;
> +			snps,blen = <256 128 64 32 0 0 0>;
> +		};
> +
> +		gmac0: ethernet@16030000 {
> +			compatible = "starfive,dwmac", "snps,dwmac-5.20";
> +			reg = <0x0 0x16030000 0x0 0x10000>;
> +			clocks = <&aoncrg JH7110_AONCLK_GMAC0_AXI>,
> +				 <&aoncrg JH7110_AONCLK_GMAC0_AHB>,
> +				 <&syscrg JH7110_SYSCLK_GMAC0_PTP>,
> +				 <&aoncrg JH7110_AONCLK_GMAC0_TX>,
> +				 <&syscrg JH7110_SYSCLK_GMAC0_GTXC>,
> +				 <&syscrg JH7110_SYSCLK_GMAC0_GTXCLK>;
> +			clock-names = "stmmaceth",
> +					"pclk",
> +					"ptp_ref",
> +					"tx",
> +					"gtxc",
> +					"gtx";

Can you sort this into fewer lines please?

> +			resets = <&aoncrg JH7110_AONRST_GMAC0_AXI>,
> +				 <&aoncrg JH7110_AONRST_GMAC0_AHB>;
> +			reset-names = "stmmaceth", "ahb";
> +			interrupts = <7>, <6>, <5> ;

Please also remove the space before the ;

> +			interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";

The answer is probably "the dw driver needs this" but my OCD really
hates "macirq" vs "eth_wake_irq"..

> +			phy-mode = "rgmii-id";
> +			snps,multicast-filter-bins = <64>;
> +			snps,perfect-filter-entries = <8>;
> +			rx-fifo-depth = <2048>;
> +			tx-fifo-depth = <2048>;
> +			snps,fixed-burst;
> +			snps,no-pbl-x8;
> +			snps,force_thresh_dma_mode;
> +			snps,axi-config = <&stmmac_axi_setup>;
> +			snps,tso;
> +			snps,en-tx-lpi-clockgating;
> +			snps,lpi_en;
> +			snps,txpbl = <16>;
> +			snps,rxpbl = <16>;
> +			status = "disabled";
> +		};
> +
> +		gmac1: ethernet@16040000 {
> +			compatible = "starfive,dwmac", "snps,dwmac-5.20";
> +			reg = <0x0 0x16040000 0x0 0x10000>;
> +			clocks = <&syscrg JH7110_SYSCLK_GMAC1_AXI>,
> +				 <&syscrg JH7110_SYSCLK_GMAC1_AHB>,
> +				 <&syscrg JH7110_SYSCLK_GMAC1_PTP>,
> +				 <&syscrg JH7110_SYSCLK_GMAC1_TX>,
> +				 <&syscrg JH7110_SYSCLK_GMAC1_GTXC>,
> +				 <&syscrg JH7110_SYSCLK_GMAC1_GTXCLK>;
> +			clock-names = "stmmaceth",
> +					"pclk",
> +					"ptp_ref",
> +					"tx",
> +					"gtxc",
> +					"gtx";
> +			resets = <&syscrg JH7110_SYSRST_GMAC1_AXI>,
> +				 <&syscrg JH7110_SYSRST_GMAC1_AHB>;
> +			reset-names = "stmmaceth", "ahb";
> +			interrupts = <78>, <77>, <76> ;

Same comments for this node.

> +			interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
> +			phy-mode = "rgmii-id";
> +			snps,multicast-filter-bins = <64>;
> +			snps,perfect-filter-entries = <8>;
> +			rx-fifo-depth = <2048>;
> +			tx-fifo-depth = <2048>;
> +			snps,fixed-burst;
> +			snps,no-pbl-x8;
> +			snps,force_thresh_dma_mode;
> +			snps,axi-config = <&stmmac_axi_setup>;
> +			snps,tso;
> +			snps,en-tx-lpi-clockgating;
> +			snps,lpi_en;
> +			snps,txpbl = <16>;
> +			snps,rxpbl = <16>;
> +			status = "disabled";
> +		};
>  	};
>  };
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
