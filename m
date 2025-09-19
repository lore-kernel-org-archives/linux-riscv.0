Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6055CAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 08:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCSKFaYkdh8BlZCgo+SBtLvzKLULNdkxW+gHR856Seo=; b=ad8SBay5IsWP+l
	ienfdToWwKiGC/ChPsRYwHPv7JcJe+f5a7Grw3QTFdjvXA4iEaN9mY3eaQ7j885hKoPqSPIBL0Wj3
	5OCWIN8ROAUeTTTq6Z1GwZzL6l/hzx6BIpyNe7RIEpV94RRSiCPcS98gUv4hjfPFUUS7YSmbAiiKZ
	u8Kz+TkKQ1rCOPSeOc+M/WPgwadYvpHQZ9MgCdQ/rvkRr8BEYgG8+pi7bMMZSxOGMaM+sahbYlpGW
	imtHaHfB+/Zj5LAHS4echCxS8RakxxW7PvwlOJkcuVms/4aWEwAaAieevbIR86u0SirtPkolqzAJL
	x1COFhXSV5+0UiVv2MOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWRF-00000002FAB-1eFJ;
	Fri, 19 Sep 2025 08:25:53 +0000
Received: from fra-out-010.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([63.178.143.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWRC-00000002F9M-2Aev;
	Fri, 19 Sep 2025 08:25:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1758270350; x=1789806350;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GFL7BzHqZtJ+hf0GoLUZhF6DxwKb7xJe9EgTIEodTbE=;
  b=IrqDMlmdN7kKPJNO73Fu4lOhc9Ug7uGF7JlYkvvra1U21zdqzyvC36CW
   WEp7O+E2bKDl1LmEwrCmUXNE2JuFr01EVun4pIETKccxD8o/sWpM/PkHJ
   ZIc4Y7n/NE5G2/Qgqs6Yz4xcq8eh/ayIlYZiV/lwT57pjQgkpqUTjOvQ7
   jV6RuwqXxr4O64qsRyZ7zcf7HGNFeLrh0KJ9/8a+VP26tPMLo7vmjhHkR
   uRkH6xXP+A3nUdRaEbVvWSatl4+8/XJ6IvWpEm/sAA862nmAPNECfxKPc
   PBdJyO4cc4qr8cBcWXLe22W3TyC+CMtL0h7qe5S4N3OIw4wRNBGDT9UuF
   w==;
X-CSE-ConnectionGUID: IsZxf8f8SjWiNUjgDVp6Og==
X-CSE-MsgGUID: xwNyaF2SS7eyXLTiQsdIFQ==
X-IronPort-AV: E=Sophos;i="6.18,277,1751241600"; 
   d="scan'208";a="2255186"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-010.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 08:25:37 +0000
Received: from EX19MTAEUA001.ant.amazon.com [54.240.197.233:22673]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.0.240:2525] with esmtp (Farcaster)
 id 99b608d7-c465-47ba-b3fb-c53cc7a3b236; Fri, 19 Sep 2025 08:25:37 +0000 (UTC)
X-Farcaster-Flow-ID: 99b608d7-c465-47ba-b3fb-c53cc7a3b236
Received: from EX19D015EUB003.ant.amazon.com (10.252.51.113) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 19 Sep 2025 08:25:36 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB003.ant.amazon.com (10.252.51.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 19 Sep 2025 08:25:36 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Fri, 19 Sep 2025 08:25:36 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
To: "rppt@kernel.org" <rppt@kernel.org>
CC: "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "alex@ghiti.fr" <alex@ghiti.fr>, "andrii@kernel.org" <andrii@kernel.org>, "anna@kernel.org" <anna@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "ast@kernel.org" <ast@kernel.org>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "bp@alien8.de" <bp@alien8.de>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "brauner@kernel.org" <brauner@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "david@redhat.com" <david@redhat.com>, "derekmn@amazon.co.uk" <derekmn@amazon.co.uk>, "devel@lists.orangefs.org" <devel@lists.orangefs.org>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "haoluo@google.com" <haoluo@google.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "hpa@zytor.com" <hpa@zytor.com>, "hubcap@omnibond.com" <hubcap@omnibond.com>, "jack@suse.cz" <jack@suse.cz>, "Thomson, Jack" <jackabt@amazon.co.uk>, "jannh@google.com" <jannh@google.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "kernel@xen0n.name" <kernel@xen0n.name>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "luto@kernel.org" <luto@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "martin@omnibond.com" <martin@omnibond.com>, "maz@kernel.org" <maz@kernel.org>, "mhocko@suse.com" <mhocko@suse.com>, "mingo@redhat.com" <mingo@redhat.com>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "peterx@redhat.com" <peterx@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, "pfalcato@suse.de" <pfalcato@suse.de>, "Roy, Patrick" <roypat@amazon.co.uk>, "sdf@fomichev.me" <sdf@fomichev.me>, "seanjc@google.com" <seanjc@google.com>, "shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, "shuah@kernel.org" <shuah@kernel.org>, "song@kernel.org" <song@kernel.org>, "surenb@google.com" <surenb@google.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "trondmy@kernel.org" <trondmy@kernel.org>, "vbabka@suse.cz" <vbabka@suse.cz>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "weixugc@google.com" <weixugc@google.com>, "will@kernel.org" <will@kernel.org>, "willy@infradead.org" <willy@infradead.org>, "x86@kernel.org" <x86@kernel.org>, "Cali, Marco" <xmarcalx@amazon.co.uk>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "yuanchu@google.com" <yuanchu@google.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v6 05/11] KVM: guest_memfd: Add flag to remove from direct
 map
Thread-Topic: [PATCH v6 05/11] KVM: guest_memfd: Add flag to remove from
 direct map
Thread-Index: AQHcKT757eD2hLtXdESX+jHFR62e2Q==
Date: Fri, 19 Sep 2025 08:25:36 +0000
Message-ID: <20250919082534.17376-1-roypat@amazon.co.uk>
References: <aMZyacbUEM7HErM1@kernel.org>
In-Reply-To: <aMZyacbUEM7HErM1@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_012551_050466_321C5126 
X-CRM114-Status: GOOD (  15.94  )
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

Hi Mike,

...

>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index 2f2394cce24e..0bfd8e5fd9de 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -19,6 +19,7 @@
>>  #include <linux/maple_tree.h>
>>  #include <linux/percpu.h>
>>  #include <linux/psci.h>
>> +#include <linux/set_memory.h>
>>  #include <asm/arch_gicv3.h>
>>  #include <asm/barrier.h>
>>  #include <asm/cpufeature.h>
>> @@ -1706,5 +1707,16 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt);
>>  void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *res1);
>>  void check_feature_map(void);
>>
>> +#ifdef CONFIG_KVM_GUEST_MEMFD
>> +static inline bool kvm_arch_gmem_supports_no_direct_map(void)
>> +{
>> +     /*
>> +      * Without FWB, direct map access is needed in kvm_pgtable_stage2_map(),
>> +      * as it calls dcache_clean_inval_poc().
>> +      */
>> +     return can_set_direct_map() && cpus_have_final_cap(ARM64_HAS_STAGE2_FWB);
>> +}
>> +#define kvm_arch_gmem_supports_no_direct_map kvm_arch_gmem_supports_no_direct_map
>> +#endif /* CONFIG_KVM_GUEST_MEMFD */
>>
>>  #endif /* __ARM64_KVM_HOST_H__ */
>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>> index 1d0585616aa3..a9468bce55f2 100644
>> --- a/include/linux/kvm_host.h
>> +++ b/include/linux/kvm_host.h
>> @@ -36,6 +36,7 @@
>>  #include <linux/rbtree.h>
>>  #include <linux/xarray.h>
>>  #include <asm/signal.h>
>> +#include <linux/set_memory.h>
> 
> The set_memory APIs are not used in the header, no need to include it here.
> 

Ack!

>>  #include <linux/kvm.h>
>>  #include <linux/kvm_para.h>
>> @@ -731,6 +732,12 @@ static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
>>  bool kvm_arch_supports_gmem_mmap(struct kvm *kvm);
>>  #endif
>>
>> +#ifdef CONFIG_KVM_GUEST_MEMFD
>> +#ifndef kvm_arch_gmem_supports_no_direct_map
>> +#define kvm_arch_gmem_supports_no_direct_map can_set_direct_map
>> +#endif
>> +#endif /* CONFIG_KVM_GUEST_MEMFD */
>> +
>>  #ifndef kvm_arch_has_readonly_mem
>>  static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
>>  {
>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>> index 6efa98a57ec1..33c8e8946019 100644
>> --- a/include/uapi/linux/kvm.h
>> +++ b/include/uapi/linux/kvm.h
>> @@ -963,6 +963,7 @@ struct kvm_enable_cap {
>>  #define KVM_CAP_RISCV_MP_STATE_RESET 242
>>  #define KVM_CAP_ARM_CACHEABLE_PFNMAP_SUPPORTED 243
>>  #define KVM_CAP_GUEST_MEMFD_MMAP 244
>> +#define KVM_CAP_GUEST_MEMFD_NO_DIRECT_MAP 245
>>
>>  struct kvm_irq_routing_irqchip {
>>       __u32 irqchip;
>> @@ -1600,6 +1601,7 @@ struct kvm_memory_attributes {
>>
>>  #define KVM_CREATE_GUEST_MEMFD       _IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
>>  #define GUEST_MEMFD_FLAG_MMAP        (1ULL << 0)
>> +#define GUEST_MEMFD_FLAG_NO_DIRECT_MAP (1ULL << 1)
>>
>>  struct kvm_create_guest_memfd {
>>       __u64 size;
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 81028984ff89..3c64099fc98a 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -4,6 +4,7 @@
>>  #include <linux/kvm_host.h>
>>  #include <linux/pagemap.h>
>>  #include <linux/anon_inodes.h>
>> +#include <linux/set_memory.h>
>>
>>  #include "kvm_mm.h"
>>
>> @@ -42,9 +43,24 @@ static int __kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slo
>>       return 0;
>>  }
>>
>> -static inline void kvm_gmem_mark_prepared(struct folio *folio)
>> +static bool kvm_gmem_test_no_direct_map(struct inode *inode)
>>  {
>> -     folio_mark_uptodate(folio);
>> +     return ((unsigned long) inode->i_private) & GUEST_MEMFD_FLAG_NO_DIRECT_MAP;
>> +}
>> +
>> +static inline int kvm_gmem_mark_prepared(struct folio *folio)
>> +{
>> +     struct inode *inode = folio_inode(folio);
>> +     int r = 0;
>> +
>> +     if (kvm_gmem_test_no_direct_map(inode))
>> +             r = set_direct_map_valid_noflush(folio_page(folio, 0), folio_nr_pages(folio),
>> +                                              false);
>> +
>> +     if (!r)
>> +             folio_mark_uptodate(folio);
>> +
>> +     return r;
>>  }
>>
>>  /*
>> @@ -82,7 +98,7 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
>>       index = ALIGN_DOWN(index, 1 << folio_order(folio));
>>       r = __kvm_gmem_prepare_folio(kvm, slot, index, folio);
>>       if (!r)
>> -             kvm_gmem_mark_prepared(folio);
>> +             r = kvm_gmem_mark_prepared(folio);
> 
> If this fails, shouldn't we undo __kvm_gmem_prepare_folio()?
>

Yes, good point. I'm not sure if we can undo preparation (its only used
by AMD-SEV right now, for passing off the page to the CoCo context). But
not undoing it means that guest_memfd will consider the page unprepared,
and zero it again the next time it's accesses, which will cause a
machine check because the page has already been passed off to the
confidential world.

We talked about this in the guest_memfd upstream call yesterday, and
decided that in addition to this problem, we want to separate
preparedness tracking from direct map removal state tracking anyway (and
move preparedness tracking outside of guest_memfd into the arch specific
code). And if direct map state and preparedness are separate bits, then
we can accurately record the state of "preparation worked but direct map
removal failed".

>>
>>       return r;
>>  }
>> @@ -344,8 +360,15 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
>>       }
>>
>>       if (!folio_test_uptodate(folio)) {
>> +             int err = 0;
>> +
>>               clear_highpage(folio_page(folio, 0));
>> -             kvm_gmem_mark_prepared(folio);
>> +             err = kvm_gmem_mark_prepared(folio);
>> +
>> +             if (err) {
>> +                     ret = vmf_error(err);
>> +                     goto out_folio;
>> +             }
>>       }
>>
>>       vmf->page = folio_file_page(folio, vmf->pgoff);
>> @@ -436,6 +459,16 @@ static void kvm_gmem_free_folio(struct address_space *mapping,
>>       kvm_pfn_t pfn = page_to_pfn(page);
>>       int order = folio_order(folio);
>>
>> +     /*
>> +      * Direct map restoration cannot fail, as the only error condition
>> +      * for direct map manipulation is failure to allocate page tables
>> +      * when splitting huge pages, but this split would have already
>> +      * happened in set_direct_map_invalid_noflush() in kvm_gmem_mark_prepared().
>> +      * Thus set_direct_map_valid_noflush() here only updates prot bits.
>> +      */
>> +     if (kvm_gmem_test_no_direct_map(mapping->host))
>> +             set_direct_map_valid_noflush(page, folio_nr_pages(folio), true);
>> +
>>       kvm_arch_gmem_invalidate(pfn, pfn + (1ul << order));
>>  }
>>
>> @@ -500,6 +533,9 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
>>       /* Unmovable mappings are supposed to be marked unevictable as well. */
>>       WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
>>
>> +     if (flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP)
>> +             mapping_set_no_direct_map(inode->i_mapping);
>> +
>>       kvm_get_kvm(kvm);
>>       gmem->kvm = kvm;
>>       xa_init(&gmem->bindings);
>> @@ -524,6 +560,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>>       if (kvm_arch_supports_gmem_mmap(kvm))
>>               valid_flags |= GUEST_MEMFD_FLAG_MMAP;
>>
>> +     if (kvm_arch_gmem_supports_no_direct_map())
>> +             valid_flags |= GUEST_MEMFD_FLAG_NO_DIRECT_MAP;
>> +
>>       if (flags & ~valid_flags)
>>               return -EINVAL;
>>
>> @@ -768,7 +807,7 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
>>               p = src ? src + i * PAGE_SIZE : NULL;
>>               ret = post_populate(kvm, gfn, pfn, p, max_order, opaque);
>>               if (!ret)
>> -                     kvm_gmem_mark_prepared(folio);
>> +                     ret = kvm_gmem_mark_prepared(folio);
>>
>>  put_folio_and_exit:
>>               folio_put(folio);
...

>
> Sincerely yours,
> Mike.
Best, 
Patrick


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
