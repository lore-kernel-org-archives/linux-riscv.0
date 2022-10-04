Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57F9C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=so877AkFKJYJqDZlLFOmAbB6fOZWg0ssvY9oz/qLzaY=; b=kaYmjn5z42z2Za
	lV2auaIbCIVQRZvEikbyxg0TrVCN0ZVXnBXL+hwjPWE/nzNyg6+rsKJqUna/N8ahWqQDg8pfPOFBu
	XynWskl/pRX4rGNN4o6r6FcoXcQOXXIg4JfpmBe5rZqf7J8LGtdIfUjorYQiqZiYaMsY0I+RAlIXz
	bO9HM7KrCLRNpcdkqNggXge9A5Oq42Bz9U8CievLBOYgHSgaT4Y15qB9k58D0FT2U/JecGoWJ/IMo
	yQuGsQ+gQu5sedJUZF09EgDBh7l6duOE4rex10uv7DZlwoqKHiWVtKsMAy2RT47PyiUicUoNyAByC
	sPbGZaegKHkekpu3gunQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofmw5-00Agrs-1l; Tue, 04 Oct 2022 18:46:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofmw0-00Agpx-0C
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 18:46:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B662B614D3;
	Tue,  4 Oct 2022 18:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850BEC433D6;
	Tue,  4 Oct 2022 18:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664909186;
	bh=A4gx4IzEomT+rc0dr9Xe52eSG7sqkFKvlgHDPcjvBEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uYMwJwOnFes5j4F4sV8AGB9UoiH9HlxbGg8nzFJOBMxApmCP4jGKMnOOreERN+Lj+
	 v+FWPXqsfBUhfmTsttOi8Y4ynuIHnmMA0q02yOMJu5yke4G6wLqPQtwWfsUjnFm5rz
	 Fur4VN6WlG8mN+AAJsi3u90JmaJTS7XrAvnDLyO3KA+1W8ghzaeg7zZRBkvABPKSkk
	 1zX7WBYZcqzKCzhV5pa5e/4XSgOmLLOnKY2KnTw1CW57J6kz8j9tIY12Q/o/I/7hDq
	 /9RM3t28LlFf83xe3lV4k8HmjoqTFeQaY0bRyl2CwdwPPZg4nhnUcHQW4aBBXeOZ/a
	 1Sx1btF27Q3Tw==
Date: Tue, 4 Oct 2022 19:46:21 +0100
From: Conor Dooley <conor@kernel.org>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn
Subject: Re: [PATCH v5 4/4] mm: support Svnapot in huge vmap
Message-ID: <Yzx/fdjxLZodZLlO@spud>
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
 <20221003134721.1772455-5-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221003134721.1772455-5-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_114630_639662_0F41B9B6 
X-CRM114-Status: GOOD (  25.17  )
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

On Mon, Oct 03, 2022 at 09:47:21PM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> The HAVE_ARCH_HUGE_VMAP option can be used to help implement arch
> special huge vmap size. This commit selects this option by default and
> re-writes the arch_vmap_pte_range_map_size for Svnapot 64KB size.
> 
> It can be tested when booting kernel in qemu with pci device, which
> will make the kernel to call pci driver using ioremap, and the
> re-written function will be called.
> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 3d5ec1391046..571f77b16ee8 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -70,6 +70,7 @@ config RISCV
>  	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
>  	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
>  	select HAVE_ARCH_AUDITSYSCALL
> +	select HAVE_ARCH_HUGE_VMAP

Maybe you should take a look at the following patchset and see how your
code interacts with it:
https://lore.kernel.org/linux-riscv/20220915065027.3501044-1-liushixin2@huawei.com/

Possible you may have some feedback for Liu Shixin or get some ideas :)

Thanks,
Conor.

>  	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
>  	select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
>  	select HAVE_ARCH_KASAN if MMU && 64BIT
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index c3fc3c661699..1740d859331a 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -748,6 +748,43 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>  }
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
> +static inline int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
> +{
> +	return 0;
> +}
> +
> +static inline int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
> +{
> +	return 0;
> +}
> +
> +static inline void p4d_clear_huge(p4d_t *p4d) { }
> +
> +static inline int pud_clear_huge(pud_t *pud)
> +{
> +	return 0;
> +}
> +
> +static inline int pmd_clear_huge(pmd_t *pmd)
> +{
> +	return 0;
> +}
> +
> +static inline int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
> +{
> +	return 0;
> +}
> +
> +static inline int pud_free_pmd_page(pud_t *pud, unsigned long addr)
> +{
> +	return 0;
> +}
> +
> +static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
> +{
> +	return 0;
> +}
> +
>  /*
>   * Encode and decode a swap entry
>   *
> diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vmalloc.h
> index ff9abc00d139..ecd1f784299b 100644
> --- a/arch/riscv/include/asm/vmalloc.h
> +++ b/arch/riscv/include/asm/vmalloc.h
> @@ -1,4 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #ifndef _ASM_RISCV_VMALLOC_H
>  #define _ASM_RISCV_VMALLOC_H
>  
> +#include <linux/pgtable.h>
> +
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> +#define arch_vmap_pte_range_map_size vmap_pte_range_map_size
> +static inline unsigned long
> +vmap_pte_range_map_size(unsigned long addr, unsigned long end, u64 pfn,
> +			unsigned int max_page_shift)
> +{
> +	if (!has_svnapot())
> +		return PAGE_SIZE;
> +
> +	if (addr & NAPOT_CONT64KB_MASK)
> +		return PAGE_SIZE;
> +
> +	if (pfn & (NAPOT_64KB_PTE_NUM - 1UL))
> +		return PAGE_SIZE;
> +
> +	if ((end - addr) < NAPOT_CONT64KB_SIZE)
> +		return PAGE_SIZE;
> +
> +	if (max_page_shift < NAPOT_CONT64KB_SHIFT)
> +		return PAGE_SIZE;
> +
> +	return NAPOT_CONT64KB_SIZE;
> +}
> +#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
> +
>  #endif /* _ASM_RISCV_VMALLOC_H */
> -- 
> 2.35.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
