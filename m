Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2F5CD8C9F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 12:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+jpB8BUkANATiFAdCAdVrIryVqf2VHQBKY5IBT8viY=; b=gexi5pVVuh06+4
	zfd74K6G1ROWmpShyOPChRLx3eZPRziWFDquIsD9YQ9fTrBOfvvXUtLJ94eR5WW46GDmzLPIZcLTn
	TNuRD/mZCPMTfKYUcPrvNTC6UmjDIcUSsd901tnqI+vsujZ5NegUfRqrO4RS2Jg/1Y66dn1kW862Z
	4aClDvdo0dhdPonxJRTuuYFmEnHw2oGbFRbGXNf2WQNCb4V1WDXKOCpaRPA3abRtOuw8o6S9YmgEs
	l/Wqrt+chZHWOHMWUJTEvQaOH5TtaEAHx5cr7eZkfRyWdzQERMVjRrGGiVoqdlQtG3RFD02dpJlOU
	mdmcSs9UH6FZMnTqHWIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZKh-00000003X9k-34ed;
	Mon, 08 Jun 2026 12:43:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZKg-00000003X9a-1hL3
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 12:43:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 029FC436E5;
	Mon,  8 Jun 2026 12:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54371F00893;
	Mon,  8 Jun 2026 12:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780922637;
	bh=jLcAgrGvi7SdC6jzoWYkO8ugj2qnlkxJAEGttFGnMYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DHnK39PrKhgM7DYyE01pxLC54LX0SCxyFWnIQzirig+X6sZr2BHTLJf6S2tHfhKvL
	 eO7n9PDRIir2s2KuMp6sM0ondR+wUlGC+jLXoElgEEzFubTr5tpX/U4heFDIpvBgdT
	 WBqn+pZeyDxEtzZbSbJclOQ+p9AMnn2KM6RdmMVnMoOqVQYFNgIZgf6RtNnDKDRunW
	 um9mx6AV8C82N/6ZLatVW2MQJL0kdSA/nKNyVtED30vgmaIuhzBgVs/DA1e2ex6uMl
	 xtYvnMRJXGNhVz9BbXsztfLcfTX88DXUXhfGU+wv/5v3mQtX58GiiqB42UVneQ2Tqf
	 MSh7xYhvgNZAQ==
Message-ID: <3c88dee8-6fcd-4f72-9a73-17044214b087@kernel.org>
Date: Mon, 8 Jun 2026 14:43:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] riscv: mm: Avoid spurious fault after hotplugging
 vmemmap
To: Vivian Wang <wangruikang@iscas.ac.cn>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20260605-mark-after-vmemmap-populate-v3-1-a06001ac9264@iscas.ac.cn>
 <da19ffcf-8042-4f96-9c2d-649468dc6a0a@kernel.org>
 <953d7a60-456d-4629-b133-afce62cc5b3e@iscas.ac.cn>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <953d7a60-456d-4629-b133-afce62cc5b3e@iscas.ac.cn>
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

On 6/8/26 04:24, Vivian Wang wrote:
> On 6/5/26 17:16, David Hildenbrand (Arm) wrote:
>> On 6/5/26 07:23, Vivian Wang wrote:
>>> section_activate() does not flush TLB after populating new vmemmap
>>> pages. On most architectures, this is okay. However it is a problem on
>>> RISC-V since there the TLB caching non-present entries is permitted,
>>> which causes spurious faults on some hardwares.
>>>
>>> This seems to be most easily reproduced with DEBUG_VM=y and
>>> PAGE_POISONING=y, which causes these newly mapped struct pages to be
>>> poisoned i.e. written to immediately after mapping.
>>>
>>> Add a hook vmemmap_populate_finalize() in __populate_section_memmap()
>>> after population, to allow architectures to handle such situations as
>>> needed. Then implement it on RISC-V to arrange for the existing
>>> exception handler code to deal with these faults if they happen.
>>>
>>> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>>> ---
>>> Depends on my earlier kfence fixes for mark_new_valid_map() [1].
>>>
>>> Found while testing AMD_HSA/ZONE_DEVICE on SpacemiT K3. Using
>>> ZONE_DEVICE requires another fix [2].
>>>
>>> [1]: https://lore.kernel.org/linux-riscv/20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn
>>> [2]: https://lore.kernel.org/linux-riscv/20260309-riscv-sparsemem-vmemmap-limits-v1-2-f40efe18e3cd@iscas.ac.cn
>>> ---
>>> Changes in v3:
>>> - Merged back into one patch (Mike)
>>> - (No code changes otherwise.)
>>> - Link to v2: https://patch.msgid.link/20260604-mark-after-vmemmap-populate-v2-0-ab6a7d03b434@iscas.ac.cn
>>>
>>> Changes in v2:
>>> - Split patch in two, hook point and riscv hook 
>>> - Explain hook necessity in patch 1 message (Mike)
>>> - Make hook #define based (Mike)
>>> - Call finalize hook only on populate success
>>> - Link to v1: https://patch.msgid.link/20260525-mark-after-vmemmap-populate-v1-1-e698d859ba16@iscas.ac.cn
>>> ---
>>>  arch/riscv/include/asm/pgtable.h | 4 ++++
>>>  arch/riscv/mm/init.c             | 6 ++++++
>>>  mm/sparse-vmemmap.c              | 8 ++++++++
>>>  3 files changed, 18 insertions(+)
>>>
>>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>>> index a1a7c6520a09..aa0f50e3d534 100644
>>> --- a/arch/riscv/include/asm/pgtable.h
>>> +++ b/arch/riscv/include/asm/pgtable.h
>>> @@ -1243,6 +1243,10 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>>>  #define TASK_SIZE	FIXADDR_START
>>>  #endif
>>>  
>>> +/* Needed on SPARSEMEM_VMEMMAP */
>>> +#define vmemmap_populate_finalize vmemmap_populate_finalize
>>> +void __meminit vmemmap_populate_finalize(void);
>>> +
>>>  #else /* CONFIG_MMU */
>>>  
>>>  #define PAGE_SHARED		__pgprot(0)
>>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>>> index 706f43523935..cf9ae4099f82 100644
>>> --- a/arch/riscv/mm/init.c
>>> +++ b/arch/riscv/mm/init.c
>>> @@ -1360,6 +1360,12 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>>  	 */
>>>  	return vmemmap_populate_hugepages(start, end, node, altmap);
>>>  }
>>> +
>>> +void __meminit vmemmap_populate_finalize(void)
>>> +{
>>> +	/* Avoid faults on cached non-present TLB entries. */
>>> +	mark_new_valid_map();
>>> +}
>>>  #endif
>> How does mark_new_valid_map() handle concurrent access?
>>
>> There is some comment in there, but I am not sure if that actually implies that
>> mark_new_valid_map() can be called concurrently from arbitrary context?
> 
> AFAICT, yes, it is intended to be used concurrently from arbitrary
> context, and this is why I used them.
> 
> I had not originally written the code, so some riscv maintainer can
> maybe chime in on this, but as I understand it the idea is that we only
> ever set bits in the bitmap in mark_new_valid_map() while "allocating",
> whereas the assembly code in handle_exception in
> arch/riscv/kernel/entry.S only ever clears individual bits. So at least
> the access to the bitmap itself should be fine.

Right, flush_cache_vmap() looks like a bitmap_set() -- non-atomically.

.Lnew_vmalloc_kernel_address does an atomic bitmap clearing ("Atomically reset
the current cpu bit in new_vmalloc").

I am primarily wondering whether we'd want atomic bit-setting as well?

> 
> This was added in commit 503638e0babf ("riscv: Stop emitting preventive
> sfence.vma for new vmalloc mappings").
> 
> Do you think the mark_new_valid_map() function needs extra
> synchronization like smp_wmb()?

Right, I wonder about atomic access, but also about memory barriers.

-- 
Cheers,

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
