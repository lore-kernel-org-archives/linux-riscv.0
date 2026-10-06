Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A314CA5FFC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 21:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUETXb5dND1hhiH7AnrcVWhaFNHZ38LTKQPvTlXi7j4=; b=HAqD1SgLoVKDgq
	EjiaDRhtA6LtpNIc2c7y+Qyl5x23VNX3veJdAJemZsB/BU+dlcz/ae0KIE9eYjJ+xNUFy3ATbtgBU
	HopLsXgvMFwSkLobJjhu8Q9NFxOJn9EmFc++hczRXR9gbh7kgukuLOztJSBvz1ST+6J0rpY/MtPnd
	17cZMVGqxm493oCtvgYIHA0mnAhAvBMpVBf3YfWXvCGpgm9P3WrSTylwzZdto01jIzW42p2/gBnjU
	A+KkyZbLKXmqIMCSqqGJTFvRLfpetoR8nzR+21q0I0vfBX2/gvW7dTjDG0vFSR44KsSPFfOKcESGu
	tdmpAOnzBQmc9JC+oZWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xED2U-00000001QEi-1LLj;
	Tue, 06 Oct 2026 21:49:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xED2S-00000001QEW-1sDi;
	Tue, 06 Oct 2026 21:49:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B2D5601FE;
	Tue,  6 Oct 2026 21:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873651F0089B;
	Tue,  6 Oct 2026 21:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791323371;
	bh=MR/kKzdKUbRbxIo5AlBnzLpoRKt6DdnYtuH9HxT5rZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z+T8EQwQfcC4Dsl0rfHAy7DAr3ckjnc55xRY9k8ihf2V06by9utsJIUbvm4QE+qHR
	 QKdcDlyOBwe3F4rGUU5EdOvz65Jgt+VzWFiWaBtahe3bL5n/K61Ms7q595gvqrDB72
	 Ez27iKZ/SQ1f/FuWmqqDU3Guw4kpQZ2aiSIWeXp3/Fi2cDErexzgESkZmUkPWv20Vo
	 49yv64pLvV9ZDzsc7eMwgznEKqg8QdJ8I29J3N+TnSgVCEcytw3htWHfNzQjfFCe5P
	 LSItfvLQ9ixCWlP4yZR7plvTFG2lBxy8cZ/+eIE5upXhl7h44DyChdW/rFTzCXyyRz
	 k1f+1HOXPJh8g==
Date: Tue, 6 Oct 2026 22:49:17 +0100
From: Will Deacon <will@kernel.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v6 6/8] dma: swiotlb: Centralize memory-encryption pool
 sizing
Message-ID: <asVs3doaJ4WrT3M2@willie-the-truck>
References: <20260924060756.1325156-1-aneesh.kumar@kernel.org>
 <20260924060756.1325156-7-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924060756.1325156-7-aneesh.kumar@kernel.org>
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

On Thu, Sep 24, 2026 at 11:37:54AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Memory-encrypted guests use shared or unencrypted memory for DMA and may
> route all DMA through SWIOTLB. The default pool can therefore be too
> small for I/O-intensive workloads.
> 
> Move the existing x86 guest-sizing policy into the SWIOTLB core. For
> SWIOTLB_POOL_CC_GUEST, size the pool to 6% of guest memory, clamped
> between the normal default and 1 GiB. Preserve an explicit swiotlb=
> size.
> 
> Host memory encryption still selects a normal-sized shared pool and
> does not use the guest-sizing policy.
> 
> A restricted DMA pool already provides shared bounce buffers for its
> devices. Record its presence during reserved-memory initialization and
> do not select the confidential-guest default-pool policy solely because
> guest memory encryption is active.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/x86/mm/mem_encrypt.c | 24 ------------------------
>  kernel/dma/swiotlb.c      | 27 +++++++++++++++++++++++++--
>  2 files changed, 25 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
> index 95bae74fdab2..912f22ca838f 100644
> --- a/arch/x86/mm/mem_encrypt.c
> +++ b/arch/x86/mm/mem_encrypt.c
> @@ -101,9 +101,6 @@ void __init mem_encrypt_init(void)
>  
>  void __init mem_encrypt_setup_arch(void)
>  {
> -	phys_addr_t total_mem = memblock_phys_mem_size();
> -	unsigned long size;
> -
>  	/*
>  	 * Do RMP table fixups after the e820 tables have been setup by
>  	 * e820__memory_setup().
> @@ -114,27 +111,6 @@ void __init mem_encrypt_setup_arch(void)
>  	if (!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
>  		return;
>  
> -	/*
> -	 * For SEV and TDX, all DMA has to occur via shared/unencrypted pages.
> -	 * Kernel uses SWIOTLB to make this happen without changing device
> -	 * drivers. However, depending on the workload being run, the
> -	 * default 64MB of SWIOTLB may not be enough and SWIOTLB may
> -	 * run out of buffers for DMA, resulting in I/O errors and/or
> -	 * performance degradation especially with high I/O workloads.
> -	 *
> -	 * Adjust the default size of SWIOTLB using a percentage of guest
> -	 * memory for SWIOTLB buffers. Also, as the SWIOTLB bounce buffer
> -	 * memory is allocated from low memory, ensure that the adjusted size
> -	 * is within the limits of low available memory.
> -	 *
> -	 * The percentage of guest memory used here for SWIOTLB buffers
> -	 * is more of an approximation of the static adjustment which
> -	 * 64MB for <1G, and ~128M to 256M for 1G-to-4G, i.e., the 6%
> -	 */
> -	size = total_mem * 6 / 100;
> -	size = clamp_val(size, IO_TLB_DEFAULT_SIZE, SZ_1G);
> -	swiotlb_adjust_size(size);
> -
>  	/* Set restricted memory access for virtio. */
>  	virtio_set_mem_acc_cb(virtio_require_restricted_mem_acc);
>  }
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 75ee63cd354e..e626cca63ad1 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -33,6 +33,7 @@
>  #include <linux/kmsan-checks.h>
>  #include <linux/iommu-helper.h>
>  #include <linux/init.h>
> +#include <linux/math64.h>
>  #include <linux/memblock.h>
>  #include <linux/mm.h>
>  #include <linux/pfn.h>
> @@ -80,6 +81,7 @@ struct io_tlb_slot {
>  
>  static bool swiotlb_force_bounce;
>  static bool swiotlb_force_disable;
> +static bool restricted_dma_pool_present __initdata;
>  
>  enum swiotlb_pool_policy {
>  	SWIOTLB_POOL_NONE,
> @@ -478,7 +480,25 @@ swiotlb_adjust_pool_size(enum swiotlb_pool_policy policy)
>  		size = min(swiotlb_default_pool_size(), size);
>  		break;
>  	case SWIOTLB_POOL_CC_GUEST:
> -		return;
> +		/*
> +		 * For SEV and TDX and CCA, all DMA has to occur via
> +		 * shared/unencrypted pages. Kernel uses SWIOTLB to make this
> +		 * happen without changing device drivers. However, depending on
> +		 * the workload being run, the default 64MB of SWIOTLB may not be
> +		 * enough and SWIOTLB may run out of buffers for DMA, resulting in
> +		 * I/O errors and/or performance degradation especially with high
> +		 * I/O workloads.
> +		 *
> +		 * Adjust the default size of SWIOTLB using a percentage of guest
> +		 * memory for SWIOTLB buffers.
> +		 *
> +		 * The percentage of guest memory used here for SWIOTLB buffers is
> +		 * more of an approximation of the static adjustment which 64MB for
> +		 * <1G, and ~128M to 256M for 1G-to-4G, i.e., the 6%
> +		 */
> +		size = div_u64((u64)memblock_phys_mem_size() * 6, 100);
> +		size = clamp_val(size, IO_TLB_DEFAULT_SIZE, SZ_1G);
> +		break;
>  	case SWIOTLB_POOL_NONE:
>  		WARN(true, "Cannot adjust SWIOTLB size without a pool\n");
>  		return;
> @@ -496,7 +516,8 @@ swiotlb_select_pool_policy(unsigned int flags)
>  	if (swiotlb_force_disable)
>  		return SWIOTLB_POOL_NONE;
>  
> -	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
> +	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
> +	    !restricted_dma_pool_present)
>  		return SWIOTLB_POOL_CC_GUEST;

I think this check on the restricted DMA pool is too general -- the pool
could be tied to a specific DMA-capable peripheral and so treating its
presence as a global property isn't right.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
