Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FE9CAC5A5
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 08:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BtQowOtZMTrs+ITMQrLopFsMngqLedxaFwnxRCwavo4=; b=kTU4sOAagg8m6T
	uOpajQ9QF6QRhy71cq1GcSXAS65ICPY4D0C7mJ3IUXiGgsm2PWy50kGDLtTX57saQ+XYNBT4kXrby
	YkpSoinK5e54gsoepAZd86/eHT2LiDDSFdV1t2Ar5Xv9xO1E2HArb8S3dzKXdKrN036436msJ5sGv
	zlej72XXNjKCnphQ/S9reApAC28z8s/BI67frW/uT09TMarZPTZEoWxh9rdo9HKaO8z1duK0lxWLB
	dGxmwM66SrndY0M12AZ+ApIDmVROPuCaMcBdBLajjTftDWQ9ZDo0mtZJ4RemfXiKFa5Xy78nqPonW
	vm9o3zzOv4rjZEJtMQLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWjW-00000002Hww-3X2L;
	Fri, 19 Sep 2025 08:44:46 +0000
Received: from fra-out-004.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.74.81.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWjT-00000002Hvc-1yFg;
	Fri, 19 Sep 2025 08:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1758271483; x=1789807483;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FDaXBfPtB1+IZ028q3Oc9ecT9TZeV+KPQRYxRClbnDE=;
  b=kQxp/+jCygUUaJ9K5h6tWzKwMOFKoTxS79iJyiknvFAMGkBTT9n26o+T
   Yy7A22DN1s4GNukCcNf2GZpCSuN0mcUrCidiw78UAr+SCGGYe3sxLtF1X
   vCBDfHN0LIW5Fch5r6pAzwruL3IrWeFMmkwVcp77XyldnFOfAf0CDfWzu
   suxjb/FUzabR7fjXTQBanSMtXDFvPWllgFbXBtV8XXXdxIXEJYumGavcl
   iBc9prCguPLALbRb1l+RTNKOl3FFZ05W3dkXYO97BOulyZjkRQS3wop4F
   ssxEd6Z9rL2wj1qN4yEWNUMAGOGiR/siui/Y/quywLeAneD3ZKGorhSM+
   w==;
X-CSE-ConnectionGUID: mbWG6VQ7RoqqzIWbzp0AjA==
X-CSE-MsgGUID: vpo8mYMDQZK9UPEfdukZNw==
X-IronPort-AV: E=Sophos;i="6.18,277,1751241600"; 
   d="scan'208";a="2360353"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-004.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 08:44:31 +0000
Received: from EX19MTAEUB001.ant.amazon.com [54.240.197.234:18849]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.1.3:2525] with esmtp (Farcaster)
 id 2446a584-4a1c-4985-9be9-b5a1e9401e86; Fri, 19 Sep 2025 08:44:30 +0000 (UTC)
X-Farcaster-Flow-ID: 2446a584-4a1c-4985-9be9-b5a1e9401e86
Received: from EX19D015EUB002.ant.amazon.com (10.252.51.123) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 19 Sep 2025 08:44:27 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB002.ant.amazon.com (10.252.51.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 19 Sep 2025 08:44:27 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Fri, 19 Sep 2025 08:44:27 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
To: "will@kernel.org" <will@kernel.org>
CC: "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "alex@ghiti.fr" <alex@ghiti.fr>, "andrii@kernel.org" <andrii@kernel.org>, "anna@kernel.org" <anna@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "ast@kernel.org" <ast@kernel.org>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "bp@alien8.de" <bp@alien8.de>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "brauner@kernel.org" <brauner@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "david@redhat.com" <david@redhat.com>, "derekmn@amazon.co.uk" <derekmn@amazon.co.uk>, "devel@lists.orangefs.org" <devel@lists.orangefs.org>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "haoluo@google.com" <haoluo@google.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "hpa@zytor.com" <hpa@zytor.com>, "hubcap@omnibond.com" <hubcap@omnibond.com>, "jack@suse.cz" <jack@suse.cz>, "Thomson, Jack" <jackabt@amazon.co.uk>, "jannh@google.com" <jannh@google.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "kernel@xen0n.name" <kernel@xen0n.name>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "luto@kernel.org" <luto@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "martin@omnibond.com" <martin@omnibond.com>, "maz@kernel.org" <maz@kernel.org>, "mhocko@suse.com" <mhocko@suse.com>, "mingo@redhat.com" <mingo@redhat.com>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "peterx@redhat.com" <peterx@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, "pfalcato@suse.de" <pfalcato@suse.de>, "Roy, Patrick" <roypat@amazon.co.uk>, "rppt@kernel.org" <rppt@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "seanjc@google.com" <seanjc@google.com>, "shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, "shuah@kernel.org" <shuah@kernel.org>, "song@kernel.org" <song@kernel.org>, "surenb@google.com" <surenb@google.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "trondmy@kernel.org" <trondmy@kernel.org>, "vbabka@suse.cz" <vbabka@suse.cz>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "weixugc@google.com" <weixugc@google.com>, "willy@infradead.org" <willy@infradead.org>, "x86@kernel.org" <x86@kernel.org>, "Cali, Marco" <xmarcalx@amazon.co.uk>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "yuanchu@google.com" <yuanchu@google.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v6 05/11] KVM: guest_memfd: Add flag to remove from direct
 map
Thread-Topic: [PATCH v6 05/11] KVM: guest_memfd: Add flag to remove from
 direct map
Thread-Index: AQHcKUGbESLQYfpS9EGxnIIHED72/Q==
Date: Fri, 19 Sep 2025 08:44:27 +0000
Message-ID: <20250919084425.30632-1-roypat@amazon.co.uk>
References: <aMxpvI6Aj8mDsRNm@willie-the-truck>
In-Reply-To: <aMxpvI6Aj8mDsRNm@willie-the-truck>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_014443_812432_CF830A61 
X-CRM114-Status: GOOD (  31.47  )
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

Hi Will,

On Thu, 2025-09-18 at 21:21 +0100, Will Deacon wrote:
> Hi Patrick,
> We chatted briefly at KVM Forum, so I wanted to chime in here too from
> the arm64 side.
> 
> On Fri, Sep 12, 2025 at 09:17:37AM +0000, Roy, Patrick wrote:
>> Add GUEST_MEMFD_FLAG_NO_DIRECT_MAP flag for KVM_CREATE_GUEST_MEMFD()
>> ioctl. When set, guest_memfd folios will be removed from the direct map
>> after preparation, with direct map entries only restored when the folios
>> are freed.
>>
>> To ensure these folios do not end up in places where the kernel cannot
>> deal with them, set AS_NO_DIRECT_MAP on the guest_memfd's struct
>> address_space if GUEST_MEMFD_FLAG_NO_DIRECT_MAP is requested.
>>
>> Add KVM_CAP_GUEST_MEMFD_NO_DIRECT_MAP to let userspace discover whether
>> guest_memfd supports GUEST_MEMFD_FLAG_NO_DIRECT_MAP. Support depends on
>> guest_memfd itself being supported, but also on whether linux supports
>> manipulatomg the direct map at page granularity at all (possible most of
>> the time, outliers being arm64 where its impossible if the direct map
>> has been setup using hugepages, as arm64 cannot break these apart due to
>> break-before-make semantics, and powerpc, which does not select
>> ARCH_HAS_SET_DIRECT_MAP, which also doesn't support guest_memfd anyway
>> though).
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
>> Do not perform TLB flushes after direct map manipulations. This is
>> because TLB flushes resulted in a up to 40x elongation of page faults in
>> guest_memfd (scaling with the number of CPU cores), or a 5x elongation
>> of memory population. TLB flushes are not needed for functional
>> correctness (the virt->phys mapping technically stays "correct",  the
>> kernel should simply not use it for a while). On the other hand, it means
>> that the desired protection from Spectre-style attacks is not perfect,
>> as an attacker could try to prevent a stale TLB entry from getting
>> evicted, keeping it alive until the page it refers to is used by the
>> guest for some sensitive data, and then targeting it using a
>> spectre-gadget.
> 
> I'm really not keen on this last part (at least, for arm64).
> 
> If you're not going to bother invalidating the TLB after unmapping from
> the direct map because of performance reasons, you're better off just
> leaving the direct map intact and getting even better performance. On
> arm64, that would mean you could use block mappings too.

Not until we have hardware with the newest BBM goodies I thought. When I
checked earlier this year, a defconfig has the direct map setup at 4k
granularity.

> On the other hand, if you actually care about the security properties
> from the unmap then you need the invalidation so that the mapping
> doesn't linger around. With "modern" CPU features such as pte
> aggregation and shared TLB walk caches it's not unlikely that these
> entries will persist a lot longer than you think and it makes the
> security benefits of this series impossible to reason about.

I agree it's not 100% protection, but it is still better than the status quo. I
would also love to have the TLB flushes, but sadly the performance impact of
them would make this completely unusable for Amazon :/

Mh, thinking about it now though, iirc the performance problems were mostly
because all CPUs needed to acknowledge the flush before the issuing CPU could
continue. Is there a way to have "fire and forget" flushes, where we don't wait
for acknowledgements?

> As a compromise, could we make the TLB invalidation an architecture
> opt-in so that we can have it enabled on arm64, please?

How about instead of an architecture opt-in, we have some sort of opt-out flag
userspace can set? Similar to the PFNMAP stuff KVM already has.

> Will

Best,
Patrick

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
