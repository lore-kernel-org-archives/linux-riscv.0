Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7347D2168E
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 15:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fo/DvVWWlylT6OEAUC3QepoMEAkMUywgaRVaZdWVDXs=; b=a/iMr+vojnm2go
	gzp9wHC6Ic7HpMAjPE389rs4/Ox8XyOcGdTaoBN0F3u1h82B78KnuuF2lQHTHFaU4l74F5dlCHpi8
	yGd+pd7pfFhEEcGVwfQbofcPomirIf+tPSCwmewdecD35xfvElChPrZI3lckpmbWWg7tSTrFWQJpI
	mBqf3Oy5nRMO9nxGFQjTaeLJ3iC3jsPYtqjxRxTrUivm5o0nrqrtMhRlRoqByu5vVzeudX17djW//
	nGOvvz9QRKbEmTaKv5N8wj3xh1cwJsIpuGtBLvCP8DnCPH60bfRHtbrWKYMFdslfNvvCVspkzIpQY
	ZMlXUcIAxuV95yMZJhzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRB0Z-00000008Bra-2u2m;
	Thu, 04 Dec 2025 15:12:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRB0X-00000008Br6-1fy9
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 15:12:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D436940C14;
	Thu,  4 Dec 2025 15:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7E1C4CEFB;
	Thu,  4 Dec 2025 15:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764861155;
	bh=xap9hMKElXF3lM5d2pcuAuy8O3M8YIywB5WH/5ZnJv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OF2GLE4j+Px8pD996+9fFa4BeuEbXKcxbklOo77AhPdwdMEelm09fPpn9HOAcAs5h
	 KZ0V761E+tkgmN8kPl/ULEfBicRtpTqvXdQ0r1CNSq89Th5MiRnlfv87Q8lK5V4+OD
	 69+eh1Eipu9r71FUMEz2QCEQh+YSZ70f6WkZqZihGq7CrkkiM7PwDISiM+OM7+RFhM
	 oaSkyl4mkgX5e7EqCrLVVZJAkerA6/kyrDSViAEL+TOeKUYgaNrfozAW/uY/mWerDj
	 6k+62vzUdwbJ4p1S6nz+CI08mTbZGyXTkZzr4ntHMbW/d3pd+VqH81/ebqJZ+vpTR7
	 f1StGB4NmevNQ==
Date: Thu, 4 Dec 2025 09:12:32 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Conor Dooley <conor@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>
Subject: Re: [PATCH v3 19/22] dt-bindings: riscv: Describe physical memory
 regions
Message-ID: <20251204151232.GA1394051-robh@kernel.org>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
 <20251113014656.2605447-20-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251113014656.2605447-20-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_071237_511511_7B4C1F88 
X-CRM114-Status: GOOD (  40.06  )
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

On Wed, Nov 12, 2025 at 05:45:32PM -0800, Samuel Holland wrote:
> Information about physical memory regions is needed by both the kernel
> and M-mode firmware. For example, the kernel needs to know about
> noncacheable aliases of cacheable memory in order to allocate coherent
> memory pages for DMA. M-mode firmware needs to know about those aliases
> so it can protect itself from lower-privileged software.
> 
> The RISC-V Privileged Architecture delegates the description of Physical
> Memory Attributes (PMAs) to the platform. On DT-based platforms, it
> makes sense to put this information in the devicetree.

I'm not sure how I feel about this. So here are my random thoughts on 
it.

I wonder if another arch may need something similar. I don't think 
arm64 ever would as aliases are not allowed. That may have happened on 
arm32, but that's all pretty mature at this point. I don't know about 
powerpc. I didn't find anything looking similar from a quick search.

Can this property go in the 'memory' nodes instead since the aliases are 
only for DRAM or main memory?

The /reserved-memory nodes you remove do look like an abuse of 
/reserved-memory.


Alternatively, I think you could solve this by using 3 address cells 
similar to how PCI bus bindings work.

memory {
	reg = <0x0 0x80000000 0x0 0x40000000>
	#address-cells = <3>;
	#size-cells = <2>;
	ranges = <PMA_foo 0x0 0x80000000 0x1 0x00000000 0x0 0x40000000>,
		...
}

So CPU address 0x1_00000000 maps to memory address 0x80000000 with 
attributes PMA_foo.

Not sure if you would have to change the dma-ranges in this case. I 
would think not.


> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
> Changes in v3:
>  - Split PMR_IS_ALIAS flag from PMR_ALIAS_MASK number
>  - Add "model" property to DT binding example to fix validation
> 
> Changes in v2:
>  - Remove references to Physical Address Width (no longer part of Smmpt)
>  - Remove special first entry from the list of physical memory regions
>  - Fix compatible string in DT binding example
> 
>  .../bindings/riscv/physical-memory.yaml       | 92 +++++++++++++++++++
>  include/dt-bindings/riscv/physical-memory.h   | 45 +++++++++
>  2 files changed, 137 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/physical-memory.yaml
>  create mode 100644 include/dt-bindings/riscv/physical-memory.h
> 
> diff --git a/Documentation/devicetree/bindings/riscv/physical-memory.yaml b/Documentation/devicetree/bindings/riscv/physical-memory.yaml
> new file mode 100644
> index 000000000000..8beaa588c71c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/physical-memory.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/physical-memory.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Physical Memory Regions
> +
> +maintainers:
> +  - Samuel Holland <samuel.holland@sifive.com>
> +
> +description:

You need a '>' for paragraphs.

> +  The RISC-V Privileged Architecture defines a number of Physical Memory
> +  Attributes (PMAs) which apply to a given region of memory. These include the
> +  types of accesses (read, write, execute, LR/SC, and/or AMO) allowed within
> +  a region, the supported access widths and alignments, the cacheability and
> +  coherence of the region, and whether or not accesses to the region may have
> +  side effects.
> +
> +  Some RISC-V platforms provide multiple physical address mappings for main
> +  memory or certain peripherals. Each alias of a region generally has different
> +  PMAs (e.g. cacheable vs non-cacheable), which allows software to dynamically
> +  select the PMAs for an access by referencing the corresponding alias.
> +

> +  On DT-based RISC-V platforms, this information is provided by the
> +  riscv,physical-memory-regions property of the root node.

That's kind of obvious. This document only applies to DT systems and the 
schema defines everything else you say.

> +
> +properties:
> +  $nodename:
> +    const: '/'
> +
> +  riscv,physical-memory-regions:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    description:
> +      Each table entry provides PMAs for a specific physical memory region,
> +      which must not overlap with any other table entry.
> +    minItems: 1
> +    maxItems: 256
> +    items:
> +      minItems: 4
> +      maxItems: 6
> +      additionalItems: true
> +      items:
> +        - description: CPU physical address (#address-cells)
> +        - description: >
> +            Size (#size-cells). For entry 0, if the size is zero, the size is
> +            assumed to be 2^(32 * #size-cells).
> +        - description: >
> +            Flags describing the most restrictive PMAs for any address within
> +            the region.
> +
> +            The least significant byte indicates the types of accesses allowed
> +            for this region. Note that a memory region may support a type of
> +            access (e.g. AMOs) even if the CPU does not.
> +
> +            The next byte describes the cacheability, coherence, idempotency,
> +            and ordering PMAs for this region. It also includes a flag to
> +            indicate that accesses to a region are unsafe and must be
> +            prohibited by software (for example using PMPs or Smmpt).
> +
> +            The third byte is reserved for future PMAs.
> +
> +            The most significant byte is the index of the lowest-numbered entry
> +            which this entry is an alias of, if any. Aliases need not be the
> +            same size, for example if a smaller memory region repeats within a
> +            larger alias.
> +        - description: Reserved for describing future PMAs
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/riscv/physical-memory.h>
> +
> +    / {
> +      compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
> +      model = "BeagleV Starlight Beta";
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      riscv,physical-memory-regions =
> +          <0x00 0x18000000 0x00 0x00020000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY) 0x0>,
> +          <0x00 0x18080000 0x00 0x00020000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY) 0x0>,
> +          <0x00 0x41000000 0x00 0x1f000000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY) 0x0>,
> +          <0x00 0x61000000 0x00 0x1f000000 (PMA_RWXA | PMA_NONCOHERENT_MEMORY | PMR_ALIAS(3)) 0x0>,
> +          <0x00 0x80000000 0x08 0x00000000 (PMA_RWXA | PMA_NONCOHERENT_MEMORY) 0x0>,
> +          <0x10 0x00000000 0x08 0x00000000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY | PMR_ALIAS(5)) 0x0>,
> +          <0x20 0x00000000 0x10 0x00000000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY) 0x0>,
> +          <0x30 0x00000000 0x10 0x00000000 (PMA_RWXA | PMA_NONCOHERENT_MEMORY | PMR_ALIAS(7)) 0x0>;
> +    };
> +
> +...
> diff --git a/include/dt-bindings/riscv/physical-memory.h b/include/dt-bindings/riscv/physical-memory.h
> new file mode 100644
> index 000000000000..d6ed8015c535
> --- /dev/null
> +++ b/include/dt-bindings/riscv/physical-memory.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef _DT_BINDINGS_RISCV_PHYSICAL_MEMORY_H
> +#define _DT_BINDINGS_RISCV_PHYSICAL_MEMORY_H
> +
> +#define PMA_READ			(1 << 0)
> +#define PMA_WRITE			(1 << 1)
> +#define PMA_EXECUTE			(1 << 2)
> +#define PMA_AMO_MASK			(3 << 4)
> +#define PMA_AMO_NONE			(0 << 4)
> +#define PMA_AMO_SWAP			(1 << 4)
> +#define PMA_AMO_LOGICAL			(2 << 4)
> +#define PMA_AMO_ARITHMETIC		(3 << 4)
> +#define PMA_RSRV_MASK			(3 << 6)
> +#define PMA_RSRV_NONE			(0 << 6)
> +#define PMA_RSRV_NON_EVENTUAL		(1 << 6)
> +#define PMA_RSRV_EVENTUAL		(2 << 6)
> +
> +#define PMA_RW				(PMA_READ | PMA_WRITE)
> +#define PMA_RWA				(PMA_RW | PMA_AMO_ARITHMETIC | PMA_RSRV_EVENTUAL)
> +#define PMA_RWX				(PMA_RW | PMA_EXECUTE)
> +#define PMA_RWXA			(PMA_RWA | PMA_EXECUTE)
> +
> +#define PMA_ORDER_MASK			(3 << 8)
> +#define PMA_ORDER_IO_RELAXED		(0 << 8)
> +#define PMA_ORDER_IO_STRONG		(1 << 8)
> +#define PMA_ORDER_MEMORY		(2 << 8)
> +#define PMA_READ_IDEMPOTENT		(1 << 10)
> +#define PMA_WRITE_IDEMPOTENT		(1 << 11)
> +#define PMA_CACHEABLE			(1 << 12)
> +#define PMA_COHERENT			(1 << 13)
> +
> +#define PMA_UNSAFE			(1 << 15)
> +
> +#define PMA_IO				(PMA_ORDER_IO_RELAXED)
> +#define PMA_NONCACHEABLE_MEMORY		(PMA_ORDER_MEMORY | PMA_READ_IDEMPOTENT | \
> +						PMA_WRITE_IDEMPOTENT)
> +#define PMA_NONCOHERENT_MEMORY		(PMA_NONCACHEABLE_MEMORY | PMA_CACHEABLE)
> +#define PMA_NORMAL_MEMORY		(PMA_NONCOHERENT_MEMORY | PMA_COHERENT)
> +
> +#define PMR_ALIAS_MASK			(0x7f << 24)
> +#define PMR_IS_ALIAS			(0x80 << 24)
> +#define PMR_ALIAS(n)			(PMR_IS_ALIAS | ((n) << 24))
> +
> +#endif /* _DT_BINDINGS_RISCV_PHYSICAL_MEMORY_H */
> -- 
> 2.47.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
