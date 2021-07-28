Return-Path: <SRS0=BMZi=MU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC4DC4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 06:56:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 738CF600EF
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 06:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 738CF600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4+BVxQAc9kXsm1mAvCYtUMQ0YFfRN1m4smDbtAxfVo=; b=xWi2Cw2pSBLr/+
	0KeHPTiS+wRHHVWU13MjL9Nr7OHLGq7Bw5tVQP7KZi09u3CX7U8w/8aWNb04pvV/1b5AMyOsQDw08
	0pT8QCw87Qok8qVDMVly6qWRQ2dKR2T0Ar3/fjnB2d+G6cF40aNB1ewlO7mnLjxX1WhO2tXO2nbqm
	vFPX0hW4HrKc2Eqej6LYxGuJ9fCQqA830af+iCBk47FMLXyXh7WHgG+RmbLOpUbNTXqL2dYpi6pz6
	zIiSEV/2AKYNbhC7VL014nNBzkfkqWhGyqGPEARY15ALh8/OqfhV4P8J8cqEpkyBYLEoqtLST4KW5
	5piDR+Kq50thzqgrZ5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8dTm-00HIrr-2S; Wed, 28 Jul 2021 06:55:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8dTj-00HIrA-9y
 for linux-riscv@lists.infradead.org; Wed, 28 Jul 2021 06:55:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A34A60C3F;
 Wed, 28 Jul 2021 06:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627455342;
 bh=BrpjduE0q48FF1J9AlPOQqsZ2bQyg70IWUXdh44zgls=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yv+knPBBvFRu/v5Km3KMTVJAYMlT0IWA3muppA54knH3mGZs6mXtXExThTNkgJnPK
 uicatH/a3cBJzrDaZCscqn2ps142YCd3rVCGs7fmj7C2in4UTPkx14LEUp0qPiXmBY
 37vmyAXMyQXUCFax6u1IMQemeyrMi3elnwpKDuRjcgnmMitT49DZbhDxIrCYyaoANb
 f+FH9dygBRk8o9FxPAhW/fXJdQ+KQgQpnCPqNLdgIwiqD6l8GZkIYOsyuI9o6YBi7w
 eb03vA9Gpagp+f2IXBM5sVleDbHqIVV/7LzH58komd0XkFFaK+ei6bC9DieUMI/2fU
 0Z4T+YmLy+Fjw==
Date: Wed, 28 Jul 2021 09:55:33 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kenneth Lee <nek.in.cn@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>,
 Kenneth Lee <liguozhu@hisilicon.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Vitaly Wool <vitaly.wool@konsulko.com>, Guo Ren <guoren@linux.alibaba.com>,
 Jisheng Zhang <jszhang@kernel.org>, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guohanjun@huawei.com, wangzhou1@hisilicon.com
Subject: Re: [PATCH] riscv: fix the global name pfn_base confliction error
Message-ID: <YQD/Zb0EszIWr6RJ@kernel.org>
References: <20210728064318.375747-1-nek.in.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728064318.375747-1-nek.in.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_235543_406609_F1E06DAB 
X-CRM114-Status: GOOD (  19.19  )
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

On Wed, Jul 28, 2021 at 02:43:18PM +0800, Kenneth Lee wrote:
> From: Kenneth Lee <liguozhu@hisilicon.com>
> 
> RISCV use a global variable pfn_base for page/pfn translation. But this
> is a common name and will be used elsewhere. In those case,
> the page-pfn macro which refer this name will refer to the local/input
> variable of those function (such as in vfio_pin_pages_remote). This make
> everything wrong.
> 
> This patch change the name from pfn_base to riscv_global_pfn_base to fix

I think global is excessive, just riscv_pfn_base should be ok for proper
namespacing.

> this problem
> 
> Signed-off-by: Kenneth Lee <liguozhu@hisilicon.com>
> ---
>  arch/riscv/include/asm/page.h | 4 ++--
>  arch/riscv/mm/init.c          | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index cca8764aed83..8711e415f37c 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -79,8 +79,8 @@ typedef struct page *pgtable_t;
>  #endif
>  
>  #ifdef CONFIG_MMU
> -extern unsigned long pfn_base;
> -#define ARCH_PFN_OFFSET		(pfn_base)
> +extern unsigned long riscv_global_pfn_base;
> +#define ARCH_PFN_OFFSET		(riscv_global_pfn_base)
>  #else
>  #define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
>  #endif /* CONFIG_MMU */
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index a14bf3910eec..2ce4e9a46ca0 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -228,8 +228,8 @@ static struct pt_alloc_ops _pt_ops __initdata;
>  #define pt_ops _pt_ops
>  #endif
>  
> -unsigned long pfn_base __ro_after_init;
> -EXPORT_SYMBOL(pfn_base);
> +unsigned long riscv_global_pfn_base __ro_after_init;
> +EXPORT_SYMBOL(riscv_global_pfn_base);
>  
>  pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>  pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> @@ -572,7 +572,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
>  #endif
>  
> -	pfn_base = PFN_DOWN(kernel_map.phys_addr);
> +	riscv_global_pfn_base = PFN_DOWN(kernel_map.phys_addr);
>  
>  	/*
>  	 * Enforce boot alignment requirements of RV32 and
> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
