Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE7EC02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 22:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8lmF6kGiONWcxRmHv5hHDqCivnu1aX4Qk/yNIsP0APY=; b=00NemBZYNVqyx/
	6qZoHGcHe1Zc+FAoVschhzyNrCz4jf7Y38GWK9NUqWAXK9TFuwTG/twwuNt2FrYOnhQbVGNWDnYoV
	R3yHT+kQgNCHICNf9wXZhPzNDjeoeVJZaGwBSiYKksYOTYTTeehcrH7hlgH9VgMs765iOXu9dWBr0
	mcDPtd6giUjzAjGcDEVUq2jtvjHj3/eHgI3KINcpqJh9g68xKAQoRkAu4mFm3fRzazK3nBGRR9c5j
	kGXKCz9y0ehtG5QlCfrebVR3Tv+baD3GKyk4ON+Wr28Pz1o2oxXc0MMGpY6EeMz8q89vSscWQCpdR
	InOSiQdXYUhN9PlctONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5P0-0000000Gq2F-4BHD;
	Mon, 03 Feb 2025 22:58:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5Oy-0000000Gq1s-1HdL
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 22:58:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 09A85A41EA5;
	Mon,  3 Feb 2025 22:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD641C4CEE0;
	Mon,  3 Feb 2025 22:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738623526;
	bh=Y2i2DGPHFIdPzHIKRjI2VaiGai6KPkZD5HD5AgVbUAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bu/ttkABWOv8ImptMUZPmLd6yVlBnvEYryrcUuO5mpAzi0G13tf/REo+nUP7NMCMa
	 8/M3cwu9sLZ7iC0tV+LjpnwiKNLBtZYqw9NL6ueVHfD+mnuFhKA01xtgCvsvL1Jya/
	 92t5ubXCT1EUx5iONeES2CLkvwUWQN1S158wEwT7sy66GEoxM+vFYw60JtUQ9pfuAN
	 DNzck0fTmUivSqiPLNf37XOLZBX8kaKrAV1tVj8HVVURN3+w9HEq00Aui//abRIhDI
	 +9GRMkisd0AHgEDK89ysExyuMVCJFfQhVp/BIsAAxBIAEAj3BasW62kcKWuihaTUxX
	 HrM3/YdU4k82Q==
Date: Mon, 3 Feb 2025 16:58:45 -0600
From: Rob Herring <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [RFC PATCH v2 10/17] dt-bindings: interrupt-controller: Add
 bindings for RISC-V RPMI system MSI
Message-ID: <20250203225845.GA491419-robh@kernel.org>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-11-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250203084906.681418-11-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_145848_475779_DC61D7A0 
X-CRM114-Status: GOOD (  20.13  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Paul Walmsley <paul.walmsley@sifive.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Atish Patra <atishp@atishpatra.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 03, 2025 at 02:18:59PM +0530, Anup Patel wrote:
> Add device tree bindings for the system MSI service group based interrupt
> controller defined by the RISC-V platform management interface (RPMI)
> specification.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../riscv,rpmi-system-msi.yaml                | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
> new file mode 100644
> index 000000000000..e6c297e66c99
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/riscv,rpmi-system-msi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI system MSI service group based interrupt controller
> +
> +maintainers:
> +  - Anup Patel <anup@brainfault.org>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a
> +  messaging protocol which is modular and extensible. The supervisor
> +  software can send/receive RPMI messages via SBI MPXY extension [2]
> +  or some dedicated supervisor-mode RPMI transport.
> +
> +  The RPMI specification [1] defines system MSI service group which
> +  allow application processors to receive MSIs upon system events
> +  such as P2A doorbell, graceful shutdown/reboot request, CPU hotplug
> +  event, memory hotplug event, etc from the platform microcontroller.

I'm confused by this description and what the binding has. This "device" 
is receiving interrupts and generating MSIs based on those interrupts? 

> +
> +  ===========================================
> +  References
> +  ===========================================
> +
> +  [1] RISC-V Platform Management Interface (RPMI)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +  [2] RISC-V Supervisor Binary Interface (SBI)
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description:
> +          Intended for use by the SBI implementation in machine mode or
> +          software in supervisor mode.
> +        const: riscv,rpmi-system-msi
> +
> +      - description:
> +          Intended for use by the SBI implementation in machine mode.
> +        const: riscv,rpmi-mpxy-system-msi
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Mailbox channel of the underlying RPMI transport or SBI message proxy.
> +
> +  riscv,sbi-mpxy-channel-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The SBI MPXY channel id to be used for providing RPMI access to
> +      the supervisor software. This property is mandatory when using
> +      riscv,rpmi-mpxy-system-msi compatible string.
> +
> +  msi-parent: true
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - mboxes
> +  - msi-parent
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mpxy_mbox: sbi-mpxy-mbox {

mailbox {

Though generally we don't show providers for a consumer schema.

> +          compatible = "riscv,sbi-mpxy-mbox";
> +          #mbox-cells = <2>;
> +    };
> +    rpmi_sysmsi_intc: interrupt-controller {
> +        compatible = "riscv,rpmi-system-msi";
> +        mboxes = <&mpxy_mbox 0x2000 0x0>;
> +        msi-parent = <&imsic_slevel>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +    };
> +...
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
