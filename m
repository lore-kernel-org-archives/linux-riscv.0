Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CC2D6AB1B
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 00:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/sfRRywV2pYPdImmAIi4pPTCrAOUxSiWMcVp4sV1KI=; b=vimjcU35fa6LaV
	JEDm/BG7wE0bzb9jvheKDW1vSZTCU0X74MX27BCqtBzEqrRKd1abZkDfjkctSJS0Mv8ByIzq37N8M
	f61AFH/1dvXgEzS/sOfPWlW9HlFkTovPAwrzD0LYDGjHmsQCsMUVb1bWjai4smGFpLYCLVLBQupIv
	1pUzWthnTplMGCi+EErItSirGfEGYBsJL84yBSMm4scQd0oLsvtp0ZZF/Tqi8aTmRbjobyMZEgtUg
	0Kp/9juwmEynj37cBIxVRTIRKHIfwiVqiDqWxDAd/2SuMddFf2EGk0o9j7unBTUA37QME9ZxpxDtN
	szpAKZ4OCzPLsUHw9lgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8S2i-00000000xj1-0zhG;
	Fri, 03 Apr 2026 00:05:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8S2h-00000000xiv-1I5x
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 00:05:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 60FD360123;
	Fri,  3 Apr 2026 00:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9332C116C6;
	Fri,  3 Apr 2026 00:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775174742;
	bh=DDsPrUWRkqkmQ41FPpxMfl/fi+0OAAZHRX0ngFqdtlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZbciE94MPpLqbarbdytrfVxhnGPoXIzDHr0xpgX6lWDZAc2KdPYoMU7KugmxL5qv2
	 WzP/gKxPz/skbJgSK2u6pbzCdnk9aSMfotyhzJ1D7/PDljRAWYeovHmreTE/9QTnYm
	 NS4ZIwBO8nwD8sD3QZ1Ywyrju9AOBYu8H2JU6RhUDZObKaEzZVF3wQM8B5rmQY6yv8
	 gBUCiJhyPntOiCUX93lc6p2Kc/vwMKgH84qf8Qe28jxUeRcMAO7wsZNizSuX8ltMFb
	 1yWxlPGxTXci/sunZ3jL6UuOMZkTU4JHl36A7q7ghsIAirUJFP//wXRkUXwAWl7YOT
	 ns8uNwXkdjR8g==
Date: Fri, 3 Apr 2026 08:05:39 +0800
From: Yixun Lan <dlan@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v5 3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on
 OrangePi RV2
Message-ID: <20260403000539-GKB1016296@kernel.org>
References: <cover.1775148159.git.gaohan@iscas.ac.cn>
 <cfe646a5549a2b3fc8a4335c3ab4918599615369.1775148159.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cfe646a5549a2b3fc8a4335c3ab4918599615369.1775148159.git.gaohan@iscas.ac.cn>
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

Hi Han, 

On 00:54 Fri 03 Apr     , Han Gao wrote:
> Enable the DWC3 USB 3.0 controller and its associated usbphy2 on the
> OrangePi RV2 board.
> 
> The board utilizes a Genesys Logic GL3523 USB3.0 hub.
> 
> Define a 3.3v fixed voltage regulator for PCIe and enable PCIe and
> PHY-related Device Tree nodes for the OrangePi RV2.
> 
> Co-developed-by: Chukun Pan <amadeus@jmu.edu.cn>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index a6de3753b876..c19952e70c31 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -23,6 +23,15 @@ chosen {
>  		stdout-path = "serial0";
>  	};
>  
> +	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "pcie_vcc3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio K1_GPIO(116) GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	vcc_5v0: regulator-vcc-5v0 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vcc_5v0";
> @@ -42,6 +51,16 @@ vcc4v0: regulator-vcc4v0 {
>  		vin-supply = <&vcc_5v0>;
>  	};
>  
> +	vcc5v0_usb30: regulator-vcc5v0-usb30 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_usb30";
> +		enable-active-high;
> +		gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc_5v0>;
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  
> @@ -54,6 +73,10 @@ led1 {
>  	};
>  };
>  
> +&combo_phy {
> +	status = "okay";
> +};
> +
>  &eth0 {
>  	phy-handle = <&rgmii0>;
>  	phy-mode = "rgmii-id";
> @@ -200,8 +223,65 @@ dldo6 {
>  	};
>  };
>  
> +&pcie1_phy {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie1_3_cfg>;
> +	status = "okay";
> +};
> +
> +&pcie1_port {
> +	phys = <&pcie1_phy>;
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> +};
> +
> +&pcie1 {
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> +	status = "okay";
> +};
> +
> +&pcie2_phy {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie2_4_cfg>;
> +	status = "okay";
> +};
> +
> +&pcie2_port {
> +	phys = <&pcie2_phy>;
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> +};
> +
> +&pcie2 {
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> +	status = "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_2_cfg>;
>  	status = "okay";
>  };
> +
> +&usbphy2 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3 {
> +	dr_mode = "host";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
Can you put vbus-supply here? see Chukun's patch
http://lore.kernel.org/r/20260402100007.110201-4-amadeus@jmu.edu.cn

> +
> +	hub_2_0: hub@1 {
> +		compatible = "usb5e3,610";
> +		reg = <0x1>;
> +		peer-hub = <&hub_3_0>;
..
> +		vdd-supply = <&vcc5v0_usb30>;
I think the vdd is vcc_5v0, while vcc5v0_usb30 is the vbus, if we check
page 16 of RV2 schematics, GL3523-QFN75 (USB HUB)'s pin V5, VDDP directly
connect to VCC_5V0

> +	};
> +
> +	hub_3_0: hub@2 {
> +		compatible = "usb5e3,620";
> +		reg = <0x2>;
> +		peer-hub = <&hub_2_0>;
> +		vdd-supply = <&vcc5v0_usb30>;
> +	};
> +};
> -- 
> 2.47.3
> 
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
