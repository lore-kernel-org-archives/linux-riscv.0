Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C67D74958
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHlp44MTs8dfd2rjuMppe0JpN+KEpVwhg2z2cCjoN48=; b=RnAy3WhUFZm2BD
	OUlki0Flp0c+2U6vvda2VbuBt8TKcmOMxVUBRfvQu4ecGIG1ccQ4eGdb1RCk0oBJGU9CufvandKVI
	bwxUaH5zFIGB2O7dbo5uF+CipAxRlzPh+TXZnroCjjfbI2tfDVzjZmip7yggXu42TeXAg2AVgbxch
	KG222IKQcewvjzs6R/3PwFCAa+o99uiQ9LmE5voPBbVnA11PJY9UGE/hyLB4LH4/bPxXdz8OvyP3E
	L0xjBH+r2GxbfNZag6ulGNN2f06t3VF6UqgaFGCMofTXW9+9kDqW727511z2RmUbp51uP5jxCv6/9
	ngb5AUBn+tAYIyvPw0Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Ux9-00000003e7r-49Rr;
	Thu, 31 Oct 2024 13:11:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Ur9-00000003cxD-3WPU
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 13:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3D8AOsFf2lVt9L71mkZVmKIqNbDdk74xgKnAtcWILOc=; b=FRbA/9fi/pVNHzTX7/ZaLC24xA
	alEpwQWuUyVEDaZmSc+lBB9O4PRee3nl6Ud4bE/zBqTnrzb16nHnp2K7Usvs/WjANG/ecjK/5uYbM
	AIcMrYCSguzUmhTFgg/F38+QTMOfdGQX448zKFI3YV9FYtIybDFvbafVXH5KD2Gb8xEc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t6Uql-00Bmpa-82; Thu, 31 Oct 2024 14:04:31 +0100
Date: Thu, 31 Oct 2024 14:04:31 +0100
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
Message-ID: <e389a60d-2fe3-46fd-946c-01dd3a0a0f6f@lunn.ch>
References: <20241028011312.274938-1-inochiama@gmail.com>
 <87e215a7-0b27-4336-9f9c-e63ade0772ef@lunn.ch>
 <wgggariprpp2wczsljy3vw6kp7vhnrifg6soxdgiio2seyctym@4owbzlg3ngum>
 <ftfp2rwkytqmzruogcx66d5qkn4tzrgyjtlz4hdduxhwit3tok@kczgzrjdxx46>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ftfp2rwkytqmzruogcx66d5qkn4tzrgyjtlz4hdduxhwit3tok@kczgzrjdxx46>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_060455_899494_A0A877C4 
X-CRM114-Status: GOOD (  16.77  )
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

> > > > +		gmac0: ethernet@4070000 {
> > > > +			compatible = "snps,dwmac-3.70a";
> > > > +			reg = <0x04070000 0x10000>;
> > > > +			clocks = <&clk CLK_AXI4_ETH0>, <&clk CLK_ETH0_500M>;
> > > > +			clock-names = "stmmaceth", "ptp_ref";
> > > > +			interrupts = <31 IRQ_TYPE_LEVEL_HIGH>;
> > > > +			interrupt-names = "macirq";
> > > > +			phy-handle = <&phy0>;
> > > > +			phy-mode = "rmii";
> > > > +			rx-fifo-depth = <8192>;
> > > > +			tx-fifo-depth = <8192>;
> > > > +			snps,multicast-filter-bins = <0>;
> > > > +			snps,perfect-filter-entries = <1>;
> > > > +			snps,aal;
> > > > +			snps,txpbl = <8>;
> > > > +			snps,rxpbl = <8>;
> > > > +			snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
> > > > +			snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
> > > > +			snps,axi-config = <&gmac0_stmmac_axi_setup>;
> > > > +			status = "disabled";
> > > > +
> > > > +			mdio {
> > > > +				compatible = "snps,dwmac-mdio";
> > > > +				#address-cells = <1>;
> > > > +				#size-cells = <0>;
> > > > +
> > > > +				phy0: phy@0 {
> > > > +					compatible = "ethernet-phy-ieee802.3-c22";
> > > > +					reg = <0>;
> > > > +				};
> > > > +			};
> > > 
> > > It is not clear to me what cv18xx.dtsi represents, 
> > 
> > This is a include file to define common ip for the whole
> > cv18xx series SoCs (cv1800b, cv1812h, sg2000, sg2000).
> > 
> > > and where the PHY node should be, here, or in a .dts file. 
> > > Is this a SOM, and the PHY is on the SOM? 
> > 
> > The phy is on the SoC, it is embedded, and no external phy
> > is supported. So I think the phy node should stay here, not 
> > in the dts file.
> 
> There is a mistake, Some package supports external rmii/mii
> phy. So I will move this phy definition to board specific.

When there is an external PHY, does the internal PHY still exists? If
it does, it should be listed, even if it is not used.

Do the internal and external PHY share the same MDIO bus? I've seen
some SoCs with complex MDIO muxes for internal vs external PHYs.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
