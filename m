Return-Path: <SRS0=4geo=M4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD8AC432BE
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 11:51:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89C8661102
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 11:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89C8661102
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxfo+v5Ti64Bvl8zOdTCIk1BEayV9KORiO1u+UZjc04=; b=LodIcFdPCZ0V10b2S76s30mFGs
	rDXyxLct0mv9SmHPS18z/kY9rmCgFT8xC6ASRJ1dzctOeijTGkdCAlFGIMBiQQKoncPCTl4WIrHI8
	QUZbNuRgzAThRkSlCZse+dPUBLSHAuxp+Kyug5O77ApbCFmYAd76zGz2uORHJ8ByiMPFbjtL6N8bq
	JBA4qQ1t9uMEvhmJfUxg4t6r6ab7+KiaFk/psrpqyDJNC+AqWuTRuhuvySgyUx6htiLljQXptA4yL
	TldxqTvDKnryKsXsdJKZPVIn8rrZzlPNvDucQKxcsF5N2kh0yT3dZUdwMGfmY+RLgZJltCt2WK4bF
	OnhTYTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBbuQ-009Idv-At; Thu, 05 Aug 2021 11:51:34 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBbuN-009Id6-TJ
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 11:51:33 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 932E4240003;
 Thu,  5 Aug 2021 11:51:21 +0000 (UTC)
Subject: Re: [PATCH] riscv: mm: Enable PMD split page table lock for RV64
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: palmerdabbelt@google.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu
References: <20210730131146.184208-1-wangkefeng.wang@huawei.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <8bb6c662-afbb-feea-dadb-9d2ea49ded5b@ghiti.fr>
Date: Thu, 5 Aug 2021 13:51:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730131146.184208-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_045132_138487_476926AA 
X-CRM114-Status: GOOD (  18.95  )
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

Hi Kefeng,

On 30/07/2021 15:11, Kefeng Wang wrote:
> After commit 1355c31eeb7e ("asm-generic: pgalloc: provide generic
> pmd_alloc_one() and pmd_free_one()"), it is easy to enable
> ARCH_ENABLE_SPLIT_PMD_PTLOCK for RV64.
> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   arch/riscv/Kconfig   | 1 +
>   arch/riscv/mm/init.c | 3 ++-
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 8fcceb8eda07..c3e456fc7108 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -12,6 +12,7 @@ config 32BIT
>   
>   config RISCV
>   	def_bool y
> +	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>   	select ARCH_CLOCKSOURCE_INIT
>   	select ARCH_SUPPORTS_ATOMIC_RMW
>   	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index e547e53cddd2..ce12905a0224 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -361,7 +361,8 @@ static phys_addr_t __init alloc_pmd_late(uintptr_t va)
>   	unsigned long vaddr;
>   
>   	vaddr = __get_free_page(GFP_KERNEL);
> -	BUG_ON(!vaddr);
> +	BUG_ON(!vaddr || !pgtable_pmd_page_ctor(virt_to_page(vaddr)));
> +
>   	return __pa(vaddr);
>   }
>   
> 

I took the time to check how the page table lock works, and indeed, the 
commit you mention makes it easy to enable this feature since the 
initialization of the lock for the general case is done there and your 
patch seems correct as this is the only place we allocate a PMD page, 
and the PTE page allocation already calls pgtable_pte_page_ctor.

Maybe your commit message would need some of the explanation I gave 
above, or something similar, but this is up to you.

You can add:

Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>

Thanks,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
