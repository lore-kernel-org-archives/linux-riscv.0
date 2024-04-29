Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68571C04FFE
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 13:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YWEOQdRUgZJx12FWMN9TPaf/g87pUDMysWLYC3TaRg0=; b=n8+hpPr4LxAuksUBpk8UUWHgSm
	eZ8nTkQauxKMeh7rqcELTdoROidPjLnc8y6L418JmAQz+0inSRPwn3HeAA3pNrCE9GXpKaB97Arp1
	KX2fJ37CdOJ7xO2OXaLRUGIiUZRQvVIasEZXbpBQYkt8eHjzHn2cpQXcHW3+p5UF9HAq7LDwlU3Cf
	iiWgsaXvpS4m/5ylUT643zDp0ZWIPwsoCRl42ts3DYrh6A6YavnKXt2kMg5OeeYIqbcy1+mrSuz3P
	gDqHNuAuOCumebOAPPtDlyFFlufsbj5Ir4hPJVdwJySJb97ZOFjOXRsHMgrIgh2C12PrnXMvwPbZ4
	LYYhzRuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RQK-000000030mm-0QSp;
	Mon, 29 Apr 2024 13:52:04 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RQF-000000030kn-0JVS
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 13:52:01 +0000
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 906B13F0CB
	for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 13:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714398717;
	bh=+Q93uYKVHkI8FjmsQvVCYUdtbVOhu2FzIUlsEgjYqSQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=wH+bLKtcUH0B9qJIc5SagyzKF/hrfI2wjsPOVUMeS9doONfskbYd2a/G1tC2Hhn9/
	 m1IwKKAg5vT1lVbsbG8+0OoihckC6NfLo6gn3G2Mo7xMj160mwFdmiS9smz2b36GBh
	 DmqNQnggnMuuC/aS74EjMzJCR4tPxzHeuotuGg/CzQlFDWvTMud2O8IDuywGmJW/V1
	 YNWUTCbS3YE2BdEx6t/vzrqK8sIpGSogPWPfeSn7j/k+l3zzIOslL5FEPn6U3rII6i
	 0kCSsn6cQYVRLtXJRTESIxVlLBX9rk6y/ElFqVrI0XTg+pZxoSt7D2zNWzMPLPFHCA
	 HI3c0exxuzxtA==
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-47b61811775so1612714137.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 06:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714398716; x=1715003516;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Q93uYKVHkI8FjmsQvVCYUdtbVOhu2FzIUlsEgjYqSQ=;
        b=TPBaNrAqZWno6aFlOCqXn9+nPF4nRta8GynmcxjjUsPZnU++JP9wHV84dvpkZE4qz5
         9zKqXnoUyF4roC+aRLzjAFj3kFO3G1509G/Yn4e+5xmZDOstXr31kmIcl1IOanvvBKml
         Ge9EiNBsDAYJ8LBwf+WmfUbE7pfkq3mKAHv+DNVL13KT2XzadpoSJOAT4+7r0fEh6Qvl
         MYho1twQ3p0qT++fpV3riuM92VA90uQbgl1tKbsIAqL4lfNGA+RiMHwm82VQ7dx+O12w
         1wwENi8jf48pmTKfVZSjsoeqW6X4s5rOD5ZrP9/CYJWNWQio5RhDKu6RMgVuFupP1XGA
         j78Q==
X-Gm-Message-State: AOJu0YyVF9FsHzn9AM8MkfGL8cmxtYRObBewTI6lykdHnNlS1Jblrrfc
	HbAxeoSgRF3IUu5cPorfiNJ4Sk2VlaNozmiUpOG3peS+LxqjcD2ICvYXP/2fAM1WKDL4DjX27eP
	lUvCBprWIOfWSfNVkuMytRsA2J5Owb2/9ZdbUbbAxhueGfww2bLsTludMmbDSdVb3s7HQJgLXwU
	jwJXR4RacfocasaJjL+lt+5+IDJTvpSePq6Xx0PAMFCXnD02rr23chYKM3
X-Received: by 2002:a67:bd0e:0:b0:47b:d2e2:9336 with SMTP id y14-20020a67bd0e000000b0047bd2e29336mr12187751vsq.19.1714398716401;
        Mon, 29 Apr 2024 06:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH6hB2bfs0xj4pBjEadwWBNZ9MR0YtcKFj/kCSFpP1XZR+oScu6QPe2skxOYLMgRQwKr8gvBtd5u28htMsKD8=
X-Received: by 2002:a67:bd0e:0:b0:47b:d2e2:9336 with SMTP id
 y14-20020a67bd0e000000b0047bd2e29336mr12187725vsq.19.1714398716003; Mon, 29
 Apr 2024 06:51:56 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Apr 2024 06:51:55 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240429001317.432-8-jszhang@kernel.org>
References: <20240429001317.432-1-jszhang@kernel.org> <20240429001317.432-8-jszhang@kernel.org>
Mime-Version: 1.0
Date: Mon, 29 Apr 2024 06:51:55 -0700
Message-ID: <CAJM55Z-TO9fJWqdBi8atcUGR8LsjdY5KtWNNes0j_2fOYX5vKQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] riscv: dts: starfive: introduce a common board
 dtsi for jh7110 based boards
To: Jisheng Zhang <jszhang@kernel.org>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_065159_410610_6B583C67 
X-CRM114-Status: GOOD (  13.22  )
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

Jisheng Zhang wrote:
> This is to prepare for Milkv Mars board dts support in the following
> patch. Let's factored out common part into .dtsi.

Maybe something like:

"Many boards using the StarFive JH7110 SoC share a lot of their design with the
first VisionFive 2 boards. Let's factor out the common parts in preparation for
adding support for the Milk-V Mars board."

In any case:
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../boot/dts/starfive/jh7110-common.dtsi      | 599 ++++++++++++++++++
>  .../jh7110-starfive-visionfive-2.dtsi         | 585 +----------------
>  2 files changed, 600 insertions(+), 584 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> new file mode 100644
> index 000000000000..8ff6ea64f048
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -0,0 +1,599 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> + */
> +
> +/dts-v1/;
> +#include "jh7110.dtsi"
> +#include "jh7110-pinfunc.h"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	aliases {
> +		ethernet0 = &gmac0;
> +		i2c0 = &i2c0;
> +		i2c2 = &i2c2;
> +		i2c5 = &i2c5;
> +		i2c6 = &i2c6;
> +		mmc0 = &mmc0;
> +		mmc1 = &mmc1;
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x40000000 0x1 0x0>;
> +	};
> +
> +	gpio-restart {
> +		compatible = "gpio-restart";
> +		gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
> +		priority = <224>;
> +	};
> +
> +	pwmdac_codec: audio-codec {
> +		compatible = "linux,spdif-dit";
> +		#sound-dai-cells = <0>;
> +	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "StarFive-PWMDAC-Sound-Card";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		simple-audio-card,dai-link@0 {
> +			reg = <0>;
> +			format = "left_j";
> +			bitclock-master = <&sndcpu0>;
> +			frame-master = <&sndcpu0>;
> +
> +			sndcpu0: cpu {
> +				sound-dai = <&pwmdac>;
> +			};
> +
> +			codec {
> +				sound-dai = <&pwmdac_codec>;
> +			};
> +		};
> +	};
> +};
> +
> +&cpus {
> +	timebase-frequency = <4000000>;
> +};
> +
> +&dvp_clk {
> +	clock-frequency = <74250000>;
> +};
> +
> +&gmac0_rgmii_rxin {
> +	clock-frequency = <125000000>;
> +};
> +
> +&gmac0_rmii_refin {
> +	clock-frequency = <50000000>;
> +};
> +
> +&gmac1_rgmii_rxin {
> +	clock-frequency = <125000000>;
> +};
> +
> +&gmac1_rmii_refin {
> +	clock-frequency = <50000000>;
> +};
> +
> +&hdmitx0_pixelclk {
> +	clock-frequency = <297000000>;
> +};
> +
> +&i2srx_bclk_ext {
> +	clock-frequency = <12288000>;
> +};
> +
> +&i2srx_lrck_ext {
> +	clock-frequency = <192000>;
> +};
> +
> +&i2stx_bclk_ext {
> +	clock-frequency = <12288000>;
> +};
> +
> +&i2stx_lrck_ext {
> +	clock-frequency = <192000>;
> +};
> +
> +&mclk_ext {
> +	clock-frequency = <12288000>;
> +};
> +
> +&osc {
> +	clock-frequency = <24000000>;
> +};
> +
> +&rtc_osc {
> +	clock-frequency = <32768>;
> +};
> +
> +&tdm_ext {
> +	clock-frequency = <49152000>;
> +};
> +
> +&camss {
> +	assigned-clocks = <&ispcrg JH7110_ISPCLK_DOM4_APB_FUNC>,
> +			  <&ispcrg JH7110_ISPCLK_MIPI_RX0_PXL>;
> +	assigned-clock-rates = <49500000>, <198000000>;
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			camss_from_csi2rx: endpoint {
> +				remote-endpoint = <&csi2rx_to_camss>;
> +			};
> +		};
> +	};
> +};
> +
> +&csi2rx {
> +	assigned-clocks = <&ispcrg JH7110_ISPCLK_VIN_SYS>;
> +	assigned-clock-rates = <297000000>;
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			/* remote MIPI sensor endpoint */
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csi2rx_to_camss: endpoint {
> +				remote-endpoint = <&camss_from_csi2rx>;
> +			};
> +		};
> +	};
> +};
> +
> +&gmac0 {
> +	phy-handle = <&phy0>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +
> +		phy0: ethernet-phy@0 {
> +			reg = <0>;
> +		};
> +	};
> +};
> +
> +&i2c0 {
> +	clock-frequency = <100000>;
> +	i2c-sda-hold-time-ns = <300>;
> +	i2c-sda-falling-time-ns = <510>;
> +	i2c-scl-falling-time-ns = <510>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins>;
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	clock-frequency = <100000>;
> +	i2c-sda-hold-time-ns = <300>;
> +	i2c-sda-falling-time-ns = <510>;
> +	i2c-scl-falling-time-ns = <510>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_pins>;
> +	status = "okay";
> +};
> +
> +&i2c5 {
> +	clock-frequency = <100000>;
> +	i2c-sda-hold-time-ns = <300>;
> +	i2c-sda-falling-time-ns = <510>;
> +	i2c-scl-falling-time-ns = <510>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c5_pins>;
> +	status = "okay";
> +
> +	axp15060: pmic@36 {
> +		compatible = "x-powers,axp15060";
> +		reg = <0x36>;
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +
> +		regulators {
> +			vcc_3v3: dcdc1 {
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vcc_3v3";
> +			};
> +
> +			vdd_cpu: dcdc2 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <1540000>;
> +				regulator-name = "vdd-cpu";
> +			};
> +
> +			emmc_vdd: aldo4 {
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "emmc_vdd";
> +			};
> +		};
> +	};
> +};
> +
> +&i2c6 {
> +	clock-frequency = <100000>;
> +	i2c-sda-hold-time-ns = <300>;
> +	i2c-sda-falling-time-ns = <510>;
> +	i2c-scl-falling-time-ns = <510>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c6_pins>;
> +	status = "okay";
> +};
> +
> +&mmc0 {
> +	max-frequency = <100000000>;
> +	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
> +	assigned-clock-rates = <50000000>;
> +	bus-width = <8>;
> +	cap-mmc-highspeed;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	cap-mmc-hw-reset;
> +	post-power-on-delay-ms = <200>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_pins>;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&emmc_vdd>;
> +	status = "okay";
> +};
> +
> +&mmc1 {
> +	max-frequency = <100000000>;
> +	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO1_SDCARD>;
> +	assigned-clock-rates = <50000000>;
> +	bus-width = <4>;
> +	no-sdio;
> +	no-mmc;
> +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	post-power-on-delay-ms = <200>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc1_pins>;
> +	status = "okay";
> +};
> +
> +&pwmdac {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwmdac_pins>;
> +	status = "okay";
> +};
> +
> +&qspi {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	nor_flash: flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		cdns,read-delay = <5>;
> +		spi-max-frequency = <12000000>;
> +		cdns,tshsl-ns = <1>;
> +		cdns,tsd2d-ns = <1>;
> +		cdns,tchsh-ns = <1>;
> +		cdns,tslch-ns = <1>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			spl@0 {
> +				reg = <0x0 0x80000>;
> +			};
> +			uboot-env@f0000 {
> +				reg = <0xf0000 0x10000>;
> +			};
> +			uboot@100000 {
> +				reg = <0x100000 0x400000>;
> +			};
> +			reserved-data@600000 {
> +				reg = <0x600000 0xa00000>;
> +			};
> +		};
> +	};
> +};
> +
> +&pwm {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm_pins>;
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi0_pins>;
> +	status = "okay";
> +
> +	spi_dev0: spi@0 {
> +		compatible = "rohm,dh2228fv";
> +		reg = <0>;
> +		spi-max-frequency = <10000000>;
> +	};
> +};
> +
> +&sysgpio {
> +	i2c0_pins: i2c0-0 {
> +		i2c-pins {
> +			pinmux = <GPIOMUX(57, GPOUT_LOW,
> +					      GPOEN_SYS_I2C0_CLK,
> +					      GPI_SYS_I2C0_CLK)>,
> +				 <GPIOMUX(58, GPOUT_LOW,
> +					      GPOEN_SYS_I2C0_DATA,
> +					      GPI_SYS_I2C0_DATA)>;
> +			bias-disable; /* external pull-up */
> +			input-enable;
> +			input-schmitt-enable;
> +		};
> +	};
> +
> +	i2c2_pins: i2c2-0 {
> +		i2c-pins {
> +			pinmux = <GPIOMUX(3, GPOUT_LOW,
> +					     GPOEN_SYS_I2C2_CLK,
> +					     GPI_SYS_I2C2_CLK)>,
> +				 <GPIOMUX(2, GPOUT_LOW,
> +					     GPOEN_SYS_I2C2_DATA,
> +					     GPI_SYS_I2C2_DATA)>;
> +			bias-disable; /* external pull-up */
> +			input-enable;
> +			input-schmitt-enable;
> +		};
> +	};
> +
> +	i2c5_pins: i2c5-0 {
> +		i2c-pins {
> +			pinmux = <GPIOMUX(19, GPOUT_LOW,
> +					      GPOEN_SYS_I2C5_CLK,
> +					      GPI_SYS_I2C5_CLK)>,
> +				 <GPIOMUX(20, GPOUT_LOW,
> +					      GPOEN_SYS_I2C5_DATA,
> +					      GPI_SYS_I2C5_DATA)>;
> +			bias-disable; /* external pull-up */
> +			input-enable;
> +			input-schmitt-enable;
> +		};
> +	};
> +
> +	i2c6_pins: i2c6-0 {
> +		i2c-pins {
> +			pinmux = <GPIOMUX(16, GPOUT_LOW,
> +					      GPOEN_SYS_I2C6_CLK,
> +					      GPI_SYS_I2C6_CLK)>,
> +				 <GPIOMUX(17, GPOUT_LOW,
> +					      GPOEN_SYS_I2C6_DATA,
> +					      GPI_SYS_I2C6_DATA)>;
> +			bias-disable; /* external pull-up */
> +			input-enable;
> +			input-schmitt-enable;
> +		};
> +	};
> +
> +	mmc0_pins: mmc0-0 {
> +		 rst-pins {
> +			pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
> +					      GPOEN_ENABLE,
> +					      GPI_NONE)>;
> +			bias-pull-up;
> +			drive-strength = <12>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		mmc-pins {
> +			pinmux = <PINMUX(64, 0)>,
> +				 <PINMUX(65, 0)>,
> +				 <PINMUX(66, 0)>,
> +				 <PINMUX(67, 0)>,
> +				 <PINMUX(68, 0)>,
> +				 <PINMUX(69, 0)>,
> +				 <PINMUX(70, 0)>,
> +				 <PINMUX(71, 0)>,
> +				 <PINMUX(72, 0)>,
> +				 <PINMUX(73, 0)>;
> +			bias-pull-up;
> +			drive-strength = <12>;
> +			input-enable;
> +		};
> +	};
> +
> +	mmc1_pins: mmc1-0 {
> +		clk-pins {
> +			pinmux = <GPIOMUX(10, GPOUT_SYS_SDIO1_CLK,
> +					      GPOEN_ENABLE,
> +					      GPI_NONE)>;
> +			bias-pull-up;
> +			drive-strength = <12>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		mmc-pins {
> +			pinmux = <GPIOMUX(9, GPOUT_SYS_SDIO1_CMD,
> +					     GPOEN_SYS_SDIO1_CMD,
> +					     GPI_SYS_SDIO1_CMD)>,
> +				 <GPIOMUX(11, GPOUT_SYS_SDIO1_DATA0,
> +					      GPOEN_SYS_SDIO1_DATA0,
> +					      GPI_SYS_SDIO1_DATA0)>,
> +				 <GPIOMUX(12, GPOUT_SYS_SDIO1_DATA1,
> +					      GPOEN_SYS_SDIO1_DATA1,
> +					      GPI_SYS_SDIO1_DATA1)>,
> +				 <GPIOMUX(7, GPOUT_SYS_SDIO1_DATA2,
> +					     GPOEN_SYS_SDIO1_DATA2,
> +					     GPI_SYS_SDIO1_DATA2)>,
> +				 <GPIOMUX(8, GPOUT_SYS_SDIO1_DATA3,
> +					     GPOEN_SYS_SDIO1_DATA3,
> +					     GPI_SYS_SDIO1_DATA3)>;
> +			bias-pull-up;
> +			drive-strength = <12>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	pwmdac_pins: pwmdac-0 {
> +		pwmdac-pins {
> +			pinmux = <GPIOMUX(33, GPOUT_SYS_PWMDAC_LEFT,
> +					      GPOEN_ENABLE,
> +					      GPI_NONE)>,
> +				 <GPIOMUX(34, GPOUT_SYS_PWMDAC_RIGHT,
> +					      GPOEN_ENABLE,
> +					      GPI_NONE)>;
> +			bias-disable;
> +			drive-strength = <2>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	pwm_pins: pwm-0 {
> +		pwm-pins {
> +			pinmux = <GPIOMUX(46, GPOUT_SYS_PWM_CHANNEL0,
> +					      GPOEN_SYS_PWM0_CHANNEL0,
> +					      GPI_NONE)>,
> +				 <GPIOMUX(59, GPOUT_SYS_PWM_CHANNEL1,
> +					      GPOEN_SYS_PWM0_CHANNEL1,
> +					      GPI_NONE)>;
> +			bias-disable;
> +			drive-strength = <12>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	spi0_pins: spi0-0 {
> +		mosi-pins {
> +			pinmux = <GPIOMUX(52, GPOUT_SYS_SPI0_TXD,
> +					      GPOEN_ENABLE,
> +					      GPI_NONE)>;
> +			bias-disable;
> +			input-disable;
> +			input-schmitt-disable;
> +		};
> +
> +		miso-pins {
> +			pinmux = <GPIOMUX(53, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_SYS_SPI0_RXD)>;
> +			bias-pull-up;
> +			input-enable;
> +			input-schmitt-enable;
> +		};
> +
> +		sck-pins {
> +			pinmux = <GPIOMUX(48, GPOUT_SYS_SPI0_CLK,
> +					      GPOEN_ENABLE,
> +					      GPI_SYS_SPI0_CLK)>;
> +			bias-disable;
> +			input-disable;
> +			input-schmitt-disable;
> +		};
> +
> +		ss-pins {
> +			pinmux = <GPIOMUX(49, GPOUT_SYS_SPI0_FSS,
> +					      GPOEN_ENABLE,
> +					      GPI_SYS_SPI0_FSS)>;
> +			bias-disable;
> +			input-disable;
> +			input-schmitt-disable;
> +		};
> +	};
> +
> +	uart0_pins: uart0-0 {
> +		tx-pins {
> +			pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX,
> +					     GPOEN_ENABLE,
> +					     GPI_NONE)>;
> +			bias-disable;
> +			drive-strength = <12>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		rx-pins {
> +			pinmux = <GPIOMUX(6, GPOUT_LOW,
> +					     GPOEN_DISABLE,
> +					     GPI_SYS_UART0_RX)>;
> +			bias-disable; /* external pull-up */
> +			drive-strength = <2>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pins>;
> +	status = "okay";
> +};
> +
> +&usb0 {
> +	dr_mode = "peripheral";
> +	status = "okay";
> +};
> +
> +&U74_1 {
> +	cpu-supply = <&vdd_cpu>;
> +};
> +
> +&U74_2 {
> +	cpu-supply = <&vdd_cpu>;
> +};
> +
> +&U74_3 {
> +	cpu-supply = <&vdd_cpu>;
> +};
> +
> +&U74_4 {
> +	cpu-supply = <&vdd_cpu>;
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index e19f26628054..9d70f21c86fc 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -5,188 +5,11 @@
>   */
>
>  /dts-v1/;
> -#include "jh7110.dtsi"
> -#include "jh7110-pinfunc.h"
> -#include <dt-bindings/gpio/gpio.h>
> +#include "jh7110-common.dtsi"
>
>  / {
>  	aliases {
> -		ethernet0 = &gmac0;
>  		ethernet1 = &gmac1;
> -		i2c0 = &i2c0;
> -		i2c2 = &i2c2;
> -		i2c5 = &i2c5;
> -		i2c6 = &i2c6;
> -		mmc0 = &mmc0;
> -		mmc1 = &mmc1;
> -		serial0 = &uart0;
> -	};
> -
> -	chosen {
> -		stdout-path = "serial0:115200n8";
> -	};
> -
> -	memory@40000000 {
> -		device_type = "memory";
> -		reg = <0x0 0x40000000 0x1 0x0>;
> -	};
> -
> -	gpio-restart {
> -		compatible = "gpio-restart";
> -		gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
> -		priority = <224>;
> -	};
> -
> -	pwmdac_codec: audio-codec {
> -		compatible = "linux,spdif-dit";
> -		#sound-dai-cells = <0>;
> -	};
> -
> -	sound {
> -		compatible = "simple-audio-card";
> -		simple-audio-card,name = "StarFive-PWMDAC-Sound-Card";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		simple-audio-card,dai-link@0 {
> -			reg = <0>;
> -			format = "left_j";
> -			bitclock-master = <&sndcpu0>;
> -			frame-master = <&sndcpu0>;
> -
> -			sndcpu0: cpu {
> -				sound-dai = <&pwmdac>;
> -			};
> -
> -			codec {
> -				sound-dai = <&pwmdac_codec>;
> -			};
> -		};
> -	};
> -};
> -
> -&cpus {
> -	timebase-frequency = <4000000>;
> -};
> -
> -&dvp_clk {
> -	clock-frequency = <74250000>;
> -};
> -
> -&gmac0_rgmii_rxin {
> -	clock-frequency = <125000000>;
> -};
> -
> -&gmac0_rmii_refin {
> -	clock-frequency = <50000000>;
> -};
> -
> -&gmac1_rgmii_rxin {
> -	clock-frequency = <125000000>;
> -};
> -
> -&gmac1_rmii_refin {
> -	clock-frequency = <50000000>;
> -};
> -
> -&hdmitx0_pixelclk {
> -	clock-frequency = <297000000>;
> -};
> -
> -&i2srx_bclk_ext {
> -	clock-frequency = <12288000>;
> -};
> -
> -&i2srx_lrck_ext {
> -	clock-frequency = <192000>;
> -};
> -
> -&i2stx_bclk_ext {
> -	clock-frequency = <12288000>;
> -};
> -
> -&i2stx_lrck_ext {
> -	clock-frequency = <192000>;
> -};
> -
> -&mclk_ext {
> -	clock-frequency = <12288000>;
> -};
> -
> -&osc {
> -	clock-frequency = <24000000>;
> -};
> -
> -&rtc_osc {
> -	clock-frequency = <32768>;
> -};
> -
> -&tdm_ext {
> -	clock-frequency = <49152000>;
> -};
> -
> -&camss {
> -	assigned-clocks = <&ispcrg JH7110_ISPCLK_DOM4_APB_FUNC>,
> -			  <&ispcrg JH7110_ISPCLK_MIPI_RX0_PXL>;
> -	assigned-clock-rates = <49500000>, <198000000>;
> -	status = "okay";
> -
> -	ports {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		port@0 {
> -			reg = <0>;
> -		};
> -
> -		port@1 {
> -			reg = <1>;
> -
> -			camss_from_csi2rx: endpoint {
> -				remote-endpoint = <&csi2rx_to_camss>;
> -			};
> -		};
> -	};
> -};
> -
> -&csi2rx {
> -	assigned-clocks = <&ispcrg JH7110_ISPCLK_VIN_SYS>;
> -	assigned-clock-rates = <297000000>;
> -	status = "okay";
> -
> -	ports {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		port@0 {
> -			reg = <0>;
> -
> -			/* remote MIPI sensor endpoint */
> -		};
> -
> -		port@1 {
> -			reg = <1>;
> -
> -			csi2rx_to_camss: endpoint {
> -				remote-endpoint = <&camss_from_csi2rx>;
> -			};
> -		};
> -	};
> -};
> -
> -&gmac0 {
> -	phy-handle = <&phy0>;
> -	phy-mode = "rgmii-id";
> -	status = "okay";
> -
> -	mdio {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		compatible = "snps,dwmac-mdio";
> -
> -		phy0: ethernet-phy@0 {
> -			reg = <0>;
> -		};
>  	};
>  };
>
> @@ -206,412 +29,6 @@ phy1: ethernet-phy@1 {
>  	};
>  };
>
> -&i2c0 {
> -	clock-frequency = <100000>;
> -	i2c-sda-hold-time-ns = <300>;
> -	i2c-sda-falling-time-ns = <510>;
> -	i2c-scl-falling-time-ns = <510>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&i2c0_pins>;
> -	status = "okay";
> -};
> -
> -&i2c2 {
> -	clock-frequency = <100000>;
> -	i2c-sda-hold-time-ns = <300>;
> -	i2c-sda-falling-time-ns = <510>;
> -	i2c-scl-falling-time-ns = <510>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&i2c2_pins>;
> -	status = "okay";
> -};
> -
> -&i2c5 {
> -	clock-frequency = <100000>;
> -	i2c-sda-hold-time-ns = <300>;
> -	i2c-sda-falling-time-ns = <510>;
> -	i2c-scl-falling-time-ns = <510>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&i2c5_pins>;
> -	status = "okay";
> -
> -	axp15060: pmic@36 {
> -		compatible = "x-powers,axp15060";
> -		reg = <0x36>;
> -		interrupt-controller;
> -		#interrupt-cells = <1>;
> -
> -		regulators {
> -			vcc_3v3: dcdc1 {
> -				regulator-boot-on;
> -				regulator-always-on;
> -				regulator-min-microvolt = <3300000>;
> -				regulator-max-microvolt = <3300000>;
> -				regulator-name = "vcc_3v3";
> -			};
> -
> -			vdd_cpu: dcdc2 {
> -				regulator-always-on;
> -				regulator-min-microvolt = <500000>;
> -				regulator-max-microvolt = <1540000>;
> -				regulator-name = "vdd-cpu";
> -			};
> -
> -			emmc_vdd: aldo4 {
> -				regulator-boot-on;
> -				regulator-always-on;
> -				regulator-min-microvolt = <1800000>;
> -				regulator-max-microvolt = <1800000>;
> -				regulator-name = "emmc_vdd";
> -			};
> -		};
> -	};
> -};
> -
> -&i2c6 {
> -	clock-frequency = <100000>;
> -	i2c-sda-hold-time-ns = <300>;
> -	i2c-sda-falling-time-ns = <510>;
> -	i2c-scl-falling-time-ns = <510>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&i2c6_pins>;
> -	status = "okay";
> -};
> -
>  &mmc0 {
> -	max-frequency = <100000000>;
> -	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
> -	assigned-clock-rates = <50000000>;
> -	bus-width = <8>;
> -	cap-mmc-highspeed;
> -	mmc-ddr-1_8v;
> -	mmc-hs200-1_8v;
>  	non-removable;
> -	cap-mmc-hw-reset;
> -	post-power-on-delay-ms = <200>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&mmc0_pins>;
> -	vmmc-supply = <&vcc_3v3>;
> -	vqmmc-supply = <&emmc_vdd>;
> -	status = "okay";
> -};
> -
> -&mmc1 {
> -	max-frequency = <100000000>;
> -	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO1_SDCARD>;
> -	assigned-clock-rates = <50000000>;
> -	bus-width = <4>;
> -	no-sdio;
> -	no-mmc;
> -	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> -	disable-wp;
> -	cap-sd-highspeed;
> -	post-power-on-delay-ms = <200>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&mmc1_pins>;
> -	status = "okay";
> -};
> -
> -&pwmdac {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pwmdac_pins>;
> -	status = "okay";
> -};
> -
> -&qspi {
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -	status = "okay";
> -
> -	nor_flash: flash@0 {
> -		compatible = "jedec,spi-nor";
> -		reg = <0>;
> -		cdns,read-delay = <5>;
> -		spi-max-frequency = <12000000>;
> -		cdns,tshsl-ns = <1>;
> -		cdns,tsd2d-ns = <1>;
> -		cdns,tchsh-ns = <1>;
> -		cdns,tslch-ns = <1>;
> -
> -		partitions {
> -			compatible = "fixed-partitions";
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -
> -			spl@0 {
> -				reg = <0x0 0x80000>;
> -			};
> -			uboot-env@f0000 {
> -				reg = <0xf0000 0x10000>;
> -			};
> -			uboot@100000 {
> -				reg = <0x100000 0x400000>;
> -			};
> -			reserved-data@600000 {
> -				reg = <0x600000 0xa00000>;
> -			};
> -		};
> -	};
> -};
> -
> -&pwm {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pwm_pins>;
> -	status = "okay";
> -};
> -
> -&spi0 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&spi0_pins>;
> -	status = "okay";
> -
> -	spi_dev0: spi@0 {
> -		compatible = "rohm,dh2228fv";
> -		reg = <0>;
> -		spi-max-frequency = <10000000>;
> -	};
> -};
> -
> -&sysgpio {
> -	i2c0_pins: i2c0-0 {
> -		i2c-pins {
> -			pinmux = <GPIOMUX(57, GPOUT_LOW,
> -					      GPOEN_SYS_I2C0_CLK,
> -					      GPI_SYS_I2C0_CLK)>,
> -				 <GPIOMUX(58, GPOUT_LOW,
> -					      GPOEN_SYS_I2C0_DATA,
> -					      GPI_SYS_I2C0_DATA)>;
> -			bias-disable; /* external pull-up */
> -			input-enable;
> -			input-schmitt-enable;
> -		};
> -	};
> -
> -	i2c2_pins: i2c2-0 {
> -		i2c-pins {
> -			pinmux = <GPIOMUX(3, GPOUT_LOW,
> -					     GPOEN_SYS_I2C2_CLK,
> -					     GPI_SYS_I2C2_CLK)>,
> -				 <GPIOMUX(2, GPOUT_LOW,
> -					     GPOEN_SYS_I2C2_DATA,
> -					     GPI_SYS_I2C2_DATA)>;
> -			bias-disable; /* external pull-up */
> -			input-enable;
> -			input-schmitt-enable;
> -		};
> -	};
> -
> -	i2c5_pins: i2c5-0 {
> -		i2c-pins {
> -			pinmux = <GPIOMUX(19, GPOUT_LOW,
> -					      GPOEN_SYS_I2C5_CLK,
> -					      GPI_SYS_I2C5_CLK)>,
> -				 <GPIOMUX(20, GPOUT_LOW,
> -					      GPOEN_SYS_I2C5_DATA,
> -					      GPI_SYS_I2C5_DATA)>;
> -			bias-disable; /* external pull-up */
> -			input-enable;
> -			input-schmitt-enable;
> -		};
> -	};
> -
> -	i2c6_pins: i2c6-0 {
> -		i2c-pins {
> -			pinmux = <GPIOMUX(16, GPOUT_LOW,
> -					      GPOEN_SYS_I2C6_CLK,
> -					      GPI_SYS_I2C6_CLK)>,
> -				 <GPIOMUX(17, GPOUT_LOW,
> -					      GPOEN_SYS_I2C6_DATA,
> -					      GPI_SYS_I2C6_DATA)>;
> -			bias-disable; /* external pull-up */
> -			input-enable;
> -			input-schmitt-enable;
> -		};
> -	};
> -
> -	mmc0_pins: mmc0-0 {
> -		 rst-pins {
> -			pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
> -					      GPOEN_ENABLE,
> -					      GPI_NONE)>;
> -			bias-pull-up;
> -			drive-strength = <12>;
> -			input-disable;
> -			input-schmitt-disable;
> -			slew-rate = <0>;
> -		};
> -
> -		mmc-pins {
> -			pinmux = <PINMUX(64, 0)>,
> -				 <PINMUX(65, 0)>,
> -				 <PINMUX(66, 0)>,
> -				 <PINMUX(67, 0)>,
> -				 <PINMUX(68, 0)>,
> -				 <PINMUX(69, 0)>,
> -				 <PINMUX(70, 0)>,
> -				 <PINMUX(71, 0)>,
> -				 <PINMUX(72, 0)>,
> -				 <PINMUX(73, 0)>;
> -			bias-pull-up;
> -			drive-strength = <12>;
> -			input-enable;
> -		};
> -	};
> -
> -	mmc1_pins: mmc1-0 {
> -		clk-pins {
> -			pinmux = <GPIOMUX(10, GPOUT_SYS_SDIO1_CLK,
> -					      GPOEN_ENABLE,
> -					      GPI_NONE)>;
> -			bias-pull-up;
> -			drive-strength = <12>;
> -			input-disable;
> -			input-schmitt-disable;
> -			slew-rate = <0>;
> -		};
> -
> -		mmc-pins {
> -			pinmux = <GPIOMUX(9, GPOUT_SYS_SDIO1_CMD,
> -					     GPOEN_SYS_SDIO1_CMD,
> -					     GPI_SYS_SDIO1_CMD)>,
> -				 <GPIOMUX(11, GPOUT_SYS_SDIO1_DATA0,
> -					      GPOEN_SYS_SDIO1_DATA0,
> -					      GPI_SYS_SDIO1_DATA0)>,
> -				 <GPIOMUX(12, GPOUT_SYS_SDIO1_DATA1,
> -					      GPOEN_SYS_SDIO1_DATA1,
> -					      GPI_SYS_SDIO1_DATA1)>,
> -				 <GPIOMUX(7, GPOUT_SYS_SDIO1_DATA2,
> -					     GPOEN_SYS_SDIO1_DATA2,
> -					     GPI_SYS_SDIO1_DATA2)>,
> -				 <GPIOMUX(8, GPOUT_SYS_SDIO1_DATA3,
> -					     GPOEN_SYS_SDIO1_DATA3,
> -					     GPI_SYS_SDIO1_DATA3)>;
> -			bias-pull-up;
> -			drive-strength = <12>;
> -			input-enable;
> -			input-schmitt-enable;
> -			slew-rate = <0>;
> -		};
> -	};
> -
> -	pwmdac_pins: pwmdac-0 {
> -		pwmdac-pins {
> -			pinmux = <GPIOMUX(33, GPOUT_SYS_PWMDAC_LEFT,
> -					      GPOEN_ENABLE,
> -					      GPI_NONE)>,
> -				 <GPIOMUX(34, GPOUT_SYS_PWMDAC_RIGHT,
> -					      GPOEN_ENABLE,
> -					      GPI_NONE)>;
> -			bias-disable;
> -			drive-strength = <2>;
> -			input-disable;
> -			input-schmitt-disable;
> -			slew-rate = <0>;
> -		};
> -	};
> -
> -	pwm_pins: pwm-0 {
> -		pwm-pins {
> -			pinmux = <GPIOMUX(46, GPOUT_SYS_PWM_CHANNEL0,
> -					      GPOEN_SYS_PWM0_CHANNEL0,
> -					      GPI_NONE)>,
> -				 <GPIOMUX(59, GPOUT_SYS_PWM_CHANNEL1,
> -					      GPOEN_SYS_PWM0_CHANNEL1,
> -					      GPI_NONE)>;
> -			bias-disable;
> -			drive-strength = <12>;
> -			input-disable;
> -			input-schmitt-disable;
> -			slew-rate = <0>;
> -		};
> -	};
> -
> -	spi0_pins: spi0-0 {
> -		mosi-pins {
> -			pinmux = <GPIOMUX(52, GPOUT_SYS_SPI0_TXD,
> -					      GPOEN_ENABLE,
> -					      GPI_NONE)>;
> -			bias-disable;
> -			input-disable;
> -			input-schmitt-disable;
> -		};
> -
> -		miso-pins {
> -			pinmux = <GPIOMUX(53, GPOUT_LOW,
> -					      GPOEN_DISABLE,
> -					      GPI_SYS_SPI0_RXD)>;
> -			bias-pull-up;
> -			input-enable;
> -			input-schmitt-enable;
> -		};
> -
> -		sck-pins {
> -			pinmux = <GPIOMUX(48, GPOUT_SYS_SPI0_CLK,
> -					      GPOEN_ENABLE,
> -					      GPI_SYS_SPI0_CLK)>;
> -			bias-disable;
> -			input-disable;
> -			input-schmitt-disable;
> -		};
> -
> -		ss-pins {
> -			pinmux = <GPIOMUX(49, GPOUT_SYS_SPI0_FSS,
> -					      GPOEN_ENABLE,
> -					      GPI_SYS_SPI0_FSS)>;
> -			bias-disable;
> -			input-disable;
> -			input-schmitt-disable;
> -		};
> -	};
> -
> -	uart0_pins: uart0-0 {
> -		tx-pins {
> -			pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX,
> -					     GPOEN_ENABLE,
> -					     GPI_NONE)>;
> -			bias-disable;
> -			drive-strength = <12>;
> -			input-disable;
> -			input-schmitt-disable;
> -			slew-rate = <0>;
> -		};
> -
> -		rx-pins {
> -			pinmux = <GPIOMUX(6, GPOUT_LOW,
> -					     GPOEN_DISABLE,
> -					     GPI_SYS_UART0_RX)>;
> -			bias-disable; /* external pull-up */
> -			drive-strength = <2>;
> -			input-enable;
> -			input-schmitt-enable;
> -			slew-rate = <0>;
> -		};
> -	};
> -};
> -
> -&uart0 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&uart0_pins>;
> -	status = "okay";
> -};
> -
> -&usb0 {
> -	dr_mode = "peripheral";
> -	status = "okay";
> -};
> -
> -&U74_1 {
> -	cpu-supply = <&vdd_cpu>;
> -};
> -
> -&U74_2 {
> -	cpu-supply = <&vdd_cpu>;
> -};
> -
> -&U74_3 {
> -	cpu-supply = <&vdd_cpu>;
> -};
> -
> -&U74_4 {
> -	cpu-supply = <&vdd_cpu>;
>  };
> --
> 2.43.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
