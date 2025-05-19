Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8642FC54E92
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 09:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GeuUvzQ/6g4KmVI0BOdCb+SUZCvnE27mOS1nH7FT0wQ=; b=ZPAx0pcgW5sI8l
	5AoEKmm+w5slqLRk9potXhQs7H5hcBefgBrWYeS3b3h7fPirNpvwzjvWGZt54udCb2DRTb4xqxZCB
	MZ4kPrNvnzuHhFg6irVax+vEl0PdlV12B4kuso9rcmjvh/Z2/G/loCFOrsIiCBbmdIyFLzj4mTMqd
	7ZepNb9JPdpOZbT4dC5RP5qB9wqr6RMkP96VFmWClnV+BjutVHfQMJ81kt+cjLlFS9LUzhHkexm3H
	oWYXaWzhqNhiSCUHKtR12zENFttl6n0jtXfRgv5bNSuPfqNH0iItzsxOItAipn1FkDezwm/pjjMGj
	gn35YJ2rtS710dlD3NwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxEP-00000008grH-2QNT;
	Mon, 19 May 2025 09:56:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwuC-00000008azR-42hO
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 09:35:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BF109A4C9A1;
	Mon, 19 May 2025 09:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06403C4CEE4;
	Mon, 19 May 2025 09:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747647331;
	bh=UVHwCwbhEk9S/BpWQrXka90Hbx/pl/lsbqyIqSeOAsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=porisN7g4peOMbggbjmKqMpoc1QKljXcxXGvUp5Jzdt73Ta55LC0YeWYnYSNu0mpk
	 57av2F5rvk/kWI0/STwFWKjfCKFzH63U+KAu082fjeQCVLRDuBoxU15vZdyH7Sx19g
	 UtaiEs5E5p5u1Q7MRmWnkQnjq4PU8oetECzuPPFwXrm+84qqQhS4Ok7zwnZMT66FG4
	 8MzSrGret6009OwElZcC+U4PIRCH3tI0jOTNRrF5WpN8WXXtEKf/PHGwU4eqSw29nN
	 E/Ro1ax3c+j2GW7z7sdKpMWzXnSfYxY2PJWrpXqjjvYxFvLsleNQ3Vf63tOZxl5c0F
	 MF/HGcWtq1uhA==
Date: Mon, 19 May 2025 11:35:28 +0200
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
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
Message-ID: <20250519-busy-expert-buffalo-2c01ea@kuoka>
References: <20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn>
 <20250518-b4-k1-dwc3-v3-v3-1-7609c8baa2a6@whut.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250518-b4-k1-dwc3-v3-v3-1-7609c8baa2a6@whut.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_023533_067717_1C318F98 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

On Sun, May 18, 2025 at 03:19:19AM GMT, Ze Huang wrote:
> +properties:
> +  compatible:
> +    const: spacemit,k1-dwc3
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: usbdrd30
> +

How many phys?

> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interconnects:

compatible, reg and then order by name: clocks +names, interconnects +
names, interrupts, resets, vdd-supply.

> +    maxItems: 1
> +    description:
> +      On SpacemiT K1, USB performs DMA through bus other than parent DT node.
> +      The 'interconnects' property explicitly describes this path, ensuring
> +      correct address translation.
> +
> +  interconnect-names:
> +    const: dma-mem
> +
> +  vbus-supply:
> +    description: A phandle to the regulator supplying the VBUS voltage.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - interrupts
> +  - interconnects
> +  - interconnect-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    usb@c0a00000 {
> +        compatible = "spacemit,k1-dwc3";
> +        reg = <0xc0a00000 0x10000>;
> +        clocks = <&syscon_apmu 16>;
> +        clock-names = "usbdrd30";
> +        resets = <&syscon_apmu 8>;
> +        interrupt-parent = <&plic>;
> +        interrupts = <125>;
> +        interconnects = <&mbus0>;
> +        interconnect-names = "dma-mem";

Feels like missing port or ports. Are you sure your example is complete?

> +    };
> 
> -- 
> 2.49.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
