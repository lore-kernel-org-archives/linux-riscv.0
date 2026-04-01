Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2331061B31
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 04:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6v47QZ2MLa4b4hDC/CAnsQhcP1VlMyk0rUXradrO8Ao=; b=jDh6qqqmtXCAhY
	ux7YOWzK+sCwgNoj+YjEp1cvmr0hU8LLasH5yTifIYyDXf5bS+tpif59XvWcoGRBQ5dl7QjuR47Sn
	xTmY43FkOYXePkyZoQleiP/u1tjuhHk/R4sHvgbzXmAoHu+ELywTSAev+5ninI9AXhJqo5Sw0Z17W
	5D+DDk/dtGSD4tGCdg52cAzrG56PiL9wYKG29U2uOeX4U1I+j9sok7HTRIGFDdEI9ILc1Y1FG5njn
	m2L3rLUvfe/8Gf3fUxJdi7Va7EXmwZBKkav29jtkrfpIKwzbrwH8SkQYy6P8bP/DYrtlTIAaJaugr
	hPYk1QRaMl2K0Fn28ggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7mob-0000000DvQA-2npG;
	Wed, 01 Apr 2026 04:04:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7moZ-0000000DvPp-0FiY
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 04:04:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4108F40114;
	Wed,  1 Apr 2026 04:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25A4C4CEF7;
	Wed,  1 Apr 2026 04:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775016262;
	bh=ScayOH1vtYXF2K7sunI/tM6mb4FVHyGKqqVATORwRxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OCeq2Mai12RS1qTR9GvoeNmKuwmzoWUAPCrGXdkVBqc4lIsSDEZMczQyFQpPHSP7y
	 FlMIcvuNkrRphHe4Rt4cEZY/xlHLTa7OSfQFDhBgQ3aRbickkqOk19dpXVwqDmf5MM
	 6u2K2CDWSa+f6quD3wbRDm1JqmGRC+LlOSvS+gckSe+xMkRBQ/XWNzntlii90YUmj+
	 HEdJOy95SMpksOuKLVq1LisKAZ2ByjVZlSPbLpQ3vuxDLhddKI2BDUQI8OsNLPQ8Oi
	 IppT7OyI/TYBDiz5l73wssioFc/UwFpkXWeLhifsQ/0k/CmfAZJVuWAvWiPevd9ESy
	 yFe3pQyZCjItQ==
Date: Wed, 1 Apr 2026 12:04:19 +0800
From: Yixun Lan <dlan@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on
 OrangePi RV2
Message-ID: <20260401040419-GKC976850@kernel.org>
References: <cover.1774974017.git.gaohan@iscas.ac.cn>
 <0ec229e2fb138092672773f134d0739e70740ce0.1774974017.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0ec229e2fb138092672773f134d0739e70740ce0.1774974017.git.gaohan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_210423_144565_EE5A80A1 
X-CRM114-Status: GOOD (  15.30  )
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

On 00:27 Wed 01 Apr     , Han Gao wrote:
> Enable the DWC3 USB 3.0 controller and its associated usbphy2 on the
> OrangePi RV2 board.
> 
> The board utilizes a Genesys Logic GL3523 USB3.0 hub.
> 
> Define a 3.3v fixed voltage regulator for PCIe and enable PCIe and
> PHY-related Device Tree nodes for the OrangePi RV2.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index e5e358d49c09..e93e7f660820 100644
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

I've noticed you dropped usb3_hub_5v which actually provide vbus supply..
so in current version, it will leave vbus as undetermined state - whether
vbus is on or not will depend on bootloader to enable it or not?

The best choice would be waiting for Marco's onboard-dev vbus patch[1],
while in K1 platform, we workaround it by force enabling vbus after power on
(set regulator as always-on)..

Link: https://lore.kernel.org/all/20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de/ [1]

>  	reg_vcc_4v: regulator-vcc-4v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vcc4v0";
> @@ -44,6 +53,10 @@ led1 {
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
> @@ -190,8 +203,63 @@ dldo6 {
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
> +
> +	hub_2_0: hub@1 {
> +		compatible = "usb5e3,610";
> +		reg = <0x1>;
> +		peer-hub = <&hub_3_0>;
> +	};
> +
> +	hub_3_0: hub@2 {
> +		compatible = "usb5e3,620";
> +		reg = <0x2>;
> +		peer-hub = <&hub_2_0>;
Can you confirm all usb ports work fine with this?

> +	};
> +};
> -- 
> 2.47.3
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
