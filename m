Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7753C6FA8B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 07:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/hXKRSuPaHgG66NROzilcxhvhbCzA67M/8ZOuec83c=; b=RcGjTXk1byak6Y
	rk6TQIuuwUEjcKY/zYLgfGK02qdd20tyo60opaRDQvzoLQ5Q1B37fccEl/GioFyTJYchPyLW/Ks3p
	jHpbrPs54wiVPG0TjgAhNFjOWfelehJqOwOiL0f6CQMDBIAVfa1gmhVW+8Yh0/kiXIDhF66LgOYom
	uaJxkX1vjXnt5LUSfj4lPzdwef6AIg1RUv9AOrMAdcxdlu7IauPvteoKUcPmYfhX4vxPI9p+E8ugH
	l6ivLT9WDdXzdf4ndNBP86SsIK8FISkHik09nunJvrJvs8hrfQNsap3g/22n52boa/balml/Iiyl2
	Gw0W2+HyLe7n05AkrqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGja-00Dt1y-Ru; Thu, 22 Sep 2022 07:34:58 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGjU-00DsyN-Mv
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 07:34:57 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id AD1C3100002;
	Thu, 22 Sep 2022 07:34:40 +0000 (UTC)
Message-ID: <48082184-93ea-8564-5a69-ff00350c0201@ghiti.fr>
Date: Thu, 22 Sep 2022 09:34:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] riscv: Move cast inside kernel_mapping_[pv]a_to_[vp]a
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-kernel@vger.kernel.org, Alexandre Ghiti
 <alexandre.ghiti@canonical.com>, Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Jisheng Zhang
 <jszhang@kernel.org>, Nick Kossifidis <mick@ics.forth.gr>,
 Qinglin Pan <panqinglin2020@iscas.ac.cn>,
 Tong Tiangen <tongtiangen@huawei.com>
References: <20220922054743.30159-1-samuel@sholland.org>
 <20220922054743.30159-2-samuel@sholland.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20220922054743.30159-2-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_003453_152358_6B83FA0E 
X-CRM114-Status: GOOD (  16.21  )
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


On 9/22/22 07:47, Samuel Holland wrote:
> Before commit 44c922572952 ("RISC-V: enable XIP"), these macros cast
> their argument to unsigned long. That commit moved the cast after an
> assignment to an unsigned long variable, rendering it ineffectual.
> Move the cast back, so we can remove the cast at each call site.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
>   arch/riscv/errata/thead/errata.c |  4 ++--
>   arch/riscv/include/asm/page.h    | 18 +++++++++---------
>   arch/riscv/mm/init.c             | 16 ++++++++--------
>   3 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index 83174f13783e..38c2c6b0f6b8 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -76,8 +76,8 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
>   		if (cpu_req_errata & tmp) {
>   			/* On vm-alternatives, the mmu isn't running yet */
>   			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> -				memcpy((void *)kernel_mapping_va_to_pa((unsigned long)alt->old_ptr),
> -				       (void *)kernel_mapping_va_to_pa((unsigned long)alt->alt_ptr),
> +				memcpy((void *)kernel_mapping_va_to_pa(alt->old_ptr),
> +				       (void *)kernel_mapping_va_to_pa(alt->alt_ptr),
>   				       alt->alt_len);
>   			else
>   				patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index ac70b0fd9a9a..9f432c1b5289 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -123,20 +123,20 @@ extern phys_addr_t phys_ram_base;
>   	((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < PAGE_OFFSET + KERN_VIRT_SIZE))
>   
>   #define linear_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + kernel_map.va_pa_offset))
> -#define kernel_mapping_pa_to_va(y)	({						\
> -	unsigned long _y = y;								\
> -	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < phys_ram_base) ?					\
> -		(void *)((unsigned long)(_y) + kernel_map.va_kernel_xip_pa_offset) :		\
> -		(void *)((unsigned long)(_y) + kernel_map.va_kernel_pa_offset + XIP_OFFSET);	\
> +#define kernel_mapping_pa_to_va(y)	({					\
> +	unsigned long _y = (unsigned long)(y);					\
> +	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < phys_ram_base) ?			\
> +		(void *)(_y + kernel_map.va_kernel_xip_pa_offset) :		\
> +		(void *)(_y + kernel_map.va_kernel_pa_offset + XIP_OFFSET);	\
>   	})
>   #define __pa_to_va_nodebug(x)		linear_mapping_pa_to_va(x)
>   
>   #define linear_mapping_va_to_pa(x)	((unsigned long)(x) - kernel_map.va_pa_offset)
>   #define kernel_mapping_va_to_pa(y) ({						\
> -	unsigned long _y = y;							\
> -	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < kernel_map.virt_addr + XIP_OFFSET) ?	\
> -		((unsigned long)(_y) - kernel_map.va_kernel_xip_pa_offset) :		\
> -		((unsigned long)(_y) - kernel_map.va_kernel_pa_offset - XIP_OFFSET);	\
> +	unsigned long _y = (unsigned long)(y);					\
> +	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < kernel_map.virt_addr + XIP_OFFSET) ? \
> +		(_y - kernel_map.va_kernel_xip_pa_offset) :			\
> +		(_y - kernel_map.va_kernel_pa_offset - XIP_OFFSET);		\
>   	})
>   
>   #define __va_to_pa_nodebug(x)	({						\
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index b56a0a75533f..7d59516ce6b3 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -927,15 +927,15 @@ static void __init pt_ops_set_early(void)
>    */
>   static void __init pt_ops_set_fixmap(void)
>   {
> -	pt_ops.alloc_pte = kernel_mapping_pa_to_va((uintptr_t)alloc_pte_fixmap);
> -	pt_ops.get_pte_virt = kernel_mapping_pa_to_va((uintptr_t)get_pte_virt_fixmap);
> +	pt_ops.alloc_pte = kernel_mapping_pa_to_va(alloc_pte_fixmap);
> +	pt_ops.get_pte_virt = kernel_mapping_pa_to_va(get_pte_virt_fixmap);
>   #ifndef __PAGETABLE_PMD_FOLDED
> -	pt_ops.alloc_pmd = kernel_mapping_pa_to_va((uintptr_t)alloc_pmd_fixmap);
> -	pt_ops.get_pmd_virt = kernel_mapping_pa_to_va((uintptr_t)get_pmd_virt_fixmap);
> -	pt_ops.alloc_pud = kernel_mapping_pa_to_va((uintptr_t)alloc_pud_fixmap);
> -	pt_ops.get_pud_virt = kernel_mapping_pa_to_va((uintptr_t)get_pud_virt_fixmap);
> -	pt_ops.alloc_p4d = kernel_mapping_pa_to_va((uintptr_t)alloc_p4d_fixmap);
> -	pt_ops.get_p4d_virt = kernel_mapping_pa_to_va((uintptr_t)get_p4d_virt_fixmap);
> +	pt_ops.alloc_pmd = kernel_mapping_pa_to_va(alloc_pmd_fixmap);
> +	pt_ops.get_pmd_virt = kernel_mapping_pa_to_va(get_pmd_virt_fixmap);
> +	pt_ops.alloc_pud = kernel_mapping_pa_to_va(alloc_pud_fixmap);
> +	pt_ops.get_pud_virt = kernel_mapping_pa_to_va(get_pud_virt_fixmap);
> +	pt_ops.alloc_p4d = kernel_mapping_pa_to_va(alloc_p4d_fixmap);
> +	pt_ops.get_p4d_virt = kernel_mapping_pa_to_va(get_p4d_virt_fixmap);
>   #endif
>   }
>   


Indeed, the inner cast was useless:

Reviewed-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
