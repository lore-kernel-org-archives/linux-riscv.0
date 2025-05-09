Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB42C3ABBC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 06:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3Rm116dKuviPmqe8dvyM//AVIuPZxnQO7a4p+evbHI=; b=L0jqy4jr2jXXzQ
	Zge8wvnj7U6p9+X533kzbzAjKXla702PeFFLn8a5Y2HhPYNkgmFw4/4krtj9EPCnVMoc9WusyIL6a
	wDA+QjFmqG6iOHhRzWytDh8K0ISxtRvmMX1rD3lUuAfEtYijvtPVCOqtAcd6G2k1ZbGoWxubqbXhJ
	4khj9HhAP5PWyzM2Ekaxn8WvYHVj5/1h26zEazD01XDyPv7bzxnbzvuvUJGhXcRDSP5o29Ogu5Wd8
	hB4tq8UQz5RS5C/q0uUWgGuFHypvxydqx2sPtY23jJSh6istITqHmA+rHkwlSEH4tHhGtZykKlvIF
	aZZGXvUraTfhUgcKzyAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHSn-00000002dZI-1kBe;
	Fri, 09 May 2025 06:44:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHPM-00000002d1W-0RYE
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 06:40:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 246A460008;
	Fri,  9 May 2025 06:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A1BC4CEE4;
	Fri,  9 May 2025 06:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746772830;
	bh=efT4gy3DPSJVddrgV3Coynq8JjHJLhPlxsgqiMB2KA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j7XwOpH5E6EltH7WTXdpxVBPYMzno7SRjM/s9++39HRHcEijg1HXhFRtp/yg44q6l
	 y7dszeimOpth5KQTRYPe2xHrpebYWpiW0cBjvmy3+1iZsqGvpBApip9ax9cgIivGAm
	 3/K/iZPwmnlnnCvPVp9QmTbgSgWOb2vgiyNuGF2lFt2smO41K4jjEJIrxvcpql5Tvq
	 i9owDKb8IIt7cuGCYG7shtzr5+Ib/VobAsQI1l+5JsmVevnL8al/+Oe+SbpQGaAZ7v
	 8M/NYJlJUVNLstW+lw0lDCuJHKjEm4xm7DGNMKfQiSdzcIP4rD3dGoO1z7USZnnAIU
	 KYUKhfXaCAPFA==
Date: Fri, 9 May 2025 08:40:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Hu <nick.hu@sifive.com>
Cc: Cyan Yang <cyan.yang@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] dt-bindings: power: Add SiFive Domain Management
 controllers
Message-ID: <20250509-small-graceful-limpet-d0ea41@kuoka>
References: <20250509021605.26764-1-nick.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250509021605.26764-1-nick.hu@sifive.com>
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

On Fri, May 09, 2025 at 10:16:04AM GMT, Nick Hu wrote:
> SiFive Domain Management controller includes the following components
> - SiFive Tile Management Controller
> - SiFive Cluster Management Controller
> - SiFive Core Complex Management Controller
> 
> These controllers control the clock and power domain of the
> corresponding domain.
> 
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>  .../devicetree/bindings/power/sifive,tmc.yaml | 89 +++++++++++++++++++

Where is a patch with the driver (user of the binding)?

>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/sifive,tmc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/sifive,tmc.yaml b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
> new file mode 100644
> index 000000000000..7ed4f290b94b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/sifive,tmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive Domain Management Controller
> +
> +maintainers:
> +  - Cyan Yang <cyan.yang@sifive.com>
> +  - Nick Hu <nick.hu@sifive.com>
> +  - Samuel Holland <samuel.holland@sifive.com>
> +
> +description: |
> +  This is the device tree binding for the following SiFive Domain Management Controllers.

Explain the hardware, not that "binding is a binding for ...".

Also, wrap according to Linux coding style.


> +  - Tile Management Controller
> +      - TMC0
> +      - TMC1
> +      - TMC2
> +      - TMC3
> +  - Subsystem Management Controller
> +      - SMC0
> +      - SMC1
> +      - SMC2
> +      - SMC3
> +  - Cluster Management Controller
> +      - CMC2
> +      - CMC3
> +  SiFive Domain Management Controllers support the SiFive Quiet Interface
> +  Protocol (SQIP) starting from the Version 1. The control method is
> +  different from the Version 0, making them incompatible.
> +
> +allOf:
> +  - $ref: power-domain.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - {}
> +          - pattern: "^sifive,[ts]mc0$"
> +      - items:
> +          - {}
> +          - pattern: "^sifive,[ts]mc3$"
> +          - pattern: "^sifive,[ts]mc2$"
> +          - pattern: "^sifive,[ts]mc1$"
> +      - items:
> +          - {}
> +          - pattern: "^sifive,[ts]mc2$"
> +          - pattern: "^sifive,[ts]mc1$"
> +      - items:
> +          - {}
> +          - pattern: "^sifive,[ts]mc1$"
> +      - items:
> +          - {}
> +          - const: sifive,cmc3
> +          - const: sifive,cmc2
> +      - items:
> +          - {}
> +          - const: sifive,cmc2

All of this is just unexpected. Why any compatible should come with
these? You need to use SoC specific compatibles.


> +
> +  reg:
> +    maxItems: 1
> +
> +  sifive,feature-level:
> +    description: |
> +      Supported power features. This property is absent if the full set of features
> +      is supported

Compatible defines this. Drop.


> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: ["nopg", "ceasepg", "runonlypg"]
> +
> +  "#power-domain-cells":
> +    const: 0
> +
> +if:
> +  not:
> +    properties:
> +      compatible:
> +        contains:
> +          pattern: "^sifive,[tsc]mc3$"
> +then:
> +  properties:
> +    sifive,feature-level: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

Missing example.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
