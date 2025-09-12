Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B213BCAC593
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 09:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUsH/OTmlQePKqFHBUQA7EHyuwPAYdtcNqkzw1b9Y4g=; b=cVe5JKvk3axtxb
	0AOBizrnkyb7/pznHu/08sA7XpzlXOKCe5PrS0+tHLK0EvPmLLbtGI2bMtsr92H9T1cmOcA8w5riU
	XBQOZFhB5iY4W0owQAc2TsYh3iWO+jDdAnB8pTH8Uy5JFkSXRlA3DL2i42EE7SxJFwnHQ9T/m4PCh
	x9WbHthIm7Ypsh4ImxapDfYied7Zrf977BACT/8YvOIxLEhomjdBoSaO4l+2jBs0ZXpes1ZG+c22X
	5pq1WXlQ6FrsnZLafSMkxzN/cB5qIlUKwdfdOxzh1TnIibAlIkz7ALTeVjJWqn+JY7C2mAK04Tpbx
	OhdyFJERB2ap4XuYpxSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzuu-00000008C8I-1muc;
	Fri, 12 Sep 2025 09:18:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzur-00000008C3L-0etc;
	Fri, 12 Sep 2025 09:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:From:Sender:
	Reply-To:To:Content-ID:Content-Description;
	bh=41cdObRV2/ULxTOTq6Jo3VA2F7BSJFHzuhvS9zYggVk=; b=ITFmCgecJuzceGsR2Q+GU226Nd
	G7eJaOmLhjgSIQ1RY6wu8e2QZKYlXaF3mAtvaKrUEvNtmupr866gtpuRcR0kqpF99m/tV3NIroGt1
	IhHqfU7iFuza+ieJO+RqY2yrli79vCdFSylYKBQlVo0NDs1O7uEa6liclKcRj85EjZ6hAKYx7Nn0y
	hkKXcWt9wPTbbjw+m/LBoOrWt1lc5/D7Te3y+MogVNfW9pSr3r7NAPz259r8pkKmQn9O8LHIFultp
	rUKLq7L/ouKFHBM5ixGTh/dZmrSxAgulppNIz2SbbrsgTKZXu3bPtPoTFFyg6WqVEwKFtXDnSXcdN
	kph1I22Q==;
Received: from fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.156.205.64])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzum-00000006HSW-0xua;
	Fri, 12 Sep 2025 09:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1757668676; x=1789204676;
  h=from:cc:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=41cdObRV2/ULxTOTq6Jo3VA2F7BSJFHzuhvS9zYggVk=;
  b=KgIXe2XuzXCAaHA0zcOeaIlP0GcxDlZ1AHJjTqUiArq3W9aMiqcDG5cC
   c/r9cSMFWxyF46yqdKp3S/JQYXPr4lLsNZN6Z8xoxF3fM48h61Af3k9Or
   7/Le/5Vsr+5l1q+/bkPwYqAeBklA71/0T/ZD7QW6UdY5mnUE21/zdIizw
   0tVjjXLcn7Af0cbqSqJ1MMlnw4KVGB9uc8lBwtbG2DOK7w4mLRJYmQ9JW
   sIxBJNUMbP/Kh7UjhVehXvMXAw71oyV7enR8Vkt4Qay0Ww0V32jcfJbXm
   3tKJKUILFw72JN/kE7BAuM6FJoXo+j42ogi5k4X7PzyQDBXHfWZoql/nt
   g==;
X-CSE-ConnectionGUID: ebdcgtMrTx6xMDSWHdTt2g==
X-CSE-MsgGUID: PGUELi/XT06/ELEYBnfMnQ==
X-IronPort-AV: E=Sophos;i="6.18,259,1751241600"; 
   d="scan'208";a="2004659"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 09:17:55 +0000
Received: from EX19MTAEUB002.ant.amazon.com [54.240.197.232:16512]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.1.26:2525] with esmtp (Farcaster)
 id 0785c246-36c5-4fce-8800-3c624d06aeb2; Fri, 12 Sep 2025 09:17:55 +0000 (UTC)
X-Farcaster-Flow-ID: 0785c246-36c5-4fce-8800-3c624d06aeb2
Received: from EX19D015EUB001.ant.amazon.com (10.252.51.114) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:44 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB001.ant.amazon.com (10.252.51.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:43 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Fri, 12 Sep 2025 09:17:43 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
CC: "Thomson, Jack" <jackabt@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "Cali, Marco" <xmarcalx@amazon.co.uk>, "derekmn@amazon.co.uk" <derekmn@amazon.co.uk>, "Roy, Patrick" <roypat@amazon.co.uk>, "willy@infradead.org" <willy@infradead.org>, "corbet@lwn.net" <corbet@lwn.net>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr" <alex@ghiti.fr>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "trondmy@kernel.org" <trondmy@kernel.org>, "anna@kernel.org" <anna@kernel.org>, "hubcap@omnibond.com" <hubcap@omnibond.com>, "martin@omnibond.com" <martin@omnibond.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "brauner@kernel.org" <brauner@kernel.org>, "jack@suse.cz" <jack@suse.cz>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@redhat.com" <david@redhat.com>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "yuanchu@google.com" <yuanchu@google.com>, "weixugc@google.com" <weixugc@google.com>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, "shuah@kernel.org" <shuah@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "devel@lists.orangefs.org" <devel@lists.orangefs.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: [PATCH v6 08/11] KVM: selftests: Add guest_memfd based
 vm_mem_backing_src_types
Thread-Topic: [PATCH v6 08/11] KVM: selftests: Add guest_memfd based
 vm_mem_backing_src_types
Thread-Index: AQHcI8YY6/+VU2XIuE+c9Ntv3BXwAw==
Date: Fri, 12 Sep 2025 09:17:43 +0000
Message-ID: <20250912091708.17502-9-roypat@amazon.co.uk>
References: <20250912091708.17502-1-roypat@amazon.co.uk>
In-Reply-To: <20250912091708.17502-1-roypat@amazon.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_101756_515705_FA239269 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Allow selftests to configure their memslots such that userspace_addr is
set to a MAP_SHARED mapping of the guest_memfd that's associated with
the memslot. This setup is the configuration for non-CoCo VMs, where all
guest memory is backed by a guest_memfd whose folios are all marked
shared, but KVM is still able to access guest memory to provide
functionality such as MMIO emulation on x86.

Add backing types for normal guest_memfd, as well as direct map removed
guest_memfd.

Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 18 ++++++
 .../testing/selftests/kvm/include/test_util.h |  7 +++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 63 ++++++++++---------
 tools/testing/selftests/kvm/lib/test_util.c   |  8 +++
 4 files changed, 66 insertions(+), 30 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 23a506d7eca3..5204a0a18a7f 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -635,6 +635,24 @@ static inline bool is_smt_on(void)
 
 void vm_create_irqchip(struct kvm_vm *vm);
 
+static inline uint32_t backing_src_guest_memfd_flags(enum vm_mem_backing_src_type t)
+{
+	uint32_t flags = 0;
+
+	switch (t) {
+	case VM_MEM_SRC_GUEST_MEMFD:
+		flags |= GUEST_MEMFD_FLAG_MMAP;
+		fallthrough;
+	case VM_MEM_SRC_GUEST_MEMFD_NO_DIRECT_MAP:
+		flags |= GUEST_MEMFD_FLAG_NO_DIRECT_MAP;
+		break;
+	default:
+		break;
+	}
+
+	return flags;
+}
+
 static inline int __vm_create_guest_memfd(struct kvm_vm *vm, uint64_t size,
 					uint64_t flags)
 {
diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
index 0409b7b96c94..a56e53fc7b39 100644
--- a/tools/testing/selftests/kvm/include/test_util.h
+++ b/tools/testing/selftests/kvm/include/test_util.h
@@ -133,6 +133,8 @@ enum vm_mem_backing_src_type {
 	VM_MEM_SRC_ANONYMOUS_HUGETLB_16GB,
 	VM_MEM_SRC_SHMEM,
 	VM_MEM_SRC_SHARED_HUGETLB,
+	VM_MEM_SRC_GUEST_MEMFD,
+	VM_MEM_SRC_GUEST_MEMFD_NO_DIRECT_MAP,
 	NUM_SRC_TYPES,
 };
 
@@ -165,6 +167,11 @@ static inline bool backing_src_is_shared(enum vm_mem_backing_src_type t)
 	return vm_mem_backing_src_alias(t)->flag & MAP_SHARED;
 }
 
+static inline bool backing_src_is_guest_memfd(enum vm_mem_backing_src_type t)
+{
+	return t == VM_MEM_SRC_GUEST_MEMFD || t == VM_MEM_SRC_GUEST_MEMFD_NO_DIRECT_MAP;
+}
+
 static inline bool backing_src_can_be_huge(enum vm_mem_backing_src_type t)
 {
 	return t != VM_MEM_SRC_ANONYMOUS && t != VM_MEM_SRC_SHMEM;
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index cc67dfecbf65..a81089f7c83f 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1060,6 +1060,34 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 	alignment = 1;
 #endif
 
+	if (guest_memfd < 0) {
+		if ((flags & KVM_MEM_GUEST_MEMFD) || backing_src_is_guest_memfd(src_type)) {
+			uint32_t guest_memfd_flags = backing_src_guest_memfd_flags(src_type);
+
+			TEST_ASSERT(!guest_memfd_offset,
+				    "Offset must be zero when creating new guest_memfd");
+			guest_memfd = vm_create_guest_memfd(vm, mem_size, guest_memfd_flags);
+		}
+	} else {
+		/*
+		 * Install a unique fd for each memslot so that the fd
+		 * can be closed when the region is deleted without
+		 * needing to track if the fd is owned by the framework
+		 * or by the caller.
+		 */
+		guest_memfd = dup(guest_memfd);
+		TEST_ASSERT(guest_memfd >= 0, __KVM_SYSCALL_ERROR("dup()", guest_memfd));
+	}
+
+	if (guest_memfd > 0) {
+		flags |= KVM_MEM_GUEST_MEMFD;
+
+		region->region.guest_memfd = guest_memfd;
+		region->region.guest_memfd_offset = guest_memfd_offset;
+	} else {
+		region->region.guest_memfd = -1;
+	}
+
 	/*
 	 * When using THP mmap is not guaranteed to returned a hugepage aligned
 	 * address so we have to pad the mmap. Padding is not needed for HugeTLB
@@ -1075,10 +1103,13 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 	if (alignment > 1)
 		region->mmap_size += alignment;
 
-	region->fd = -1;
-	if (backing_src_is_shared(src_type))
+	if (backing_src_is_guest_memfd(src_type))
+		region->fd = guest_memfd;
+	else if (backing_src_is_shared(src_type))
 		region->fd = kvm_memfd_alloc(region->mmap_size,
 					     src_type == VM_MEM_SRC_SHARED_HUGETLB);
+	else
+		region->fd = -1;
 
 	region->mmap_start = mmap(NULL, region->mmap_size,
 				  PROT_READ | PROT_WRITE,
@@ -1106,34 +1137,6 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 	}
 
 	region->backing_src_type = src_type;
-
-	if (guest_memfd < 0) {
-		if (flags & KVM_MEM_GUEST_MEMFD) {
-			uint32_t guest_memfd_flags = 0;
-			TEST_ASSERT(!guest_memfd_offset,
-				    "Offset must be zero when creating new guest_memfd");
-			guest_memfd = vm_create_guest_memfd(vm, mem_size, guest_memfd_flags);
-		}
-	} else {
-		/*
-		 * Install a unique fd for each memslot so that the fd
-		 * can be closed when the region is deleted without
-		 * needing to track if the fd is owned by the framework
-		 * or by the caller.
-		 */
-		guest_memfd = dup(guest_memfd);
-		TEST_ASSERT(guest_memfd >= 0, __KVM_SYSCALL_ERROR("dup()", guest_memfd));
-	}
-
-	if (guest_memfd > 0) {
-		flags |= KVM_MEM_GUEST_MEMFD;
-
-		region->region.guest_memfd = guest_memfd;
-		region->region.guest_memfd_offset = guest_memfd_offset;
-	} else {
-		region->region.guest_memfd = -1;
-	}
-
 	region->unused_phy_pages = sparsebit_alloc();
 	if (vm_arch_has_protected_memory(vm))
 		region->protected_phy_pages = sparsebit_alloc();
diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
index 03eb99af9b8d..b2baee680083 100644
--- a/tools/testing/selftests/kvm/lib/test_util.c
+++ b/tools/testing/selftests/kvm/lib/test_util.c
@@ -299,6 +299,14 @@ const struct vm_mem_backing_src_alias *vm_mem_backing_src_alias(uint32_t i)
 			 */
 			.flag = MAP_SHARED,
 		},
+		[VM_MEM_SRC_GUEST_MEMFD] = {
+			.name = "guest_memfd",
+			.flag = MAP_SHARED,
+		},
+		[VM_MEM_SRC_GUEST_MEMFD_NO_DIRECT_MAP] = {
+			.name = "guest_memfd_no_direct_map",
+			.flag = MAP_SHARED,
+		}
 	};
 	_Static_assert(ARRAY_SIZE(aliases) == NUM_SRC_TYPES,
 		       "Missing new backing src types?");
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
