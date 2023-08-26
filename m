Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41E0C83F0C
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Aug 2023 00:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCousKfKe7DjuaQJUOiO9r83T30EZIKa4q3TR8nVds0=; b=r9iuSLLb8SaXSx
	esrIeSI1bwLAQcQSOf0+BlNIHvLITzDl7LOlk+dJi8vnWcf7VPJoqk9wqJ9SnrDj7T8d2FrQtrkHu
	IONN7WqC1Qh9HXMSEyJhH7JVNX/Ped5KBsPamcnQZcUi14Pj9La+9dhEpqtv9sT7oF+KD6zjeDQxz
	bDwdEjZR2E5I4kwQmMavVJ7WKaSJC0d4dH1JVPmm5OuQOzpbWHDq6+ReklUIDtV15N8sNDDQZ4HsM
	+7vJEFSo3I0/uYs/s4yxVp1rEC1Gvc7wv4xd20Igl5hTP8axn8XPmMPFoeuAlRNFD/h7RiEXfUkIM
	qcAEnex3gapecofrlfSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZhbX-006FAh-0I;
	Sat, 26 Aug 2023 00:56:43 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZhbR-006F94-2U;
	Sat, 26 Aug 2023 00:56:41 +0000
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RXdZy6d9WztRf4;
	Sat, 26 Aug 2023 08:52:42 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 26 Aug 2023 08:56:28 +0800
Message-ID: <26989657-3ad9-48c5-9863-12993b78141c@huawei.com>
Date: Sat, 26 Aug 2023 08:56:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rfc v2 01/10] mm: add a generic VMA lock-based page fault
 handler
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
CC: Andrew Morton <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<surenb@google.com>, <willy@infradead.org>, Russell King
	<linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
	<kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Gerald Schaefer
	<gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>
References: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
 <20230821123056.2109942-2-wangkefeng.wang@huawei.com>
 <ZOcC7RsYy5yJLgNb@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <ZOcC7RsYy5yJLgNb@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_175638_177842_A28A5083 
X-CRM114-Status: GOOD (  15.23  )
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



On 2023/8/24 15:12, Alexander Gordeev wrote:
> On Mon, Aug 21, 2023 at 08:30:47PM +0800, Kefeng Wang wrote:
> 
> Hi Kefeng,
> 
>> The ARCH_SUPPORTS_PER_VMA_LOCK are enabled by more and more architectures,
>> eg, x86, arm64, powerpc and s390, and riscv, those implementation are very
>> similar which results in some duplicated codes, let's add a generic VMA
>> lock-based page fault handler try_to_vma_locked_page_fault() to eliminate
>> them, and which also make us easy to support this on new architectures.
>>
>> Since different architectures use different way to check vma whether is
>> accessable or not, the struct pt_regs, page fault error code and vma flags
>> are added into struct vm_fault, then, the architecture's page fault code
>> could re-use struct vm_fault to record and check vma accessable by each
>> own implementation.
>>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
...
>> +
>> +vm_fault_t try_vma_locked_page_fault(struct vm_fault *vmf)
>> +{
>> +	vm_fault_t fault = VM_FAULT_NONE;
>> +	struct vm_area_struct *vma;
>> +
>> +	if (!(vmf->flags & FAULT_FLAG_USER))
>> +		return fault;
>> +
>> +	vma = lock_vma_under_rcu(current->mm, vmf->real_address);
>> +	if (!vma)
>> +		return fault;
>> +
>> +	if (arch_vma_access_error(vma, vmf)) {
>> +		vma_end_read(vma);
>> +		return fault;
>> +	}
>> +
>> +	fault = handle_mm_fault(vma, vmf->real_address,
>> +				vmf->flags | FAULT_FLAG_VMA_LOCK, vmf->regs);
>> +
>> +	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
>> +		vma_end_read(vma);
> 
> Could you please explain how vma_end_read() call could be conditional?

The check is added for swap and userfault, see

https://lkml.kernel.org/r/20230630211957.1341547-4-surenb@google.com
> 
>> +
>> +	if (fault & VM_FAULT_RETRY)
>> +		count_vm_vma_lock_event(VMA_LOCK_RETRY);
>> +	else
>> +		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
>> +
>> +	return fault;
>> +}
>> +
>>   #endif /* CONFIG_PER_VMA_LOCK */
>>   
>>   #ifndef __PAGETABLE_P4D_FOLDED

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
