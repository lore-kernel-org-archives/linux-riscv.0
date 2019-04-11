Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F413C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 12:55:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF2EE217F4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 12:55:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g29AaVc3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1Y7JHl64"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF2EE217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XZ/ONldv6a60IQ6Bi6qYRHL0p6SWfFnmtdWw1+dagts=; b=g29AaVc3S+Xs+/
	37Po0abT5N1K77XD7YBZkY8Vu3oA/+70YKlFF3ua7TqpJvdwrQQHD0+GdAcUeo4nM116EkPNvV589
	WaBVHgNNYUvinBFpePWSF/8ujB5h3axLo6Si6Kgd8xblWZhFTjIO4n3fWBeeMLLs23ZYG6PgTdyt0
	hR2T7rthwS1Wpg2reDECoucI4+k1iEmZxypvji4Rf2bZ0QEutQA6SRBPQLpX7X96u1dVqR6LoKfHL
	QjG1FmdAlPlpx4bSwmxzQdCTQYn+CDVE1jQrzITBfqiy/2P9IZv7n0U3UjelY6Qys/QQjvprfOyh2
	xyYBMQrE5pN1YpipJe5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEZF5-0007hu-Tm; Thu, 11 Apr 2019 12:55:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEZF1-0007hN-Qp
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 12:55:45 +0000
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1BF98217F4
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 12:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554987343;
 bh=uu2M3x2oEdWyYW+DzsEwqWmw/nj922+HhTk/STNy3ZA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1Y7JHl64fuhR0kWW3Yxyz0FjoUHBuGxgoBnIC3bs7cv47QWgKKIa5seuOM2Lvqf2p
 SfFXR4b5xexdfz8ZP5l0j+F/+zM/YwgDUigDM5hxcCtObFAHF36kTQ0MuBcxyxPHJG
 EqxLLz2YXfcGDO33c54fWYxdIqW5pe1Yrz66Y9OQ=
Received: by mail-qt1-f172.google.com with SMTP id d13so6897201qth.5
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 05:55:43 -0700 (PDT)
X-Gm-Message-State: APjAAAW+kwS0K+F9xTabULFGQdSCPOjLiD+7AeV9Y4Jqpsy0fDhKmpVE
 v0gfOMM7siSnYvRw0c2tnlvrS0Q4EUQCBsPsKw==
X-Google-Smtp-Source: APXvYqyhRLeAqMgbaOjzJSv2ar77gOAF0jDx/RCQ6kpX8/sKQ8jFXeR2fuL56NurlGIp9zk2rQ9fJAyW5pDv0rHBPTk=
X-Received: by 2002:a0c:c950:: with SMTP id v16mr41199222qvj.204.1554987342189; 
 Thu, 11 Apr 2019 05:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
 <20190411084304.5072-4-paul.walmsley@sifive.com>
In-Reply-To: <20190411084304.5072-4-paul.walmsley@sifive.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 11 Apr 2019 07:55:30 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJhmrQmP00GwAty1KQZxdoSVSShGfjdkBmNgB0x3ev8KA@mail.gmail.com>
Message-ID: <CAL_JsqJhmrQmP00GwAty1KQZxdoSVSShGfjdkBmNgB0x3ev8KA@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: riscv: convert cpu binding to json-schema
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_055543_913243_E443DC60 
X-CRM114-Status: GOOD (  30.31  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 11, 2019 at 3:43 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> At Rob's request, we're starting to migrate our DT binding
> documentation to json-schema YAML format.  Start by converting our cpu
> binding documentation.  While doing so, document more properties and
> nodes.  This includes adding binding documentation support for the E51
> and U54 CPU cores ("harts") that are present on this SoC.  These cores
> are described in:
>
>     https://static.dev.sifive.com/FU540-C000-v1.0.pdf
>
> This cpus.yaml file is intended to be a starting point and to
> evolve over time.  It passes dt-doc-validate as of the yaml-bindings
> commit 4c79d42e9216.
>
> This patch was originally based on the ARM json-schema binding
> documentation as added by commit 672951cbd1b7 ("dt-bindings: arm: Convert
> cpu binding to json-schema").
>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> ---
>  .../devicetree/bindings/riscv/cpus.yaml       | 274 ++++++++++++++++++
>  1 file changed, 274 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/cpus.yaml
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> new file mode 100644
> index 000000000000..11ade807fd49
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -0,0 +1,274 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/cpus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V bindings for 'cpus' DT nodes
> +
> +maintainers:
> +  - Paul Walmsley <paul.walmsley@sifive.com>
> +  - Palmer Dabbelt <palmer@sifive.com>
> +
> +description: |+
> +  In SoC device tree data files, the layout of CPUs is described in
> +  the "cpus" node.   This node in turn contains a number of subnodes
> +  representing CPUs, which define properties for every cpu.
> +
> +  Bindings for CPU nodes follow the Devicetree Specification, available from:
> +
> +  https://www.devicetree.org/specifications/
> +
> +  with updates for RISC-V cores provided in this document.
> +
> +  ================================
> +  Convention used in this document
> +  ================================
> +
> +  This document follows the conventions described in the Devicetree
> +  Specification, with the addition:
> +
> +  - square brackets define bitfields, e.g. reg[7:0] represents the
> +    value of the bitfield in the reg property contained in bits 7 down
> +    to 0
> +
> +  =====================================
> +  cpus and cpu node bindings definition
> +  =====================================
> +
> +  If a Devicetree file is used to provide hardware data to the kernel,
> +  the RISC-V architecture requires the cpus and cpu nodes to be
> +  present and contain the properties described below.
> +
> +properties:
> +  $nodename:
> +    const: cpus
> +    description: Container of cpu nodes
> +
> +  '#address-cells':
> +    const: 1
> +    description: |
> +      A single unsigned 32-bit integer uniquely identifies
> +      each RISC-V hart in a system.  (See the "reg" node under
> +      the "cpu" node, below).
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  '^cpu@[0-9a-f]+$':
> +    properties:
> +      device_type:
> +        const: cpu
> +
> +      reg:
> +        maxItems: 1
> +        description: |
> +          Set the "reg" property to the hart ID of this CPU node.
> +          Each value in this property must be unique in the scope
> +          of the Devicetree file that contains it.
> +
> +      compatible:
> +        items:
> +          - const: riscv

Wrong order here. This should be last.

> +          - enum:
> +              - sifive,rocket0
> +              - sifive,e5
> +              - sifive,e51
> +              - sifive,u54-mc
> +              - sifive,u54
> +              - sifive,u5
> +        description: |
> +          Identifies that the hart uses the RISC-V instruction set
> +          and identifies the type of the hart.
> +
> +      mmu-type:
> +        items:
> +          - enum:

If a single value, then you can drop 'items'.

> +              - riscv,sv32
> +              - riscv,sv39
> +              - riscv,sv48
> +        description: |
> +          Identifies the MMU address translation mode used on this
> +          hart.  These values originate from the RISC-V Privileged
> +          Specification document, available from
> +          https://riscv.org/specifications/
> +
> +      riscv,isa:

This needs to have a $ref to a type schema. (Under an 'allOf' list
with this enum)

> +        items:
> +          - enum:

Also don't need items here if a single value.

> +              - rv64imac
> +              - rv64imafdc
> +        description: |
> +          Identifies the specific RISC-V instruction set architecture
> +          supported by the hart.  These are documented in the RISC-V
> +          User-Level ISA document, available from
> +          https://riscv.org/specifications/
> +
> +          The RISC-V Linux port only will execute on a subset of these

What Linux does isn't relevant to the binding.

> +          values.  However, other hart cores may be present in the
> +          Devicetree hardware description file that do not run Linux.
> +
> +      timebase-frequency:
> +        maxItems: 1

Not an array.

> +        description: |
> +          Specifies the clock frequency of the system timer in Hz.
> +          This value is common to all harts in this Linux system image.
> +
> +      i-cache-block-size:
> +        maxItems: 1

Not an array. Surely you can define either the set of possible values
or min/max values. Same comment on the rest of the cache props.

Are the cache attributes really not discoverable?

> +        description: |
> +          Specifies the size, in bytes, of an instruction cache line.
> +
> +      i-cache-sets:
> +        maxItems: 1
> +        description: |
> +          Specifies the number of sets in the hart's instruction cache.
> +
> +      i-cache-size:
> +        maxItems: 1
> +        description: |
> +          Specifies the size, in bytes, of the hart's instruction cache.
> +
> +      i-tlb-sets:
> +        maxItems: 1
> +        description: |
> +          Specifies the number of sets in the hart's instruction TLB.
> +          If present, the "tlb-split" property must be set.

'dependencies' can express this for you. We do need a core schema for
all these to define the type and maybe dependencies can be there.

> +
> +      i-tlb-size:
> +        maxItems: 1
> +        description: |
> +          Specifies the number of entries in the hart's instruction TLB.
> +          If present, the "tlb-split" property must be set.
> +
> +      d-cache-block-size:
> +        maxItems: 1
> +        description: |
> +          Specifies the size, in bytes, of a data cache line.
> +
> +      d-cache-sets:
> +        maxItems: 1
> +        description: |
> +          Specifies the number of sets in the hart's data cache.
> +
> +      d-cache-size:
> +        maxItems: 1
> +        description: |
> +          Specifies the size, in bytes, of the hart's data cache.
> +
> +      d-tlb-sets:
> +        maxItems: 1
> +        description: |
> +          Specifies the number of sets in the hart's data TLB.
> +          If present, the "tlb-split" property must be set.
> +
> +      d-tlb-size:
> +        maxItems: 1
> +        description: |
> +          Specifies the number of entries in the hart's data TLB.
> +          If present, the "tlb-split" property must be set.
> +
> +      tlb-split: true
> +
> +    patternProperties:
> +      '^interrupt-controller@[0-9a-f]+$':

No 'reg', so should not have a unit-address.

> +        properties:
> +          $nodename:

You don't need this as we just defined it above.

> +            const: interrupt-controller
> +            description: Describes the CPU's local interrupt controller
> +
> +          '#interrupt-cells':
> +            const: 1
> +
> +          compatible:
> +            const: riscv,cpu-intc
> +
> +          interrupt-controller: true
> +
> +        required:
> +          - '#interrupt-cells'
> +          - compatible
> +          - interrupt-controller
> +
> +    required:
> +      - device_type
> +      - reg
> +      - compatible
> +      - riscv,isa
> +      - timebase-frequency
> +
> +required:
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +examples:
> +  - |
> +    // Example 1: SiFive Freedom U540G Development Kit
> +    cpus {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        timebase-frequency = <1000000>;
> +        cpu@0 {
> +                clock-frequency = <0>;
> +                compatible = "sifive,rocket0", "riscv";
> +                device_type = "cpu";
> +                i-cache-block-size = <64>;
> +                i-cache-sets = <128>;
> +                i-cache-size = <16384>;
> +                reg = <0>;
> +                riscv,isa = "rv64imac";

> +                sifive,dtim = <&L8>;
> +                sifive,itim = <&L7>;

Not documented.

> +                status = "okay";

Don't show status in examples.

> +                L10: interrupt-controller {
> +                        #interrupt-cells = <1>;
> +                        compatible = "riscv,cpu-intc";
> +                        interrupt-controller;
> +                };
> +        };
> +        cpu@1 {
> +                clock-frequency = <0>;
> +                compatible = "sifive,rocket0", "riscv";
> +                d-cache-block-size = <64>;
> +                d-cache-sets = <64>;
> +                d-cache-size = <32768>;
> +                d-tlb-sets = <1>;
> +                d-tlb-size = <32>;
> +                device_type = "cpu";
> +                i-cache-block-size = <64>;
> +                i-cache-sets = <64>;
> +                i-cache-size = <32768>;
> +                i-tlb-sets = <1>;
> +                i-tlb-size = <32>;
> +                mmu-type = "riscv,sv39";
> +                reg = <1>;
> +                riscv,isa = "rv64imafdc";
> +                status = "okay";
> +                tlb-split;
> +                L13: interrupt-controller {
> +                        #interrupt-cells = <1>;
> +                        compatible = "riscv,cpu-intc";
> +                        interrupt-controller;
> +                };
> +        };
> +    };
> +
> +  - |
> +    // Example 2: Spike ISA Simulator with 1 Hart
> +    cpus {
> +            cpu@0 {
> +                    device_type = "cpu";
> +                    reg = <0>;
> +                    status = "okay";
> +                    compatible = "riscv";
> +                    riscv,isa = "rv64imafdc";
> +                    mmu-type = "riscv,sv48";
> +                    interrupt-controller {
> +                            #interrupt-cells = <1>;
> +                            interrupt-controller;
> +                            compatible = "riscv,cpu-intc";
> +                    };
> +            };
> +    };
> +...
> --
> 2.20.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
