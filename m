Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B60C2D0CD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 17:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RxA85GVYFl6X/0JvhP07Nko5KqP43KBLAz6Uul2Zoms=; b=AINbFGYVCct5WT7c4v5DbUsj5m
	cKNmsP2iHs3p9dI0R9m4Iy+kpsH0bABG6sHOxcgYB/fjk00a+omJjcU9qAtfrk1wxgyYIYK3bJEgH
	B2UJgqCFQyeQFGnO0x8Mur7W2tYFCPL04x4ivwXCAN/wS9BFkSWR3Iun55fNyRJzW4WzNf35qlza/
	RE8hCPdX2Z6JGeBxXo6sc9D81gPKLJcnYl4xbWiTM0Io2oYgqg8rhysvtpYxasAPJ26dWSb6Zy1/I
	DNWX7/rVzaMJpJjqx/4LxVwZl/Pe7UEdDb6IfczdZLxvLsn7OYA+ZqSWwSroej07eZKEqS9bezElL
	wujRnw3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFc60-00000001NCa-2iv9;
	Thu, 15 May 2025 17:10:12 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFc5y-00000001NBn-22Lf
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 17:10:11 +0000
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 72248497A6
	for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 17:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1747329008;
	bh=hc10wZlOZXdQSTbtiNrSV2vv5sB6wouwtdIbWrMrirQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=n/1g+h6+xEGwyMVYQHML0fkLRjN/999MtpfAj5h7byIauToL948Vp8WRUaTk6yI23
	 QQ2+oqrDJTyXvt1fzMXs68FC/CJFuLYhz7vy/Iyxmd/NiZ2n6qP1XrzwjHot/hHjhX
	 uXnJteiXFKh+rQK+TYcTM1v0Lb1UlNsTNhhVzfEAE2ZCwwvfrBYnJHfb3lbt6e+jPn
	 JgU0XiCpMK/OB0QfP/Xc5HkYk+2LuHNytF5C3DuKVgOI2MwUpvfi6CClCycjcFRMU4
	 U7dvyHXpH4QdxlJi1Ss2gQvtnRmCo0oXwQUI4xPcIXewA7mIwY9cuz/GRqe+2SIDM/
	 CInsACzHL6Kog==
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-603fd09171cso1387862eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 10:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747329007; x=1747933807;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hc10wZlOZXdQSTbtiNrSV2vv5sB6wouwtdIbWrMrirQ=;
        b=XBK54XLT61WfX3gXNLKgkKVWF6xFn51K4E4bXNt7leiITlijubytA8XZ6d4/vDhHU1
         pY/MXNeIKYw4qH85AG8C4/iBnNKpaLyoPtNxhoZXFDnTwed0DpAZMabboMea1PHZxO8o
         Z1BiX0x3WJSB4BVW/F2J/x5ZUT+a1XkWduieLBFzgBBzLvcky+iks/feTDFRUAMGvfTc
         tpAg6POJedM6fxu7zgNVHZE+KWsqt3CLhyWc9xM/uxBF1MAFgwsAiUFt2A1P7oW9ScBR
         YPgtAv2VfoVfnCvKEz1SmTKDPt3kgImJPVAGY+p/1wfllwvmEY1Y8k+d42RyxjRp+nzM
         mXKg==
X-Forwarded-Encrypted: i=1; AJvYcCWnzd2RWBIlLrNFjGIvUPqXHRYejGJNgx/TEYh5vAuB4YFWe6d6nkfG1pfpqoXbBEA4ErzFba0jJ6Y4Xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwD11wsMy9Iv7q6bDTajCb0Xi+7efdKENJemJcqrOaAfRJZgIX4
	Bf7Gy7H51Bb7T6Z9CLrmR1vYrmRLXQsfeeIci+wQBvgLghjmlHroZR8FV8/VPUsnLpPjI0n6npo
	UEH7mk/wOFDJ7+4F4tcRDx+8ZYoj41eDoGInYne20qoo/0pDDlei1RfQBiQVDAJsyuMgbCMb/K5
	1zlbF/ipR9i7PfV/pbIX6MD4D6Ux6V4YaFjHbZ+HMujXuaJj0vAgfbDuWp1gWf
X-Gm-Gg: ASbGncuex5NDeXr82+EtsIQaulrHy53JBXJI8dNHSM9rtTzDemLH9gmrJ+TVRuO5bHE
	weFyuEeqyog7PDCJOKbqyXiPoUSKK+DT8fFJwTQ1Sl/vBbYTM63QhBH4HhL+CelUt0hVm6w==
X-Received: by 2002:a05:6820:1841:b0:606:107a:ebd8 with SMTP id 006d021491bc7-609f374ddb4mr117619eaf.5.1747329007177;
        Thu, 15 May 2025 10:10:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzb9VcV3Lnf5ruIIC6ey76hxyhG8TiKGAlKsdKpz4KyWmg3ddQXbaDSEZE53clpDxkh1hdWXrmr5qJP7/70kY=
X-Received: by 2002:a05:6820:1841:b0:606:107a:ebd8 with SMTP id
 006d021491bc7-609f374ddb4mr117595eaf.5.1747329006841; Thu, 15 May 2025
 10:10:06 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:10:05 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:10:05 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250502103101.957016-5-e@freeshell.de>
References: <20250502103101.957016-1-e@freeshell.de> <20250502103101.957016-5-e@freeshell.de>
Mime-Version: 1.0
Date: Thu, 15 May 2025 10:10:05 -0700
X-Gm-Features: AX0GCFsnIcyqJ3U7xBWuljucy5NCfIr9h3FNHYe_s9G96TiWFSA6H61K7riL4Vc
Message-ID: <CAJM55Z8sqZ8g1zbphoKaqkZfFoh6GGCXF9dVPds5FydY3=46Gg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
To: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_101010_653996_2A8687CC 
X-CRM114-Status: GOOD (  12.46  )
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

E Shattow wrote:
> Add bootph-pre-ram hinting to jh7110-common.dtsi:
>   - i2c5_pins and i2c-pins subnode for connection to eeprom
>   - eeprom node
>   - qspi flash configuration subnode
>   - memory node
>   - mmc0 for eMMC
>   - mmc1 for SD Card
>   - uart0 for serial console
>
>   With this the U-Boot SPL secondary program loader may drop such overrides.
>
> Signed-off-by: E Shattow <e@freeshell.de>

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index f1dc45b98e1d..d2cdb2f276c3 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -28,6 +28,7 @@ chosen {
>  	memory@40000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x40000000 0x1 0x0>;
> +		bootph-pre-ram;
>  	};
>
>  	gpio-restart {
> @@ -249,6 +250,7 @@ emmc_vdd: aldo4 {
>  	eeprom@50 {
>  		compatible = "atmel,24c04";
>  		reg = <0x50>;
> +		bootph-pre-ram;
>  		pagesize = <16>;
>  	};
>  };
> @@ -268,6 +270,7 @@ &mmc0 {
>  	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
>  	assigned-clock-rates = <50000000>;
>  	bus-width = <8>;
> +	bootph-pre-ram;
>  	cap-mmc-highspeed;
>  	mmc-ddr-1_8v;
>  	mmc-hs200-1_8v;
> @@ -285,6 +288,7 @@ &mmc1 {
>  	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO1_SDCARD>;
>  	assigned-clock-rates = <50000000>;
>  	bus-width = <4>;
> +	bootph-pre-ram;
>  	no-sdio;
>  	no-mmc;
>  	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> @@ -323,6 +327,7 @@ &qspi {
>  	nor_flash: flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
> +		bootph-pre-ram;
>  		cdns,read-delay = <2>;
>  		spi-max-frequency = <100000000>;
>  		cdns,tshsl-ns = <1>;
> @@ -402,6 +407,8 @@ GPOEN_SYS_I2C2_DATA,
>  	};
>
>  	i2c5_pins: i2c5-0 {
> +		bootph-pre-ram;
> +
>  		i2c-pins {
>  			pinmux = <GPIOMUX(19, GPOUT_LOW,
>  					      GPOEN_SYS_I2C5_CLK,
> @@ -410,6 +417,7 @@ GPI_SYS_I2C5_CLK)>,
>  					      GPOEN_SYS_I2C5_DATA,
>  					      GPI_SYS_I2C5_DATA)>;
>  			bias-disable; /* external pull-up */
> +			bootph-pre-ram;
>  			input-enable;
>  			input-schmitt-enable;
>  		};
> @@ -638,6 +646,7 @@ GPOEN_DISABLE,
>  };
>
>  &uart0 {
> +	bootph-pre-ram;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";
> --
> 2.49.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
