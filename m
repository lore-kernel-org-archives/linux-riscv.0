Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B70D37E3A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 13:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kMo/D2RjwCCntAno5FBwhMgw18VfsUaFr1tIQhqARdg=; b=eHQzq0UX3O1PV2
	CowaQRBWUnoFEPJx2aDDjLLn5ZBKWjDE6zXbaGBYInTfZzMOkfF+kpEoWx1tYuCECvea3DYOlrpCu
	8MWWxIBee0bzh/KIUg7f77j/YoCoWpf+JIPU/83wN4IK6ybzzEaLJiH6lLqC8p7PiF5C6Mfrkio0R
	GXTCZTIJCUyg4i5pD6bJLp0e+Kqn139GcaX/qGR639t7vonpM6Kie5k9SPeteTeREySHiX/T/QTHt
	stl8YX52KKP9YOIU5DVkLGvsTh2bO6oIarvZOZ7CsFDOhtXmTXUC4dHBzQX7JQFpakUzuDuhCGcuZ
	AAPc+2kawkAvYLZlpUKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1CU-00000009NKZ-2NUq;
	Wed, 14 Jan 2026 13:46:18 +0000
Received: from fra-out-014.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.199.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1CQ-00000009NGe-3awZ;
	Wed, 14 Jan 2026 13:46:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1768398374; x=1799934374;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P5xPeIwvxwceYnISan7bruFGytAE0WaFAg0fT7oZnis=;
  b=EsjUlizt7LGr1jqH01ab3QfQ6zWeG1Wp/eE8ZlPKjIJASHxmoZyIVpXX
   o1tQKi7VLauNb9u16g5unGAlsrZ9LkzoFOT500wNOJ/MzqNFk7JY6gtrS
   ++TCi1AszPrfxeK1Fy2SD1BcTsXjRxAPBD9Q3eHxFL8H9F1nY5reeBJVh
   pvo9FPATn+kwvU0f062dec3CvJOF49SRNM7nJ4VbT3DDYIw8eJvkr9wVO
   +pP8/DgLAPCbBnlopVo8yDT8mM1N1v61le6UI+NxcG6jf75VHQQKMS5HU
   jPljiCCuqgby+zWvnzj5v4syUMKAGItjhmyFfKXIEpeewm5/hYwF+RhuQ
   A==;
X-CSE-ConnectionGUID: qOxv2R7+TsqUHbTFNtCJkg==
X-CSE-MsgGUID: OKMRs3zISxyT8DtwEeYY8A==
X-IronPort-AV: E=Sophos;i="6.21,225,1763424000"; 
   d="scan'208";a="7804549"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-014.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 13:45:50 +0000
Received: from EX19MTAEUC001.ant.amazon.com [54.240.197.233:3437]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.45.189:2525] with esmtp (Farcaster)
 id 3a6e19d3-d194-4c9a-9a13-610c87456b84; Wed, 14 Jan 2026 13:45:49 +0000 (UTC)
X-Farcaster-Flow-ID: 3a6e19d3-d194-4c9a-9a13-610c87456b84
Received: from EX19D005EUB004.ant.amazon.com (10.252.51.126) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 14 Jan 2026 13:45:47 +0000
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19D005EUB004.ant.amazon.com (10.252.51.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 14 Jan 2026 13:45:46 +0000
Received: from EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c]) by
 EX19D005EUB003.ant.amazon.com ([fe80::b825:becb:4b38:da0c%3]) with mapi id
 15.02.2562.035; Wed, 14 Jan 2026 13:45:46 +0000
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
Subject: [PATCH v9 03/13] mm: introduce AS_NO_DIRECT_MAP
Thread-Topic: [PATCH v9 03/13] mm: introduce AS_NO_DIRECT_MAP
Thread-Index: AQHchVwWngo8rPrNFUOAFLSLpXv6DA==
Date: Wed, 14 Jan 2026 13:45:46 +0000
Message-ID: <20260114134510.1835-4-kalyazin@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com>
In-Reply-To: <20260114134510.1835-1-kalyazin@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.103.116]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_054615_336738_10ED2E04 
X-CRM114-Status: GOOD (  15.88  )
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

Add AS_NO_DIRECT_MAP for mappings where direct map entries of folios are
set to not present. Currently, mappings that match this description are
secretmem mappings (memfd_secret()). Later, some guest_memfd
configurations will also fall into this category.

Reject this new type of mappings in all locations that currently reject
secretmem mappings, on the assumption that if secretmem mappings are
rejected somewhere, it is precisely because of an inability to deal with
folios without direct map entries, and then make memfd_secret() use
AS_NO_DIRECT_MAP on its address_space to drop its special
vma_is_secretmem()/secretmem_mapping() checks.

Use a new flag instead of overloading AS_INACCESSIBLE (which is already
set by guest_memfd) because not all guest_memfd mappings will end up
being direct map removed (e.g. in pKVM setups, parts of guest_memfd that
can be mapped to userspace should also be GUP-able, and generally not
have restrictions on who can access it).

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Signed-off-by: Patrick Roy <patrick.roy@linux.dev>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
---
 include/linux/pagemap.h   | 16 ++++++++++++++++
 include/linux/secretmem.h | 18 ------------------
 lib/buildid.c             |  4 ++--
 mm/gup.c                  | 10 +++++-----
 mm/mlock.c                |  2 +-
 mm/secretmem.c            |  8 ++------
 6 files changed, 26 insertions(+), 32 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 31a848485ad9..6ce7301d474a 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -210,6 +210,7 @@ enum mapping_flags {
 	AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM = 9,
 	AS_KERNEL_FILE = 10,	/* mapping for a fake kernel file that shouldn't
 				   account usage to user cgroups */
+	AS_NO_DIRECT_MAP = 11,	/* Folios in the mapping are not in the direct map */
 	/* Bits 16-25 are used for FOLIO_ORDER */
 	AS_FOLIO_ORDER_BITS = 5,
 	AS_FOLIO_ORDER_MIN = 16,
@@ -345,6 +346,21 @@ static inline bool mapping_writeback_may_deadlock_on_reclaim(const struct addres
 	return test_bit(AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM, &mapping->flags);
 }
 
+static inline void mapping_set_no_direct_map(struct address_space *mapping)
+{
+	set_bit(AS_NO_DIRECT_MAP, &mapping->flags);
+}
+
+static inline bool mapping_no_direct_map(const struct address_space *mapping)
+{
+	return test_bit(AS_NO_DIRECT_MAP, &mapping->flags);
+}
+
+static inline bool vma_has_no_direct_map(const struct vm_area_struct *vma)
+{
+	return vma->vm_file && mapping_no_direct_map(vma->vm_file->f_mapping);
+}
+
 static inline gfp_t mapping_gfp_mask(const struct address_space *mapping)
 {
 	return mapping->gfp_mask;
diff --git a/include/linux/secretmem.h b/include/linux/secretmem.h
index e918f96881f5..0ae1fb057b3d 100644
--- a/include/linux/secretmem.h
+++ b/include/linux/secretmem.h
@@ -4,28 +4,10 @@
 
 #ifdef CONFIG_SECRETMEM
 
-extern const struct address_space_operations secretmem_aops;
-
-static inline bool secretmem_mapping(struct address_space *mapping)
-{
-	return mapping->a_ops == &secretmem_aops;
-}
-
-bool vma_is_secretmem(struct vm_area_struct *vma);
 bool secretmem_active(void);
 
 #else
 
-static inline bool vma_is_secretmem(struct vm_area_struct *vma)
-{
-	return false;
-}
-
-static inline bool secretmem_mapping(struct address_space *mapping)
-{
-	return false;
-}
-
 static inline bool secretmem_active(void)
 {
 	return false;
diff --git a/lib/buildid.c b/lib/buildid.c
index aaf61dfc0919..b78fe5797e9c 100644
--- a/lib/buildid.c
+++ b/lib/buildid.c
@@ -46,8 +46,8 @@ static int freader_get_folio(struct freader *r, loff_t file_off)
 
 	freader_put_folio(r);
 
-	/* reject secretmem folios created with memfd_secret() */
-	if (secretmem_mapping(r->file->f_mapping))
+	/* reject folios without direct map entries (e.g. from memfd_secret() or guest_memfd()) */
+	if (mapping_no_direct_map(r->file->f_mapping))
 		return -EFAULT;
 
 	r->folio = filemap_get_folio(r->file->f_mapping, file_off >> PAGE_SHIFT);
diff --git a/mm/gup.c b/mm/gup.c
index 9cad53acbc99..11461a54b3ae 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -11,7 +11,6 @@
 #include <linux/rmap.h>
 #include <linux/swap.h>
 #include <linux/swapops.h>
-#include <linux/secretmem.h>
 
 #include <linux/sched/signal.h>
 #include <linux/rwsem.h>
@@ -1216,7 +1215,7 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
 	if ((gup_flags & FOLL_SPLIT_PMD) && is_vm_hugetlb_page(vma))
 		return -EOPNOTSUPP;
 
-	if (vma_is_secretmem(vma))
+	if (vma_has_no_direct_map(vma))
 		return -EFAULT;
 
 	if (write) {
@@ -2724,7 +2723,7 @@ EXPORT_SYMBOL(get_user_pages_unlocked);
  * This call assumes the caller has pinned the folio, that the lowest page table
  * level still points to this folio, and that interrupts have been disabled.
  *
- * GUP-fast must reject all secretmem folios.
+ * GUP-fast must reject all folios without direct map entries (such as secretmem).
  *
  * Writing to pinned file-backed dirty tracked folios is inherently problematic
  * (see comment describing the writable_file_mapping_allowed() function). We
@@ -2753,7 +2752,7 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
 	if (WARN_ON_ONCE(folio_test_slab(folio)))
 		return false;
 
-	/* hugetlb neither requires dirty-tracking nor can be secretmem. */
+	/* hugetlb neither requires dirty-tracking nor can be without direct map. */
 	if (folio_test_hugetlb(folio))
 		return true;
 
@@ -2791,8 +2790,9 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
 	 * At this point, we know the mapping is non-null and points to an
 	 * address_space object.
 	 */
-	if (secretmem_mapping(mapping))
+	if (mapping_no_direct_map(mapping))
 		return false;
+
 	/* The only remaining allowed file system is shmem. */
 	return !reject_file_backed || shmem_mapping(mapping);
 }
diff --git a/mm/mlock.c b/mm/mlock.c
index 2f699c3497a5..a6f4b3df4f3f 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -474,7 +474,7 @@ static int mlock_fixup(struct vma_iterator *vmi, struct vm_area_struct *vma,
 
 	if (newflags == oldflags || (oldflags & VM_SPECIAL) ||
 	    is_vm_hugetlb_page(vma) || vma == get_gate_vma(current->mm) ||
-	    vma_is_dax(vma) || vma_is_secretmem(vma) || (oldflags & VM_DROPPABLE))
+	    vma_is_dax(vma) || vma_has_no_direct_map(vma) || (oldflags & VM_DROPPABLE))
 		/* don't set VM_LOCKED or VM_LOCKONFAULT and don't count */
 		goto out;
 
diff --git a/mm/secretmem.c b/mm/secretmem.c
index edf111e0a1bb..560cdbe1fe5d 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -134,11 +134,6 @@ static int secretmem_mmap_prepare(struct vm_area_desc *desc)
 	return 0;
 }
 
-bool vma_is_secretmem(struct vm_area_struct *vma)
-{
-	return vma->vm_ops == &secretmem_vm_ops;
-}
-
 static const struct file_operations secretmem_fops = {
 	.release	= secretmem_release,
 	.mmap_prepare	= secretmem_mmap_prepare,
@@ -156,7 +151,7 @@ static void secretmem_free_folio(struct folio *folio)
 	folio_zero_segment(folio, 0, folio_size(folio));
 }
 
-const struct address_space_operations secretmem_aops = {
+static const struct address_space_operations secretmem_aops = {
 	.dirty_folio	= noop_dirty_folio,
 	.free_folio	= secretmem_free_folio,
 	.migrate_folio	= secretmem_migrate_folio,
@@ -205,6 +200,7 @@ static struct file *secretmem_file_create(unsigned long flags)
 
 	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
 	mapping_set_unevictable(inode->i_mapping);
+	mapping_set_no_direct_map(inode->i_mapping);
 
 	inode->i_op = &secretmem_iops;
 	inode->i_mapping->a_ops = &secretmem_aops;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
