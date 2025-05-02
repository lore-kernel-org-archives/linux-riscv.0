Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A488CC369DC
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 00:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4FrnjFiIN3W4PhN3nSePxs/OrzLncV86MgyGN6QjoE=; b=FzkOlYauAfkNSp
	WeddDLWZ0Qs2jSwYrSpxSxhfoew4V+L0VP1rMowg55rD+hGprGanQnea+NGSbxk6unQcLvcsNmb4J
	7KTR8nksEWO/NwPjvqdwQLAxpTg/LAuEAZ1ygOdHuGD91vEpFrQOlYGbbymNXrJ6CMdZnv7SKs/8S
	4kXhSqyJRmXprYyb22raAT/pnxUThrZl4ea+IShc9kN/5FZGcOc1t/gt5itM5QfklgpA4J50eRyif
	5HSZkMXev2M+eHLa0tt0Y1Nm0+byFQgwfLrtppGxZJ4i4p1rWs8Hb5sbKpfwcjNNspLR/eOhvHBqH
	QaBK5VlRe+YTVbghgG8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAeVD-00000000Qpb-216H;
	Fri, 02 May 2025 00:43:43 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAeVA-00000000QoN-3C7l
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 00:43:41 +0000
Received: from localhost (unknown [116.232.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0E151342FDB;
	Fri, 02 May 2025 00:43:37 +0000 (UTC)
Date: Fri, 2 May 2025 00:43:28 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/4] riscv: dts: sophgo: Move all soc specific device
 into soc dtsi file
Message-ID: <20250502004328-GYA427222@gentoo>
References: <20250430012654.235830-1-inochiama@gmail.com>
 <20250430012654.235830-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250430012654.235830-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_174340_833867_5E30F179 
X-CRM114-Status: GOOD (  19.89  )
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

On 09:26 Wed 30 Apr     , Inochi Amaoto wrote:
> Although the cv1800b/cv1812h/sg2000/sg2002 share most peripherals,
> some basic peripherals, like clock, pinctrl, clint and plint, are
> not shared. These are caused by not only historical reason (plic,
> clint), but also the fact the device is not the same (clock, pinctrl).
> 
> It is good to override device compatible when the soc number is small,
                                                    ~~~SoC, we usually
> but now it is a burden for maintenance, and it is kind of annoyed to
> explain why using override. So it is time to move this out of the
> common peripheral header.
> 
> Move all soc related peripherla device from common peripheral header
                       ~~~~~~~~~~typo, peripheral
> to the soc specific header to get rid of most compatible override.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
otherwise, looks good

Reviewed-by: Yixun Lan <dlan@gentoo.org>

> ---
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 38 +++++++++++++++++--------
>  arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 38 +++++++++++++++++--------
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi  | 22 --------------
>  arch/riscv/boot/dts/sophgo/sg2002.dtsi  | 38 +++++++++++++++++--------
>  4 files changed, 78 insertions(+), 58 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> index aa1f5df100f0..fc9e6b56790f 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -15,23 +15,37 @@ memory@80000000 {
>  	};
>  
>  	soc {
> +		interrupt-parent = <&plic>;
> +		dma-noncoherent;
> +
>  		pinctrl: pinctrl@3001000 {
>  			compatible = "sophgo,cv1800b-pinctrl";
>  			reg = <0x03001000 0x1000>,
>  			      <0x05027000 0x1000>;
>  			reg-names = "sys", "rtc";
>  		};
> +
> +		clk: clock-controller@3002000 {
> +			compatible = "sophgo,cv1800-clk";
> +			reg = <0x03002000 0x1000>;
> +			clocks = <&osc>;
> +			#clock-cells = <1>;
> +		};
> +
> +		plic: interrupt-controller@70000000 {
> +			compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
> +			reg = <0x70000000 0x4000000>;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> +			interrupt-controller;
> +			#address-cells = <0>;
> +			#interrupt-cells = <2>;
> +			riscv,ndev = <101>;
> +		};
> +
> +		clint: timer@74000000 {
> +			compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
> +			reg = <0x74000000 0x10000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> +		};
>  	};
>  };
> -
> -&plic {
> -	compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
> -};
> -
> -&clint {
> -	compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
> -};
> -
> -&clk {
> -	compatible = "sophgo,cv1800-clk";
> -};
> diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> index 8a1b95c5116b..fcea4376fb79 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> @@ -17,23 +17,37 @@ memory@80000000 {
>  	};
>  
>  	soc {
> +		interrupt-parent = <&plic>;
> +		dma-noncoherent;
> +
>  		pinctrl: pinctrl@3001000 {
>  			compatible = "sophgo,cv1812h-pinctrl";
>  			reg = <0x03001000 0x1000>,
>  			      <0x05027000 0x1000>;
>  			reg-names = "sys", "rtc";
>  		};
> +
> +		clk: clock-controller@3002000 {
> +			compatible = "sophgo,cv1810-clk";
> +			reg = <0x03002000 0x1000>;
> +			clocks = <&osc>;
> +			#clock-cells = <1>;
> +		};
> +
> +		plic: interrupt-controller@70000000 {
> +			compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
> +			reg = <0x70000000 0x4000000>;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> +			interrupt-controller;
> +			#address-cells = <0>;
> +			#interrupt-cells = <2>;
> +			riscv,ndev = <101>;
> +		};
> +
> +		clint: timer@74000000 {
> +			compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
> +			reg = <0x74000000 0x10000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> +		};
>  	};
>  };
> -
> -&plic {
> -	compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
> -};
> -
> -&clint {
> -	compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
> -};
> -
> -&clk {
> -	compatible = "sophgo,cv1810-clk";
> -};
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> index c18822ec849f..805b694aa814 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -49,18 +49,10 @@ osc: oscillator {
>  
>  	soc {
>  		compatible = "simple-bus";
> -		interrupt-parent = <&plic>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> -		dma-noncoherent;
>  		ranges;
>  
> -		clk: clock-controller@3002000 {
> -			reg = <0x03002000 0x1000>;
> -			clocks = <&osc>;
> -			#clock-cells = <1>;
> -		};
> -
>  		gpio0: gpio@3020000 {
>  			compatible = "snps,dw-apb-gpio";
>  			reg = <0x3020000 0x1000>;
> @@ -344,19 +336,5 @@ dmac: dma-controller@4330000 {
>  			snps,data-width = <4>;
>  			status = "disabled";
>  		};
> -
> -		plic: interrupt-controller@70000000 {
> -			reg = <0x70000000 0x4000000>;
> -			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> -			interrupt-controller;
> -			#address-cells = <0>;
> -			#interrupt-cells = <2>;
> -			riscv,ndev = <101>;
> -		};
> -
> -		clint: timer@74000000 {
> -			reg = <0x74000000 0x10000>;
> -			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> -		};
>  	};
>  };
> diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
> index 7f79de33163c..df133831bd3e 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
> @@ -17,27 +17,41 @@ memory@80000000 {
>  	};
>  
>  	soc {
> +		interrupt-parent = <&plic>;
> +		dma-noncoherent;
> +
>  		pinctrl: pinctrl@3001000 {
>  			compatible = "sophgo,sg2002-pinctrl";
>  			reg = <0x03001000 0x1000>,
>  			      <0x05027000 0x1000>;
>  			reg-names = "sys", "rtc";
>  		};
> +
> +		clk: clock-controller@3002000 {
> +			compatible = "sophgo,sg2000-clk";
> +			reg = <0x03002000 0x1000>;
> +			clocks = <&osc>;
> +			#clock-cells = <1>;
> +		};
> +
> +		plic: interrupt-controller@70000000 {
> +			compatible = "sophgo,sg2002-plic", "thead,c900-plic";
> +			reg = <0x70000000 0x4000000>;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> +			interrupt-controller;
> +			#address-cells = <0>;
> +			#interrupt-cells = <2>;
> +			riscv,ndev = <101>;
> +		};
> +
> +		clint: timer@74000000 {
> +			compatible = "sophgo,sg2002-clint", "thead,c900-clint";
> +			reg = <0x74000000 0x10000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> +		};
>  	};
>  };
>  
> -&plic {
> -	compatible = "sophgo,sg2002-plic", "thead,c900-plic";
> -};
> -
> -&clint {
> -	compatible = "sophgo,sg2002-clint", "thead,c900-clint";
> -};
> -
> -&clk {
> -	compatible = "sophgo,sg2000-clk";
> -};
> -
>  &sdhci0 {
>  	compatible = "sophgo,sg2002-dwcmshc";
>  };
> -- 
> 2.49.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
