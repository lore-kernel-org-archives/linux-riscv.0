Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D8CCEFCE7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 18:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2hIzVZqDHVkZRhRzvIi3PguN7bxn70RyvaUrCPsD4I=; b=jtMEiCWuyxSGSD
	h/fuNlB08SI5MdQ7/CWNLRJ0gpRwBlsN7IzYMSB8Kd8Nyk3Mien+VP7apCqXnwigWypdbl2akE5mG
	2AIUfRhjzLKX2OMjlQKmgfnhDXB5t7z4R+Eqh4bONQPs1umTO1wSTlLI//EvYg32MhUSdVL0VzF2D
	E/p0McMk2jqGeWe3Zzojh/fQX0+elGn9BPJQkPQoapn2Q+Gb1wpL6RdYn6srlAy3u+GlzMElIYha9
	/yu/NSFF+IRUsCw/56TWFp7zpngyn2MQPYa0H6HcLQMLONVwvv1i3bE80xYYSz82BZnmfAo5Vsw+o
	q5lSWOEaBrCNbaRaTdpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBmf-0000000Dfud-0zRp;
	Tue, 06 Jan 2026 18:27:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBme-0000000DfuW-27py
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 18:27:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC2FE60147;
	Tue,  6 Jan 2026 18:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F48C19423;
	Tue,  6 Jan 2026 18:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767724075;
	bh=Prv57drWJrH6jeQxrlKC1P3LM56QbpCo4BEmXOIcOk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQ9Biqbon5XoPR3/DxK4V4OTbpe9l6bkrBiox0FkY4UYFsrYYLQDzWmLMYnnLTfJr
	 4hGZbpxQFnH/YYWzRotId8mJtxPY4x/ySgMFWefl3GjWndsd1TpL1bfbe9gh+NAK9X
	 QuOgQr3UEY4zhuNHt9JJyeRBiHN7+aGuwuhRer9wnf2fIoKaR/4oGPj+K9MdtUe6Bh
	 11LFYU9RIJ3wYcijSKoj9bhdH5+tfhf1EqxqPgrQaQ9yqvW4Ukj7j3TKbV7aHxANa1
	 mHF7jr15Qk1kxqkgAB0m9Vh30svSKpLjFjPXmDAXbkEMPD42i3sINSuGxBIgTfZnZs
	 ZSqJ2gp5t7lVg==
Date: Tue, 6 Jan 2026 12:27:54 -0600
From: Rob Herring <robh@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: conor@kernel.org, krzk+dt@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, alex@ghiti.fr, cyy@cyyself.name,
	kingxukai@zohomail.com, TroyMitchell988@gmail.com,
	gaohan@iscas.ac.cn, me@ziyao.cc
Subject: Re: [PATCH v2 2/2] riscv: dts: canaan: Add initial dshanpi board DT
 files
Message-ID: <20260106182754.GA2506656-robh@kernel.org>
References: <20260104070911.219588-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260104070911.219588-3-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260104070911.219588-3-jiayu.riscv@isrc.iscas.ac.cn>
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

On Sun, Jan 04, 2026 at 03:09:11PM +0800, Jiayu Du wrote:
> Add board devicetree for 100ask K230 dashanpi, and also the SoM
> device utilized by the board. UART0 is enabled as the default
> console.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/canaan/Makefile           |  1 +
>  .../boot/dts/canaan/k230-canmv-dshanpi.dts    | 82 +++++++++++++++++++
>  .../dts/canaan/k230-canmv-module-dshanpi.dtsi | 30 +++++++
>  3 files changed, 113 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k230-canmv-module-dshanpi.dtsi
> 
> diff --git a/arch/riscv/boot/dts/canaan/Makefile b/arch/riscv/boot/dts/canaan/Makefile
> index 7d54ea5c6f3d..89cb64bde440 100644
> --- a/arch/riscv/boot/dts/canaan/Makefile
> +++ b/arch/riscv/boot/dts/canaan/Makefile
> @@ -2,6 +2,7 @@
>  dtb-$(CONFIG_ARCH_CANAAN) += canaan_kd233.dtb
>  dtb-$(CONFIG_ARCH_CANAAN) += k210_generic.dtb
>  dtb-$(CONFIG_ARCH_CANAAN) += k230-canmv.dtb
> +dtb-$(CONFIG_ARCH_CANAAN) += k230-canmv-dshanpi.dtb
>  dtb-$(CONFIG_ARCH_CANAAN) += k230-evb.dtb
>  dtb-$(CONFIG_ARCH_CANAAN) += sipeed_maix_bit.dtb
>  dtb-$(CONFIG_ARCH_CANAAN) += sipeed_maix_dock.dtb
> diff --git a/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts b/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts
> new file mode 100644
> index 000000000000..4f95b534ee87
> --- /dev/null
> +++ b/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2025 Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> + */
> +
> +/dts-v1/;
> +
> +#include "k230-canmv-module-dshanpi.dtsi"
> +
> +/ {
> +	model = "100ask CanMV-K230-dshanpi";
> +	compatible = "100ask,canmv-k230-dshanpi",
> +		     "100ask,canmv-k230-module-dshanpi",
> +		     "canaan,kendryte-k230";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	vdd_5v: regulator-vdd-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vdd_3v3: regulator-vdd-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		vin-supply = <&vdd_5v>;
> +	};
> +
> +	vdd_1v8: regulator-vdd-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		vin-supply = <&vdd_5v>;
> +	};
> +};
> +
> +&pinctrl {
> +	uart0_pins: uart0-pins {
> +		uart0-txd-cfg {
> +			pinmux = <K230_PINMUX(38, 1)>;
> +			slew-rate = <0>;
> +			drive-strength = <7>;
> +			power-source = <K230_MSC_1V8>;
> +			output-enable;
> +			bias-disable;
> +			input-schmitt-enable;
> +		};
> +
> +		uart0-rxd-cfg {
> +			pinmux = <K230_PINMUX(39, 1)>;
> +			slew-rate = <0>;
> +			drive-strength = <7>;
> +			power-source = <K230_MSC_1V8>;
> +			input-enable;
> +			bias-disable;
> +			input-schmitt-enable;
> +		};
> +	};
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pins>;
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/canaan/k230-canmv-module-dshanpi.dtsi b/arch/riscv/boot/dts/canaan/k230-canmv-module-dshanpi.dtsi
> new file mode 100644
> index 000000000000..ed0abc68f321
> --- /dev/null
> +++ b/arch/riscv/boot/dts/canaan/k230-canmv-module-dshanpi.dtsi
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2025 Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> + */
> +
> +/dts-v1/;
> +
> +#include "k230.dtsi"
> +
> +/ {
> +	model = "100ask CanMV-K230-Module-dshanpi";
> +	compatible = "100ask,canmv-k230-module-dshanpi",
> +		     "canaan,kendryte-k230";

These get overwritten, but aren't really valid on their own. Drop.

> +
> +	ddr: memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x40000000>;
> +	};
> +
> +	timerx_pulse_in: clock-50m {

clock-50000000

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <50000000>;
> +	};
> +};
> +
> +&sysclk {
> +	clocks = <&osc24m>, <&timerx_pulse_in>;
> +	clock-names = "osc24m", "timer-pulse-in";
> +};
> -- 
> 2.52.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
