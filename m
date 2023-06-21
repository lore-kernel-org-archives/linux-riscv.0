Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D46EEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 15:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWNGjZmLR5Vx7YgfVnObqWrH7gKe4YeC5K7McZg0BgE=; b=M7gWK6ULiJeUBq
	2ba1tAlbmf3ruMmGBoysw5zyVWntAEfqAfcTZSGL07fAjnusdn6mz6N8TeXHcZ8Cz1PiYXl1Luy3F
	diZlJVi1U8+22saidTio1eQME+h4xHQQ1m6oJbNgvvi6VZdlWQ+x+RyB2kSgkV94DIGnJYAuyUuv8
	OR+VLqzqf8H5a+tBBTNNxkO3TKcCUPoEWV3rz5DPrE7eWCd/n3bCFgcdJTNN7ZW1I10iSs7iOg35c
	NHcDlLZ9KDhlWIjSnDPjp00c+hL6WhaYcFl/ud3c0a5rWPuSi4QJ8RqdoTrak6kNaGP5ag2g7gjZl
	aaCtki9dHiN5gXMxROWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC00d-00EzVQ-1x;
	Wed, 21 Jun 2023 15:44:39 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC00Z-00EzUK-2z
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 15:44:38 +0000
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23F836000B;
	Wed, 21 Jun 2023 15:44:25 +0000 (UTC)
Message-ID: <536551b6-4215-bb2e-d309-6cbfe87205aa@ghiti.fr>
Date: Wed, 21 Jun 2023 17:44:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/1] riscv: mm: use svinval instructions instead of
 sfence.vma
Content-Language: en-US
To: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: =Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org
References: <20230621124133.779572-1-mchitale@ventanamicro.com>
 <20230621124133.779572-2-mchitale@ventanamicro.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230621124133.779572-2-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_084436_268337_29CCEA3B 
X-CRM114-Status: GOOD (  23.69  )
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

Hi Mayuresh,

On 21/06/2023 14:41, Mayuresh Chitale wrote:
> When svinval is supported the local_flush_tlb_page*
> functions would prefer to use the following sequence
> to optimize the tlb flushes instead of a simple sfence.vma:
>
> sfence.w.inval
> svinval.vma
>    .
>    .
> svinval.vma
> sfence.inval.ir
>
> The maximum number of consecutive svinval.vma instructions
> that can be executed in local_flush_tlb_page* functions is
> limited to PTRS_PER_PTE. This is required to avoid soft
> lockups and the approach is similar to that used in arm64.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   arch/riscv/mm/tlbflush.c | 62 ++++++++++++++++++++++++++++++++++++----
>   1 file changed, 56 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 77be59aadc73..ade0b5cf8b47 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -5,6 +5,12 @@
>   #include <linux/sched.h>
>   #include <asm/sbi.h>
>   #include <asm/mmu_context.h>
> +#include <asm/hwcap.h>
> +#include <asm/insn-def.h>
> +
> +#define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
> +
> +static unsigned long tlb_flush_all_threshold __read_mostly = PTRS_PER_PTE;


The threshold is quite high to me: internally, we computed that 
something like 50 would be a good bet, because to me, 512 * sfence.vma 
(or svinval equivalent) takes way more time than just flushing the whole 
tlb (even with the whole refill I'd say). How did you get this number? 
And this value is micro-architecture dependent, so we need to find a 
consensus or a mechanism to allow a vendor to change it.

FYI, x86 threshold is 33 (can't find right now the pointer sorry).


>   
>   static inline void local_flush_tlb_all_asid(unsigned long asid)
>   {
> @@ -26,19 +32,63 @@ static inline void local_flush_tlb_page_asid(unsigned long addr,
>   static inline void local_flush_tlb_range(unsigned long start,
>   		unsigned long size, unsigned long stride)
>   {
> -	if (size <= stride)
> -		local_flush_tlb_page(start);
> -	else
> +	if ((size / stride) <= tlb_flush_all_threshold) {


If size is not aligned on stride, you could get another page to flush so 
you do not respect the threshold. In my patchset, I used DIV_ROUND_UP.


> +		if (has_svinval()) {
> +			asm volatile(SFENCE_W_INVAL() ::: "memory");
> +			while (size) {
> +				asm volatile(SINVAL_VMA(%0, zero)
> +					     : : "r" (start) : "memory");
> +				start += stride;
> +				if (size > stride)
> +					size -= stride;
> +				else
> +					size = 0;
> +			}
> +			asm volatile(SFENCE_INVAL_IR() ::: "memory");
> +		} else {
> +			while (size) {
> +				local_flush_tlb_page(start);
> +				start += stride;
> +				if (size > stride)
> +					size -= stride;
> +				else
> +					size = 0;
> +			}
> +		}
> +	} else {
>   		local_flush_tlb_all();
> +	}
>   }
>   
>   static inline void local_flush_tlb_range_asid(unsigned long start,
>   		unsigned long size, unsigned long stride, unsigned long asid)
>   {
> -	if (size <= stride)
> -		local_flush_tlb_page_asid(start, asid);
> -	else
> +	if ((size / stride) <= tlb_flush_all_threshold) {
> +		if (has_svinval()) {
> +			asm volatile(SFENCE_W_INVAL() ::: "memory");
> +			while (size) {
> +				asm volatile(SINVAL_VMA(%0, %1) : : "r" (start),
> +					     "r" (asid) : "memory");
> +				start += stride;
> +				if (size > stride)
> +					size -= stride;
> +				else
> +					size = 0;
> +			}
> +			asm volatile(SFENCE_INVAL_IR() ::: "memory");
> +		} else {
> +			while (size) {
> +				local_flush_tlb_page_asid(start, asid);
> +				start += stride;
> +				if (size > stride)
> +					size -= stride;
> +				else
> +					size = 0;
> +			}
> +		}
> +	} else {
>   		local_flush_tlb_all_asid(asid);
> +	}
>   }
>   
>   static void __ipi_flush_tlb_all(void *info)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
