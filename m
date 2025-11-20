Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B28CF9C48
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 16:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bp9PzUitSIvZ6y0457CSHKPFH4FKFi2pfGMFsKsp6A=; b=BScSuFaZ2Uxqbi
	1Yzu8VKz3QfRGiKUiZSK7DFOIMIT7aQqkJRFvq4TJJJpJ51RbjscmNuQLY913KZsUgpWt9lwknf5y
	fZ+E7dqkHaH4r7FCW+sb6vx9mq8daznzaSP5ja2/rBVU7TTn5rATKrKneLL/wjbeOhgHOYd/kWHiD
	bk05lBd1RIDIuZ42ipRomU93ExeXz3nClJIJVBHaJ1I3zrkSYB63IFHiXWayXR/vt8IkmfniflO7G
	GB3BHXssZFCXx3PE34ukuEToAhKGMh8NnqRUQyODRcNT7mtGvoEJXrQMjzMko58+6g9jqxI9cSz81
	3IuHqVs5ARkSti7hx6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7gb-000000071vE-40bd;
	Thu, 20 Nov 2025 16:39:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7ga-000000071v2-0CLs
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 16:39:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7ABFF601A2;
	Thu, 20 Nov 2025 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4BFC4CEF1;
	Thu, 20 Nov 2025 16:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763656747;
	bh=COJO4v5tFTz3670qo4kY/0Bq7kiQnVNdaNbifP4mjAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipcbas6XQM+tdQa5OOSBUiBqyniuHbwSnjjS7zJ5MxFzJXiETXtTkV7oe2t4VoTOG
	 85mMSVnhRKgJEVUSKSwGTyh9RI+XuRcyU9e+euAYNyepAjWsN6WSAVfvdkRLE5hSjd
	 lY30zV0xIQQLrnXNq4bsCzqZHYrxRevXsBtdBzDZpReHzmPE41YOTyTrLN7XLBOO7j
	 RmW/Z1g53zec9DQ9MKWmW+dKlWJPck8/ymRdKdglGudd8fxCF/tapu+BOed0He1Ptx
	 5e1Dt7fWNlU/0Q9V0XsjXge3b+6mF8yv+fCplMa56hDnNLXSZClc8bNRuJ47YTcAe0
	 sUQ38K/3hBWUA==
Date: Thu, 20 Nov 2025 10:39:05 -0600
From: Rob Herring <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: Add RISC-V trace component bindings
Message-ID: <20251120163905.GA1484818-robh@kernel.org>
References: <20251101154245.162492-1-apatel@ventanamicro.com>
 <20251101154245.162492-2-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251101154245.162492-2-apatel@ventanamicro.com>
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

On Sat, Nov 01, 2025 at 09:12:34PM +0530, Anup Patel wrote:
> Add device tree bindings for the memory mapped RISC-V trace components
> which support both the RISC-V efficient trace (E-trace) protocol and
> the RISC-V Nexus-based trace (N-trace) protocol.
> 
> The RISC-V trace components are defined by the RISC-V trace control
> interface specification.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../bindings/riscv/riscv,trace-component.yaml | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
> new file mode 100644
> index 000000000000..7979af3d4174
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
> @@ -0,0 +1,112 @@
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
> +  from multiple components. The type and version of a RISC-V trace component
> +  can be discovered from it's IMPL memory mapped register hence component
> +  specific compatible strings are not needed.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qemu,trace-component
> +      - const: riscv,trace-component

'component' seems a bit redundant.

> +
> +  reg:
> +    maxItems: 1
> +
> +  cpus:
> +    maxItems: 1
> +    description:
> +      phandle to the cpu to which the RISC-V trace component is bound.
> +
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    patternProperties:
> +      '^port(@[0-7])?$':
> +        description: Input connections from RISC-V trace component
> +        $ref: /schemas/graph.yaml#/properties/port
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

Is no in or out ports valid? If not, you need:

anyOf:
  - required: [ in-ports ]
  - required: [ out-ports ]

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    // Example 1 (Per-hart encoder and ramsink components):
> +
> +    encoder@c000000 {

trace@...?

Node names should be generic and a given compatible should only have 1 
possible node name. (Yes, we failed to do this on Arm coresight stuff.)

> +      compatible = "qemu,trace-component", "riscv,trace-component";
> +      reg = <0xc000000 0x1000>;
> +      cpus = <&CPU0>;

blank line between properties and child nodes.

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
> +      cpus = <&CPU0>;
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
> +      cpus = <&CPU1>;
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
> +      cpus = <&CPU1>;
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
