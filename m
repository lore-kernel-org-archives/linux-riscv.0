Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07105C3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 01:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ynVkGBQYmQ1G9nzh3paBzY3Zk2TbBEIOBJ6fY1mA9ws=; b=CFznE/S5vj1J/Y
	QS8bj3pKt+YTFPb6qGgda8lzy5MH65Cg6Uqabod/beMZY7hKsbKTi4am+AarNR3Nc03LV9YB9QVnB
	wDdfAU1Z3im0ZjdvsjhQGEqQadsU6K2mUn8aMKNZNxYLeWM7ktdsEDb5pUnDY+qmebUeizokMJMek
	CZjKyB02ju9x4x1knejT4+scoOfpKxCfzh8d3DWomBKGZmDNePAA0wsSfIBmJHA+hZmZVvWE1G8YA
	UHy4TDbSPPEis/2JgtH8d8ygE1RfPa6QaihsvmizN29p/AnvD0YvMjYQK8DtBtTXAHY0HjCUaOzw4
	ug1W2Nfd1F7c19TkEHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF28h-008lq8-11;
	Mon, 18 Dec 2023 01:09:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF28d-008lpY-0L;
	Mon, 18 Dec 2023 01:09:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA0F01FB;
	Sun, 17 Dec 2023 17:10:24 -0800 (PST)
Received: from minigeek.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6A413F738;
	Sun, 17 Dec 2023 17:09:36 -0800 (PST)
Date: Mon, 18 Dec 2023 01:09:26 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Maksim Kiselev <bigunclemax@gmail.com>
Subject: Re: [PATCH v6 3/3] riscv: dts: allwinner: d1: Add thermal sensor
Message-ID: <20231218010926.10e15c57@minigeek.lan>
In-Reply-To: <20231217210629.131486-4-bigunclemax@gmail.com>
References: <20231217210629.131486-1-bigunclemax@gmail.com>
	<20231217210629.131486-4-bigunclemax@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_170943_211695_BDBB1598 
X-CRM114-Status: GOOD (  14.51  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Zhang Rui <rui.zhang@intel.com>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-pm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 18 Dec 2023 00:06:24 +0300
Maksim Kiselev <bigunclemax@gmail.com> wrote:

Hi,

> From: Maxim Kiselev <bigunclemax@gmail.com>
> 
> This patch adds a thermal sensor controller node for the D1/T113s.
> Also it adds a THS calibration data cell to efuse node.
> 
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> ---
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi      | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index 5a9d7f5a75b4..6f5427d9cfbf 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -166,6 +166,19 @@ gpadc: adc@2009000 {
>  			#io-channel-cells = <1>;
>  		};
>  
> +		ths: thermal-sensor@2009400 {
> +			compatible = "allwinner,sun20i-d1-ths";
> +			reg = <0x02009400 0x400>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(58) IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_THS>;
> +			clock-names = "bus";
> +			resets = <&ccu RST_BUS_THS>;
> +			nvmem-cells = <&ths_calibration>;
> +			nvmem-cell-names = "calibration";
> +			status = "disabled";

Any reason this is disabled? We typically don't disable those internal
devices in the SoC .dtsi, the THS is one example (check the instances
in other SoCs' .dtsi files).

The rest looks alright, compared to the manual, so with this line
removed:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> +			#thermal-sensor-cells = <0>;
> +		};
> +
>  		dmic: dmic@2031000 {
>  			compatible = "allwinner,sun20i-d1-dmic",
>  				     "allwinner,sun50i-h6-dmic";
> @@ -415,6 +428,10 @@ sid: efuse@3006000 {
>  			reg = <0x3006000 0x1000>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +
> +			ths_calibration: thermal-sensor-calibration@14 {
> +				reg = <0x14 0x4>;
> +			};
>  		};
>  
>  		crypto: crypto@3040000 {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
