Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702B9C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 11:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWv3AVFxIcbRMYLz7q5YYXwL0nMgjKY3TeGbPj1Vw1A=; b=QpKS8/088hG0e3
	+ONy0HT3Mt+fGAi+uYBoglJG1KksBQUpMgxbNT3I3cWeOZoCdPB4z5d2hkbq9hrrNpS2adUBG1fk6
	lQr8dHpoPLodgC/t1ORJcabsv5kJyCw5pDxGZN+8b7y4j+imZPhWWBwKtt2DfPoFVmRfZUo0i21eY
	iE+Ri1xP8cMmbJ/+8zKMhLQfjk5Y4/3MAXeJhrct61DLgTYvjZsFAdirnzzo0CZybeHoo++qAP/zh
	NbhRWhF95IJilyE8qPJns2EgA6dqFO0j0dryLBpi6+cf/Bl7sGir0AvOTzF++ahkRB4bVu9nCVdG9
	MMsKZw912Eo9J4yLK4fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0hsy-003463-LJ; Mon, 13 Jun 2022 11:05:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0hsl-0033vN-NH; Mon, 13 Jun 2022 11:05:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 63F02614CB;
	Mon, 13 Jun 2022 11:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA26C34114;
	Mon, 13 Jun 2022 11:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655118317;
	bh=k9aUUnqcx7zhYyOXA4iphpmzLpkcUokEnBIJoGzV800=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uzP0GwrIIUvxLbEj5B1z2I4q/fkYHdxOBYFqKYQZL8zqRBMOlOnZT43ZKJHsrLuXl
	 cipSxarShAqtSB1sU1Ser/ZNFiFrtEoyHVL+HdztzjouFS1UltSOAA8sBjH6sMKosd
	 TW3yGWDTPLWUkj+q5vWjWBpZ+HP4UAkajg/fjdtCpIAKMC9Rfgh9UOxYexBSe5SYz4
	 2YSzkZux8MxlhXu6DZPUnA1ullgrB9VKbi0+GAlywJ5U4uVJp0vd4cjZM1mtGqrWbO
	 5knf8XGOYAsnLGi0PFadaEKXm3/iYrzaJ3Ngk8A1H3Gb0KPbIChGibpNWN6JHkZJl6
	 tfL55Kv0OB6ew==
Date: Mon, 13 Jun 2022 14:05:04 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Wupeng Ma <mawupeng1@huawei.com>
Cc: corbet@lwn.net, will@kernel.org, ardb@kernel.org,
	catalin.marinas@arm.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, dvhart@infradead.org, andy@infradead.org,
	akpm@linux-foundation.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, paulmck@kernel.org,
	keescook@chromium.org, songmuchun@bytedance.com,
	rdunlap@infradead.org, damien.lemoal@opensource.wdc.com,
	swboyd@chromium.org, wei.liu@kernel.org, robin.murphy@arm.com,
	david@redhat.com, anshuman.khandual@arm.com,
	thunder.leizhen@huawei.com, wangkefeng.wang@huawei.com,
	gpiccoli@igalia.com, chenhuacai@kernel.org, geert@linux-m68k.org,
	vijayb@linux.microsoft.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 6/6] memblock: Disable mirror feature if kernelcore is
 not specified
Message-ID: <YqcZ4O3pwceVtKYm@kernel.org>
References: <20220613082147.183145-1-mawupeng1@huawei.com>
 <20220613082147.183145-7-mawupeng1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220613082147.183145-7-mawupeng1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_040519_860412_06C640B7 
X-CRM114-Status: GOOD (  26.44  )
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

On Mon, Jun 13, 2022 at 04:21:47PM +0800, Wupeng Ma wrote:
> From: Ma Wupeng <mawupeng1@huawei.com>
> 
> If system have some mirrored memory and mirrored feature is not specified
> in boot parameter, the basic mirrored feature will be enabled and this will
> lead to the following situations:
> 
> - memblock memory allocation prefers mirrored region. This may have some
>   unexpected influence on numa affinity.
> 
> - contiguous memory will be split into several parts if parts of them
>   is mirrored memory via memblock_mark_mirror().
> 
> To fix this, variable mirrored_kernelcore will be checked in
> memblock_mark_mirror(). Mark mirrored memory with flag MEMBLOCK_MIRROR iff
> kernelcore=mirror is added in the kernel parameters.
> 
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> ---
>  mm/internal.h   | 2 ++
>  mm/memblock.c   | 3 +++
>  mm/page_alloc.c | 2 +-
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index c0f8fbe0445b..ddd2d6a46f1b 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -861,4 +861,6 @@ struct folio *try_grab_folio(struct page *page, int refs, unsigned int flags);
>  
>  DECLARE_PER_CPU(struct per_cpu_nodestat, boot_nodestats);
>  
> +extern bool mirrored_kernelcore;
> +
>  #endif	/* __MM_INTERNAL_H */
> diff --git a/mm/memblock.c b/mm/memblock.c
> index b1d2a0009733..a9f18b988b7f 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -924,6 +924,9 @@ int __init_memblock memblock_clear_hotplug(phys_addr_t base, phys_addr_t size)
>   */
>  int __init_memblock memblock_mark_mirror(phys_addr_t base, phys_addr_t size)
>  {
> +	if (!mirrored_kernelcore)
> +		return 0;
> +

Hmm, this changes the way x86 uses mirrored memory.
This change makes sense for x86 as well, but we should get an Ack from x86 folks.

>  	system_has_some_mirror = true;
>  
>  	return memblock_setclr_flag(base, size, 1, MEMBLOCK_MIRROR);
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index e008a3df0485..9b030aeb4983 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -356,7 +356,7 @@ static unsigned long required_kernelcore_percent __initdata;
>  static unsigned long required_movablecore __initdata;
>  static unsigned long required_movablecore_percent __initdata;
>  static unsigned long zone_movable_pfn[MAX_NUMNODES] __initdata;
> -static bool mirrored_kernelcore __meminitdata;
> +bool mirrored_kernelcore __initdata;
>  
>  /* movable_zone is the "real" zone pages in ZONE_MOVABLE are taken from */
>  int movable_zone;
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
