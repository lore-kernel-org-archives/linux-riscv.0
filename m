Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8A1C83F11
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Aug 2023 01:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DXrRLMdV/3cIPJWutV08mlfu64C9AjKjPa4BiA44fMw=; b=G4HAQ06EAB3uC1
	tCgai30X4KnyX9oAw0XDw4/o3imzwvqX4YWdFs/AAo8JGyHOcV8OPHRJM7EeWd2Ew6aWFM6Py5YN1
	Uy/g9ged8eN6PJL3e36XAvuxjwsMUrZLHErO9afJruYB/pY6F4ArRxUm6nM0u1qztMuQce6Hkh7fL
	/l1l4ArwTVyIl4w/h+Qhfat2pR4zPNrQkSE/hAOPVVHt1zuF+cM93p/6Ifz8b2zgcPXL/uuS/IM1C
	qc6vAe9PHbjofqj2NRFVBwb1Pw8uFATWqeh+leR/NTsndczKMsB2nrvH5pviPMwGkjVUKQA2mdt1C
	BTzwEtzKF6Byp6nDhHtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZhlj-006Fh9-1g;
	Sat, 26 Aug 2023 01:07:15 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZhlf-006Ffg-1i;
	Sat, 26 Aug 2023 01:07:13 +0000
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RXdsj5kCdz1L9Gp;
	Sat, 26 Aug 2023 09:05:29 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 26 Aug 2023 09:07:01 +0800
Message-ID: <2e047e5a-d833-4c6b-8b7c-85d29e19ceed@huawei.com>
Date: Sat, 26 Aug 2023 09:07:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rfc v2 04/10] s390: mm: use try_vma_locked_page_fault()
Content-Language: en-US
To: Heiko Carstens <hca@linux.ibm.com>, Alexander Gordeev
	<agordeev@linux.ibm.com>
CC: Andrew Morton <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<surenb@google.com>, <willy@infradead.org>, Russell King
	<linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
	<kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Gerald Schaefer
	<gerald.schaefer@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>
References: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
 <20230821123056.2109942-5-wangkefeng.wang@huawei.com>
 <ZOcR4Z1WnCy1vl9T@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <20230824083225.10112-A-hca@linux.ibm.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20230824083225.10112-A-hca@linux.ibm.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_180711_933627_085C5B32 
X-CRM114-Status: GOOD (  21.11  )
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



On 2023/8/24 16:32, Heiko Carstens wrote:
> On Thu, Aug 24, 2023 at 10:16:33AM +0200, Alexander Gordeev wrote:
>> On Mon, Aug 21, 2023 at 08:30:50PM +0800, Kefeng Wang wrote:
>>> Use new try_vma_locked_page_fault() helper to simplify code.
>>> No functional change intended.
>>>
>>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>>> ---
>>>   arch/s390/mm/fault.c | 66 ++++++++++++++++++--------------------------
>>>   1 file changed, 27 insertions(+), 39 deletions(-)
> ...
>>> -	fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);
>>> -	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
>>> -		vma_end_read(vma);
>>> -	if (!(fault & VM_FAULT_RETRY)) {
>>> -		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
>>> -		if (likely(!(fault & VM_FAULT_ERROR)))
>>> -			fault = 0;
>>
>> This fault fixup is removed in the new version.
> ...
> 
>>> +		vmf.vm_flags = VM_WRITE;
>>> +	if (vmf.vm_flags == VM_WRITE)
>>> +		vmf.flags |= FAULT_FLAG_WRITE;
>>> +
>>> +	fault = try_vma_locked_page_fault(&vmf);
>>> +	if (fault == VM_FAULT_NONE)
>>> +		goto lock_mm;
>>
>> Because VM_FAULT_NONE is set to 0 it gets confused with
>> the success code of 0 returned by a fault handler. In the
>> former case we want to continue, while in the latter -
>> successfully return. I think it applies to all archs.
> ...
>> FWIW, this series ends up with kernel BUG at arch/s390/mm/fault.c:341!
> 

I didn't test and only built, this is a RFC to want to know whether
the way to add three more numbers into vmf and using vmf in arch's page
fault is feasible or not.

> Without having looked in detail into this patch: all of this is likely
> because s390's fault handling is quite odd. Not only because fault is set
> to 0, but also because of the private VM_FAULT values like
> VM_FAULT_BADCONTEXT. I'm just cleaning up all of this, but it won't make it
> for the next merge window.

Sure, if re-post, will drop the s390's change, but as mentioned above, 
the abstract of the generic vma locked and changes may be not perfect,
let's wait for more response.

Thanks all.

> 
> Therefore I'd like to ask to drop the s390 conversion of this series, and
> if this series is supposed to be merged the s390 conversion needs to be
> done later. Let's not waste more time on the current implementation,
> please.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
