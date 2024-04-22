Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023C5C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 14:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yWL8DBHx0iQuMgaIQxcrFCGQYerFteOIA4ID2EKLVZ0=; b=3vrD04B6j9EmL5
	M1zpZInHZCpOd3lB8k33Z6c+PlKbbWdCMlmG7P7Y4q/r0ulXB5pfvrojYhqheY9pY+D1uLk9bhEN3
	5/ZPfg1UTEJSqWcM0BJMMmXWeAO8XPM9RI4taXpmNoOLPJk/sn4eWiWSNb3tqLtP0OIFIUscrnnij
	6kBPEyQD+aiAeDgfgY+auzS5VruCXF4YjGHQVn4PLuqBS5MysvlpO9aBxo2QpOVgnTa+6GFAcB1X8
	leIxszeaD3rmQqqPgyJAevH0/lwVUi0U6OlNb+lPHtjFPc/qqiCbG8RMlXh3jjaqEH71G9jN+0L7J
	qHkFMSUP63lOaUNh1Pwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryuHX-0000000Dqwt-27Lw;
	Mon, 22 Apr 2024 14:04:31 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryuHQ-0000000Dqtv-30ZV
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 14:04:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1F1AFCE0A38;
	Mon, 22 Apr 2024 14:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85E4C32781;
	Mon, 22 Apr 2024 14:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713794658;
	bh=6S2xDWTRnzyPkq2E+nBY5AiINL0m8wq/LI6ka+0jqfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=feAlIGVkuaoRq7hj5iefuaj7ZYPf3feZg5AOcaLs3V/HNbwPFl0zvPaN7B5LwVyj3
	 5d2uCBrJDhE8MbYj/b60uGmST/OIqOwZKbijoOBRrWf1D4gtYw1y83NKMdaq8x/s40
	 c+M/EeuRU2NIfITCWIhKw4rv55aME6HNDFmsBN90c1jbkvkUlL5vN05gJpFrMc4ycd
	 FbeKtdhdTIOHkA2CJFdEsb4DFfV1+whzH400oogS34PRRn7EZzwQYiixQ1qRrHlHRU
	 xJRkdLPRhrNM1G/feJks1/AjDJ2y02Lo6hABykjBf/ghONntAHPRy7kR5OFv05ntTm
	 hiZTIqyyf/lgA==
Date: Mon, 22 Apr 2024 09:04:15 -0500
From: Rob Herring <robh@kernel.org>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: iommu: riscv: Add bindings for
 RISC-V IOMMU
Message-ID: <20240422140415.GA1139322-robh@kernel.org>
References: <cover.1713456597.git.tjeznach@rivosinc.com>
 <c37cb93e7baa7042a3f82130bf30be6831b558dc.1713456598.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c37cb93e7baa7042a3f82130bf30be6831b558dc.1713456598.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_070425_174678_FC374E06 
X-CRM114-Status: GOOD (  19.64  )
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

On Thu, Apr 18, 2024 at 09:32:19AM -0700, Tomasz Jeznach wrote:
> Add bindings for the RISC-V IOMMU device drivers.
> 
> Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> ---
>  .../bindings/iommu/riscv,iommu.yaml           | 149 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 156 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> new file mode 100644
> index 000000000000..d6522ddd43fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> @@ -0,0 +1,149 @@
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
> +description: |+
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
> +          - const: riscv,pci-iommu
> +          - const: pci1efd,edf1

Given the PCI compatible string is a specific vendor and device, it is 
more specific than "riscv,pci-iommu" and should come first.

> +      - items:
> +          - const: pci1efd,edf1

Why do you need to support this without riscv,pci-iommu?

> +      - items:
> +          - const: riscv,iommu

I agree with what Conor said on this.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
