Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1D2C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 17:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ydmPMwGKDuAVA+BKyTb62HXde9BcnHuy5BOueMgD0G0=; b=3ezLYVIyIX/lLEkVHdmXpG8t2Y
	ok0E9/+iWEz7h0nKaHBcDxHrq6YWSS2uSE+EOtcxExSNeMbUdsBYelnDKSKyVyzCML1/wfNYU+403
	Dmwz4Bp0Ull3MGi/hCv28Wmsuj8skrx1cPWVxwYy7L5PrkBrpyWJkWNqaAQC1SV1KvdrWyaWYIJAe
	LZUBbfrmRYvYwM52GxVDMerE1CPdR88HAT2KG+MGS1BtBP68o1J77M+v5WD+6qE+HdXNaoTHTkISg
	iqSdkvzKr1nLRy35w/N77/FP29/p2HdF0MJCKt7+FSGcdIV9z3rm1F48RHN8LHIka1AoMdBD1RnQo
	Cu0mv2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNINA-001vE7-5I; Thu, 24 Feb 2022 17:57:48 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNIMr-001v4c-Cx
 for linux-riscv@lists.infradead.org; Thu, 24 Feb 2022 17:57:33 +0000
Received: by mail-pl1-x62d.google.com with SMTP id b22so2451007pls.7
 for <linux-riscv@lists.infradead.org>; Thu, 24 Feb 2022 09:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=4cyzICQ/23bHkeHtwzkbDtebSfIDfHBmF44TmpxS3Qs=;
 b=QZHtEKtUvZANVn2ElYT0MVq8L/sw0zRAND1G1+7+T2vN4rMWTQslOFNc01eWURY+2B
 sy0EKF687Is70s9G179bTT4gb7OQj+aQvL7fNGMlm6ZA8EcAnbYhS2KBw8jCxSfkagq+
 NucZ/R5TLUf/99L9ngjjYTgdH5a/n6N1tEKoBktikDcP1aWmcVutEpP4UHTORBHS9qay
 VyS3Euibr59HFzGcQDm5Yb7u3hl49gPPn7xuZGLRjDMT13qhnDD4l6inYvCW8iV01vNz
 aHx07dUlEYNNW1X1TiCzN3QQXMEUIWH8zIPIAR3ST5+sQ2z8sYlghZ5x1NpIC2rYLmfR
 XjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=4cyzICQ/23bHkeHtwzkbDtebSfIDfHBmF44TmpxS3Qs=;
 b=wq/3sbOheIWcSOeGoja8nlJ9hzgzY/SEjrPJOznsQyYir4MDy2DzJ625vpD/RMXRxl
 LRZcBgPskFnG5m3zoJ9uKyiuQ+CZmhcOxK/ZgEdvoYQEhpQdkGWSohPzmz54xrbUZOWK
 26XH2qXG/GODVuxOfUJY9nn2rmRAiCPiIMxeWca4AXNurhI4pqh2gMroQ1+LvPklgmYx
 gQnN8xr5ucRRexCC9Wcq1QYc4Yq/qrrJr0h848PHsaO58xJSb/EQwKg59HENvIuJlkxS
 jb5cAWB2EGEdTFY5z+RghWXV144zQ6/M6X4x2Vntn8ZlWRygw704B9t+Hf11qTTdOCuJ
 n5ug==
X-Gm-Message-State: AOAM532I6ANx+2o95tltatjtrNfIfrRwGr59lY1nnvyf5xn7Ig7WKt7n
 oFQWRbabkWSP5FWqgwO8a/LCwA==
X-Google-Smtp-Source: ABdhPJyVgqSJ004YUstyik+jYZz4EuPzBWmUx2Fjtwy+WACEd9Ui4gBxtYL98zOt7vqmGF1V37Iq4w==
X-Received: by 2002:a17:902:e74e:b0:14f:f1c0:aaed with SMTP id
 p14-20020a170902e74e00b0014ff1c0aaedmr3958082plf.19.1645725447254; 
 Thu, 24 Feb 2022 09:57:27 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 b9-20020a056a000cc900b004f3581ae086sm183340pfv.16.2022.02.24.09.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 09:57:26 -0800 (PST)
Date: Thu, 24 Feb 2022 09:57:26 -0800 (PST)
X-Google-Original-Date: Thu, 24 Feb 2022 09:56:39 PST (-0800)
Subject: Re: [PATCH V6 17/20] riscv: compat: vdso: Add setup additional pages
 implementation
In-Reply-To: <20220224085410.399351-18-guoren@kernel.org>
CC: guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>, anup@brainfault.org,
 Greg KH <gregkh@linuxfoundation.org>, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, 
 wangjunqiang@iscas.ac.cn, Christoph Hellwig <hch@lst.de>,
 linux-arch@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, 
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 x86@kernel.org, guoren@linux.alibaba.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-985c5e53-71d5-4d94-b9ff-deff7f834fc5@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_095729_478779_55724FC6 
X-CRM114-Status: GOOD (  32.16  )
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

On Thu, 24 Feb 2022 00:54:07 PST (-0800), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Reconstruct __setup_additional_pages() by appending vdso info
> pointer argument to meet compat_vdso_info requirement. And change
> vm_special_mapping *dm, *cm initialization into static.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/include/asm/elf.h |   5 ++
>  arch/riscv/include/asm/mmu.h |   1 +
>  arch/riscv/kernel/vdso.c     | 103 +++++++++++++++++++++++------------
>  3 files changed, 74 insertions(+), 35 deletions(-)
>
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index 3a4293dc7229..d87d3bcc758d 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -134,5 +134,10 @@ do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)		\
>  typedef compat_ulong_t			compat_elf_greg_t;
>  typedef compat_elf_greg_t		compat_elf_gregset_t[ELF_NGREG];
>
> +extern int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
> +					      int uses_interp);
> +#define compat_arch_setup_additional_pages \
> +				compat_arch_setup_additional_pages
> +
>  #endif /* CONFIG_COMPAT */
>  #endif /* _ASM_RISCV_ELF_H */
> diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
> index 0099dc116168..cedcf8ea3c76 100644
> --- a/arch/riscv/include/asm/mmu.h
> +++ b/arch/riscv/include/asm/mmu.h
> @@ -16,6 +16,7 @@ typedef struct {
>  	atomic_long_t id;
>  #endif
>  	void *vdso;
> +	void *vdso_info;
>  #ifdef CONFIG_SMP
>  	/* A local icache flush is needed before user execution can resume. */
>  	cpumask_t icache_stale_mask;
> diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> index a9436a65161a..f864811aa011 100644
> --- a/arch/riscv/kernel/vdso.c
> +++ b/arch/riscv/kernel/vdso.c
> @@ -23,6 +23,9 @@ struct vdso_data {
>  #endif
>
>  extern char vdso_start[], vdso_end[];
> +#ifdef CONFIG_COMPAT
> +extern char compat_vdso_start[], compat_vdso_end[];
> +#endif
>
>  enum vvar_pages {
>  	VVAR_DATA_PAGE_OFFSET,
> @@ -30,6 +33,11 @@ enum vvar_pages {
>  	VVAR_NR_PAGES,
>  };
>
> +enum rv_vdso_map {
> +	RV_VDSO_MAP_VVAR,
> +	RV_VDSO_MAP_VDSO,
> +};
> +
>  #define VVAR_SIZE  (VVAR_NR_PAGES << PAGE_SHIFT)
>
>  /*
> @@ -52,12 +60,6 @@ struct __vdso_info {
>  	struct vm_special_mapping *cm;
>  };
>
> -static struct __vdso_info vdso_info __ro_after_init = {
> -	.name = "vdso",
> -	.vdso_code_start = vdso_start,
> -	.vdso_code_end = vdso_end,
> -};
> -
>  static int vdso_mremap(const struct vm_special_mapping *sm,
>  		       struct vm_area_struct *new_vma)
>  {
> @@ -66,37 +68,33 @@ static int vdso_mremap(const struct vm_special_mapping *sm,
>  	return 0;
>  }
>
> -static int __init __vdso_init(void)
> +static void __init __vdso_init(struct __vdso_info *vdso_info)
>  {
>  	unsigned int i;
>  	struct page **vdso_pagelist;
>  	unsigned long pfn;
>
> -	if (memcmp(vdso_info.vdso_code_start, "\177ELF", 4)) {
> -		pr_err("vDSO is not a valid ELF object!\n");
> -		return -EINVAL;
> -	}
> +	if (memcmp(vdso_info->vdso_code_start, "\177ELF", 4))
> +		panic("vDSO is not a valid ELF object!\n");
>
> -	vdso_info.vdso_pages = (
> -		vdso_info.vdso_code_end -
> -		vdso_info.vdso_code_start) >>
> +	vdso_info->vdso_pages = (
> +		vdso_info->vdso_code_end -
> +		vdso_info->vdso_code_start) >>
>  		PAGE_SHIFT;
>
> -	vdso_pagelist = kcalloc(vdso_info.vdso_pages,
> +	vdso_pagelist = kcalloc(vdso_info->vdso_pages,
>  				sizeof(struct page *),
>  				GFP_KERNEL);
>  	if (vdso_pagelist == NULL)
> -		return -ENOMEM;
> +		panic("vDSO kcalloc failed!\n");
>
>  	/* Grab the vDSO code pages. */
> -	pfn = sym_to_pfn(vdso_info.vdso_code_start);
> +	pfn = sym_to_pfn(vdso_info->vdso_code_start);
>
> -	for (i = 0; i < vdso_info.vdso_pages; i++)
> +	for (i = 0; i < vdso_info->vdso_pages; i++)
>  		vdso_pagelist[i] = pfn_to_page(pfn + i);
>
> -	vdso_info.cm->pages = vdso_pagelist;
> -
> -	return 0;
> +	vdso_info->cm->pages = vdso_pagelist;
>  }
>
>  #ifdef CONFIG_TIME_NS
> @@ -116,13 +114,14 @@ int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
>  {
>  	struct mm_struct *mm = task->mm;
>  	struct vm_area_struct *vma;
> +	struct __vdso_info *vdso_info = mm->context.vdso_info;
>
>  	mmap_read_lock(mm);
>
>  	for (vma = mm->mmap; vma; vma = vma->vm_next) {
>  		unsigned long size = vma->vm_end - vma->vm_start;
>
> -		if (vma_is_special_mapping(vma, vdso_info.dm))
> +		if (vma_is_special_mapping(vma, vdso_info->dm))
>  			zap_page_range(vma, vma->vm_start, size);
>  	}
>
> @@ -187,11 +186,6 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
>  	return vmf_insert_pfn(vma, vmf->address, pfn);
>  }
>
> -enum rv_vdso_map {
> -	RV_VDSO_MAP_VVAR,
> -	RV_VDSO_MAP_VDSO,
> -};
> -
>  static struct vm_special_mapping rv_vdso_maps[] __ro_after_init = {
>  	[RV_VDSO_MAP_VVAR] = {
>  		.name   = "[vvar]",
> @@ -203,25 +197,44 @@ static struct vm_special_mapping rv_vdso_maps[] __ro_after_init = {
>  	},
>  };
>
> +static struct __vdso_info vdso_info __ro_after_init = {
> +	.name = "vdso",
> +	.vdso_code_start = vdso_start,
> +	.vdso_code_end = vdso_end,
> +	.dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR],
> +	.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO],
> +};
> +
> +#ifdef CONFIG_COMPAT
> +static struct __vdso_info compat_vdso_info __ro_after_init = {
> +	.name = "compat_vdso",
> +	.vdso_code_start = compat_vdso_start,
> +	.vdso_code_end = compat_vdso_end,
> +	.dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR],
> +	.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO],
> +};
> +#endif
> +
>  static int __init vdso_init(void)
>  {
> -	vdso_info.dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR];
> -	vdso_info.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO];
> +	__vdso_init(&vdso_info);
> +	__vdso_init(&compat_vdso_info);

An autobuilder is pointing out an issue here.  I'm assuming just an `#if 
defined(CONFIG_COMPAT)` will fix it, I'm OK squashing that in if it's 
the only issue -- a fixed one never hurts, though ;)

I'll try to take another look soon.

> -	return __vdso_init();
> +	return 0;
>  }
>  arch_initcall(vdso_init);
>
>  static int __setup_additional_pages(struct mm_struct *mm,
>  				    struct linux_binprm *bprm,
> -				    int uses_interp)
> +				    int uses_interp,
> +				    struct __vdso_info *vdso_info)
>  {
>  	unsigned long vdso_base, vdso_text_len, vdso_mapping_len;
>  	void *ret;
>
>  	BUILD_BUG_ON(VVAR_NR_PAGES != __VVAR_PAGES);
>
> -	vdso_text_len = vdso_info.vdso_pages << PAGE_SHIFT;
> +	vdso_text_len = vdso_info->vdso_pages << PAGE_SHIFT;
>  	/* Be sure to map the data page */
>  	vdso_mapping_len = vdso_text_len + VVAR_SIZE;
>
> @@ -232,16 +245,18 @@ static int __setup_additional_pages(struct mm_struct *mm,
>  	}
>
>  	ret = _install_special_mapping(mm, vdso_base, VVAR_SIZE,
> -		(VM_READ | VM_MAYREAD | VM_PFNMAP), vdso_info.dm);
> +		(VM_READ | VM_MAYREAD | VM_PFNMAP), vdso_info->dm);
>  	if (IS_ERR(ret))
>  		goto up_fail;
>
>  	vdso_base += VVAR_SIZE;
>  	mm->context.vdso = (void *)vdso_base;
> +	mm->context.vdso_info = (void *)vdso_info;
> +
>  	ret =
>  	   _install_special_mapping(mm, vdso_base, vdso_text_len,
>  		(VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC),
> -		vdso_info.cm);
> +		vdso_info->cm);
>
>  	if (IS_ERR(ret))
>  		goto up_fail;
> @@ -253,6 +268,24 @@ static int __setup_additional_pages(struct mm_struct *mm,
>  	return PTR_ERR(ret);
>  }
>
> +#ifdef CONFIG_COMPAT
> +int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
> +				       int uses_interp)
> +{
> +	struct mm_struct *mm = current->mm;
> +	int ret;
> +
> +	if (mmap_write_lock_killable(mm))
> +		return -EINTR;
> +
> +	ret = __setup_additional_pages(mm, bprm, uses_interp,
> +							&compat_vdso_info);
> +	mmap_write_unlock(mm);
> +
> +	return ret;
> +}
> +#endif
> +
>  int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
>  {
>  	struct mm_struct *mm = current->mm;
> @@ -261,7 +294,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
>  	if (mmap_write_lock_killable(mm))
>  		return -EINTR;
>
> -	ret = __setup_additional_pages(mm, bprm, uses_interp);
> +	ret = __setup_additional_pages(mm, bprm, uses_interp, &vdso_info);
>  	mmap_write_unlock(mm);
>
>  	return ret;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
