Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8537FC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 13:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8XpY0E6Fv/0FVZm7xaG/rSLzFJjqsbIqMdZxk++V71M=; b=0QmkIid5FSMstY
	tYXmeUtmLAXzE8wsIkRLwmmiqGhO9j5O9pHMckmX4axOSG5BLk0ZtyufCaEa0uZ98EgJbuspR+kiL
	SOmJW4nYtCx6IQMRI27+2s2akXQnpMl/jUmICVogLun6Ky7RGPx6Ls7OpxykSjzBhMMTWAkF1eiR/
	nbk5LkAbUZOGWN95uaHEBJM3xrItajl2Pw3+gmRCxS8Tni6YaaJwGXFAst18lOvJadGdo7rm6R8Tq
	503MH6PhoTw9thCOc//S6eemMtv9QJ7tdy0XrTsXnVY/TsChw0du9DKieJ4Ug2Uk4tIpFOeE755g8
	tcy7vSwaXO7JM+YUlKUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s29oc-00000009ewl-45N7;
	Wed, 01 May 2024 13:16:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s29oY-00000009evw-2x8V
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 13:16:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E4A07CE1296;
	Wed,  1 May 2024 13:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB29CC113CC;
	Wed,  1 May 2024 13:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714569358;
	bh=SMu5/M35r01oC6tcgA4Z1ZBtXBnVinplRgHwFdbOwr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pm4Q5Ph39GLGiVEE/QaDTi0gKuPAeN1O01XoJX9DrPoh2dcDynVlEYEFGEEAky2IJ
	 +8IyRM5ala3q6kWdwMTZMZIxtkRDAHMA8p7etduck+xjB94Gxpl/vd6SPNWWAzjy7y
	 +IVTDaPtcTR6A6cQlo7qghD5ImdJQIRcMfHH5exIXa49WToCQ0DRaoWpjke7rgmckT
	 8F+tL1/aXnzlKttsx7LTYw6N5lzfFHGSmof+YEpD0hkn3pCS7etdkF3VBMXb8lOOdM
	 lkmXKNZ9nuwa4qvP3uLt0MRt19ovJ4ZA5MYS5ca8rWDSap3x3ie62ODZgoWLbVDJEx
	 IAwqlVdKFC+1Q==
Date: Wed, 1 May 2024 08:15:56 -0500
From: Rob Herring <robh@kernel.org>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: iommu: riscv: Add bindings for
 RISC-V IOMMU
Message-ID: <20240501131556.GA2931109-robh@kernel.org>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
 <ef946892252b18f541986a461fc4d37957cc805e.1714494653.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef946892252b18f541986a461fc4d37957cc805e.1714494653.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_061603_140271_EC90EF57 
X-CRM114-Status: GOOD (  26.63  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 30, 2024 at 01:01:51PM -0700, Tomasz Jeznach wrote:
> Add bindings for the RISC-V IOMMU device drivers.
> 
> Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> ---
>  .../bindings/iommu/riscv,iommu.yaml           | 150 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 157 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> new file mode 100644
> index 000000000000..16817525e157
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> @@ -0,0 +1,150 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/riscv,iommu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V IOMMU Architecture Implementation
> +
> +maintainers:
> +  - Tomasz Jeznach <tjeznach@rivosinc.com>
> +
> +description: |
> +  The RISC-V IOMMU provides memory address translation and isolation for
> +  input and output devices, supporting per-device translation context,
> +  shared process address spaces including the ATS and PRI components of
> +  the PCIe specification, two stage address translation and MSI remapping.
> +  It supports identical translation table format to the RISC-V address
> +  translation tables with page level access and protection attributes.
> +  Hardware uses in-memory command and fault reporting queues with wired
> +  interrupt or MSI notifications.
> +
> +  Visit https://github.com/riscv-non-isa/riscv-iommu for more details.
> +
> +  For information on assigning RISC-V IOMMU to its peripheral devices,
> +  see generic IOMMU bindings.
> +
> +properties:
> +  # For PCIe IOMMU hardware compatible property should contain the vendor
> +  # and device ID according to the PCI Bus Binding specification.
> +  # Since PCI provides built-in identification methods, compatible is not
> +  # actually required. For non-PCIe hardware implementations 'riscv,iommu'
> +  # should be specified along with 'reg' property providing MMIO location.
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qemu,iommu

'qemu,iommu' is too broad. Could be other QEMU implementations of an 
IOMMU. So 'qemu,riscv-iommu'.


> +          - const: riscv,iommu
> +      - items:
> +          - enum:
> +              - pci1efd,edf1
> +          - const: riscv,pci-iommu
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      For non-PCI devices this represents base address and size of for the
> +      IOMMU memory mapped registers interface.
> +      For PCI IOMMU hardware implementation this should represent an address
> +      of the IOMMU, as defined in the PCI Bus Binding reference. The reg
> +      property is a five-cell address encoded as (phys.hi phys.mid phys.lo
> +      size.hi size.lo), where phys.hi should contain the device's BDF as
> +      0b00000000 bbbbbbbb dddddfff 00000000. The other cells should be zero.

No need to describe what the PCI address looks like.

> +
> +  '#iommu-cells':
> +    const: 1
> +    description:
> +      Has to be one. The single cell describes the requester id emitted

Drop 'Has to be one'. You already said that with the schema.

> +      by a master to the IOMMU.
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 4
> +    description:
> +      Wired interrupt vectors available for RISC-V IOMMU to notify the
> +      RISC-V HARTS. The cause to interrupt vector is software defined
> +      using IVEC IOMMU register.
> +
> +  msi-parent: true
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#iommu-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |+
> +    /* Example 1 (IOMMU device with wired interrupts) */
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    iommu1: iommu@1bccd000 {
> +        compatible = "qemu,iommu", "riscv,iommu";
> +        reg = <0x1bccd000 0x1000>;
> +        interrupt-parent = <&aplic_smode>;
> +        interrupts = <32 IRQ_TYPE_LEVEL_HIGH>,
> +                     <33 IRQ_TYPE_LEVEL_HIGH>,
> +                     <34 IRQ_TYPE_LEVEL_HIGH>,
> +                     <35 IRQ_TYPE_LEVEL_HIGH>;
> +        #iommu-cells = <1>;
> +    };
> +
> +    /* Device with two IOMMU device IDs, 0 and 7 */
> +    master1 {
> +        iommus = <&iommu1 0>, <&iommu1 7>;
> +    };
> +
> +  - |+
> +    /* Example 2 (IOMMU device with shared wired interrupt) */
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    iommu2: iommu@1bccd000 {
> +        compatible = "qemu,iommu", "riscv,iommu";
> +        reg = <0x1bccd000 0x1000>;
> +        interrupt-parent = <&aplic_smode>;
> +        interrupts = <32 IRQ_TYPE_LEVEL_HIGH>;
> +        #iommu-cells = <1>;
> +    };
> +
> +  - |+
> +    /* Example 3 (IOMMU device with MSIs) */
> +    iommu3: iommu@1bcdd000 {
> +        compatible = "qemu,iommu", "riscv,iommu";
> +        reg = <0x1bccd000 0x1000>;
> +        msi-parent = <&imsics_smode>;
> +        #iommu-cells = <1>;
> +    };
> +
> +  - |+
> +    /* Example 4 (IOMMU PCIe device with MSIs) */
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        pcie@30000000 {
> +            device_type = "pci";
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +            reg = <0x0 0x30000000  0x0 0x1000000>;
> +            ranges = <0x02000000 0x0 0x41000000  0x0 0x41000000  0x0 0x0f000000>;
> +
> +            /*
> +             * The IOMMU manages all functions in this PCI domain except
> +             * itself. Omit BDF 00:01.0.
> +             */
> +            iommu-map = <0x0 &iommu0 0x0 0x8
> +                         0x9 &iommu0 0x9 0xfff7>;

Bracket each entry.

> +
> +            /* The IOMMU programming interface uses slot 00:01.0 */
> +            iommu0: iommu@1,0 {
> +               compatible = "pci1efd,edf1", "riscv,pci-iommu";
> +               reg = <0x800 0 0 0 0>;
> +               #iommu-cells = <1>;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f6dc90559341..7fcf7c27ef6b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18958,6 +18958,13 @@ F:	arch/riscv/
>  N:	riscv
>  K:	riscv
>  
> +RISC-V IOMMU
> +M:	Tomasz Jeznach <tjeznach@rivosinc.com>
> +L:	iommu@lists.linux.dev
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> +
>  RISC-V MICROCHIP FPGA SUPPORT
>  M:	Conor Dooley <conor.dooley@microchip.com>
>  M:	Daire McNamara <daire.mcnamara@microchip.com>
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
