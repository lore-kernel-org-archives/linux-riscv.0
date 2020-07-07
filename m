Return-Path: <SRS0=Os/g=AS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AEBC433DF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2020 03:51:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD6962053B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2020 03:51:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cn9yWlfK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD6962053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xop8AiJTiJgMLS5nTPbjZqnAK/hS8TaRnBe2z/NLGtQ=; b=Cn9yWlfKzP4QjPAc1wV5yTJkT
	Kus0KdHTVjxqjoUrK7jNkGz8SE8sLVq65HcHgQ3Lsw42WAsu1/HQVdnz4BvaIi1l3g5aRPBOAixWo
	qmDag95OekpoogDJpjw44Vzxux3QaIJOmidvLNvcr8SDI2QpUrhYobRXV4Twc149H5oBpMr2FRSHr
	pXQ8Zysgrl/bW+njv+P2N70GI1vJhIz1um1btQB5xzW/Dv/gN42ADBf2JenWi6Oc7QncQJRMs6mBr
	Hz9ja64q9ssrYseRvnBAITgF6gJxk0ph2VbvwDW3tpnZGyl7AQdVPyx6cNDJs5iZBMjR+unlOaUyJ
	wbpmLT1ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsedl-0006ww-Tk; Tue, 07 Jul 2020 03:51:29 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsedh-0006vT-9V; Tue, 07 Jul 2020 03:51:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90E72C0A;
 Mon,  6 Jul 2020 20:51:19 -0700 (PDT)
Received: from [10.163.86.118] (unknown [10.163.86.118])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E34973F718;
 Mon,  6 Jul 2020 20:51:11 -0700 (PDT)
Subject: Re: [PATCH V4 1/3] mm/sparsemem: Enable vmem_altmap support in
 vmemmap_populate_basepages()
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
References: <1594004178-8861-1-git-send-email-anshuman.khandual@arm.com>
 <1594004178-8861-2-git-send-email-anshuman.khandual@arm.com>
 <eeeb44f9-bc0a-2c3d-8e8f-7e3d9e066c7e@redhat.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <7ac5ff78-378c-37e2-444f-9f72844b8697@arm.com>
Date: Tue, 7 Jul 2020 09:20:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <eeeb44f9-bc0a-2c3d-8e8f-7e3d9e066c7e@redhat.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_235125_439055_C112D2EC 
X-CRM114-Status: GOOD (  25.15  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 catalin.marinas@arm.com, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, justin.he@arm.com, x86@kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, akpm@linux-foundation.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 07/06/2020 02:33 PM, David Hildenbrand wrote:
>>  	return 0;
>> @@ -1505,7 +1505,7 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>  	int err;
>>  
>>  	if (end - start < PAGES_PER_SECTION * sizeof(struct page))
>> -		err = vmemmap_populate_basepages(start, end, node);
>> +		err = vmemmap_populate_basepages(start, end, node, NULL);
>>  	else if (boot_cpu_has(X86_FEATURE_PSE))
>>  		err = vmemmap_populate_hugepages(start, end, node, altmap);
>>  	else if (altmap) {
> 
> It's somewhat weird that we don't allocate basepages from altmap on x86
> (both for sub-sections and without PSE). I wonder if we can simply
> unlock that with your change. Especially, also handle the
> !X86_FEATURE_PSE case below properly with an altmap.
> 
> a) all hw with PMEM has PSE - except special QEMU setups, so nobody
> cared to implement. For the sub-section special case, nobody cared about
> a handfull of memmap not ending up on the altmap. (but it's still wasted
> system memory IIRC).
> 
> b) the pagetable overhead for small pages is not-neglectable and might
> result in similar issues as solved by the switch to altmap on very huge
> PMEM (with small amount of system RAM).
> 
> I guess it is due to a).

Hmm, I assume these are some decisions that x86 platform will have to
make going forward in a subsequent patch as the third patch does for
the arm64 platform. But it is clearly beyond the scope of this patch
which never intended to change existing behavior on a given platform.

> 
> [...]
> 
>>  
>> -pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node)
>> +pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
>> +				       struct vmem_altmap *altmap)
>>  {
>>  	pte_t *pte = pte_offset_kernel(pmd, addr);
>>  	if (pte_none(*pte)) {
>>  		pte_t entry;
>> -		void *p = vmemmap_alloc_block_buf(PAGE_SIZE, node);
>> +		void *p;
>> +
>> +		if (altmap)
>> +			p = altmap_alloc_block_buf(PAGE_SIZE, altmap);
>> +		else
>> +			p = vmemmap_alloc_block_buf(PAGE_SIZE, node);
>>  		if (!p)
>>  			return NULL;
> 
> I was wondering if
> 
> if (altmap)
> 	p = altmap_alloc_block_buf(PAGE_SIZE, altmap);
> if (!p)
> 	p = vmemmap_alloc_block_buf(PAGE_SIZE, node);
> if (!p)
> 	return NULL
> 
> Would make sense. But I guess this isn't really relevant in practice,
> because the altmap is usually sized properly.
> 
> In general, LGTM.

Okay, I assume that no further changes are required here.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
