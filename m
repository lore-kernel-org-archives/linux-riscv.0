Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7741CC388F9
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 14:14:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB471206ED
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 14:14:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eQBFV2hr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+TUXzn4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB471206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gftaA8gLjgL5Wb5udmav3NRsRl2x2CMyndJs3r6y04U=; b=eQBFV2hrkvJ4HF1oQtSowwUf32
	jqw+yeYdtmqBXWE9aMKQLvhieM6dVciK7W7jaODTnj1miaGvnHYno3smgUxpV8wzwQasRKPv5cJNk
	L2Iu1y6rozvXM6yNhLw0SUOaiQ0Va+ezhiz2FTx2wdchAuZT1cIi2dFAwB3XZLRh1Jf287iiW7sRg
	CIBDehhJpEu+SEHzsnI2CMhK9pclmfKvG6KcIT12blqIO72Cdb0A1Zle6YMlq47k40JyyLTlN1Ob5
	GDkJu6UznF/VlojFQ+wNpsXz2oTBZqTMzZ2dQe20ikalw1hZzGHGGjnHmmFmxWCeUXvo67r3yaAGi
	mFJTIyFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbOys-0007j4-Ht; Sat, 07 Nov 2020 14:14:14 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbOyq-0007iZ-NT
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 14:14:13 +0000
Received: by mail-qk1-x744.google.com with SMTP id l2so3847176qkf.0
 for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2020 06:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=huy21V7MYL1h8mNTjVglNCLXacqiA2jDdOlpzET7SZY=;
 b=W+TUXzn4JFZ7SjhA3VmehlJys/1N9Q4Fl0oWDGPKVGGyqbkZRcMhUjAffBWUoVsJDr
 y21lewDg9V+RLt8d7PdbW7UYSfN/4R7oaZ78DyI0qpkL1UJD5PL3rShuHqfTWTfLvbpv
 D2L8Kq2b+uzFWlSPQcLp6pt4GqPUl0gKooaiu1F18d7/z5Qs7yAn3sEKMwrvcOjfNKYX
 bmkY8Yb/DwMh1pG3INWBbjbfI9p+6Jveu8MWPnweQizKKH/2KPX4Og49n4AWda4tLqtY
 uf+z4lTRhNdQyW4nRBOcSUMP0zPFT1K3MBcNILr3xzml4zqdVPMhBPX92zyoq+l3Rluz
 QChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=huy21V7MYL1h8mNTjVglNCLXacqiA2jDdOlpzET7SZY=;
 b=BDSiMmWCdry9t9GCcVxW02gPORGR6+jPRxjjEh9aq4uSSTUXFEtV1goxXYwq/P9d4A
 TI3EGvy4AxQsaZAsg1S5BMkwY/j/fjk6pGqu/4dgrgaJmrIkrE/dhTiRGRfx/3UeKiyh
 hD3ntm7+2lIWPUKdpPcFHWwC1nC/0wcIEP3OI+5Ysamt2/z1TYbF5pVTrXHcFwUgBrGN
 D6cv4W81h+vpfJgiQKJDXmLQdARS0cUMW1aQ9N3MpRW56ORlynhPBFciKYB2hhWK3Vh0
 jYBi18eFyAV2cvfqool1L3smpAyDR3g/PX56yHxWeMSGAleLcomRJpgzgIZALNu5qTEB
 opYw==
X-Gm-Message-State: AOAM531zAfdTNwrIdRdmvpVAkSPPqw4nHcbbz+Cw52ODqZACOVwl5LMq
 3nmf2VWxPLLsj/HFom0ih9s=
X-Google-Smtp-Source: ABdhPJwgK8g0wFdIvBebNrysLwGx61Er8VYIwm4JMXIHy7i+mWrMKwPz3RPR9WS6/kMQFXxYpBQ4pg==
X-Received: by 2002:a05:620a:14a5:: with SMTP id
 x5mr5748542qkj.263.1604758451151; 
 Sat, 07 Nov 2020 06:14:11 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id n81sm2669280qke.99.2020.11.07.06.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 06:14:10 -0800 (PST)
Subject: Re: [PATCH 30/32] riscv: Add SiPeed MAIXDUINO board device tree
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-31-damien.lemoal@wdc.com>
From: Sean Anderson <seanga2@gmail.com>
Autocrypt: addr=seanga2@gmail.com; prefer-encrypt=mutual; keydata=
 mQENBFe74PkBCACoLC5Zq2gwrDcCkr+EPGsT14bsxrW07GiYzQhLCgwnPdEpgU95pXltbFhw
 46GfyffABWxHKO2x+3L1S6ZxC5AiKbYXo7lpnTBYjamPWYouz+VJEVjUx9aaSEByBah5kX6a
 lKFZWNbXLAJh+dE1HFaMi3TQXXaInaREc+aO1F7fCa2zNE75ja+6ah8L4TPRFZ2HKQzve0/Y
 GXtoRw97qmnm3U36vKWT/m2AiLF619F4T1mHvlfjyd9hrVwjH5h/2rFyroXVXBZHGA9Aj8eN
 F2si35dWSZlIwXkNu9bXp0/pIu6FD0bI+BEkD5S7aH1G1iAcMFi5Qq2RNa041DfQSDDHABEB
 AAG0K1NlYW4gR2FsbGFnaGVyIEFuZGVyc29uIDxzZWFuZ2EyQGdtYWlsLmNvbT6JAVcEEwEK
 AEECGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4ACGQEWIQSQYR1bzo1I0gPoYCg+6I/stKEQ
 bgUCXT+S2AUJB2TlXwAKCRA+6I/stKEQbhNOB/9ooea0hU9Sgh7PBloU6CgaC5mlqPLB7NTp
 +JkB+nh3Fqhk+qLZwzEynnuDLl6ESpVHIc0Ym1lyF4gT3DsrlGT1h0Gzw7vUwd1+ZfN0CuIx
 Rn861U/dAUjvbtN5kMBqOI4/5ea+0r7MACcIVnKF/wMXBD8eypHsorT2sJTzwZ6DRCNP70C5
 N1ahpqqNmXe0uLdP0pu55JCqhrGw2SinkRMdWyhSxT56uNwIVHGhLTqH7Q4t1N6G1EH626qa
 SvIJsWlNpll6Y3AYLDw2/Spw/hqieS2PQ/Ky3rPZnvJt7/aSNYsKoFGX0yjkH67Uq8Lx0k1L
 w8jpXnbEPQN3A2ZJCbeM
Message-ID: <5043fecc-1723-7382-ac42-28aa8a7b3f18@gmail.com>
Date: Sat, 7 Nov 2020 09:14:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201107081420.60325-31-damien.lemoal@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_091412_801548_DD86E70F 
X-CRM114-Status: GOOD (  19.84  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

On 11/7/20 3:14 AM, Damien Le Moal wrote:
> Add a device tree for the SiPeed MAIXDUINO board. This device tree
> enables LEDs and spi/mmc SD card device. Additionally, gpios and i2c
> are also enabled and mapped to the board header pins as indicated on
> the board itself.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../boot/dts/kendryte/k210_maixduino.dts      | 203 ++++++++++++++++++
>  1 file changed, 203 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/kendryte/k210_maixduino.dts
> 
> diff --git a/arch/riscv/boot/dts/kendryte/k210_maixduino.dts b/arch/riscv/boot/dts/kendryte/k210_maixduino.dts
> new file mode 100644
> index 000000000000..78a37cf9df97
> --- /dev/null
> +++ b/arch/riscv/boot/dts/kendryte/k210_maixduino.dts
> @@ -0,0 +1,203 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
> + * Copyright (C) 2020 Western Digital Corporation or its affiliates.
> + */
> +
> +/dts-v1/;
> +
> +#include "k210.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	model = "SiPeed MAIXDUINO";
> +	compatible = "sipeed,maixduino", "kendryte,k210";
> +
> +	chosen {
> +		bootargs = "earlycon console=ttySIF0";
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		boot {
> +			label = "BOOT";
> +			linux,code = <BTN_0>;
> +			gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,format = "i2s";
> +		status = "disabled";
> +
> +		simple-audio-card,cpu {
> +			sound-dai = <&i2s0 0>;
> +		};
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&mic>;
> +		};
> +	};
> +
> +	mic: mic {
> +		#sound-dai-cells = <0>;
> +		compatible = "memsensing,msm261s4030h0";
> +		status = "disabled";
> +	};
> +};
> +
> +&fpioa {
> +	status = "okay";
> +
> +	fpioa_uarths: uarths {
> +		pinmux = <K210_FPIOA(4, K210_PCF_UARTHS_RX)>, /* Header "0" */
> +			 <K210_FPIOA(5, K210_PCF_UARTHS_TX)>; /* Header "1" */
> +	};
> +
> +	fpioa_gpio: gpio {
> +		pinmux = <K210_FPIOA(8, K210_PCF_GPIO0)>,
> +			 <K210_FPIOA(9, K210_PCF_GPIO1)>;
> +	};
> +
> +	fpioa_gpiohs: gpiohs {
> +		pinmux = <K210_FPIOA(16, K210_PCF_GPIOHS0)>,  /* BOOT */
> +			 <K210_FPIOA(17, K210_PCF_GPIOHS1)>,
> +			 <K210_FPIOA(21, K210_PCF_GPIOHS2)>,  /* Header "2" */
> +			 <K210_FPIOA(22, K210_PCF_GPIOHS3)>,  /* Header "3" */
> +			 <K210_FPIOA(23, K210_PCF_GPIOHS4)>,  /* Header "4" */
> +			 <K210_FPIOA(24, K210_PCF_GPIOHS5)>,  /* Header "5" */
> +			 <K210_FPIOA(32, K210_PCF_GPIOHS6)>,  /* Header "6" */
> +			 <K210_FPIOA(15, K210_PCF_GPIOHS7)>,  /* Header "7" */
> +			 <K210_FPIOA(14, K210_PCF_GPIOHS8)>,  /* Header "8" */
> +			 <K210_FPIOA(13, K210_PCF_GPIOHS9)>,  /* Header "9" */
> +			 <K210_FPIOA(12, K210_PCF_GPIOHS10)>, /* Header "10" */
> +			 <K210_FPIOA(11, K210_PCF_GPIOHS11)>, /* Header "11" */
> +			 <K210_FPIOA(10, K210_PCF_GPIOHS12)>, /* Header "12" */
> +			 <K210_FPIOA(3,  K210_PCF_GPIOHS13)>, /* Header "13" */
> +			 <K210_FPIOA(25, K210_PCF_GPIOHS14)>;
> +	};
> +
> +	fpioa_i2s0: i2s0 {
> +		pinmux = <K210_FPIOA(18, K210_PCF_I2S0_SCLK)>,
> +			 <K210_FPIOA(19, K210_PCF_I2S0_WS)>,
> +			 <K210_FPIOA(20, K210_PCF_I2S0_IN_D0)>;
> +	};
> +
> +	fpioa_spi1: spi1 {
> +		pinmux = <K210_FPIOA(26, K210_PCF_SPI1_D1)>,
> +			 <K210_FPIOA(27, K210_PCF_SPI1_SCLK)>,
> +			 <K210_FPIOA(28, K210_PCF_SPI1_D0)>,
> +			 <K210_FPIOA(29, K210_PCF_SPI1_SS0)>; /* cs */
> +	};
> +
> +	fpioa_i2c1: i2c1 {
> +		pinmux = <K210_FPIOA(30, K210_PCF_I2C1_SCLK)>, /* Header "scl" */
> +			 <K210_FPIOA(31, K210_PCF_I2C1_SDA)>;  /* Header "sda" */
> +	};
> +
> +	fpioa_i2s1: i2s1 {
> +		pinmux = <K210_FPIOA(33, K210_PCF_I2S1_WS)>,
> +			 <K210_FPIOA(34, K210_PCF_I2S1_IN_D0)>,
> +			 <K210_FPIOA(35, K210_PCF_I2S1_SCLK)>;
> +	};
> +
> +	fpioa_spi0: spi0 {
> +		pinmux = <K210_FPIOA(36, K210_PCF_GPIOHS20)>,  /* cs */
> +			 <K210_FPIOA(37, K210_PCF_GPIOHS21)>,  /* rst */
> +			 <K210_FPIOA(38, K210_PCF_GPIOHS22)>,  /* dc */
> +			 <K210_FPIOA(39, K210_PCF_SPI0_SCLK)>; /* wr */
> +	};
> +
> +	fpioa_dvp: dvp {
> +		pinmux = <K210_FPIOA(40, K210_PCF_SCCB_SDA)>,
> +			 <K210_FPIOA(41, K210_PCF_SCCB_SCLK)>,
> +			 <K210_FPIOA(42, K210_PCF_DVP_RST)>,
> +			 <K210_FPIOA(43, K210_PCF_DVP_VSYNC)>,
> +			 <K210_FPIOA(44, K210_PCF_DVP_PWDN)>,
> +			 <K210_FPIOA(45, K210_PCF_DVP_HSYNC)>,
> +			 <K210_FPIOA(46, K210_PCF_DVP_XCLK)>,
> +			 <K210_FPIOA(47, K210_PCF_DVP_PCLK)>;
> +	};
> +};
> +
> +&uarths0 {
> +	pinctrl-0 = <&fpioa_uarths>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&gpio0 {
> +	pinctrl-0 = <&fpioa_gpiohs>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&gpio1 {
> +	pinctrl-0 = <&fpioa_gpio>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&i2s0 {
> +	#sound-dai-cells = <1>;
> +	pinctrl-0 = <&fpioa_i2s0>;
> +	pinctrl-names = "default";
> +};
> +
> +&i2c1 {
> +	pinctrl-0 = <&fpioa_i2c1>;
> +	pinctrl-names = "default";
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&dvp0 {
> +	pinctrl-0 = <&fpioa_dvp>;
> +	pinctrl-names = "default";
> +};
> +
> +&spi0 {
> +	pinctrl-0 = <&fpioa_spi0>;
> +	pinctrl-names = "default";
> +	num-cs = <1>;
> +	cs-gpios = <&gpio0 20 0>;
> +
> +	panel@0 {
> +		compatible = "sitronix,st7789v";
> +		reg = <0>;
> +		reset-gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
> +		dc-gpios = <&gpio0 22 0>;
> +		spi-max-frequency = <15000000>;
> +	};
> +};
> +
> +&spi1 {
> +	pinctrl-0 = <&fpioa_spi1>;
> +	pinctrl-names = "default";
> +	num-cs = <1>;
> +	polling;
> +	status = "okay";
> +
> +	slot@0 {
> +		compatible = "mmc-spi-slot";
> +		reg = <0>;
> +		voltage-ranges = <3300 3300>;
> +		spi-max-frequency = <4000000>;
> +		broken-cd;
> +	};
> +};
> +
> +&spi3 {
> +	spi-flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <50000000>;
> +		m25p,fast-read;
> +		broken-flash-reset;
> +	};
> +};
> 

Reviewed-by: Sean Anderson <seanga2@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
