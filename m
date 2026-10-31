Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B160A606A31D
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 18:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ImeaCCY+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=G25HnGaD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QUTtfCMDOIjbkJppj7Qy7mu6BL3IyFtyc7wm5UlcVXM=; b=ImeaCCY+YVh3m1loeCDW0bcqTt
	UPFFfiILXeG65KqxN0gVH5jRLmE9nUCD4Lw586W5SRXsdLxBZECx1B58LwjgpChds1CwegmgKzElN
	nyZDD5zPXguOOYZGMIn7Kt2lkYhr0wYTHHf/QjL2VkjlwKoFN5nmLAmVwuqIl7rQGmYAkuyadUn/c
	9k1OCiQ509ZOvEXykWDf7S9hLYLoJz5g67BpB/0hAmP7/Jd+4ovQXhYGgn8y4ZBPwo4F73B/tQYZP
	MzFS4BU4oac8xHyiy1fhcBWAiX012lh7fYGMALT1KLh5+9XvwprPJAJVzKK/ZlVpHOod5wdyjF6Ml
	UQS0k8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNDfj-0000000DYev-13J0;
	Sat, 31 Oct 2026 18:19:19 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNDfg-0000000DYeX-2NOe
	for linux-riscv@lists.infradead.org;
	Sat, 31 Oct 2026 18:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=wXvKtxMScM3vklVT7dsWI8q+OIPz4wEMOfjmV3tlROo=; b=G25HnGaDkc1RgIW91lVD6GGCn7
	ujfzrPuOEazvc9Ofi9P8wnL97LyD0rSL6DBLcNFoQF57HBxyLfbBLHo+JoWJJCqgXtqe0Ng75yZRy
	CHdsGq9Uu5UAr1avEaMd2utnyJ/Vy9WVZnENmGrny5ozCa82wVAhbWOsLxaYfKqvoFFUQx0raHLrg
	01tmJs9J0g7B4M7b2UBzDsL1NNjZ5v/4v3+tA7IG6cYpgIQ1xYhHRSda25icsS05cWlnKjOimDC2E
	Kui1OWenvFiRlVVjeSmq+iL/RrtyeazdmNXRrRaoNpoA1J+AaDtnSiiyNPU4IgOb/FlKJmZrWQ0Jt
	hjoXbK6Q==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xNDfU-00000009eFe-1DoC;
	Sat, 31 Oct 2026 19:19:04 +0100
Date: Sat, 31 Oct 2026 19:19:01 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3: add USB3 port A (DRD) nodes
Message-ID: <auYxFRtKWbGAlRTL@aurel32.net>
Mail-Followup-To: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>,
	Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-kernel@vger.kernel.org
References: <20261030094024.3226356-1-chunyan.zhang@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261030094024.3226356-1-chunyan.zhang@linux.spacemit.com>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_111916_633274_9A980DFD 
X-CRM114-Status: GOOD (  18.96  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 2026-10-30 17:40, Chunyan Zhang wrote:
> Describe the DWC3 controller and its USB 2.0 PHY for USB3 port A
> of the K3 SoC.
> 
> Only the U2 lane is described: Port A's SuperSpeed PHY has no driver
> yet, so the port runs at high-speed (maximum-speed = "high-speed").
> 
> Enable USB3 port A with dr_mode = "peripheral", so it can be used as
> a USB device.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  9 ++++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 30 ++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index b084a35aa00e..74d4fdf9e405 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -323,6 +323,15 @@ &usb2_phy {
>  	status = "okay";
>  };
>  
> +&usb3a_u2phy {
> +	status = "okay";
> +};
> +
> +&usb3a {
> +	dr_mode = "peripheral";
> +	status = "okay";
> +};
> +
>  &usb3d_u2phy {
>  	status = "okay";
>  };
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index c3f2dce0969c..220dfe29bb78 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -630,6 +630,36 @@ gmac2_axi_setup: stmmac-axi-config {
>  			};
>  		};
>  
> +		usb3a: usb@cad00000 {

Please move this after the eth2 node, so that the node addresses are 
kept sorted.

> +			compatible = "spacemit,k3-dwc3";
> +			reg = <0x0 0xcad00000 0x0 0x10000>;
> +			interrupts = <118 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent = <&saplic>;
> +			clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
> +			clock-names = "usbdrd30";
> +			resets = <&syscon_apmu RESET_APMU_USB3_A_AHB>,
> +				 <&syscon_apmu RESET_APMU_USB3_A_VCC>,
> +				 <&syscon_apmu RESET_APMU_USB3_A_PHY>;
> +			reset-names = "ahb", "vcc", "phy";
> +			phys = <&usb3a_u2phy>;
> +			phy-names = "usb2-phy";

Please move the PHYs definition to the board level, matching was it is 
done for the other USB3 ports, as other boards might have different PHY 
configuration.

> +			phy_type = "utmi";
> +			snps,dis_enblslpm_quirk;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis-del-phy-power-chg-quirk;
> +			snps,dis-tx-ipgap-linecheck-quirk;
> +			maximum-speed = "high-speed";

I think the maximum-speed property should also be moved to the board 
level, as its value depends on the PHYs configuration.

> +			status = "disabled";
> +		};

Any reason not to define the snps,parkmode-disable-ss-quirk property? It 
is defined for the other USB3 ports, as well as for the USB3 A port in 
the vendor kernel

> +
> +		usb3a_u2phy: phy@cad20000 {
> +			compatible = "spacemit,k3-usb2-phy";
> +			reg = <0x0 0xcad20000 0x0 0x200>;
> +			clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		pdma: dma-controller@d4000000 {
>  			compatible = "spacemit,k3-pdma";
>  			reg = <0x0 0xd4000000 0x0 0x4000>;

Otherwise looks good.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
