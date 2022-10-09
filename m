Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC40C433FE
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Oct 2022 11:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z6Wxqy51KsBAyDvKXkIp/MA1QAd0GRoiwxUycEQsU98=; b=eb7+NpQYpQM0CA
	11OL46FFRnye2P71zSooh/R/S05ldmCaIKCDjGV0DhNyeAQdChqfXb9TiZO8raqiE5yGiCOPAdMx7
	hfcDey/9Pf5oKRJtsmcxWQrQBI0zOE9WQ4tDfPKXhvKjzMIBtOIgNAvc/TFy6uICogAAnmR3PGAsB
	ySP863WjS9t8w17ycxdd+NtTz77OzvvKxaJcWYVOVkqp03aZlh+5Nvdi8ZhOjIKX6yVh5rOpNFFba
	pGw/6TjbEc7nrPJ01KS10uQySpabWfr4lUD8xWWo6eugT81WYq+4maFaEkOvVbPgxLkS19kJBUGdy
	dWZN/HGD8R9P2cmBHPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohUVf-00FNt0-Au; Sun, 09 Oct 2022 11:30:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohUVc-00FNse-PT
	for linux-riscv@lists.infradead.org; Sun, 09 Oct 2022 11:30:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 410C6B80C69;
	Sun,  9 Oct 2022 11:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FDBC433D6;
	Sun,  9 Oct 2022 11:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665315014;
	bh=OCsBIWLHMloGFPkE5JhJN04W1iGjU/gx4U9LApojF60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rGEamWIbH1kJVlcoJsRmH7CkSHLQ4ljEuoxne2FyS5twim5SM8r/qUOgAV0HE/6Jo
	 ar/Zqd813iBWFn6XWWHYlkOFIOErJBdedsiWre6XOJF4mQB+ZB5IWE8wKxRAN3fjOE
	 Kg33NPdnVx4WuFL/SWrIX8f7KL6jH4PiBWHR8aW1ZMOXEMW23jnAdub/bPajbkmNUG
	 XaZE/IRB4YVsFdQtOr8t0yawHF8arrxMh/1t8qX5aPNiZG1ZnExxgOb1bOTm5V64oW
	 PhW8y9FsESF9I3ZrKHe41pIx1Iic83gyrM8dkCnTmwEK17/BuCgDjHCZ6rkh5LrG1I
	 XNHv1BJ9Z82Pw==
Date: Sun, 9 Oct 2022 12:30:09 +0100
From: Conor Dooley <conor@kernel.org>
To: panqinglin2020@iscas.ac.cn
Cc: atishp@atishpatra.org, alex@ghiti.fr, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Subject: Re: [PATCH v1 1/1] riscv: mm: add missing memcpy in kasan_init
Message-ID: <Y0KwwUNpfC+JOhQR@spud>
References: <CAOnJCU+GHzFSzSdvZKBrFeF4WqPvC5w0r1f4r3S8hLbOagPKgA@mail.gmail.com>
 <20221009083050.3814850-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221009083050.3814850-1-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_043017_014167_A238ADE4 
X-CRM114-Status: GOOD (  23.79  )
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

On Sun, Oct 09, 2022 at 04:30:50PM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> Hi Atish,
> 
> It seems that the panic is due to the missing memcpy during kasan_init.
> Could you please check whether this patch is helpful?

If this does solve the problem it would be:
Fixes: 8fbdccd2b173 ("riscv: mm: Support kasan for sv57")
right?

Thanks,
Conor.

> 
> When doing kasan_populate, the new allocated base_pud/base_p4d should
> contain kasan_early_shadow_{pud, p4d}'s content. Add the missing memcpy
> to avoid page fault when read/write kasan shadow region.
> 
> Tested on:
>  - qemu with sv57 and CONFIG_KASAN on.
>  - qemu with sv48 and CONFIG_KASAN on.
> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> ---
>  arch/riscv/mm/kasan_init.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index a22e418dbd82..e1226709490f 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -113,6 +113,8 @@ static void __init kasan_populate_pud(pgd_t *pgd,
>  		base_pud = pt_ops.get_pud_virt(pfn_to_phys(_pgd_pfn(*pgd)));
>  	} else if (pgd_none(*pgd)) {
>  		base_pud = memblock_alloc(PTRS_PER_PUD * sizeof(pud_t), PAGE_SIZE);
> +		memcpy(base_pud, (void *)kasan_early_shadow_pud,
> +			sizeof(pud_t) * PTRS_PER_PUD);
>  	} else {
>  		base_pud = (pud_t *)pgd_page_vaddr(*pgd);
>  		if (base_pud == lm_alias(kasan_early_shadow_pud)) {
> @@ -173,8 +175,11 @@ static void __init kasan_populate_p4d(pgd_t *pgd,
>  		base_p4d = pt_ops.get_p4d_virt(pfn_to_phys(_pgd_pfn(*pgd)));
>  	} else {
>  		base_p4d = (p4d_t *)pgd_page_vaddr(*pgd);
> -		if (base_p4d == lm_alias(kasan_early_shadow_p4d))
> +		if (base_p4d == lm_alias(kasan_early_shadow_p4d)) {
>  			base_p4d = memblock_alloc(PTRS_PER_PUD * sizeof(p4d_t), PAGE_SIZE);
> +			memcpy(base_p4d, (void *)kasan_early_shadow_p4d,
> +				sizeof(p4d_t) * PTRS_PER_P4D);
> +		}
>  	}
>  
>  	p4dp = base_p4d + p4d_index(vaddr);
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
