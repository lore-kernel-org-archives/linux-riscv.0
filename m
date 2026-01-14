Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA4BD37E3A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 13:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fnr2TBBmzn2b2VZqwhPYWTvKDQXHccpHv7oQYKDQVQk=; b=EG8DLJ96+gQMXi
	oFXUjKgYbCjDnAYiZYw1VFcb132DifO01aosFgDM3SNt3y+F7oSVe8oe+wLQlED0bMBHipZ/tRNrP
	ZkyJRiOYr94BVs21rPqNJaIydoDQ6u/VsoBPpJ42flnr2jwbqeYzS7y4kfKawoYGWi1ORv+sPAOau
	ab2K/3johx74EKgXE0PIM/Ch1UkHjVATrO5kKfXMJn+OdqHSJEbyOa+AGT0w0tiYqplURiMRM0cFc
	RMwEOKii6if+0jye2s7qXef6pd+BIvJ77Sq7EGUhB5uFMsTn8eihS7ze2f003JQx2J/m0Iurg8Inr
	VpOhaulLpguzE46My6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1DM-00000009Nqc-1GHz;
	Wed, 14 Jan 2026 13:47:12 +0000
Received: from fra-out-015.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.158.153.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1DI-00000009Ni8-1yMM;
	Wed, 14 Jan 2026 13:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1768398428; x=1799934428;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OprfmizXxq8RRTSlSSc6Z/sKanOls1Ur59Qhbz1MdVc=;
  b=lhJweOIDmOXzNs2MzDstqOjCKN6aKPCBdN1mrYpD86sF1oACSUoHRgnp
   L2GyEvlF4GhxflzAcxdjjMZGheq1wmXjGqJm9GZoLn5cfyJ6kXTFcnAjs
   z5acpr48LVZhvVMwJnTdkbRdnMMQwpXMD6O4TbQ5SUpZMWBrZT48+Barg
   N2zMVJPqTC+W7wL7B2UfPJ792fMxUKMaJfEIufPvuSZaMjvYB+vMnNbEY
   WwLTpU/AACUuv+rNnBDg3macSiDw70UlnOaPFmFBQdRI3dNaVCEc71MmZ
   kgVdIJkadNbr4CQc7qLHMIS+31RhWz+ootzhWSh5TPBsEkZ+RUUKr59u7
   A==;
X-CSE-ConnectionGUID: mBSY1gVCRU2EIPWGUREsBA==
X-CSE-MsgGUID: ezbdUHLlT/SFZWWnXT8zPQ==
X-IronPort-AV: E=Sophos;i="6.21,225,1763424000"; 
   d="scan'208";a="7780500"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-015.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 13:47:07 +0000
Received: from EX19MTAEUA001.ant.amazon.com [54.240.197.233:30147]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.21.80:2525] with esmtp (Farcaster)
 id 52b62229-b5f3-4016-84a8-55468a1e091e; Wed, 14 Jan 2026 13:47:07 +0000 (UTC)
X-Farcaster-Flow-ID: 52b62229-b5f3-4016-84a8-55468a1e091e
Received: from EX19D005EUB001.ant.amazon.com (10.252.51.12) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 14 Jan 2026 13:47:06 +0000
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19D005EUB001.ant.amazon.com (10.252.51.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 14 Jan 2026 13:47:06 +0000
Received: from EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c]) by
 EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c%3]) with mapi id
 15.02.2562.035; Wed, 14 Jan 2026 13:47:06 +0000
From: "Kalyazin, Nikita" <kalyazin@amazon.co.uk>
To: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
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
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org"
	<luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>,
	"willy@infradead.org" <willy@infradead.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>,
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz"
	<vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com"
	<surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org"
	<ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>,
	"andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev"
	<martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>,
	"song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev"
	<yonghong.song@linux.dev>, "john.fastabend@gmail.com"
	<john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>,
	"sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>,
	"jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>,
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com"
	<peterx@redhat.com>, "jannh@google.com" <jannh@google.com>,
	"pfalcato@suse.de" <pfalcato@suse.de>, "shuah@kernel.org" <shuah@kernel.org>,
	"riel@surriel.com" <riel@surriel.com>, "ryan.roberts@arm.com"
	<ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>,
	"yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org"
	<kas@kernel.org>, "coxu@redhat.com" <coxu@redhat.com>,
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
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>,
	"svens@linux.ibm.com" <svens@linux.ibm.com>, "thuth@redhat.com"
	<thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>,
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>,
	"vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com"
	<jackmanb@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"patrick.roy@linux.dev" <patrick.roy@linux.dev>, "Thomson, Jack"
	<jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>,
	"Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco"
	<xmarcalx@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>
Subject: [PATCH v9 10/13] KVM: selftests: Add guest_memfd based
 vm_mem_backing_src_types
Thread-Topic: [PATCH v9 10/13] KVM: selftests: Add guest_memfd based
 vm_mem_backing_src_types
Thread-Index: AQHchVxFpNIJibYegkG2Csm85sUgFQ==
Date: Wed, 14 Jan 2026 13:47:06 +0000
Message-ID: <20260114134510.1835-11-kalyazin@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com>
In-Reply-To: <20260114134510.1835-1-kalyazin@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.103.116]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_054709_103611_03BA713E 
X-CRM114-Status: GOOD (  15.21  )
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

From: Patrick Roy <patrick.roy@linux.dev>

Allow selftests to configure their memslots such that userspace_addr is
set to a MAP_SHARED mapping of the guest_memfd that's associated with
the memslot. This setup is the configuration for non-CoCo VMs, where all
guest memory is backed by a guest_memfd whose folios are all marked
shared, but KVM is still able to access guest memory to provide
functionality such as MMIO emulation on x86.

Add backing types for normal guest_memfd, as well as direct map removed
guest_memfd.

Signed-off-by: Patrick Roy <patrick.roy@linux.dev>
Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 18 ++++++
 .../testing/selftests/kvm/include/test_util.h |  7 +++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 61 ++++++++++---------
 tools/testing/selftests/kvm/lib/test_util.c   |  8 +++
 4 files changed, 65 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 81f4355ff28a..6689b43810c1 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -641,6 +641,24 @@ static inline bool is_smt_on(void)
 
 void vm_create_irqchip(struct kvm_vm *vm);
 
+static inline uint32_t backing_src_guest_memfd_flags(enum vm_mem_backing_src_type t)
+{
+	uint32_t flags = 0;
+
+	switch (t) {
+	case VM_MEM_SRC_GUEST_MEMFD_NO_DIRECT_MAP:
+		flags |= GUEST_MEMFD_FLAG_NO_DIRECT_MAP;
+		fallthrough;
+	case VM_MEM_SRC_GUEST_MEMFD:
+		flags |= GUEST_MEMFD_FLAG_MMAP | GUEST_MEMFD_FLAG_INIT_SHARED;
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
index 8140e59b59e5..ea6de20ce8ef 100644
--- a/tools/testing/selftests/kvm/include/test_util.h
+++ b/tools/testing/selftests/kvm/include/test_util.h
@@ -152,6 +152,8 @@ enum vm_mem_backing_src_type {
 	VM_MEM_SRC_ANONYMOUS_HUGETLB_16GB,
 	VM_MEM_SRC_SHMEM,
 	VM_MEM_SRC_SHARED_HUGETLB,
+	VM_MEM_SRC_GUEST_MEMFD,
+	VM_MEM_SRC_GUEST_MEMFD_NO_DIRECT_MAP,
 	NUM_SRC_TYPES,
 };
 
@@ -184,6 +186,11 @@ static inline bool backing_src_is_shared(enum vm_mem_backing_src_type t)
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
index 56ddbca91850..28ee51253909 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1013,6 +1013,33 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
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
+		guest_memfd = kvm_dup(guest_memfd);
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
@@ -1028,10 +1055,13 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
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
 
 	region->mmap_start = kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE,
 				      vm_mem_backing_src_alias(src_type)->flag,
@@ -1056,33 +1086,6 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
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
-		guest_memfd = kvm_dup(guest_memfd);
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
index 8a1848586a85..ce9fe0271515 100644
--- a/tools/testing/selftests/kvm/lib/test_util.c
+++ b/tools/testing/selftests/kvm/lib/test_util.c
@@ -306,6 +306,14 @@ const struct vm_mem_backing_src_alias *vm_mem_backing_src_alias(uint32_t i)
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
