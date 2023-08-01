Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BF4C00528
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 13:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMyBS8xZ6s7tAA2E2C0GwXmf4sQRAThRJEY1pV10fro=; b=hXlO6uBjcESONU
	xUWA+Hcj4PCz7NCC/EyoFTMezZdnVX1YOF2Zu58ehgWqHnAjE8phosWaKl9nrHCeRMlAXGJJW28+/
	aJ9EiUM/HwMZGxqq3zuvt11ujV7Q6tBVCDwfLlqlt5gMFigubjUC6H0SWJoPiKN8nJoeXftLIMsg2
	20UsYtFSAUD15qiTZWORFSLradiXgBVEA8+sHpxKC+kMz6C289CgGld1+m18UMhhoPjmoDFjz3+ah
	b6td+N4dWxijJgUmkBQHUqEZxnxzg7Q8Ud6R/JBK/4UfQodR3x0odgh6a7JahW19nHDVQHkp5HfID
	4XGoXX6TyPWnIcgrHZ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQprH-002VPj-37;
	Tue, 01 Aug 2023 13:56:19 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQprE-002VOD-1o
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 13:56:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 548354000C;
	Tue,  1 Aug 2023 13:56:06 +0000 (UTC)
Message-ID: <dc26625b-6658-c078-76d2-7e975a04b1d4@ghiti.fr>
Date: Tue, 1 Aug 2023 15:56:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] riscv: Flush stale TLB entry with VMAP_STACK enabled
To: Dylan Jhong <dylan@andestech.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, wangkefeng.wang@huawei.com,
 tongtiangen@huawei.com, guoren@kernel.org, sergey.matyukevich@syntacore.com,
 gregkh@linuxfoundation.org, ajones@ventanamicro.com, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, paul.walmsley@sifive.com, conor.dooley@microchip.com
Cc: x5710999x@gmail.com, tim609@andestech.com, cl634@andestech.com,
 ycliang@andestech.com
References: <20230801090927.2018653-1-dylan@andestech.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230801090927.2018653-1-dylan@andestech.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_065616_877989_AFBF3E6D 
X-CRM114-Status: GOOD (  36.36  )
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

Hi Dylan,


On 01/08/2023 11:09, Dylan Jhong wrote:
> When VMAP_STACK is enabled, the kernel stack will be obtained through
> vmalloc(). Normally, we rely on the logic in vmalloc_fault() to update stale
> P*D entries covering the vmalloc space in a task's page tables when it first
> accesses the problematic region.


I guess that's for rv32 right? Because vmalloc_fault() has been removed 
for rv64 in 6.5.

Here you describe the issue as being caused by the vmap stack being in a 
new PGD which then needs a page table synchronization in 
vmalloc_fault(), which can't happen since vmalloc_fault() needs this 
same stack in the current page table.


>   Unfortunately, this is not sufficient when
> the kernel stack resides in the vmalloc region, because vmalloc_fault() is a
> C function that needs a stack to run. So we need to ensure that these P*D
> entries are up to date *before* the MM switch.
>
> Here's our symptom:
> core 0: A speculative load lead the kernel stack load to the TLB before the
>          corresponding kernel stack's page table is created.
> core 1: Create page table mapping of that kernel stack.
> core 0: After a context switch, the kernel attempts to use the stack region.
>          However, even if the page table is correct, the stack address mapping
>          in the TLB is invalid, leading to subsequent nested exceptions.


But here the problem you describe is different since it seems to be 
caused by the TLB caching invalid entries which then needs a sfence.vma 
for the page table walker to see the new correct entry.


>
> This fix is inspired by ARM's approach[*1], commit a1c510d0adc6 ("ARM:
> implement support for vmap'ed stacks"), it also performs a TLB flush after
> setting up the page tables in vmalloc().
> Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> ---
>   arch/riscv/include/asm/page.h |  4 ++++
>   arch/riscv/mm/tlbflush.c      | 16 ++++++++++++++++
>   2 files changed, 20 insertions(+)
>
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 349fad5e35de..c9b080a72855 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -21,6 +21,10 @@
>   #define HPAGE_MASK              (~(HPAGE_SIZE - 1))
>   #define HUGETLB_PAGE_ORDER      (HPAGE_SHIFT - PAGE_SHIFT)
>   
> +#ifdef CONFIG_VMAP_STACK
> +#define ARCH_PAGE_TABLE_SYNC_MASK	PGTBL_PTE_MODIFIED
> +#endif
> +
>   /*
>    * PAGE_OFFSET -- the first address of the first page of memory.
>    * When not using MMU this corresponds to the first free page in
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index ef701fa83f36..0799978913ee 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -86,3 +86,19 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>   	__sbi_tlb_flush_range(vma->vm_mm, start, end - start, PMD_SIZE);
>   }
>   #endif
> +
> +#ifdef CONFIG_VMAP_STACK
> +/*
> + * Normally, we rely on the logic in vmalloc_fault() to update stale P*D
> + * entries covering the vmalloc space in a task's page tables when it first
> + * accesses the problematic region. Unfortunately, this is not sufficient when
> + * the kernel stack resides in the vmalloc region, because vmalloc_fault() is a
> + * C function that needs a stack to run. So we need to ensure that these P*D
> + * entries are up to date *before* the MM switch.
> + */
> +void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
> +{
> +	if (start < VMALLOC_END && end > VMALLOC_START)
> +		flush_tlb_all();
> +}
> +#endif


And if that works for you, I'd say the problem is the latter: the TLB 
caching invalid entries, since you don't synchronize the page tables 
here. That looks a lot like the patch I proposed here 
https://patchwork.kernel.org/project/linux-riscv/patch/20230725132246.817726-1-alexghiti@rivosinc.com/ 
that implements flush_cache_vmap().

So I'm not mistaken, we have another problem in 32-bit: I guess that in 
your example core 0 and core 1 execute in the same address space (ie the 
same page table) and a simple sfence.vma gets rid of the invalid entry 
and things can go on. But what if 2 page tables are created with the 
same vmalloc mappings, one adds a PGD in the vmalloc mapping, then the 
other one does not have it in its page table but still allocates its 
vmap stack in this new PGD => the latter would never be able to recover 
from the vmalloc fault since it needs to update its page table with the 
new PGD and it needs the new PGD for that.

Let me know if I'm completely wrong here!

Thanks,

Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
