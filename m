Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB540CFD2F6
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 07:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfRebOFhSdc5ykS0QN0N3D8zsyDRFHeaag3DYVITN2s=; b=neSEkKbQMWI7Vm
	sbgBduQv41LmLruIG24Fawh8o68s+Ln1q7VhJDw36vB7npprmgjK3z+0X/NCVuW9bZyL0GkEQ60Rj
	sQFcO9syE4qQWs63qx9Yd6VKEzbzfHTLMkr4+zfwipTSQKbCHP2qrMgRV3zbqg1oMu0VMb/Ierwlw
	7Jt4C9VmQPBa3M9e/ilwW2xHQnCJwWFKsTOdI8mvfrRyz6+XuaAeqZjy2HwA6yxKu1Pu/bELC412f
	VOuzQ5M/NXAoaZDdXEnYmIPUIg58wQuxFgdvR8JAx14qti6QkvqxCGBntVIIAbN/NauFqHzNBG96n
	CtcI09ddMhUPY6Iqffpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWTz-0000000G8Ba-0m0t;
	Thu, 27 Nov 2025 07:32:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWTx-0000000G8BO-2Vxw
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 07:32:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CE9D60182;
	Thu, 27 Nov 2025 07:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0188FC4CEF8;
	Thu, 27 Nov 2025 07:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764228720;
	bh=QiLZ0ytg5DNB713odlGgPihhex3UHwBxH/QBLHPI5QM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ouf03M9UhTmrdYrBI9Rg68Ds2egIB5Eo2fkqNFaJj60mj+MZ1UpDU3dqMC5CDr4GZ
	 1e1gbHEEAg3GZX9zxrxJ5KqhDXcOhmLhpY7NEziDAEgzhE6YlqPGeBk8RiSPxSlsSa
	 F2AmTGyncDeM6RFOOttkf+LPPLRiELWkkHwOnudis6yd88kSiYYjwzNFzwrzcMcnE3
	 2SmtBdNPsXtGJnXzp0X2chXdyd/01FFiIsag/c9gEZZXoXmJrfLd03SpdDW+HPf69H
	 RoxGo8DTISAtMr5xSaJ2uJoznD6XMpaOBMkLlXyYlE7Obw1135MsaqTVAdJ2n+N2BU
	 TxSMaHEWH6ASA==
Message-ID: <bd4d746b-8929-4fd2-bd59-70654e794ee6@kernel.org>
Date: Thu, 27 Nov 2025 08:31:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/22] mm: Always use page table accessor functions
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
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
 <b2fbe58e-f47b-4a76-879b-fd38a915c2ce@kernel.org>
 <bcd2a49d-a42f-41e8-9f64-4fd24fc862c7@kernel.org>
Content-Language: en-US
In-Reply-To: <bcd2a49d-a42f-41e8-9f64-4fd24fc862c7@kernel.org>
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

On 11/27/25 08:14, David Hildenbrand (Red Hat) wrote:
> On 11/26/25 21:31, David Hildenbrand (Red Hat) wrote:
>> On 11/26/25 17:34, Ryan Roberts wrote:
>>> On 26/11/2025 16:07, Ryan Roberts wrote:
>>>> On 26/11/2025 15:12, David Hildenbrand (Red Hat) wrote:
>>>>> On 11/26/25 16:08, Lorenzo Stoakes wrote:
>>>>>> On Wed, Nov 26, 2025 at 03:56:13PM +0100, David Hildenbrand (Red Hat) wrote:
>>>>>>> On 11/26/25 15:52, Lorenzo Stoakes wrote:
>>>>>>>>
>>>>>>>> Would the pmdp_get() never get invoked then? Or otherwise wouldn't that end up
>>>>>>>> requiring a READ_ONCE() further up the stack?
>>>>>>>
>>>>>>> See my other reply, I think the pmdp_get() is required because all pud_*
>>>>>>> functions are just simple stubs.
>>>>>>
>>>>>> OK, thought you were saying we should push further down the stack? Or up
>>>>>> depending on how you view these things :P as in READ_ONCE at leaf?
>>>>>
>>>>> I think at leaf because I think the previous ones should essentially be only
>>>>> used by stubs.
>>>>>
>>>>> But I haven't fully digested how this is all working. Or supposed to work.
>>>>>
>>>>> I'm trying to chew through the arch/arm/include/asm/pgtable-2level.h example to
>>>>> see if I can make sense of it,
>>>>
>>>> I wonder if we can think about this slightly differently;
>>>>
>>>> READ_ONCE() has two important properties:
>>>>
>>>>     - It guarrantees that a load will be issued, *even if output is unused*
>>>>     - It guarrantees that the read will be single-copy-atomic (no tearing)
>>>>
>>>> I think for the existing places where READ_ONCE() is used for pagetable reads we
>>>> only care about:
>>>>
>>>>     - It guarrantees that a load will be issued, *if output is used*
>>>>     - It guarrantees that the read will be single-copy-atomic (no tearing)
>>>>
>>>> I think if we can weaken to the "if output is used" property, then the compiler
>>>> will optimize out all the unneccessary reads.
>>>>
>>>> AIUI, a C dereference provides neither of the guarrantees so that's no good.
>>>>
>>>> What about non-volatile asm? I'm told (thought need to verify) that for
>>>> non-volatile asm, the compiler will emit it if the output is used and remove it
>>>> otherwise. So if the asm contains the required single-copy-atomic, perhaps we
>>>> are in business?
>>>>
>>>> So we would need a new READ_SCA() macro that could default to READ_ONCE() (which
>>>> is stronger) and arches could opt in to providing a weaker asm version. Then the
>>>> default pXdp_get() could be READ_SCA(). And this should work for all cases.
>>>>
>>>> I think.
>>>
>>> I'm not sure this works. It looks like the compiler is free to move non-volatile
>>> asm sections which might be problematic for places where we are currently using
>>> READ_ONCE() in lockless algorithms, (e.g. GUP?). We wouldn't want to end up with
>>> a stale value.
>>>
>>> Another idea:
>>>
>>> Given the main pattern where we are aiming to optimize out the read is something
>>> like:
>>>
>>> if (!pud_present(*pud))
>>>
>>> where for a folded pmd:
>>>
>>> static inline int pud_present(pud_t pud)	{ return 1; }
>>>
>>> And we will change it to this:
>>>
>>> if (!pud_present(pudp_get(pud)))
>>>
>>> ...
>>>
>>> perhaps we can just define the folded pXd_present(), pXd_none(), pXd_bad(),
>>> pXd_user() and pXd_leaf() as macros:
>>>
>>> #define pud_present(pud)	1
>>>
>>
>> Let's take a step back and realize that with __PAGETABLE_PMD_FOLDED
>>
>> (a) *pudp does not make any sense
>>
>> For a folded PMD, *pudp == *pmdp and consequently we would actually
>> get a PMD, not a PUD.
>>
>> For this reason all these pud_* helpers ignore the passed value
>> completely. It would be wrong.
>>
>> (b) pmd_offset() does *not* consume a pud but instead a pudp.
>>
>> That makes sense, just imagine what would happen if someone would pass
>> *pudp to that helper (we'd dereference twice ...).
>>
>>
>> So I wonder if we can just teach get_pudp() and friends to ... return
>> true garbage instead of dereferencing something that does not make sense?
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 32e8457ad5352..c95d0d89ab3f1 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -351,7 +351,13 @@ static inline pmd_t pmdp_get(pmd_t *pmdp)
>>     #ifndef pudp_get
>>     static inline pud_t pudp_get(pud_t *pudp)
>>     {
>> +#ifdef __PAGETABLE_PMD_FOLDED
>> +       pud_t dummy = { 0 };
>> +
>> +       return dummy;
>> +#else
>>            return READ_ONCE(*pudp);
>> +#endif
>>     }
>>     #endif
>>     
>> set_pud/pud_page/pud_pgtable helper are confusing, I would
>> assume they are essentially unused (like documented for set_put)
>> and only required to keep compilers happy.
> 
> Staring at GUP-fast and perf_get_pgtable_size()---which should better be
> converted to pudp_get() etc--I guess we might have to rework
> p4d_offset_lockless() to do something that doesn't rely on
> passing variables of local variables.
> 
> We might have to enlighten these walkers (and only these) about folded
> page tables such that they don't depend on the result of pudp_get() and
> friends.

Talking to myself (I know), handling this might be as simple as having

diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
index 8ffd64e7a24cb..60e5ba02bcf06 100644
--- a/include/asm-generic/pgtable-nopmd.h
+++ b/include/asm-generic/pgtable-nopmd.h
@@ -49,6 +49,13 @@ static inline pmd_t * pmd_offset(pud_t * pud, unsigned long address)
  }
  #define pmd_offset pmd_offset
  
+static inline pmd_t * pmd_offset_lockless(pud_t *pud, puf_t pud, unsigned long address)
+{
+       return (pmd_t *)pud;
+}
+#define pmd_offset_lcokless pmd_offset_lockless
+
+
  #define pmd_val(x)                             (pud_val((x).pud))
  #define __pmd(x)                               ((pmd_t) { __pud(x) } )
  

IOW, just like for pmd_offset() we cast the pointer and don't ever touch the pud.


As a reminder, the default is

#ifndef pmd_offset_lockless
#define pmd_offset_lockless(pudp, pud, address) pmd_offset(&(pud), address)
#endif

(isn't that nasty? :) )

-- 
Cheers

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
