Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8466EC4450A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 21:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rvWJYTGGEregyG+w4/aZUS0obmxVvqqMuH6BQKtrlE4=; b=wtcEnqMTYJL0Qm
	YsZgU9ehUZRt1qnClRGfAWqxlFC3F84CC3RNgko8IoAG/RIRaBMtNzWEGPbqS8w3ekl0+QKSHK+VR
	QgaR/5JM4Ss2WAyMHNdhL5OYzeOJHq+B5c1+dbVCNMFDZVZ6q+GhNS1tKnPueHwUOfMgi1q9NJGo5
	uXxuUEMj8S/YYJwHIuJptXu25e0NjDfiHv6PhEi+IV35AOXC3bxtQg8dquxcnXDNqfC9LHcwH9Mlu
	PZOKJcnjBZaTiM3+iPqK1V6t+JGhbMMyLIktJBVeL5EJriAMY+ACiOIYM4gtpBzdjoPRRQrNu8tEm
	bhTebQQPUh4PXfmMc0tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTfp-00000000cVn-1kWD;
	Thu, 16 Jul 2026 21:31:17 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTfm-00000000cV8-2Uon
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 21:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=DLyqifiJvUqD1TFfODwLCmx07fkJuJfKQGsBLX8IZRc=; b=UsM5lhk1eT8JUMCjFx1ZaIBmgB
	M6oE6oAh/Yy8sqcqe3bBv9cM5wxp467kplWvF3DMnnfx34SQI8YkdNplUtaizM/DKzivX0mWlCZ9E
	GBH158jtsuJZB8koFIxIeSNI5PeJyPwkZDj1sN2EsXgWfmd1Ptag+2qhuEnpZFZvUHPc34IMcGfzN
	qk3HvL3tb3UGibM/2fpu1Or71ggpOUHnKYyxfJtmw2iF8BdemAxoAXn5cZmO0SbII0ZfnCG+8NEnr
	aeY5vzUmGou1lBrEZ6gONWBgmI0sLlFYcAbPhZ3lqpdjg9099za+asd76i5+6ENUpj44B+aNi8h5v
	hkW5RKdQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wkTfj-00000003GSb-2MgD;
	Thu, 16 Jul 2026 23:31:11 +0200
Date: Thu, 16 Jul 2026 23:31:10 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: k3: add USB controller and USB
 phy support
Message-ID: <allNnol5HttviAan@aurel32.net>
Mail-Followup-To: Inochi Amaoto <inochiama@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
References: <20260709040415.977784-1-inochiama@gmail.com>
 <20260709040415.977784-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260709040415.977784-2-inochiama@gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_143114_634669_643A0ABA 
X-CRM114-Status: GOOD (  14.64  )
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

On 2026-07-09 12:04, Inochi Amaoto wrote:
> Add all USB device node to the Spacemit K3.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 13 ++++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 42 ++++++++++++++++++++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index b89c1521e664..2a6d35a64d5c 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -182,6 +182,11 @@ dldo7: dldo7 {
>  	};
>  };
>  
> +&combophy {
> +	spacemit,apmu = <&syscon_apmu 0x11>;
> +	status = "okay";
> +};
> +
>  &eth0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&gmac0_rgmii_0_cfg>, <&gmac0_phy_0_cfg>;
> @@ -221,3 +226,11 @@ hub@1 {
>  &usb2_phy {
>  	status = "okay";
>  };
> +
> +&usb3d_u2phy {
> +	status = "okay";
> +};
> +
> +&usb3d {
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index 19fc9b49668e..82c9e2da82e9 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/clock/spacemit,k3-clocks.h>
>  #include <dt-bindings/reset/spacemit,k3-resets.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/phy/phy.h>
>  
>  /dts-v1/;
>  
> @@ -438,6 +439,47 @@ soc: soc {
>  		dma-noncoherent;
>  		ranges;
>  
> +		usb3d: usb@81a00000 {
> +			compatible = "spacemit,k3-dwc3";
> +			reg = <0x0 0x81a00000 0x0 0x10000>;
> +			interrupts = <149 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent = <&saplic>;
> +			clocks = <&syscon_apmu CLK_APMU_USB3_PORTD_BUS>;
> +			clock-names = "usbdrd30";
> +			resets = <&syscon_apmu RESET_APMU_USB3_D_AHB>,
> +				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
> +				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
> +			reset-names = "ahb", "vcc", "phy";
> +			phys = <&usb3d_u2phy>,
> +			       <&combophy 4 PHY_TYPE_USB3>;
> +			phy-names = "usb2-phy", "usb3-phy";
> +			phy_type = "utmi";
> +			snps,dis_enblslpm_quirk;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			snps,dis-del-phy-power-chg-quirk;
> +			snps,dis-tx-ipgap-linecheck-quirk;
> +			snps,parkmode-disable-ss-quirk;
> +			dr_mode = "host";
> +			status = "disabled";
> +		};
> +
> +		usb3d_u2phy: phy@81b00000 {
> +			compatible = "spacemit,k3-usb2-phy";
> +			reg = <0x0 0x81b00000 0x0 0x200>;
> +			clocks = <&syscon_apmu CLK_APMU_USB2_BUS>;

This should be CLK_APMU_USB3_PORTD_BUS.

I am also not sure you want to declare the USB3 PHY in k3.dtsi. I think
it should be defined at the board level, as other boards than the k3 
Pico ITX might decide to keep this controller as USB 2 only and use the 
combo PHY for PCIe.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
