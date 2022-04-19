Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CD1C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 20:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BOWfGutznlXfnVFBe1fe7YEvmTd2LK/yIe3qfN+hxMo=; b=qYkaPPCcYJ6i8K
	GJNY9pOdZNx82jw1KLXkmyZxGeqj+UVZV2Q+o9wC9JakJarseZ8YdlyV14dR0Qeh238SNHJCnR7np
	9hEWnSJm7vZu/afyNxjCkv8Q3SODni4Pr86oX/h63gbCa7HwJxEmcZlc4uTAlvKc5nmAD3meqKtNe
	ITW0RUdRPwquGLtrLPlWi0X0wdzh26ooUJ6zDrwDdY06I3VXegV+Txc8xqHhMXFacCJYEu8H0/+Hd
	XzfwbXbZ/6ZKVXPJLmxY9ft1S1xQHaXlZPtyIucKJ5dB2AAvmYpcDBDrhnePWKCriXuj7zRj3omZM
	JDqNRZZDOnvleiZ4AlIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngucl-0068bl-JP; Tue, 19 Apr 2022 20:38:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nguck-0068bK-6O
 for linux-riscv@bombadil.infradead.org; Tue, 19 Apr 2022 20:38:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=cjz7wKFAsfBMVGPmGUS52OFwFiDPm56/BfR12W6kk4U=; b=N170i8NmuK3H7TF4S48xKXCGg2
 MBDSwfkzfTB9UKpyejYSlI06Evm7PW8/lwrSlvOogIyFd2skJKVL1K5weSkS21/4VjDtuzD1lavmA
 I44a1GEH0e2oW5qPxF0kPHmrJURna8ysOP6byJOFDnE/CUQBk1igAlWEM/txwznnMQCSSBdojkBMN
 Xv1pXJJmdNT5hn2P8YUropp4QOOa1LaUwUcFw4XJJ3+UevHeTfC/1etXl189VFxWHo20sjxoz6YgR
 eBFVKhXdNECGvZG08DKNstStDyzbelWVBnELCrVABah/yJfBUFCh4VMqLeqM60/tcaSuI/UiSBsYW
 Na3oj/dQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nguca-003U9J-LS; Tue, 19 Apr 2022 20:38:48 +0000
Message-ID: <814ae1e7-297f-102f-972f-ae6130128e7a@infradead.org>
Date: Tue, 19 Apr 2022 13:38:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1] RISC-V: Add braces around an empty if statement bodies
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, panqinglin2020@iscas.ac.cn
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 alexandre.ghiti@canonical.com, jszhang@kernel.org,
 wangkefeng.wang@huawei.com, mick@ics.forth.gr, vitaly.wool@konsulko.com,
 rppt@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20220419194846.18318-1-palmer@rivosinc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220419194846.18318-1-palmer@rivosinc.com>
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

Hi,

On 4/19/22 12:48, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> This triggers -Wempty-body, which will cause the next statement (eventually
> create_pmd_mapping) to be dropped.  Both of these were introduced by the same
> commit.  This is safe for the reporting config (which is 32-bit), but IIUC
> could result in breakages for 64-bit configs without 4/5 level paging like the
> XIP configs.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 677b9eb8810e ("riscv: mm: Prepare pt_ops helper functions for sv57")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> Might be better to define these to functions that are empty, but that's
> slightly different than just fixing the commit/warning in question.

Yes, we usually fix this type of problem by changing these to have empty bodies:

#else
...
#define create_pud_mapping(__pmdp, __va, __pa, __sz, __prot)
#define create_pmd_mapping(__pmdp, __va, __pa, __sz, __prot)
#endif /* __PAGETABLE_PMD_FOLDED */

etc.

> ---
>  arch/riscv/mm/init.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 9535bea8688c..637916857c4d 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -798,13 +798,15 @@ static void __init create_fdt_early_page_table(pgd_t *pgdir, uintptr_t dtb_pa)
>  			   PGDIR_SIZE,
>  			   IS_ENABLED(CONFIG_64BIT) ? PAGE_TABLE : PAGE_KERNEL);
>  
> -	if (pgtable_l5_enabled)
> +	if (pgtable_l5_enabled) {
>  		create_p4d_mapping(early_dtb_p4d, DTB_EARLY_BASE_VA,
>  				   (uintptr_t)early_dtb_pud, P4D_SIZE, PAGE_TABLE);
> +	}
>  
> -	if (pgtable_l4_enabled)
> +	if (pgtable_l4_enabled) {
>  		create_pud_mapping(early_dtb_pud, DTB_EARLY_BASE_VA,
>  				   (uintptr_t)early_dtb_pmd, PUD_SIZE, PAGE_TABLE);
> +	}
>  
>  	if (IS_ENABLED(CONFIG_64BIT)) {
>  		create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA,

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
