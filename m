Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C35BC432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 03:59:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10C1B60F45
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 03:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10C1B60F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:CC:References:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+X4lpfv6HEvyExA5S9/kijIDuvTZEUBdwVV3Ff1I0NU=; b=x/YPKIES4skYqz0qM0yLfRQkyN
	J+NoT4297uat0/L8qw9tlZPDSLDf7pYaSg3W+jfu+tj9sKC3dq5XFJnAN1o5i0ZGX28lDzihTnlXP
	7IEAU5jU1IJAuNkvioPvoNAZQkKknF6+tF4wdxEbhhlM/IKJuXxgF9BCiVILDWX9AC94zxcx3aA4n
	GzsSVf9GYK2bY3mCjMrJIiGK7UQ/fUOucTzSQx27E+Cxz0zulpz1Fu0HvkDfm+E+P/pu7wA2PVlIM
	jQHnyNONDxLnVqDlL+Y+Yf8p//+BypdVDyFR0bjVEh/6EETwFUpV30dlYTmMzdQ+g2elb4j/rB9Yi
	LIrAzb0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJT0x-00BW3s-E7; Fri, 27 Aug 2021 03:58:47 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJT0r-00BVzg-MP
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 03:58:43 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Gwm752N6qz8vYC;
 Fri, 27 Aug 2021 11:54:25 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 27 Aug 2021 11:58:31 +0800
Received: from [10.174.179.24] (10.174.179.24) by
 dggpemm500009.china.huawei.com (7.185.36.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 27 Aug 2021 11:58:31 +0800
Subject: Re: [PATCH -next] riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT
To: Palmer Dabbelt <palmer@dabbelt.com>
References: <mhng-57cbc077-dfa6-48a7-a29d-b27862e1e800@palmerdabbelt-glaptop>
CC: <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 <aou@eecs.berkeley.edu>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
From: Liu Shixin <liushixin2@huawei.com>
Message-ID: <f6d2353d-d2ac-e4ca-7428-92bbf4116616@huawei.com>
Date: Fri, 27 Aug 2021 11:58:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <mhng-57cbc077-dfa6-48a7-a29d-b27862e1e800@palmerdabbelt-glaptop>
X-Originating-IP: [10.174.179.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_205842_114352_3FE01CB0 
X-CRM114-Status: GOOD (  16.54  )
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



On 2021/8/26 12:48, Palmer Dabbelt wrote:
> On Thu, 05 Aug 2021 04:38:37 PDT (-0700), liushixin2@huawei.com wrote:
>> This sets the HAVE_ARCH_HUGE_VMAP option. Enable pmd vmap support and
>> define the required page table functions(Currently, riscv has only
>> three-level page tables support for 64BIT).
>>
>> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
>> ---
>>  .../features/vm/huge-vmap/arch-support.txt    |  2 +-
>>  arch/riscv/Kconfig                            |  1 +
>>  arch/riscv/include/asm/vmalloc.h              | 12 +++++
>>  arch/riscv/mm/Makefile                        |  1 +
>>  arch/riscv/mm/pgtable.c                       | 53 +++++++++++++++++++
>>  5 files changed, 68 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/riscv/mm/pgtable.c
>>
>> diff --git a/Documentation/features/vm/huge-vmap/arch-support.txt b/Documentation/features/vm/huge-vmap/arch-support.txt
>> index 439fd9069b8b..0ff394acc9cf 100644
>> --- a/Documentation/features/vm/huge-vmap/arch-support.txt
>> +++ b/Documentation/features/vm/huge-vmap/arch-support.txt
>> @@ -22,7 +22,7 @@
>>      |    openrisc: | TODO |
>>      |      parisc: | TODO |
>>      |     powerpc: |  ok  |
>> -    |       riscv: | TODO |
>> +    |       riscv: |  ok  |
>>      |        s390: | TODO |
>>      |          sh: | TODO |
>>      |       sparc: | TODO |
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 8fcceb8eda07..94cc2a254773 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -61,6 +61,7 @@ config RISCV
>>      select GENERIC_TIME_VSYSCALL if MMU && 64BIT
>>      select HANDLE_DOMAIN_IRQ
>>      select HAVE_ARCH_AUDITSYSCALL
>> +    select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
>>      select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
>>      select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
>>      select HAVE_ARCH_KASAN if MMU && 64BIT
>> diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vmalloc.h
>> index ff9abc00d139..8f17f421f80c 100644
>> --- a/arch/riscv/include/asm/vmalloc.h
>> +++ b/arch/riscv/include/asm/vmalloc.h
>> @@ -1,4 +1,16 @@
>>  #ifndef _ASM_RISCV_VMALLOC_H
>>  #define _ASM_RISCV_VMALLOC_H
>>
>> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
>> +
>> +#define IOREMAP_MAX_ORDER (PMD_SHIFT)
>> +
>> +#define arch_vmap_pmd_supported    arch_vmap_pmd_supported
>> +static inline bool __init arch_vmap_pmd_supported(pgprot_t prot)
>> +{
>> +    return true;
>> +}
>> +
>> +#endif
>> +
>>  #endif /* _ASM_RISCV_VMALLOC_H */
>> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
>> index 7ebaef10ea1b..f932b4d69946 100644
>> --- a/arch/riscv/mm/Makefile
>> +++ b/arch/riscv/mm/Makefile
>> @@ -13,6 +13,7 @@ obj-y += extable.o
>>  obj-$(CONFIG_MMU) += fault.o pageattr.o
>>  obj-y += cacheflush.o
>>  obj-y += context.o
>> +obj-y += pgtable.o
>>
>>  ifeq ($(CONFIG_MMU),y)
>>  obj-$(CONFIG_SMP) += tlbflush.o
>> diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
>> new file mode 100644
>> index 000000000000..f68dd2b71dce
>> --- /dev/null
>> +++ b/arch/riscv/mm/pgtable.c
>> @@ -0,0 +1,53 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <asm/pgalloc.h>
>> +#include <linux/gfp.h>
>> +#include <linux/kernel.h>
>> +#include <linux/pgtable.h>
>> +
>> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
>> +
>> +int pud_set_huge(pud_t *pud, phys_addr_t phys, pgprot_t prot)
>> +{
>> +    return 0;
>> +}
>> +
>> +int pud_clear_huge(pud_t *pud)
>> +{
>> +    return 0;
>> +}
>> +
>> +int pud_free_pmd_page(pud_t *pud, unsigned long addr)
>> +{
>> +    return 0;
>> +}
>
> Do we actually need the PUD helpers?  I'd prefer to avoid adding these unimplemented stubs, IIUC the other architectures are relying on the generic implementations (which are themselves stubs) for configurations that don't have PUDs.
>
pud_set_huge() and pud_free_pmd_page() are completely useless for now and can be deleted directly. But deleting pud_clear_huge() will causes a compile error because there is no arch_vmap_pud_supported() check before pud_clear_huge(). Maybe we can keep pud_clear_huge() or add arch_vmap_pud_supported() in vunmap_pud_range(). Which way do you think is more appropriate?

thanks,

>> +int pmd_set_huge(pmd_t *pmd, phys_addr_t phys, pgprot_t prot)
>> +{
>> +    pmd_t new_pmd = pfn_pmd(__phys_to_pfn(phys), prot);
>> +
>> +    set_pmd(pmd, new_pmd);
>> +    return 1;
>> +}
>> +
>> +int pmd_clear_huge(pmd_t *pmd)
>> +{
>> +    if (!pmd_leaf(READ_ONCE(*pmd)))
>> +        return 0;
>> +    pmd_clear(pmd);
>> +    return 1;
>> +}
>> +
>> +int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>> +{
>> +    pte_t *pte;
>> +
>> +    pte = (pte_t *)pmd_page_vaddr(*pmd);
>> +    pmd_clear(pmd);
>> +
>> +    flush_tlb_kernel_range(addr, addr + PMD_SIZE);
>> +    pte_free_kernel(NULL, pte);
>> +    return 1;
>> +}
>> +
>> +#endif /* CONFIG_HAVE_ARCH_HUGE_VMAP */
> .
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
