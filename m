Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAFFC433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 11:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XK22kBtgaThkBr5ubOjX3U/N043yH+xSTfcWaf0D9l0=; b=Ps2mGo1XLIK8uj
	GwukeO5f9ZKeeUtyeGgf/mM/qwBfao6EWfahNo0MZamgLiFW7KqDYhSoaljjE+iZOuE/jupoDgNgp
	qGrWqrWkLCG744mk0Bp0xFUFus/423Xygc5XgI9h6hPSQgKnmXYbB0FY22b72IA8qVvH5eqs4Lefe
	rolZcSnedTqBkrOxBrO5BBwsEY/FPWiop/JCXyG74ldhLSxqdekKoU/7GdKXUGrlpwVr3Q65wXtGt
	t9y4YfhYWNMlE1E0TiXDege0OsidFhGuhdmZ94Z6yUK5FYJjmEIDPcNlIxAEXDUCXrMUaUJjHbcn9
	/rz3PXx9FX8hVzHs5Puw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owi5z-003qiu-LX; Sun, 20 Nov 2022 11:02:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owi5x-003qia-DA
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 11:02:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C9247B8069A;
	Sun, 20 Nov 2022 11:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E6EC433C1;
	Sun, 20 Nov 2022 11:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668942158;
	bh=gDU2LVXIzZwLgBshn5UVoInFo0YQ5h+qGGMcrbbByiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cs/PSADvyqH2ADXPbipsh1UqqL5+N4J52iN86y/9Ew92/X+0a29He9D9ds1c9FvmK
	 +QVB8ohmocBD4E6DpjYtlBx6DfFOUJJdmSbBq5g6TmFGlMJVJ/zRsCXtiehfI4G8OB
	 JQ3ZTopkx++6lrMFU8Hl8HVrqhMV3jOMZgHE06adWe/KPefOJaLhLsQiFqreK7nGVT
	 k6BoUN6D97PzBNuaVG+LiHjOCa+E/H3D92esGe60FgVtJpyd27a/QRK3Va6TpbkEb9
	 PW7Y/Rt8Va7jUm0rXv632cPL308HS/RnxY0gB7vlmQ+g82T7vxMWqMaJ6ADsFLcTVg
	 W/XfX2LZHQblA==
Date: Sun, 20 Nov 2022 11:02:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 5/7] riscv: dts: bouffalolab: add the bl808 SoC base
 device tree
Message-ID: <Y3oJSfsNFE9Cn0Al@spud>
References: <20221120082114.3030-1-jszhang@kernel.org>
 <20221120082114.3030-6-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221120082114.3030-6-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_030241_777763_B0E494BF 
X-CRM114-Status: GOOD (  23.76  )
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

On Sun, Nov 20, 2022 at 04:21:12PM +0800, Jisheng Zhang wrote:
> Add a baisc dtsi for the bouffalolab bl808 SoC.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/Makefile               |  1 +
>  arch/riscv/boot/dts/bouffalolab/bl808.dtsi | 74 ++++++++++++++++++++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808.dtsi
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index ff174996cdfd..b525467152b2 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +subdir-y += bouffalolab
>  subdir-y += sifive
>  subdir-y += starfive
>  subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
> diff --git a/arch/riscv/boot/dts/bouffalolab/bl808.dtsi b/arch/riscv/boot/dts/bouffalolab/bl808.dtsi
> new file mode 100644
> index 000000000000..c98ebb14ee10
> --- /dev/null
> +++ b/arch/riscv/boot/dts/bouffalolab/bl808.dtsi
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + * Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	compatible = "bouffalolab,bl808";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	cpus {
> +		timebase-frequency = <1000000>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "thead,c906", "riscv";

So this is not yet defined as the dt etc for the d1 has not yet landed.
I think I will go pick up that patch for v6.2 as it should make
everyone's life easier.

Without that, dtbs_check produces:
arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtb:0:0: /cpus/cpu@0: failed to match any schema with compatible: ['thead,c906', 'riscv']

> +			device_type = "cpu";
> +			reg = <0>;
> +			d-cache-block-size = <64>;
> +			d-cache-sets = <256>;
> +			d-cache-size = <32768>;
> +			i-cache-block-size = <64>;
> +			i-cache-sets = <128>;
> +			i-cache-size = <32768>;
> +			mmu-type = "riscv,sv39";
> +			riscv,isa = "rv64imafdc";
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#address-cells = <0>;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +	};
> +
> +	xtal: xtal-clk {
> +		compatible = "fixed-clock";
> +		clock-frequency = <40000000>;
> +		clock-output-names = "xtal";
> +		#clock-cells = <0>;
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		ranges;
> +		interrupt-parent = <&plic>;
> +		dma-noncoherent;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		uart0: serial@30002000 {
> +			compatible = "bouffalolab,uart";
> +			reg = <0x30002000 0x1000>;
> +			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&xtal>;
> +			status = "disabled";
> +		};
> +
> +		plic: interrupt-controller@e0000000 {
> +			compatible = "thead,c900-plic";

Hmm, this one fails validation too. Likely you need to add a
"bouffalolab,plic" to the plic dt-binding or otherwise modify the
binding such that thead,c900-plic on it's own is permitted. CC Samuel on
that patch please in case he has an opinion on it.

Also, I've taken over picking up the misc dt stuff that Palmer used to
apply - so canaan, starfive & sifive stuff. Do you intended sending PRs
to Arnd for this stuff, or would you like to me bundle it with what I am
going to be sending anyway?

Thanks,
Conor.

> +			reg = <0xe0000000 0x4000000>;
> +			interrupts-extended = <&cpu0_intc 0xffffffff>,
> +					      <&cpu0_intc 9>;
> +			interrupt-controller;
> +			#address-cells = <0>;
> +			#interrupt-cells = <2>;
> +			riscv,ndev = <64>;
> +		};
> +	};
> +};
> -- 
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
