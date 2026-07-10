Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74819C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 01:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkLjF7cQZCBfYYoQvN6yShcspxFR4nVtaMiy7xm+xZs=; b=Emkxa9+fYryq0g
	/e805L/VA3hiMpRAkyjq/C/1IaXLjUhHA5ZV6E3Uo//b6uCZWc2pmuvRt4KeeWoHu5nM87/Od4och
	Gk7tvKP8FNOSl99uYsRwz2u8CmvgwEtpOMsiVfj4iDbZzDHTutZmhqsrbgSnowOXzBf91iYsD3yMQ
	5OcDWyERe+dbCPDkzi2JpjM0FJ9ar/+M9QCpNGS2XiAIFQxg0cDOocp/9/kjYd3wfckZLo4IgJwto
	WEIYXHr+Em5xJ1M0Q1fBML/1g+Z7ocKMQCH7rKX3Oj9NZtxRwTAkZXH0A2oDS8MqjemmKnXWjkDOB
	CbjLTqvc1+Asmd2YVfLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0VX-00000003vxa-1Up0;
	Fri, 10 Jul 2026 01:58:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0VW-00000003vxD-2RAK
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 01:58:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF53F42CBF;
	Fri, 10 Jul 2026 01:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC281F000E9;
	Fri, 10 Jul 2026 01:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783648705;
	bh=31QGHBL7hL4Fq4DMfqiOa2FOYxi7YJIdv0o6jQ5a0cE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=MGalIMuSksQjYh3t9v2KG/f3fveZH7k1wlOpxdiQrmVDRZTtwPlcMyaO5qXxQTHo7
	 +yK3DO3g3dkP/103x3fpxGVwvsG0aEUo5o+FfBbjaFsq03/jnJ0SOimJ76IXBL8zjg
	 gP186Lyy7UJQ9xoyIJ6GGR1lBEKONAAn5d+N1Jow/we7QS1mq+9Qee9rGzjgouUqf8
	 +Aqfw0SZrsj02mxky66wvNy2dQQAaOm1zh+QsdwoqO69fsUvzJK8FETbE6o9Xy7bgI
	 F11xwp/iOfKPjg5Qd+PoOeh1VZA5HNR7TXc7XCu3FPfUG18fEDf3cXm4gBFrEdVh12
	 7AcCj1awkMXpQ==
Date: Thu, 9 Jul 2026 19:58:23 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
cc: Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>, 
    David Hildenbrand <david@kernel.org>, 
    "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
    Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Vlastimil Babka <vbabka@kernel.org>, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
    Muchun Song <muchun.song@linux.dev>
Subject: Re: [PATCH v5] mm/sparse-vmemmap: flush_cache_vmap() after hotplugging
 vmemmap
In-Reply-To: <20260707-mark-after-vmemmap-populate-v5-1-77d1ded3cae3@iscas.ac.cn>
Message-ID: <db0de3be-a6e1-e4c7-6a1f-2f573499a2b7@kernel.org>
References: <20260707-mark-after-vmemmap-populate-v5-1-77d1ded3cae3@iscas.ac.cn>
MIME-Version: 1.0
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

Hi Vivian,

On Tue, 7 Jul 2026, Vivian Wang wrote:

> section_activate() does not flush TLB after populating new vmemmap
> pages. On most architectures, this is okay. However it is a problem on
> RISC-V since there the TLB caching non-present entries is permitted,
> which causes spurious faults on some hardwares.
> 
> This seems to be most easily reproduced with DEBUG_VM=y and
> PAGE_POISONING=y, which causes these newly mapped struct pages to be
> poisoned i.e. written to immediately after mapping.
> 
> Extend the RISC-V flush_cache_vmap() to also handle the vmemmap range,
> and call it after hotplugging vmemmap, which gets the possible spurious
> fault handled in the exception handler.
> 
> At least for now, the only other architecture with both
> SPARSEMEM_VMEMMAP and flush_cache_vmap() is PowerPC, which has a similar
> problem with newly valid PTEs. But there flush_cache_vmap() is just a
> ptesync. So it should be safe to do this for generic code while having
> minimal performance impact.
> 
> Suggested-by: Muchun Song <muchun.song@linux.dev>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> Changes in v5:
> - Remove hook, use existing flush_cache_vmap() (Muchun)
> - Link to v4: https://patch.msgid.link/20260630-mark-after-vmemmap-populate-v4-1-febbc15da028@iscas.ac.cn
> 
> Changes in v4:
> - Rebase on v7.2-rc1, drop dependencies
> - (No code changes otherwise)
> - (A concurrency fix for mark_new_valid_map was sent independently)
>   https://lore.kernel.org/linux-riscv/20260629-riscv-mm-new-valid-map-ordering-v1-1-60d8c10c6292@iscas.ac.cn/
> - Link to v3: https://patch.msgid.link/20260605-mark-after-vmemmap-populate-v3-1-a06001ac9264@iscas.ac.cn
> 
> (See v3 link for older changes)
> ---
>  arch/riscv/include/asm/cacheflush.h | 3 ++-
>  arch/riscv/mm/init.c                | 1 +
>  mm/sparse-vmemmap.c                 | 2 ++
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index 8cfe59483a8f..e935db27f09f 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -56,7 +56,8 @@ static inline void mark_new_valid_map(void)
>  #define flush_cache_vmap flush_cache_vmap
>  static inline void flush_cache_vmap(unsigned long start, unsigned long end)
>  {
> -	if (is_vmalloc_or_module_addr((void *)start))
> +	if (is_vmalloc_or_module_addr((void *)start) ||
> +	    (start >= VMEMMAP_START && end <= VMEMMAP_END))

Is there an off-by-one error here?  VMEMMAP_END is currently set to
VMALLOC_START on RISC-V.

Am assuming you'll update this patch one more time?  At that point I'll 
plan to add it into v7.2-rc, assuming Andrew doesn't object.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
