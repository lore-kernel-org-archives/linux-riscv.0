Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788F3C43217
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 17:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=irMXiTomAUfS9m6dXXjynDznUm+kjI8tkXr+ThN0gFU=; b=rxbKkpTJDqudxP
	ATC05TvsnQXMu1nxmAsWw0bBIwpd0O2GA62dDmM0p9n6TSOkLmBd4xeCezGMKgWz3mKjQ1bMmEXRO
	fqcYMxJ97Q4KS9lBjP0I6g5v/MYF+XGnMV6x7Tb0oNCQZimnXaEvvzXrx+Hkx6uIjIt6XzoPuLHI3
	9t1te7jDv47h4l2ZyW1aWbVILx0SPVrr03MN0hqbGBhcTamoR0lNjHVkxlcm68xXJBYNXBmSFMM8D
	RThJGeXnk/+9La7dShU3abWRjIhYKeirUt2p3cElNE2Um18mRQPVXJT7l2CsROuuGLj2fYLnSwL4i
	f6QXOwolCdTAl8sUt+SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLLe-00CbX0-H5; Sun, 27 Nov 2022 17:21:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLLZ-00CbUl-PM
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 17:21:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E9B5D60DED;
	Sun, 27 Nov 2022 17:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92350C433D6;
	Sun, 27 Nov 2022 17:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669569699;
	bh=RbCdGgC86wp3IrVQB8kh4eO/EyjCHT42dZFvCZpk/+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBMFXK1XCqZSlP6OynF8hySHk5Qk7DpLm+s66cDs+n4ztSQKlOSuP1BgvhyizhhMk
	 JGC9AKOhXRbqrdGsQWiK2dDLg4SU3P9MvRuTFRVElW8HdVVKN5twCpIr/iycITj2ER
	 ZI+VUPNqz5Q1eiwCwcwiinxrt4PwdX0h4ZbnQzbgbMCGWxtadp7VEAhoS8ve+1z1Cg
	 /2xlHZQKdpTG2v7bSNbJKK86lyul1owd7SBJRUB8nOMWcBGcVywY4i2cs3juL/41Ps
	 vrkfwjEx++VHZlzkPzt9kHvqVTZPVq7PsxxmNlZbw/eGxlT38FbA6t05o6Ns+97tLR
	 7BJ9XhP4BnvAg==
Date: Sun, 27 Nov 2022 17:21:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 6/9] riscv: dts: bouffalolab: add the bl808 SoC base
 device tree
Message-ID: <Y4OcngDlw/4Szt7g@spud>
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-7-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221127132448.4034-7-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_092141_946775_F18548BE 
X-CRM114-Status: GOOD (  20.44  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

+CC Icenowy

On Sun, Nov 27, 2022 at 09:24:45PM +0800, Jisheng Zhang wrote:
> Add a baisc dtsi for the bouffalolab bl808 SoC.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/bouffalolab/bl808.dtsi | 74 ++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808.dtsi
> 
> diff --git a/arch/riscv/boot/dts/bouffalolab/bl808.dtsi b/arch/riscv/boot/dts/bouffalolab/bl808.dtsi
> new file mode 100644
> index 000000000000..f4b170ccc32e
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
> +		#clock-cells = <0>;
> +		/* This value must be overridden by the board */
> +		clock-frequency = <0>;
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
> +			compatible = "bouffalolab,bl808-uart";
> +			reg = <0x30002000 0x1000>;
> +			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&xtal>;
> +			status = "disabled";
> +		};
> +
> +		plic: interrupt-controller@e0000000 {
> +			compatible = "thead,c900-plic";

Hmm, @Icenowy - should this use your new open-c906-plic compatible from
20221121041757.418645-4-uwu@icenowy.me ?

As is, dtbs_check gives a:
bl808-sipeed-m1s-dock.dtb: interrupt-controller@e0000000: compatible: 'oneOf' conditional failed, one must be fixed:
        ['thead,c900-plic'] is too short

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
> 2.38.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
