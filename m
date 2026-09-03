Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A58C624DA
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 10:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tn7FCPiK//L/C6AdCLFPmVWpuDme4cELeGEywJmc6Hs=; b=zlkXmWeBVIkAhJ
	gAklKMYG76BLuUao7esGmywNgRYk6bKZefK7dGRw5llqB3TkgsBy+/Sgn0ZJwp28hwpvV4PTghb6j
	hy7i3JvQK/JRqRpz5ob56TOjRI5RP28R550SORXPQipNVm8Yyjy3m8xi4ZYrMv0YURSeBsNZOmrKQ
	p+xuN7Hkuj1+dU9Jn4s7eEEhB+a9IbQ/7zvfxhVZQpcm1gua8Ha2fFGIB/cxhxpK0qMBTjndYapep
	WDDLWu+SSGsiO3bA8gWSRuLfPGfekeInFI+H2yiv6ayQfIgQf4APd9gHxF0e6hO5fyxQdnh5t2Mrq
	/6kNADicEfKNkYveysQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24bH-0000000H4zj-2k3B;
	Thu, 03 Sep 2026 10:23:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24bF-0000000H4yW-0HZz;
	Thu, 03 Sep 2026 10:23:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEEC01596;
	Thu,  3 Sep 2026 03:23:10 -0700 (PDT)
Received: from [10.164.19.53] (unknown [10.164.19.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FE2E3F673;
	Thu,  3 Sep 2026 03:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788430994; bh=iUywY2IiysJfGPAbilGGDVIEIyRtSo6UGII8tss/bb0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EqxlNHGTD3e9aQqDNFqnK+pMnPi2j8ej/8JGUW+djmFF3bt0d5I2VtIs0GgjASjO3
	 cxcu8w8nRwPZbX3asa0BnIJkvLxgpsVdKvWfRLKvulXt2387yNxUQU58hZZgNcxGvt
	 zERHDI1EDorHtjtwpyhBIGPdC5Ajwhh57/jwuGlw=
Message-ID: <0e9c9426-9b52-485e-b3b6-1fe19c8c2bb2@arm.com>
Date: Thu, 3 Sep 2026 15:53:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] mm/vmalloc: set area's page_order after allocation
 succeeds
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Len Brown <lenb@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Thomas Gleixner <tglx@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
 Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20260903-execmem-set-vm-perms-v0-2-v3-0-949b64a9f755@kernel.org>
 <20260903-execmem-set-vm-perms-v0-2-v3-2-949b64a9f755@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260903-execmem-set-vm-perms-v0-2-v3-2-949b64a9f755@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_032317_194497_F27E1D4C 
X-CRM114-Status: GOOD (  21.30  )
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



On 03/09/26 2:58 pm, Mike Rapoport (Microsoft) wrote:
> __vmalloc_area_node() calls set_vm_area_page_order() to set area's
> page_order before actually allocating pages to populate the area.
> 
> If allocation of large pages in HUGE_VMAP case fails midway, this leaves
> the area with elevated page_order throughout the cleanup path.
> 
> There is no actual issue with this because the only place that currently
> relies on area->page_order on the cleanup path is the loop calculating
> the direct map alias range in vm_reset_perms() and it anyway skips
> unpopulated pages.
> 
> But having set_vm_area_page_order() in the middle of __vmalloc_area_node()
> makes things very obscure, hard to reason about and error prone against
> future changes of the cleanup path.
> 
> Move the call to set_vm_area_page_order() just before the successful
> return from __vmalloc_area_node() where page order is guaranteed.
> 
> While on it, initialize local page_order variable with its declaration.
> 
> Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  mm/vmalloc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 0380917392e68..22aa554d123f5 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3879,7 +3879,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
>  	unsigned long size = get_vm_area_size(area);
>  	unsigned long array_size;
>  	unsigned long nr_small_pages = size >> PAGE_SHIFT;
> -	unsigned int page_order;
> +	unsigned int page_order = page_shift - PAGE_SHIFT;
>  	unsigned int flags;
>  	int ret;
>  
> @@ -3907,9 +3907,6 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
>  		goto fail;
>  	}
>  
> -	set_vm_area_page_order(area, page_shift - PAGE_SHIFT);
> -	page_order = vm_area_page_order(area);

vm_area_page_order() returns zero in case !CONFIG_HAVE_ARCH_HUGE_VMALLOC. So
it may happen that after this patch the page_shift passed to the page-allocator
is > PAGE_SHIFT but that got rejected by vm_area_page_order.

But that won't happen because for page_shift > PAGE_SHIFT to be passed to
__vmalloc_area_node(), we need "vmap_huge" to be true, which needs
CONFIG_HAVE_ARCH_HUGE_VMALLOC.

Writing this out because CONFIG_HAVE_ARCH_HUGE_VMALLOC and CONFIG_HAVE_ARCH_HUGE_VMAP
along with mixing variable names with vmap is extremely confusing.

Reviewed-by: Dev Jain <dev.jain@arm.com>

> -
>  	/*
>  	 * High-order nofail allocations are really expensive and
>  	 * potentially dangerous (pre-mature OOM, disruptive reclaim
> @@ -3964,6 +3961,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
>  		goto fail;
>  	}
>  
> +	set_vm_area_page_order(area, page_order);
>  	return area->addr;
>  
>  fail:
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
