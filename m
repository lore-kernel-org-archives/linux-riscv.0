Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC368CD8C90
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 02:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tS+OxHNMGNcJF4pSOjZPVSVa5H5xVzPmCFwyMdtjceI=; b=ohrd8pmNnh+qev
	3xNqE2C0FQKrfXj6aVtD7KWKfVS5JE3lImQyrIOit49brwDlGckTa6qbr67euR+tZXj4eme/JmfK9
	zStiTUUJ7gg7y0zH7E3R1hkCQQ22+EiDiVxEBIZTtJbTE6qxexOm2MUlxKxI+hxyxe3sRiqR3jNpy
	Cf8epEkTMKqpHgHNMuJUhzeaG8SnMzGz3ZxWHTJB3Mnn1uVXuHkKjJ+bfKWjpsG+DYhZeR41tzeff
	v4ei4qVB8lGgJasUoMcsjXdGLOIr0ZyAIz+/Kv0so/yEsr00Pk8nn26cDh4FfAHeJWe7YPPkxqKmv
	Hyjx6xMocm7hguWK+nmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPfY-00000002ieL-1Y0Z;
	Mon, 08 Jun 2026 02:24:52 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPfT-00000002idf-36FL
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 02:24:50 +0000
Received: from [10.213.6.59] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABnTOPhJyZqff_8Ew--.21152S2;
	Mon, 08 Jun 2026 10:24:33 +0800 (CST)
Message-ID: <953d7a60-456d-4629-b133-afce62cc5b3e@iscas.ac.cn>
Date: Mon, 8 Jun 2026 10:24:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] riscv: mm: Avoid spurious fault after hotplugging
 vmemmap
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20260605-mark-after-vmemmap-populate-v3-1-a06001ac9264@iscas.ac.cn>
 <da19ffcf-8042-4f96-9c2d-649468dc6a0a@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <da19ffcf-8042-4f96-9c2d-649468dc6a0a@kernel.org>
X-CM-TRANSID: rQCowABnTOPhJyZqff_8Ew--.21152S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCryrGr45AFWxGFy8JF4ktFb_yoWrAFW8pF
	WUWFs5KF45Jrn3uws2vw17WF1rKwnYgr1xKw15G348ZrW3Ary8Wrn5KayYqry3XF4kua40
	v3WY9ry5Ca4DAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F
	4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjxUqdHjUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_192448_164200_BCFF20F2 
X-CRM114-Status: GOOD (  18.85  )
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

On 6/5/26 17:16, David Hildenbrand (Arm) wrote:
> On 6/5/26 07:23, Vivian Wang wrote:
>> section_activate() does not flush TLB after populating new vmemmap
>> pages. On most architectures, this is okay. However it is a problem on
>> RISC-V since there the TLB caching non-present entries is permitted,
>> which causes spurious faults on some hardwares.
>>
>> This seems to be most easily reproduced with DEBUG_VM=y and
>> PAGE_POISONING=y, which causes these newly mapped struct pages to be
>> poisoned i.e. written to immediately after mapping.
>>
>> Add a hook vmemmap_populate_finalize() in __populate_section_memmap()
>> after population, to allow architectures to handle such situations as
>> needed. Then implement it on RISC-V to arrange for the existing
>> exception handler code to deal with these faults if they happen.
>>
>> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>> ---
>> Depends on my earlier kfence fixes for mark_new_valid_map() [1].
>>
>> Found while testing AMD_HSA/ZONE_DEVICE on SpacemiT K3. Using
>> ZONE_DEVICE requires another fix [2].
>>
>> [1]: https://lore.kernel.org/linux-riscv/20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn
>> [2]: https://lore.kernel.org/linux-riscv/20260309-riscv-sparsemem-vmemmap-limits-v1-2-f40efe18e3cd@iscas.ac.cn
>> ---
>> Changes in v3:
>> - Merged back into one patch (Mike)
>> - (No code changes otherwise.)
>> - Link to v2: https://patch.msgid.link/20260604-mark-after-vmemmap-populate-v2-0-ab6a7d03b434@iscas.ac.cn
>>
>> Changes in v2:
>> - Split patch in two, hook point and riscv hook 
>> - Explain hook necessity in patch 1 message (Mike)
>> - Make hook #define based (Mike)
>> - Call finalize hook only on populate success
>> - Link to v1: https://patch.msgid.link/20260525-mark-after-vmemmap-populate-v1-1-e698d859ba16@iscas.ac.cn
>> ---
>>  arch/riscv/include/asm/pgtable.h | 4 ++++
>>  arch/riscv/mm/init.c             | 6 ++++++
>>  mm/sparse-vmemmap.c              | 8 ++++++++
>>  3 files changed, 18 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> index a1a7c6520a09..aa0f50e3d534 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -1243,6 +1243,10 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>>  #define TASK_SIZE	FIXADDR_START
>>  #endif
>>  
>> +/* Needed on SPARSEMEM_VMEMMAP */
>> +#define vmemmap_populate_finalize vmemmap_populate_finalize
>> +void __meminit vmemmap_populate_finalize(void);
>> +
>>  #else /* CONFIG_MMU */
>>  
>>  #define PAGE_SHARED		__pgprot(0)
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index 706f43523935..cf9ae4099f82 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -1360,6 +1360,12 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>  	 */
>>  	return vmemmap_populate_hugepages(start, end, node, altmap);
>>  }
>> +
>> +void __meminit vmemmap_populate_finalize(void)
>> +{
>> +	/* Avoid faults on cached non-present TLB entries. */
>> +	mark_new_valid_map();
>> +}
>>  #endif
> How does mark_new_valid_map() handle concurrent access?
>
> There is some comment in there, but I am not sure if that actually implies that
> mark_new_valid_map() can be called concurrently from arbitrary context?

AFAICT, yes, it is intended to be used concurrently from arbitrary
context, and this is why I used them.

I had not originally written the code, so some riscv maintainer can
maybe chime in on this, but as I understand it the idea is that we only
ever set bits in the bitmap in mark_new_valid_map() while "allocating",
whereas the assembly code in handle_exception in
arch/riscv/kernel/entry.S only ever clears individual bits. So at least
the access to the bitmap itself should be fine.

This was added in commit 503638e0babf ("riscv: Stop emitting preventive
sfence.vma for new vmalloc mappings").

Do you think the mark_new_valid_map() function needs extra
synchronization like smp_wmb()?

Regards,
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
