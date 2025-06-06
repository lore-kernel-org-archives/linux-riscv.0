Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AA6C5AD49
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 22:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lq1QE8U/VmshA4vM6mm4tg7SnZdJmkSRm19MY8N1ZjM=; b=vQG59Bt+Rml5GJUxbb9KGOKC46
	OkkrMkxNgR4gi+8p2sa0KDrOxf8EqTOZnUkGYJUjdfZEUEDctakf+h/3kuE25TmwDWcJQArE5ah3C
	3p5a9Z7XTRCTsZ854gBgyuhyuWa8GhyvApuIG7JsZ/Ig3tdxFrm2UOe/xtdGUqjIF24cDOjgANxS/
	rgxJvRXfbfT4+zQIRDDji34jTKsNixJTIG5irrHFmlmCgcd7REdP5FIS1poK/aPHYZgi6lbNBHY6W
	78KvKzq4MrX69JCKTDqEYD1qrxpj7fB7Ad8I4EE7swJF/EbvM5eI4CyYbsp0nXros8gd/47SK8+09
	8fzoEBDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNg2C-0000000166d-3216;
	Fri, 06 Jun 2025 22:59:36 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNg28-00000001665-3a5l
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 22:59:35 +0000
Message-ID: <b355406d-c79f-4d81-bc36-a8889b54aa03@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749250768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9RomQS92hBA9eqkdzWe6rSqjDgfbgT2iRuNEC7vRw7I=;
	b=crxR5hkSHPAgjkpSnkO2hc8eEWkclBTknO2F7yBROybPqI5nKCjHgKwa0V02tyc5LGBXzL
	atH+6hcgCQr7eVoQgYmiOj60nzwcJVjzGOYkkdTdz0l3tJ3Nv1pJ+BkxoQQAAdDK2rriO0
	3s00piolPkq0+wq/zV8s6TI/FqnwTLM=
Date: Fri, 6 Jun 2025 15:59:19 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v4 11/23] dt-bindings: Add RPMI system MSI message proxy
 bindings
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
 <20250525084710.1665648-12-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250525084710.1665648-12-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_155933_657826_A0DFCE87 
X-CRM114-Status: GOOD (  18.45  )
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
> based message proxy implemented by the SBI implementation (machine
> mode firmware or hypervisor).
>
> The RPMI system MSI service group is defined by the RISC-V
> platform management interface (RPMI) specification.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   .../riscv,rpmi-mpxy-system-msi.yaml           | 67 +++++++++++++++++++
>   1 file changed, 67 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
> new file mode 100644
> index 000000000000..26dd13731350
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI system MSI service group based message proxy
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
> +  The SBI implementation machine mode firmware or hypervisor) can
nit:
The SBI implementation in machine mode
> +  implement an SBI MPXY channel to allow RPMI system MSI service
> +  group access to the supervisor software.
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
nit: Refer the latest frozen version of the spec ?
> +properties:
> +  compatible:
> +    description:
> +      Intended for use by the SBI implementation.
> +    const: riscv,rpmi-mpxy-system-msi
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Mailbox channel of the underlying RPMI transport.
> +
> +  riscv,sbi-mpxy-channel-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The SBI MPXY channel id to be used for providing RPMI access to
> +      the supervisor software.
> +
> +required:
> +  - compatible
> +  - mboxes
> +  - riscv,sbi-mpxy-channel-id
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller {
> +        compatible = "riscv,rpmi-mpxy-system-msi";
> +        mboxes = <&rpmi_shmem_mbox 0x2>;
> +        riscv,sbi-mpxy-channel-id = <0x2000>;
> +    };
> +...

Otherwise, lgtm.

Reviewed-by: Atish Patra <atishp@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
