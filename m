Return-Path: <SRS0=WRFO=IO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA07C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 12:05:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2F2E65048
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 12:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2F2E65048
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r+LRVFu4nLntiPh4bn1/N2FOwANGgGs2WIKTHEbsZcY=; b=atsk43b1Qh9mTHk3JhgXG6xli
	XdrpS16EICjsoooPTGaT8cLlTo3uGP9jd6kywypWSOjVVr7w4lufW9eZ2PwdLUebvMA9UUftkfH34
	ofy29tuKeWvDsjdd1U6P/nrNC16FymnTLL4YuMcA3VbPuUXEqUUO52KAnKzY5K9o9rKbyZmju7EuL
	nDiusO8arj8sRygWNB6Zm6TILqZBhok1COwumMcJ4BXMU80VooDBBYF1Xc3GxMsfqRGwzc9+QONHj
	FCuhuwZqd67fYjvDCu8YUdxuXAx0GQrVcqlChlO3NZuA7q451Sgh7ZFTB2KnR26jp/5N+3OB2uEe0
	lryrrSm+g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM8SE-000efS-Np; Tue, 16 Mar 2021 12:05:42 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM8S8-000eeg-WE
 for linux-riscv@lists.infradead.org; Tue, 16 Mar 2021 12:05:39 +0000
X-Originating-IP: 81.185.168.196
Received: from [192.168.43.237] (196.168.185.81.rev.sfr.net [81.185.168.196])
 (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id A5AEBE000C;
 Tue, 16 Mar 2021 12:05:28 +0000 (UTC)
Subject: Re: [PATCH] Insert SFENCE.VMA in function set_pte_at for RISCV
To: Anup Patel <anup@brainfault.org>,
 Andrew Waterman <waterman@eecs.berkeley.edu>
Cc: Jiuyang Liu <liu@jiuyang.me>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Zong Li <zong.li@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
References: <20210316015328.13516-1-liu@jiuyang.me>
 <20210316034638.16276-1-liu@jiuyang.me>
 <CAAhSdy3eEXtba_ebUnPW_OUHRMKsg+O9sBx_DHAmrkTUCfHXNg@mail.gmail.com>
 <CAPM7DZc+Ysd=VQdzc4_4Np8VAMESBrzD3mhk0ueh92x11bFFNg@mail.gmail.com>
 <CAAhSdy1HYJJDig3Mg1eWaO=zok9G6+hQM1LLbDKMzH-=Fi2dKw@mail.gmail.com>
 <CA++6G0AnGVLbM+1j9K7UU_0p6NfwVAxNkcFr8s1=h+wW4G0z_w@mail.gmail.com>
 <CAAhSdy0nAUW-Y9gFONVLUPZCG-zT2MXKacu+StKKmSro+58k8w@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <d4f3f2af-345d-b9a9-6ac5-f4262d0b46c5@ghiti.fr>
Date: Tue, 16 Mar 2021 08:05:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAAhSdy0nAUW-Y9gFONVLUPZCG-zT2MXKacu+StKKmSro+58k8w@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_120537_144528_7D8BD6DE 
X-CRM114-Status: GOOD (  33.21  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le 3/16/21 =E0 4:40 AM, Anup Patel a =E9crit=A0:
> On Tue, Mar 16, 2021 at 1:59 PM Andrew Waterman
> <waterman@eecs.berkeley.edu> wrote:
>>
>> On Tue, Mar 16, 2021 at 12:32 AM Anup Patel <anup@brainfault.org> wrote:
>>>
>>> On Tue, Mar 16, 2021 at 12:27 PM Jiuyang Liu <liu@jiuyang.me> wrote:
>>>>
>>>>> As per my understanding, we don't need to explicitly invalidate local=
 TLB
>>>>> in set_pte() or set_pet_at() because generic Linux page table managem=
ent
>>>>> (<linux>/mm/*) will call the appropriate flush_tlb_xyz() function aft=
er page
>>>>> table updates.
>>>>
>>>> I witnessed this bug in our micro-architecture: set_pte instruction is
>>>> still in the store buffer, no functions are inserting SFENCE.VMA in
>>>> the stack below, so TLB cannot witness this modification.
>>>> Here is my call stack:
>>>> set_pte
>>>> set_pte_at
>>>> map_vm_area
>>>> __vmalloc_area_node
>>>> __vmalloc_node_range
>>>> __vmalloc_node
>>>> __vmalloc_node_flags
>>>> vzalloc
>>>> n_tty_open
>>>>

I don't find this call stack, what I find is (the other way around):

n_tty_open
vzalloc
__vmalloc_node
__vmalloc_node_range
__vmalloc_area_node
map_kernel_range
-> map_kernel_range_noflush
    flush_cache_vmap

Which leads to the fact that we don't have flush_cache_vmap callback =

implemented: shouldn't we add the sfence.vma here ? Powerpc does =

something similar with "ptesync" (see below) instruction that seems to =

do the same as sfence.vma.

ptesync: "The ptesync instruction after the Store instruction ensures =

that all searches of the Page Table that are performed after the ptesync =

instruction completes will use the value stored"

>>>> I think this is an architecture specific code, so <linux>/mm/* should
>>>> not be modified.
>>>> And spec requires SFENCE.VMA to be inserted on each modification to
>>>> TLB. So I added code here.
>>>
>>> The generic linux/mm/* already calls the appropriate tlb_flush_xyz()
>>> function defined in arch/riscv/include/asm/tlbflush.h
>>>
>>> Better to have a write-barrier in set_pte().
>>>
>>>>
>>>>> Also, just local TLB flush is generally not sufficient because
>>>>> a lot of page tables will be used across on multiple HARTs.
>>>>
>>>> Yes, this is the biggest issue, in RISC-V Volume 2, Privileged Spec v.
>>>> 20190608 page 67 gave a solution:
>>>
>>> This is not an issue with RISC-V privilege spec rather it is more about
>>> placing RISC-V fences at right locations.
>>>
>>>> Consequently, other harts must be notified separately when the
>>>> memory-management data structures have been modified. One approach is
>>>> to use
>>>> 1) a local data fence to ensure local writes are visible globally,
>>>> then 2) an interprocessor interrupt to the other thread,
>>>> then 3) a local SFENCE.VMA in the interrupt handler of the remote thre=
ad,
>>>> and finally 4) signal back to originating thread that operation is
>>>> complete. This is, of course, the RISC-V analog to a TLB shootdown.
>>>
>>> I would suggest trying approach#1.
>>>
>>> You can include "asm/barrier.h" here and use wmb() or __smp_wmb()
>>> in-place of local TLB flush.
>>
>> wmb() doesn't suffice to order older stores before younger page-table
>> walks, so that might hide the problem without actually fixing it.
> =

> If we assume page-table walks as reads then mb() might be more
> suitable in this case ??
> =

> ARM64 also has an explicit barrier in set_pte() implementation. They are
> doing "dsb(ishst); isb()" which is an inner-shareable store barrier follo=
wed
> by an instruction barrier.
> =

>>
>> Based upon Jiuyang's description, it does sound plausible that we are
>> missing an SFENCE.VMA (or TLB shootdown) somewhere.  But I don't
>> understand the situation well enough to know where that might be, or
>> what the best fix is.
> =

> Yes, I agree but set_pte() doesn't seem to be the right place for TLB
> shootdown based on set_pte() implementations of other architectures.

I agree as "flushing" the TLB after every set_pte() would be very =

costly, it's better to do it once at the end of the all the updates: =

like in flush_cache_vmap :)

Alex

> =

> Regards,
> Anup
> =

>>
>>
>>>
>>>>
>>>> In general, this patch didn't handle the G bit in PTE, kernel trap it
>>>> to sbi_remote_sfence_vma. do you think I should use flush_tlb_all?
>>>>
>>>> Jiuyang
>>>>
>>>>
>>>>
>>>>
>>>> arch/arm/mm/mmu.c
>>>> void set_pte_at(struct mm_struct *mm, unsigned long addr,
>>>>                                pte_t *ptep, pte_t pteval)
>>>> {
>>>>          unsigned long ext =3D 0;
>>>>
>>>>          if (addr < TASK_SIZE && pte_valid_user(pteval)) {
>>>>                  if (!pte_special(pteval))
>>>>                          __sync_icache_dcache(pteval);
>>>>                  ext |=3D PTE_EXT_NG;
>>>>          }
>>>>
>>>>          set_pte_ext(ptep, pteval, ext);
>>>> }
>>>>
>>>> arch/mips/include/asm/pgtable.h
>>>> static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
>>>>                                pte_t *ptep, pte_t pteval)
>>>> {
>>>>
>>>>          if (!pte_present(pteval))
>>>>                  goto cache_sync_done;
>>>>
>>>>          if (pte_present(*ptep) && (pte_pfn(*ptep) =3D=3D pte_pfn(ptev=
al)))
>>>>                  goto cache_sync_done;
>>>>
>>>>          __update_cache(addr, pteval);
>>>> cache_sync_done:
>>>>          set_pte(ptep, pteval);
>>>> }
>>>>
>>>>
>>>> Also, just local TLB flush is generally not sufficient because
>>>>> a lot of page tables will be used accross on multiple HARTs.
>>>>
>>>>
>>>> On Tue, Mar 16, 2021 at 5:05 AM Anup Patel <anup@brainfault.org> wrote:
>>>>>
>>>>> +Alex
>>>>>
>>>>> On Tue, Mar 16, 2021 at 9:20 AM Jiuyang Liu <liu@jiuyang.me> wrote:
>>>>>>
>>>>>> This patch inserts SFENCE.VMA after modifying PTE based on RISC-V
>>>>>> specification.
>>>>>>
>>>>>> arch/riscv/include/asm/pgtable.h:
>>>>>> 1. implement pte_user, pte_global and pte_leaf to check correspond
>>>>>> attribute of a pte_t.
>>>>>
>>>>> Adding pte_user(), pte_global(), and pte_leaf() is fine.
>>>>>
>>>>>>
>>>>>> 2. insert SFENCE.VMA in set_pte_at based on RISC-V Volume 2, Privile=
ged
>>>>>> Spec v. 20190608 page 66 and 67:
>>>>>> If software modifies a non-leaf PTE, it should execute SFENCE.VMA wi=
th
>>>>>> rs1=3Dx0. If any PTE along the traversal path had its G bit set, rs2=
 must
>>>>>> be x0; otherwise, rs2 should be set to the ASID for which the
>>>>>> translation is being modified.
>>>>>> If software modifies a leaf PTE, it should execute SFENCE.VMA with r=
s1
>>>>>> set to a virtual address within the page. If any PTE along the trave=
rsal
>>>>>> path had its G bit set, rs2 must be x0; otherwise, rs2 should be set=
 to
>>>>>> the ASID for which the translation is being modified.
>>>>>>
>>>>>> arch/riscv/include/asm/tlbflush.h:
>>>>>> 1. implement get_current_asid to get current program asid.
>>>>>> 2. implement local_flush_tlb_asid to flush tlb with asid.
>>>>>
>>>>> As per my understanding, we don't need to explicitly invalidate local=
 TLB
>>>>> in set_pte() or set_pet_at() because generic Linux page table managem=
ent
>>>>> (<linux>/mm/*) will call the appropriate flush_tlb_xyz() function aft=
er page
>>>>> table updates. Also, just local TLB flush is generally not sufficient=
 because
>>>>> a lot of page tables will be used accross on multiple HARTs.
>>>>>
>>>>>>
>>>>>> Signed-off-by: Jiuyang Liu <liu@jiuyang.me>
>>>>>> ---
>>>>>>   arch/riscv/include/asm/pgtable.h  | 27 +++++++++++++++++++++++++++
>>>>>>   arch/riscv/include/asm/tlbflush.h | 12 ++++++++++++
>>>>>>   2 files changed, 39 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/a=
sm/pgtable.h
>>>>>> index ebf817c1bdf4..5a47c60372c1 100644
>>>>>> --- a/arch/riscv/include/asm/pgtable.h
>>>>>> +++ b/arch/riscv/include/asm/pgtable.h
>>>>>> @@ -222,6 +222,16 @@ static inline int pte_write(pte_t pte)
>>>>>>          return pte_val(pte) & _PAGE_WRITE;
>>>>>>   }
>>>>>>
>>>>>> +static inline int pte_user(pte_t pte)
>>>>>> +{
>>>>>> +       return pte_val(pte) & _PAGE_USER;
>>>>>> +}
>>>>>> +
>>>>>> +static inline int pte_global(pte_t pte)
>>>>>> +{
>>>>>> +       return pte_val(pte) & _PAGE_GLOBAL;
>>>>>> +}
>>>>>> +
>>>>>>   static inline int pte_exec(pte_t pte)
>>>>>>   {
>>>>>>          return pte_val(pte) & _PAGE_EXEC;
>>>>>> @@ -248,6 +258,11 @@ static inline int pte_special(pte_t pte)
>>>>>>          return pte_val(pte) & _PAGE_SPECIAL;
>>>>>>   }
>>>>>>
>>>>>> +static inline int pte_leaf(pte_t pte)
>>>>>> +{
>>>>>> +       return pte_val(pte) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC=
);
>>>>>> +}
>>>>>> +
>>>>>>   /* static inline pte_t pte_rdprotect(pte_t pte) */
>>>>>>
>>>>>>   static inline pte_t pte_wrprotect(pte_t pte)
>>>>>> @@ -358,6 +373,18 @@ static inline void set_pte_at(struct mm_struct =
*mm,
>>>>>>                  flush_icache_pte(pteval);
>>>>>>
>>>>>>          set_pte(ptep, pteval);
>>>>>> +
>>>>>> +       if (pte_present(pteval)) {
>>>>>> +               if (pte_leaf(pteval)) {
>>>>>> +                       local_flush_tlb_page(addr);
>>>>>> +               } else {
>>>>>> +                       if (pte_global(pteval))
>>>>>> +                               local_flush_tlb_all();
>>>>>> +                       else
>>>>>> +                               local_flush_tlb_asid();
>>>>>> +
>>>>>> +               }
>>>>>> +       }
>>>>>>   }
>>>>>>
>>>>>>   static inline void pte_clear(struct mm_struct *mm,
>>>>>> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/=
asm/tlbflush.h
>>>>>> index 394cfbccdcd9..1f9b62b3670b 100644
>>>>>> --- a/arch/riscv/include/asm/tlbflush.h
>>>>>> +++ b/arch/riscv/include/asm/tlbflush.h
>>>>>> @@ -21,6 +21,18 @@ static inline void local_flush_tlb_page(unsigned =
long addr)
>>>>>>   {
>>>>>>          __asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "mem=
ory");
>>>>>>   }
>>>>>> +
>>>>>> +static inline unsigned long get_current_asid(void)
>>>>>> +{
>>>>>> +       return (csr_read(CSR_SATP) >> SATP_ASID_SHIFT) & SATP_ASID_M=
ASK;
>>>>>> +}
>>>>>> +
>>>>>> +static inline void local_flush_tlb_asid(void)
>>>>>> +{
>>>>>> +       unsigned long asid =3D get_current_asid();
>>>>>> +       __asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (asid) : "=
memory");
>>>>>> +}
>>>>>> +
>>>>>>   #else /* CONFIG_MMU */
>>>>>>   #define local_flush_tlb_all()                  do { } while (0)
>>>>>>   #define local_flush_tlb_page(addr)             do { } while (0)
>>>>>> --
>>>>>> 2.30.2
>>>>>>
>>>>>>
>>>>>> _______________________________________________
>>>>>> linux-riscv mailing list
>>>>>> linux-riscv@lists.infradead.org
>>>>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>>>>
>>>>> Regards,
>>>>> Anup
>>>
>>> Regards,
>>> Anup
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
