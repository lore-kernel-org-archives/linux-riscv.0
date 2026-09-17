Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E69C88E72
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQjAuU/MBa8pkYmryEvSDcwN0Vdi94rl/OxuGz0gkU4=; b=v9VmXUa0pXxuNh
	vIqtd9Wh5+VcMVaXdQnQ24lAYvqcSEX4Ri/JNqvNgGKp4w7Z5LtZ/dnfj7IcBid3ISnmbS4VC1YqF
	UxEYbMk6MRdSZlQohjNEKwXq7jcgGotu10J3LmMurWRZPmtA8/lPgQNJzbMW4vzgHxtGuHGdZ4bCK
	mpRwt7sQ6qz2QGmdWfhtZIHRgRW0jYvKvrs09rcvFa72VPEaZjMVvn/ZJlvRFqngIIBtjk25p9pyJ
	d7cB7tuM6NxX6lCervvRjrs2uECXkqYAD4ISTzbW7BMi53DKE88ZCRtZhPQFJDHCtU/Blh69QUHYH
	l6hxdpAEJXke13gnnmPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EZf-0000000Bnxg-43Pz;
	Thu, 17 Sep 2026 16:02:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EZd-0000000Bnwb-3QW7;
	Thu, 17 Sep 2026 16:02:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 676491476;
	Thu, 17 Sep 2026 09:02:52 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0676E3F7B4;
	Thu, 17 Sep 2026 09:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789660976; bh=oTSpkmkdrCN17NbG/BBwkxPXVynnbNeoywXS03zePeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2fxmt5n7wqW8D4QzBKWm8vc57hZzAXsLdw9Jtmn7fDwYuUkUjAjjz0iYC6XiR0tu
	 9uTMew8t9VAK7rJOxWX62e/iXJau/fZJ5mkD/AXyBAM4cL0DOiEE+aa31dFygWVPu6
	 NIHL5WfGiIh7klKkEub7eNcTGfyNDO5DXPYwmJRI=
Date: Thu, 17 Sep 2026 17:02:48 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v4 3/5] dma: swiotlb: Centralize memory-encryption pool
 sizing
Message-ID: <aqwPKO80ZEn0cqa7@arm.com>
References: <20260914070135.313337-1-aneesh.kumar@kernel.org>
 <20260914070135.313337-4-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914070135.313337-4-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_090257_931819_14EB26CB 
X-CRM114-Status: GOOD (  19.02  )
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

On Mon, Sep 14, 2026 at 12:31:32PM +0530, Aneesh Kumar K.V (Arm) wrote:
> +/**
> + * swiotlb_adjusted_size() - get the prospective adjusted SWIOTLB size
> + *
> + * Return the size that confidential-computing guest sizing would select for
> + * the default pool, without changing the configured SWIOTLB size. An
> + * explicit swiotlb= size is always preserved. An explicit area count is
> + * included in the size calculation. Automatic area sizing is initialized
> + * later from the running kernel's possible CPU map and any resulting size
> + * adjustment is therefore not reflected in the returned size.
> + */
> +unsigned long __init swiotlb_adjusted_size(void)
> +{
> +	unsigned long nslabs, size = swiotlb_size_or_default();
> +
> +	if (swiotlb_default_size_changed() ||
> +	    !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
> +		return size;
> +	/*
> +	 * For SEV and TDX and CCA, all DMA has to occur via
> +	 * shared/unencrypted pages. Kernel uses SWIOTLB to make this
> +	 * happen without changing device drivers. However, depending on
> +	 * the workload being run, the default 64MB of SWIOTLB may not be
> +	 * enough and SWIOTLB may run out of buffers for DMA, resulting in
> +	 * I/O errors and/or performance degradation especially with high
> +	 * I/O workloads.
> +	 *
> +	 * Adjust the default size of SWIOTLB using a percentage of guest
> +	 * memory for SWIOTLB buffers. Also, as the SWIOTLB bounce buffer
> +	 * memory is allocated from low memory, ensure that the adjusted
> +	 * size is within the limits of low available memory.

Nit: if SWIOTLB_ANY is passed, do we still allocate only from low
memory? I think this comment made sense on x86 but it's not valid for
s390, pseries with the changes so far.

Otherwise:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
