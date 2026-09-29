Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BBDCA5FA1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vt7n9HTw0J4dV4j4HeieJ14+EJ33HYqJehy2Xi8XSDA=; b=4N7TPQsfb9wsm1
	kEBaggpBmWk/MDhvKNArfLBa0UGZK11nHRzeLw8/YocvyjEts50THHkN8uBrFamPVqVywiksj1VVk
	3vgXF+XBh0yocP6Soty6ZLfToWxBbM+ZYIQ3oIHAZ3ot2hVTl7+keKasj8cCmKGbgM67sGnAX1Z6p
	+cHLuhhmgEKggIKTWRI/1hC6ohgDUXQQZ99FZpoSt0Fflrkgf9NH+2N1XIv5EVP/dHwMiNrjal9k7
	miMPB2x46RRNqzXYP+jGNL8t6QcBxMNGczi2Vfa39nILbLQs/JkWq1iAcNK/407wJCB65eUA6+5RF
	IrtjvrE1QXXsCo7xP/3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXXZ-00000003cvl-2PT6;
	Tue, 29 Sep 2026 13:06:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXXX-00000003cvT-3wIq
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Sep 2026 13:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jd1zbZdLL50CgURj9sS6n0lKoZ1mUjSAM58E1Zhv5hk=; b=LTiZEdHoee+RtRblo0H7cAgDCx
	D4/YsNAqQlwapzCYF6RYmqrr7vDPiNDi4+C49GgPtxklTKeLkakZR52SfUYjryST45Z8w4q2F6Kxt
	R/R+JDpEF4kJqyaYgWaHPgQE71J0OjG69tJQcm8TYfn3w7DVAyJPI9QTQMgxZofl1pwdeHAbL2Df0
	KzdIxerhb/K73b9YV9+t10DyvSRET4hfjpHYTIbkw07tQH9yuXO3FhlomVl8r78kD3nDZEUdzt1EJ
	lPkpALGt/+U6kqg43gacs3bDRQ7tmZKkzpU2pLnlOeop8IrW8YG86dMr/IZe+vc0iF7zRZ0Z16FvD
	4rqFNd5g==;
Received: from mail-oa2-x2a.google.com ([2607:f8b0:4864:30::2a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBXXR-00000002ebI-1Uze
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 13:06:34 +0000
Received: by mail-oa2-x2a.google.com with SMTP id 586e51a60fabf-483c65c2fa7so2321536fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 06:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790687186; x=1791291986; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jd1zbZdLL50CgURj9sS6n0lKoZ1mUjSAM58E1Zhv5hk=;
        b=jQ7VL10go3LNznBBstNBx681ToVdP15pG3BgJOQUbZnYp2ficZdNhRQLCGwnyebNLE
         snFrfClKBVeg89yhCCPRiSq69ImYsznDYG9d4300deS21quzFsR8aaq+HNsaNa7XfRFZ
         oWPjfTnblKs1o2coucHUhPYZvgVp1RlNxgI1pkTATgftRwitS4YZTGd9ecBxRpCjQ0mm
         Pgm5ZsKbIv3vP7X6LyxBE60hvVHj9DwjKARR+7zDbvZ9o6E9Heb0JFtKj3k8rjITgcx9
         Sc8kKMftL2hJigiNsY8PhaWDx5t3ljivoMD4nq+29yEUjecTeQEzTyG6XYU4fQ+fmr0u
         KSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687186; x=1791291986;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jd1zbZdLL50CgURj9sS6n0lKoZ1mUjSAM58E1Zhv5hk=;
        b=ZHVYdKwoTdd5/TnqOGxIr7iOK72rKqZK4DOlgoPpR7K4SYyft2J20IGV2J8LOzJg/U
         iucE5pJ1FSBfxwvgncYxUy6DdxPelgIF9IWqUYky4kut9GArtqmSdPusUPltTUfBoYps
         fhZ+MAB0GbCrpGoz6iX6UiKtssMcPXSH35oAEh5Yg23AkASvIRU2codVKqQe3pQjpaSz
         4ECxv7dFs5Qy8Nq3Xu27k4sGYj7omDHajpbYf6l099Bfm2JXELfZikrIcpoHDS9REuHM
         rRfBiXn6l0a2/o7fRfOPnTdu8WxD4U9ByBJWWN3xYo7f/6qEfD6Ja/UAKYXFx3zpXe43
         TtcA==
X-Forwarded-Encrypted: i=1; AKwUvBxRNoBPPpDQd1LPfrpwgH6qWL+choi9E8D50Gg3uxv3Z8H689A3rRfkCfJeiYsQlZmDUavCYEV3LX4nmQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYI7iCj9BefdKeRZR28y1hfKRNjrhGKZGGZSuFyf40pkYU8ln5ah
	rbZzNUNAH8SG/hxrQirukoEE8GnEDNRAjNepn04e5tCDu9iLDxM6ruVqP4Nq4HGsxNQ=
X-Gm-Gg: AYBFou2eZvwcazEjl3SlgwKtv1Z+CrOWd5hywDHyb7XIl3c6Oris3WsntWKqyEH15kd
	Iahf7iA7ktvjXtI/KHlLqH4v0eUyuD5yRBRI2QyKAbjZmoUsMs1b96F7Q12Icnya/5+j3sGi8bG
	Dny6k5r2W0N6vsv1R1saGcio8qt0QFiis5Vinjr5p5j21cpY8nsOYqEFOVw3/bAc0bzZWIU8+wZ
	rDIkJdke1nQJqim1WeyycZzScZzFzsr3Vt0z1eMy2OsIce0QooOD/r8pSaGsVyztKrSGXdZ3vvk
	Dv1lveZI1FcG5eU869D5+89tSmsK27MMZYodyKkB9Xk7cx3rJ9FwaGtBW1zUN2VgCsxWLjNPbqE
	TqR1SsPPwdj0LWLXUv5XRVcsozTwFeeYSgz1HyEkMFkiJkXp58I9GLhMPgsL+iA3NhSjJYCV0sg
	dEvomqbtRUgWIdnJosDZZiRJeoR9jhNj3v4EpRBIg9dBgymYqUAU5lfGsYlAUfRcX8XxtKytTVv
	HigKB5lrJ0QZFwYU/4doA==
X-Received: by 2002:a05:6870:3453:b0:475:a153:2dc3 with SMTP id 586e51a60fabf-491e9fcab5bmr13126204fac.25.1790687185857;
        Tue, 29 Sep 2026 06:06:25 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.13.74])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49aa22c264fsm933437fac.2.2026.09.29.06.06.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 06:06:25 -0700 (PDT)
Message-ID: <b7428a65-b303-4ed4-bdc0-caf5a89b4712@sifive.com>
Date: Tue, 29 Sep 2026 08:06:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] riscv: dts: eswin: eic7700: add pinctrl support
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andi Shyti <andi.shyti@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Min Lin <linmin@eswincomputing.com>
References: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
 <20260814070007.1662455-4-pinkesh.vaghela@einfochips.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260814070007.1662455-4-pinkesh.vaghela@einfochips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_140632_642939_FC5967E5 
X-CRM114-Status: GOOD (  21.59  )
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

Hi Pinkesh,

On 2026-08-14 2:00 AM, Pinkesh Vaghela wrote:
> From: Yulin Lu <luyulin@eswincomputing.com>
> 
> Add pinctrl node and related pin configuration for EIC7700 SoC
> 
> Co-developed-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  .../dts/eswin/eic7700-hifive-premier-p550.dts | 119 +++
>  .../riscv/boot/dts/eswin/eic7700-pinctrl.dtsi | 888 ++++++++++++++++++
>  arch/riscv/boot/dts/eswin/eic7700.dtsi        |   5 +
>  3 files changed, 1012 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi
> 
> diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> index a5c76b14a38f..3101fd90d171 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>  
>  #include "eic7700.dtsi"
> +#include "eic7700-pinctrl.dtsi"
>  
>  / {
>  	compatible = "sifive,hifive-premier-p550", "eswin,eic7700";
> @@ -18,6 +19,15 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	vcc_1v8: regulator-vcc1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc1v8";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
>  };
>  
>  &osc {
> @@ -25,10 +35,119 @@ &osc {
>  	clock-output-names = "osc_24m";
>  };
>  
> +&gpio0_pins {
> +	bias-disable;
> +	input-enable;
> +};

Node references should be kept sorted (these go above "osc").

> +
> +&gpio5_pins {
> +	bias-disable;
> +	input-enable;
> +};
> +
> +&gpio11_pins {
> +	bias-disable;
> +	input-enable;
> +};
> +
> +&gpio14_pins {
> +	bias-pull-up;
> +	input-disable;
> +};
> +
> +&gpio15_pins {
> +	bias-disable;
> +	input-enable;
> +};
> +
> +&gpio28_pins {
> +	bias-disable;
> +	input-enable;
> +};
> +
> +&gpio43_pins {
> +	bias-disable;
> +	input-disable;
> +};
> +
> +&gpio71_pins {
> +	bias-pull-up;
> +	input-disable;
> +};
> +
> +&gpio74_pins {
> +	bias-pull-up;
> +	input-disable;
> +};
> +
> +&gpio76_pins {
> +	bias-disable;
> +	input-disable;
> +};
> +
> +&gpio77_pins {
> +	bias-pull-up;
> +	input-disable;
> +};
> +
> +&gpio79_pins {
> +	bias-disable;
> +	input-disable;
> +};
> +
> +&gpio80_pins {
> +	bias-pull-up;
> +	input-disable;
> +};
> +
> +&gpio82_pins {
> +	bias-pull-up;
> +	input-disable;
> +};
> +
> +&gpio84_pins {
> +	bias-disable;
> +	input-disable;
> +};
> +
> +&gpio85_pins {
> +	bias-pull-up;
> +	input-disable;
> +};
> +
> +&gpio94_pins {
> +	bias-disable;
> +	input-disable;
> +};
> +
> +&gpio106_pins {
> +	bias-disable;
> +	input-disable;
> +};
> +
> +&gpio111_pins {
> +	bias-disable;
> +	input-disable;
> +};
> +
> +&pinctrl {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gpio0_pins>, <&gpio5_pins>, <&gpio11_pins>,
> +		    <&gpio14_pins>, <&gpio15_pins>, <&gpio28_pins>, <&gpio43_pins>,
> +		    <&gpio71_pins>, <&gpio74_pins>, <&gpio76_pins>, <&gpio77_pins>,
> +		    <&gpio79_pins>, <&gpio80_pins>, <&gpio82_pins>, <&gpio84_pins>,
> +		    <&gpio85_pins>, <&gpio94_pins>, <&gpio106_pins>, <&gpio111_pins>;

Generally the pinctrl for GPIOs should be referenced by the actual consumer, for
example GPIO_084 controls an onboard LED, so the pinctrl should be referenced by
the gpio-leds node.

> +	vrgmii-supply = <&vcc_1v8>;
> +};
> +
>  &uart0 {
>  	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pins>;
>  };
>  
>  &uart2 {
>  	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart2_pins>;
>  };
> diff --git a/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi b/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi
> new file mode 100644
> index 000000000000..2d655b442982
> --- /dev/null
> +++ b/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi
> @@ -0,0 +1,888 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 Beijing ESWIN Computing Technology Co., Ltd.
> + *
> + * ESWIN's EIC7700 SoC pin-mux and pin-config options are listed as
> + * device tree nodes in this file.
> + *
> + * Authors: Yulin Lu <luyulin@eswincomputing.com>
> + */
> +
> +&pinctrl{

Missing space here (and check other lines below).

> +	default-pins-grp {

My assumption is that there would be one group per peripheral (e.g. SPI bus,
eMMC, UART) that groups all of the pins used by that peripheral, with multiple
"-pins" nodes in the case that subsets of those pins need different pinconf
settings.

> +		sata_act_led_pins: sata-act-led-pins{

All of these -pins nodes should be annotated with /omit-if-no-ref/.

> +			pins = "gpio27";
> +			function = "sata";
> +		};
> +
> +		emmc_led_ctrl_pins: emmc-led-ctrl-pins {
> +			pins = "gpio29";
> +			function = "emmc";
> +		};
> +
> +		sd0_led_ctrl_pins: sd0-led-ctrl-pins {
> +			pins = "gpio34";
> +			function = "sdio";
> +		};
> +
> +		sd1_led_ctrl_pins: sd1-led-ctrl-pins {
> +			pins = "spi1_d2";
> +			function = "sdio";
> +		};
> +
> +		i2c6_pins: i2c6-pins {
> +			pins = "uart1_cts", "uart1_rts";
> +			function = "i2c";
> +		};
> +
> +		i2c7_pins: i2c7-pins {
> +			pins = "uart2_tx", "uart2_rx";
> +			function = "i2c";
> +		};
> +
> +		i2c9_pins: i2c9-pins {
> +			pins = "spi1_d0", "spi1_d1";
> +			function = "i2c";
> +		};
> +
> +		pwm1_pins: pwm1-pins {
> +			pins = "spi1_d3";
> +			function = "pwm";
> +		};
> +
> +		pwm2_pins: pwm2-pins {
> +			pins = "spi1_cs1_n";
> +			function = "pwm";
> +		};
> +
> +		mipi_csi_xtrig0_pins: mipi-csi-xtrig0-pins {
> +			pins = "gpio92";
> +			function = "mipi_csi";
> +		};
> +
> +		mipi_csi_xtrig1_pins: mipi-csi-xtrig1-pins {
> +			pins = "gpio93";
> +			function = "mipi_csi";
> +		};
> +
> +		dual_spi2_pins: dual-spi2-pins {
> +			pins = "spi2_cs0_n", "jtag0_tck", "jtag0_tms", "jtag0_tdi";
> +			function = "spi";
> +		};
> +
> +		quad_spi2_pins: quad-spi2-pins {
> +			pins = "spi2_cs0_n", "spi2_cs1_n", "jtag0_tck", "jtag0_tms",
> +			       "jtag0_tdi", "jtag0_tdo", "gpio5";
> +			function = "spi";
> +		};

A peripheral can reference several pinctrl nodes, so generally we wouldn't
duplicate the pins here. Only the additional pins would go in quad-spi2-pins,
and the controller would reference both it and dual-spi2-pins for a quad bus.

> +
> +		gpio1_pins: gpio1-pins {
> +			pins = "jtag0_tck";
> +			function = "gpio";
> +		};
> +
> +		gpio2_pins: gpio2-pins {
> +			pins = "jtag0_tms";
> +			function = "gpio";
> +		};
> +
> +		gpio3_pins: gpio3-pins {
> +			pins = "jtag0_tdi";
> +			function = "gpio";
> +		};
> +
> +		gpio4_pins: gpio4-pins {
> +			pins = "jtag0_tdo";
> +			function = "gpio";
> +		};
> +
> +		gpio6_pins: gpio6-pins {
> +			pins = "spi2_cs0_n";
> +			function = "gpio";
> +		};
> +
> +		gpio7_pins: gpio7-pins {
> +			pins = "jtag1_tck";
> +			function = "gpio";
> +		};
> +
> +		gpio8_pins: gpio8-pins {
> +			pins = "jtag1_tms";
> +			function = "gpio";
> +		};
> +
> +		gpio9_pins: gpio9-pins {
> +			pins = "jtag1_tdi";
> +			function = "gpio";
> +		};
> +
> +		gpio10_pins: gpio10-pins {
> +			pins = "jtag1_tdo";
> +			function = "gpio";
> +		};
> +
> +		gpio12_pins: gpio12-pins {
> +			pins = "spi2_cs1_n";
> +			function = "gpio";
> +		};
> +
> +		gpio13_pins: gpio13-pins {
> +			pins = "mode_set0";
> +			function = "gpio";
> +		};
> +
> +		gpio14_pins: gpio14-pins {
> +			pins = "mode_set1";
> +			function = "gpio";
> +		};
> +
> +		gpio15_pins: gpio15-pins {
> +			pins = "mode_set2";
> +			function = "gpio";
> +		};
> +
> +		gpio16_pins: gpio16-pins {
> +			pins = "mode_set3";
> +			function = "gpio";
> +		};
> +
> +		gpio17_pins: gpio17-pins {
> +			pins = "jtag2_trst";
> +			function = "gpio";
> +		};
> +
> +		gpio18_pins: gpio18-pins {
> +			pins = "i2s0_bclk";
> +			function = "gpio";
> +		};
> +
> +		gpio19_pins: gpio19-pins {
> +			pins = "i2s0_wclk";
> +			function = "gpio";
> +		};
> +
> +		gpio20_pins: gpio20-pins {
> +			pins = "i2s0_sdi";
> +			function = "gpio";
> +		};
> +
> +		gpio21_pins: gpio21-pins {
> +			pins = "i2s0_sdo";
> +			function = "gpio";
> +		};
> +
> +		gpio22_pins: gpio22-pins {
> +			pins = "i2s_mclk";
> +			function = "gpio";
> +		};
> +
> +		gpio23_pins: gpio23-pins {
> +			pins = "i2s2_bclk";
> +			function = "gpio";
> +		};
> +
> +		gpio24_pins: gpio24-pins {
> +			pins = "i2s2_wclk";
> +			function = "gpio";
> +		};
> +
> +		gpio25_pins: gpio25-pins {
> +			pins = "i2s2_sdi";
> +			function = "gpio";
> +		};
> +
> +		gpio26_pins: gpio26-pins {
> +			pins = "i2s2_sdo";
> +			function = "gpio";
> +		};
> +
> +		gpio29_pins: gpio29-pins {
> +			pins = "gpio29";
> +			function = "gpio";
> +		};
> +
> +		gpio30_pins: gpio30-pins {
> +			pins = "i2s1_bclk";
> +			function = "gpio";
> +		};
> +
> +		gpio31_pins: gpio31-pins {
> +			pins = "i2s1_wclk";
> +			function = "gpio";
> +		};
> +
> +		gpio32_pins: gpio32-pins {
> +			pins = "i2s1_sdi";
> +			function = "gpio";
> +		};
> +
> +		gpio33_pins: gpio33-pins {
> +			pins = "i2s1_sdo";
> +			function = "gpio";
> +		};
> +
> +		gpio34_pins: gpio34-pins {
> +			pins = "gpio34";
> +			function = "gpio";
> +		};
> +
> +		gpio35_pins: gpio35-pins {
> +			pins = "spi1_cs0_n";
> +			function = "gpio";
> +		};
> +
> +		gpio36_pins: gpio36-pins {
> +			pins = "spi1_clk";
> +			function = "gpio";
> +		};
> +
> +		gpio37_pins: gpio37-pins {
> +			pins = "spi1_d0";
> +			function = "gpio";
> +		};
> +
> +		gpio38_pins: gpio38-pins {
> +			pins = "spi1_d1";
> +			function = "gpio";
> +		};
> +
> +		gpio39_pins: gpio39-pins {
> +			pins = "spi1_d2";
> +			function = "gpio";
> +		};
> +
> +		gpio40_pins: gpio40-pins {
> +			pins = "spi1_d3";
> +			function = "gpio";
> +		};
> +
> +		gpio41_pins: gpio41-pins {
> +			pins = "spi1_cs1_n";
> +			function = "gpio";
> +		};
> +
> +		gpio42_pins: gpio42-pins {
> +			pins = "usb0_pwren";
> +			function = "gpio";
> +		};
> +
> +		gpio43_pins: gpio43-pins {
> +			pins = "usb1_pwren";
> +			function = "gpio";
> +		};
> +
> +		gpio44_pins: gpio44-pins {
> +			pins = "i2c0_scl";
> +			function = "gpio";
> +		};
> +
> +		gpio45_pins: gpio45-pins {
> +			pins = "i2c0_sda";
> +			function = "gpio";
> +		};
> +
> +		gpio46_pins: gpio46-pins {
> +			pins = "i2c1_scl";
> +			function = "gpio";
> +		};
> +
> +		gpio47_pins: gpio47-pins {
> +			pins = "i2c1_sda";
> +			function = "gpio";
> +		};
> +
> +		gpio48_pins: gpio48-pins {
> +			pins = "i2c2_scl";
> +			function = "gpio";
> +		};
> +
> +		gpio49_pins: gpio49-pins {
> +			pins = "i2c2_sda";
> +			function = "gpio";
> +		};
> +
> +		gpio50_pins: gpio50-pins {
> +			pins = "i2c3_scl";
> +			function = "gpio";
> +		};
> +
> +		gpio51_pins: gpio51-pins {
> +			pins = "i2c3_sda";
> +			function = "gpio";
> +		};
> +
> +		gpio52_pins: gpio52-pins {
> +			pins = "i2c4_scl";
> +			function = "gpio";
> +		};
> +
> +		gpio53_pins: gpio53-pins {
> +			pins = "i2c4_sda";
> +			function = "gpio";
> +		};
> +
> +		gpio54_pins: gpio54-pins {
> +			pins = "i2c5_scl";
> +			function = "gpio";
> +		};
> +
> +		gpio55_pins: gpio55-pins {
> +			pins = "i2c5_sda";
> +			function = "gpio";
> +		};
> +
> +		gpio56_pins: gpio56-pins {
> +			pins = "uart0_tx";
> +			function = "gpio";
> +		};
> +
> +		gpio57_pins: gpio57-pins {
> +			pins = "uart0_rx";
> +			function = "gpio";
> +		};
> +
> +		gpio58_pins: gpio58-pins {
> +			pins = "uart1_tx";
> +			function = "gpio";
> +		};
> +
> +		gpio59_pins: gpio59-pins {
> +			pins = "uart1_rx";
> +			function = "gpio";
> +		};
> +
> +		gpio60_pins: gpio60-pins {
> +			pins = "uart1_cts";
> +			function = "gpio";
> +		};
> +
> +		gpio61_pins: gpio61-pins {
> +			pins = "uart1_rts";
> +			function = "gpio";
> +		};
> +
> +		gpio62_pins: gpio62-pins {
> +			pins = "uart2_tx";
> +			function = "gpio";
> +		};
> +
> +		gpio63_pins: gpio63-pins {
> +			pins = "uart2_rx";
> +			function = "gpio";
> +		};
> +
> +		gpio64_pins: gpio64-pins {
> +			pins = "jtag2_tck";
> +			function = "gpio";
> +		};
> +
> +		gpio65_pins: gpio65-pins {
> +			pins = "jtag2_tms";
> +			function = "gpio";
> +		};
> +
> +		gpio66_pins: gpio66-pins {
> +			pins = "jtag2_tdi";
> +			function = "gpio";
> +		};
> +
> +		gpio67_pins: gpio67-pins {
> +			pins = "jtag2_tdo";
> +			function = "gpio";
> +		};
> +
> +		gpio68_pins: gpio68-pins {
> +			pins = "fan_pwm";
> +			function = "gpio";
> +		};
> +
> +		gpio69_pins: gpio69-pins {
> +			pins = "fan_tach";
> +			function = "gpio";
> +		};
> +
> +		gpio70_pins: gpio70-pins {
> +			pins = "mipi_csi0_xvs";
> +			function = "gpio";
> +		};
> +
> +		gpio71_pins: gpio71-pins {
> +			pins = "mipi_csi0_xhs";
> +			function = "gpio";
> +		};
> +
> +		gpio72_pins: gpio72-pins {
> +			pins = "mipi_csi0_mclk";
> +			function = "gpio";
> +		};
> +
> +		gpio73_pins: gpio73-pins {
> +			pins = "mipi_csi1_xvs";
> +			function = "gpio";
> +		};
> +
> +		gpio74_pins: gpio74-pins {
> +			pins = "mipi_csi1_xhs";
> +			function = "gpio";
> +		};
> +
> +		gpio75_pins: gpio75-pins {
> +			pins = "mipi_csi1_mclk";
> +			function = "gpio";
> +		};
> +
> +		gpio76_pins: gpio76-pins {
> +			pins = "mipi_csi2_xvs";
> +			function = "gpio";
> +		};
> +
> +		gpio77_pins: gpio77-pins {
> +			pins = "mipi_csi2_xhs";
> +			function = "gpio";
> +		};
> +
> +		gpio78_pins: gpio78-pins {
> +			pins = "mipi_csi2_mclk";
> +			function = "gpio";
> +		};
> +
> +		gpio79_pins: gpio79-pins {
> +			pins = "mipi_csi3_xvs";
> +			function = "gpio";
> +		};
> +
> +		gpio80_pins: gpio80-pins {
> +			pins = "mipi_csi3_xhs";
> +			function = "gpio";
> +		};
> +
> +		gpio81_pins: gpio81-pins {
> +			pins = "mipi_csi3_mclk";
> +			function = "gpio";
> +		};
> +
> +		gpio82_pins: gpio82-pins {
> +			pins = "mipi_csi4_xvs";
> +			function = "gpio";
> +		};
> +
> +		gpio83_pins: gpio83-pins {
> +			pins = "mipi_csi4_xhs";
> +			function = "gpio";
> +		};
> +
> +		gpio84_pins: gpio84-pins {
> +			pins = "mipi_csi4_mclk";
> +			function = "gpio";
> +		};
> +
> +		gpio85_pins: gpio85-pins {
> +			pins = "mipi_csi5_xvs";
> +			function = "gpio";
> +		};
> +
> +		gpio86_pins: gpio86-pins {
> +			pins = "mipi_csi5_xhs";
> +			function = "gpio";
> +		};
> +
> +		gpio87_pins: gpio87-pins {
> +			pins = "mipi_csi5_mclk";
> +			function = "gpio";
> +		};
> +
> +		gpio88_pins: gpio88-pins {
> +			pins = "spi3_cs_n";
> +			function = "gpio";
> +		};
> +
> +		gpio89_pins: gpio89-pins {
> +			pins = "spi3_clk";
> +			function = "gpio";
> +		};
> +
> +		gpio90_pins: gpio90-pins {
> +			pins = "spi3_di";
> +			function = "gpio";
> +		};
> +
> +		gpio91_pins: gpio91-pins {
> +			pins = "spi3_do";
> +			function = "gpio";
> +		};
> +
> +		gpio92_pins: gpio92-pins {
> +			pins = "gpio92";
> +			function = "gpio";
> +		};
> +
> +		gpio93_pins: gpio93-pins {
> +			pins = "gpio93";
> +			function = "gpio";
> +		};
> +
> +		gpio94_pins: gpio94-pins {
> +			pins = "s_mode";
> +			function = "gpio";
> +		};
> +
> +		gpio95_pins: gpio95-pins {
> +			pins = "gpio95";
> +			function = "gpio";
> +		};
> +
> +		gpio96_pins: gpio96-pins {
> +			pins = "spi0_cs_n";
> +			function = "gpio";
> +		};
> +
> +		gpio97_pins: gpio97-pins {
> +			pins = "spi0_clk";
> +			function = "gpio";
> +		};
> +
> +		gpio98_pins: gpio98-pins {
> +			pins = "spi0_d0";
> +			function = "gpio";
> +		};
> +
> +		gpio99_pins: gpio99-pins {
> +			pins = "spi0_d1";
> +			function = "gpio";
> +		};
> +
> +		gpio100_pins: gpio100-pins {
> +			pins = "spi0_d2";
> +			function = "gpio";
> +		};
> +
> +		gpio101_pins: gpio101-pins {
> +			pins = "spi0_d3";
> +			function = "gpio";
> +		};
> +
> +		gpio102_pins: gpio102-pins {
> +			pins = "i2c10_scl";
> +			function = "gpio";
> +		};
> +
> +		gpio103_pins: gpio103-pins {
> +			pins = "i2c10_sda";
> +			function = "gpio";
> +		};
> +
> +		gpio104_pins: gpio104-pins {
> +			pins = "i2c11_scl";
> +			function = "gpio";
> +		};
> +
> +		gpio105_pins: gpio105-pins {
> +			pins = "i2c11_sda";
> +			function = "gpio";
> +		};
> +
> +		gpio107_pins: gpio107-pins {
> +			pins = "boot_sel0";
> +			function = "gpio";
> +		};
> +
> +		gpio108_pins: gpio108-pins {
> +			pins = "boot_sel1";
> +			function = "gpio";
> +		};
> +
> +		gpio109_pins: gpio109-pins {
> +			pins = "boot_sel2";
> +			function = "gpio";
> +		};
> +
> +		gpio110_pins: gpio110-pins {
> +			pins = "boot_sel3";
> +			function = "gpio";
> +		};
> +
> +		uart3_pins: uart3-pins {
> +			pins = "gpio92", "gpio93";
> +			function = "uart";
> +		};
> +
> +		uart4_pins: uart4-pins {
> +			pins = "spi1_d0", "spi1_d1";
> +			function = "uart";
> +		};
> +
> +		gpio0_pins: gpio0-pins {
> +			pins = "gpio0";
> +			function = "gpio";
> +		};
> +
> +		gpio5_pins: gpio5-pins {
> +			pins = "gpio5";
> +			function = "gpio";
> +		};
> +
> +		gpio11_pins: gpio11-pins {
> +			pins = "gpio11";
> +			function = "gpio";
> +		};
> +
> +		gpio27_pins: gpio27-pins {
> +			pins = "gpio27";
> +			function = "gpio";
> +		};
> +
> +		gpio28_pins: gpio28-pins {
> +			pins = "gpio28";
> +			function = "gpio";
> +		};
> +
> +		gpio106_pins: gpio106-pins {
> +			pins = "gpio106";
> +			function = "gpio";
> +		};
> +
> +		gpio111_pins: gpio111-pins {
> +			pins = "gpio111";
> +			function = "gpio";
> +		};
> +
> +		chip_mode_pins: chip-mode-pins {
> +			pins = "chip_mode";
> +			function = "chip_mode";
> +		};
> +
> +		sdio0_pins: sdio0-pins {
> +			pins = "mode_set0", "mode_set1";
> +			function = "sdio";
> +		};
> +
> +		sdio1_pins: sdio1-pins {
> +			pins = "mode_set2", "mode_set3";
> +			function = "sdio";
> +		};
> +
> +		jtag0_pins: jtag0-pins {
> +			pins = "jtag0_tck", "jtag0_tms", "jtag0_tdi", "jtag0_tdo";
> +			function = "jtag";
> +		};
> +
> +		jtag1_pins: jtag1-pins {
> +			pins = "jtag1_tck", "jtag1_tms", "jtag1_tdi", "jtag1_tdo";
> +			function = "jtag";
> +		};
> +
> +		jtag2_pins: jtag2-pins {
> +			pins = "jtag2_trst", "jtag2_tck", "jtag2_tms", "jtag2_tdi",
> +			       "jtag2_tdo";
> +			function = "jtag";
> +		};
> +
> +		pcie_pins: pcie-pins {
> +			pins = "pcie_clkreq_n", "pcie_wake_n", "pcie_perst_n";
> +			function = "pcie";
> +		};
> +
> +		hdmi_pins: hdmi-pins {
> +			pins = "hdmi_scl", "hdmi_sda", "hdmi_cec";
> +			function = "hdmi";
> +		};
> +
> +		rgmii0_pins: rgmii0-pins {
> +			pins = "rgmii0_clk_125", "rgmii0_txen", "rgmii0_txclk", "rgmii0_txd0",
> +			       "rgmii0_txd1", "rgmii0_txd2", "rgmii0_txd3", "rgmii0_rxclk",
> +			       "rgmii0_rxdv", "rgmii0_rxd0", "rgmii0_rxd1", "rgmii0_rxd2",
> +			       "rgmii0_rxd3", "rgmii0_mdc", "rgmii0_mdio", "rgmii0_intb";
> +			function = "rgmii";
> +		};
> +
> +		rgmii1_pins: rgmii1-pins {
> +			pins = "rgmii1_clk_125", "rgmii1_txen", "rgmii1_txclk", "rgmii1_txd0",
> +			       "rgmii1_txd1", "rgmii1_txd2", "rgmii1_txd3", "rgmii1_rxclk",
> +			       "rgmii1_rxdv", "rgmii1_rxd0", "rgmii1_rxd1", "rgmii1_rxd2",
> +			       "rgmii1_rxd3", "rgmii1_mdc", "rgmii1_mdio", "rgmii1_intb";
> +			function = "rgmii";
> +		};
> +
> +		i2s0_pins: i2s0-pins {
> +			pins = "i2s0_bclk", "i2s0_wclk", "i2s0_sdi", "i2s0_sdo", "i2s_mclk";
> +			function = "i2s";
> +		};
> +
> +		i2s1_pins: i2s1-pins {
> +			pins = "i2s1_bclk", "i2s1_wclk", "i2s1_sdi", "i2s1_sdo", "i2s_mclk";
> +			function = "i2s";
> +		};
> +
> +		i2s2_pins: i2s2-pins {
> +			pins = "i2s2_bclk", "i2s2_wclk", "i2s2_sdi", "i2s2_sdo", "i2s_mclk";
> +			function = "i2s";
> +		};
> +
> +		usb0_pwren_pins: usb0-pwren-pins {
> +			pins = "usb0_pwren";
> +			function = "usb";
> +		};
> +
> +		usb1_pwren_pins: usb1-pwren-pins {
> +			pins = "usb1_pwren";
> +			function = "usb";
> +		};
> +
> +		i2c0_pins: i2c0-pins {
> +			pins = "i2c0_scl", "i2c0_sda";
> +			function = "i2c";
> +		};
> +
> +		i2c1_pins: i2c1-pins {
> +			pins = "i2c1_scl", "i2c1_sda";
> +			function = "i2c";
> +		};
> +
> +		i2c2_pins: i2c2-pins {
> +			pins = "i2c2_scl", "i2c2_sda";
> +			function = "i2c";
> +		};
> +
> +		i2c3_pins: i2c3-pins {
> +			pins = "i2c3_scl", "i2c3_sda";
> +			function = "i2c";
> +		};
> +
> +		i2c4_pins: i2c4-pins {
> +			pins = "i2c4_scl", "i2c4_sda";
> +			function = "i2c";
> +		};
> +
> +		i2c5_pins: i2c5-pins {
> +			pins = "i2c5_scl", "i2c5_sda";
> +			function = "i2c";
> +		};
> +
> +		i2c8_pins: i2c8-pins {
> +			pins = "gpio92", "gpio93";
> +			function = "i2c";
> +		};
> +
> +		i2c10_pins: i2c10-pins {
> +			pins = "i2c10_scl", "i2c10_sda";
> +			function = "i2c";
> +		};
> +
> +		i2c11_pins: i2c11-pins {
> +			pins = "i2c11_scl", "i2c11_sda";
> +			function = "i2c";
> +		};
> +
> +		uart0_pins: uart0-pins {
> +			pins = "uart0_tx", "uart0_rx";
> +			function = "uart";
> +		};
> +
> +		uart1_pins: uart1-pins {
> +			pins = "uart1_tx", "uart1_rx", "uart1_cts", "uart1_rts";
> +			function = "uart";
> +		};

RTS/CTS pins should be separate, so it is possible to use the UART without them.

> +
> +		uart2_pins: uart2-pins {
> +			pins = "uart2_tx", "uart2_rx";
> +			function = "uart";
> +		};
> +
> +		fan_pwm_pins: fan-pwm-pins {
> +			pins = "fan_pwm";
> +			function = "pwm";
> +		};
> +
> +		fan_tach_pins: fan-tach-pins {
> +			pins = "fan_tach";
> +			function = "fan_tach";
> +		};
> +
> +		mipi_csi0_pins: mipi-csi0-pins {
> +			pins = "mipi_csi0_xvs", "mipi_csi0_xhs", "mipi_csi0_mclk";
> +			function = "mipi_csi";
> +		};
> +
> +		mipi_csi1_pins: mipi-csi1-pins {
> +			pins = "mipi_csi1_xvs", "mipi_csi1_xhs", "mipi_csi1_mclk";
> +			function = "mipi_csi";
> +		};
> +
> +		mipi_csi2_pins: mipi-csi2-pins {
> +			pins = "mipi_csi2_xvs", "mipi_csi2_xhs", "mipi_csi2_mclk";
> +			function = "mipi_csi";
> +		};
> +
> +		mipi_csi3_pins: mipi-csi3-pins {
> +			pins = "mipi_csi3_xvs", "mipi_csi3_xhs", "mipi_csi3_mclk";
> +			function = "mipi_csi";
> +		};
> +
> +		mipi_csi4_pins: mipi-csi4-pins {
> +			pins = "mipi_csi4_xvs", "mipi_csi4_xhs", "mipi_csi4_mclk";
> +			function = "mipi_csi";
> +		};
> +
> +		mipi_csi5_pins: mipi-csi5-pins {
> +			pins = "mipi_csi5_xvs", "mipi_csi5_xhs", "mipi_csi5_mclk";
> +			function = "mipi_csi";
> +		};
> +
> +		s_mode_pins: s-mode-pins {
> +			pins = "s_mode";
> +			function = "s_mode";
> +		};
> +
> +		boot_sel0_pins: boot-sel0-pins {
> +			pins = "boot_sel0";
> +			function = "boot_sel";
> +		};
> +
> +		boot_sel1_pins: boot-sel1-pins {
> +			pins = "boot_sel1";
> +			function = "boot_sel";
> +		};
> +
> +		boot_sel2_pins: boot-sel2-pins {
> +			pins = "boot_sel2";
> +			function = "boot_sel";
> +		};
> +
> +		boot_sel3_pins: boot-sel3-pins {
> +			pins = "boot_sel3";
> +			function = "boot_sel";
> +		};
> +
> +		ddr_ref_clk_sel_pins: ddr-ref-clk-sel-pins {
> +			pins = "gpio95";
> +			function = "ddr_ref_clk_sel";
> +		};
> +
> +		lpddr_ref_clk_pins: lpddr-ref-clk-pins {
> +			pins = "lpddr_ref_clk";
> +			function = "lpddr_ref_clk";
> +		};
> +
> +		spi0_pins: spi0-pins {
> +			pins = "spi0_cs_n", "spi0_clk", "spi0_d0", "spi0_d1", "spi0_d2",
> +			       "spi0_d3";
> +			function = "spi";
> +		};
> +
> +		dual_spi1_pins: dual-spi1-pins {
> +			pins = "spi1_cs0_n", "spi1_clk", "spi1_d0", "spi1_d1";
> +			function = "spi";
> +		};
> +
> +		quad_spi1_pins: quad-spi1-pins {
> +			pins = "spi1_cs0_n", "spi1_cs1_n", "spi1_clk", "spi1_d0", "spi1_d1",
> +			       "spi1_d2", "spi1_d3";
> +			function = "spi";
> +		};

Same comments apply here.

Regards,
Samuel

> +
> +		spi3_pins: spi3-pins {
> +			pins = "spi3_cs_n", "spi3_clk", "spi3_di", "spi3_do";
> +			function = "spi";
> +		};
> +	};
> +};
> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> index b3a230870315..b16e3e28632c 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> @@ -349,6 +349,11 @@ gpioD: gpio-port@3 {
>  			};
>  		};
>  
> +		pinctrl: pinctrl@51600080 {
> +			compatible = "eswin,eic7700-pinctrl";
> +			reg = <0x0 0x51600080 0x0 0x1fff80>;
> +		};
> +
>  		clk: clock-controller@51828000 {
>  			compatible = "eswin,eic7700-clock";
>  			reg = <0x0 0x51828000 0x0 0x300>;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
