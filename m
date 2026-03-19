Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02B91088E70
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 04:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IrosUMtZ+kUNI9dPqDmUV2Y122GoIAXnIDKOm2Zbut0=; b=4v+SJgINVbODfb
	32MgrqHJZ9ewXuxk/UG/eOir0gwzT+5zQcjCWg5+0trdS6g9wcmzJ+jJzsd9UoB+45v/vRMJnkcdB
	bfqplHN86XyR4+FSnu7FF2b+uOM2eJzuatzELIOCwxG6nykNCGTzNsBlOIQqefp7F20pXVrJnoWQk
	57lcKWp5wfl6PexenxZgwQT8JIS+SQNwKsofCzo38qR8iOQAI+qSNGgnMznjsbfZczDcodnCtBg0h
	pBM6+iY5nKtB18fV6CPIJ+PSLlYUORlSUhSnFHJ6fGa836SLnT+AZqqdC8a/opA4bLZtHmeIQIFbz
	NFiuI39e6QPYmNlzGCaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34Zr-00000009sAm-2o7R;
	Thu, 19 Mar 2026 04:01:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34Zp-00000009sAZ-3T6j
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 04:01:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3ED46011F;
	Thu, 19 Mar 2026 04:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D46C19425;
	Thu, 19 Mar 2026 04:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773892900;
	bh=cqnRxuUoj77h+g56oMH45SceAVbIRUHI0ZJ0eFYIqmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cJt1BQUg6eH7gat6EK2Kaj1qoBH0DhLGKczphglhTiSaxrcHflewnn60yRbXrxSuw
	 ZeTCjTmSL7vZO2Zoh1BPCS9Ku979eHwT56fcskealop7XzuYawQ2h5IwSEKMA0j1sS
	 dUFPhjdMKGM8O+cCbvaAO5UO5W8x/qYLU/QfkfV/fQaCHilTEWBB0tguN49FxPfOMd
	 IqE19TbLoYN9H28KR+HnfzTGj8+6ETGMLYaO23OyY/UBdbFpC3OY7X+UcwKJIli5Vp
	 9NJeTr8d3mWY7eOlQqCcObWa0jTICesh+jV3XWnhFVGoZZeVbcanIcuyP7uFwvEj3h
	 9tBrfkkJom+QQ==
Date: Thu, 19 Mar 2026 12:01:38 +0800
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: reorder phy nodes for K1
Message-ID: <20260319040138-GKA497893@kernel.org>
References: <20260318100000.3934516-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260318100000.3934516-1-amadeus@jmu.edu.cn>
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

Hi Chukun, 

On 18:00 Wed 18 Mar     , Chukun Pan wrote:
> Reorder the PHY nodes of USB and PCIe to the correct positions based on
> the register address. This improves the readability and maintainability
> of the DT. No functional change is introduced by this reordering.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 108 +++++++++++++--------------
>  1 file changed, 54 insertions(+), 54 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index d2015201f8e5..f0bad6855c97 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -359,6 +359,60 @@ syscon_rcpu2: system-controller@c0888000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		usbphy2: phy@c0a30000 {
> +			compatible = "spacemit,k1-usb2-phy";
> +			reg = <0x0 0xc0a30000 0x0 0x200>;
> +			clocks = <&syscon_apmu CLK_USB30>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		combo_phy: phy@c0b10000 {
> +			compatible = "spacemit,k1-combo-phy";
> +			reg = <0x0 0xc0b10000 0x0 0x1000>;
> +			clocks = <&vctcxo_24m>,
> +				 <&syscon_apmu CLK_PCIE0_DBI>,
> +				 <&syscon_apmu CLK_PCIE0_MASTER>,
> +				 <&syscon_apmu CLK_PCIE0_SLAVE>;
> +			clock-names = "refclk",
> +				      "dbi",
> +				      "mstr",
> +				      "slv";
> +			resets = <&syscon_apmu RESET_PCIE0_GLOBAL>,
> +				 <&syscon_apmu RESET_PCIE0_DBI>,
> +				 <&syscon_apmu RESET_PCIE0_MASTER>,
> +				 <&syscon_apmu RESET_PCIE0_SLAVE>;
> +			reset-names = "phy",
> +				      "dbi",
> +				      "mstr",
> +				      "slv";
> +			#phy-cells = <1>;
> +			spacemit,apmu = <&syscon_apmu>;
> +			status = "disabled";
> +		};
> +
> +		pcie1_phy: phy@c0c10000 {
> +			compatible = "spacemit,k1-pcie-phy";
> +			reg = <0x0 0xc0c10000 0x0 0x1000>;
> +			clocks = <&vctcxo_24m>;
> +			clock-names = "refclk";
> +			resets = <&syscon_apmu RESET_PCIE1_GLOBAL>;
> +			reset-names = "phy";
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		pcie2_phy: phy@c0d10000 {
> +			compatible = "spacemit,k1-pcie-phy";
> +			reg = <0x0 0xc0d10000 0x0 0x1000>;
> +			clocks = <&vctcxo_24m>;
> +			clock-names = "refclk";
> +			resets = <&syscon_apmu RESET_PCIE2_GLOBAL>;
> +			reset-names = "phy";
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		i2c0: i2c@d4010800 {
>  			compatible = "spacemit,k1-i2c";
>  			reg = <0x0 0xd4010800 0x0 0x38>;
> @@ -429,60 +483,6 @@ i2c5: i2c@d4013800 {
>  			status = "disabled";
>  		};
>  
> -		usbphy2: phy@c0a30000 {
> -			compatible = "spacemit,k1-usb2-phy";
> -			reg = <0x0 0xc0a30000 0x0 0x200>;
> -			clocks = <&syscon_apmu CLK_USB30>;
> -			#phy-cells = <0>;
> -			status = "disabled";
> -		};
> -
> -		combo_phy: phy@c0b10000 {
> -			compatible = "spacemit,k1-combo-phy";
> -			reg = <0x0 0xc0b10000 0x0 0x1000>;
> -			clocks = <&vctcxo_24m>,
> -				 <&syscon_apmu CLK_PCIE0_DBI>,
> -				 <&syscon_apmu CLK_PCIE0_MASTER>,
> -				 <&syscon_apmu CLK_PCIE0_SLAVE>;
> -			clock-names = "refclk",
> -				      "dbi",
> -				      "mstr",
> -				      "slv";
> -			resets = <&syscon_apmu RESET_PCIE0_GLOBAL>,
> -				 <&syscon_apmu RESET_PCIE0_DBI>,
> -				 <&syscon_apmu RESET_PCIE0_MASTER>,
> -				 <&syscon_apmu RESET_PCIE0_SLAVE>;
> -			reset-names = "phy",
> -				      "dbi",
> -				      "mstr",
> -				      "slv";
> -			#phy-cells = <1>;
> -			spacemit,apmu = <&syscon_apmu>;
> -			status = "disabled";
> -		};
> -
> -		pcie1_phy: phy@c0c10000 {
> -			compatible = "spacemit,k1-pcie-phy";
> -			reg = <0x0 0xc0c10000 0x0 0x1000>;
> -			clocks = <&vctcxo_24m>;
> -			clock-names = "refclk";
> -			resets = <&syscon_apmu RESET_PCIE1_GLOBAL>;
> -			reset-names = "phy";
> -			#phy-cells = <0>;
> -			status = "disabled";
> -		};
> -
> -		pcie2_phy: phy@c0d10000 {
> -			compatible = "spacemit,k1-pcie-phy";
> -			reg = <0x0 0xc0d10000 0x0 0x1000>;
> -			clocks = <&vctcxo_24m>;
> -			clock-names = "refclk";
> -			resets = <&syscon_apmu RESET_PCIE2_GLOBAL>;
> -			reset-names = "phy";
> -			#phy-cells = <0>;
> -			status = "disabled";
> -		};
> -
>  		syscon_apbc: system-controller@d4015000 {
>  			compatible = "spacemit,k1-syscon-apbc";
>  			reg = <0x0 0xd4015000 0x0 0x1000>;
> -- 
> 2.34.1
> 
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
