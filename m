Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2B9FCC9AA
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 00:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0aXHDyEO3m24s10gN989M5c4ArVYKL14TJ5pnJUHfBM=; b=ojJZC94gn7yAdt
	ojtrvpd3QdKX6nf5M6mq31Ob9zkLw/XhN69DEATJdy8ycn3RJSQMfKgRQiAMaXIh8X7RP92/hIJGT
	fUd7M04pJTtqBxE1xGM4YM8pY10EQmYpUepswYgpgy62ElJMGabyHMzmIW7XqNjs2mEXBnkVBcD2N
	WBCz9gh3WiW32ruWycO8W+JzMDhmOKQBPi9LtSjekQzFoLiRRPJ7G8/s0uXSR22EjryuFvmn3oop1
	qzWLls55iJzP+S7b1nBvkZKDIJW2Jcwev3zXXSPEX/gxha+GwYzsx4Twki0IIqdB1kIsU0Gqu1wQa
	xduG2hXgPKp8+faAnWcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkWY-00000008KXo-082j;
	Tue, 10 Mar 2026 00:00:34 +0000
Received: from fra-out-014.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.199.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUcs-00000003gP2-26ZH;
	Fri, 06 Mar 2026 12:49:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1772801394; x=1804337394;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=ZsNM+LWlhCLdso8cveAQj+8sSJJHKrqUIk0XEUUGml0=;
  b=iuw2rRWtiQTQUnNcwG6fvfr2B2pkrkHmDdMqi0BEYyeY+/FWmzm9/vI3
   lCRIpFndrR9lmd4QyuoI3aLs0iuVbBrtw3Hf2Fv3bGxlcS8bzYfJstsrJ
   PoBoEMn3XwGC3Jx+uIM5DQphKLpAXpvfhZ4cfO53r0bC+n4kKnXpYGSAJ
   7uIJ/k/acKLYEt2opstILPkqT2DmfD5buf8Q+SXAPGmmdwT+n5t/Jug4w
   6IvH7Un5j16cWlQ4gw0RxyjwedyqoojIeJTfd0Ikhx0+bb+I/Vv2vC1Tq
   cwqnkCHmM9tWxhFwqdYsDwhhAExKJVYKIcf4JucZHi531OB2W+bwwQt5i
   A==;
X-CSE-ConnectionGUID: Y4sz6pdzTp+XqctERZWOJg==
X-CSE-MsgGUID: JDyPSNQrRVitsjENXrw1AA==
X-IronPort-AV: E=Sophos;i="6.23,104,1770595200"; 
   d="scan'208";a="10315608"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-014.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 12:49:49 +0000
Received: from EX19MTAEUA001.ant.amazon.com [54.240.197.233:8094]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.24.155:2525] with esmtp (Farcaster)
 id 62873006-8db1-4bbe-a713-761efcd5b5c0; Fri, 6 Mar 2026 12:49:49 +0000 (UTC)
X-Farcaster-Flow-ID: 62873006-8db1-4bbe-a713-761efcd5b5c0
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Fri, 6 Mar 2026 12:49:36 +0000
Received: from [192.168.2.180] (10.106.83.26) by EX19D005EUB003.ant.amazon.com
 (10.252.51.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Fri, 6 Mar 2026
 12:49:31 +0000
Message-ID: <690c22f9-b71a-4f14-9857-008c7c858373@amazon.com>
Date: Fri, 6 Mar 2026 12:49:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/15] KVM: guest_memfd: Add flag to remove from
 direct map
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
 <20260126164445.11867-10-kalyazin@amazon.com>
 <13ed00e1-f0db-4326-a800-2ba306833921@kernel.org>
Content-Language: en-US
From: Nikita Kalyazin <kalyazin@amazon.com>
In-Reply-To: <13ed00e1-f0db-4326-a800-2ba306833921@kernel.org>
X-Originating-IP: [10.106.83.26]
X-ClientProxiedBy: EX19D015EUB002.ant.amazon.com (10.252.51.123) To
 EX19D005EUB003.ant.amazon.com (10.252.51.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_044954_994409_93075A31 
X-CRM114-Status: GOOD (  28.88  )
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



On 05/03/2026 19:18, David Hildenbrand (Arm) wrote:
> On 1/26/26 17:50, Kalyazin, Nikita wrote:
>> From: Patrick Roy <patrick.roy@linux.dev>
>>
>> Add GUEST_MEMFD_FLAG_NO_DIRECT_MAP flag for KVM_CREATE_GUEST_MEMFD()
>> ioctl. When set, guest_memfd folios will be removed from the direct map
>> after preparation, with direct map entries only restored when the folios
>> are freed.
>>
>> To ensure these folios do not end up in places where the kernel cannot
>> deal with them, set AS_NO_DIRECT_MAP on the guest_memfd's struct
>> address_space if GUEST_MEMFD_FLAG_NO_DIRECT_MAP is requested.
>>
>> Note that this flag causes removal of direct map entries for all
>> guest_memfd folios independent of whether they are "shared" or "private"
>> (although current guest_memfd only supports either all folios in the
>> "shared" state, or all folios in the "private" state if
>> GUEST_MEMFD_FLAG_MMAP is not set). The usecase for removing direct map
>> entries of also the shared parts of guest_memfd are a special type of
>> non-CoCo VM where, host userspace is trusted to have access to all of
>> guest memory, but where Spectre-style transient execution attacks
>> through the host kernel's direct map should still be mitigated.  In this
>> setup, KVM retains access to guest memory via userspace mappings of
>> guest_memfd, which are reflected back into KVM's memslots via
>> userspace_addr. This is needed for things like MMIO emulation on x86_64
>> to work.
>>
>> Direct map entries are zapped right before guest or userspace mappings
>> of gmem folios are set up, e.g. in kvm_gmem_fault_user_mapping() or
>> kvm_gmem_get_pfn() [called from the KVM MMU code]. The only place where
>> a gmem folio can be allocated without being mapped anywhere is
>> kvm_gmem_populate(), where handling potential failures of direct map
>> removal is not possible (by the time direct map removal is attempted,
>> the folio is already marked as prepared, meaning attempting to re-try
>> kvm_gmem_populate() would just result in -EEXIST without fixing up the
>> direct map state). These folios are then removed form the direct map
>> upon kvm_gmem_get_pfn(), e.g. when they are mapped into the guest later.
>>
>> Signed-off-by: Patrick Roy <patrick.roy@linux.dev>
>> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
>> ---
>>   Documentation/virt/kvm/api.rst  | 21 +++++----
>>   arch/x86/include/asm/kvm_host.h |  5 +--
>>   arch/x86/kvm/x86.c              |  5 +++
>>   include/linux/kvm_host.h        | 12 +++++
>>   include/uapi/linux/kvm.h        |  1 +
>>   virt/kvm/guest_memfd.c          | 80 ++++++++++++++++++++++++++++++---
>>   6 files changed, 106 insertions(+), 18 deletions(-)
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index 01a3abef8abb..c5ee43904bca 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -6440,15 +6440,18 @@ a single guest_memfd file, but the bound ranges must not overlap).
>>   The capability KVM_CAP_GUEST_MEMFD_FLAGS enumerates the `flags` that can be
>>   specified via KVM_CREATE_GUEST_MEMFD.  Currently defined flags:
>>
>> -  ============================ ================================================
>> -  GUEST_MEMFD_FLAG_MMAP        Enable using mmap() on the guest_memfd file
>> -                               descriptor.
>> -  GUEST_MEMFD_FLAG_INIT_SHARED Make all memory in the file shared during
>> -                               KVM_CREATE_GUEST_MEMFD (memory files created
>> -                               without INIT_SHARED will be marked private).
>> -                               Shared memory can be faulted into host userspace
>> -                               page tables. Private memory cannot.
>> -  ============================ ================================================
>> +  ============================== ================================================
>> +  GUEST_MEMFD_FLAG_MMAP          Enable using mmap() on the guest_memfd file
>> +                                 descriptor.
>> +  GUEST_MEMFD_FLAG_INIT_SHARED   Make all memory in the file shared during
>> +                                 KVM_CREATE_GUEST_MEMFD (memory files created
>> +                                 without INIT_SHARED will be marked private).
>> +                                 Shared memory can be faulted into host userspace
>> +                                 page tables. Private memory cannot.
>> +  GUEST_MEMFD_FLAG_NO_DIRECT_MAP The guest_memfd instance will unmap the memory
>> +                                 backing it from the kernel's address space
>> +                                 before passing it off to userspace or the guest.
>> +  ============================== ================================================
>>
>>   When the KVM MMU performs a PFN lookup to service a guest fault and the backing
>>   guest_memfd has the GUEST_MEMFD_FLAG_MMAP set, then the fault will always be
>> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
>> index 68bd29a52f24..6de1c3a6344f 100644
>> --- a/arch/x86/include/asm/kvm_host.h
>> +++ b/arch/x86/include/asm/kvm_host.h
>> @@ -2483,10 +2483,7 @@ static inline bool kvm_arch_has_irq_bypass(void)
>>   }
>>
>>   #ifdef CONFIG_KVM_GUEST_MEMFD
>> -static inline bool kvm_arch_gmem_supports_no_direct_map(void)
>> -{
>> -     return can_set_direct_map();
>> -}
>> +bool kvm_arch_gmem_supports_no_direct_map(struct kvm *kvm);
> 
> It's odd given that you introduced that code two patches previously. Can
> these changes directly be squashed into the earlier patch?
> [...]

You're right, I'll pull it in the "KVM: x86: define 
kvm_arch_gmem_supports_no_direct_map()".

> 
>>
>> +#define KVM_GMEM_FOLIO_NO_DIRECT_MAP BIT(0)
>> +
>> +static bool kvm_gmem_folio_no_direct_map(struct folio *folio)
>> +{
>> +     return ((u64)folio->private) & KVM_GMEM_FOLIO_NO_DIRECT_MAP;
>> +}
>> +
>> +static int kvm_gmem_folio_zap_direct_map(struct folio *folio)
>> +{
>> +     u64 gmem_flags = GMEM_I(folio_inode(folio))->flags;
>> +     int r = 0;
>> +
>> +     if (kvm_gmem_folio_no_direct_map(folio) || !(gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP))
>> +             goto out;
>> +
>> +     folio->private = (void *)((u64)folio->private | KVM_GMEM_FOLIO_NO_DIRECT_MAP);
>> +     r = folio_zap_direct_map(folio);
> 
> And if it fails, you'd leave KVM_GMEM_FOLIO_NO_DIRECT_MAP set.
> 
> What about modifying ->private only if it really worked?

True. I'll do

	r = folio_zap_direct_map(folio);
	if (!r)
		folio->private = (void *)((u64)folio->private | 
KVM_GMEM_FOLIO_NO_DIRECT_MAP);

> 
>> +
>> +out:
>> +     return r;
>> +}
>> +
>> +static void kvm_gmem_folio_restore_direct_map(struct folio *folio)
>> +{
>> +     /*
>> +      * Direct map restoration cannot fail, as the only error condition
>> +      * for direct map manipulation is failure to allocate page tables
>> +      * when splitting huge pages, but this split would have already
>> +      * happened in folio_zap_direct_map() in kvm_gmem_folio_zap_direct_map().
>> +      * Note that the splitting occurs always because guest_memfd
>> +      * currently supports only base pages.
>> +      * Thus folio_restore_direct_map() here only updates prot bits.
>> +      */
>> +     WARN_ON_ONCE(folio_restore_direct_map(folio));
> 
> Which raised the question: why should this function then even return an
> error?

Dave pointed earlier that the failures were possible [1].  Do you think 
we can document it better?

[1] 
https://lore.kernel.org/kvm/51a059a1-f03a-4b43-8df6-d31fca09cce7@intel.com/

> 
> 
>> +     folio->private = (void *)((u64)folio->private & ~KVM_GMEM_FOLIO_NO_DIRECT_MAP);
>> +}
>> +
>>   static inline void kvm_gmem_mark_prepared(struct folio *folio)
>>   {
>>        folio_mark_uptodate(folio);
>> @@ -393,11 +433,17 @@ static bool kvm_gmem_supports_mmap(struct inode *inode)
>>        return GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_MMAP;
>>   }
>>
>> +static bool kvm_gmem_no_direct_map(struct inode *inode)
>> +{
>> +     return GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP;
>> +}
>> +
>>   static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
>>   {
>>        struct inode *inode = file_inode(vmf->vma->vm_file);
>>        struct folio *folio;
>>        vm_fault_t ret = VM_FAULT_LOCKED;
>> +     int err;
>>
>>        if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
>>                return VM_FAULT_SIGBUS;
>> @@ -423,6 +469,14 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
>>                kvm_gmem_mark_prepared(folio);
>>        }
>>
>> +     if (kvm_gmem_no_direct_map(folio_inode(folio))) {
>> +             err = kvm_gmem_folio_zap_direct_map(folio);
>> +             if (err) {
>> +                     ret = vmf_error(err);
>> +                     goto out_folio;
>> +             }
>> +     }
>> +
>>        vmf->page = folio_file_page(folio, vmf->pgoff);
>>
>>   out_folio:
>> @@ -533,6 +587,9 @@ static void kvm_gmem_free_folio(struct folio *folio)
>>        kvm_pfn_t pfn = page_to_pfn(page);
>>        int order = folio_order(folio);
>>
>> +     if (kvm_gmem_folio_no_direct_map(folio))
>> +             kvm_gmem_folio_restore_direct_map(folio);
>> +
>>        kvm_arch_gmem_invalidate(pfn, pfn + (1ul << order));
>>   }
>>
>> @@ -596,6 +653,9 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
>>        /* Unmovable mappings are supposed to be marked unevictable as well. */
>>        WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
>>
>> +     if (flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP)
>> +             mapping_set_no_direct_map(inode->i_mapping);
>> +
>>        GMEM_I(inode)->flags = flags;
>>
>>        file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR, &kvm_gmem_fops);
>> @@ -804,15 +864,25 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>>        if (IS_ERR(folio))
>>                return PTR_ERR(folio);
>>
>> -     if (!is_prepared)
>> +     if (!is_prepared) {
>>                r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
>> +             if (r)
>> +                     goto out_unlock;
>> +     }
>> +
>> +     if (kvm_gmem_no_direct_map(folio_inode(folio))) {
>> +             r = kvm_gmem_folio_zap_direct_map(folio);
>> +             if (r)
>> +                     goto out_unlock;
>> +     }
> 
> 
> It's a bit nasty that we have two different places where we have to call
> this. Smells error prone.

We will actually have 2 more: for the write() syscall and UFFDIO_COPY, 
and 0 once we have [2]

[2] 
https://lore.kernel.org/linux-mm/20260225-page_alloc-unmapped-v1-0-e8808a03cd66@google.com/

> 
> I was wondering why kvm_gmem_get_folio() cannot handle that?

Most of the call sites follow the pattern alloc -> write -> zap so 
they'll need direct map for some time after the allocation.

> 
> Then also fallocate() would directly be handled directly, instead of
> later at fault time etc.

Good question about fallocate().  It's not apparent to me that it needs 
to remove pages from direct map because we may not be able to 
initisalise them later on if we do.

> 
> Is it because __kvm_gmem_populate() etc need to write to this page?

I think it also applies to write(), UFFDIO_COPY and 
kvm_gmem_fault_user_mapping().

> 
> 
> --
> Cheers,
> 
> David


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
