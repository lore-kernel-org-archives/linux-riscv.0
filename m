Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBF9C5AD49
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 23:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHwdKtsQ/dVsPyfzwRIZD7NTyo1mMnUEAi2qQfL2N5M=; b=fGPU3KYUtD+woOwKSuu7l3hnAA
	DoF8gdd3ghQjGVBPbMR9q+UkU2tDQrQ9F2UWfiTz9R19G5PODVEXLjxLM1UpI1U1VYNduCjvowUn8
	zpeSUlPYyay6jXwMxV2h2wo9gn7ZJ/SWwb/S5arobggg3HvWy/ZCG1Wdid6QKX7tV1C0SSFtL9vYe
	hVljymSyrTV3BZ0IDz2nj9ZZJsMN2I9vwI3u9LYj5PhyroivXWyVG49HwkpNOpB5OKYH9G7wLsfjy
	e+sE1uafuYYhCgaOEztT9h8DDKQQqmoh9JLhSa8Hu0jlwxWKkeRllKbzbomEE68Xe0qYgDMoI0aeY
	vuLhuMcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNg5t-000000016QV-41vO;
	Fri, 06 Jun 2025 23:03:25 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNg5q-000000016Q9-3tU4
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 23:03:24 +0000
Message-ID: <c691cf5e-695e-4a29-b31a-76b3376442b2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749251000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nl7fH6FNDtu/VqccuBmnAP9vsS3V71ySkYYbHAfw7Z8=;
	b=Ptcayhb+lXXE5AuLIZjs/q8BjRUSzgSgWMO5q3SDOUX2Lccj1czWKaPIUsRksdZ9KsZmzG
	ubgIaEdvwkIVvJybGF/ET1D6xCgemRRxnJA+aAFT6vUQiIg9khxBC9L7yKnAL28r+UMJDo
	/JRMcULVbSeXfBUujXlpLduKFRkjL2A=
Date: Fri, 6 Jun 2025 16:03:08 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v4 12/23] dt-bindings: Add RPMI system MSI interrupt
 controller bindings
To: Anup Patel <apatel@ventanamicro.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-13-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250525084710.1665648-13-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_160323_262025_6C8DCD79 
X-CRM114-Status: GOOD (  16.37  )
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
Cc: devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 5/25/25 1:46 AM, Anup Patel wrote:
> Add device tree bindings for the RPMI system MSI service group
> based interrupt controller for the supervisor software.
>
> The RPMI system MSI service group is defined by the RISC-V
> platform management interface (RPMI) specification.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   .../riscv,rpmi-system-msi.yaml                | 74 +++++++++++++++++++
>   1 file changed, 74 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
> new file mode 100644
> index 000000000000..ac13cec0666e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
> @@ -0,0 +1,74 @@
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
> +  The supervisor software can access RPMI system MSI service group via
> +  SBI MPXY channel or some dedicated supervisor-mode RPMI transport.
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
nit: Same comment as previous patch.
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    description:
> +      Intended for use by the supervisor software.
> +    const: riscv,rpmi-system-msi
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Mailbox channel of the underlying RPMI transport or SBI message proxy channel.
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
> +    interrupt-controller {
> +        compatible = "riscv,rpmi-system-msi";
> +        mboxes = <&mpxy_mbox 0x2000 0x0>;
> +        msi-parent = <&imsic_slevel>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +    };
> +...

Otherwise, LGTM.
Reviewed-by: Atish Patra <atishp@rivosinc.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
