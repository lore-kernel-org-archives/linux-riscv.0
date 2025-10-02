Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22601CAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 19:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQsuMV74EwoyGZmHV39b2rA1Y3L8e5Pvi/Ga6anmd78=; b=wL2YOYfW5mbwi+
	bmIhNyvcL0BaP0Rk1xRtq+u/kz/SUDf4IgC/wk09MrblWG59soVhfMwUxNox6Ef+M68XPi/nn6fjc
	rkMBuep9dSpRCIdcBajcIjRJQww0mk+q3PMUVi7cxxtUzZZ0ndcsXHGeYOumFP72jl68N9Ki8hhiI
	d0g9R3YjxQmF3XRFm3tf0Z1mSe0jXWHiE7z/cTuWYon0NBM3XQao7N0uCswXbLCcCTTC5JoPZMqbS
	uqrivLJf6Nm4C+gMh3iy0Ku9MHoimACPemVTqVZpM/kVH36pD0MK6esvpnIP9oqR+vEfw5dx/mblx
	KCtG5tg6MP8xt5xTri8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4OvQ-0000000B6OH-2jRi;
	Thu, 02 Oct 2025 19:25:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4OvO-0000000B6Mp-0xdF
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 19:25:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F08FF44B77;
	Thu,  2 Oct 2025 19:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8195BC4CEF4;
	Thu,  2 Oct 2025 19:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759433107;
	bh=nip5+pOwI51SpkdT3VI8Pei0Qu8xBZA8qy5/5279btk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HyIW06SsYzTvVCBSOdJfh8xJdGlFve2FJQHquD1zuZcRfEz/9sDRnJTZCIGkFjEoO
	 rjLfIlYBQcACPxCYeJ3ITZE31JSDX3dQbAEwcs+F7Ly/KiD0JkI2gVYxykfa/zmo9B
	 +l0nLRtNJxsJTJp31KXkFIYX+gjDWhmGos4XT3SEliP6xF1kGPPu2mq99NDRAxqaFs
	 fcIWj4yNLiNz3MVhJmoUwSNy+BktXaNtsS/zs1svks3uDTYMCMeni9/KuhPXbUs0+V
	 +4+z0KVkeqi9vO4TQkZ7F5UoBdUTy/aC9qQjGfhBcFIEKCtjRhdF1KOBcStZ6Lcb3I
	 axQNn2DywNC/g==
Date: Thu, 2 Oct 2025 14:25:06 -0500
From: Rob Herring <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 01/11] dt-bindings: Add RISC-V trace component bindings
Message-ID: <20251002192506.GA236729-robh@kernel.org>
References: <20251002060732.100213-1-apatel@ventanamicro.com>
 <20251002060732.100213-2-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251002060732.100213-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_122510_321793_01DB76CF 
X-CRM114-Status: GOOD (  21.88  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Atish Patra <atish.patra@linux.dev>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Liang Kan <kan.liang@linux.intel.com>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@redhat.com>, Greg KH <gregkh@linuxfoundation.org>, Adrian Hunter <adrian.hunter@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 02, 2025 at 11:37:22AM +0530, Anup Patel wrote:
> Add device tree bindings for the memory mapped RISC-V trace components
> which support both the RISC-V efficient trace (E-trace) protocol and
> the RISC-V Nexus-based trace (N-trace) protocol.
> 
> The RISC-V trace components are defined by the RISC-V trace control
> interface specification.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../bindings/riscv/riscv,trace-component.yaml | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
> new file mode 100644
> index 000000000000..78a70fe04dfe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/riscv,trace-component.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Trace Component
> +
> +maintainers:
> +  - Anup Patel <anup@brainfault.org>
> +
> +description:
> +  The RISC-V trace control interface specification standard memory mapped
> +  components (or devices) which support both the RISC-V efficient trace
> +  (E-trace) protocol and the RISC-V Nexus-based trace (N-trace) protocol.
> +  The RISC-V trace components have implementation specific directed acyclic
> +  graph style interdependency where output of one component serves as input
> +  to another component and certain components (such as funnel) can take inputs
> +  from multiple components.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qemu,trace-component
> +      - const: riscv,trace-component

Given the generic-ness of these names, I'm assuming the exact type of 
component is discoverable. I don't like to assume things in bindings, so 
spell that out.

Is the implementer discoverable? If so, you could omit the 1st 
compatible.

> +
> +  reg:
> +    maxItems: 1
> +
> +  cpu:

'cpus' is the more standard property.

> +    description:
> +      phandle to the cpu to which the RISC-V trace component is bound.
> +    $ref: /schemas/types.yaml#/definitions/phandle

which already has a type. So just 'maxItems: 1' here.

> +
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    patternProperties:
> +      '^port(@[0-7])?$':
> +        description: Input connections from RISC-V trace component
> +        $ref: /schemas/graph.yaml#/properties/port

If the N ports are N of the same data (like a mux), then fine. If each 
port is different, then you need to define what each port is.

> +
> +  out-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    patternProperties:
> +      '^port(@[0-7])?$':
> +        description: Output connections from RISC-V trace component
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    // Example 1 (Per-hart encoder and ramsink components):
> +
> +    encoder@c000000 {

Perhaps it is time to standardize the node names here. Perhaps 'trace'.

> +      compatible = "qemu,trace-component", "riscv,trace-component";
> +      reg = <0xc000000 0x1000>;
> +      cpu = <&CPU0>;
> +      out-ports {
> +        port {
> +          CPU0_ENCODER_OUTPUT: endpoint {
> +            remote-endpoint = <&CPU0_RAMSINK_INPUT>;
> +          };
> +        };
> +      };
> +    };
> +
> +    ramsink@c001000 {
> +      compatible = "qemu,trace-component", "riscv,trace-component";
> +      reg = <0xc001000 0x1000>;
> +      cpu = <&CPU0>;
> +      in-ports {
> +        port {
> +          CPU0_RAMSINK_INPUT: endpoint {
> +          };
> +        };
> +      };
> +    };
> +
> +    encoder@c002000 {
> +      compatible = "qemu,trace-component", "riscv,trace-component";
> +      reg = <0xc002000 0x1000>;
> +      cpu = <&CPU1>;
> +      out-ports {
> +        port {
> +          CPU1_ENCODER_OUTPUT: endpoint {
> +            remote-endpoint = <&CPU1_RAMSINK_INPUT>;
> +          };
> +        };
> +      };
> +    };
> +
> +    ramsink@c003000 {
> +      compatible = "qemu,trace-component", "riscv,trace-component";
> +      reg = <0xc003000 0x1000>;
> +      cpu = <&CPU1>;
> +      in-ports {
> +        port {
> +          CPU1_RAMSINK_INPUT: endpoint {
> +          };
> +        };
> +      };
> +    };
> +
> +...
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
