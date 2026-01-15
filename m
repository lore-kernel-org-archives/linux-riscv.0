Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA4AD47CA3
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 01:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7HOQpFEjZxOIr/QeQS7Xp6UBV/2djj1LqKD9XYo4hNc=; b=omGo6E3KEFCqB9
	yGfw6jHk4cXi6GzLgn1S4TwCgaqWgmmjbm2NP8A/MLrmoATejH6PhI60MN13GDG3MG3JZOS3Vv44a
	J3yTlMS37NHPgXuxeteo02w5R1KVMtefXf7coKsFbtjANMU0+eF2UXqi61bOwH+2/i4iZ3SVKajnu
	RhkHxyo3nbSqa/5LzePjxZqThrlEfspo/QoDd8w7aIHIT4Wb7ek77DR1ThkZiR8XVZE6mCeWhUr2d
	MMsX06QIYr/cgmSzhE58ueP+IZ5HA6T8f1uXhwKH2GLzNuOZt3JYFd/U1O6UJ4LjRHyluxUnrMb96
	dBra9eqU13Nl1r31y1JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYTf-0000000DPZK-24aq;
	Fri, 16 Jan 2026 01:18:15 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYTc-0000000DPXJ-2EbN
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 01:18:14 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-8907f0b447aso18836666d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 17:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768526291; x=1769131091; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K1PuIc2lRMstuB52aa6xr0OJ5o8vdZJx7Gp6DDwvECc=;
        b=ZXHjSIiWSD07fbvU3e3bO71mMML7TzSY1Ag6Ixil9zTa0YJHE1pMUAzwfbGyz/PIDr
         ka4Onr6YfMqAav6s8ULRmTAOIJBOoQ8s5qWOedIAi7G/VrWOV45ud0neNRgLq+9y6Sgu
         txnfrAg6SGpdNnGQ+VkAgSmTzfswBverEx9iL5Oo1i29YyKsJLMVGkPmQpgLq21d0KNM
         CV4tikmo/iT3ivGwJCUsXUAIVlGp1H/c/6A1QyQf/Inh0QcbZZLhyxN8OhkeW+Q1sEQY
         p8NLeUhrQgrXQAGufTe1rdMDUxSK0lvdZneslt2ZzEzGWqckcUjnAWGYhUSULoLB0+3/
         1Nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526291; x=1769131091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1PuIc2lRMstuB52aa6xr0OJ5o8vdZJx7Gp6DDwvECc=;
        b=fsiIfpYxb1FAHsD17OmsQH8gHhta7oIQHsjZppyQhlLpoybch1x773W74WN9tgthyj
         K0pZ0KfXIwz564xMELiqH9bFxNualwP+Ic3Ggl1muwWxqRjRBFnjNIP+ZZIhAFgax9EL
         QuLafg2KzdG8wyUvyXdWMJkSDiCG5JjZkDmdbJ+U5n6Kz7BcsxtYRByGWQtiAaq0pdHa
         6grLPIxgLksTPirlUfYSmW0fIioC3IgQ4ezZppah9X1VcrbORVcaJgMdWwCUxza0BwR8
         9f1D9UGOO3nGFaSTK/GgxuWQprS+WTGC9prW6zUwX6uU+3KMOhL9T/lAUBIXHBdNLVfD
         0sCw==
X-Forwarded-Encrypted: i=1; AJvYcCVOZSwhrnoRtWN4UW4e2TANRWhuAo3PgFuTDj/IdsP+PZBRZP3jhsPsvi9Yaz8tMQ/YGHQcf86e/2pumA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHb7KWfF8Mqj7xZi1Q51hNC33gMIPFZgmd1iCVEs7Vl6Ggfpeo
	1DZtipj8PWJuzz2fqvvktj0oAd/sdEkfF1nZ054/Rs6D1/oaUsyH89m22vJyQauf5G8=
X-Gm-Gg: AY/fxX7gA5wRNIBITAwwgDVUR+nSbwOkXZS9H1XMmeAQ05FuajuAdD3V7MXgu5k8EFX
	GvZT5Rxignq1jcDmdnYpD0Iprm4DSxcRw/xq83mXyJfEyHru8F+KrT+xn5epg2XWLbXA8xhobZV
	iUw7uzLyZKlHZETTwUujW6z5cequCYtkrHnb1jrSPrYX1jowB0/qKzwP6tGUotPXnIWTF77WPxQ
	hpLNIR5gpNFfq0k8/gkP5d2Gwv3cloJYIkNZZs4czH6klTP2dS8CDVKq+h2BjKgqZ9jVqt1LyFz
	01B7R+a++HKo86fu31sadrQfC1YlG+phj0UOdcplcS6NKEByRVK90CG3rBaTGZ1eOCaAvZTDzUK
	i0GgbWigGNJPoKyzG2lSoaxx0QidJxNlqkQW6tKp1OwWqLZXkjdwlQOzSiBRZPhtldZ3HNxgmke
	cgAsQRqchydg==
X-Received: by 2002:a05:7301:fa0d:b0:2ae:5076:b6a with SMTP id 5a478bee46e88-2b6b48115f4mr1246860eec.19.1768520118610;
        Thu, 15 Jan 2026 15:35:18 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3651f39sm728550eec.24.2026.01.15.15.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:35:18 -0800 (PST)
Date: Fri, 16 Jan 2026 07:35:13 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 8/8] riscv: dts: sophgo: add Milk-V Duo 256M board dts
Message-ID: <aWl5fZKayAHmoES4@inochi.infowork>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
 <20260115-cv1800b-i2s-driver-v1-8-e8b22b8578ab@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-8-e8b22b8578ab@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_171812_594877_4A42E1A2 
X-CRM114-Status: GOOD (  25.60  )
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

On Thu, Jan 15, 2026 at 11:17:45PM +0400, Anton D. Stavinskii wrote:
> Example of usage internal dac/adc and external I2S mic
> The example shows how to use the card and
> will actually work other boards.
> Fixed clocks needed to make simple card make
> initial .set_sysclk with proper clock rates.
> Same for DAC. I2S3 has to be started not only
> for DAC but for the ADC also because it
> provides mclk for both.
> 
> dai-link@2 will only work if registers
> are set according to this issue
> https://github.com/sophgo/sophgo-doc/issues/174#event-21395297524
> in other case i2s2 will not output clocks and data.
> Those changes are not connected to the driver itself,
> but for another subsystem which is not yet ipmlemented.
> The following config properly works for MilkV Duo/256Mm, Module.
> Basically everything with sg2000/sg2002 but on some boards
> i2s2 output pins are soldered to Ethernet module.
> In Milk 256M they are free to use as external DAC/ADC.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/Makefile                |   1 +
>  .../boot/dts/sophgo/sg2002-milkv-duo-256m.dts      | 231 +++++++++++++++++++++
>  2 files changed, 232 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 6f65526d4193..c8901ff680cb 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -6,3 +6,4 @@ dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo-256m.dtb
> diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo-256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo-256m.dts
> new file mode 100644
> index 000000000000..cc33c4355969
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo-256m.dts
> @@ -0,0 +1,231 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2024 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "sg2002.dtsi"
> +
> +/ {
> +	model = "Milk-V duo 256M";
> +	compatible = "milkv,duo-256m",
> +	"sipeed,licheerv-nano",
> +	"sophgo,sg2002";
> +
> +	aliases {
> +		gpio0 = &gpio0;
> +		gpio1 = &gpio1;
> +		gpio2 = &gpio2;
> +		gpio3 = &gpio3;
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +
> +&pinctrl {
> +	uart0_cfg: uart0-cfg {
> +		uart0-pins {
> +			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> +			<PINMUX(PIN_UART0_RX, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +
> +	sdhci0_cfg: sdhci0-cfg {
> +		sdhci0-clk-pins {
> +			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <16100>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-cmd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-data-pins {
> +			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
> +			<PINMUX(PIN_SD0_D1, 0)>,
> +			<PINMUX(PIN_SD0_D2, 0)>,
> +			<PINMUX(PIN_SD0_D3, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-cd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +};
> +
> +&sdhci0 {
> +	pinctrl-0 = <&sdhci0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +	bus-width = <4>;
> +	no-1-8-v;
> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +};
> +
> +&usb {
> +	dr_mode = "peripheral";
> +	status = "okay";
> +	g-rx-fifo-size = <1536>;
> +	g-tx-fifo-size = <128 128 64 64 64 64 32 32>;
> +};
> +
> +&uart0 {
> +	pinctrl-0 = <&uart0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&dmac {
> +	status = "okay";
> +};
> +
> +&dmamux {
> +	status = "okay";
> +};
> +
> +&pinctrl {
> +	i2s2_cfg: i2s2-cfg {
> +		i2s2-out-pins {
> +			pinmux = <PINMUX(PIN_ETH_TXM, 7)>,
> +			<PINMUX(PIN_ETH_RXP,  7)>,
> +			<PINMUX(PIN_ETH_RXM,  7)>;
> +
> +			drive-strength-microamp = <15700>;
> +			power-source = <1800>;
> +		};
> +
> +		i2s2-in-pins {
> +			pinmux = <PINMUX(PIN_ETH_TXP, 7)>;
> +			power-source = <1800>;
> +		};
> +	};
> +};
> +
> +&i2s0 {
> +	#sound-dai-cells = <0>;
> +	status = "okay";
> +};
> +
> +&i2s2 {
> +	pinctrl-0 = <&i2s2_cfg>;
> +	pinctrl-names = "default";
> +	#sound-dai-cells = <0>;
> +	status = "okay";
> +};
> +
> +&i2s3 {
> +	#sound-dai-cells = <0>;
> +	status = "okay";
> +};
> +
> +/ {

> +	int_adc: codec@300a100 {
> +		compatible = "sophgo,cv1800b-sound-adc";
> +		#sound-dai-cells = <0>;
> +		reg = <0x300a100 0x100>;
> +	};
> +
> +	int_dac: codec@300a000 {
> +		compatible = "sophgo,cv1800b-sound-dac";
> +		#sound-dai-cells = <0>;
> +		reg = <0x300a000 0x100>;
> +	};
> +

Move these two nodes into cv180x.dtsi, others are not allowed
in this patch series, use a separate patch instead.

Regards,
Inochi


> +	ext_adc: my-ext-adc {
> +		compatible = "invensense,ics43432";
> +		#sound-dai-cells = <0>;
> +	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "cv1800b card";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		simple-audio-card,dai-link@0 {
> +			reg = <0>;
> +			format = "i2s";
> +			bitclock-master = <&clock_master0>;
> +			frame-master = <&clock_master0>;
> +
> +			codec {
> +				sound-dai = <&int_dac>;
> +			};
> +
> +			clock_master0: cpu {
> +				system-clock-frequency = <12288000>;
> +				system-clock-fixed;
> +				system-clock-direction-out;
> +				mclk-fs = <256>;
> +				sound-dai = <&i2s3>;
> +			};
> +		};
> +
> +		simple-audio-card,dai-link@1 {
> +			reg = <1>;
> +			format = "i2s";
> +			bitclock-master = <&clock_master1>;
> +			frame-master = <&clock_master1>;
> +
> +			clock_master1: codec {
> +				mclk-fs = <256>;
> +				system-clock-frequency = <12288000>;
> +				system-clock-fixed;
> +				sound-dai = <&int_adc>;
> +			};
> +
> +			cpu {
> +				mclk-fs = <256>;
> +				system-clock-frequency = <12288000>;
> +				system-clock-fixed;
> +				sound-dai = <&i2s0>;
> +			};
> +		};
> +
> +		simple-audio-card,dai-link@2 {
> +			reg = <2>;
> +			format = "i2s";
> +			bitclock-master = <&clock_master2>;
> +			frame-master = <&clock_master2>;
> +
> +			codec {
> +				sound-dai = <&ext_adc>;
> +			};
> +
> +			clock_master2: cpu {
> +				mclk-fs = <256>;
> +				system-clock-frequency = <12288000>;
> +				system-clock-fixed;
> +				sound-dai = <&i2s2>;
> +			};
> +		};
> +	};
> +};
> 
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
