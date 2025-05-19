Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E3BC54756
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 09:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dXW0bHOMKcRqZsyB32YMnW147l1vR/4yaeOj5MvcZKo=; b=CEz+tHOxiY31c2
	5ffN/IRa/OT9xcw2yoddW8fQQQ6ro+gRqwWe4jDO97aU6ofTYy6ANCPCIkMtmQu6J9iSna0zECjTd
	Q16UL58VdF3/QOZ3hQtxx21CSbodrpRoUOzvgSKwh4NKVkHeJNmTo8gqisayKIzueecU9MwrFtLtC
	aLNnBgEIO+Pk7FM3NvrqoHierSRiSKnquBka67jtOXGrqrYgO7X/RsXerAaByI1aYCNVk0AYZyCL8
	9dq14+EeiUHeXQ6u2fQd7PElT9DO2rwaglVG7bav5GfTDo/bKvWlJaBQtgMOMEX2+H/3aKIfTlcT8
	QJz/LdJ6H8efBybvYHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxEQ-00000008grq-1Qr6;
	Mon, 19 May 2025 09:56:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwwA-00000008bUS-0MaR
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 09:37:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20396614C0;
	Mon, 19 May 2025 09:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14024C4CEE4;
	Mon, 19 May 2025 09:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747647452;
	bh=KK0Hhs+WBueOymdkeSk3Ewwoz2Qmj7koc8wdTHn/t40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uXSw8Ylnp3l4YbRv7jpAv1NfkXlFy7MFhirzfqpAMaqYV7a2DxaMrS7OIwIFMTj1t
	 yYn97NZ7ffZe4XxtDOPIOt4XgRMNEDUqFxkbL9aeGkOsurI6qWL4GrEACo7tqDe4aE
	 kQItnB6USHC0bFRe47ArDgyIG/k6fPR00L7t8j91BT62pMUlV9cP+4JAlQX3L8QAIl
	 BKopGiWdhVrBTQtKRSj3Xw04Qm+pnhmAbBWZ2cXNux4HswAnJHr2h4aypkL+AzPwq2
	 u0wtigdeyuNNkzDo3rXLCo04vr9Y8HDlGUIASg3AwFq6TQKVjBBkOAZMUaKTTkFJLe
	 xtTu0mhNDiEwg==
Date: Mon, 19 May 2025 11:37:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: add usb3.0 support for K1
Message-ID: <20250519-esoteric-pegasus-of-acumen-6ee8f8@kuoka>
References: <20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn>
 <20250518-b4-k1-dwc3-v3-v3-3-7609c8baa2a6@whut.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250518-b4-k1-dwc3-v3-v3-3-7609c8baa2a6@whut.edu.cn>
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

On Sun, May 18, 2025 at 03:19:21AM GMT, Ze Huang wrote:
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 61f5ca250ded0da7b91cd4bbd55a5574a89c6ab0..164244fdb49f5d50a8abadb7b7e478cccc828087 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -4,6 +4,8 @@
>   */
>  
>  #include <dt-bindings/clock/spacemit,k1-syscon.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/phy/phy.h>
>  
>  /dts-v1/;
>  / {
> @@ -346,6 +348,15 @@ soc {
>  		dma-noncoherent;
>  		ranges;
>  
> +		mbus0: dram-controller@0 {

Missing compatible.

> +			reg = <0x0 0x00000000 0x0 0x80000000>;
> +			reg-names = "dram";

Where are the bindings for this?

> +			#address-cells = <2>;
> +			#size-cells = <2>;

Why are these needed?

> +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
> +			#interconnect-cells = <0>;

No, you cannot just add any properties to any custom node. You need ABI
for all this.

> +		};
> +
>  		syscon_rcpu: system-controller@c0880000 {
>  			compatible = "spacemit,k1-syscon-rcpu";
>  			reg = <0x0 0xc0880000 0x0 0x2048>;
> @@ -358,6 +369,64 @@ syscon_rcpu2: system-controller@c0888000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		usb_dwc3: usb@c0a00000 {
> +			compatible = "spacemit,k1-dwc3";
> +			reg = <0x0 0xc0a00000 0x0 0x10000>;
> +			clocks = <&syscon_apmu CLK_USB30>;
> +			clock-names = "usbdrd30";
> +			resets = <&syscon_apmu RESET_USB3_0>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <125>;
> +			interconnects = <&mbus0>;
> +			interconnect-names = "dma-mem";
> +			phys = <&usbphy2>, <&combphy PHY_TYPE_USB3>;
> +			phy-names = "usb2-phy", "usb3-phy";
> +			dr_mode = "host";

This does not look like property of the soc.

> +			phy_type = "utmi";
> +			snps,hsphy_interface = "utmi";
> +			snps,dis_enblslpm_quirk;
> +			snps,dis-u2-freeclk-exists-quirk;
> +			snps,dis-del-phy-power-chg-quirk;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			snps,dis_rxdet_inp3_quirk;
> +			status = "disabled";
> +		};
> +
> +		usbphy0: phy@c0940000 {
> +			compatible = "spacemit,k1-usb2-phy";
> +			reg = <0x0 0xc0940000 0x0 0x200>;
> +			clocks = <&syscon_apmu CLK_USB_AXI>;
> +			#phy-cells = <0>;
> +			status = "disabled";

What is missing here? Why is this node disabled?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
