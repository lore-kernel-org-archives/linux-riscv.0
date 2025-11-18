Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A22BCEDDB0
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 15:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/YRoQYIJ2zH/3xupEA0DO97nDSlqJboWI+ee6qoUDo=; b=cqE5cOqrfV/kRi
	9JhSc0W9HCzzJj4JtnAqr0350AIewWSwM7KciyvYPjJCLcalo68F0TbKT1Mdcv0gK9mUgEG1Xo7qT
	h1qHGiP5pIgS9sKipCskgBycLCvX9NPvgCFk81jy5QSonDLautDM4oHxn6r9qL87mwmW9Ys77hC7O
	AXiFIO7U5rDOrJybpIi4rCuIIBhJ9DIBz5hDYJcYjUWwg9Gahun9/1KKA4fXZReD4OYwRBpH+TL2Y
	PJzsQHLQPC/sbMLKWMnYCVMPhPJzJciUCvVh9uvorQ+gpWjGvYQZhFt54k/rKeOAQut2eT/yLfinL
	SAPSgfB0y76fll8DUA4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNNx-00000000cEL-3yQy;
	Tue, 18 Nov 2025 15:12:49 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNNu-00000000cDx-0k8t
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 15:12:48 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 222443FB7A
	for <linux-riscv@lists.infradead.org>; Tue, 18 Nov 2025 15:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1763478761;
	bh=QYW084xRPtrHcS9BFdMg3li+ldeYqP8F4NisC2kwgpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=agmYr6lWF+x9Ix6c8+VyPJepKH3dwggWQT/utjQIxk553lDxeWSpKFpXUfwjgtN3+
	 3Z9CpZEB/mH2OtaMAOD2HdtRgJ55yRXRfbs5bmZqRskhiFvzMjIzTcPQW51isTUpeR
	 YcneaGwT7Pobw5vPGrb+Pu1N1/gd/gfgk139PtfMJqXB/jLtWHDtDTCF8Mis0ecCZX
	 euCfmdLhAxN+cvpX1GJ1uftcqxk+QhQHcVx2kAJ7z9XumcGBsHl9w+WntqWKHo/qF7
	 P1OotWsPjSop/uDgzxBWnPJc2OU+MDB+D4uatCcUrsRDt8vIsUFbOD53vDizsb7yF5
	 zAPGaWjc5bVflrs/byvhtdwPIqzYH7R65Zygf3Mbb0yUUy+xITADF6k44HsyPkfKOH
	 eIE2mReDjAb2W1CAll+3Ttx7Iz153YEObwHFmsFGyHUBzhtqNka8IQvezuMuDGMApT
	 Q+/qzgOWiJbgOE63iBdJkxxNQbz9Itj5GldO3057laPyqR1iLuz1Z5mjSIBTPMKBlx
	 4zHeVqWfKYKRLo7pPrs9n1/RGc4NAmf+3uqJjHmqIldhj8GS6f0kj+nJdXGsyAPMXP
	 UxGKVB3AAe0xfryGRVuQPk1lKCjcTCKCvNWy5epSakUN5oNtdl+OjCkEBGwQ8o6+n2
	 9hX1OfDTbxwAn8gCJ9ca6GtI=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4779da35d27so23978925e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Nov 2025 07:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478759; x=1764083559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYW084xRPtrHcS9BFdMg3li+ldeYqP8F4NisC2kwgpU=;
        b=IDTnPDYwK7A+tZx2L6rA5JnftRhliQBUX/95jPE7ystj1LtV01U/cIhDbd9dCel/Jn
         n9dXRjO9UhyX2LVaW4ONSCg3OeH4vIexVLXBAN/x9Wa/T1q/pWIPwRR77ZiudemmSKvk
         rIUnsLRkcvm/f3ojHzmvb0I0jri8G+JxY5GE20vcLd+yZJhDj9I8PESPp/YV8K6upoC+
         a9qty1l6Vvdy34jTDp3kczMxPFhcDKMHFcJuSIt8F4EM4PDCqrB2swKqVz8jRexPlKyn
         iuBlp0ucxGalfL9dKIe0wPK7uHXmcokgkeVPjOhutAjaBhSB0XZm9jfOGb67PuXV0j8l
         QVtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoi/AHYTYvSQbupJKkK9v+xb3fIa+zPeYsQpnX9zdPxUPXVVxoEr9rsHvHdwcy3CstP9hNKARZdn5FrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXRXXs3IgxPdfx2TxdZJ+xo0V0O6qrh5nkARdsYvyUSbWMI6ok
	SgNlSW0oqpdfJ/ROCcBUPfZ5ZR0a9X936Lco9nAY1EFLePhn++6FP0EjeqAm23FCILFaD5PxWof
	QTiupUeJTud1XXUNQaDQueFUybNpczOaTf5faQzvGuqc7gA5gyiaXlAmamY5XoYMdaC0Ct5yGKu
	Bo9cCTHbE6QQ==
X-Gm-Gg: ASbGncvrDyc4j2EncOstPAotK1axwZiq4OmSBiz6vms1xeUYUEjyK6p449hkqS6zUhO
	Nj0Rrh0LSZ7czCW46zHVSTXnLXK8dvO1QQarsmJ42apAelGA8l/lWDCfyWFo1uuUY5j5DPHDSDc
	jOVhsEfmrbr27aqeMwY4UJJqnzvh4BQAIYZ5PdIlGAO/hE0nGngjShsA6PHwMEXQYGWf9FZwYXq
	z7fAySOrRKQqFMz+FOcyw5UqzPodNxojarH2LGcZyZgrGMpd/yp4SlI8+9+Mo8XRNwmew59BQ/P
	M2wcN5jQ1ysYZi+dz+rEq0j5D9lVyVa9ogMOhgHivI9nh4qN/zjq7E6GQwkUpFZX/LNSdytOUyr
	JVeESYIVletgEwTS70oUbAaLq54TVgMcde4/Ep1zjl4YVjvhxFYV0vekPbAJJWrRn7HgtGPQMmy
	LWFD0gcXw=
X-Received: by 2002:a05:600c:a47:b0:477:7a53:f493 with SMTP id 5b1f17b1804b1-4778fe78b15mr169656105e9.23.1763478758464;
        Tue, 18 Nov 2025 07:12:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9nR6zrXV9uSL6xlJiS/ofCjZNxePLdcNBepG1KcjfIHFcnQEuUiye7UVgA/UkolEiTj0s+Q==
X-Received: by 2002:a05:600c:a47:b0:477:7a53:f493 with SMTP id 5b1f17b1804b1-4778fe78b15mr169655645e9.23.1763478757841;
        Tue, 18 Nov 2025 07:12:37 -0800 (PST)
Received: from [192.168.103.118] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a04157c2sm143361745e9.1.2025.11.18.07.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 07:12:37 -0800 (PST)
Message-ID: <ffdfc550-559b-4c59-9873-3f040fc3bb0e@canonical.com>
Date: Tue, 18 Nov 2025 16:12:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] riscv: dts: starfive: Split jh7110-common.dtsi and
 move opp table to it
To: Hal Feng <hal.feng@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 E Shattow <e@freeshell.de>, Yao Zi <ziyao@disroot.org>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
 <20251107095530.114775-5-hal.feng@starfivetech.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20251107095530.114775-5-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_071246_717522_808F4900 
X-CRM114-Status: GOOD (  15.08  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/7/25 10:55, Hal Feng wrote:
> Preparing to add JH7110S based board device trees, move the content of
> jh7110-common.dtsi to the new file jh711x-common.dtsi and move opp table
> to jh7110-common.dtsi.
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>   .../boot/dts/starfive/jh7110-common.dtsi      | 665 +-----------------
>   .../boot/dts/starfive/jh711x-common.dtsi      | 664 +++++++++++++++++
>   arch/riscv/boot/dts/starfive/jh711x.dtsi      |  16 -
>   3 files changed, 678 insertions(+), 667 deletions(-)
>   create mode 100644 arch/riscv/boot/dts/starfive/jh711x-common.dtsi
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 809274625615..dd5805ef70a1 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -5,660 +5,23 @@
>    */
>   
>   /dts-v1/;
> -#include "jh711x.dtsi"
> -#include "jh7110-pinfunc.h"
> -#include <dt-bindings/gpio/gpio.h>
> -#include <dt-bindings/leds/common.h>
> -#include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
> +#include "jh711x-common.dtsi"
>   
> -/ {
> -	aliases {
> -		ethernet0 = &gmac0;
> -		i2c0 = &i2c0;
> -		i2c2 = &i2c2;
> -		i2c5 = &i2c5;
> -		i2c6 = &i2c6;
> -		mmc0 = &mmc0;
> -		mmc1 = &mmc1;
> -		serial0 = &uart0;
> +&cpu_opp {
> +	opp-375000000 {
> +		opp-hz = /bits/ 64 <375000000>;
> +		opp-microvolt = <800000>;
>   	};
> -
> -	chosen {
> -		stdout-path = "serial0:115200n8";
> -	};
> -
> -	memory@40000000 {
> -		device_type = "memory";
> -		reg = <0x0 0x40000000 0x1 0x0>;
> -		bootph-pre-ram;
> -	};
> -
> -	gpio-restart {
> -		compatible = "gpio-restart";
> -		gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
> -		priority = <224>;
> -	};
> -
> -	leds {
> -		compatible = "gpio-leds";
> -
> -		led_status_power: led-0 {
> -			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
> -		};
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
> +	opp-500000000 {
> +		opp-hz = /bits/ 64 <500000000>;
> +		opp-microvolt = <800000>;
>   	};
> -};
> -
> -&csi2rx {
> -	assigned-clocks = <&ispcrg JH7110_ISPCLK_VIN_SYS>;
> -	assigned-clock-rates = <297000000>;
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
> +	opp-750000000 {
> +		opp-hz = /bits/ 64 <750000000>;
> +		opp-microvolt = <800000>;
>   	};
> -};
> -
> -&gmac0 {
> -	phy-handle = <&phy0>;
> -	phy-mode = "rgmii-id";
> -
> -	mdio {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		compatible = "snps,dwmac-mdio";
> -
> -		phy0: ethernet-phy@0 {
> -			reg = <0>;
> -		};
> +	opp-1500000000 {
> +		opp-hz = /bits/ 64 <1500000000>;
> +		opp-microvolt = <1040000>;
>   	};
>   };
> -
> -&i2c0 {
> -	clock-frequency = <100000>;
> -	i2c-sda-hold-time-ns = <300>;
> -	i2c-sda-falling-time-ns = <510>;
> -	i2c-scl-falling-time-ns = <510>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&i2c0_pins>;
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
> -				regulator-name = "vdd_cpu";
> -			};
> -
> -			emmc_vdd: aldo4 {
> -				regulator-boot-on;
> -				regulator-always-on;
> -				regulator-min-microvolt = <1800000>;
> -				regulator-max-microvolt = <3300000>;
> -				regulator-name = "emmc_vdd";
> -			};
> -		};
> -	};
> -
> -	eeprom@50 {
> -		compatible = "atmel,24c04";
> -		reg = <0x50>;
> -		bootph-pre-ram;
> -		pagesize = <16>;
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
> -&mmc0 {
> -	max-frequency = <100000000>;
> -	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
> -	assigned-clock-rates = <50000000>;
> -	bus-width = <8>;
> -	bootph-pre-ram;
> -	cap-mmc-highspeed;
> -	mmc-ddr-1_8v;
> -	mmc-hs200-1_8v;
> -	cap-mmc-hw-reset;
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
> -	bootph-pre-ram;
> -	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> -	disable-wp;
> -	cap-sd-highspeed;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&mmc1_pins>;
> -	status = "okay";
> -};
> -
> -&pcie0 {
> -	perst-gpios = <&sysgpio 26 GPIO_ACTIVE_LOW>;
> -	phys = <&pciephy0>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pcie0_pins>;
> -};
> -
> -&pcie1 {
> -	perst-gpios = <&sysgpio 28 GPIO_ACTIVE_LOW>;
> -	phys = <&pciephy1>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pcie1_pins>;
> -};
> -
> -&pwmdac {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pwmdac_pins>;
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
> -		bootph-pre-ram;
> -		cdns,read-delay = <2>;
> -		spi-max-frequency = <100000000>;
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
> -				reg = <0x0 0xf0000>;
> -			};
> -			uboot-env@f0000 {
> -				reg = <0xf0000 0x10000>;
> -			};
> -			uboot@100000 {
> -				reg = <0x100000 0xf00000>;
> -			};
> -		};
> -	};
> -};
> -
> -&pwm {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pwm_pins>;
> -};
> -
> -&spi0 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&spi0_pins>;
> -};
> -
> -&syscrg {
> -	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
> -			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
> -			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
> -			  <&syscrg JH7110_SYSCLK_QSPI_REF>,
> -			  <&syscrg JH7110_SYSCLK_CPU_CORE>,
> -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> -	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
> -				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> -				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> -				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
> -	assigned-clock-rates = <0>, <0>, <0>, <0>, <500000000>, <1500000000>;
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
> -		bootph-pre-ram;
> -
> -		i2c-pins {
> -			pinmux = <GPIOMUX(19, GPOUT_LOW,
> -					      GPOEN_SYS_I2C5_CLK,
> -					      GPI_SYS_I2C5_CLK)>,
> -				 <GPIOMUX(20, GPOUT_LOW,
> -					      GPOEN_SYS_I2C5_DATA,
> -					      GPI_SYS_I2C5_DATA)>;
> -			bias-disable; /* external pull-up */
> -			bootph-pre-ram;
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
> -		mmc-pins {
> -			pinmux = <PINMUX(PAD_SD0_CLK, 0)>,
> -				 <PINMUX(PAD_SD0_CMD, 0)>,
> -				 <PINMUX(PAD_SD0_DATA0, 0)>,
> -				 <PINMUX(PAD_SD0_DATA1, 0)>,
> -				 <PINMUX(PAD_SD0_DATA2, 0)>,
> -				 <PINMUX(PAD_SD0_DATA3, 0)>,
> -				 <PINMUX(PAD_SD0_DATA4, 0)>,
> -				 <PINMUX(PAD_SD0_DATA5, 0)>,
> -				 <PINMUX(PAD_SD0_DATA6, 0)>,
> -				 <PINMUX(PAD_SD0_DATA7, 0)>;
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
> -	pcie0_pins: pcie0-0 {
> -		clkreq-pins {
> -			pinmux = <GPIOMUX(27, GPOUT_LOW,
> -					      GPOEN_DISABLE,
> -					      GPI_NONE)>;
> -			bias-pull-down;
> -			drive-strength = <2>;
> -			input-enable;
> -			input-schmitt-disable;
> -			slew-rate = <0>;
> -		};
> -
> -		wake-pins {
> -			pinmux = <GPIOMUX(32, GPOUT_LOW,
> -					      GPOEN_DISABLE,
> -					      GPI_NONE)>;
> -			bias-pull-up;
> -			drive-strength = <2>;
> -			input-enable;
> -			input-schmitt-disable;
> -			slew-rate = <0>;
> -		};
> -	};
> -
> -	pcie1_pins: pcie1-0 {
> -		clkreq-pins {
> -			pinmux = <GPIOMUX(29, GPOUT_LOW,
> -					      GPOEN_DISABLE,
> -					      GPI_NONE)>;
> -			bias-pull-down;
> -			drive-strength = <2>;
> -			input-enable;
> -			input-schmitt-disable;
> -			slew-rate = <0>;
> -		};
> -
> -		wake-pins {
> -			pinmux = <GPIOMUX(21, GPOUT_LOW,
> -				      GPOEN_DISABLE,
> -					      GPI_NONE)>;
> -			bias-pull-up;
> -			drive-strength = <2>;
> -			input-enable;
> -			input-schmitt-disable;
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
> -	bootph-pre-ram;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&uart0_pins>;
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
> -};
> diff --git a/arch/riscv/boot/dts/starfive/jh711x-common.dtsi b/arch/riscv/boot/dts/starfive/jh711x-common.dtsi
> new file mode 100644
> index 000000000000..809274625615
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh711x-common.dtsi
> @@ -0,0 +1,664 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> + */
> +
> +/dts-v1/;
> +#include "jh711x.dtsi"
> +#include "jh7110-pinfunc.h"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
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
> +		bootph-pre-ram;
> +	};
> +
> +	gpio-restart {
> +		compatible = "gpio-restart";
> +		gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
> +		priority = <224>;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led_status_power: led-0 {
> +			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
> +		};
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
> +				regulator-name = "vdd_cpu";
> +			};
> +
> +			emmc_vdd: aldo4 {
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "emmc_vdd";
> +			};
> +		};
> +	};
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c04";
> +		reg = <0x50>;
> +		bootph-pre-ram;
> +		pagesize = <16>;
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
> +	bootph-pre-ram;
> +	cap-mmc-highspeed;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	cap-mmc-hw-reset;
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
> +	bootph-pre-ram;
> +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc1_pins>;
> +	status = "okay";
> +};
> +
> +&pcie0 {
> +	perst-gpios = <&sysgpio 26 GPIO_ACTIVE_LOW>;
> +	phys = <&pciephy0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie0_pins>;
> +};
> +
> +&pcie1 {
> +	perst-gpios = <&sysgpio 28 GPIO_ACTIVE_LOW>;
> +	phys = <&pciephy1>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie1_pins>;
> +};
> +
> +&pwmdac {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwmdac_pins>;
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
> +		bootph-pre-ram;
> +		cdns,read-delay = <2>;
> +		spi-max-frequency = <100000000>;
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
> +				reg = <0x0 0xf0000>;
> +			};
> +			uboot-env@f0000 {
> +				reg = <0xf0000 0x10000>;
> +			};
> +			uboot@100000 {
> +				reg = <0x100000 0xf00000>;
> +			};
> +		};
> +	};
> +};
> +
> +&pwm {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm_pins>;
> +};
> +
> +&spi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi0_pins>;
> +};
> +
> +&syscrg {
> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
> +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
> +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
> +			  <&syscrg JH7110_SYSCLK_QSPI_REF>,
> +			  <&syscrg JH7110_SYSCLK_CPU_CORE>,
> +			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> +	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
> +	assigned-clock-rates = <0>, <0>, <0>, <0>, <500000000>, <1500000000>;
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
> +		bootph-pre-ram;
> +
> +		i2c-pins {
> +			pinmux = <GPIOMUX(19, GPOUT_LOW,
> +					      GPOEN_SYS_I2C5_CLK,
> +					      GPI_SYS_I2C5_CLK)>,
> +				 <GPIOMUX(20, GPOUT_LOW,
> +					      GPOEN_SYS_I2C5_DATA,
> +					      GPI_SYS_I2C5_DATA)>;
> +			bias-disable; /* external pull-up */
> +			bootph-pre-ram;
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
> +		mmc-pins {
> +			pinmux = <PINMUX(PAD_SD0_CLK, 0)>,
> +				 <PINMUX(PAD_SD0_CMD, 0)>,
> +				 <PINMUX(PAD_SD0_DATA0, 0)>,
> +				 <PINMUX(PAD_SD0_DATA1, 0)>,
> +				 <PINMUX(PAD_SD0_DATA2, 0)>,
> +				 <PINMUX(PAD_SD0_DATA3, 0)>,
> +				 <PINMUX(PAD_SD0_DATA4, 0)>,
> +				 <PINMUX(PAD_SD0_DATA5, 0)>,
> +				 <PINMUX(PAD_SD0_DATA6, 0)>,
> +				 <PINMUX(PAD_SD0_DATA7, 0)>;
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

Please, add

			bootph-pre-ram;

to allow U-Boot to boot from SD-card. Maybe in a separate patch.

Best regards

Heinrich

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
> +	pcie0_pins: pcie0-0 {
> +		clkreq-pins {
> +			pinmux = <GPIOMUX(27, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_NONE)>;
> +			bias-pull-down;
> +			drive-strength = <2>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		wake-pins {
> +			pinmux = <GPIOMUX(32, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_NONE)>;
> +			bias-pull-up;
> +			drive-strength = <2>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	pcie1_pins: pcie1-0 {
> +		clkreq-pins {
> +			pinmux = <GPIOMUX(29, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_NONE)>;
> +			bias-pull-down;
> +			drive-strength = <2>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		wake-pins {
> +			pinmux = <GPIOMUX(21, GPOUT_LOW,
> +				      GPOEN_DISABLE,
> +					      GPI_NONE)>;
> +			bias-pull-up;
> +			drive-strength = <2>;
> +			input-enable;
> +			input-schmitt-disable;
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
> +	bootph-pre-ram;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pins>;
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
> diff --git a/arch/riscv/boot/dts/starfive/jh711x.dtsi b/arch/riscv/boot/dts/starfive/jh711x.dtsi
> index 6e56e9d20bb0..a380d3dabedd 100644
> --- a/arch/riscv/boot/dts/starfive/jh711x.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh711x.dtsi
> @@ -205,22 +205,6 @@ core4 {
>   	cpu_opp: opp-table-0 {
>   			compatible = "operating-points-v2";
>   			opp-shared;
> -			opp-375000000 {
> -					opp-hz = /bits/ 64 <375000000>;
> -					opp-microvolt = <800000>;
> -			};
> -			opp-500000000 {
> -					opp-hz = /bits/ 64 <500000000>;
> -					opp-microvolt = <800000>;
> -			};
> -			opp-750000000 {
> -					opp-hz = /bits/ 64 <750000000>;
> -					opp-microvolt = <800000>;
> -			};
> -			opp-1500000000 {
> -					opp-hz = /bits/ 64 <1500000000>;
> -					opp-microvolt = <1040000>;
> -			};
>   	};
>   
>   	thermal-zones {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
