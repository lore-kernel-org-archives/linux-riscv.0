Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B94EC02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 22:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=32LRQ2dus9ZJtnPzuRqnLFhTCoD0Ze98gp73vk7PpCo=; b=oF2eBdRe9Niv5g
	hJjmJ8LY3krIavyFJlU/lwvPZ6nfgkB2XfksUYoNuqDtvnssXSIsJpbsMUdUwdRd1P7Yh9ySKpqdK
	rbvdBOtsj0eALhPrjPs7i7sGyHiilF4oGM+u0lotYceA855D1DYNRfObDNLWbz8LId1ae7+y1cstq
	fknVOML2vuMMSGMulCO9Y3sLu70taf29qx1MTaILufQiFFBhstpmCRTZbUCdkOJw8vPXq9PyiPjaz
	nYQe2esZA8Zuvd33ZAqWolhXNeVctkZn72ul8McpzCER1YM/IAilq+ZhMyt/HYCs/BZ/sLDCMK6/M
	lX59nGvecTArpmm611rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4xW-0000000GmhU-0yrO;
	Mon, 03 Feb 2025 22:30:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4xT-0000000Gmh6-0Gl2
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 22:30:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B2005C6980;
	Mon,  3 Feb 2025 22:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F2DC4CED2;
	Mon,  3 Feb 2025 22:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738621821;
	bh=nQVY1dDboaeGX4s/kBcCQBGi1C5MiXmG7BkFyi87hcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gg38RWDyo4/DO/c18+GqHN9+P5Wj0kKkr03sEttx6ObUNrE30x4KSUURwsJdmro44
	 r1LafdcOekf3nL3YGCvs+3+yW00QdBSEe+8OyaWQLKifKsJ4fMJf4LDHz20+Moa8OQ
	 qvQKnaUDlTbuVIOTIsmOunydTlpH74XO4lmUqJc++rYDB2hvFYjn6RwK8RFSwel9w/
	 wHL56G7hOk8/eBS+lDJcg4XvbVAf2PVXLYqMeVh60gmDqF4mudpvg1YGdHMIAYUz+w
	 1v3HZICV3H8pjbLZHYHudE11xTWGwErGoW/5juK8WYRrXbFSA/61sXhQcB4IpEG5iK
	 XgapaV/Jv7wvg==
Date: Mon, 3 Feb 2025 16:30:20 -0600
From: Rob Herring <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [RFC PATCH v2 02/17] dt-bindings: mailbox: Add bindings for RPMI
 shared memory transport
Message-ID: <20250203223020.GA277987-robh@kernel.org>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250203084906.681418-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_143023_193566_4E26FBCD 
X-CRM114-Status: GOOD (  21.24  )
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

On Mon, Feb 03, 2025 at 02:18:51PM +0530, Anup Patel wrote:
> Add device tree bindings for the common RISC-V Platform Management
> Interface (RPMI) shared memory transport as a mailbox controller.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
> new file mode 100644
> index 000000000000..c339df5d9e24
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
> @@ -0,0 +1,150 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/riscv,rpmi-shmem-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Platform Management Interface (RPMI) shared memory mailbox
> +
> +maintainers:
> +  - Anup Patel <anup@brainfault.org>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a common shared
> +  memory based RPMI transport. This RPMI shared memory transport integrates as
> +  mailbox controller in the SBI implementation or supervisor software whereas
> +  each RPMI service group is mailbox client in the SBI implementation and
> +  supervisor software.
> +
> +  ===========================================
> +  References
> +  ===========================================
> +
> +  [1] RISC-V Platform Management Interface (RPMI)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +properties:
> +  compatible:
> +    const: riscv,rpmi-shmem-mbox
> +
> +  reg:
> +    oneOf:
> +      - items:
> +          - description: A2P request queue base address
> +          - description: P2A acknowledgment queue base address
> +          - description: P2A request queue base address
> +          - description: A2P acknowledgment queue base address
> +          - description: A2P doorbell address
> +      - items:
> +          - description: A2P request queue base address
> +          - description: P2A acknowledgment queue base address
> +          - description: P2A request queue base address
> +          - description: A2P acknowledgment queue base address
> +      - items:
> +          - description: A2P request queue base address
> +          - description: P2A acknowledgment queue base address
> +          - description: A2P doorbell address
> +      - items:
> +          - description: A2P request queue base address
> +          - description: P2A acknowledgment queue base address
> +
> +  reg-names:
> +    oneOf:
> +      - items:
> +          - const: a2p-req
> +          - const: p2a-ack
> +          - const: p2a-req
> +          - const: a2p-ack
> +          - const: doorbell
> +      - items:
> +          - const: a2p-req
> +          - const: p2a-ack
> +          - const: p2a-req
> +          - const: a2p-ack

These first 2 items lists can be combined with the addition of 
'minItems: 4'

> +      - items:
> +          - const: a2p-req
> +          - const: p2a-ack
> +          - const: doorbell
> +      - items:
> +          - const: a2p-req
> +          - const: p2a-ack
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      The RPMI shared memory transport supports wired interrupt specified by
> +      this property as the P2A doorbell.
> +
> +  msi-parent:
> +    description:
> +      The RPMI shared memory transport supports MSI as P2A doorbell and this
> +      property specifies the target MSI controller.
> +
> +  riscv,slot-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 64
> +    description:
> +      Power-of-2 RPMI slot size of the RPMI shared memory transport.
> +
> +  riscv,doorbell-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0xffffffff
> +    description:
> +      Update only the register bits of doorbell defined by the mask (32 bit).
> +
> +  riscv,doorbell-value:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0x1
> +    description:
> +      Value written to the doorbell register bits (32-bit access) specified
> +      by the riscv,db-mask property.

You mean riscv,doorbell-mask?

I'm confused why you would need both? If the value to write is fixed 
here, then why do you need a mask? You could just mask the value here.

I assume there's some dependency between these 2 properties. That needs 
to be captured with 'dependencies'.

> +
> +  "#mbox-cells":
> +    const: 1
> +    description:
> +      The first cell specifies RPMI service group ID.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - riscv,slot-size
> +  - "#mbox-cells"
> +
> +anyOf:
> +  - required:
> +      - interrupts
> +  - required:
> +      - msi-parent
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // Example 1 (RPMI shared memory with only 2 queues):
> +    mailbox@10080000 {
> +        compatible = "riscv,rpmi-shmem-mbox";
> +        reg = <0x10080000 0x10000>,
> +              <0x10090000 0x10000>,
> +              <0x100a0000 0x4>;
> +        reg-names = "a2p-req", "p2a-ack", "doorbell";
> +        msi-parent = <&imsic_mlevel>;
> +        riscv,slot-size = <64>;
> +        #mbox-cells = <1>;
> +    };
> +  - |
> +    // Example 2 (RPMI shared memory with only 4 queues):
> +    mailbox@10001000 {
> +        compatible = "riscv,rpmi-shmem-mbox";
> +        reg = <0x10001000 0x800>,
> +              <0x10001800 0x800>,
> +              <0x10002000 0x800>,
> +              <0x10002800 0x800>,
> +              <0x10003000 0x4>;
> +        reg-names = "a2p-req", "p2a-ack", "p2a-req", "a2p-ack", "doorbell";
> +        msi-parent = <&imsic_mlevel>;
> +        riscv,slot-size = <64>;
> +        riscv,doorbell-mask = <0x00008000>;
> +        riscv,doorbell-value = <0x00008000>;
> +        #mbox-cells = <1>;
> +    };
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
