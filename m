Return-Path: <SRS0=Ne9D=OW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F4BC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Oct 2021 23:18:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76EBE61267
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Oct 2021 23:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76EBE61267
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ExjTw8H+mnKXwg726IyXJre57yro+FHXFzqCYr4zCsU=; b=EuF+4/z0P/AoxLvyiY6guD9inn
	CYrKcuRPtpWjXCQFWn//FfN2jsIGYNSqadyibEgwbLV7XPL75JYTJLtNU90oPPOnChsZIePwki8VU
	Y2qI1lEDP16ExnE6g2FW6ZB/4VYbkDfQ+eRAgdjC1QtijB5NBGiyU/U5uNRCJPi57IWDMb2E8UOLB
	1p50oyv/s1GeLhlHQ+rQA5HDUIHO2m3F/gPZuz/moROE7Zswj8f3WYhQhTUjwiUdYurSJ94LATOdf
	zuRbmgaSKK3PZJKZqtDU+3PqJJ2jstywkneM9d5NdsGorSZ2GKqY6izn+WwYQahKlw/HA1euko/NG
	D5UTng2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWoGi-002sqS-9C; Sat, 02 Oct 2021 23:18:12 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWoGd-002sq8-Sx
 for linux-riscv@lists.infradead.org; Sat, 02 Oct 2021 23:18:10 +0000
Received: by mail-pf1-x431.google.com with SMTP id p1so5156139pfh.8
 for <linux-riscv@lists.infradead.org>; Sat, 02 Oct 2021 16:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8R8gublYVvocZCtW2cNo65/O7X8cuknWXXSEVz7eyMc=;
 b=CjuiKGLxhYDdenLptOUimzHdGnXOdAuBXTuynr7e6xxjUIiNKy40sqVFFHSOLOQE2q
 doENEyZXndI1l4p6vS0U02gbqZZsuvXtb3+njlv7BQL+BaIvTUqlduEE7JK8u/KTwnE/
 VwscsdcsQqIJARQeA4tguGfuUB+vBB20iELm66LjXWjiJZkXDMnM+/1Mb1YjSTDAyVAi
 wz5X3OBKC0aZk1vfU4V+tmLQlPRaic8DgFrJyi4mCRCCDiXx/xUo10ICRMlkF3XLV0M3
 Z4jbK7TuKiO45i1/VQ8I7E9OY34msNKl+dcedJcPYVQ2Kbvp/cOWqI+0KdzGdQzXBbwg
 AZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8R8gublYVvocZCtW2cNo65/O7X8cuknWXXSEVz7eyMc=;
 b=7F0inhfrzicRzfDbc205I3Or62XnVaeqZO0G2DPjoCb+bfEDMa6jp/dNTKNfG1aOQ5
 iD42Rkzvwu+QPXPl22Zxqytptae3TgCnxpuwHw77kioK77DMxIrwLv6etvQ951SBN6RG
 jq7zyAD0CYzO2BavVniH8zbZ17Yi6Dl1+lYNgL00R+Mkst5JB8agBmfAp5BbYrTTF80X
 1NLULe2TV9YnXYcdXzIsODQmlH9PGrPKjtwl3pAzTs7FJJVKe/uC55QwRIRnN5ORJ+9w
 ZtXWAkMuTRExfXpBSnkd2APBI2RQrhsJ6J8KwZszrJCVj0uRZrG6EX3Lal+2Luk8egWF
 Fe1w==
X-Gm-Message-State: AOAM531CZhdzflcjlDqzsnG0ky6KL78TCHjZrNOQ+fKp75C7Z2K8iYhd
 cfcCAz3Mo8C/b5DTnJ19Y0L6oA==
X-Google-Smtp-Source: ABdhPJwbswBgnvm7bcO7rP+fhwn+eZtAoI3HeoR+ITyi2tnNUA05l5fsCl/5kqTTsAuLP9qtH3JeCw==
X-Received: by 2002:a63:4b5b:: with SMTP id k27mr4530082pgl.294.1633216686936; 
 Sat, 02 Oct 2021 16:18:06 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id p2sm8948500pja.51.2021.10.02.16.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 16:18:06 -0700 (PDT)
Date: Sat, 02 Oct 2021 16:18:06 -0700 (PDT)
X-Google-Original-Date: Sat, 02 Oct 2021 16:18:02 PDT (-0700)
Subject: Re: [PATCH -next] riscv/vdso: Add support for time namespaces
In-Reply-To: <20210901032025.2529454-1-tongtiangen@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 tongtiangen@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tongtiangen@huawei.com
Message-ID: <mhng-9beef7d9-ea01-40ad-ac3f-60c169163916@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211002_161808_040164_FE620FBC 
X-CRM114-Status: GOOD (  42.60  )
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

On Tue, 31 Aug 2021 20:20:25 PDT (-0700), tongtiangen@huawei.com wrote:
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

Thanks.  This is on for next.  I just re-juggled that one on fixes so I 
could pull it in to both.

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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
