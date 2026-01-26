Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC7BD2FEDF
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 19:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXkCwPLQNIZgADo/p9Z0OB0oS9d5hcrUpPEoZpoJQ5A=; b=fQ60eDn8L7gmqg
	0kken6KEkRdOTF5wkgITSKQdHs1kM/+OrmgCP/fORnEZZWbvxnOVTyXKT/qvxxJxUmdlFXrjlkVWv
	lDzK8EKtUKUcA29E/siaotV1wiuyDhjnTnrtY1hRnFQrS7ifsewaUao39P8LnBJrqkKyaw2hOCXJ1
	uoznWk0Yr5KXna/6gBtECKjW8TALDftxRMuXGgGhoV99b0zWU7YiR/uxtNnVQ3wzLK0HJu9kcZAqA
	ktWFv9agk7nL/ULnKdXMy8EtBqdEiXvYpVjVLM9N4nj4GFC52DyyepEMwED4sy6Tk8em7tIttGssx
	QqXHF15Gp/qFz/yuYejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoqp-0000000Evu6-40Y9;
	Tue, 27 Jan 2026 19:35:47 +0000
Received: from fra-out-015.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.158.153.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPnl-0000000Ctqc-1jdO;
	Mon, 26 Jan 2026 16:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1769446257; x=1800982257;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9a6RXrMzpCzxek9CSTM08UtDf5Ra4XlNp32KqLM5w2E=;
  b=dQpj0CBpzMafrrpXfh3rxd55sUM2jlZhq41jQjg8NpBRFFacMk8ai12V
   gGt1YnJ+qsfpVqseAuo+eLg5e0DCTQw8GynOSQuBwK6lx5zf+CtGczKsw
   S2EOqxN5DDrGDaIA7Thda+OFZ4wwMXKW/7RnjeFVI6bTzQvVbu+WmkfVx
   wEy9KDrPKyVb3JdaOUisbZuoFDXG3/AI6uiRbz7ga1+CzepCLpZ2RrPnz
   iR4tE3vXhKuq72XNHP9CqFDATzAGlJ4m36EV1V9jARdY1QqxXF712FzBF
   +0GdWr4f8theWE/m0qxuBpu6NNHaSaoshq0KUx9BIO6vg5kPRLYC8Xkj9
   A==;
X-CSE-ConnectionGUID: IvvwnfIaQ5KEEhbZrctTpQ==
X-CSE-MsgGUID: U6KUDHzFSE+7DDhbDNzXlQ==
X-IronPort-AV: E=Sophos;i="6.21,255,1763424000"; 
   d="scan'208";a="8333976"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-015.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 16:50:38 +0000
Received: from EX19MTAEUC002.ant.amazon.com [54.240.197.236:23530]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.12.85:2525] with esmtp (Farcaster)
 id b854d7ff-d99c-47ae-a4c7-1097de342aa5; Mon, 26 Jan 2026 16:50:37 +0000 (UTC)
X-Farcaster-Flow-ID: b854d7ff-d99c-47ae-a4c7-1097de342aa5
Received: from EX19D005EUB001.ant.amazon.com (10.252.51.12) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 26 Jan 2026 16:50:33 +0000
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19D005EUB001.ant.amazon.com (10.252.51.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 26 Jan 2026 16:50:32 +0000
Received: from EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c]) by
 EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c%3]) with mapi id
 15.02.2562.035; Mon, 26 Jan 2026 16:50:32 +0000
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
	"tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org"
	<willy@infradead.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>,
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "vbabka@suse.cz"
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
	<xmarcalx@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>
Subject: [PATCH v10 09/15] KVM: guest_memfd: Add flag to remove from direct
 map
Thread-Topic: [PATCH v10 09/15] KVM: guest_memfd: Add flag to remove from
 direct map
Thread-Index: AQHcjuPiYN714BESrke/GtjGZ2rB2A==
Date: Mon, 26 Jan 2026 16:50:32 +0000
Message-ID: <20260126164445.11867-10-kalyazin@amazon.com>
References: <20260126164445.11867-1-kalyazin@amazon.com>
In-Reply-To: <20260126164445.11867-1-kalyazin@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.103.116]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_085057_884909_0242D489 
X-CRM114-Status: GOOD (  16.95  )
X-Mailman-Approved-At: Tue, 27 Jan 2026 11:35:38 -0800
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

Add GUEST_MEMFD_FLAG_NO_DIRECT_MAP flag for KVM_CREATE_GUEST_MEMFD()
ioctl. When set, guest_memfd folios will be removed from the direct map
after preparation, with direct map entries only restored when the folios
are freed.

To ensure these folios do not end up in places where the kernel cannot
deal with them, set AS_NO_DIRECT_MAP on the guest_memfd's struct
address_space if GUEST_MEMFD_FLAG_NO_DIRECT_MAP is requested.

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

Direct map entries are zapped right before guest or userspace mappings
of gmem folios are set up, e.g. in kvm_gmem_fault_user_mapping() or
kvm_gmem_get_pfn() [called from the KVM MMU code]. The only place where
a gmem folio can be allocated without being mapped anywhere is
kvm_gmem_populate(), where handling potential failures of direct map
removal is not possible (by the time direct map removal is attempted,
the folio is already marked as prepared, meaning attempting to re-try
kvm_gmem_populate() would just result in -EEXIST without fixing up the
direct map state). These folios are then removed form the direct map
upon kvm_gmem_get_pfn(), e.g. when they are mapped into the guest later.

Signed-off-by: Patrick Roy <patrick.roy@linux.dev>
Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
---
 Documentation/virt/kvm/api.rst  | 21 +++++----
 arch/x86/include/asm/kvm_host.h |  5 +--
 arch/x86/kvm/x86.c              |  5 +++
 include/linux/kvm_host.h        | 12 +++++
 include/uapi/linux/kvm.h        |  1 +
 virt/kvm/guest_memfd.c          | 80 ++++++++++++++++++++++++++++++---
 6 files changed, 106 insertions(+), 18 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 01a3abef8abb..c5ee43904bca 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6440,15 +6440,18 @@ a single guest_memfd file, but the bound ranges must not overlap).
 The capability KVM_CAP_GUEST_MEMFD_FLAGS enumerates the `flags` that can be
 specified via KVM_CREATE_GUEST_MEMFD.  Currently defined flags:
 
-  ============================ ================================================
-  GUEST_MEMFD_FLAG_MMAP        Enable using mmap() on the guest_memfd file
-                               descriptor.
-  GUEST_MEMFD_FLAG_INIT_SHARED Make all memory in the file shared during
-                               KVM_CREATE_GUEST_MEMFD (memory files created
-                               without INIT_SHARED will be marked private).
-                               Shared memory can be faulted into host userspace
-                               page tables. Private memory cannot.
-  ============================ ================================================
+  ============================== ================================================
+  GUEST_MEMFD_FLAG_MMAP          Enable using mmap() on the guest_memfd file
+                                 descriptor.
+  GUEST_MEMFD_FLAG_INIT_SHARED   Make all memory in the file shared during
+                                 KVM_CREATE_GUEST_MEMFD (memory files created
+                                 without INIT_SHARED will be marked private).
+                                 Shared memory can be faulted into host userspace
+                                 page tables. Private memory cannot.
+  GUEST_MEMFD_FLAG_NO_DIRECT_MAP The guest_memfd instance will unmap the memory
+                                 backing it from the kernel's address space
+                                 before passing it off to userspace or the guest.
+  ============================== ================================================
 
 When the KVM MMU performs a PFN lookup to service a guest fault and the backing
 guest_memfd has the GUEST_MEMFD_FLAG_MMAP set, then the fault will always be
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 68bd29a52f24..6de1c3a6344f 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2483,10 +2483,7 @@ static inline bool kvm_arch_has_irq_bypass(void)
 }
 
 #ifdef CONFIG_KVM_GUEST_MEMFD
-static inline bool kvm_arch_gmem_supports_no_direct_map(void)
-{
-	return can_set_direct_map();
-}
+bool kvm_arch_gmem_supports_no_direct_map(struct kvm *kvm);
 #define kvm_arch_gmem_supports_no_direct_map kvm_arch_gmem_supports_no_direct_map
 #endif /* CONFIG_KVM_GUEST_MEMFD */
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ff8812f3a129..13b3576ffb9a 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -14007,6 +14007,11 @@ void kvm_arch_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end)
 	kvm_x86_call(gmem_invalidate)(start, end);
 }
 #endif
+
+bool kvm_arch_gmem_supports_no_direct_map(struct kvm *kvm)
+{
+	return can_set_direct_map() && kvm->arch.vm_type != KVM_X86_TDX_VM;
+}
 #endif
 
 int kvm_spec_ctrl_test_value(u64 value)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 27796a09d29b..febc6b9ea714 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -738,10 +738,22 @@ static inline u64 kvm_gmem_get_supported_flags(struct kvm *kvm)
 	if (!kvm || kvm_arch_supports_gmem_init_shared(kvm))
 		flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
 
+	if (!kvm || kvm_arch_gmem_supports_no_direct_map(kvm))
+		flags |= GUEST_MEMFD_FLAG_NO_DIRECT_MAP;
+
 	return flags;
 }
 #endif
 
+#ifdef CONFIG_KVM_GUEST_MEMFD
+#ifndef kvm_arch_gmem_supports_no_direct_map
+static inline bool kvm_arch_gmem_supports_no_direct_map(struct kvm *kvm)
+{
+	return false;
+}
+#endif
+#endif /* CONFIG_KVM_GUEST_MEMFD */
+
 #ifndef kvm_arch_has_readonly_mem
 static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
 {
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index dddb781b0507..60341e1ba1be 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1612,6 +1612,7 @@ struct kvm_memory_attributes {
 #define KVM_CREATE_GUEST_MEMFD	_IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
 #define GUEST_MEMFD_FLAG_MMAP		(1ULL << 0)
 #define GUEST_MEMFD_FLAG_INIT_SHARED	(1ULL << 1)
+#define GUEST_MEMFD_FLAG_NO_DIRECT_MAP	(1ULL << 2)
 
 struct kvm_create_guest_memfd {
 	__u64 size;
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 92e7f8c1f303..168338287db6 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -7,6 +7,9 @@
 #include <linux/mempolicy.h>
 #include <linux/pseudo_fs.h>
 #include <linux/pagemap.h>
+#include <linux/set_memory.h>
+
+#include <asm/tlbflush.h>
 
 #include "kvm_mm.h"
 
@@ -76,6 +79,43 @@ static int __kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slo
 	return 0;
 }
 
+#define KVM_GMEM_FOLIO_NO_DIRECT_MAP BIT(0)
+
+static bool kvm_gmem_folio_no_direct_map(struct folio *folio)
+{
+	return ((u64)folio->private) & KVM_GMEM_FOLIO_NO_DIRECT_MAP;
+}
+
+static int kvm_gmem_folio_zap_direct_map(struct folio *folio)
+{
+	u64 gmem_flags = GMEM_I(folio_inode(folio))->flags;
+	int r = 0;
+
+	if (kvm_gmem_folio_no_direct_map(folio) || !(gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP))
+		goto out;
+
+	folio->private = (void *)((u64)folio->private | KVM_GMEM_FOLIO_NO_DIRECT_MAP);
+	r = folio_zap_direct_map(folio);
+
+out:
+	return r;
+}
+
+static void kvm_gmem_folio_restore_direct_map(struct folio *folio)
+{
+	/*
+	 * Direct map restoration cannot fail, as the only error condition
+	 * for direct map manipulation is failure to allocate page tables
+	 * when splitting huge pages, but this split would have already
+	 * happened in folio_zap_direct_map() in kvm_gmem_folio_zap_direct_map().
+	 * Note that the splitting occurs always because guest_memfd
+	 * currently supports only base pages.
+	 * Thus folio_restore_direct_map() here only updates prot bits.
+	 */
+	WARN_ON_ONCE(folio_restore_direct_map(folio));
+	folio->private = (void *)((u64)folio->private & ~KVM_GMEM_FOLIO_NO_DIRECT_MAP);
+}
+
 static inline void kvm_gmem_mark_prepared(struct folio *folio)
 {
 	folio_mark_uptodate(folio);
@@ -393,11 +433,17 @@ static bool kvm_gmem_supports_mmap(struct inode *inode)
 	return GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_MMAP;
 }
 
+static bool kvm_gmem_no_direct_map(struct inode *inode)
+{
+	return GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP;
+}
+
 static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
 {
 	struct inode *inode = file_inode(vmf->vma->vm_file);
 	struct folio *folio;
 	vm_fault_t ret = VM_FAULT_LOCKED;
+	int err;
 
 	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
 		return VM_FAULT_SIGBUS;
@@ -423,6 +469,14 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
 		kvm_gmem_mark_prepared(folio);
 	}
 
+	if (kvm_gmem_no_direct_map(folio_inode(folio))) {
+		err = kvm_gmem_folio_zap_direct_map(folio);
+		if (err) {
+			ret = vmf_error(err);
+			goto out_folio;
+		}
+	}
+
 	vmf->page = folio_file_page(folio, vmf->pgoff);
 
 out_folio:
@@ -533,6 +587,9 @@ static void kvm_gmem_free_folio(struct folio *folio)
 	kvm_pfn_t pfn = page_to_pfn(page);
 	int order = folio_order(folio);
 
+	if (kvm_gmem_folio_no_direct_map(folio))
+		kvm_gmem_folio_restore_direct_map(folio);
+
 	kvm_arch_gmem_invalidate(pfn, pfn + (1ul << order));
 }
 
@@ -596,6 +653,9 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 	/* Unmovable mappings are supposed to be marked unevictable as well. */
 	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
 
+	if (flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP)
+		mapping_set_no_direct_map(inode->i_mapping);
+
 	GMEM_I(inode)->flags = flags;
 
 	file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR, &kvm_gmem_fops);
@@ -804,15 +864,25 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 	if (IS_ERR(folio))
 		return PTR_ERR(folio);
 
-	if (!is_prepared)
+	if (!is_prepared) {
 		r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
+		if (r)
+			goto out_unlock;
+	}
+
+	if (kvm_gmem_no_direct_map(folio_inode(folio))) {
+		r = kvm_gmem_folio_zap_direct_map(folio);
+		if (r)
+			goto out_unlock;
+	}
 
+	*page = folio_file_page(folio, index);
 	folio_unlock(folio);
+	return 0;
 
-	if (!r)
-		*page = folio_file_page(folio, index);
-	else
-		folio_put(folio);
+out_unlock:
+	folio_unlock(folio);
+	folio_put(folio);
 
 	return r;
 }
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
