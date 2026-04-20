Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4215AF588C6
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 13:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=58sc3GkqU2g09HYRJTgVluCwlYYhhrAGqKQ7O9u++os=; b=HnbH2GA839dEPH
	16sHdzQ6Nuh+hvmLuh14makHN+d7Zr8MY+gmcONd2fxV96DJWSH4l7Pv9LXdfH4kjUJ8zHs0TBd1T
	MdlemW0li6+82OWybCQuWojh99zKpJIFbb+TeBAdSJn2TmvSGMRaHx2oW2pfYXkz+jW6Gq421d64w
	+yfGPSSs/qQxrKSq/gSA2sd1Wj2DnrnJI+HPOiSfGlz86MWcKwz7vmcgMbc5V3Q+Hys2jdqXeGt1/
	1QEU0EdKAbPVY+S/u08d+y5X8ngZYJaMURrnHtcKDldEjVUZPWEeW24H/yg4exoDVvHE+0wirSnLS
	97Cbrznpo0T8BHPfWePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoq7-000000074z0-3PWp;
	Mon, 20 Apr 2026 13:39:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoq5-000000074xm-1U9M
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 13:39:02 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 23E0A265D;
	Mon, 20 Apr 2026 15:37:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776692241;
	bh=5mpwfZ7VItgM2yDj3SO4obOLgSGpgHLLJIOm0hxkpWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oGOpkKXxt1Ib62bGhycNsppZ51AZIc44RmmLWuEr1Qt5y1f8kse8gNyOPgsSd4Fqo
	 jBuOCRY9PA3+VRmS+/gpN6VHpS9PEfz110y7h6brQP/5kPEMcnXRPTaZ+0kMhxWDK7
	 X2R/eBOWLHN0+R2oGBXbULr36BI1U0OpIURIburQ=
Date: Mon, 20 Apr 2026 16:38:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110: Drop CAMSS node
Message-ID: <20260420133856.GA2305989@killaraus.ideasonboard.com>
References: <20260420-starfive_camss_use-v1-1-ec326af71ca7@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260420-starfive_camss_use-v1-1-ec326af71ca7@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_063901_533643_6C5FF496 
X-CRM114-Status: GOOD (  18.73  )
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

Hi Jai,

Thank you for the patch.

On Mon, Apr 20, 2026 at 06:48:07PM +0530, Jai Luthra wrote:
> The starfive-camss driver and bindings were dropped, as they were no
> longer being worked upon for destaging.
> 
> Drop the relevant node as well to avoid the following build warning:
> "failed to match any schema with compatible: ['starfive,jh7110-camss']"
> 
> Fixes: 644673fc8fb04 ("media: dt-bindings: Drop starfive,jh7110-camss from staging")
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes: https://lore.kernel.org/all/20260420-very-cartel-645595ffd1c7@spud/
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Assuming you've run the DT checks,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Ideally this patch should have gone in the original series, before the
> one that dropped the bindings which is now merged in mainline.
> 
> I've added a Fixes tag so it gets picked in the RC cycles for 7.1.
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 27 +-----------------------
>  arch/riscv/boot/dts/starfive/jh7110.dtsi        | 28 -------------------------
>  2 files changed, 1 insertion(+), 54 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 8cfe8033305d80cbe6179ed26601ca057ee00f16..a7a1c09a2c9075711f3a214a49618911fdc7b421 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -135,29 +135,6 @@ &tdm_ext {
>  	clock-frequency = <49152000>;
>  };
>  
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
> -	};
> -};
> -
>  &csi2rx {
>  	assigned-clocks = <&ispcrg JH7110_ISPCLK_VIN_SYS>;
>  	assigned-clock-rates = <297000000>;
> @@ -175,9 +152,7 @@ port@0 {
>  		port@1 {
>  			reg = <1>;
>  
> -			csi2rx_to_camss: endpoint {
> -				remote-endpoint = <&camss_from_csi2rx>;
> -			};
> +			/* remote CAMSS endpoint */
>  		};
>  	};
>  };
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 6e56e9d20bb064e86b57a92d4cb05be330cca01a..9c3e4598747eb5541effe697044484715569a285 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -1199,34 +1199,6 @@ csi_phy: phy@19820000 {
>  			#phy-cells = <0>;
>  		};
>  
> -		camss: isp@19840000 {
> -			compatible = "starfive,jh7110-camss";
> -			reg = <0x0 0x19840000 0x0 0x10000>,
> -			      <0x0 0x19870000 0x0 0x30000>;
> -			reg-names = "syscon", "isp";
> -			clocks = <&ispcrg JH7110_ISPCLK_DOM4_APB_FUNC>,
> -				 <&ispcrg JH7110_ISPCLK_ISPV2_TOP_WRAPPER_C>,
> -				 <&ispcrg JH7110_ISPCLK_DVP_INV>,
> -				 <&ispcrg JH7110_ISPCLK_VIN_P_AXI_WR>,
> -				 <&ispcrg JH7110_ISPCLK_MIPI_RX0_PXL>,
> -				 <&syscrg JH7110_SYSCLK_ISP_TOP_CORE>,
> -				 <&syscrg JH7110_SYSCLK_ISP_TOP_AXI>;
> -			clock-names = "apb_func", "wrapper_clk_c", "dvp_inv",
> -				      "axiwr", "mipi_rx0_pxl", "ispcore_2x",
> -				      "isp_axi";
> -			resets = <&ispcrg JH7110_ISPRST_ISPV2_TOP_WRAPPER_P>,
> -				 <&ispcrg JH7110_ISPRST_ISPV2_TOP_WRAPPER_C>,
> -				 <&ispcrg JH7110_ISPRST_VIN_P_AXI_RD>,
> -				 <&ispcrg JH7110_ISPRST_VIN_P_AXI_WR>,
> -				 <&syscrg JH7110_SYSRST_ISP_TOP>,
> -				 <&syscrg JH7110_SYSRST_ISP_TOP_AXI>;
> -			reset-names = "wrapper_p", "wrapper_c", "axird",
> -				      "axiwr", "isp_top_n", "isp_top_axi";
> -			power-domains = <&pwrc JH7110_PD_ISP>;
> -			interrupts = <92>, <87>, <90>, <88>;
> -			status = "disabled";
> -		};
> -
>  		voutcrg: clock-controller@295c0000 {
>  			compatible = "starfive,jh7110-voutcrg";
>  			reg = <0x0 0x295c0000 0x0 0x10000>;
> 
> ---
> base-commit: c1f49dea2b8f335813d3b348fd39117fb8efb428
> change-id: 20260420-starfive_camss_use-7a229c330e71

-- 
Regards,

Laurent Pinchart

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
