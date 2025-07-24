Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B090EC87FC5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 21:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlQ0pelREp0z47yVqFGPPFKG/amtyaABXka93rpgP4s=; b=EjtsG1dd8FHHsN
	sp4vi3WtSd2kT5HAKQRlf4h9GGuztC53Fw9d5FEK5WOKvQICMdu8UTUEAAthptwjcXuUIQyZ3piTV
	IpfPv+dEpAf9cNQptVEM9bqkAhb/R/6FqR81tH/BdESEk2EijpLQ/4UcqOrOKCTfXyTgmyoImOU0W
	uzXyCvFr880Kfa52icNWytCYkgJus3uZyr3pSqmzsM/ETgZlH5N/dQCvoBFzGKaquCzZL1139i1gz
	EZ12FnVbtQG0Fyi27JLHRClyR4rd0XowjHoSZGPIGFQpbIv1fcwFpDW8tZLPDjFMW4DKB1c+UykwL
	44gBklYTIL+a8VelZ46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3Iu-00000008SzU-0R0q;
	Thu, 24 Jul 2025 21:16:40 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3Dl-00000008SRR-2WJT
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 21:11:22 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EE945340D1F;
	Thu, 24 Jul 2025 21:11:17 +0000 (UTC)
Date: Fri, 25 Jul 2025 05:11:13 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mat.jonczyk@o2.pl, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 6/8] riscv: dts: spacemit: enable the i2c8 adapter
Message-ID: <20250724211113-GYA748868@gentoo>
References: <20250724202511.499288-1-elder@riscstar.com>
 <20250724202511.499288-7-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250724202511.499288-7-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_141121_666110_841A5719 
X-CRM114-Status: GOOD (  15.06  )
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

Hi Alex,

On 15:25 Thu 24 Jul     , Alex Elder wrote:
> Define properties for the I2C adapter that provides access to the
> SpacemiT P1 PMIC.  Enable this adapter on the Banana Pi BPI-F3.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 15 +++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  7 +++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi            | 11 +++++++++++
>  3 files changed, 33 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index fe22c747c5012..7c9f91c88e01a 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -40,6 +40,21 @@ &emmc {
>  	status = "okay";
>  };
>  
> +&i2c8 {
> +	pinctrl-0 = <&i2c8_cfg>;
> +	pinctrl-names = "default";
..
> +	#address-cells = <1>;
> +	#size-cells = <0>;
I think these two can be moved into dtsi, as they are
common and fixed properties for the i2c controller

> +	status = "okay";
> +
> +	pmic@41 {
> +		compatible = "spacemit,p1";
> +		reg = <0x41>;
> +		interrupts = <64>;
..
> +		status = "okay";
status property here can be dropped as enabled by default
> +	};
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_2_cfg>;
> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> index 3810557374228..96d7a46d4bf77 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> @@ -11,6 +11,13 @@
>  #define K1_GPIO(x)	(x / 32) (x % 32)
>  
>  &pinctrl {
> +	i2c8_cfg: i2c8-cfg {
> +		i2c8-0-pins {
> +			pinmux = <K1_PADCONF(93, 0)>,	/* PWR_SCL */
> +				 <K1_PADCONF(94, 0)>;	/* PWR_SDA */
> +		};
> +	};
> +
>  	uart0_2_cfg: uart0-2-cfg {
>  		uart0-2-pins {
>  			pinmux = <K1_PADCONF(68, 2)>,
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index abde8bb07c95c..2a5a132d5a774 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -459,6 +459,17 @@ pwm7: pwm@d401bc00 {
>  			status = "disabled";
>  		};
>  
> +		i2c8: i2c@d401d800 {
> +			compatible = "spacemit,k1-i2c";
> +			reg = <0x0 0xd401d800 0x0 0x38>;
..
> +			interrupts = <19>;
I'd suggest to move interrupts property after clock, see my similar
comment
https://lore.kernel.org/all/20250724121916-GYA748228@gentoo/

> +			clocks = <&syscon_apbc CLK_TWSI8>,
> +				 <&syscon_apbc CLK_TWSI8_BUS>;
> +			clock-names = "func", "bus";
> +			clock-frequency = <400000>;
> +			status = "disabled";
> +		};
> +
>  		pinctrl: pinctrl@d401e000 {
>  			compatible = "spacemit,k1-pinctrl";
>  			reg = <0x0 0xd401e000 0x0 0x400>;
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
