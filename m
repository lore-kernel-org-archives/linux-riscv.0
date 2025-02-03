Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DE2C02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 22:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3CfCaSgx+ux0+UJBeo47UcrbRzYjy23yXRsslvKLL00=; b=1BMB8U7brP5aFh
	LHuci1+YbDL2N31LEmNi8dVCgl2DxoW4B6WFczCJ9/T4DdWrxSqOny1NIMMnL+eC9jbMqQpwvizJE
	fQTSE5haSbsy5Im8lEaz1c4Qzpc558ORh/12d1N/zaFI9P+NEh8+Xas+oRGnQPcJOF5TqC9jycv7R
	nbWaHIoyLWjGRpL65UCiy804/ZGfEMR+lKQJJzfaUY0AUuOyAGpNc7gVV0OL+gZKPJNNuzxAAEe2L
	+pf3ft7qDBfRTO/OB+wu5tEcjFmbXI6IJamkWfZZycR1CWo4M0JV5yl1/TM3AWaJSGny75XanLJNd
	qanu7eP2ftQMwzVaUBwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5BK-0000000GonM-0b0u;
	Mon, 03 Feb 2025 22:44:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5BH-0000000Gomx-2Iwv
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 22:44:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 638F7A41DF6;
	Mon,  3 Feb 2025 22:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0094AC4CED2;
	Mon,  3 Feb 2025 22:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738622678;
	bh=xmSkXHE4yrh5WE9/qixdoYlepUyA6sUkXRP9MquXhMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mDjWdEXqxxXWHowybWCOSGUTQQYvNaN0HJKdcy0XG+3P+6+Zyi7W+ZW6HL+FLXBmW
	 rjGNNk1bXv8y7Ng877xCBeGfFHT6d5cKoybz0QVzOwmjgdH2NqpKoh85lPRjGQlves
	 QIBhCyfsai8kXc4WqCdOU0ksZpBcokQNBqc5ndZgpfsS1vBewEmMRUqmqobiJzuHdw
	 6Jnw1YGcv8Gw7Jz+TeyYu9qDFonxzuEhuEJJCvifHzeasZLIcFJfUXTRe/hGqjnnfA
	 /FEv9Rq/vsGfJYe63aQN8CnvalH0XhQeU5c/CBOQ9uFSKC5UvHXF4Dc32Ydz4VRwNK
	 ZT1TtAny0D32g==
Date: Mon, 3 Feb 2025 16:44:36 -0600
From: Rob Herring <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [RFC PATCH v2 03/17] dt-bindings: mailbox: Add bindings for
 RISC-V SBI MPXY extension
Message-ID: <20250203224436.GA363790-robh@kernel.org>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250203084906.681418-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_144439_718668_A416DCB6 
X-CRM114-Status: GOOD (  19.20  )
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

On Mon, Feb 03, 2025 at 02:18:52PM +0530, Anup Patel wrote:
> Add device tree bindings for the RISC-V SBI Message Proxy (MPXY)
> extension as a mailbox controller.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
> new file mode 100644
> index 000000000000..8a05e089b710
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V SBI Message Proxy (MPXY) extension based mailbox
> +
> +maintainers:
> +  - Anup Patel <anup@brainfault.org>
> +
> +description: |
> +  The RISC-V SBI Message Proxy (MPXY) extension [1] allows supervisor
> +  software to send messages through the SBI implementation (M-mode
> +  firmware or HS-mode hypervisor). The underlying message protocol
> +  and message format used by the supervisor software could be some
> +  other standard protocol compatible with the SBI MPXY extension
> +  (such as RISC-V Platform Management Interface (RPMI) [2]).
> +
> +  ===========================================
> +  References
> +  ===========================================
> +
> +  [1] RISC-V Supervisor Binary Interface (SBI)
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> +
> +  [2] RISC-V Platform Management Interface (RPMI)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +properties:
> +  $nodename:
> +    const: sbi-mpxy-mbox

'mailbox' is the defined name for mailbox providers.

> +
> +  compatible:
> +    const: riscv,sbi-mpxy-mbox
> +
> +  "#mbox-cells":
> +    const: 2
> +    description:
> +      The first cell specifies channel_id of the SBI MPXY channel,
> +      the second cell specifies MSG_PROT_ID of the SBI MPXY channel
> +
> +required:
> +  - compatible
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sbi-mpxy-mbox {
> +          compatible = "riscv,sbi-mpxy-mbox";
> +          #mbox-cells = <2>;

Is there an SBI node? #mbox-cells could just be part of that along with 
anything else that SBI is a provider for. And we already have the PMU 
SBI binding. It's all one thing, so there should be one SBI node. Then 
we can debate about child nodes of it.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
