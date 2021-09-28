Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C9FC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 02:36:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5558460F6E
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 02:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5558460F6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lf1dBA5DiLa6cehX2ZL8ELTnznUpSJ8s65X+H5DUiZw=; b=hRYI/BudrUmLXuvwO4TWwqU3B5
	MGKBWlEcVjZOgGAEldMt0T0vSpoxMBmCi2zaFnU/tSK759JCeWuLC/Uk6aSUCpO6wmh+THvx/9F1Q
	bvFnH+BdoEmkInFwcWlzEDf/wGGcAumQ3gtd3l+ljPIMlNDpCguvoxv8Pe6xU3BzIwQ+nRNKRFPWO
	91wVyJ7yPs+lOgd+1glSuRXCKfn8UylaaXqjbTmouxle+Lhe8TH7FrOTKf5noP/sXcGq9BLgaNyMv
	6AP+q4x2C8vIz/r5PLz02ZezA9LB8rDoiwXySp1Zi0fPhA9zgwb0Vvd97R3fF6pA5sFMioWaHRHtS
	rLUreMbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV2yZ-005JFc-1g; Tue, 28 Sep 2021 02:36:11 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV2yD-005J7P-Rp
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 02:35:52 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HJNr55ThSzWXtd;
 Tue, 28 Sep 2021 10:34:29 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 10:35:43 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 10:35:43 +0800
Subject: Re: [PATCH -next] riscv/vdso: Add support for time namespaces
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmerdabbelt@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
References: <20210901032025.2529454-1-tongtiangen@huawei.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: tongtiangen <tongtiangen@huawei.com>
Message-ID: <6cdb42c0-9b80-1d09-f309-5691f0013a96@huawei.com>
Date: Tue, 28 Sep 2021 10:35:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210901032025.2529454-1-tongtiangen@huawei.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_193550_316173_CADA702B 
X-CRM114-Status: GOOD (  37.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

kindly ping.

On 2021/9/1 11:20, Tong Tiangen wrote:
> Implement generic vdso time namespace support which also enables time
> namespaces for riscv. This is quite similar to what arm64 does.
>
> selftest/timens test result:
>   1..10
>   ok 1 Passed for CLOCK_BOOTTIME (syscall)
>   ok 2 Passed for CLOCK_BOOTTIME (vdso)
>   ok 3 # SKIP CLOCK_BOOTTIME_ALARM isn't supported
>   ok 4 # SKIP CLOCK_BOOTTIME_ALARM isn't supported
>   ok 5 Passed for CLOCK_MONOTONIC (syscall)
>   ok 6 Passed for CLOCK_MONOTONIC (vdso)
>   ok 7 Passed for CLOCK_MONOTONIC_COARSE (syscall)
>   ok 8 Passed for CLOCK_MONOTONIC_COARSE (vdso)
>   ok 9 Passed for CLOCK_MONOTONIC_RAW (syscall)
>   ok 10 Passed for CLOCK_MONOTONIC_RAW (vdso)
>   # Totals: pass:8 fail:0 xfail:0 xpass:0 skip:2 error:0
>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> ---
> This patch is based on patchset:
>   https://lore.kernel.org/lkml/20210901024621.2528797-1-tongtiangen@huawei.com/
>
>  arch/riscv/Kconfig                         |   1 +
>  arch/riscv/include/asm/page.h              |   2 +
>  arch/riscv/include/asm/vdso.h              |   2 +-
>  arch/riscv/include/asm/vdso/gettimeofday.h |   7 +
>  arch/riscv/kernel/vdso.c                   | 250 ++++++++++++++++-----
>  arch/riscv/kernel/vdso/vdso.lds.S          |   3 +
>  6 files changed, 211 insertions(+), 54 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index aac669a6c3d8..7b0eff8a7eef 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -61,6 +61,7 @@ config RISCV
>  	select GENERIC_SCHED_CLOCK
>  	select GENERIC_SMP_IDLE_THREAD
>  	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
> +	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
>  	select HANDLE_DOMAIN_IRQ
>  	select HAVE_ARCH_AUDITSYSCALL
>  	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 109c97e991a6..b3e5ff0125fe 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -157,6 +157,8 @@ extern phys_addr_t __phys_addr_symbol(unsigned long x);
>  #define page_to_bus(page)	(page_to_phys(page))
>  #define phys_to_page(paddr)	(pfn_to_page(phys_to_pfn(paddr)))
>
> +#define sym_to_pfn(x)           __phys_to_pfn(__pa_symbol(x))
> +
>  #ifdef CONFIG_FLATMEM
>  #define pfn_valid(pfn) \
>  	(((pfn) >= ARCH_PFN_OFFSET) && (((pfn) - ARCH_PFN_OFFSET) < max_mapnr))
> diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
> index 34210b22ba91..bee9514104f7 100644
> --- a/arch/riscv/include/asm/vdso.h
> +++ b/arch/riscv/include/asm/vdso.h
> @@ -14,7 +14,7 @@
>   */
>  #ifdef CONFIG_MMU
>
> -#define __VVAR_PAGES    1
> +#define __VVAR_PAGES    2
>
>  #ifndef __ASSEMBLY__
>
> diff --git a/arch/riscv/include/asm/vdso/gettimeofday.h b/arch/riscv/include/asm/vdso/gettimeofday.h
> index f839f16e0d2a..77d9c2f721c4 100644
> --- a/arch/riscv/include/asm/vdso/gettimeofday.h
> +++ b/arch/riscv/include/asm/vdso/gettimeofday.h
> @@ -76,6 +76,13 @@ static __always_inline const struct vdso_data *__arch_get_vdso_data(void)
>  	return _vdso_data;
>  }
>
> +#ifdef CONFIG_TIME_NS
> +static __always_inline
> +const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_data *vd)
> +{
> +	return _timens_data;
> +}
> +#endif
>  #endif /* !__ASSEMBLY__ */
>
>  #endif /* __ASM_VDSO_GETTIMEOFDAY_H */
> diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> index b70956d80408..a9436a65161a 100644
> --- a/arch/riscv/kernel/vdso.c
> +++ b/arch/riscv/kernel/vdso.c
> @@ -13,6 +13,7 @@
>  #include <linux/err.h>
>  #include <asm/page.h>
>  #include <asm/vdso.h>
> +#include <linux/time_namespace.h>
>
>  #ifdef CONFIG_GENERIC_TIME_VSYSCALL
>  #include <vdso/datapage.h>
> @@ -25,14 +26,12 @@ extern char vdso_start[], vdso_end[];
>
>  enum vvar_pages {
>  	VVAR_DATA_PAGE_OFFSET,
> +	VVAR_TIMENS_PAGE_OFFSET,
>  	VVAR_NR_PAGES,
>  };
>
>  #define VVAR_SIZE  (VVAR_NR_PAGES << PAGE_SHIFT)
>
> -static unsigned int vdso_pages __ro_after_init;
> -static struct page **vdso_pagelist __ro_after_init;
> -
>  /*
>   * The vDSO data page.
>   */
> @@ -42,83 +41,228 @@ static union {
>  } vdso_data_store __page_aligned_data;
>  struct vdso_data *vdso_data = &vdso_data_store.data;
>
> -static int __init vdso_init(void)
> +struct __vdso_info {
> +	const char *name;
> +	const char *vdso_code_start;
> +	const char *vdso_code_end;
> +	unsigned long vdso_pages;
> +	/* Data Mapping */
> +	struct vm_special_mapping *dm;
> +	/* Code Mapping */
> +	struct vm_special_mapping *cm;
> +};
> +
> +static struct __vdso_info vdso_info __ro_after_init = {
> +	.name = "vdso",
> +	.vdso_code_start = vdso_start,
> +	.vdso_code_end = vdso_end,
> +};
> +
> +static int vdso_mremap(const struct vm_special_mapping *sm,
> +		       struct vm_area_struct *new_vma)
> +{
> +	current->mm->context.vdso = (void *)new_vma->vm_start;
> +
> +	return 0;
> +}
> +
> +static int __init __vdso_init(void)
>  {
>  	unsigned int i;
> +	struct page **vdso_pagelist;
> +	unsigned long pfn;
>
> -	vdso_pages = (vdso_end - vdso_start) >> PAGE_SHIFT;
> -	vdso_pagelist =
> -		kcalloc(vdso_pages + VVAR_NR_PAGES, sizeof(struct page *), GFP_KERNEL);
> -	if (unlikely(vdso_pagelist == NULL)) {
> -		pr_err("vdso: pagelist allocation failed\n");
> -		return -ENOMEM;
> +	if (memcmp(vdso_info.vdso_code_start, "\177ELF", 4)) {
> +		pr_err("vDSO is not a valid ELF object!\n");
> +		return -EINVAL;
>  	}
>
> -	for (i = 0; i < vdso_pages; i++) {
> -		struct page *pg;
> +	vdso_info.vdso_pages = (
> +		vdso_info.vdso_code_end -
> +		vdso_info.vdso_code_start) >>
> +		PAGE_SHIFT;
> +
> +	vdso_pagelist = kcalloc(vdso_info.vdso_pages,
> +				sizeof(struct page *),
> +				GFP_KERNEL);
> +	if (vdso_pagelist == NULL)
> +		return -ENOMEM;
> +
> +	/* Grab the vDSO code pages. */
> +	pfn = sym_to_pfn(vdso_info.vdso_code_start);
> +
> +	for (i = 0; i < vdso_info.vdso_pages; i++)
> +		vdso_pagelist[i] = pfn_to_page(pfn + i);
> +
> +	vdso_info.cm->pages = vdso_pagelist;
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_TIME_NS
> +struct vdso_data *arch_get_vdso_data(void *vvar_page)
> +{
> +	return (struct vdso_data *)(vvar_page);
> +}
> +
> +/*
> + * The vvar mapping contains data for a specific time namespace, so when a task
> + * changes namespace we must unmap its vvar data for the old namespace.
> + * Subsequent faults will map in data for the new namespace.
> + *
> + * For more details see timens_setup_vdso_data().
> + */
> +int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
> +{
> +	struct mm_struct *mm = task->mm;
> +	struct vm_area_struct *vma;
> +
> +	mmap_read_lock(mm);
>
> -		pg = virt_to_page(vdso_start + (i << PAGE_SHIFT));
> -		vdso_pagelist[i] = pg;
> +	for (vma = mm->mmap; vma; vma = vma->vm_next) {
> +		unsigned long size = vma->vm_end - vma->vm_start;
> +
> +		if (vma_is_special_mapping(vma, vdso_info.dm))
> +			zap_page_range(vma, vma->vm_start, size);
>  	}
> -	vdso_pagelist[i] = virt_to_page(vdso_data);
>
> +	mmap_read_unlock(mm);
>  	return 0;
>  }
> +
> +static struct page *find_timens_vvar_page(struct vm_area_struct *vma)
> +{
> +	if (likely(vma->vm_mm == current->mm))
> +		return current->nsproxy->time_ns->vvar_page;
> +
> +	/*
> +	 * VM_PFNMAP | VM_IO protect .fault() handler from being called
> +	 * through interfaces like /proc/$pid/mem or
> +	 * process_vm_{readv,writev}() as long as there's no .access()
> +	 * in special_mapping_vmops.
> +	 * For more details check_vma_flags() and __access_remote_vm()
> +	 */
> +	WARN(1, "vvar_page accessed remotely");
> +
> +	return NULL;
> +}
> +#else
> +static struct page *find_timens_vvar_page(struct vm_area_struct *vma)
> +{
> +	return NULL;
> +}
> +#endif
> +
> +static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
> +			     struct vm_area_struct *vma, struct vm_fault *vmf)
> +{
> +	struct page *timens_page = find_timens_vvar_page(vma);
> +	unsigned long pfn;
> +
> +	switch (vmf->pgoff) {
> +	case VVAR_DATA_PAGE_OFFSET:
> +		if (timens_page)
> +			pfn = page_to_pfn(timens_page);
> +		else
> +			pfn = sym_to_pfn(vdso_data);
> +		break;
> +#ifdef CONFIG_TIME_NS
> +	case VVAR_TIMENS_PAGE_OFFSET:
> +		/*
> +		 * If a task belongs to a time namespace then a namespace
> +		 * specific VVAR is mapped with the VVAR_DATA_PAGE_OFFSET and
> +		 * the real VVAR page is mapped with the VVAR_TIMENS_PAGE_OFFSET
> +		 * offset.
> +		 * See also the comment near timens_setup_vdso_data().
> +		 */
> +		if (!timens_page)
> +			return VM_FAULT_SIGBUS;
> +		pfn = sym_to_pfn(vdso_data);
> +		break;
> +#endif /* CONFIG_TIME_NS */
> +	default:
> +		return VM_FAULT_SIGBUS;
> +	}
> +
> +	return vmf_insert_pfn(vma, vmf->address, pfn);
> +}
> +
> +enum rv_vdso_map {
> +	RV_VDSO_MAP_VVAR,
> +	RV_VDSO_MAP_VDSO,
> +};
> +
> +static struct vm_special_mapping rv_vdso_maps[] __ro_after_init = {
> +	[RV_VDSO_MAP_VVAR] = {
> +		.name   = "[vvar]",
> +		.fault = vvar_fault,
> +	},
> +	[RV_VDSO_MAP_VDSO] = {
> +		.name   = "[vdso]",
> +		.mremap = vdso_mremap,
> +	},
> +};
> +
> +static int __init vdso_init(void)
> +{
> +	vdso_info.dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR];
> +	vdso_info.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO];
> +
> +	return __vdso_init();
> +}
>  arch_initcall(vdso_init);
>
> -int arch_setup_additional_pages(struct linux_binprm *bprm,
> -	int uses_interp)
> +static int __setup_additional_pages(struct mm_struct *mm,
> +				    struct linux_binprm *bprm,
> +				    int uses_interp)
>  {
> -	struct mm_struct *mm = current->mm;
> -	unsigned long vdso_base, vdso_len;
> -	int ret;
> +	unsigned long vdso_base, vdso_text_len, vdso_mapping_len;
> +	void *ret;
>
>  	BUILD_BUG_ON(VVAR_NR_PAGES != __VVAR_PAGES);
>
> -	vdso_len = (vdso_pages + VVAR_NR_PAGES) << PAGE_SHIFT;
> +	vdso_text_len = vdso_info.vdso_pages << PAGE_SHIFT;
> +	/* Be sure to map the data page */
> +	vdso_mapping_len = vdso_text_len + VVAR_SIZE;
>
> -	if (mmap_write_lock_killable(mm))
> -		return -EINTR;
> -
> -	vdso_base = get_unmapped_area(NULL, 0, vdso_len, 0, 0);
> +	vdso_base = get_unmapped_area(NULL, 0, vdso_mapping_len, 0, 0);
>  	if (IS_ERR_VALUE(vdso_base)) {
> -		ret = vdso_base;
> -		goto end;
> +		ret = ERR_PTR(vdso_base);
> +		goto up_fail;
>  	}
>
> -	mm->context.vdso = NULL;
> -	ret = install_special_mapping(mm, vdso_base, VVAR_SIZE,
> -		(VM_READ | VM_MAYREAD), &vdso_pagelist[vdso_pages]);
> -	if (unlikely(ret))
> -		goto end;
> +	ret = _install_special_mapping(mm, vdso_base, VVAR_SIZE,
> +		(VM_READ | VM_MAYREAD | VM_PFNMAP), vdso_info.dm);
> +	if (IS_ERR(ret))
> +		goto up_fail;
>
> +	vdso_base += VVAR_SIZE;
> +	mm->context.vdso = (void *)vdso_base;
>  	ret =
> -	   install_special_mapping(mm, vdso_base + VVAR_SIZE,
> -		vdso_pages << PAGE_SHIFT,
> +	   _install_special_mapping(mm, vdso_base, vdso_text_len,
>  		(VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC),
> -		vdso_pagelist);
> +		vdso_info.cm);
>
> -	if (unlikely(ret))
> -		goto end;
> +	if (IS_ERR(ret))
> +		goto up_fail;
>
> -	/*
> -	 * Put vDSO base into mm struct. We need to do this before calling
> -	 * install_special_mapping or the perf counter mmap tracking code
> -	 * will fail to recognise it as a vDSO (since arch_vma_name fails).
> -	 */
> -	mm->context.vdso = (void *)vdso_base + VVAR_SIZE;
> +	return 0;
>
> -end:
> -	mmap_write_unlock(mm);
> -	return ret;
> +up_fail:
> +	mm->context.vdso = NULL;
> +	return PTR_ERR(ret);
>  }
>
> -const char *arch_vma_name(struct vm_area_struct *vma)
> +int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
>  {
> -	if (vma->vm_mm && (vma->vm_start == (long)vma->vm_mm->context.vdso))
> -		return "[vdso]";
> -	if (vma->vm_mm && (vma->vm_start ==
> -			   (long)vma->vm_mm->context.vdso - VVAR_SIZE))
> -		return "[vdso_data]";
> -	return NULL;
> +	struct mm_struct *mm = current->mm;
> +	int ret;
> +
> +	if (mmap_write_lock_killable(mm))
> +		return -EINTR;
> +
> +	ret = __setup_additional_pages(mm, bprm, uses_interp);
> +	mmap_write_unlock(mm);
> +
> +	return ret;
>  }
> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> index e9111f700af0..01d94aae5bf5 100644
> --- a/arch/riscv/kernel/vdso/vdso.lds.S
> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> @@ -10,6 +10,9 @@ OUTPUT_ARCH(riscv)
>  SECTIONS
>  {
>  	PROVIDE(_vdso_data = . - __VVAR_PAGES * PAGE_SIZE);
> +#ifdef CONFIG_TIME_NS
> +	PROVIDE(_timens_data = _vdso_data + PAGE_SIZE);
> +#endif
>  	. = SIZEOF_HEADERS;
>
>  	.hash		: { *(.hash) }			:text
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
