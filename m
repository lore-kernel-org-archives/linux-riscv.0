Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1330EC54754
	for <linux-riscv@archiver.kernel.org>; Tue, 20 May 2025 02:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJFaak6Bd0R7cSeTS6SWojUB6cD2lsmBZv1iPOrceUg=; b=42lAEjz48PFUrW
	CS8hf9mKxtjrgCtumAUstY4lxZ9Nt9vm+FoJDRCfrhDwEAj/pYA3oD2zt9PTmHUWJ9cYwqzfGaFId
	490ejOk7LPSO7TT8c933bsCi6A47trxiW99D68l6ZYgirJbyw+5wWiS3g8FNHCHsDir7Pw8pXdQvt
	2c7Yn0Z7Xyn5mPNFKR560cqM5a2m0WQVmEkFaOJvxrV8qRib5aTurGCzsd5tTkFOSWYteQLP0KYTK
	c/suE0p1zedBjzgLwo+UCGJGG8fUED2CIwjFfC3qi06BQpi1QYu7adisBr98i6ojMa8JCYby21QPQ
	5FOvRVxWNEKvXGPPzrog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHD2o-0000000BMuF-1V2f;
	Tue, 20 May 2025 02:49:30 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHD0g-0000000BMXH-36SG
	for linux-riscv@lists.infradead.org;
	Tue, 20 May 2025 02:47:20 +0000
Received: from localhost (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15a4db399;
	Tue, 20 May 2025 10:47:14 +0800 (GMT+08:00)
Date: Tue, 20 May 2025 10:47:14 +0800
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
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
Message-ID: <aCvtMu9gNxKoTXWo@jean.localdomain>
References: <20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn>
 <20250518-b4-k1-dwc3-v3-v3-1-7609c8baa2a6@whut.edu.cn>
 <20250519-busy-expert-buffalo-2c01ea@kuoka>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250519-busy-expert-buffalo-2c01ea@kuoka>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGkgeVkgdTkoeSRhNQkhITVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktISk5MT1VKS0tVSkJLS1
	kG
X-HM-Tid: 0a96eb968c4c03a1kunm7ee6d6a366406
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OTo6SQw5MzExIiMUDh81FgsO
	Li4KCTRVSlVKTE9MTEtCSUhOSENPVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFITUxCNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_194718_999577_0091A201 
X-CRM114-Status: GOOD (  12.40  )
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

On Mon, May 19, 2025 at 11:35:28AM +0200, Krzysztof Kozlowski wrote:
> On Sun, May 18, 2025 at 03:19:19AM GMT, Ze Huang wrote:
> > +properties:
> > +  compatible:
> > +    const: spacemit,k1-dwc3
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: usbdrd30
> > +
> 
> How many phys?
> 

Two phys: USB2.0 phy and USB3.0 phy

Will update the bindings in next version.

> > +  resets:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interconnects:
> 
> compatible, reg and then order by name: clocks +names, interconnects +
> names, interrupts, resets, vdd-supply.
> 

Got it wrong again - thanks for your patience.

I'll update the property order as you suggested.

> > +    maxItems: 1
> > +    description:
> > +      On SpacemiT K1, USB performs DMA through bus other than parent DT node.
> > +      The 'interconnects' property explicitly describes this path, ensuring
> > +      correct address translation.
> > +
> > +  interconnect-names:
> > +    const: dma-mem
> > +
> > +  vbus-supply:
> > +    description: A phandle to the regulator supplying the VBUS voltage.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - interrupts
> > +  - interconnects
> > +  - interconnect-names
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    usb@c0a00000 {
> > +        compatible = "spacemit,k1-dwc3";
> > +        reg = <0xc0a00000 0x10000>;
> > +        clocks = <&syscon_apmu 16>;
> > +        clock-names = "usbdrd30";
> > +        resets = <&syscon_apmu 8>;
> > +        interrupt-parent = <&plic>;
> > +        interrupts = <125>;
> > +        interconnects = <&mbus0>;
> > +        interconnect-names = "dma-mem";
> 
> Feels like missing port or ports. Are you sure your example is complete?
> 

Will include ports in next version

    hub@1 {
        compatible = "usb2109,2817";
        reg = <0x1>;
        vdd-supply = <&usb3_vhub>;
        peer-hub = <&hub_3_0>;
        reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
    };

    hub@2 {
        compatible = "usb2109,817";
        reg = <0x1>;
        vdd-supply = <&usb3_vhub>;
        peer-hub = <&hub_2_0>;
        reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
    };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
