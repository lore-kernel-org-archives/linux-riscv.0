Return-Path: <SRS0=LC3o=LF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46898C48BD1
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jun 2021 01:34:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C014B61374
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jun 2021 01:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C014B61374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbKxI2UijzQrzZa/CneAJECgDmun1DHq58CHABX04vI=; b=4wQegkSOx44sjWSoCAj3eamzEU
	QGWWIuilG/CQ7VOWq7SUgLyApQyea9PoDx9xUWhAdGUo7A0P1TXxnQqHGJMtUF8m0ROT1yMLhdJ12
	0sqw6vZ1YmoDkKICS1CrN7jXW+uj09NswwhEUMUHL4+gc/hiynGWiuW8wZbNP5npD52jUh1+kwL31
	T+BGp82sZTVnIV9/qbzbX3ox4zZ2ZxqyHp0vU7ZjO/3Mz+yNnerbo3bGWgjTz2qmgI2YZ6qZ9/C57
	0TcQwdcf/RI7+hu9ESydIs3AqiqYaSKFE8HZAcaijjemkmJv2wRmvvZtefFP+yp3qPcOTvOQch403
	3HkzLLQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrW3X-0037lD-BQ; Fri, 11 Jun 2021 01:33:55 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrW3U-0037kG-9U
 for linux-riscv@lists.infradead.org; Fri, 11 Jun 2021 01:33:54 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G1NZj1TTDz6xWH;
 Fri, 11 Jun 2021 09:30:37 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 11 Jun 2021 09:33:13 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 11 Jun 2021 09:33:12 +0800
Subject: Re: [PATCH -next] riscv: Enable KFENCE for riscv64
To: Liu Shixin <liushixin2@huawei.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexander Potapenko <glider@google.com>, Marco Elver
 <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kasan-dev@googlegroups.com>, Palmer Dabbelt <palmerdabbelt@google.com>
References: <20210529080340.2987212-1-liushixin2@huawei.com>
 <0a3ee489-47db-47f5-6192-794457fc74f8@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <a7c49be6-e01e-72de-fc2c-e662fc147495@huawei.com>
Date: Fri, 11 Jun 2021 09:33:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <0a3ee489-47db-47f5-6192-794457fc74f8@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_183352_697530_FD5EAE00 
X-CRM114-Status: GOOD (  21.89  )
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


On 2021/6/9 14:17, Liu Shixin wrote:
> Hi, everybody,
>
> I perfected the patch based on the previous advice. How about this version?
Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>
> Thanks,
>
>
> On 2021/5/29 16:03, Liu Shixin wrote:
>> Add architecture specific implementation details for KFENCE and enable
>> KFENCE for the riscv64 architecture. In particular, this implements the
>> required interface in <asm/kfence.h>.
>>
>> KFENCE requires that attributes for pages from its memory pool can
>> individually be set. Therefore, force the kfence pool to be mapped at
>> page granularity.
>>
>> Testing this patch using the testcases in kfence_test.c and all passed.
>>
>> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
>> ---
>> 1. Add helper function split_pmd_page() which is used to split a pmd to ptes.
>> 2. Add the judgment on the result of pte_alloc_one_kernel().
>>
>>   arch/riscv/Kconfig              |  1 +
>>   arch/riscv/include/asm/kfence.h | 63 +++++++++++++++++++++++++++++++++
>>   arch/riscv/mm/fault.c           | 11 +++++-
>>   3 files changed, 74 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/riscv/include/asm/kfence.h
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 4982130064ef..2f4903a7730f 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -65,6 +65,7 @@ config RISCV
>>   	select HAVE_ARCH_JUMP_LABEL_RELATIVE
>>   	select HAVE_ARCH_KASAN if MMU && 64BIT
>>   	select HAVE_ARCH_KASAN_VMALLOC if MMU && 64BIT
>> +	select HAVE_ARCH_KFENCE if MMU && 64BIT
>>   	select HAVE_ARCH_KGDB
>>   	select HAVE_ARCH_KGDB_QXFER_PKT
>>   	select HAVE_ARCH_MMAP_RND_BITS if MMU
>> diff --git a/arch/riscv/include/asm/kfence.h b/arch/riscv/include/asm/kfence.h
>> new file mode 100644
>> index 000000000000..d887a54042aa
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/kfence.h
>> @@ -0,0 +1,63 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef _ASM_RISCV_KFENCE_H
>> +#define _ASM_RISCV_KFENCE_H
>> +
>> +#include <linux/kfence.h>
>> +#include <linux/pfn.h>
>> +#include <asm-generic/pgalloc.h>
>> +#include <asm/pgtable.h>
>> +
>> +static inline int split_pmd_page(unsigned long addr)
>> +{
>> +	int i;
>> +	unsigned long pfn = PFN_DOWN(__pa((addr & PMD_MASK)));
>> +	pmd_t *pmd = pmd_off_k(addr);
>> +	pte_t *pte = pte_alloc_one_kernel(&init_mm);
>> +
>> +	if (!pte)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < PTRS_PER_PTE; i++)
>> +		set_pte(pte + i, pfn_pte(pfn + i, PAGE_KERNEL));
>> +	set_pmd(pmd, pfn_pmd(PFN_DOWN(__pa(pte)), PAGE_TABLE));
>> +
>> +	flush_tlb_kernel_range(addr, addr + PMD_SIZE);
>> +	return 0;
>> +}
>> +
>> +static inline bool arch_kfence_init_pool(void)
>> +{
>> +	int ret;
>> +	unsigned long addr;
>> +	pmd_t *pmd;
>> +
>> +	for (addr = (unsigned long)__kfence_pool; is_kfence_address((void *)addr);
>> +	     addr += PAGE_SIZE) {
>> +		pmd = pmd_off_k(addr);
>> +
>> +		if (pmd_leaf(*pmd)) {
>> +			ret = split_pmd_page(addr);
>> +			if (ret)
>> +				return false;
>> +		}
>> +	}
>> +
>> +	return true;
>> +}
>> +
>> +static inline bool kfence_protect_page(unsigned long addr, bool protect)
>> +{
>> +	pte_t *pte = virt_to_kpte(addr);
>> +
>> +	if (protect)
>> +		set_pte(pte, __pte(pte_val(*pte) & ~_PAGE_PRESENT));
>> +	else
>> +		set_pte(pte, __pte(pte_val(*pte) | _PAGE_PRESENT));
>> +
>> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>> +
>> +	return true;
>> +}
>> +
>> +#endif /* _ASM_RISCV_KFENCE_H */
>> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
>> index 096463cc6fff..aa08dd2f8fae 100644
>> --- a/arch/riscv/mm/fault.c
>> +++ b/arch/riscv/mm/fault.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/signal.h>
>>   #include <linux/uaccess.h>
>>   #include <linux/kprobes.h>
>> +#include <linux/kfence.h>
>>   
>>   #include <asm/ptrace.h>
>>   #include <asm/tlbflush.h>
>> @@ -45,7 +46,15 @@ static inline void no_context(struct pt_regs *regs, unsigned long addr)
>>   	 * Oops. The kernel tried to access some bad page. We'll have to
>>   	 * terminate things with extreme prejudice.
>>   	 */
>> -	msg = (addr < PAGE_SIZE) ? "NULL pointer dereference" : "paging request";
>> +	if (addr < PAGE_SIZE)
>> +		msg = "NULL pointer dereference";
>> +	else {
>> +		if (kfence_handle_page_fault(addr, regs->cause == EXC_STORE_PAGE_FAULT, regs))
>> +			return;
>> +
>> +		msg = "paging request";
>> +	}
>> +
>>   	die_kernel_fault(msg, addr, regs);
>>   }
>>   
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> .
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
