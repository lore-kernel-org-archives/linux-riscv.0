Return-Path: <SRS0=VDpU=PF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780CFC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Oct 2021 09:29:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DE7661054
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Oct 2021 09:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DE7661054
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MP2mu2Kwm/rBcL6W+VjgEgv3GXYpleUUU8dtaNk8dOM=; b=A++F2wzP/pQgKKZDIF7RZQCuj2
	uvy+EkBQN4xGYFvm/+fyooHl/kO4UUW03ncGU+vzqePekYaG+yPUrsJRBkv05fPzNTX6uL5qw+x9k
	F1sv7fY8BHcxuG1HWlbos24E2yCSPgWMJAF+auREK88+G5B4Th5hWhuJMl3g//EUOaCmwTGHaNKns
	hczC/C12rlUVNzDuisBCnO8GkzmYnVI9U6Wz810CLOZcQf2Hws3MwpDVQlck/G77WA5ZumciObjjX
	2pk+uDDt7OY1pvHZJTJ0/yU7EDdUNd7hRGIHK5ZrXNVT0cpRu+B11rmeKtoLJAQZ/74UGH3xguBCf
	P8oIqrGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mc2TP-00C0c6-Mq; Sun, 17 Oct 2021 09:28:55 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mc2TM-00C0bG-4g
 for linux-riscv@lists.infradead.org; Sun, 17 Oct 2021 09:28:54 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso4902624pjw.2
 for <linux-riscv@lists.infradead.org>; Sun, 17 Oct 2021 02:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Zckkg7i6fpTJnyCOdLnyCwKFogWHdVLdroKWU5ciMBY=;
 b=axYoUktmdmPc6ek4VHOiNwvSFA1tdRWsqSrN7Aae4W60STLps/E9sv0mkP5cgIMyvk
 f/4HMDRiwYzn1QZn6qdn1kezf0yDiWdT9mMp0DenCnxAIaE+5ymPGxZ1PV0/ty0eDIh9
 83lYFoFUYNS2Dy4Y5iUusjqmIZzUZ+lSQnx7pANn/UpSaGwAEYWSwUjF1i1TA+8Bn3aq
 IsdEnx6TP5XnKnLm57DJYh/kvnpEe/lTWf5w4QQU+HRbw6GhRKG7BRbqnRI96b6Vg+E+
 nMALL0ROjhMjrpjfpBWR7iXXlzoUWPvFPpjVtql8jGy8/ByGpgui2OW/G7A4JmzKtDBO
 +HdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=Zckkg7i6fpTJnyCOdLnyCwKFogWHdVLdroKWU5ciMBY=;
 b=Y+58+IWjG+sId3rjXkrF4DPnucW+gxyGqQMI2PYq5/6KXtfabKdiacTSPCyvwtWmqH
 CmY20uOzN3CVR0CiMZgpTbNdGS8FZrZ8YEI/pNAXJB160/sydUm4GPf2f3sY5zctKTWu
 q1pe6mBy/Ub/5T0a6vkS+v2hD8uE09hNgtlfxdynzV8WRvBqqorYVuEYyvlUiTzXxgWv
 Roe/3MdGW5U8ZPtg+u97xFU5dN6OMaB0ZsjtIptM/sWdreix3ib1+5iXgPXn5wp8okpm
 oudbPMKmgVdt3Xxzflq8i0SFxqry8d8huLiDMuK54S2bb94EVUelkH+AZgpNwlEBeVwg
 mtdw==
X-Gm-Message-State: AOAM533Yb2oGLCgaRPlHr+v1xI3tUdxJ7AjPjrNyVbcvb5PihPCY1DTf
 a+lrsBvNLC6QI94BBkxRX00=
X-Google-Smtp-Source: ABdhPJyfyuhEH5zuQj+e/g0YyKlBHRwPuPJo+e7hp/vWSliaz3JhD6HUEGq5FV/D1LL9DgiSTb5Nvg==
X-Received: by 2002:a17:902:82cb:b0:13f:99af:921d with SMTP id
 u11-20020a17090282cb00b0013f99af921dmr10110025plz.79.1634462930677; 
 Sun, 17 Oct 2021 02:28:50 -0700 (PDT)
Received: from [0.0.0.0] ([2604:a880:1:20::1f:7001])
 by smtp.gmail.com with ESMTPSA id u3sm9659658pfl.155.2021.10.17.02.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 02:28:50 -0700 (PDT)
Subject: Re: [RFC PATCH v2 07/11] riscv: cmo: Add dma-noncoherency support
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, drew@beagleboard.org,
 liush@allwinnertech.com, lazyparser@gmail.com, wefu@redhat.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>, Christoph Hellwig <hch@lst.de>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-11-git-send-email-guoren@kernel.org>
From: twd2 <twd2.me@gmail.com>
Message-ID: <e926ec8a-e993-da89-3c8b-0c59272f1751@gmail.com>
Date: Sun, 17 Oct 2021 17:28:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1622970249-50770-11-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_022852_243265_599D4A1A 
X-CRM114-Status: GOOD (  31.98  )
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


On 2021/6/6 17:04, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> To support DMA device in a non-coherent interconnect SOC system,
> we need the below facilities:
>  - Changing a virtual memory mapping region attributes from
>    cacheable to noncache + strong order which used in DMA
>    descriptors.
>  - Add noncache + weakorder virtual memory attributes for dma
>    mapping.
>  - Syncing the cache with memory before DMA start and after DMA
>    end with vendor custom CMO instructions.
>
> This patch enables linux kernel generic dma-noncoherency
> infrastructure and introduces new sbi_ecall API for dma_sync.
>
> @@ -27,6 +27,7 @@ enum sbi_ext_id {
> +       SBI_EXT_DMA = 0xAB150401,
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Drew Fustini <drew@beagleboard.org>
> Cc: Wei Fu <wefu@redhat.com>
> Cc: Wei Wu <lazyparser@gmail.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Maxime Ripard <maxime@cerno.tech>
> ---
>  arch/riscv/Kconfig               |  5 ++++
>  arch/riscv/include/asm/pgtable.h | 26 ++++++++++++++++++++
>  arch/riscv/include/asm/sbi.h     | 15 ++++++++++++
>  arch/riscv/kernel/sbi.c          | 19 ++++++++++++++
>  arch/riscv/mm/Makefile           |  1 +
>  arch/riscv/mm/dma-mapping.c      | 53 ++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 119 insertions(+)
>  create mode 100644 arch/riscv/mm/dma-mapping.c
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 05c4976..817a9bb 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -20,6 +20,10 @@ config RISCV
>  	select ARCH_HAS_DEBUG_VM_PGTABLE
>  	select ARCH_HAS_DEBUG_VIRTUAL if MMU
>  	select ARCH_HAS_DEBUG_WX
> +	select ARCH_HAS_DMA_PREP_COHERENT
> +	select ARCH_HAS_SYNC_DMA_FOR_CPU
> +	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> +	select ARCH_HAS_DMA_WRITE_COMBINE
>  	select ARCH_HAS_FORTIFY_SOURCE
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_GIGANTIC_PAGE
> @@ -43,6 +47,7 @@ config RISCV
>  	select CLONE_BACKWARDS
>  	select CLINT_TIMER if !MMU
>  	select COMMON_CLK
> +	select DMA_DIRECT_REMAP
>  	select EDAC_SUPPORT
>  	select GENERIC_ARCH_TOPOLOGY if SMP
>  	select GENERIC_ATOMIC64 if !64BIT
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 6ddeb49..e1a82b6 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -462,6 +462,32 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>  	return ptep_test_and_clear_young(vma, address, ptep);
>  }
>  
> +#define pgprot_noncached pgprot_noncached
> +static inline pgprot_t pgprot_noncached(pgprot_t _prot)
> +{
> +	unsigned long prot = pgprot_val(_prot);
> +
> +	prot &= ~_PAGE_DMA_MASK;
> +	prot |= _PAGE_DMA_IO;
> +
> +	return __pgprot(prot);
> +}
> +
> +#define pgprot_writecombine pgprot_writecombine
> +static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
> +{
> +	unsigned long prot = pgprot_val(_prot);
> +
> +	prot &= ~_PAGE_DMA_MASK;
> +	prot |= _PAGE_DMA_WC;
> +
> +	return __pgprot(prot);
> +}
> +
> +#define __HAVE_PHYS_MEM_ACCESS_PROT
> +extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
> +				     unsigned long size, pgprot_t vma_prot);
> +
>  /*
>   * Encode and decode a swap entry
>   *
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 0d42693..133e88a 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -27,6 +27,7 @@ enum sbi_ext_id {
>  	SBI_EXT_IPI = 0x735049,
>  	SBI_EXT_RFENCE = 0x52464E43,
>  	SBI_EXT_HSM = 0x48534D,
> +	SBI_EXT_DMA = 0xAB150401,
>  };
>  
>  enum sbi_ext_base_fid {
> @@ -63,6 +64,17 @@ enum sbi_ext_hsm_fid {
>  	SBI_EXT_HSM_HART_STATUS,
>  };
>  
> +enum sbi_ext_dma_fid {
> +	SBI_DMA_SYNC = 0,
> +};
> +
> +enum sbi_dma_sync_data_direction {
> +	SBI_DMA_BIDIRECTIONAL = 0,
> +	SBI_DMA_TO_DEVICE = 1,
> +	SBI_DMA_FROM_DEVICE = 2,
> +	SBI_DMA_NONE = 3,
> +};
> +
>  enum sbi_hsm_hart_status {
>  	SBI_HSM_HART_STATUS_STARTED = 0,
>  	SBI_HSM_HART_STATUS_STOPPED,
> @@ -128,6 +140,9 @@ int sbi_remote_hfence_vvma_asid(const unsigned long *hart_mask,
>  				unsigned long size,
>  				unsigned long asid);
>  int sbi_probe_extension(int ext);
> +void sbi_dma_sync(unsigned long start,
> +		  unsigned long size,
> +		  enum sbi_dma_sync_data_direction dir);
>  
>  /* Check if current SBI specification version is 0.1 or not */
>  static inline int sbi_spec_is_0_1(void)
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 7402a41..c936019 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -521,6 +521,25 @@ int sbi_probe_extension(int extid)
>  }
>  EXPORT_SYMBOL(sbi_probe_extension);
>  
> +void sbi_dma_sync(unsigned long start,
> +		  unsigned long size,
> +		  enum sbi_dma_sync_data_direction dir)
> +{
> +#if 0
> +	sbi_ecall(SBI_EXT_DMA, SBI_DMA_SYNC, start, size, dir,
> +		  0, 0, 0);
> +#else
> +	/* Just for try, it should be in sbi ecall and will be removed before merged */
> +	register unsigned long i asm("a0") = start & ~(L1_CACHE_BYTES - 1);
> +
> +	for (; i < ALIGN(start + size, L1_CACHE_BYTES); i += L1_CACHE_BYTES)
> +		__asm__ __volatile__(".long 0x02b5000b");
> +


Hi, I'm trying to use this patch for my D1 board.

Though the above code will be removed, I notice that the use of the inline assembly is wrong and `i` (i.e. `a0`) might not be correctly passed to the assembly code when we are using some other compilers.


It should be `__asm__ __volatile__(".long 0x02b5000b" : : "r"(i))`.


Thanks,
Wende


> +	__asm__ __volatile__(".long 0x01b0000b");
> +#endif
> +}
> +EXPORT_SYMBOL(sbi_dma_sync);
> +
>  static long __sbi_base_ecall(int fid)
>  {
>  	struct sbiret ret;
> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> index 7ebaef1..ca0ff90 100644
> --- a/arch/riscv/mm/Makefile
> +++ b/arch/riscv/mm/Makefile
> @@ -13,6 +13,7 @@ obj-y += extable.o
>  obj-$(CONFIG_MMU) += fault.o pageattr.o
>  obj-y += cacheflush.o
>  obj-y += context.o
> +obj-y += dma-mapping.o
>  
>  ifeq ($(CONFIG_MMU),y)
>  obj-$(CONFIG_SMP) += tlbflush.o
> diff --git a/arch/riscv/mm/dma-mapping.c b/arch/riscv/mm/dma-mapping.c
> new file mode 100644
> index 00000000..4afd9dc
> --- /dev/null
> +++ b/arch/riscv/mm/dma-mapping.c
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/dma-map-ops.h>
> +#include <asm/sbi.h>
> +
> +void arch_dma_prep_coherent(struct page *page, size_t size)
> +{
> +	void *ptr = page_address(page);
> +
> +	memset(ptr, 0, size);
> +	sbi_dma_sync(page_to_phys(page), size, SBI_DMA_BIDIRECTIONAL);
> +}
> +
> +void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> +		enum dma_data_direction dir)
> +{
> +	switch (dir) {
> +	case DMA_TO_DEVICE:
> +	case DMA_FROM_DEVICE:
> +	case DMA_BIDIRECTIONAL:
> +		sbi_dma_sync(paddr, size, dir);
> +		break;
> +	default:
> +		BUG();
> +	}
> +}
> +
> +void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> +		enum dma_data_direction dir)
> +{
> +	switch (dir) {
> +	case DMA_TO_DEVICE:
> +		return;
> +	case DMA_FROM_DEVICE:
> +	case DMA_BIDIRECTIONAL:
> +		sbi_dma_sync(paddr, size, dir);
> +		break;
> +	default:
> +		BUG();
> +	}
> +}
> +
> +pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
> +			      unsigned long size, pgprot_t vma_prot)
> +{
> +	if (!pfn_valid(pfn))
> +		return pgprot_noncached(vma_prot);
> +	else if (file->f_flags & O_SYNC)
> +		return pgprot_writecombine(vma_prot);
> +
> +	return vma_prot;
> +}
> +EXPORT_SYMBOL(phys_mem_access_prot);

-- 
Best wishes!
Sincerely,
twd2
https://twd2.me


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
