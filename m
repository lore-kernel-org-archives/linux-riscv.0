Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723ABC8303F
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 23:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lEOU6fHHwz/agImYax2opc0+vx5tzxTlxc6mnXQeUg0=; b=WKrI3PLuau9GEg
	nPMtwI2KHDPuo8vCLyKlXmNazdZH40rHhAXZzfzNbkBDG975Pgb1S6vdrsHf0LYTBoHZGCqY/L6M1
	rgQg09JTqMDbhJ0mPnCUIYnZ9+8a70ZeHr2gKkc/kKUAavrZvuR2HYHNTiv2j/PvT77GwpAYSLIWY
	hQllvvkyTL+INNFCF3fXnLEP7SO+lNA29TyOI7sNzDiNdybwk8vltJt/Bos8hRxxwvOO4L8+ywnys
	XY2WxnNsl8ZZbTDQkMm67UsaZcXlPrZEH9v0CHdedoPumbIo2qYJaYgrCQv/v0CMS1zzLZ8/tAGbB
	30nNCtDCYgXuwSpYjWjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqggi-0000000A8QM-38qg;
	Mon, 25 Aug 2025 23:33:20 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqggf-0000000A8Pp-2ut4
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 23:33:18 +0000
Received: from localhost (unknown [180.158.240.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3C155340FEA;
	Mon, 25 Aug 2025 23:33:16 +0000 (UTC)
Date: Tue, 26 Aug 2025 07:33:12 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <uwu@dram.page>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Simon Horman <horms@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: Re: [PATCH net-next v6 4/5] riscv: dts: spacemit: Add Ethernet
 support for BPI-F3
Message-ID: <20250825233312-GYB1101079@gentoo.org>
References: <20250820-net-k1-emac-v6-0-c1e28f2b8be5@iscas.ac.cn>
 <20250820-net-k1-emac-v6-4-c1e28f2b8be5@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250820-net-k1-emac-v6-4-c1e28f2b8be5@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_163317_770024_57916A7B 
X-CRM114-Status: GOOD (  12.81  )
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

Hi Vivian,

On 14:47 Wed 20 Aug     , Vivian Wang wrote:
> Banana Pi BPI-F3 uses an RGMII PHY for each port and uses GPIO for PHY
> reset.
> 
> Tested-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Reviewed-by: Yixun Lan <dlan@gentoo.org>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 46 +++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index fe22c747c5012fe56d42ac8a7efdbbdb694f31b6..15fa4a5ebd043f3fbb115d37e5a980c9b773a228 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -40,6 +40,52 @@ &emmc {
>  	status = "okay";
>  };
>  
> +&eth0 {
> +	phy-handle = <&rgmii0>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac0_cfg>;
> +	rx-internal-delay-ps = <0>;
> +	tx-internal-delay-ps = <0>;
> +	status = "okay";
> +
> +	mdio-bus {
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +
> +		reset-gpios = <&gpio K1_GPIO(110) GPIO_ACTIVE_LOW>;
> +		reset-delay-us = <10000>;
> +		reset-post-delay-us = <100000>;
> +
> +		rgmii0: phy@1 {
> +			reg = <0x1>;
> +		};
> +	};
> +};
> +
> +&eth1 {
> +	phy-handle = <&rgmii1>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac1_cfg>;
> +	rx-internal-delay-ps = <0>;
> +	tx-internal-delay-ps = <250>;
> +	status = "okay";
> +
> +	mdio-bus {
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +
> +		reset-gpios = <&gpio K1_GPIO(115) GPIO_ACTIVE_LOW>;
> +		reset-delay-us = <10000>;
> +		reset-post-delay-us = <100000>;
> +
> +		rgmii1: phy@1 {
> +			reg = <0x1>;
> +		};
> +	};
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_2_cfg>;
> 
> -- 
> 2.50.1
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
