Return-Path: <SRS0=JNkM=MZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C83C4338F
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Aug 2021 12:44:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1D6260F36
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Aug 2021 12:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1D6260F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfT9fytDOuYR1EIpMMrZ4NPxZ9PdnSUE4If0IY25mbY=; b=VNu1v5Wdb7hb2KaANllpTt/A9c
	7Snp3hjEVwv8GNKSGV/STqu8WFS/KCPIQZguiaNFDF91cBrmZcaviJjOsj2P/RDCZ8CBQZPQXuNjz
	zfKyPn/XgBnDBjO2hEUyDbiw+v3Z7IB25N3kPWvXrFukiGgtUDm0iHBeYBOqkJfSzoCgUCGtsF+bu
	RvkqGrBLoaus/XYG+e4kKJxxeGDSMCmX9Fnf0D7x50MjwzQbwUEM+IUg1Wfond84dmasUuBntSW1r
	/gM96ANIvGEx5+BMGpleP2ocTuxLus8IwqNgNMrzxW5Qal6qz8NXomX5gaElLHNkATbrXGWG/NTGk
	dkkzvbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAXHu-00GFA3-9i; Mon, 02 Aug 2021 12:43:22 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAXHp-00GF7S-G6
 for linux-riscv@lists.infradead.org; Mon, 02 Aug 2021 12:43:20 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id D138024000A;
 Mon,  2 Aug 2021 12:43:02 +0000 (UTC)
Subject: Re: [PATCH v2 -next] riscv: mm: remove redundant trampoline PGD for
 64bit
From: Alex Ghiti <alex@ghiti.fr>
To: Nanyong Sun <sunnanyong@huawei.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, anup.patel@wdc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 palmerdabbelt@google.com, atish.patra@wdc.com, wangkefeng.wang@huawei.com,
 tiantao6@hisilicon.com, qiuwenbo@phytium.com.cn, rppt@kernel.org,
 jszhang@kernel.org, mick@ics.forth.gr
References: <20210728024910.1417720-1-sunnanyong@huawei.com>
 <3199c658-ffac-729d-d93d-8895e7d3668e@ghiti.fr>
Message-ID: <6198036e-353c-dac5-5399-8b823a89f926@ghiti.fr>
Date: Mon, 2 Aug 2021 14:43:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <3199c658-ffac-729d-d93d-8895e7d3668e@ghiti.fr>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_054317_886294_5B276DBA 
X-CRM114-Status: GOOD (  27.68  )
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

Hi Nanyong,

Le 28/07/2021 =E0 13:55, Alex Ghiti a =E9crit=A0:
> =

> =

> Le 28/07/2021 =E0 04:49, Nanyong Sun a =E9crit=A0:
>> Remove redundant trampoline PGD for 64bit and add more comment
>> for why 32bit systems need trampoline PGD.
>>
>> There was a patch and discussion similar to this,refer to
>> the link [1][2].
>>
>> The trampoline PGD is redundant for 64bit systems because:
>> 1. The early PGD covers the entire kernel mapping. Directly
>> loading early PGD can achieve the result in boot stage.
>> A more trampoline PGD makes code hard to understand.
>> 2. Directly loading early PGD is safe in 64bit systems since
>> the kernel virtual address starts as 0xFFFFxxxxxxxxxxxx,
>> which has a very big gap with RAM address.It won't fall into
>> the corner case that 32bit system worrys.
>> 3. Remove redundant trampoline PGD can benefit to code maintaince,
>> because 64bit systems have more page table levels.For example:
>> If we want to support SV48 which has 4 page table levels, we have
>> to add a trampoline_pud and insert it before trampoline_pmd.
>>
>> Reference link:
>> [1]https://lore.kernel.org/linux-riscv/20190325092234.5451-4-anup.patel@=
wdc.com/ =

>>
>> [2]https://lkml.org/lkml/2019/3/28/147
>>
>> Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>
>> Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
> =

> I have not reviewed this patch yet! :)
> =

>> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> Reviewed-by: weiyongjun <weiyongjun1@huawei.com>
>> ---
>> v2 changes:
>> =A0=A0 Adjust codes based on the review suggestions from Alex Ghiti,
>> =A0=A0 make codes more readable.
>> ---
>> =A0 arch/riscv/kernel/head.S | 46 ++++++++++++++++++++++++++------------=
--
>> =A0 arch/riscv/mm/init.c=A0=A0=A0=A0 | 16 ++++----------
>> =A0 2 files changed, 34 insertions(+), 28 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>> index fce5184b22c3..3816aa5edc69 100644
>> --- a/arch/riscv/kernel/head.S
>> +++ b/arch/riscv/kernel/head.S
>> @@ -89,29 +89,52 @@ relocate:
>> =A0=A0=A0=A0=A0 add ra, ra, a1
>> =A0=A0=A0=A0=A0 /* Point stvec to virtual address of intruction after sa=
tp write */
>> -=A0=A0=A0 la a2, 1f
>> +#ifdef CONFIG_64BIT
>> +=A0=A0=A0 la a2, load_done
>> +#else
>> +=A0=A0=A0 la a2, load_kernel_pgd
>> +#endif
>> =A0=A0=A0=A0=A0 add a2, a2, a1
>> =A0=A0=A0=A0=A0 csrw CSR_TVEC, a2
>> -=A0=A0=A0 /* Compute satp for kernel page tables, but don't load it yet=
 */
>> +=A0=A0=A0 /* Compute satp for kernel page tables.
>> +=A0=A0=A0=A0 * For 64bit systems, load it and trap to stvec.
>> +=A0=A0=A0=A0 * For 32bit systems, don't load it yet.
>> +=A0=A0=A0=A0 */
>> =A0=A0=A0=A0=A0 srl a2, a0, PAGE_SHIFT
>> =A0=A0=A0=A0=A0 li a1, SATP_MODE
>> =A0=A0=A0=A0=A0 or a2, a2, a1
>> =A0=A0=A0=A0=A0 /*
>> +=A0=A0=A0=A0 * Before writing satp, we need a full fence here because =

>> setup_vm() just
>> +=A0=A0=A0=A0 * wrote these PTEs and we need to ensure the new translati=
ons =

>> are in use.
>> +=A0=A0=A0=A0 */
>> +=A0=A0=A0 sfence.vma
>> +#ifndef CONFIG_64BIT
>> +=A0=A0=A0 /*
>> +=A0=A0=A0=A0 * 32bit systems need firstly loading a trampoline to handl=
e a =

>> corner
>> +=A0=A0=A0=A0 * case where load address range overlaps kernel virtual ad=
dress =

>> range.
>> =A0=A0=A0=A0=A0=A0 * Load trampoline page directory, which will cause us=
 to trap to
>> -=A0=A0=A0=A0 * stvec if VA !=3D PA, or simply fall through if VA =3D=3D=
 PA.=A0 We need a
>> -=A0=A0=A0=A0 * full fence here because setup_vm() just wrote these PTEs=
 and =

>> we need
>> -=A0=A0=A0=A0 * to ensure the new translations are in use.
>> +=A0=A0=A0=A0 * stvec if VA !=3D PA, or simply fall through if VA =3D=3D=
 PA.
>> =A0=A0=A0=A0=A0=A0 */
>> =A0=A0=A0=A0=A0 la a0, trampoline_pg_dir
>> =A0=A0=A0=A0=A0 XIP_FIXUP_OFFSET a0
>> =A0=A0=A0=A0=A0 srl a0, a0, PAGE_SHIFT
>> =A0=A0=A0=A0=A0 or a0, a0, a1
>> -=A0=A0=A0 sfence.vma
>> =A0=A0=A0=A0=A0 csrw CSR_SATP, a0
>> +#endif
>> =A0 .align 2
>> -1:
>> +load_kernel_pgd:
>> +=A0=A0=A0=A0=A0=A0=A0 /*
>> +=A0=A0=A0=A0=A0=A0=A0=A0 * Switch to kernel page tables.=A0 A full fenc=
e is necessary =

>> in order to
>> +=A0=A0=A0=A0=A0=A0=A0=A0 * avoid using the trampoline translations, whi=
ch are only =

>> correct for
>> +=A0=A0=A0=A0=A0=A0=A0=A0 * the first superpage.=A0 Fetching the fence i=
s guarnteed to work
>> +=A0=A0=A0=A0=A0=A0=A0=A0 * because that first superpage is translated t=
he same way.
>> +=A0=A0=A0=A0=A0=A0=A0=A0 */
>> +=A0=A0=A0=A0=A0=A0=A0 csrw CSR_SATP, a2
>> +=A0=A0=A0=A0=A0=A0=A0 sfence.vma
>> +
>> +load_done:
>> =A0=A0=A0=A0=A0 /* Set trap vector to spin forever to help debug */
>> =A0=A0=A0=A0=A0 la a0, .Lsecondary_park
>> =A0=A0=A0=A0=A0 csrw CSR_TVEC, a0


I suppose stvec was set this way to catch any problem with early_pg_dir, =

you moved that and then this defeats this original purpose.


>> @@ -122,15 +145,6 @@ relocate:
>> =A0=A0=A0=A0=A0 la gp, __global_pointer$
>> =A0 .option pop
>> -=A0=A0=A0 /*
>> -=A0=A0=A0=A0 * Switch to kernel page tables.=A0 A full fence is necessa=
ry in =

>> order to
>> -=A0=A0=A0=A0 * avoid using the trampoline translations, which are only =

>> correct for
>> -=A0=A0=A0=A0 * the first superpage.=A0 Fetching the fence is guarnteed =
to work
>> -=A0=A0=A0=A0 * because that first superpage is translated the same way.
>> -=A0=A0=A0=A0 */
>> -=A0=A0=A0 csrw CSR_SATP, a2
>> -=A0=A0=A0 sfence.vma
>> -
>> =A0=A0=A0=A0=A0 ret
>> =A0 #endif /* CONFIG_MMU */
>> =A0 #ifdef CONFIG_SMP
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index ac48742fa6fc..306fcb2334fa 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -219,13 +219,17 @@ unsigned long pfn_base __ro_after_init;
>> =A0 EXPORT_SYMBOL(pfn_base);
>> =A0 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>> +#ifndef CONFIG_64BIT
>> =A0 pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>> +#endif /* CONFIG_64BIT */


As stated in Documentation/process/coding-style.rst, it is better to use =

__maybe_unused rather than #ifdefs.


>> =A0 static pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
>> =A0 pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>> =A0 #ifdef CONFIG_XIP_KERNEL
>> +#ifndef CONFIG_64BIT
>> =A0 #define trampoline_pg_dir=A0=A0=A0=A0=A0 ((pgd_t *)XIP_FIXUP(trampol=
ine_pg_dir))
>> +#endif /* CONFIG_64BIT */


Using __maybe_unused allows to remove those too.


>> =A0 #define fixmap_pte=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ((pte_t *)XIP=
_FIXUP(fixmap_pte))
>> =A0 #define early_pg_dir=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ((pgd_t *)XIP_FIX=
UP(early_pg_dir))
>> =A0 #endif /* CONFIG_XIP_KERNEL */
>> @@ -300,13 +304,11 @@ static void __init create_pte_mapping(pte_t *ptep,
>> =A0 #ifndef __PAGETABLE_PMD_FOLDED
>> -static pmd_t trampoline_pmd[PTRS_PER_PMD] __page_aligned_bss;
>> =A0 static pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
>> =A0 static pmd_t early_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
>> =A0 static pmd_t early_dtb_pmd[PTRS_PER_PMD] __initdata =

>> __aligned(PAGE_SIZE);
>> =A0 #ifdef CONFIG_XIP_KERNEL
>> -#define trampoline_pmd ((pmd_t *)XIP_FIXUP(trampoline_pmd))
>> =A0 #define fixmap_pmd=A0=A0=A0=A0 ((pmd_t *)XIP_FIXUP(fixmap_pmd))
>> =A0 #define early_pmd=A0=A0=A0=A0=A0 ((pmd_t *)XIP_FIXUP(early_pmd))
>> =A0 #endif /* CONFIG_XIP_KERNEL */
>> @@ -585,16 +587,6 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>> =A0=A0=A0=A0=A0 /* Setup fixmap PMD */
>> =A0=A0=A0=A0=A0 create_pmd_mapping(fixmap_pmd, FIXADDR_START,
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (uintptr_t)fixmap_pte, =
PMD_SIZE, PAGE_TABLE);
>> -=A0=A0=A0 /* Setup trampoline PGD and PMD */
>> -=A0=A0=A0 create_pgd_mapping(trampoline_pg_dir, kernel_map.virt_addr,
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (uintptr_t)trampoline_pmd, P=
GDIR_SIZE, PAGE_TABLE);
>> -#ifdef CONFIG_XIP_KERNEL
>> -=A0=A0=A0 create_pmd_mapping(trampoline_pmd, kernel_map.virt_addr,
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kernel_map.xiprom, PMD_SIZE,=
 PAGE_KERNEL_EXEC);
>> -#else
>> -=A0=A0=A0 create_pmd_mapping(trampoline_pmd, kernel_map.virt_addr,
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kernel_map.phys_addr, PMD_SI=
ZE, PAGE_KERNEL_EXEC);
>> -#endif
>> =A0 #else
>> =A0=A0=A0=A0=A0 /* Setup trampoline PGD */
>> =A0=A0=A0=A0=A0 create_pgd_mapping(trampoline_pg_dir, kernel_map.virt_ad=
dr,
>>
> =


Overall this version adds more complexity to assembly code than I =

thought, but I don't see any way to improve that (which does not mean =

there isn't!).

Thanks,

Alex


> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
