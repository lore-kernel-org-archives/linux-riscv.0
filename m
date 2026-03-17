Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2BE10775EB
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 16:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WIQsWObZ8c3fNQGgVji4bcR2Nks1Ywi0DNhxfevXYUQ=; b=YA8bFYBeSyoKgS
	DvHXiU4Wyfd+ZcqDzGsfIYJScrJxhCn7WOunwyCIx2Qifp0ZxcuC+4CmBNwiYDP0wtwahQ8UpWn0I
	9Up0plylc6gV09upzPcHxiPlgQ5Oa6D46ZjGZTvyAX4ZC2T2JRfvrLkLc18g0qnj15KtviucGLjGe
	dxmROxPH24j5QwI1NneUuJ48rJeKio4H+2yWchELvtsRNOi4OMRnzKT3dI6imU01YjsFpvYEL6Eo8
	ifCGygsJyut6Yx1hledaXiEJ6IWm9GaTGnJkATvDTFpaUsGXqx6tfHtEJDCtcDDEVPPie0zP2VzGL
	ylEj5/C16q3jgCp3+Pdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tkk-00000008vMf-2P5L;
	Wed, 18 Mar 2026 16:28:16 +0000
Received: from fra-out-010.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([63.178.143.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V8M-00000006WcB-2omR;
	Tue, 17 Mar 2026 14:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1773756658; x=1805292658;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VYvr0CwhFQIS2ZaS+F5r9gx/5JKbQ+VxsBq0F/u29+4=;
  b=RALj/rNbqmmp+Uq2TomIEbBRObp+oAjqmtRme0swdySwBRXtCFB8QKpR
   gTok2cFTgqVF+djrfpiqP49J9VPocVlaitvuZuLCFmc7OylCy5CQN92hT
   zuD0bjGNPV5yCRb4B4Fk88aJ3oc2fyx3nZxx/WjjxTwQyx6TAB0TDeM9w
   Imuf5NrUwblbGcPcUYYv5w22MlyNDJH/eYURKTRiIw6i00blCEIuDN3qL
   QuU/qXFDfJNibWzYwjXwXKg7RyRoxkm/DHPzMEzCqutG8ocB8f4KxzpcN
   wwvo0861LC+o98s+wWdcahHuiJSp163QRFS17cF+lSc3qeUUNna6GgbuM
   A==;
X-CSE-ConnectionGUID: qXHvxhvLTNeyghAyahceNg==
X-CSE-MsgGUID: puQ8nFyqTDmGaW3b5uM8dg==
X-IronPort-AV: E=Sophos;i="6.23,124,1770595200"; 
   d="scan'208";a="10894914"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-010.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 14:10:57 +0000
Received: from EX19MTAEUC001.ant.amazon.com [54.240.197.225:28985]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.12.108:2525] with esmtp (Farcaster)
 id d8fc662a-bddf-4bdd-a07a-65c8795e29a8; Tue, 17 Mar 2026 14:10:56 +0000 (UTC)
X-Farcaster-Flow-ID: d8fc662a-bddf-4bdd-a07a-65c8795e29a8
Received: from EX19D005EUB002.ant.amazon.com (10.252.51.103) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 17 Mar 2026 14:10:56 +0000
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19D005EUB002.ant.amazon.com (10.252.51.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 17 Mar 2026 14:10:55 +0000
Received: from EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c]) by
 EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c%3]) with mapi id
 15.02.2562.037; Tue, 17 Mar 2026 14:10:55 +0000
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
	<loongarch@lists.linux.dev>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "vbabka@kernel.org" <vbabka@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "riel@surriel.com" <riel@surriel.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, "yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, "coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "ackerleytng@google.com" <ackerleytng@google.com>, "yosry@kernel.org" <yosry@kernel.org>, "ajones@ventanamicro.com" <ajones@ventanamicro.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "tabba@google.com" <tabba@google.com>, "prsampat@amd.com" <prsampat@amd.com>, "wu.fei9@sanechips.com.cn" <wu.fei9@sanechips.com.cn>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, "jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>, "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "urezki@gmail.com" <urezki@gmail.com>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "jiayuan.chen@shopee.com" <jiayuan.chen@shopee.com>, "lenb@kernel.org" <lenb@kernel.org>, "osalvador@suse.de" <osalvador@suse.de>, "pavel@kernel.org" <pavel@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>, "vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, "Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>,
 "Manwaring, Derek" <derekmn@amazon.com>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>
Subject: [PATCH v11 02/16] set_memory: add folio_{zap,restore}_direct_map
 helpers
Thread-Topic: [PATCH v11 02/16] set_memory: add folio_{zap,restore}_direct_map
 helpers
Thread-Index: AQHcthfeEMFcBldU0EKH3aXM8Uk9Xg==
Date: Tue, 17 Mar 2026 14:10:55 +0000
Message-ID: <20260317141031.514-3-kalyazin@amazon.com>
References: <20260317141031.514-1-kalyazin@amazon.com>
In-Reply-To: <20260317141031.514-1-kalyazin@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.103.116]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_071059_000043_4F1AEEF4 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 18 Mar 2026 09:28:11 -0700
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

From: Nikita Kalyazin <kalyazin@amazon.com>

Let's provide folio_{zap,restore}_direct_map helpers as preparation for
supporting removal of the direct map for guest_memfd folios.
In folio_zap_direct_map(), flush TLB to make sure the data is not
accessible.

The new helpers need to be accessible to KVM on architectures that
support guest_memfd (x86 and arm64).

Direct map removal gives guest_memfd the same protection that
memfd_secret does, such as hardening against Spectre-like attacks
through in-kernel gadgets.

Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
---
 include/linux/set_memory.h | 13 ++++++++++++
 mm/memory.c                | 42 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 1a2563f525fc..24caea2931f9 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -41,6 +41,15 @@ static inline int set_direct_map_valid_noflush(const void *addr,
 	return 0;
 }
 
+static inline int folio_zap_direct_map(struct folio *folio)
+{
+	return 0;
+}
+
+static inline void folio_restore_direct_map(struct folio *folio)
+{
+}
+
 static inline bool kernel_page_present(struct page *page)
 {
 	return true;
@@ -57,6 +66,10 @@ static inline bool can_set_direct_map(void)
 }
 #define can_set_direct_map can_set_direct_map
 #endif
+
+int folio_zap_direct_map(struct folio *folio);
+void folio_restore_direct_map(struct folio *folio);
+
 #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 
 #ifdef CONFIG_X86_64
diff --git a/mm/memory.c b/mm/memory.c
index 07778814b4a8..cab6bb237fc0 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -78,6 +78,7 @@
 #include <linux/sched/sysctl.h>
 #include <linux/pgalloc.h>
 #include <linux/uaccess.h>
+#include <linux/set_memory.h>
 
 #include <trace/events/kmem.h>
 
@@ -7478,3 +7479,44 @@ void vma_pgtable_walk_end(struct vm_area_struct *vma)
 	if (is_vm_hugetlb_page(vma))
 		hugetlb_vma_unlock_read(vma);
 }
+
+#ifdef CONFIG_ARCH_HAS_SET_DIRECT_MAP
+/**
+ * folio_zap_direct_map - remove a folio from the kernel direct map
+ * @folio: folio to remove from the direct map
+ *
+ * Removes the folio from the kernel direct map and flushes the TLB.  This may
+ * require splitting huge pages in the direct map, which can fail due to memory
+ * allocation.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int folio_zap_direct_map(struct folio *folio)
+{
+	const void *addr = folio_address(folio);
+	int ret;
+
+	ret = set_direct_map_valid_noflush(addr, folio_nr_pages(folio), false);
+	flush_tlb_kernel_range((unsigned long)addr,
+			       (unsigned long)addr + folio_size(folio));
+
+	return ret;
+}
+EXPORT_SYMBOL_FOR_MODULES(folio_zap_direct_map, "kvm");
+
+/**
+ * folio_restore_direct_map - restore the kernel direct map entry for a folio
+ * @folio: folio whose direct map entry is to be restored
+ *
+ * This may only be called after a prior successful folio_zap_direct_map() on
+ * the same folio.  Because the zap will have already split any huge pages in
+ * the direct map, restoration here only updates protection bits and cannot
+ * fail.
+ */
+void folio_restore_direct_map(struct folio *folio)
+{
+	WARN_ON_ONCE(set_direct_map_valid_noflush(folio_address(folio),
+						  folio_nr_pages(folio), true));
+}
+EXPORT_SYMBOL_FOR_MODULES(folio_restore_direct_map, "kvm");
+#endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
