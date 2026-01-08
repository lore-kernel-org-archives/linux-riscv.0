Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60711D14888
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 01:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfBWnFbAMIokcFgdMzVIBOftV6j2f6lZJkBBkdhMEzQ=; b=q8wo8/YxZoJtCV
	EtysFQXp8QSvLpX//DunhbWNVGyZVdtl6iwCaAAR0xHW1prL8KxdpXSUpSzBeRAz6iZXNnOESq4wg
	PtEB4MwLMS+OGbSOJ+tvDFpQjyt0oeiq/f01ENsvYgQ/cjjqc2VVqMfNhonmSrr+IRzNJVdJloP0m
	rUsVVpGhzWH7OEPmJhdCSKzj9FxINYpe9Ptw8Gcu2wsPqv51MWjTxZdUcAr0FVRLgVaItRM2xqbGq
	vZS05p9kOrTU91osE8vpyJxiUPU0i2+mkTsJ6tKDxKMn2H8+bwSMv6zT8pz5RpCIKkzCSOhCQ1NAk
	enhAkXDYYD/4hjgFJ8zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdej9-0000000Fndj-3PEB;
	Thu, 08 Jan 2026 01:22:15 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdej6-0000000FndL-1iZn
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 01:22:14 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CE15134168D;
	Thu, 08 Jan 2026 01:22:08 +0000 (UTC)
Date: Thu, 8 Jan 2026 09:21:57 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Ze Huang <huang.ze@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3
Message-ID: <20260108012157-GYA2355@gentoo.org>
References: <20260107-k1-usb3dts-v2-v2-0-e659b0f8fe1a@linux.dev>
 <20260107-k1-usb3dts-v2-v2-3-e659b0f8fe1a@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107-k1-usb3dts-v2-v2-3-e659b0f8fe1a@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_172212_483318_B90A2813 
X-CRM114-Status: GOOD (  20.45  )
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

Hi Ze,

  thanks for your patch, I have few comments, see below..

On 20:05 Wed 07 Jan     , Ze Huang wrote:
> Enable the DWC3 USB 3.0 controller and its associated usbphy2 on the
> Banana Pi F3 board.
> 
> The board utilizes a VLI VL817 hub, which requires two separate power
> supplies: one VBUS and one for hub itself. Add two GPIO-controlled
> fixed-regulators to manage this.
> 
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Ze Huang <huang.ze@linux.dev>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 48 +++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 3f10efd925dc..013df91c6a4c 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -59,6 +59,26 @@ reg_vcc_4v: vcc-4v {
>  		regulator-always-on;
>  		vin-supply = <&reg_dc_in>;
>  	};
> +
> +	usb3_vbus: regulator-vbus-5v {
I've checked the schematics, the name is 5V_VBUS there, so for the consistency
with previous naming convention, let's change to:
	usb3_vbus_5v: usb3-vbus-5v 

> +		compatible = "regulator-fixed";
> +		regulator-name = "USB30_VBUS";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
..
> +		regulator-always-on;
do you think the "always-on" property really necessary? it indicate the
power regulator is critical, and should never been disabled even during
suspend/resume state, for the case of USB, I think it should be totally
fine to poweroff once the device is not used(suspended) or even disabled

besides, the regulator is designed with a gpio enabling/disabling control
which means it can be powered to on/off state?

> +		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	usb3_vhub: regulator-vhub-5v {
why use vhub, but not hub? where does this name come from?

and for same reason, the name in schematics is VCC5V0_HUB, so how about
change it to:
	usb3_hub_5v: usb3-hub-5v 

> +		compatible = "regulator-fixed";
> +		regulator-name = "USB30_VHUB";
                                    ~~~need to fix too, if above is valid
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
..
> +		regulator-always-on;
ditto
> +		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
>  };
>  
>  &combo_phy {
> @@ -67,6 +87,34 @@ &combo_phy {
>  	status = "okay";
>  };
>  
..
> +&usbphy2 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3 {
> +	dr_mode = "host";
> +	vbus-supply = <&usb3_vbus>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	hub_2_0: hub@1 {
> +		compatible = "usb2109,2817";
> +		reg = <0x1>;
> +		vdd-supply = <&usb3_vhub>;
> +		peer-hub = <&hub_3_0>;
> +		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
> +	};
> +
> +	hub_3_0: hub@2 {
> +		compatible = "usb2109,817";
> +		reg = <0x2>;
> +		vdd-supply = <&usb3_vhub>;
> +		peer-hub = <&hub_2_0>;
> +		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
can you move these two after &uart0? I'd like to keep them sorted by 
label alphabet order..

>  &emmc {
>  	bus-width = <8>;
>  	mmc-hs400-1_8v;
> 
> -- 
> 2.52.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
