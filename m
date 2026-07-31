Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29660C55174
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 20:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88VLwUi04bpFXjQQubVgFHEFNORqnPXV+ySKmAX961A=; b=GRFrXy9FXgbwzh
	mjudpMqsa1SO4NaUNNMqEp+fJVHHOfoyLtkKGA58hsVttUq/yxDJcXDN+CSGQfErBLz5v8tTCEMsO
	bmcccjAfnEtmZ+kgi3sEyvL5sk4YpWHMfIAVzJnarU5hjaG9T4Mw2zm3JzxRiRxsW8n3frICyjnsp
	4ioKe85lrqdgHEoHYc9uL2WmKA4bGTZWXa1FGuXanqXG4FDqdFGsrAKq3bqjrm74Td1CwSaDhHrln
	V0iBABz4V3exxdhffcG1/tS/91fTRjHmUO7NMiLZVOr8kBtYTkel6+qlMehOoCduO8BJpWIujJBpb
	AlL79yWbVRuwduqyKY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpti3-0000000DXZw-2Rrf;
	Fri, 31 Jul 2026 20:19:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpti2-0000000DXZh-0eT1
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jul 2026 20:19:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9462144017;
	Fri, 31 Jul 2026 20:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571FE1F00AC4;
	Fri, 31 Jul 2026 20:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529197;
	bh=gAqTgmb8nyHXOBE2Z+WAy2vf/nC7RaTwNiVzTEyUthM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VYi+Wf0tpE5oJ6sdlwlFvIHL5mE5R3eX1tXGXs6hQpPjdmIE6p801MKYyoGbRiAA2
	 uwQ5Az41PsZ7MSPlmY5BU81ClM/UOi+YXpqj+FQOzLJ+m3fDSvOznH9VLFXLYYuYvM
	 5kHkh6v5QJjsk5KeXqDWPKnVKe0XXriiin3BES5Wzhk4i7tvu+a5RgMxX6cbEgXllk
	 ime18CmGbSA+kJmCfKOXrIpEvVejG0mCpyG4f4+4eNmQpUeYmaP9qMe5dufOTpsI1t
	 Ba0tQ+mGnC0jtZjjnbMsfRMGFk+5Sz9GY/VIw7PZtkvyIqxKM3dJjiJxGg6gCFKHIY
	 N691LPdgdRPJQ==
Date: Fri, 31 Jul 2026 15:19:55 -0500
From: Rob Herring <robh@kernel.org>
To: Xing Loong <xing.xl.loong@gmail.com>
Cc: Jens Wiklander <jenswi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: firmware: add mbedtee,tee binding
Message-ID: <20260731201955.GA1585970-robh@kernel.org>
References: <20260720073558.799755-1-xing.xl.loong@gmail.com>
 <20260720073558.799755-3-xing.xl.loong@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260720073558.799755-3-xing.xl.loong@gmail.com>
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

On Mon, Jul 20, 2026 at 03:35:56PM +0800, Xing Loong wrote:
> MbedTEE is a Trusted Execution Environment for embedded
> systems (https://github.com/mbedtee). It communicates with
> the REE via shared-memory ring buffers using a fixed RPC
> protocol. Two platform configurations are supported:
> 
>   - ARM/AArch64 (TrustZone, SMC): two reserved-memory
>     regions (t2r-ring and t2r-shm) plus a GIC SPI edge
>     interrupt for TEE-to-REE notifications.
>   - RISC-V (IMSIC): three reserved-memory regions, adding
>     r2t-ring for REE-to-TEE command submissions; no
>     interrupts property (T2R notifications use IMSIC MSI
>     allocated at runtime).
> 
> Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
> ---
> Changes in v3:
> - Drop all phandle stub nodes from examples.
> - Remove redundant required: - interrupts from then branch.
> - Simplify title and description.
> 
> Changes in v2:
> - Fix DT binding review comments from Krzysztof Kozlowski:
>   - Drop $nodename, "YAML devicetree binding" wording, property descriptions
>   - Rename compatible string to mbedtee,tee
>   - Rename memory regions: rpc-t2r-ring -> t2r-ring, rpc-t2r-shm -> t2r-shm,
>     rpc-r2t-ring -> r2t-ring
>   - Add memory-region / memory-region-names to required
>   - Simplify allOf constraints (drop redundant else-branch items)
>   - Rewrite description to describe hardware/firmware, not the binding or driver
>   - Drop all irrelevant platform nodes (gic, cpus, reserved-memory)
>   - Add maxItems: 1 constraint to interrupts property (Sashiko AI review)
> 
> ---
> 
>  .../bindings/firmware/mbedtee,tee.yaml        | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
> 
> diff --git a/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml b/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
> new file mode 100644
> index 0000000..a8f1201
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/mbedtee,tee.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MbedTEE
> +
> +maintainers:
> +  - Xing Loong <xing.xl.loong@gmail.com>
> +
> +description: |
> +  MbedTEE is a Trusted Execution Environment for embedded systems.
> +  It communicates with the REE (Linux) via shared-memory ring
> +  buffers using a fixed RPC protocol.
> +
> +  We're using "mbedtee" as the vendor prefix for the open-source TEE
> +  project at https://github.com/mbedtee.
> +
> +  The REE and TEE CPUs sharing the RPC memory must be in a
> +  hardware-coherent domain.
> +
> +  Two or three reserved-memory regions are required:
> +    t2r-ring: ring buffer for TEE-to-REE notifications
> +    t2r-shm:  shared memory for TEE-to-REE RPC payloads
> +    r2t-ring: ring buffer for REE-to-TEE command submissions (RISC-V)

Put any details about specific properties with the property schema.

> +
> +  On ARM the transport uses SMC and a GIC SPI interrupt. On RISC-V
> +  the transport uses shared-memory rings and IMSIC MSI; the TEE
> +  polls r2t-ring for commands from the REE.
> +
> +properties:
> +  compatible:
> +    const: mbedtee,tee
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  msi-parent:
> +    maxItems: 1
> +
> +  memory-region:
> +    minItems: 2
> +    maxItems: 3
> +
> +  memory-region-names:
> +    minItems: 2
> +    maxItems: 3
> +    items:
> +      enum:
> +        - t2r-ring
> +        - t2r-shm
> +        - r2t-ring

Needs to define the order as sashiko points out. The order doesn't 
change, so it doesn't need to be defined in the if/then schemas.

> +
> +required:
> +  - compatible
> +  - memory-region
> +  - memory-region-names
> +
> +allOf:
> +  - if:
> +      required:
> +        - interrupts
> +    then:
> +      properties:
> +        msi-parent: false
> +        memory-region:
> +          maxItems: 2
> +        memory-region-names:
> +          items:
> +            - const: t2r-ring
> +            - const: t2r-shm

Just 'maxItems: 2'

> +    else:
> +      required:
> +        - msi-parent
> +      properties:
> +        interrupts: false
> +        memory-region:
> +          minItems: 3
> +        memory-region-names:
> +          items:
> +            - const: t2r-ring
> +            - const: t2r-shm
> +            - const: r2t-ring

Just 'minItems: 3'

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    firmware {
> +        mbedtee {
> +            compatible = "mbedtee,tee";
> +            interrupts = <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
> +            memory-region = <&t2r_ring>, <&t2r_shm>;
> +            memory-region-names = "t2r-ring", "t2r-shm";
> +        };
> +    };
> +
> +  - |
> +    firmware {
> +        mbedtee {
> +            compatible = "mbedtee,tee";
> +            msi-parent = <&imsic>;
> +            memory-region = <&t2r_ring>, <&t2r_shm>, <&r2t_ring>;
> +            memory-region-names = "t2r-ring", "t2r-shm", "r2t-ring";
> +        };
> +    };
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
