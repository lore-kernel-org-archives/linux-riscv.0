Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB72CDE031
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 18:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXdzXL77WhkvH6s7SSwVvlxHasUHBuv/qNJiH3g7RTI=; b=cF0hxj2xMi9bhM
	0l71kNjK0AFenHdTn/JpUkbod2jvStt96wnSDVzi9RRDmiKTvMreLIT0IH95F6VgLSc5u3RMa8d6O
	GAUSze3Jj+N0XJH1FyvR5hwbe4nJI1lTk/ce22/gEO8AOAJBOuRys8tAz1dztKXngCrVnrrv1sq+w
	BkNg1p8ZwMPYei09bihYX6JkHcmWYXOqVowwOjPiR8wuv9kjFziZGoXRzLVos+AJcU+OASiMBhuqF
	SKU/ODkCrDaVkFLFgTGhwouT+p2y4w94O/bWxgYR2Rj6r3uJ3zWGNaXmGTnx5c+oKsVCpArqC+QAs
	8d69T3jxwAau/IDGg8zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sttQG-000000099Wb-2kpQ;
	Thu, 26 Sep 2024 18:41:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sttP3-000000099In-3FTw;
	Thu, 26 Sep 2024 18:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=V66/Bzro1T7ZAB1kueHnp/otNZSlwdgDsCDAFqLRcQI=; b=OGsInAtYTpLNQkj5oDDqLHUSxY
	XnQcY0X4AOCqhw5hWiFERR84HjQGRI0gwC/gPPAJFGjvbv+jN9myx4y2yZiRpaOoLmIscbSS5Q9K1
	ekiMGkVkjpBraCLyC7+1XqS/lt7IpPByCNxXz2C2wOVcOhbWV8WkTk7xrZdlwlnKMILE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sttOj-008P8u-4T; Thu, 26 Sep 2024 20:39:29 +0200
Date: Thu, 26 Sep 2024 20:39:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] riscv: dts: thead: Add TH1520 ethernet nodes
Message-ID: <3e26f580-bc5d-448e-b5bd-9b607c33702b@lunn.ch>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_113949_835677_64D21FE4 
X-CRM114-Status: UNSURE (   8.16  )
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

> +&mdio0 {
> +	phy0: ethernet-phy@1 {
> +		reg = <1>;
> +	};
> +
> +	phy1: ethernet-phy@2 {
> +		reg = <2>;
> +	};
> +};

Two PHYs on one bus...

> +		gmac1: ethernet@ffe7060000 {
> +			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
> +			reg = <0xff 0xe7060000 0x0 0x2000>, <0xff 0xec004000 0x0 0x1000>;
> +			reg-names = "dwmac", "apb";
> +			interrupts = <67 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC_AXI>;
> +			clock-names = "stmmaceth", "pclk";
> +			snps,pbl = <32>;
> +			snps,fixed-burst;
> +			snps,multicast-filter-bins = <64>;
> +			snps,perfect-filter-entries = <32>;
> +			snps,axi-config = <&stmmac_axi_config>;
> +			status = "disabled";
> +
> +			mdio1: mdio {
> +				compatible = "snps,dwmac-mdio";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		gmac0: ethernet@ffe7070000 {
> +			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
> +			reg = <0xff 0xe7070000 0x0 0x2000>, <0xff 0xec003000 0x0 0x1000>;
> +			reg-names = "dwmac", "apb";
> +			interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC_AXI>;

And the MACs are listed in opposite order. Does gmac1 probe first,
find the PHY does not exist, and return -EPROBE_DEFER. Then gmac0
probes successfully, and then sometime later gmac1 then reprobes?

I know it is normal to list nodes in address order, but you might be
able to avoid the EPROBE_DEFER if you reverse the order.

     Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
