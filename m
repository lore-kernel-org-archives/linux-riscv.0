Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF3CFCC9A6
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 00:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tlb6M5Ul5T77uDJ8g+8dXEa8CkcQA6zvdmpy1fhMPPA=; b=h6KkwpFyDHcikw
	klU9ZL8U2XUbfXzTggksoltCP0QCmmed10IMAMbs9LnGkImQ7FynXHTeMDQKujhHM5erwJDMr2t+B
	zg9sIiOja/svSLKXI/urL+x1uio6C+jkGhHCEzU2o9tCsVhX8j8/X8EgKApRacjtS8FGtwE7PPqmX
	ngnGWI9qDxiGF8IqqMx/nJh/VVecXcHkjwr6tbx+HE/M102245Hl87VVi31QBqgCrW9GgyyJ7ffkn
	EmmKLNN8Aay2lC0O0NwyuGDL+WFvHh4ab3p3UG2GxqYkak3CcS8sDO7JVFnJF/bGaYlM4iNqVR4G7
	BcEKBvgABcOkZOtAGaRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkWX-00000008KWk-0LNU;
	Tue, 10 Mar 2026 00:00:33 +0000
Received: from fra-out-009.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.64.237.68])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUbo-00000003gFU-1zUm;
	Fri, 06 Mar 2026 12:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1772801328; x=1804337328;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=bMQYOYMXLfYYqfrzv9J2aTP1fDeqWn0su8Gslng5WAw=;
  b=aF12E5KVEmrnc10gXaCi2fry29S07jep2CfhEYKnObbvZsTvM6OM3JK0
   bXKD/al7Ti5z5H9I0SUV0Yij7heWt43i5oXvfsj5n7vq9i30RMapZH5/v
   qWkrIduMBdmAAVjs/xTvhAJYw14XBurzssf0CvmJv0Fe1QMeM/kqeZFwh
   QHixGGWIO2F2QMi7ZrraUBLsw18PdYN6VsJvktbf4DcPiQ7iUVeFYwUm4
   Rg92Uur+wMaJrgNrIcn107lTzqmLrl+TgX5Kchvma4wS5trAfPjRhME2H
   lRU3JTgiVchC2wfnzhP3jj2m4eGDQriytHL5mv/06NOL9dV/IFqHNgNxm
   w==;
X-CSE-ConnectionGUID: Yx/EHmQHRFy5mQfbcc7SOQ==
X-CSE-MsgGUID: vFI11kARTzO+6Dwqg0rWgg==
X-IronPort-AV: E=Sophos;i="6.23,104,1770595200"; 
   d="scan'208";a="10334043"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-009.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 12:48:42 +0000
Received: from EX19MTAEUB002.ant.amazon.com [54.240.197.224:9741]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.16.189:2525] with esmtp (Farcaster)
 id 782955b1-d49c-41df-ab22-e29b6a3853bb; Fri, 6 Mar 2026 12:48:42 +0000 (UTC)
X-Farcaster-Flow-ID: 782955b1-d49c-41df-ab22-e29b6a3853bb
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Fri, 6 Mar 2026 12:48:41 +0000
Received: from [192.168.2.180] (10.106.83.26) by EX19D005EUB003.ant.amazon.com
 (10.252.51.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Fri, 6 Mar 2026
 12:48:36 +0000
Message-ID: <92fcec4f-43f9-4207-8472-eb94874f2efd@amazon.com>
Date: Fri, 6 Mar 2026 12:48:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/15] set_memory: set_direct_map_* to take address
To: "David Hildenbrand (Arm)" <david@kernel.org>, "Kalyazin, Nikita"
	<kalyazin@amazon.co.uk>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"kernel@xen0n.name" <kernel@xen0n.name>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net"
	<corbet@lwn.net>, "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org"
	<oupton@kernel.org>, "joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com"
	<yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org"
	<willy@infradead.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "lorenzo.stoakes@oracle.com"
	<lorenzo.stoakes@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>,
	"mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org"
	<andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>,
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>,
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org"
	<kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>,
	"haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org"
	<jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com"
	<jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>,
	"jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>,
	"shuah@kernel.org" <shuah@kernel.org>, "riel@surriel.com" <riel@surriel.com>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com"
	<jgross@suse.com>, "yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>,
	"kas@kernel.org" <kas@kernel.org>, "coxu@redhat.com" <coxu@redhat.com>,
	"kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "ackerleytng@google.com"
	<ackerleytng@google.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"prsampat@amd.com" <prsampat@amd.com>, "mlevitsk@redhat.com"
	<mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>,
	"jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com"
	<agordeev@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com"
	<gor@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>,
	"svens@linux.ibm.com" <svens@linux.ibm.com>, "thuth@redhat.com"
	<thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>,
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>,
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "urezki@gmail.com"
	<urezki@gmail.com>, "zhengqi.arch@bytedance.com"
	<zhengqi.arch@bytedance.com>, "gerald.schaefer@linux.ibm.com"
	<gerald.schaefer@linux.ibm.com>, "jiayuan.chen@shopee.com"
	<jiayuan.chen@shopee.com>, "lenb@kernel.org" <lenb@kernel.org>,
	"osalvador@suse.de" <osalvador@suse.de>, "pavel@kernel.org"
	<pavel@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>,
	"vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com"
	<jackmanb@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"patrick.roy@linux.dev" <patrick.roy@linux.dev>, "Thomson, Jack"
	<jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>,
	"Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco"
	<xmarcalx@amazon.co.uk>
References: <20260126164445.11867-1-kalyazin@amazon.com>
 <20260126164445.11867-2-kalyazin@amazon.com>
 <90058ff2-9dea-4090-b2e6-da4c3cdba81b@kernel.org>
Content-Language: en-US
From: Nikita Kalyazin <kalyazin@amazon.com>
In-Reply-To: <90058ff2-9dea-4090-b2e6-da4c3cdba81b@kernel.org>
X-Originating-IP: [10.106.83.26]
X-ClientProxiedBy: EX19D002EUA002.ant.amazon.com (10.252.50.7) To
 EX19D005EUB003.ant.amazon.com (10.252.51.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_044848_808391_F80B722F 
X-CRM114-Status: GOOD (  18.06  )
X-Mailman-Approved-At: Mon, 09 Mar 2026 17:00:27 -0700
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
Reply-To: kalyazin@amazon.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 05/03/2026 17:23, David Hildenbrand (Arm) wrote:
> On 1/26/26 17:46, Kalyazin, Nikita wrote:
>> From: Nikita Kalyazin <kalyazin@amazon.com>
>>
>> This is to avoid excessive conversions folio->page->address when adding
>> helpers on top of set_direct_map_valid_noflush() in the next patch.
>>
>> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
>> ---
>>   arch/arm64/include/asm/set_memory.h     |  7 ++++---
>>   arch/arm64/mm/pageattr.c                | 19 +++++++++----------
>>   arch/loongarch/include/asm/set_memory.h |  7 ++++---
>>   arch/loongarch/mm/pageattr.c            | 25 ++++++++++++-------------
>>   arch/riscv/include/asm/set_memory.h     |  7 ++++---
>>   arch/riscv/mm/pageattr.c                | 17 +++++++++--------
>>   arch/s390/include/asm/set_memory.h      |  7 ++++---
>>   arch/s390/mm/pageattr.c                 | 13 +++++++------
>>   arch/x86/include/asm/set_memory.h       |  7 ++++---
>>   arch/x86/mm/pat/set_memory.c            | 23 ++++++++++++-----------
>>   include/linux/set_memory.h              |  9 +++++----
>>   kernel/power/snapshot.c                 |  4 ++--
>>   mm/execmem.c                            |  6 ++++--
>>   mm/secretmem.c                          |  6 +++---
>>   mm/vmalloc.c                            | 11 +++++++----
>>   15 files changed, 90 insertions(+), 78 deletions(-)
> 
> [...]
> 
>> --- a/arch/loongarch/mm/pageattr.c
>> +++ b/arch/loongarch/mm/pageattr.c
>> @@ -198,32 +198,31 @@ bool kernel_page_present(struct page *page)
>>        return pte_present(ptep_get(pte));
>>   }
>>
>> -int set_direct_map_default_noflush(struct page *page)
>> +int set_direct_map_default_noflush(const void *addr)
>>   {
>> -     unsigned long addr = (unsigned long)page_address(page);
>> -
>> -     if (addr < vm_map_base)
>> +     if ((unsigned long)addr < vm_map_base)
>>                return 0;
>>
>> -     return __set_memory(addr, 1, PAGE_KERNEL, __pgprot(0));
>> +     return __set_memory((unsigned long)addr, 1, PAGE_KERNEL, __pgprot(0));
>>   }
>>
>> -int set_direct_map_invalid_noflush(struct page *page)
>> +int set_direct_map_invalid_noflush(const void *addr)
>>   {
>> -     unsigned long addr = (unsigned long)page_address(page);
>> +     unsigned long addr = (unsigned long)addr;
> 
> Are you sure you want a local variable with the exact same name
> 

You're right.  Thanks for spotting that.

> ...
> 
>>
>> -     if (addr < vm_map_base)
>> +     if ((unsigned long)addr < vm_map_base)
>>                return 0;
>>
>> -     return __set_memory(addr, 1, __pgprot(0), __pgprot(_PAGE_PRESENT | _PAGE_VALID));
>> +     return __set_memory((unsigned long)addr, 1, __pgprot(0),
>> +                         __pgprot(_PAGE_PRESENT | _PAGE_VALID));
> 
> And cast it to (unsigned long) even though not required two times? :)
> 
> I assume you wanted to get rid of the local varable.

Yes, that's what I meant.

> 
>>   }
>>
>> -int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
>> +int set_direct_map_valid_noflush(const void *addr, unsigned long numpages,
>> +                              bool valid)
> 
> 
> 
> Nothing else jumped at me.
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks!

> 
> It would be good to get some ACK from some arch people that are CCed :)
> 
> --
> Cheers,
> 
> David


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
