Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E599D5B861
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 02:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nc5z+eeKdr8HpwyhA/I0J3P1cLEglljpf4ChtLFCTOM=; b=ZPzji8V97faLZ2
	YvSubMh+s1XaRc3SZpw80vWn+hSk1QqbDniC3eIn8klz3gamItAQ1ShJjPsraDiniVV1s84KY4SRY
	/vo9JLzf2qDLPa0AVqs97xxmVcU5aF+Viwi2TPLgyQNdTfAFGvEB2k2VSVo7wGkg8QYDyGvU/YiXw
	p7loxsaCVTfjcM+tjbJxn10rsK8oE0FlPQXXx5cmfHNsjM1bQ8zySf1zlTFx67VJMYGMxvROgx8HW
	4mKI/NZtWFSUANTL1lhVMIL8HgH7AKWHBUrHxgz3e42eBP93itwIhdlvnZhJmQ4CUi12siBl/ptDP
	0VDiACSvOyybZHQ1Ay8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5cJt-0000000D1XT-0K5j;
	Tue, 29 Oct 2024 02:50:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5cJq-0000000D1Wo-2zqg
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 02:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4x7+NMYuwtDNvuiXxIkan9s38gNFO7jrlobgIQdg9wI=; b=dvKgnwL+xlxDZYgcteGPA7b1b7
	mLcb/Toa8r1YLBarjgVedww/AUh/e93nYKxJn0MCiIuXh1j8B+aBur60A4HEBBxqIfiLMvlt4rF0O
	7jPcAv+gcq+yNAuTKebC5HnZ9CB2ptTJoX+sj2mDMLGrqaP5KDvKrRk1CSAhwJWRWCDY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t5cJd-00BWHU-42; Tue, 29 Oct 2024 03:50:41 +0100
Date: Tue, 29 Oct 2024 03:50:41 +0100
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
Message-ID: <ab0ed945-07ff-4aff-9763-e31f156df25f@lunn.ch>
References: <20241028011312.274938-1-inochiama@gmail.com>
 <87e215a7-0b27-4336-9f9c-e63ade0772ef@lunn.ch>
 <wgggariprpp2wczsljy3vw6kp7vhnrifg6soxdgiio2seyctym@4owbzlg3ngum>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wgggariprpp2wczsljy3vw6kp7vhnrifg6soxdgiio2seyctym@4owbzlg3ngum>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_195054_774895_255DB0E4 
X-CRM114-Status: GOOD (  18.70  )
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

On Tue, Oct 29, 2024 at 06:43:03AM +0800, Inochi Amaoto wrote:
> On Mon, Oct 28, 2024 at 02:09:06PM +0100, Andrew Lunn wrote:
> > > +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > > @@ -210,6 +210,55 @@ i2c4: i2c@4040000 {
> > >  			status = "disabled";
> > >  		};
> > >  
> > > +		gmac0: ethernet@4070000 {
> > > +			compatible = "snps,dwmac-3.70a";
> > > +			reg = <0x04070000 0x10000>;
> > > +			clocks = <&clk CLK_AXI4_ETH0>, <&clk CLK_ETH0_500M>;
> > > +			clock-names = "stmmaceth", "ptp_ref";
> > > +			interrupts = <31 IRQ_TYPE_LEVEL_HIGH>;
> > > +			interrupt-names = "macirq";
> > > +			phy-handle = <&phy0>;
> > > +			phy-mode = "rmii";
> > > +			rx-fifo-depth = <8192>;
> > > +			tx-fifo-depth = <8192>;
> > > +			snps,multicast-filter-bins = <0>;
> > > +			snps,perfect-filter-entries = <1>;
> > > +			snps,aal;
> > > +			snps,txpbl = <8>;
> > > +			snps,rxpbl = <8>;
> > > +			snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
> > > +			snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
> > > +			snps,axi-config = <&gmac0_stmmac_axi_setup>;
> > > +			status = "disabled";
> > > +
> > > +			mdio {
> > > +				compatible = "snps,dwmac-mdio";
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +
> > > +				phy0: phy@0 {
> > > +					compatible = "ethernet-phy-ieee802.3-c22";
> > > +					reg = <0>;
> > > +				};
> > > +			};
> > 
> > It is not clear to me what cv18xx.dtsi represents, 
> 
> This is a include file to define common ip for the whole
> cv18xx series SoCs (cv1800b, cv1812h, sg2000, sg2000).
> 
> > and where the PHY node should be, here, or in a .dts file. 
> > Is this a SOM, and the PHY is on the SOM? 
> 
> The phy is on the SoC, it is embedded, and no external phy
> is supported. So I think the phy node should stay here, not 
> in the dts file.

So this is correct when the PHY is internal. However, this is normally
expressed by setting phy-mode to "internal". The stmmac driver might
however not allow that? If not, please put a comment indicating the
PHY is part of the SoC.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
