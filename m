Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B93CCD4F21
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 11:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZbuLclYu1SiOal5AfUgM1NdlCk8bqFQmfHugK21Ql2A=; b=0Ff6DWxJXUBqfq
	lQPJy4oCgYzWIKtHLMdi8uekqlNrGspmV5S6J8plpMhbpcOMEqMf1e/B0cEsd7qS2fxRI43kEram1
	lFuJkng0QySXbl3lM6nw+hNlfneJI/K9nplyiOOq2XoDRD38qrfZc4/62Iz5V1KLzpqsAtqQJ339I
	YaLmDS+iJedDaU1rk2FD2rlc1faeODCDsiGZefjvoZqETfJcHiflVeTR6iSPBKLl96zxZP0Ka2ZoX
	B4ciXaaR1S0jkHS3kJYDogMpyR7Ji2TknqcjXZrbXbSTMnIxdzSKWXn88HhgTmqFrdEeGOT2eCV0G
	1Z4ToQbSDdAlfW7xBG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMlSI-0000000GacV-2lmH;
	Tue, 12 May 2026 11:39:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMlSH-0000000GacE-3DgA
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 11:39:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 075A16001A;
	Tue, 12 May 2026 11:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533A2C2BCB0;
	Tue, 12 May 2026 11:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778585956;
	bh=kJdd4/vQ20oHpvv/vZ2fhCfv1fSDoI+846b9C3EMHBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zz3HGQNKpHi5hjprhdZ5YJIEE9wOrIENApMoeCfoDzR++zXfvq9NDQyqrOTn2AEna
	 B0+JtISL9KM8B9CQjWTFxlmZeSYxIIHnrZ8ysFafhJCn8CUpRCjXD1ALc/W8fuLJKv
	 l/e9sKDXnJT0rlCGUM+dniBlgLzpQQ3WxQh9OLIOP8h/OOGKHGmKMFL4vVezEhWyNx
	 cHDp919m9a9zk7tcSaPZJ77YClrweEachGOl6rUxJR4biQmwYETheFLCDqj0NwgClU
	 Xsx0scIvB5CJUSR7RnSk4ljIZCT/dvG12ShQcBXqlXawuMTMJA+ac1nKNzMVLidTop
	 EOlvDRmopr5yg==
Date: Tue, 12 May 2026 11:39:13 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andre Heider <a.heider@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and
 power infrastructure
Message-ID: <20260512113913-GKH3624147@kernel.org>
References: <20260511111116.1109643-1-a.heider@gmail.com>
 <20260511111116.1109643-2-a.heider@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511111116.1109643-2-a.heider@gmail.com>
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

Hi Andre,

On 13:11 Mon 11 May     , Andre Heider wrote:
> Enable i2c8 and add the connected SpacemiT P1 PMIC with its related regulators
> for the board's power infrastructure and voltage regulation support.
> 
> Signed-off-by: Andre Heider <a.heider@gmail.com>
> ---
>  .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 144 ++++++++++++++++++
>  1 file changed, 144 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> index 29e333b670cf0..88c35ad1ef2ae 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> @@ -17,6 +17,7 @@ / {
>  	aliases {
>  		ethernet0 = &eth0;
>  		serial0 = &uart0;
> +		i2c8 = &i2c8;
>  	};
>  
>  	chosen {
> @@ -33,6 +34,25 @@ led1 {
>  			default-state = "on";
>  		};
>  	};
> +
..
> +	reg_usb_vbus: regulator-usb-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USBVBUS";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
I think you can further drop above regulator, which merely serve as vin-supply 
and not used by devices, plus it's a non-controllable fixed regulator

> +
> +	reg_vcc_4v0: regulator-vcc-40v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC4V0";
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		vin-supply = <&reg_usb_vbus>;
> +	};
>  };
>  
>  &emmc {
> @@ -72,6 +92,130 @@ &pdma {
>  	status = "okay";
>  };
>  
> +&i2c8 {
> +	pinctrl-0 = <&i2c8_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	pmic@41 {
> +		compatible = "spacemit,p1";
> +		reg = <0x41>;
> +		interrupts = <64>;
> +		vin1-supply = <&reg_vcc_4v0>;
> +		vin2-supply = <&reg_vcc_4v0>;
> +		vin3-supply = <&reg_vcc_4v0>;
> +		vin4-supply = <&reg_vcc_4v0>;
> +		vin5-supply = <&reg_vcc_4v0>;
> +		vin6-supply = <&reg_vcc_4v0>;
> +		aldoin-supply = <&reg_vcc_4v0>;
> +		dldoin1-supply = <&buck5>;
> +		dldoin2-supply = <&buck5>;
> +
> +		regulators {
> +			buck1 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3450000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-always-on;
> +			};
> +
> +			buck2 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3450000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-always-on;
> +			};
> +
> +			buck3 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-always-on;
> +			};
> +
> +			buck4 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-always-on;
> +			};
> +
> +			buck5: buck5 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3450000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-always-on;
> +			};
> +
> +			buck6 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3450000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-always-on;
> +			};
> +
> +			aldo1 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-boot-on;
> +			};
> +
> +			aldo2 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +			};
> +
> +			aldo3 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +			};
> +
> +			aldo4 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +			};
> +
> +			dldo1 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-boot-on;
> +			};
> +
> +			dldo2 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +			};
> +
> +			dldo3 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +			};
> +
> +			dldo4 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-always-on;
> +			};
> +
> +			dldo5 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +			};
> +
> +			dldo6 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-always-on;
> +			};
> +
> +			dldo7 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +			};
> +		};
> +	};
> +};
> +
>  &uart0 {
>  	pinctrl-0 = <&uart0_2_cfg>;
>  	pinctrl-names = "default";
> -- 
> 2.53.0
> 
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
