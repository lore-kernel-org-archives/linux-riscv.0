Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31348C54795
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 18:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8XSB40CbpRQlUPO+a+2vBg/xqG3uTzP7H8fb+TTmvrY=; b=NnpK52UPGHYqeA
	Qwlyvi0RPXDDkfAkNRp+jLyllVx3MS6DLMjYGRE4At6bqoAyogmSYiKBhkwmF9NO3j3R48qC1XbXV
	bWHSMufryx2m17v0BShDMytpD92OLSFsDU5vmDo1yJaJu03f/x9qMlJA/u7VGXNXSRXSQhXbXcoNF
	9UxuWOw+d5JySx+KiKu9BdtnljdP2ILpXDYhSHeM29o3il0FzUM5ts6UUmpW8+Er7hUIngR/ScNog
	LjJvbYN9HuE7BDBW+mwgE6PmFf6Z0hfdMcVhWzfjSNkXKCqBDo387XbYGtv4pO3qh47fO3f/ZbUjS
	OYEvTBQ7RmDgL4afxJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4wS-0000000A66v-3eZm;
	Mon, 19 May 2025 18:10:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4GI-00000009xdY-4010
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 17:26:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 08E515C49D6;
	Mon, 19 May 2025 17:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27DFC4CEE4;
	Mon, 19 May 2025 17:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747675609;
	bh=h7V5zlLLmpxyamsNWnoGoWuIKl2M4zypQlTV2IRSXhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lA3kVei6l88TJII9OoHBPTluRg6LW+Q+SitMeZ+aXKahz0zDQ2Da62QX9vCBDk9Um
	 FuTTtKSyVALSwLI9XiYkPnxhE280IY4F3/6MTvVlX1lGtL8eZrzG43HiPoKylvPaMR
	 3eYKw0xaJlYcm9sDKwMhTShnPLQP/vxW9J91V3EJZFtUOp5+JuTiSL9dy5ew09t9dw
	 8lfbfWVET5sf9X40mZWXe5BRij7BUX+nykYmqYzKgZ1mO/+UUO6knyW9wxM++JijRC
	 YPWjdEqt3zRscodXo/FnBTQ8ffs+lmq0qJLZzBLxof7BU7lYQL/Tjn6e/voHXLeLZ1
	 RfKjSXpanrxtA==
Date: Mon, 19 May 2025 12:26:47 -0500
From: Rob Herring <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 02/23] dt-bindings: mailbox: Add bindings for RPMI
 shared memory transport
Message-ID: <20250519172647.GA2603742-robh@kernel.org>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250511133939.801777-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_102651_072566_650A61BB 
X-CRM114-Status: GOOD (  18.84  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, May 11, 2025 at 07:09:18PM +0530, Anup Patel wrote:
> Add device tree bindings for the common RISC-V Platform Management
> Interface (RPMI) shared memory transport as a mailbox controller.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 148 ++++++++++++++++++
>  1 file changed, 148 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
> new file mode 100644
> index 000000000000..3194c066d952
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
> @@ -0,0 +1,148 @@
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
> +          - const: a2p-doorbell
> +      - items:
> +          - const: a2p-req
> +          - const: p2a-ack
> +          - const: p2a-req
> +          - const: a2p-ack
> +      - items:
> +          - const: a2p-req
> +          - const: p2a-ack
> +          - const: a2p-doorbell
> +      - items:
> +          - const: a2p-req
> +          - const: p2a-ack

This can all be just:

minItems: 2
items:
  - const: a2p-req
  - const: p2a-ack
  - enum: [ p2a-req, a2p-doorbell ]
  - const: a2p-ack
  - const: a2p-doorbell


> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      The RPMI shared memory transport supports wired interrupt specified by
> +      this property as the P2A doorbell.

"The RPMI shared memory transport P2A doorbell"


> +
> +  msi-parent:
> +    description:
> +      The RPMI shared memory transport supports P2A doorbell as a system MSI
> +      and this property specifies the target MSI controller.
> +
> +  riscv,slot-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 64
> +    description:
> +      Power-of-2 RPMI slot size of the RPMI shared memory transport.
> +
> +  riscv,a2p-doorbell-value:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0x1
> +    description:
> +      Value written to the 32-bit A2P doorbell register.
> +
> +  riscv,p2a-doorbell-sysmsi-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The RPMI shared memory transport supports P2A doorbell as a system MSI
> +      and this property specifies system MSI index to be used for configuring
> +      the P2A doorbell MSI.
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
> +              <0x10090000 0x10000>;
> +        reg-names = "a2p-req", "p2a-ack";
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
> +        reg-names = "a2p-req", "p2a-ack", "p2a-req", "a2p-ack", "a2p-doorbell";
> +        msi-parent = <&imsic_mlevel>;
> +        riscv,slot-size = <64>;
> +        riscv,a2p-doorbell-value = <0x00008000>;
> +        #mbox-cells = <1>;
> +    };
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
