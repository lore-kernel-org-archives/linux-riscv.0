Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDF2C02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 22:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X0kPYDGTDiTKKUcX5XKc7sMN+IbQ0rru1Y9TZ3U4SvA=; b=QMMzWWNgOJts7Z
	EPEyDCjGs4s1Agj0Uakdmmfr+0mL8LciC2Hs0eC4O2Z2jHAugJV58UgJaWa/n35IV9fD9YacMTrMl
	wt8nuSJNfiLKR2p++J+E2Y+QRKDCPpLiR4HTqv/hg2Dn6Le8r5fNrN1cepjhfrNdOmtsX6OyMLb4O
	bFnvUpOJF71GolMEuoKcXPpm+vrtzPqOX3DMYQ7qYM9sNWO67N9IzqzpLVVho/f1gPYUBW5/dnGym
	bB+zXpOtkkh4Ed3r7cnFAzv/EXdJLMAKKMWxL3DwX+AJ0FP+MIeuATss1z4wBp/Y5PnDv1618lXeR
	PIPn2HMrf+iVuE+uIwCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5I9-0000000GpX4-1LOD;
	Mon, 03 Feb 2025 22:51:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5I7-0000000GpWk-0Dtj
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 22:51:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B1EA2A40776;
	Mon,  3 Feb 2025 22:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540E4C4CEE0;
	Mon,  3 Feb 2025 22:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738623101;
	bh=iYGhuwkNNXZEPUxNZb0JxEm0OoeaCNKV9fe+AsGA27o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7YMIw/NSk6lI7jrB6tw2ZC1zNUsQafp0f5SoMz7IzGaa08BT4HSR2sOCcCL3JBd4
	 wqhu/lxxL7nsJlTzIReAsfosNZ8feBne3/PjPKTIIVpX1pCvcyWxEzAxKCw4f63wGv
	 skaGSOXSow5S9tFhdHVQgPNTxi79Vst1Z/VT5tK5yYKUBp186mFpPvwNGm5866nUL5
	 c+OydER8px3twwe3ZrmKT0TloQrL+f3YTpsmzzD+CEnirr4BSTvGV+UGZ+7ca7jgMQ
	 pYSfjT6yhITMASwBLI2vphmNbcBLFXt7+iTmUo/KOKKuC3reDGGEPWBkWqFMGkQ5np
	 ZvX4Fa9mGWSgg==
Date: Mon, 3 Feb 2025 16:51:40 -0600
From: Rob Herring <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [RFC PATCH v2 08/17] dt-bindings: clock: Add bindings for RISC-V
 RPMI clock service group
Message-ID: <20250203225140.GA483650-robh@kernel.org>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-9-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250203084906.681418-9-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_145143_226081_A6770CA5 
X-CRM114-Status: GOOD (  20.90  )
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

On Mon, Feb 03, 2025 at 02:18:57PM +0530, Anup Patel wrote:
> Add device tree bindings for the clock service group defined by the
> RISC-V platform management interface (RPMI) specification.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../bindings/clock/riscv,rpmi-clock.yaml      | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
> new file mode 100644
> index 000000000000..c08491c04926
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/riscv,rpmi-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI clock service group based clock controller
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
> +  The RPMI specification [1] defines clock service group for accessing
> +  system clocks managed by a platform microcontroller.
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
> +properties:
> +  compatible:
> +    oneOf:
> +      - description:
> +          Intended for use by the SBI implementation in machine mode or
> +          software in supervisor mode.
> +        const: riscv,rpmi-clock
> +
> +      - description:
> +          Intended for use by the SBI implementation in machine mode.
> +        const: riscv,rpmi-mpxy-clock
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
> +      riscv,rpmi-mpxy-clock compatible string.

That constraint can be expressed as:

dependentSchemas:
  riscv,sbi-mpxy-channel-id:
    properties:
      compatible:
        const: riscv,rpmi-mpxy-clock

Please double check that works.

> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      This property is mandatory when using riscv,rpmi-clock compatible string.

Similar constraint here.

Though the only thing the 2 compatibles have in common is 'mboxes'. I 
think it would be better to just split this into 2 docs.

> +
> +required:
> +  - compatible
> +  - mboxes
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mpxy_mbox: sbi-mpxy-mbox {

mailbox {

> +          compatible = "riscv,sbi-mpxy-mbox";
> +          #mbox-cells = <2>;
> +    };
> +    rpmi-clk {

clock-controller {

> +        compatible = "riscv,rpmi-clock";
> +        mboxes = <&mpxy_mbox 0x1000 0x0>;
> +        #clock-cells = <1>;
> +    };
> +...
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
