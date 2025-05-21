Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB17C54E71
	for <linux-riscv@archiver.kernel.org>; Wed, 21 May 2025 14:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x55suyvrwUlmv4aZv3tEbkG+ALbKE1FgJofMjRTM9LM=; b=RSSAfTq5Yr+p48
	ICHwxYi0I4AJ8HteQfxjXJNgPcKyVzcqcZRxA+H2BURcTm82AqN5mCDHQ+ssK6XrBweloSgkaixds
	tdX+HG1eOncMghmclOP5BgqSfulFTNhiS3mOZLI0W8zeW7VPMXjzm0pHOyV/aYVPAQ4sfI3oBnAnc
	gdcH1wPKJOFt0s3CcP3/iQnp0m4V2P9D9I7/AExQBAmYGAiCG8ympo3YVrncX/Z3Z3kqDAwUnvwfE
	azaxUOme7VQhgG+iH8tpt0n9LVvn3nem4dx3N6+YqAh9Fmx332Ni0rG7rwDgsr6zXIhee1uQXMyb0
	Ujkq+sWh9CRmcWkhpSTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkTy-0000000G7Il-2y5o;
	Wed, 21 May 2025 14:31:46 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkLX-0000000G5xR-3FHC
	for linux-riscv@lists.infradead.org;
	Wed, 21 May 2025 14:23:05 +0000
Received: from localhost (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15eccc893;
	Wed, 21 May 2025 22:22:48 +0800 (GMT+08:00)
Date: Wed, 21 May 2025 22:22:48 +0800
From: Ze Huang <huangze@whut.edu.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ze Huang <huangze@whut.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: add usb3.0 support for K1
Message-ID: <aC3huEM4f9qAfgAR@jean.localdomain>
References: <20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn>
 <20250518-b4-k1-dwc3-v3-v3-3-7609c8baa2a6@whut.edu.cn>
 <20250519-esoteric-pegasus-of-acumen-6ee8f8@kuoka>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250519-esoteric-pegasus-of-acumen-6ee8f8@kuoka>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGUlMVhpNQklOTEoeTBhCGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktISk5MT1VKS0tVSkJLS1
	kG
X-HM-Tid: 0a96f339b70803a1kunme43b676d164aa4
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTI6Ogw5HTE*Lh0pSiwNNksX
	F0wKCihVSlVKTE9MQ0hMSE1CS01JVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFPT0tKNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_072303_976625_9A8480FB 
X-CRM114-Status: GOOD (  18.41  )
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

On Mon, May 19, 2025 at 11:37:30AM +0200, Krzysztof Kozlowski wrote:
> On Sun, May 18, 2025 at 03:19:21AM GMT, Ze Huang wrote:
> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > index 61f5ca250ded0da7b91cd4bbd55a5574a89c6ab0..164244fdb49f5d50a8abadb7b7e478cccc828087 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > @@ -4,6 +4,8 @@
> >   */
> >  
> >  #include <dt-bindings/clock/spacemit,k1-syscon.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/phy/phy.h>
> >  
> >  /dts-v1/;
> >  / {
> > @@ -346,6 +348,15 @@ soc {
> >  		dma-noncoherent;
> >  		ranges;
> >  
> > +		mbus0: dram-controller@0 {
> 
> Missing compatible.
> 
> > +			reg = <0x0 0x00000000 0x0 0x80000000>;
> > +			reg-names = "dram";
> 
> Where are the bindings for this?
> 
> > +			#address-cells = <2>;
> > +			#size-cells = <2>;
> 
> Why are these needed?
> 

Will drop them

> > +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
> > +			#interconnect-cells = <0>;
> 
> No, you cannot just add any properties to any custom node. You need ABI
> for all this.
> 

Thanks for correcting, will create a binding for it.

> > +		};
> > +
> >  		syscon_rcpu: system-controller@c0880000 {
> >  			compatible = "spacemit,k1-syscon-rcpu";
> >  			reg = <0x0 0xc0880000 0x0 0x2048>;
> > @@ -358,6 +369,64 @@ syscon_rcpu2: system-controller@c0888000 {
> >  			#reset-cells = <1>;
> >  		};
> >  
> > +		usb_dwc3: usb@c0a00000 {
> > +			compatible = "spacemit,k1-dwc3";
> > +			reg = <0x0 0xc0a00000 0x0 0x10000>;
> > +			clocks = <&syscon_apmu CLK_USB30>;
> > +			clock-names = "usbdrd30";
> > +			resets = <&syscon_apmu RESET_USB3_0>;
> > +			interrupt-parent = <&plic>;
> > +			interrupts = <125>;
> > +			interconnects = <&mbus0>;
> > +			interconnect-names = "dma-mem";
> > +			phys = <&usbphy2>, <&combphy PHY_TYPE_USB3>;
> > +			phy-names = "usb2-phy", "usb3-phy";
> > +			dr_mode = "host";
> 
> This does not look like property of the soc.
> 

Will move `dr_mode` to board level

> > +			phy_type = "utmi";
> > +			snps,hsphy_interface = "utmi";
> > +			snps,dis_enblslpm_quirk;
> > +			snps,dis-u2-freeclk-exists-quirk;
> > +			snps,dis-del-phy-power-chg-quirk;
> > +			snps,dis_u2_susphy_quirk;
> > +			snps,dis_u3_susphy_quirk;
> > +			snps,dis_rxdet_inp3_quirk;
> > +			status = "disabled";
> > +		};
> > +
> > +		usbphy0: phy@c0940000 {
> > +			compatible = "spacemit,k1-usb2-phy";
> > +			reg = <0x0 0xc0940000 0x0 0x200>;
> > +			clocks = <&syscon_apmu CLK_USB_AXI>;
> > +			#phy-cells = <0>;
> > +			status = "disabled";
> 
> What is missing here? Why is this node disabled?
> 

There're three USB controllers on K1 [1]:
- A USB2.0 OTG
- A USB2.0 Host Only
- A USB3.0 with a USB2.0 DRD interface

usbphy0 is for USB2.0 OTG, and ushphy1 is for USB2.0 Host Only.
They're not supported yet.

Link: https://developer.spacemit.com/documentation?token=AjHDwrW78igAAEkiHracBI9HnTb#part5 [1]

> Best regards,
> Krzysztof
> 
> 
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
