Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B581D11196
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 20:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8C1kJVmdawm/D2roOWVf+x8REyiYZ91XwsE412TiLpc=; b=TKACO3R+0+zhDQ
	pWOTiU+riRuHPEOJ0/GbNJR+KA5MOYC2aWv7CBvx15mNKkqzMtXYfABGc3QD/cCBtl2oO9ItByC4Y
	Nipkjq2eNyZYg3Odvx36vYilbsDrnWO07z4Oh3DjD8vRwLlY6eBRgLgHbumRLyUlueEveRzHeduiy
	eQU98X6lO7mQTPWYtIejgW7PdrOK0eH0qFZ5ptej3RBake1f/5aCy4UYIg3riFC7BnLtIGvHU3i+R
	/rXSAsWK7OqbMIQGJjyP28IdSk+sugW+iPdu91oOhwroxL+Z1jd4wcuWgt+ok54vo17/dmZTc6iQ/
	Yvm9Nsn7CDzTBXPJoc9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOMBQ-0000000FcjJ-0GVk;
	Wed, 26 Nov 2025 20:32:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOMBP-0000000Fcj0-0kZT
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 20:32:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C98D60240;
	Wed, 26 Nov 2025 20:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3847CC4CEF7;
	Wed, 26 Nov 2025 20:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764189129;
	bh=khfCF391HTb9ZHzqQ+60+gHc4LAP9io5EVEWBl7iijM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jx/Kgk+52Vj2FhMiZ6roXAU107DOPSpYbR54l0SQDWU1t4R7bMm8s+HInc6989b/V
	 2cDeU+ZWwLLmnlIHfOpksf+IBP4hNK1ffXi/vUjPpjPeMUHWhngzJAH08bkmRCtygB
	 JQYHqUKbcZT0vUQ9yMZl+kC9/gmskU6bpNYXfnQDKqkyCGA0RSgB7OzgPbQ8c3/498
	 Hj59w7VENc7+o6gJI8CLIr1pUNoVV+wBzyXoI68l0omVxKWgWCP/hDOMsqKxthd0sc
	 wzgbPhsCM4izLtPHPs9w/dlr+8C1vK0GSmWsZcSnhl5za7yLVxWM4Vlo72RSYvYAyJ
	 DvL8Jn/H8RkGQ==
Message-ID: <b2fbe58e-f47b-4a76-879b-fd38a915c2ce@kernel.org>
Date: Wed, 26 Nov 2025 21:31:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/22] mm: Always use page table accessor functions
To: Ryan Roberts <ryan.roberts@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Wei Yang <richard.weiyang@gmail.com>,
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
References: <bc88d132-452a-42a1-9ee5-5407334d8aac@kernel.org>
 <df7d10ba-bb42-4ea1-8c5b-5db88a18eccb@kernel.org>
 <6bdf2b89-7768-4b90-b5e7-ff174196ea7b@lucifer.local>
 <71123d7a-641b-41df-b959-88e6c2a3a441@kernel.org>
 <c0818f5b-b8a1-4730-aa1d-df0f547a3d47@arm.com>
 <20251126134726.yrya5xxayfcde3kl@master>
 <ee5f5da3-8c6b-4381-aee8-b0fab56cbf83@arm.com>
 <6b966403-91e0-4f06-86a9-a4f7780b9557@kernel.org>
 <ab39d448-aa1c-4c93-8e2b-5d97a9c76af5@lucifer.local>
 <1ca9f99f-6266-47ca-8c94-1a9b9aaa717f@kernel.org>
 <37973e21-e8f4-4603-b93d-4e0b1b2499fa@lucifer.local>
 <a1d25bde-3ab6-46b5-a957-db80da7e737b@kernel.org>
 <4505a93b-2bac-4ce1-8971-4c31f1ce1362@arm.com>
 <150ffcb7-2df2-4f3a-a12e-9807f13c6ab9@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <150ffcb7-2df2-4f3a-a12e-9807f13c6ab9@arm.com>
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

On 11/26/25 17:34, Ryan Roberts wrote:
> On 26/11/2025 16:07, Ryan Roberts wrote:
>> On 26/11/2025 15:12, David Hildenbrand (Red Hat) wrote:
>>> On 11/26/25 16:08, Lorenzo Stoakes wrote:
>>>> On Wed, Nov 26, 2025 at 03:56:13PM +0100, David Hildenbrand (Red Hat) wrote:
>>>>> On 11/26/25 15:52, Lorenzo Stoakes wrote:
>>>>>>
>>>>>> Would the pmdp_get() never get invoked then? Or otherwise wouldn't that end up
>>>>>> requiring a READ_ONCE() further up the stack?
>>>>>
>>>>> See my other reply, I think the pmdp_get() is required because all pud_*
>>>>> functions are just simple stubs.
>>>>
>>>> OK, thought you were saying we should push further down the stack? Or up
>>>> depending on how you view these things :P as in READ_ONCE at leaf?
>>>
>>> I think at leaf because I think the previous ones should essentially be only
>>> used by stubs.
>>>
>>> But I haven't fully digested how this is all working. Or supposed to work.
>>>
>>> I'm trying to chew through the arch/arm/include/asm/pgtable-2level.h example to
>>> see if I can make sense of it,
>>
>> I wonder if we can think about this slightly differently;
>>
>> READ_ONCE() has two important properties:
>>
>>   - It guarrantees that a load will be issued, *even if output is unused*
>>   - It guarrantees that the read will be single-copy-atomic (no tearing)
>>
>> I think for the existing places where READ_ONCE() is used for pagetable reads we
>> only care about:
>>
>>   - It guarrantees that a load will be issued, *if output is used*
>>   - It guarrantees that the read will be single-copy-atomic (no tearing)
>>
>> I think if we can weaken to the "if output is used" property, then the compiler
>> will optimize out all the unneccessary reads.
>>
>> AIUI, a C dereference provides neither of the guarrantees so that's no good.
>>
>> What about non-volatile asm? I'm told (thought need to verify) that for
>> non-volatile asm, the compiler will emit it if the output is used and remove it
>> otherwise. So if the asm contains the required single-copy-atomic, perhaps we
>> are in business?
>>
>> So we would need a new READ_SCA() macro that could default to READ_ONCE() (which
>> is stronger) and arches could opt in to providing a weaker asm version. Then the
>> default pXdp_get() could be READ_SCA(). And this should work for all cases.
>>
>> I think.
> 
> I'm not sure this works. It looks like the compiler is free to move non-volatile
> asm sections which might be problematic for places where we are currently using
> READ_ONCE() in lockless algorithms, (e.g. GUP?). We wouldn't want to end up with
> a stale value.
> 
> Another idea:
> 
> Given the main pattern where we are aiming to optimize out the read is something
> like:
> 
> if (!pud_present(*pud))
> 
> where for a folded pmd:
> 
> static inline int pud_present(pud_t pud)	{ return 1; }
> 
> And we will change it to this:
> 
> if (!pud_present(pudp_get(pud)))
> 
> ...
> 
> perhaps we can just define the folded pXd_present(), pXd_none(), pXd_bad(),
> pXd_user() and pXd_leaf() as macros:
> 
> #define pud_present(pud)	1
> 

Let's take a step back and realize that with __PAGETABLE_PMD_FOLDED

(a) *pudp does not make any sense

For a folded PMD, *pudp == *pmdp and consequently we would actually
get a PMD, not a PUD.

For this reason all these pud_* helpers ignore the passed value
completely. It would be wrong.

(b) pmd_offset() does *not* consume a pud but instead a pudp.

That makes sense, just imagine what would happen if someone would pass
*pudp to that helper (we'd dereference twice ...).


So I wonder if we can just teach get_pudp() and friends to ... return
true garbage instead of dereferencing something that does not make sense?

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 32e8457ad5352..c95d0d89ab3f1 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -351,7 +351,13 @@ static inline pmd_t pmdp_get(pmd_t *pmdp)
  #ifndef pudp_get
  static inline pud_t pudp_get(pud_t *pudp)
  {
+#ifdef __PAGETABLE_PMD_FOLDED
+       pud_t dummy = { 0 };
+
+       return dummy;
+#else
         return READ_ONCE(*pudp);
+#endif
  }
  #endif
  
set_pud/pud_page/pud_pgtable helper are confusing, I would
assume they are essentially unused (like documented for set_put)
and only required to keep compilers happy.

-- 
Cheers

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
