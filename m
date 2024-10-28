Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A429D1039A
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 13:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/9l44SE1aYiyLDLvjW/3DqA8FgoHyeLsf5+9YxKnU40=; b=vR1vC4bO1Vk6zY
	iKgzSQP1t5gl8APg+0yenD1+guNU0RBiyi/3g88KzUARaaS9iu01THfjhEzHqPFB7m2ZabDMGf/Ny
	dcS+fKxD3V/NM5OATpDXbZX3B+8CqJUis/P5iF5xeW7VrcqsT/EOSEM/sF3fXax8kU8DquKQwALjN
	XPe2ORklZ9HLtG1a9Z+lfmImvRefZL1O8zZvAsz+vzg32GrmG2XoL/3TfO3ndM1SJJTfu4PqzxOCC
	HMkFouhxeCib554PS9woY9VYKyybbxVLfE47Q110/B/sqouFRPyTDI/FFqVxhNDKL8KdzFzvJQHHQ
	TJbF7lsg4XnMWIPOq0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5PUs-0000000At31-0Uew;
	Mon, 28 Oct 2024 13:09:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5PUo-0000000At2b-3A66
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 13:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=M4yLqeOrbHH4FmbActu2ScliDa0zYtrRnOaaCWz9Ck0=; b=Ja+JEpjXk2hNrYyTd9R5/iNCD7
	17R4I5fL/ZTQmfp+sgxAIXw7l7HhaJSm34OjKTFJPs3SaPFZW+ROI1PG5AbXEJqTw4I7xdbz0D277
	/7/IrEd6PQaOd3Cl8v1033LbymjkxiMGk5hx7EefLgfbalSt1/uORcRQpA6NHgpS+G34=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t5PUY-00BRq4-28; Mon, 28 Oct 2024 14:09:06 +0100
Date: Mon, 28 Oct 2024 14:09:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Liu Gui <kenneth.liu@sophgo.com>, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: Add ethernet configuration for cv18xx
Message-ID: <87e215a7-0b27-4336-9f9c-e63ade0772ef@lunn.ch>
References: <20241028011312.274938-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241028011312.274938-1-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_060922_815509_9E3E5E37 
X-CRM114-Status: UNSURE (   8.63  )
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

> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -210,6 +210,55 @@ i2c4: i2c@4040000 {
>  			status = "disabled";
>  		};
>  
> +		gmac0: ethernet@4070000 {
> +			compatible = "snps,dwmac-3.70a";
> +			reg = <0x04070000 0x10000>;
> +			clocks = <&clk CLK_AXI4_ETH0>, <&clk CLK_ETH0_500M>;
> +			clock-names = "stmmaceth", "ptp_ref";
> +			interrupts = <31 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +			phy-handle = <&phy0>;
> +			phy-mode = "rmii";
> +			rx-fifo-depth = <8192>;
> +			tx-fifo-depth = <8192>;
> +			snps,multicast-filter-bins = <0>;
> +			snps,perfect-filter-entries = <1>;
> +			snps,aal;
> +			snps,txpbl = <8>;
> +			snps,rxpbl = <8>;
> +			snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
> +			snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
> +			snps,axi-config = <&gmac0_stmmac_axi_setup>;
> +			status = "disabled";
> +
> +			mdio {
> +				compatible = "snps,dwmac-mdio";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				phy0: phy@0 {
> +					compatible = "ethernet-phy-ieee802.3-c22";
> +					reg = <0>;
> +				};
> +			};

It is not clear to me what cv18xx.dtsi represents, and where the PHY
node should be, here, or in a .dts file. Is this a SOM, and the PHY is
on the SOM? 

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
