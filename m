Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BF1C25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 02:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9gu+Ik+u5LrLIUan18fv1FlmSdPcWL8pHT7kso6oeY=; b=lETMPDR1REHlBNe20lize/LQiR
	uIfT+ABR7+2i9fDFI+dH9kavkU+lee/shMPVVGd+D8fzxvQyYe87gVtDQiLhsrTFSZlDx9BFMb+8T
	L67G2iJ4/nIDY1+exBJqt5y8HiE9/cpyW+O2BtyZ0b36jAllJioWBfFT5C5VMLuQpQGlBhEEWa4Au
	D6YIbGLM9QtMXimNg31I8rAKZWKqUGvl76AcJfc81kt3t7eYL5c11EG7LrYh4Oh5YfxcKWxtpX/Bh
	HKPLdKfG5hYmb0DtejfyEDrAvdm7svzaSmX1z1MKOPK32l+H6mmg7pSLTYqbM9jSSQ2PgrDCR6WbV
	hp9Bo/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4twZ-000000008GH-0lei;
	Thu, 09 May 2024 02:55:39 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4nC9-0000000Gmss-3fzP
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 19:43:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30CAC40002;
	Wed,  8 May 2024 19:43:11 +0000 (UTC)
Message-ID: <f582aedc-603c-4c2f-9013-ae8e6cde767f@ghiti.fr>
Date: Wed, 8 May 2024 21:43:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: change XIP's kernel_map.size to be size of the
 entire kernel
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240508191917.2892064-1-namcao@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240508191917.2892064-1-namcao@linutronix.de>
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_124318_099302_09B9B491 
X-CRM114-Status: GOOD (  19.99  )
X-Mailman-Approved-At: Wed, 08 May 2024 19:55:30 -0700
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

Hi Nam,

On 08/05/2024 21:19, Nam Cao wrote:
> With XIP kernel, kernel_map.size is set to be only the size of data part of
> the kernel. This is inconsistent with "normal" kernel, who sets it to be
> the size of the entire kernel.
>
> More importantly, XIP kernel fails to boot if CONFIG_DEBUG_VIRTUAL is
> enabled, because there are checks on virtual addresses with the assumption
> that kernel_map.size is the size of the entire kernel (these checks are in
> arch/riscv/mm/physaddr.c).
>
> Change XIP's kernel_map.size to be the size of the entire kernel.
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: <stable@vger.kernel.org> # v6.1+
> ---
> I wouldn't consider this inconsistency to be a bug. It only became a
> a problem after kernel_map.size is used to check virtual addresses in
> 5f763b3b5960 ("riscv: Fix DEBUG_VIRTUAL false warnings"). So I will only
> backport this to stable versions that contain this commit: v6.1+
>
>   arch/riscv/mm/init.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index c081e7d349b1..0c0562839899 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -903,7 +903,7 @@ static void __init create_kernel_page_table(pgd_t *pgdir,
>   				   PMD_SIZE, PAGE_KERNEL_EXEC);
>   
>   	/* Map the data in RAM */
> -	end_va = kernel_map.virt_addr + XIP_OFFSET + kernel_map.size;
> +	end_va = kernel_map.virt_addr + kernel_map.size;
>   	for (va = kernel_map.virt_addr + XIP_OFFSET; va < end_va; va += PMD_SIZE)
>   		create_pgd_mapping(pgdir, va,
>   				   kernel_map.phys_addr + (va - (kernel_map.virt_addr + XIP_OFFSET)),
> @@ -1072,7 +1072,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>   
>   	phys_ram_base = CONFIG_PHYS_RAM_BASE;
>   	kernel_map.phys_addr = (uintptr_t)CONFIG_PHYS_RAM_BASE;
> -	kernel_map.size = (uintptr_t)(&_end) - (uintptr_t)(&_sdata);
> +	kernel_map.size = (uintptr_t)(&_end) - (uintptr_t)(&_start);
>   
>   	kernel_map.va_kernel_xip_pa_offset = kernel_map.virt_addr - kernel_map.xiprom;
>   #else


You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
