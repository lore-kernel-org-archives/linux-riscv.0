Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A49C282C1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 04:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZ5AibqG8a5kD/ALxj2MP7E8YIQt/JGYG+H5NGJHp3Y=; b=yf7iDhrrybTMs4
	0Bmib5ttnJNgi07aT1KuOXpBKozye/+QKP8I3dVQWI5qPgMAWJEU4HFY7ft0Rwy7il/+3M6eHHEoF
	ySCnrOCVfdFBOionQhOcq7yyDsg/kOD5A1ofmSzAVK4PRHwwJRpmgIx2bNtiMSnaXzIU/GFNQAu1k
	jUoqMMRlDuBvymEkdKIeOsUmv1cJbpcSu/OrGl83jdK/Lm+sFRfaL/PMpghIdzs/P4jqoEH4D490k
	AEVAC8lw/PNW87ex5/mIGrFxtaroJD9aCUc/TLoSZjT3FHmYqvqLb63AkfSvdsOv85tm5+COF8Fq7
	V87KMCKWSBGPfwCvRnhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrfq-00000009gOs-2xHx;
	Fri, 28 Feb 2025 04:08:30 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrT6-00000009fDH-3pYp
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 03:55:22 +0000
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2E481342F9A;
	Fri, 28 Feb 2025 03:55:16 +0000 (UTC)
Date: Fri, 28 Feb 2025 03:55:07 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: Re: [PATCH] riscv: dts: sophgo: sg2042: Add spi devices
Message-ID: <20250228035507-GYA52348@gentoo>
References: <20250228-sfg-spi-v1-1-b989aed94911@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250228-sfg-spi-v1-1-b989aed94911@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_195520_984303_11E402DD 
X-CRM114-Status: GOOD (  14.07  )
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

Hi Zixian:

On 10:47 Fri 28 Feb     , Zixian Zeng wrote:
> Add spi devices for the sg2042 soc.
> 
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> index 0fca16c469cc95aa897b6b57e0a287a687b4d251..d413daa47cf081f23284851db1eeceb3a157e9c0 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> @@ -800,5 +800,35 @@ flash@0 {
>  				compatible = "jedec,spi-nor";
>  			};
>  		};
> +
> +		spi0: spi@7040004000 {
> +			compatible = "snps,dw-apb-ssi";
> +			#address-cells = <0x01>;
> +			#size-cells = <0x00>;
> +			reg = <0x70 0x40004000 0x00 0x1000>;
for consistency, I'd suggest moving 'reg' info above '#address-cells'

> +			interrupt-parent = <&intc>;
> +			interrupts = <110 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clkgen GATE_CLK_APB_SPI>,
> +					<&clkgen GATE_CLK_SYSDMA_AXI>;
> +			clock-frequency = <250000000>;
ditto, move clock above interrupt

> +			resets = <&rstgen RST_SPI0>;
> +			num-cs = <0x02>;
> +			status = "okay";
in dtsi file, please make status disabled by default, then enable it at board file

> +		};
> +
> +		spi1: spi@7040005000 {
> +			compatible = "snps,dw-apb-ssi";
> +			#address-cells = <0x01>;
> +			#size-cells = <0x00>;
> +			reg = <0x70 0x40005000 0x00 0x1000>;
> +			interrupt-parent = <&intc>;
> +			interrupts = <111 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clkgen GATE_CLK_APB_SPI>,
> +					<&clkgen GATE_CLK_SYSDMA_AXI>;
> +			clock-frequency = <250000000>;
> +			resets = <&rstgen RST_SPI1>;
> +			num-cs = <0x02>;
> +			status = "okay";
> +		};
>  	};
>  };
> 
> ---
> base-commit: 9ef5d3235d41a6f5230d3ddf5eb994483853b3e8
> change-id: 20250228-sfg-spi-e3f2aeca09ab
> 
> Best regards,
> -- 
> Zixian Zeng <sycamoremoon376@gmail.com>
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
