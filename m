Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0830CAC597
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 09:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YyMtggo1+Oj9hyjjYCbtP1SdnjuzG6Td7RHu98ySjE8=; b=0X+qlyhW4N1AEW
	qyRQhSTtuO/A9nr2US3h/Z2NuEhhtsN6fDPFXli/WYaaE5I1+DIQQMb1MYS48bWiT1LaO0JVar+2K
	MbWwpGlHyggBYeMBJlQAyZtBrYxJf51JwnOO7nHO/JV73rLRBiM0tK0HsTbrLK8uoj4TL4x5QxKIK
	pREuj51/fDe5YGQGLEpkPCjGwgCLKLFpohgCVnTiitK4ZTymEaIAWw7jIeHePukZm/GITfSxmlu8u
	TTE9lpWvM0rvgC5EP6dCmpmdUHVMqbYRupSas/rNXmRCXYtc72migy76rUtr7diTTaAallREIpkTU
	pIrotJi1T87g6C70PuUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzuu-00000008C8f-3F4o;
	Fri, 12 Sep 2025 09:18:04 +0000
Received: from fra-out-015.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.158.153.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzur-00000008C26-1fON;
	Fri, 12 Sep 2025 09:18:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1757668681; x=1789204681;
  h=from:cc:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Sx3+9NqAutB+Cmf+Db3J2/+vf0r+9QnQTa0qeyMJaf4=;
  b=fnBV05W326OtEQHxCC/m9SPLW11FDtUsdfVB+kTsw1JYop+zcnqD+t0F
   2jaOkb12y3dWL15BJPUx8CmpbyYrW0oL20igofZV8pd5lz6MUWQ8aizwH
   cu6aioIXrGy0pZsA24UOve1NCvEHj9yPw03SrG+21udlTmQXRwylhGdD7
   wHw2GyH6TSIuHPRe0LiRCx1xS088allnLEcWS3aNOPnPnKMmyM0MI5xk3
   ORuUwRnITC+HTuu/bANtzy5XcIbFLRrhOoIDVif87Il/kTQ6f4ijbOJLb
   fSScWgrFLgQ4uN3JgEOvkPxw8eq2edSKynTdXEjsTdIraJB7qe/S4rd4j
   A==;
X-CSE-ConnectionGUID: bZRsWIxlR/yEbUbMLmfOOw==
X-CSE-MsgGUID: G63+TtQQT9+uaWQFpDkUig==
X-IronPort-AV: E=Sophos;i="6.18,259,1751241600"; 
   d="scan'208";a="1893875"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-015.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 09:17:50 +0000
Received: from EX19MTAEUB001.ant.amazon.com [54.240.197.226:21053]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.27.75:2525] with esmtp (Farcaster)
 id 11132b9c-31f8-43b2-a215-ef61df00b885; Fri, 12 Sep 2025 09:17:50 +0000 (UTC)
X-Farcaster-Flow-ID: 11132b9c-31f8-43b2-a215-ef61df00b885
Received: from EX19D015EUB001.ant.amazon.com (10.252.51.114) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:38 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB001.ant.amazon.com (10.252.51.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:38 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Fri, 12 Sep 2025 09:17:38 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
CC: "Thomson, Jack" <jackabt@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "Cali, Marco" <xmarcalx@amazon.co.uk>, "derekmn@amazon.co.uk" <derekmn@amazon.co.uk>, "Roy, Patrick" <roypat@amazon.co.uk>, "willy@infradead.org" <willy@infradead.org>, "corbet@lwn.net" <corbet@lwn.net>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr" <alex@ghiti.fr>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "trondmy@kernel.org" <trondmy@kernel.org>, "anna@kernel.org" <anna@kernel.org>, "hubcap@omnibond.com" <hubcap@omnibond.com>, "martin@omnibond.com" <martin@omnibond.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "brauner@kernel.org" <brauner@kernel.org>, "jack@suse.cz" <jack@suse.cz>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@redhat.com" <david@redhat.com>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "yuanchu@google.com" <yuanchu@google.com>, "weixugc@google.com" <weixugc@google.com>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, "shuah@kernel.org" <shuah@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "devel@lists.orangefs.org" <devel@lists.orangefs.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: [PATCH v6 05/11] KVM: guest_memfd: Add flag to remove from direct map
Thread-Topic: [PATCH v6 05/11] KVM: guest_memfd: Add flag to remove from
 direct map
Thread-Index: AQHcI8YVCIdARtvwGUipYxYs+3gydA==
Date: Fri, 12 Sep 2025 09:17:37 +0000
Message-ID: <20250912091708.17502-6-roypat@amazon.co.uk>
References: <20250912091708.17502-1-roypat@amazon.co.uk>
In-Reply-To: <20250912091708.17502-1-roypat@amazon.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_021801_945115_2133B877 
X-CRM114-Status: GOOD (  19.45  )
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

Add GUEST_MEMFD_FLAG_NO_DIRECT_MAP flag for KVM_CREATE_GUEST_MEMFD()
ioctl. When set, guest_memfd folios will be removed from the direct map
after preparation, with direct map entries only restored when the folios
are freed.

To ensure these folios do not end up in places where the kernel cannot
deal with them, set AS_NO_DIRECT_MAP on the guest_memfd's struct
address_space if GUEST_MEMFD_FLAG_NO_DIRECT_MAP is requested.

Add KVM_CAP_GUEST_MEMFD_NO_DIRECT_MAP to let userspace discover whether
guest_memfd supports GUEST_MEMFD_FLAG_NO_DIRECT_MAP. Support depends on
guest_memfd itself being supported, but also on whether linux supports
manipulatomg the direct map at page granularity at all (possible most of
the time, outliers being arm64 where its impossible if the direct map
has been setup using hugepages, as arm64 cannot break these apart due to
break-before-make semantics, and powerpc, which does not select
ARCH_HAS_SET_DIRECT_MAP, which also doesn't support guest_memfd anyway
though).

Note that this flag causes removal of direct map entries for all
guest_memfd folios independent of whether they are "shared" or "private"
(although current guest_memfd only supports either all folios in the
"shared" state, or all folios in the "private" state if
GUEST_MEMFD_FLAG_MMAP is not set). The usecase for removing direct map
entries of also the shared parts of guest_memfd are a special type of
non-CoCo VM where, host userspace is trusted to have access to all of
guest memory, but where Spectre-style transient execution attacks
through the host kernel's direct map should still be mitigated.  In this
setup, KVM retains access to guest memory via userspace mappings of
guest_memfd, which are reflected back into KVM's memslots via
userspace_addr. This is needed for things like MMIO emulation on x86_64
to work.

Do not perform TLB flushes after direct map manipulations. This is
because TLB flushes resulted in a up to 40x elongation of page faults in
guest_memfd (scaling with the number of CPU cores), or a 5x elongation
of memory population. TLB flushes are not needed for functional
correctness (the virt->phys mapping technically stays "correct",  the
kernel should simply not use it for a while). On the other hand, it means
that the desired protection from Spectre-style attacks is not perfect,
as an attacker could try to prevent a stale TLB entry from getting
evicted, keeping it alive until the page it refers to is used by the
guest for some sensitive data, and then targeting it using a
spectre-gadget.

Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
---
 Documentation/virt/kvm/api.rst    |  5 ++++
 arch/arm64/include/asm/kvm_host.h | 12 ++++++++
 include/linux/kvm_host.h          |  7 +++++
 include/uapi/linux/kvm.h          |  2 ++
 virt/kvm/guest_memfd.c            | 49 +++++++++++++++++++++++++++----
 virt/kvm/kvm_main.c               |  5 ++++
 6 files changed, 75 insertions(+), 5 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index c17a87a0a5ac..b52c14d58798 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6418,6 +6418,11 @@ When the capability KVM_CAP_GUEST_MEMFD_MMAP is supported, the 'flags' field
 supports GUEST_MEMFD_FLAG_MMAP.  Setting this flag on guest_memfd creation
 enables mmap() and faulting of guest_memfd memory to host userspace.
 
+When the capability KVM_CAP_GMEM_NO_DIRECT_MAP is supported, the 'flags' field
+supports GUEST_MEMFG_FLAG_NO_DIRECT_MAP. Setting this flag makes the guest_memfd
+instance behave similarly to memfd_secret, and unmaps the memory backing it from
+the kernel's address space after allocation.
+
 When the KVM MMU performs a PFN lookup to service a guest fault and the backing
 guest_memfd has the GUEST_MEMFD_FLAG_MMAP set, then the fault will always be
 consumed from guest_memfd, regardless of whether it is a shared or a private
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 2f2394cce24e..0bfd8e5fd9de 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -19,6 +19,7 @@
 #include <linux/maple_tree.h>
 #include <linux/percpu.h>
 #include <linux/psci.h>
+#include <linux/set_memory.h>
 #include <asm/arch_gicv3.h>
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
@@ -1706,5 +1707,16 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt);
 void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *res1);
 void check_feature_map(void);
 
+#ifdef CONFIG_KVM_GUEST_MEMFD
+static inline bool kvm_arch_gmem_supports_no_direct_map(void)
+{
+	/*
+	 * Without FWB, direct map access is needed in kvm_pgtable_stage2_map(),
+	 * as it calls dcache_clean_inval_poc().
+	 */
+	return can_set_direct_map() && cpus_have_final_cap(ARM64_HAS_STAGE2_FWB);
+}
+#define kvm_arch_gmem_supports_no_direct_map kvm_arch_gmem_supports_no_direct_map
+#endif /* CONFIG_KVM_GUEST_MEMFD */
 
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 1d0585616aa3..a9468bce55f2 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -36,6 +36,7 @@
 #include <linux/rbtree.h>
 #include <linux/xarray.h>
 #include <asm/signal.h>
+#include <linux/set_memory.h>
 
 #include <linux/kvm.h>
 #include <linux/kvm_para.h>
@@ -731,6 +732,12 @@ static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
 bool kvm_arch_supports_gmem_mmap(struct kvm *kvm);
 #endif
 
+#ifdef CONFIG_KVM_GUEST_MEMFD
+#ifndef kvm_arch_gmem_supports_no_direct_map
+#define kvm_arch_gmem_supports_no_direct_map can_set_direct_map
+#endif
+#endif /* CONFIG_KVM_GUEST_MEMFD */
+
 #ifndef kvm_arch_has_readonly_mem
 static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
 {
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 6efa98a57ec1..33c8e8946019 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -963,6 +963,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_RISCV_MP_STATE_RESET 242
 #define KVM_CAP_ARM_CACHEABLE_PFNMAP_SUPPORTED 243
 #define KVM_CAP_GUEST_MEMFD_MMAP 244
+#define KVM_CAP_GUEST_MEMFD_NO_DIRECT_MAP 245
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
@@ -1600,6 +1601,7 @@ struct kvm_memory_attributes {
 
 #define KVM_CREATE_GUEST_MEMFD	_IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
 #define GUEST_MEMFD_FLAG_MMAP	(1ULL << 0)
+#define GUEST_MEMFD_FLAG_NO_DIRECT_MAP (1ULL << 1)
 
 struct kvm_create_guest_memfd {
 	__u64 size;
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 81028984ff89..3c64099fc98a 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -4,6 +4,7 @@
 #include <linux/kvm_host.h>
 #include <linux/pagemap.h>
 #include <linux/anon_inodes.h>
+#include <linux/set_memory.h>
 
 #include "kvm_mm.h"
 
@@ -42,9 +43,24 @@ static int __kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slo
 	return 0;
 }
 
-static inline void kvm_gmem_mark_prepared(struct folio *folio)
+static bool kvm_gmem_test_no_direct_map(struct inode *inode)
 {
-	folio_mark_uptodate(folio);
+	return ((unsigned long) inode->i_private) & GUEST_MEMFD_FLAG_NO_DIRECT_MAP;
+}
+
+static inline int kvm_gmem_mark_prepared(struct folio *folio)
+{
+	struct inode *inode = folio_inode(folio);
+	int r = 0;
+
+	if (kvm_gmem_test_no_direct_map(inode))
+		r = set_direct_map_valid_noflush(folio_page(folio, 0), folio_nr_pages(folio),
+						 false);
+
+	if (!r)
+		folio_mark_uptodate(folio);
+
+	return r;
 }
 
 /*
@@ -82,7 +98,7 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
 	index = ALIGN_DOWN(index, 1 << folio_order(folio));
 	r = __kvm_gmem_prepare_folio(kvm, slot, index, folio);
 	if (!r)
-		kvm_gmem_mark_prepared(folio);
+		r = kvm_gmem_mark_prepared(folio);
 
 	return r;
 }
@@ -344,8 +360,15 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
 	}
 
 	if (!folio_test_uptodate(folio)) {
+		int err = 0;
+
 		clear_highpage(folio_page(folio, 0));
-		kvm_gmem_mark_prepared(folio);
+		err = kvm_gmem_mark_prepared(folio);
+
+		if (err) {
+			ret = vmf_error(err);
+			goto out_folio;
+		}
 	}
 
 	vmf->page = folio_file_page(folio, vmf->pgoff);
@@ -436,6 +459,16 @@ static void kvm_gmem_free_folio(struct address_space *mapping,
 	kvm_pfn_t pfn = page_to_pfn(page);
 	int order = folio_order(folio);
 
+	/*
+	 * Direct map restoration cannot fail, as the only error condition
+	 * for direct map manipulation is failure to allocate page tables
+	 * when splitting huge pages, but this split would have already
+	 * happened in set_direct_map_invalid_noflush() in kvm_gmem_mark_prepared().
+	 * Thus set_direct_map_valid_noflush() here only updates prot bits.
+	 */
+	if (kvm_gmem_test_no_direct_map(mapping->host))
+		set_direct_map_valid_noflush(page, folio_nr_pages(folio), true);
+
 	kvm_arch_gmem_invalidate(pfn, pfn + (1ul << order));
 }
 
@@ -500,6 +533,9 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 	/* Unmovable mappings are supposed to be marked unevictable as well. */
 	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
 
+	if (flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP)
+		mapping_set_no_direct_map(inode->i_mapping);
+
 	kvm_get_kvm(kvm);
 	gmem->kvm = kvm;
 	xa_init(&gmem->bindings);
@@ -524,6 +560,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
 	if (kvm_arch_supports_gmem_mmap(kvm))
 		valid_flags |= GUEST_MEMFD_FLAG_MMAP;
 
+	if (kvm_arch_gmem_supports_no_direct_map())
+		valid_flags |= GUEST_MEMFD_FLAG_NO_DIRECT_MAP;
+
 	if (flags & ~valid_flags)
 		return -EINVAL;
 
@@ -768,7 +807,7 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
 		p = src ? src + i * PAGE_SIZE : NULL;
 		ret = post_populate(kvm, gfn, pfn, p, max_order, opaque);
 		if (!ret)
-			kvm_gmem_mark_prepared(folio);
+			ret = kvm_gmem_mark_prepared(folio);
 
 put_folio_and_exit:
 		folio_put(folio);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 18f29ef93543..b5e702d95230 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -65,6 +65,7 @@
 #include <trace/events/kvm.h>
 
 #include <linux/kvm_dirty_ring.h>
+#include <linux/set_memory.h>
 
 
 /* Worst case buffer size needed for holding an integer. */
@@ -4916,6 +4917,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 		return kvm_supported_mem_attributes(kvm);
 #endif
 #ifdef CONFIG_KVM_GUEST_MEMFD
+	case KVM_CAP_GUEST_MEMFD_NO_DIRECT_MAP:
+		if (!kvm_arch_gmem_supports_no_direct_map())
+			return 0;
+		fallthrough;
 	case KVM_CAP_GUEST_MEMFD:
 		return 1;
 	case KVM_CAP_GUEST_MEMFD_MMAP:
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
