Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDDDD1039D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 12:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NGzsJgEIYmwfvepOfcA6Y6HtAO6eDgvwEH4MnX8WkB0=; b=j+DtYSL9A5wKke
	qMJHnOzYD35c2+60n0khv/b9rIlHhkxJcDlCtusjQYFav/ZY4+XJ/q2EyTw3sSgXfDuvmi3CbKyCY
	nxJOhnOUodCQrW7jtwFQgmOXyJKJGl6ZR0kA3Btksci1biJyheM9jJsnLy9cp+YzXlDytFPQjF+dl
	J+E0PvBKW9km7iCNCEIBBPOIu+ZdqR3LduFrZc/qJFcT7kHzZIRJTWlaUF/0epgUFKsfryyqbvrRk
	moJy5YcjeZaIwj0UnJKVU187RsTUg0DeiPICf1e2krHblTrihJ8YO5Dvt0ckgEhJYcsarQ4DsV0VO
	PjsSRRsfRAG4Y+3LGg9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOEk4-0000000EzFh-0SHQ;
	Wed, 26 Nov 2025 12:35:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOEk1-0000000EzFH-23Vz
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 12:35:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FE11439DF;
	Wed, 26 Nov 2025 12:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C6FC113D0;
	Wed, 26 Nov 2025 12:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764160524;
	bh=rXwhATyOSB0m9x5O2nBFhUNTR3ETov+bBvaSAYz2hFU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ueGpeTww704+deIDOHRU6afye/CjFOPnI68YfLCYGwa2NIBPqhUBIG9JbhbzRNOlQ
	 MDosOn8WFxDBLdQjMUPJzxabKUIYqrxykB8/Ijg5DJ97xWCgkyH+V3/uZfH2HEiV48
	 2K+AvWiwMmOZWZgAuUZU1DF7SHQ6rB99llGyPyoUHqmCcwWWeXDZuerABOAfmckBoB
	 Fz49pQs3cVvv03oyAhYOK/uOX3N7UpWpjPxK1Rru+yGugebJwEwZR5a0azN71kSdh8
	 Ygm00azLCFgyKYsfXl3GthpfDfeTd+HRtirSPED6tqpjyHwnLb5PXOKwpEB/boWyFp
	 eWdeSrdF4KsLw==
Message-ID: <71123d7a-641b-41df-b959-88e6c2a3a441@kernel.org>
Date: Wed, 26 Nov 2025 13:35:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/22] mm: Always use page table accessor functions
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org, devicetree@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh+dt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Anshuman Khandual <anshuman.khandual@arm.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
 <20251113014656.2605447-7-samuel.holland@sifive.com>
 <02e3b3bd-ae6a-4db4-b4a1-8cbc1bc0a1c8@arm.com>
 <bc88d132-452a-42a1-9ee5-5407334d8aac@kernel.org>
 <df7d10ba-bb42-4ea1-8c5b-5db88a18eccb@kernel.org>
 <6bdf2b89-7768-4b90-b5e7-ff174196ea7b@lucifer.local>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <6bdf2b89-7768-4b90-b5e7-ff174196ea7b@lucifer.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_043526_055346_8989BBAD 
X-CRM114-Status: GOOD (  26.54  )
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

On 11/26/25 13:27, Lorenzo Stoakes wrote:
> On Wed, Nov 26, 2025 at 01:19:00PM +0100, David Hildenbrand (Red Hat) wrote:
>> On 11/26/25 13:16, David Hildenbrand (Red Hat) wrote:
>>> On 11/26/25 12:09, Ryan Roberts wrote:
>>>> On 13/11/2025 01:45, Samuel Holland wrote:
>>>>> Some platforms need to fix up the values when reading or writing page
>>>>> tables. Because of this, the accessors must always be used; it is not
>>>>> valid to simply dereference a pXX_t pointer.
>>>>>
>>>>> Fix all of the instances of this pattern in generic code, mostly by
>>>>> applying the below coccinelle semantic patch, repeated for each page
>>>>> table level. Some additional fixes were applied manually, mostly to
>>>>> macros where type information is unavailable.
>>>>>
>>>>> In a few places, a `pte_t *` or `pmd_t *` is actually a pointer to a PTE
>>>>> or PMDE value stored on the stack, not a pointer to a page table. In
>>>>> those cases, it is not appropriate to use the accessors, because the
>>>>> value is not globally visible, and any transformation from pXXp_get()
>>>>> has already been applied. Those places are marked by naming the pointer
>>>>> `ptentp` or `pmdvalp`, as opposed to `ptep` or `pmdp`.
>>>>>
>>>>> @@
>>>>> pte_t *P;
>>>>> expression E;
>>>>> expression I;
>>>>> @@
>>>>> - P[I] = E
>>>>> + set_pte(P + I, E)
>>>>>
>>>>> @@
>>>>> pte_t *P;
>>>>> expression E;
>>>>> @@
>>>>> (
>>>>> - WRITE_ONCE(*P, E)
>>>>> + set_pte(P, E)
>>>>> |
>>>>> - *P = E
>>>>> + set_pte(P, E)
>>>>> )
>>>>
>>>> There should absolutely never be any instances of core code directly setting an
>>>> entry at any level. This *must* always go via the arch code helpers. Did you
>>>> find any instances of this? If so, I would consider these bugs and suggest
>>>> sending as a separate bugfix patch. Bad things could happen on arm64 because we
>>>> may need to break a contiguous mapping, which would not happen if the value is
>>>> set directly.
>>>>
>>>>>
>>>>> @@
>>>>> pte_t *P;
>>>>> expression I;
>>>>> @@
>>>>> (
>>>>>      &P[I]
>>>>> |
>>>>> - READ_ONCE(P[I])
>>>>> + ptep_get(P + I)
>>>>> |
>>>>> - P[I]
>>>>> + ptep_get(P + I)
>>>>> )
>>>>>
>>>>> @@
>>>>> pte_t *P;
>>>>> @@
>>>>> (
>>>>> - READ_ONCE(*P)
>>>>> + ptep_get(P)
>>>>> |
>>>>> - *P
>>>>> + ptep_get(P)
>>>>> )
>>>>
>>>> For reading the *PTE*, conversion over to ptep_get() should have already been
>>>> done (I did this a few years back when implementing support for arm64 contiguous
>>>> mappings). If you find any cases where direct dereference or READ_ONCE() is
>>>> being done in generic code for PTE, then that's a bug and should also be sent as
>>>> a separate patch.
>>>>
>>>> FYI, my experience was that Coccinelle didn't find everything when I was
>>>> converting to ptep_get() - although it could have been that my Cochinelle skills
>>>> were not up to scratch! I ended up using an additional method where I did a
>>>> find/replace to convert "pte_t *" to "ptep_handle_t" and declared pte_handle_t
>>>> as a void* which causes a compiler error on dereference. Then in a few key
>>>> places I did a manual case from pte_handle_t to (pte_t *) and compiled allyesconfig.
>>>>
>>>> I'm assuming the above Cocchinelle template was also used for pmd_t, pud_t,
>>>> p4d_t and pgd_t?
>>>>
>>>>>
>>>>> Additionally, the following semantic patch was used to convert PMD and
>>>>> PUD references inside struct vm_fault:
>>>>>
>>>>> @@
>>>>> struct vm_fault vmf;
>>>>> @@
>>>>> (
>>>>> - *vmf.pmd
>>>>> + pmdp_get(vmf.pmd)
>>>>> |
>>>>> - *vmf.pud
>>>>> + pudp_get(vmf.pud)
>>>>> )
>>>>>
>>>>> @@
>>>>> struct vm_fault *vmf;
>>>>> @@
>>>>> (
>>>>> - *vmf->pmd
>>>>> + pmdp_get(vmf->pmd)
>>>>> |
>>>>> - *vmf->pud
>>>>> + pudp_get(vmf->pud)
>>>>> )
>>>>>
>>>>>
>>>>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>>>>> ---
>>>>> This commit covers some of the same changes as an existing series from
>>>>> Anshuman Khandual[1]. Unlike that series, this commit is a purely
>>>>> mechanical conversion to demonstrate the RISC-V changes, so it does not
>>>>> insert local variables to avoid redundant calls to the accessors. A
>>>>> manual conversion like in that series could improve performance.
>>>>>
>>>>> [1]: https://lore.kernel.org/linux-mm/20240917073117.1531207-1-anshuman.khandual@arm.com/
>>>>
>>>> Hi,
>>>>
>>>> I've just come across this patch and wanted to mention that we could also
>>>> benefit from this improved absraction for some features we are looking at for
>>>> arm64. As you mention, Anshuman had a go but hit some roadblocks.
>>>>
>>>> The main issue is that the compiler was unable to optimize away the READ_ONCE()s
>>>> for the case where certain levels of the pgtable are folded. But it can optimize
>>>> the plain C dereferences. There were complaints the the generated code for arm
>>>> (32) and powerpc was significantly impacted due to having many more (redundant)
>>>> loads.
>>>>
>>>
>>> We do have mm_pmd_folded()/p4d_folded() etc, could that help to sort
>>> this out internally?
>>>
>>
>> Just stumbled over the reply from Christope:
>>
>> https://lkml.kernel.org/r/0019d675-ce3d-4a5c-89ed-f126c45145c9@kernel.org
>>
>> And wonder if we could handle that somehow directly in the pgdp_get() etc.
> 
> I find that kind of gross to be honest. Isn't the whole point of folding that we
> don't have to think about it...

If we could adjust generic pgdp_get() and friends to not do a 
READ_ONCE() once folded we might not have to think about that in the 
callers.

Just an idea, though, not sure if that would fly the way I envision it.

-- 
Cheers

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
