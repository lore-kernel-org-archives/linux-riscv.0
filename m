Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7421C47258
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 03:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XbmCsTUyQlarHgGjrzvdNLyOUAK9OsdVTNUKTIT+kHw=; b=hRhPx2ykmbshaz
	xnM4IcIGx2+WRLlfS282U1zuJKiHH6y04UoofoX0RIxKFwsdGTxW9fRLfjPBLjP9OTXcA8DaRFGwk
	yY66vtyvc1+YcRrORZzZDJ2XvfbHCsLgksY9P7ilAim/W5HUGHLn2I+HHT/UeOSNZdT+qlW4Rr80J
	jjGolS7tV1qpqjRvMmfDv1Y5DEiwr7LUU5Y4Wb9mzI3gVI2glCREJ13DZqSHhZlZEytUoBg8Prboh
	njq5us5jG4wbqozFq/UYA6OGujS/ut3P4P8oDXA5vBRhBhW6XysldnhfmRN8/94mbEnCSrfRh+sNm
	Tcoox/S2ncHIXSpcRCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUHtm-0000000B4pO-3t0E;
	Mon, 29 Jan 2024 03:01:26 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUHtk-0000000B4on-0609
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 03:01:25 +0000
Date: Mon, 29 Jan 2024 03:01:15 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Chao Wei <chao.wei@sophgo.com>, Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: cv18xx: Add spi devices
Message-ID: <20240129030115.GB1097489@ofsar>
References: <IA1PR20MB49533BACE8D47590C1C341D2BB7E2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953654F150743B649D5ADCEBB7E2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953654F150743B649D5ADCEBB7E2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_190124_128700_182E034B 
X-CRM114-Status: GOOD (  11.20  )
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

Hi Inochi Amaoto

On 10:26 Mon 29 Jan     , Inochi Amaoto wrote:
> Add spi devices for the CV180x, CV181x and SG200x soc.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 44 ++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> index 7c88cbe8e91d..e66f9e9feb48 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -176,6 +176,50 @@ uart3: serial@4170000 {
>  			status = "disabled";
>  		};
> 
> +		spi0: spi@4180000 {
> +			compatible = "snps,dw-apb-ssi";
> +			reg = <0x04180000 0x10000>;
> +			interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI0>;
> +			clock-names = "ssi_clk", "pclk";
..
> +			#address-cells = <1>;
> +			#size-cells = <0>;
I'd suggest moving those two above 'interrupts' property

there is an ongoing discussion here..
https://lore.kernel.org/all/20231203174622.18402-1-krzysztof.kozlowski@linaro.org/

> +			status = "disabled";
> +		};
> +
> +		spi1: spi@4190000 {
> +			compatible = "snps,dw-apb-ssi";
> +			reg = <0x04190000 0x10000>;
> +			interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI1>;
> +			clock-names = "ssi_clk", "pclk";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		spi2: spi@41a0000 {
> +			compatible = "snps,dw-apb-ssi";
> +			reg = <0x041a0000 0x10000>;
> +			interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI2>;
> +			clock-names = "ssi_clk", "pclk";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		spi3: spi@41b0000 {
> +			compatible = "snps,dw-apb-ssi";
> +			reg = <0x041b0000 0x10000>;
> +			interrupts = <57 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI3>;
> +			clock-names = "ssi_clk", "pclk";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		uart4: serial@41c0000 {
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0x041c0000 0x100>;
> --
> 2.43.0

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
