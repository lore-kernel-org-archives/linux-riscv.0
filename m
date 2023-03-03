Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82602C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iAK8sdhHzs29iIjEjREifCXtHkC6IX4vRlJoSzNMpEY=; b=ZDUQH6RcrGBKSR
	+1IDtpFlwmZaKqLONmQ8iuWkgrznwL0OAfSfK3fOJGOvS3Jmr0WM1RRTSixgC8+JCcGWghCAfxOhw
	zwCoP6tD1fznvCapXc4PnKOi5hJkPE737YYZ0colqcKlobK17gEEVAAwotuRs62mmQveENWjEQuBr
	+eOq8MM4Z7IzZ5tZ+K9k1w3py/B0E+sR1j1y9Woc/wL6hTEQek9wlGaWLGpjF8UIRR790ZnBwoVm/
	7z5Ud2tli+ETbk9DQwsFuxhD/83CaAycRxamdH2le7ikkXmGXCOM6nlUjGPmtlVHlUk1DLFs8J1mL
	QlU6PpbGpQGUqcIhFjEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5jK-006W2J-1f; Fri, 03 Mar 2023 13:45:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5jI-006W0t-0J
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vCUwgnXLxyg9qDht5YTmjyoMI+qrHGKVL555AkmUbTA=; b=Efwk7DEyDhBlquVRzWAwkICeKt
	VieoX5LuR9BCQ7fYtC9WUXyKAcRA+ZZJED2ALmnZ/95OZ/rnGy8S9ece/GekoeLekctkMicI6HYuw
	TYWH8uKF09RQeQmg9ElKO+91i+vUul/XMrqh/LqcdoqTzuys4oD4MzuwjgM4jhBWUCQQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pY5jE-006OAo-EP; Fri, 03 Mar 2023 14:45:44 +0100
Date: Fri, 3 Mar 2023 14:45:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Samin Guo <samin.guo@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Subject: Re: [PATCH v5 05/12] riscv: dts: starfive: jh7110: Add ethernet
 device nodes
Message-ID: <ZAH6CGoXBKz0FmW3@lunn.ch>
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
 <20230303085928.4535-6-samin.guo@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303085928.4535-6-samin.guo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_054548_102406_DB91D922 
X-CRM114-Status: UNSURE (   7.63  )
X-CRM114-Notice: Please train this message.
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

> +		gmac0: ethernet@16030000 {
> +			compatible = "starfive,jh7110-dwmac", "snps,dwmac-5.20";
> +			reg = <0x0 0x16030000 0x0 0x10000>;
> +			clocks = <&aoncrg JH7110_AONCLK_GMAC0_AXI>,
> +				 <&aoncrg JH7110_AONCLK_GMAC0_AHB>,
> +				 <&syscrg JH7110_SYSCLK_GMAC0_PTP>,
> +				 <&aoncrg JH7110_AONCLK_GMAC0_TX_INV>,
> +				 <&syscrg JH7110_SYSCLK_GMAC0_GTXC>;
> +			clock-names = "stmmaceth", "pclk", "ptp_ref",
> +				      "tx", "gtx";
> +			resets = <&aoncrg JH7110_AONRST_GMAC0_AXI>,
> +				 <&aoncrg JH7110_AONRST_GMAC0_AHB>;
> +			reset-names = "stmmaceth", "ahb";
> +			interrupts = <7>, <6>, <5>;
> +			interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
> +			phy-mode = "rgmii-id";

phy-mode is a board property, not a SoC property. It should be in the
board .dts file, not the SoC .dtsi file.

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
> +			snps,txpbl = <16>;
> +			snps,rxpbl = <16>;
> +			status = "disabled";
> +			phy-handle = <&phy0>;

The PHY is external, so this is also a board property, not a SoC
property. 

> +
> +			mdio {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "snps,dwmac-mdio";
> +
> +				phy0: ethernet-phy@0 {
> +					reg = <0>;
> +				};

The PHY is also a board property. You could for example design a board
where both PHYs are on one MDIO bus, in order to save two SoC pins.

      Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
