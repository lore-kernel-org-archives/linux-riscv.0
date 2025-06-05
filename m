Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9B4C5AE59
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 12:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KiatYXAFyjzJ31Tcn12/s+8CE8DzCorTi+Om/KqSrc0=; b=fwI2TRhVioK2dY
	oGXbzvi1ygQvguIi2hz4lhaX7KldI4rW9T9PrHuUiyhylAjnC9MVEBX2nWK4+hgXR74ko5K8trdD+
	vdV57BDAnGogdcyWse3lcSlvOuwk+k5YZ1FjkpnHBzPgaUldFs86JeRo/XgxdnNs4hMDTyotnEMxQ
	ei1AM7SrSiG1cJAOc7hmp2xkbP1xCj4mgY8TR0AIibe37FjIp3fFUhHQoj4fgcz3NqgzS4spdUj3v
	gKptJYwuFBjn1iulZojgggIK2a6oIUZ1tWgDKr/oSCcrrOR33RTlJ08nIABon+1t2AkoGavL6YT2v
	MR/kyiQhr13CZ1LLyFmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN9Sr-0000000FSLu-44D4;
	Thu, 05 Jun 2025 12:12:57 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN9So-0000000FSKs-2hss
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 12:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749125570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eCJkn2PLkOBoQ+g/YVc/8OYIcSE2y6YPjXDaWlpQP0U=;
	b=WprBXos/8/QifUnZtQTRFFHHwiY+E+Li0C2h1xiLA+mYyTkVwnsDp4xT62PmY2WKaoPS3F
	p+uYnrL8/SoTnHxynrtO+5HNPI6/GCdXuSTw2IrcV4skVqLGJw8mYqXJVYR9maitoI0jQ4
	N1j1UfCbJJJI3dVf20HM6l9Y7SvTzjc=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <13b573c3-c432-43f5-b687-deb3f72cdce0@lucifer.local>
Date: Thu, 5 Jun 2025 20:11:56 +0800
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 Barry Song <baohua@kernel.org>,
 David Hildenbrand <david@redhat.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Oscar Salvador <osalvador@suse.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Jann Horn <jannh@google.com>,
 loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-openrisc@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-mm@kvack.org
Message-Id: <E816127E-5BF6-4B00-AB7D-C151939A1236@linux.dev>
References: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
 <536f5ffd-b4cf-4f35-970c-ad3a7593af2f@suse.cz>
 <5a06f383-7d01-4ea7-a010-013063770240@lucifer.local>
 <1AA4A4B3-AEBE-484A-8EE2-35A15035E748@linux.dev>
 <13b573c3-c432-43f5-b687-deb3f72cdce0@lucifer.local>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_051255_113246_A3DDCDD6 
X-CRM114-Status: GOOD (  41.84  )
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



> On Jun 5, 2025, at 17:56, Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> 
> On Thu, Jun 05, 2025 at 05:42:16PM +0800, Muchun Song wrote:
>> 
>> 
>>> On Jun 5, 2025, at 17:24, Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>>> 
>>> On Thu, Jun 05, 2025 at 08:56:59AM +0200, Vlastimil Babka wrote:
>>>> On 6/4/25 16:19, Lorenzo Stoakes wrote:
>>>>> The walk_page_range_novma() function is rather confusing - it supports two
>>>>> modes, one used often, the other used only for debugging.
>>>>> 
>>>>> The first mode is the common case of traversal of kernel page tables, which
>>>>> is what nearly all callers use this for.
>>>>> 
>>>>> Secondly it provides an unusual debugging interface that allows for the
>>>>> traversal of page tables in a userland range of memory even for that memory
>>>>> which is not described by a VMA.
>>>>> 
>>>>> It is far from certain that such page tables should even exist, but perhaps
>>>>> this is precisely why it is useful as a debugging mechanism.
>>>>> 
>>>>> As a result, this is utilised by ptdump only. Historically, things were
>>>>> reversed - ptdump was the only user, and other parts of the kernel evolved
>>>>> to use the kernel page table walking here.
>>>>> 
>>>>> Since we have some complicated and confusing locking rules for the novma
>>>>> case, it makes sense to separate the two usages into their own functions.
>>>>> 
>>>>> Doing this also provide self-documentation as to the intent of the caller -
>>>>> are they doing something rather unusual or are they simply doing a standard
>>>>> kernel page table walk?
>>>>> 
>>>>> We therefore establish two separate functions - walk_page_range_debug() for
>>>>> this single usage, and walk_kernel_page_table_range() for general kernel
>>>>> page table walking.
>>>>> 
>>>>> We additionally make walk_page_range_debug() internal to mm.
>>>>> 
>>>>> Note that ptdump uses the precise same function for kernel walking as a
>>>> 
>>>> IMHO it's not clear at this point what "the precise same function" means.
>>>> 
>>>>> convenience, so we permit this but make it very explicit by having
>>>>> walk_page_range_novma() invoke walk_kernel_page_table_range() in this case.
>>>> 
>>>> ^ walk_page_range_debug()
>>> 
>>> Oops will fix.
>>> 
>>>> 
>>>> Maybe this could be reworded in the sense (AFAIU) that
>>>> walk_page_range_debug() can be used for both user space page table walking
>>>> or kernel depending on what mm is passed, so in the case of init_mm it
>>>> invokes walk_kernel_page_table_range() internally.
>>> 
>>> Sure.
>>> 
>>>> 
>>>>> 
>>>>> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>>> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>>>> ---
>>>>> v2:
>>>>> * Renamed walk_page_range_novma() to walk_page_range_debug() as per David.
>>>>> * Moved walk_page_range_debug() definition to mm/internal.h as per Mike.
>>>>> * Renamed walk_page_range_kernel() to walk_kernel_page_table_range() as
>>>>> per David.
>>>>> 
>>>>> v1 resend:
>>>>> * Actually cc'd lists...
>>>>> * Fixed mistake in walk_page_range_novma() not handling kernel mappings and
>>>>> update commit message to referene.
>>>>> * Added Mike's off-list Acked-by.
>>>>> * Fixed up comments as per Mike.
>>>>> * Add some historic flavour to the commit message as per Mike.
>>>>> https://lore.kernel.org/all/20250603192213.182931-1-lorenzo.stoakes@oracle.com/
>>>>> 
>>>>> v1:
>>>>> (accidentally sent off-list due to error in scripting)
>>>>> 
>>>>> arch/loongarch/mm/pageattr.c |  2 +-
>>>>> arch/openrisc/kernel/dma.c   |  4 +-
>>>>> arch/riscv/mm/pageattr.c     |  8 +--
>>>>> include/linux/pagewalk.h     |  7 ++-
>>>>> mm/hugetlb_vmemmap.c         |  2 +-
>>>>> mm/internal.h                |  4 ++
>>>>> mm/pagewalk.c                | 98 ++++++++++++++++++++++++------------
>>>>> mm/ptdump.c                  |  3 +-
>>>>> 8 files changed, 82 insertions(+), 46 deletions(-)
>>>>> 
>>>>> diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
>>>>> index 99165903908a..f5e910b68229 100644
>>>>> --- a/arch/loongarch/mm/pageattr.c
>>>>> +++ b/arch/loongarch/mm/pageattr.c
>>>>> @@ -118,7 +118,7 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask, pgp
>>>>> return 0;
>>>>> 
>>>>> mmap_write_lock(&init_mm);
>>>>> - ret = walk_page_range_novma(&init_mm, start, end, &pageattr_ops, NULL, &masks);
>>>>> + ret = walk_kernel_page_table_range(start, end, &pageattr_ops, NULL, &masks);
>>>>> mmap_write_unlock(&init_mm);
>>>> 
>>>> You've removed init_mm from walk_page_range_novma() but I see most callers
>>>> do the locking of init_mm immediately around it. This suggests a version
>>>> handling that automatically? A bit complicated by the read/write
>>>> possibilities, so maybe not worth wrapping? Just a thought, as David says ;)
>>> 
>>> Most callers write lock interestingly, but then one read lock's, so we can't
>>> just assume and would need to pass a boolean which would kind of suck.
>> 
>> Hi Lorenzo,
>> 
>> Actually, the write lock introduced in commit 8782fb61cc848 to fix the
>> race condition when walking user page tables can be replaced with a read
>> lock. As explained in commit b123d09304d86, it is safe to walk kernel
>> page tables while holding the mmap read lock. The function name
>> `walk_kernel_page_table_range` clearly indicates its purpose: walking
>> kernel page tables. Thus, using a read lock internally is appropriate
>> and safe. Please correct me, if I am wrong.
>> 
>> To further enhance robustness, it is better to add a WARN_ON check to
>> ensure that the address range passed to walk_kernel_page_table_range
>> is indeed within the kernel address space. This will help prevent any
>> accidental misuse and catch issues early.
>> 
> 
> Hi Muchun,
> 
> Thanks for the information. I'll chase up this locking stuff in a
> follow-up, if that's ok? As I want to get this refactoring landed first
> with the existing behaviour.

OK. Make sense.

> 
> I did wonder about doing a WARN_ON(), but I am concerned that perhaps there
> are some very odd architectures that place things in unusual locations... I
> guess this would be a addr >= TASK_SIZE check?

I think so.

> 
> On the 'weirdness' front, Jann's opinion is that the debug code shouldn't
> even be walking page tables without VMAs in userspace anyway (and to me -
> unless there's some weird arch-specific stuff out there - I am also
> perplexed by this).
> 
> So we should in theory just drop the ability to do this kind of traversal
> in general.
> 
> This is something I'll investigate...
> 
> There's also oddities like:
> 
> if (walk->mm == &init_mm || addr >= TASK_SIZE)
> 	pte = pte_offset_kernel(pmd, addr);
> else
> 	pte = pte_offset_map(pmd, addr);
> 
> In the walk_pte_range() function, which I feel is wrong - you should pass
> init_mm if you want to explore kernel page tables, so why are we doing this
> here?

I guess it is because some users want to walk kernel address space but
not mapped in init_mm (like efi_mm, see ptdump_efi_show()).

> 
> I wonder if it's for stuff like vsyscall which are ostensibly kernel
> addresses but accessible in userspace... but then would we really want to
> walk the page tables for this?
> 
> This is stuff I want dig into a little bit.
> 
> But overall, would you mind if I defer the WARN_ON() and other such stuff
> to a follow up?

No problem. It is up to you.

> 
> Just keen for us to firstly separate out the actual usages of these
> functions very clearly, and thanks to Mike's great suggestion also making
> the debug usage entirely mm-internal.
> 
> This should lay a foundation for introducing further sanity to the equation
> here :)
> 
> I will properly look into the commits you mention in preparation for a
> follow up though to be clear (your input is much appreciated! :)

Thank you! I look forward to your follow-up and any further insights you
might have.

Thanks.

> 
>> Muchun,
>> Thanks.
> 
> Cheers, Lorenzo
> 
>> 
>>> 
>>> Also other walkers assume the caller has the lock so it's consistent to
>>> keep it this way.
>>> 
>>>> 
>>>>> 
>>>>> flush_tlb_kernel_range(start, end);
>>>>> diff --git a/arch/openrisc/kernel/dma.c b/arch/openrisc/kernel/dma.c
>>>>> index 3a7b5baaa450..af932a4ad306 100644
>>>>> --- a/arch/openrisc/kernel/dma.c
>>>>> +++ b/arch/openrisc/kernel/dma.c
>>>>> @@ -72,7 +72,7 @@ void *arch_dma_set_uncached(void *cpu_addr, size_t size)
>>>>> * them and setting the cache-inhibit bit.
>>>>> */
>>>>> mmap_write_lock(&init_mm);
>>>>> - error = walk_page_range_novma(&init_mm, va, va + size,
>>>>> + error = walk_kernel_page_table_range(va, va + size,
>>>>> &set_nocache_walk_ops, NULL, NULL);
>>>>> mmap_write_unlock(&init_mm);
>>>>> 
>>>>> @@ -87,7 +87,7 @@ void arch_dma_clear_uncached(void *cpu_addr, size_t size)
>>>>> 
>>>>> mmap_write_lock(&init_mm);
>>>>> /* walk_page_range shouldn't be able to fail here */
>>>>> - WARN_ON(walk_page_range_novma(&init_mm, va, va + size,
>>>>> + WARN_ON(walk_kernel_page_table_range(va, va + size,
>>>>> &clear_nocache_walk_ops, NULL, NULL));
>>>>> mmap_write_unlock(&init_mm);
>>>>> }
>>>>> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
>>>>> index d815448758a1..3f76db3d2769 100644
>>>>> --- a/arch/riscv/mm/pageattr.c
>>>>> +++ b/arch/riscv/mm/pageattr.c
>>>>> @@ -299,7 +299,7 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
>>>>> if (ret)
>>>>> goto unlock;
>>>>> 
>>>>> - ret = walk_page_range_novma(&init_mm, lm_start, lm_end,
>>>>> + ret = walk_kernel_page_table_range(lm_start, lm_end,
>>>>>    &pageattr_ops, NULL, &masks);
>>>> 
>>>> Note this and other places break the second line's arguments alignment on
>>>> the opening bracket. Maybe it just shows it's a bit fragile style...
>>>> 
>>>> 
>>> 
>>> Yeah I know :) I know you won't believe this coming from me, but I was
>>> trying to minimise the churn :P



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
