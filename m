Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466E8C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 21:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DexJdCl7ktqk2Rj9+5Y3hA0dNsEZ/Jymw1ufaVYH+II=; b=Pj1cjsimwFpai33zbpoeCRzF61
	2o8MP3rSv7rWGJxvV1jXCs1HAH90oRSHeLBHsO3WdngZT/KyBsCrb729Ov7CY3K8BOZKJAOF16pth
	zEnRoJgFVT56OGIWRM7OFyVpWgKaEm4rK+/KMt2IfGWvDq440f3yZiPum4TgnuVrQntB+m0ZNh7eZ
	pdkZLJK8iWjR0H3lVc5JwL+ub+umgOMk05VwF3hIaUHTe0kfIdva9/csJ7SVtXsMGL3xCKeFMS9gq
	6ZilvB89LZE08vCyQmgLQYwe6lrRgaFhRyJeYzY1jzNRe+ojUrM/qf6zGTTUD/b0O3VWG9QpE3XZm
	JfRNgNUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG3uL-000two-0m;
	Wed, 20 Dec 2023 21:15:13 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG3uH-000tw8-1X
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 21:15:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79F0220004;
	Wed, 20 Dec 2023 21:15:00 +0000 (UTC)
Message-ID: <594df6bc-0207-46f6-aa81-dcf1f3665917@ghiti.fr>
Date: Wed, 20 Dec 2023 22:14:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: put va_kernel_xip_pa_offset into CONFIG_XIP_KERNEL
Content-Language: en-US
To: Yunhui Cui <cuiyunhui@bytedance.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, ajones@ventanamicro.com,
 alexghiti@rivosinc.com, anup@brainfault.org, samitolvanen@google.com,
 rppt@kernel.org, panqinglin2020@iscas.ac.cn,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231220103428.61758-1-cuiyunhui@bytedance.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231220103428.61758-1-cuiyunhui@bytedance.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_131509_668849_45E3BBDC 
X-CRM114-Status: GOOD (  13.54  )
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

Hi Yunhui,

On 20/12/2023 11:34, Yunhui Cui wrote:
> opitmize the kernel_mapping_pa_to_va() and kernel_mapping_va_to_pa().
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>   arch/riscv/include/asm/page.h | 33 ++++++++++++++++++++-------------
>   1 file changed, 20 insertions(+), 13 deletions(-)
>
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 5488ecc337b6..0d2b479d02cd 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -113,8 +113,8 @@ struct kernel_mapping {
>   	unsigned long va_pa_offset;
>   	/* Offset between kernel mapping virtual address and kernel load address */
>   	unsigned long va_kernel_pa_offset;
> -	unsigned long va_kernel_xip_pa_offset;
>   #ifdef CONFIG_XIP_KERNEL
> +	unsigned long va_kernel_xip_pa_offset;
>   	uintptr_t xiprom;
>   	uintptr_t xiprom_sz;
>   #endif
> @@ -134,12 +134,25 @@ extern phys_addr_t phys_ram_base;
>   #else
>   void *linear_mapping_pa_to_va(unsigned long x);
>   #endif
> -#define kernel_mapping_pa_to_va(y)	({					\
> -	unsigned long _y = (unsigned long)(y);					\
> -	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < phys_ram_base) ?			\
> -		(void *)(_y + kernel_map.va_kernel_xip_pa_offset) :		\
> -		(void *)(_y + kernel_map.va_kernel_pa_offset + XIP_OFFSET);	\
> -	})
> +
> +#ifdef CONFIG_XIP_KERNEL
> +#define kernel_mapping_pa_to_va(y)							\
> +	(((unsigned long)(y) < phys_ram_base) ?						\
> +		(void *)((unsigned long)(y) + kernel_map.va_kernel_xip_pa_offset) :	\
> +		(void *)((unsigned long)(y) + kernel_map.va_kernel_pa_offset + XIP_OFFSET))
> +
> +#define kernel_mapping_va_to_pa(y)						\
> +	(((unsigned long)(y) < kernel_map.virt_addr + XIP_OFFSET) ?		\
> +		((unsigned long)(y) - kernel_map.va_kernel_xip_pa_offset) :	\
> +		((unsigned long)(y) - kernel_map.va_kernel_pa_offset - XIP_OFFSET))
> +#else
> +#define kernel_mapping_pa_to_va(y)						\
> +	((void *)((unsigned long)(y) + kernel_map.va_kernel_pa_offset + XIP_OFFSET))
> +
> +#define kernel_mapping_va_to_pa(y)						\
> +	((unsigned long)(y) - kernel_map.va_kernel_pa_offset - XIP_OFFSET)
> +#endif
> +
>   #define __pa_to_va_nodebug(x)		linear_mapping_pa_to_va(x)
>   
>   #ifndef CONFIG_DEBUG_VIRTUAL
> @@ -147,12 +160,6 @@ void *linear_mapping_pa_to_va(unsigned long x);
>   #else
>   phys_addr_t linear_mapping_va_to_pa(unsigned long x);
>   #endif
> -#define kernel_mapping_va_to_pa(y) ({						\
> -	unsigned long _y = (unsigned long)(y);					\
> -	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < kernel_map.virt_addr + XIP_OFFSET) ? \
> -		(_y - kernel_map.va_kernel_xip_pa_offset) :			\
> -		(_y - kernel_map.va_kernel_pa_offset - XIP_OFFSET);		\
> -	})
>   
>   #define __va_to_pa_nodebug(x)	({						\
>   	unsigned long _x = x;							\


Not sure using #ifdef optimizes anything since the compiler should do 
the same with the IS_ENABLED(CONFIG_XIP_KERNEL) and it does not really 
improve the readability of this file which is already overloaded with 
#ifdef, so I don't think this change is needed.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
