Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FBFCD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 07:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ek0H1VcnFkt3MQr1VWLgxf9FlZHTZ9CrnCXlZiq5PBI=; b=LActdElxGKc9+R
	INziIQqMq8ODt0O4eamqzZPQzK8SPH484kwVQJepJKx+VjGnApO0pX8kK49MQKKLDnaQQ0cGkpXNy
	3c+FWseK57ikqHVC4drKwkZOfKNklj6Zc8PfQZxCI9hINgl4f0FrTunrVp6dzSo5V838Pl9XZxDAh
	Sr8TwGKQ2syggu4zHrZGEK58MTeKbmwNQZuLuOgqQbqME/QLeBNA1STSyqiKhyhXbdtAb+eEfwQZC
	5IZcsIfgRFfDzd65dsEWPrSpw9ILjpr/DLTjTtgLtSuGfjOkUDRMtbGYo18ywPO9o8YvG8W6QMCaq
	DpPwV4nwQNxvC6Cz5oQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsHpn-00000001hTY-0aLc;
	Thu, 04 Apr 2024 07:48:31 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsHpj-00000001hR8-3p6p
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 07:48:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C811E20002;
	Thu,  4 Apr 2024 07:48:18 +0000 (UTC)
Message-ID: <faa34598-7207-45b4-be6a-e37a1fe1d5a3@ghiti.fr>
Date: Thu, 4 Apr 2024 09:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/13] riscv: Factor out page table TLB synchronization
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang
 <jszhang@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>
References: <20240327045035.368512-1-samuel.holland@sifive.com>
 <20240327045035.368512-3-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240327045035.368512-3-samuel.holland@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_004828_280270_7251F60F 
X-CRM114-Status: GOOD (  15.00  )
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


On 27/03/2024 05:49, Samuel Holland wrote:
> The logic is the same for all page table levels. See commit 69be3fb111e7
> ("riscv: enable MMU_GATHER_RCU_TABLE_FREE for SMP && MMU").
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> Changes in v6:
>   - Move riscv_tlb_remove_ptdesc() definition to fix 32-bit build
>
> Changes in v5:
>   - New patch for v5
>
>   arch/riscv/include/asm/pgalloc.h | 31 +++++++++++++------------------
>   1 file changed, 13 insertions(+), 18 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
> index deaf971253a2..b34587da8882 100644
> --- a/arch/riscv/include/asm/pgalloc.h
> +++ b/arch/riscv/include/asm/pgalloc.h
> @@ -15,6 +15,14 @@
>   #define __HAVE_ARCH_PUD_FREE
>   #include <asm-generic/pgalloc.h>
>   
> +static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
> +{
> +	if (riscv_use_ipi_for_rfence())
> +		tlb_remove_page_ptdesc(tlb, pt);
> +	else
> +		tlb_remove_ptdesc(tlb, pt);
> +}
> +
>   static inline void pmd_populate_kernel(struct mm_struct *mm,
>   	pmd_t *pmd, pte_t *pte)
>   {
> @@ -102,10 +110,7 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
>   		struct ptdesc *ptdesc = virt_to_ptdesc(pud);
>   
>   		pagetable_pud_dtor(ptdesc);
> -		if (riscv_use_ipi_for_rfence())
> -			tlb_remove_page_ptdesc(tlb, ptdesc);
> -		else
> -			tlb_remove_ptdesc(tlb, ptdesc);
> +		riscv_tlb_remove_ptdesc(tlb, ptdesc);
>   	}
>   }
>   
> @@ -139,12 +144,8 @@ static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
>   static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
>   				  unsigned long addr)
>   {
> -	if (pgtable_l5_enabled) {
> -		if (riscv_use_ipi_for_rfence())
> -			tlb_remove_page_ptdesc(tlb, virt_to_ptdesc(p4d));
> -		else
> -			tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
> -	}
> +	if (pgtable_l5_enabled)
> +		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
>   }
>   #endif /* __PAGETABLE_PMD_FOLDED */
>   
> @@ -176,10 +177,7 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
>   	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
>   
>   	pagetable_pmd_dtor(ptdesc);
> -	if (riscv_use_ipi_for_rfence())
> -		tlb_remove_page_ptdesc(tlb, ptdesc);
> -	else
> -		tlb_remove_ptdesc(tlb, ptdesc);
> +	riscv_tlb_remove_ptdesc(tlb, ptdesc);
>   }
>   
>   #endif /* __PAGETABLE_PMD_FOLDED */
> @@ -190,10 +188,7 @@ static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
>   	struct ptdesc *ptdesc = page_ptdesc(pte);
>   
>   	pagetable_pte_dtor(ptdesc);
> -	if (riscv_use_ipi_for_rfence())
> -		tlb_remove_page_ptdesc(tlb, ptdesc);
> -	else
> -		tlb_remove_ptdesc(tlb, ptdesc);
> +	riscv_tlb_remove_ptdesc(tlb, ptdesc);
>   }
>   #endif /* CONFIG_MMU */
>   


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
