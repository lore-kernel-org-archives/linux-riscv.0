Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CC6C021B8
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Mar 2025 02:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GGPmXmPaaxzeHAjt1K6EDT4RPcyrPcjJM/gGZRL/17E=; b=mqYG+F50WjX0R7
	AgX9l2UDgG7cATdnptlrwtIJujkRO2sfobfppcN9N2QuzY2yw1O/xKEnGJXO6AeH4RU1A45w9UUc+
	T4t8Br8glOG9qI9MvsG/VS9WaLWCzOV/TTJKYQQD+A8RjmTf6kIg8sbFvK43RetPl0Mxs//+IaqDX
	V3DbFrr6qQgN/6/Vskj7pn2+mXM0E33JD3piQIKFP/LODbimXrKcG/XOTAi2p4AKa8RD9Bz9fnRy5
	85rKUxibQBUcUMlUFFxtaaSS2I6z4bnZxGKuOs1U37LCp9SifhjSDN/Q5A07t3NoarUUdHVJyg1kh
	eN0R2Nm11ow2CniFIcvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toYv8-0000000FFdM-2K3Z;
	Sun, 02 Mar 2025 02:19:10 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toYv6-0000000FFcx-0BOJ
	for linux-riscv@lists.infradead.org;
	Sun, 02 Mar 2025 02:19:09 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-474bc1aaf52so25467921cf.1
        for <linux-riscv@lists.infradead.org>; Sat, 01 Mar 2025 18:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740881946; x=1741486746; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oPjKRzzKrglUg+fYVwz0cgQwVYZBInp7nhcExhwtF6w=;
        b=MMQ2epp3ZKtBewTAH+kzZ8vz5R4giySgqa3LxVR+bdtvizayvGw1Ug5Ui4Yuw0RnYl
         /lmJguW0JaaSGpL9Q/28QhRihqobTfUOn/R7YB3vnnLEA0DXp10p5kCs4s1yWH56dmPT
         uc00wmLo7zPw/r1RgLotGJ2lhYGpwJAsez2840bfc1TyTaGOPeYyLoCKHO25EQ9c1GKF
         FiDIdwsTMqhtdYMeCCyt38Ig6Tlmfsj9ojEVadkxWIy8+jJoXNGujHzrRpfcFSDXq3K9
         joa5JSkrYNuwawS/dbxofa+tnbSGXsiad4Cy09CEeSAp5LgjBIIF4pB6R6ETI10xRo2V
         r7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740881946; x=1741486746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPjKRzzKrglUg+fYVwz0cgQwVYZBInp7nhcExhwtF6w=;
        b=NE1I3W7xWhIFYZLSKcC/9uafs7FfX/7kQGUmVcyQFr7H0czkKTharkbvhlxcn89CjT
         dkR9QaelK/ro/WvX7MrIULGFfPNvPo4M2W1q2LIMqP0dngTgcddcBNSc4MvBO8HYfWVI
         r6dpRaU9qsYti7uuHLI4oyOAzzYKUtTSS/Lgi6/Spql87pcyCXwM+jvh+w6bMYxenX+d
         rlqRtAiHaaGJCIc2NFUE2UYyesrJpm4tfBbJIPLh9jMCfGxqkFg/9PflyLdkgE4Io6JY
         LmZ5waL7jwhnZj7Djf+0cUlOg+QuazLDFVKSmaoY3OZmwQIgVTDJK8KYgVN0Rjkq6Xzf
         2+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWNdMb4DZ+c9N3nGOJrvFAJ7t873OJSUBXNSyQyhhJA8jXSP7Byk4tazduXi7u+aW04ibbOselqG7Biaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyN4N3WlkIq4hjD7/uXyJ9SI01G2K7M82j70Jzkbo7e7zVuhtA5
	79hC6//u+Tn5Rc+IVKxr9VeZViYGeGdkI5zNEF6Mlyq/nENfx6L3
X-Gm-Gg: ASbGncvWiURt0mOkbHpK6d00d+Z+lrlsGCbGpDSSUWWa1SIDFua53ExgJblYAvARDcI
	RNlEJDoVnSHBXL+1HRhsM+YxvVGfbROy/U33uo8Umxhde1MIM0Gj/Fo8cvXFn3y6LsYjtnkE6RI
	ajIS1/LwipsmZIgggYT9xAL/bVa7bKuSB+TMFVDbXL0is8AEjJaPvxYV4WjULxZLqKmnbG1F0io
	VNecdtRGSj2hjYeheNjbEnINpsBb46i0fnZpTX06+PwxA1h8EnLhXbZNArtYQDjlDbzBXHDyc5G
	9GYmPnp67QGJiR67h3Xf
X-Google-Smtp-Source: AGHT+IGrdEuBUkRKtS239DYTHqorXLkacSTFcSVvkbaNWolaWYlbaQEuA1xg/Dhtk3D1fi/XT3FAXQ==
X-Received: by 2002:a05:6214:1bc9:b0:6e6:5d61:4f00 with SMTP id 6a1803df08f44-6e8a0c7da89mr139365716d6.4.1740881946305;
        Sat, 01 Mar 2025 18:19:06 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3b67458e0sm5920285a.57.2025.03.01.18.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 18:19:05 -0800 (PST)
Date: Sun, 2 Mar 2025 10:18:42 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Zixian Zeng <sycamoremoon376@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com
Subject: Re: [PATCH v2] riscv: sophgo: dts: Add spi controller for SG2042
Message-ID: <fllmh65x7ke4sfolxbdod73fx3fm45w7gy7x4pgamxnbhztjvk@wqd56dzxaa37>
References: <20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_181908_109990_7DCA7325 
X-CRM114-Status: GOOD (  22.85  )
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

On Fri, Feb 28, 2025 at 08:40:23PM +0800, Zixian Zeng wrote:
> Add spi controllers for SG2042.
> 
> SG2042 uses the upstreamed Synopsys DW SPI IP.
> 
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> ---
> For this spi controller patch, only bindings are included.
> This is tested on milkv-pioneer board. Using driver/spi/spidev.c
> for creating /dev/spidevX.Y and tools/spi/spidev_test for testing
> functionality.

I wonder whether this patch is tested (or at least can be
tested), as I am not sure there are pins for spi or any
onboard device on existing SG2042 board.

> ---
> Changes in v2:
> - rebase v1 to sophgo/master(github.com/sophgo/linux.git).
> - order properties in device node.
> - remove unevaluated properties `clock-frequency`.
> - set default status to disable.
> - Link to v1: https://lore.kernel.org/r/20250228-sfg-spi-v1-1-b989aed94911@gmail.com
> ---
>  .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |  8 +++++++
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 28 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> index be596d01ff8d33bcdbe431d9731a55ee190ad5b3..c43a807af2f827b5267afe5e4fdf6e9e857dfa20 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> @@ -72,6 +72,14 @@ &uart0 {
>  	status = "okay";
>  };
>  
> +&spi0 {
> +	status = "okay";
> +};
> +
> +&spi1 {
> +	status = "okay";
> +};
> +
>  / {
>  	thermal-zones {
>  		soc-thermal {
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> index e62ac51ac55abd922b5ef796ba8c2196383850c4..500645147b1f8ed0a08ad3cafb38ea79cf57d737 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> @@ -545,5 +545,33 @@ sd: mmc@704002b000 {
>  				      "timer";
>  			status = "disabled";
>  		};
> +
> +		spi0: spi@7040004000 {
> +			compatible = "snps,dw-apb-ssi";
> +			reg = <0x70 0x40004000 0x00 0x1000>;

> +			clocks = <&clkgen GATE_CLK_APB_SPI>,
> +					<&clkgen GATE_CLK_SYSDMA_AXI>;

Is the sysdma axi clock for the this device. IIRC is APB interface.

Also, Are these clock aligned? If not, use space to align the two
clocks. You also need to add the clock-names here.

> +			interrupt-parent = <&intc>;
> +			interrupts = <110 IRQ_TYPE_LEVEL_HIGH>;

> +			#address-cells = <0x01>;
> +			#size-cells = <0x00>;
> +			num-cs = <0x02>;

Just use decimal number, no hex there.

> +			resets = <&rstgen RST_SPI0>;
> +			status = "disabled";
> +		};
> +
> +		spi1: spi@7040005000 {
> +			compatible = "snps,dw-apb-ssi";
> +			reg = <0x70 0x40005000 0x00 0x1000>;

> +			clocks = <&clkgen GATE_CLK_APB_SPI>,
> +					<&clkgen GATE_CLK_SYSDMA_AXI>;

The same as above.

> +			interrupt-parent = <&intc>;
> +			interrupts = <111 IRQ_TYPE_LEVEL_HIGH>;

> +			#address-cells = <0x01>;
> +			#size-cells = <0x00>;
> +			num-cs = <0x02>;

The same as above.

> +			resets = <&rstgen RST_SPI1>;
> +			status = "disabled";
> +		};
>  	};
>  };
> 
> ---
> base-commit: aa5ee7180ec41bb77c3e327e95d119f2294babea
> change-id: 20250228-sfg-spi-e3f2aeca09ab
> 
> Best regards,
> -- 
> Zixian Zeng <sycamoremoon376@gmail.com>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
