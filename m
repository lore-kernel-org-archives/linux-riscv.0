Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59532CAC593
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 09:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/6pj5sVZg23SDzSq4cLB/lygAZrnrjklBNDfA7anIM=; b=LTa7uxdg0OI5/X
	LuOL6WxJ2kyHqQRAfz8tSkl97WwKKcp8qyJFktGPaeJtKUBkh4+tFzGpvlewfG1U+d9LaunitRsb6
	eHVD06rAJJRX715v9nz4eu+56H1aajLyELs+mTzVXB6qkmXhhopKzo9xp+20iRW6Ex/Luba1xy6Zu
	gJ97NO+b1TNY11Igu1krloFzwTXinog3jV4dDz2IPsJ9+TKp9oE31S8NjEZokvq4i75LzSk6kjvnz
	BABqjybJYoJRj4ffkkmlVTry/9bZm36I+HNQesLFohZ7bWzO7duOin9ms2PZgqvroO1AQe/DaLx0x
	Xd8DcKofDOUyrkwkijoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzuq-00000008C3N-2eDj;
	Fri, 12 Sep 2025 09:18:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzup-00000008C17-2UuN;
	Fri, 12 Sep 2025 09:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:From:Sender:
	Reply-To:To:Content-ID:Content-Description;
	bh=L1uOJJu3rEt1RZKXmiQj9GuMwXC6NRFndNhKGAKSBZI=; b=HZ5HrOIYQ/Bqqwk7fb7GnqT0fj
	ixmPdXVEbOS3MmmB4zYXBOiKyZEpg8c+cuuSYvu06+AP8n5AWQM1mIrXwzVvWb9OymIB7cfDrWTCB
	3XK1aeqk6eg4Ih31olWMu2nSf2tF9gtxp2N/9jKUDlJUJnh/u11+iXuJnIJhizlarZqa8E6wv20lS
	DDZX79Rr+xomgMMkCePAETpo/r2ZW7/Dul8GsYuxLdwQks6gt9nGKoJ2OLm2xVZylVpE/NtY3oe3p
	314bsz6+/69K1WAc4FJ3omt7UpNdzI4WKk2/coU4i5AZ4YvGg55ztew0P1DVF0RNuWnoyNwOmEPCe
	JlMZJeRw==;
Received: from fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.72.182.33])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzuk-00000006HRQ-3si7;
	Fri, 12 Sep 2025 09:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1757668674; x=1789204674;
  h=from:cc:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=L1uOJJu3rEt1RZKXmiQj9GuMwXC6NRFndNhKGAKSBZI=;
  b=EQLIbxJTngwr0efxhBkLAqtd4wEj8Z221n+/vcgZcVJWXNudEqQiaeZC
   4QM+XG30mUvOIebMbsv+7Na30bOCTl6qZgHhp+XSE0Fd29NH/xU24Nilh
   0aXOWBJbLTdAOgT0tTmljppOjLGYh41lYDcN2oMAsK1Dl+rSh8qkHFF9J
   iNKggLyvuG71g8bvYDnLYmN1t+LAyKDyy8Nnev8SBjHy4up59MtZRGUwx
   heFbfwrqAoqNS1FjfAxMsmScxQTJtYGHH1UvDDWyMS/f1VBHnQsCpGTPE
   cIsP7z2OGLMEMT9OncGse7Q2i5+tyRRLAxBW7RT1dkiqhXU3aNNwq7zjS
   A==;
X-CSE-ConnectionGUID: RQKw5bjlSfejfpAhVlOeLg==
X-CSE-MsgGUID: 2RPJ5/9NQ9m/oFIybgUfMA==
X-IronPort-AV: E=Sophos;i="6.18,259,1751241600"; 
   d="scan'208";a="2006961"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 09:17:36 +0000
Received: from EX19MTAEUB001.ant.amazon.com [54.240.197.226:21336]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.2.154:2525] with esmtp (Farcaster)
 id c1f0eae9-f42c-47d6-84b3-1325a62adc4b; Fri, 12 Sep 2025 09:17:36 +0000 (UTC)
X-Farcaster-Flow-ID: c1f0eae9-f42c-47d6-84b3-1325a62adc4b
Received: from EX19D015EUB002.ant.amazon.com (10.252.51.123) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:35 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB002.ant.amazon.com (10.252.51.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:35 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Fri, 12 Sep 2025 09:17:34 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
CC: "Thomson, Jack" <jackabt@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "Cali, Marco" <xmarcalx@amazon.co.uk>, "derekmn@amazon.co.uk" <derekmn@amazon.co.uk>, "Roy, Patrick" <roypat@amazon.co.uk>, "willy@infradead.org" <willy@infradead.org>, "corbet@lwn.net" <corbet@lwn.net>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr" <alex@ghiti.fr>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "trondmy@kernel.org" <trondmy@kernel.org>, "anna@kernel.org" <anna@kernel.org>, "hubcap@omnibond.com" <hubcap@omnibond.com>, "martin@omnibond.com" <martin@omnibond.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "brauner@kernel.org" <brauner@kernel.org>, "jack@suse.cz" <jack@suse.cz>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@redhat.com" <david@redhat.com>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "yuanchu@google.com" <yuanchu@google.com>, "weixugc@google.com" <weixugc@google.com>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, "shuah@kernel.org" <shuah@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "devel@lists.orangefs.org" <devel@lists.orangefs.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: [PATCH v6 03/11] mm: introduce AS_NO_DIRECT_MAP
Thread-Topic: [PATCH v6 03/11] mm: introduce AS_NO_DIRECT_MAP
Thread-Index: AQHcI8YTZR0JftjwNkq9EBotomJZxg==
Date: Fri, 12 Sep 2025 09:17:34 +0000
Message-ID: <20250912091708.17502-4-roypat@amazon.co.uk>
References: <20250912091708.17502-1-roypat@amazon.co.uk>
In-Reply-To: <20250912091708.17502-1-roypat@amazon.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_101755_158311_DC6D95F5 
X-CRM114-Status: GOOD (  16.35  )
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

Add AS_NO_DIRECT_MAP for mappings where direct map entries of folios are
set to not present . Currently, mappings that match this description are
secretmem mappings (memfd_secret()). Later, some guest_memfd
configurations will also fall into this category.

Reject this new type of mappings in all locations that currently reject
secretmem mappings, on the assumption that if secretmem mappings are
rejected somewhere, it is precisely because of an inability to deal with
folios without direct map entries, and then make memfd_secret() use
AS_NO_DIRECT_MAP on its address_space to drop its special
vma_is_secretmem()/secretmem_mapping() checks.

This drops a optimization in gup_fast_folio_allowed() where
secretmem_mapping() was only called if CONFIG_SECRETMEM=y. secretmem is
enabled by default since commit b758fe6df50d ("mm/secretmem: make it on
by default"), so the secretmem check did not actually end up elided in
most cases anymore anyway.

Use a new flag instead of overloading AS_INACCESSIBLE (which is already
set by guest_memfd) because not all guest_memfd mappings will end up
being direct map removed (e.g. in pKVM setups, parts of guest_memfd that
can be mapped to userspace should also be GUP-able, and generally not
have restrictions on who can access it).

Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
---
 include/linux/pagemap.h   | 16 ++++++++++++++++
 include/linux/secretmem.h | 18 ------------------
 lib/buildid.c             |  4 ++--
 mm/gup.c                  | 19 +++++--------------
 mm/mlock.c                |  2 +-
 mm/secretmem.c            |  8 ++------
 6 files changed, 26 insertions(+), 41 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 12a12dae727d..1f5739f6a9f5 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -211,6 +211,7 @@ enum mapping_flags {
 				   folio contents */
 	AS_INACCESSIBLE = 8,	/* Do not attempt direct R/W access to the mapping */
 	AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM = 9,
+	AS_NO_DIRECT_MAP = 10,	/* Folios in the mapping are not in the direct map */
 	/* Bits 16-25 are used for FOLIO_ORDER */
 	AS_FOLIO_ORDER_BITS = 5,
 	AS_FOLIO_ORDER_MIN = 16,
@@ -346,6 +347,21 @@ static inline bool mapping_writeback_may_deadlock_on_reclaim(struct address_spac
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
 static inline gfp_t mapping_gfp_mask(struct address_space * mapping)
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
index c4b0f376fb34..89e567954284 100644
--- a/lib/buildid.c
+++ b/lib/buildid.c
@@ -65,8 +65,8 @@ static int freader_get_folio(struct freader *r, loff_t file_off)
 
 	freader_put_folio(r);
 
-	/* reject secretmem folios created with memfd_secret() */
-	if (secretmem_mapping(r->file->f_mapping))
+	/* reject folios without direct map entries (e.g. from memfd_secret() or guest_memfd()) */
+	if (mapping_no_direct_map(r->file->f_mapping))
 		return -EFAULT;
 
 	r->folio = filemap_get_folio(r->file->f_mapping, file_off >> PAGE_SHIFT);
diff --git a/mm/gup.c b/mm/gup.c
index adffe663594d..75a0cffdf37d 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -11,7 +11,6 @@
 #include <linux/rmap.h>
 #include <linux/swap.h>
 #include <linux/swapops.h>
-#include <linux/secretmem.h>
 
 #include <linux/sched/signal.h>
 #include <linux/rwsem.h>
@@ -1234,7 +1233,7 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
 	if ((gup_flags & FOLL_SPLIT_PMD) && is_vm_hugetlb_page(vma))
 		return -EOPNOTSUPP;
 
-	if (vma_is_secretmem(vma))
+	if (vma_has_no_direct_map(vma))
 		return -EFAULT;
 
 	if (write) {
@@ -2736,7 +2735,7 @@ EXPORT_SYMBOL(get_user_pages_unlocked);
  * This call assumes the caller has pinned the folio, that the lowest page table
  * level still points to this folio, and that interrupts have been disabled.
  *
- * GUP-fast must reject all secretmem folios.
+ * GUP-fast must reject all folios without direct map entries (such as secretmem).
  *
  * Writing to pinned file-backed dirty tracked folios is inherently problematic
  * (see comment describing the writable_file_mapping_allowed() function). We
@@ -2751,7 +2750,6 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
 {
 	bool reject_file_backed = false;
 	struct address_space *mapping;
-	bool check_secretmem = false;
 	unsigned long mapping_flags;
 
 	/*
@@ -2763,18 +2761,10 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
 		reject_file_backed = true;
 
 	/* We hold a folio reference, so we can safely access folio fields. */
-
-	/* secretmem folios are always order-0 folios. */
-	if (IS_ENABLED(CONFIG_SECRETMEM) && !folio_test_large(folio))
-		check_secretmem = true;
-
-	if (!reject_file_backed && !check_secretmem)
-		return true;
-
 	if (WARN_ON_ONCE(folio_test_slab(folio)))
 		return false;
 
-	/* hugetlb neither requires dirty-tracking nor can be secretmem. */
+	/* hugetlb neither requires dirty-tracking nor can be without direct map. */
 	if (folio_test_hugetlb(folio))
 		return true;
 
@@ -2812,8 +2802,9 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
 	 * At this point, we know the mapping is non-null and points to an
 	 * address_space object.
 	 */
-	if (check_secretmem && secretmem_mapping(mapping))
+	if (mapping_no_direct_map(mapping))
 		return false;
+
 	/* The only remaining allowed file system is shmem. */
 	return !reject_file_backed || shmem_mapping(mapping);
 }
diff --git a/mm/mlock.c b/mm/mlock.c
index a1d93ad33c6d..36f5e70faeb0 100644
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
index 422dcaa32506..b5ce55079695 100644
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
@@ -157,7 +152,7 @@ static void secretmem_free_folio(struct address_space *mapping,
 	folio_zero_segment(folio, 0, folio_size(folio));
 }
 
-const struct address_space_operations secretmem_aops = {
+static const struct address_space_operations secretmem_aops = {
 	.dirty_folio	= noop_dirty_folio,
 	.free_folio	= secretmem_free_folio,
 	.migrate_folio	= secretmem_migrate_folio,
@@ -206,6 +201,7 @@ static struct file *secretmem_file_create(unsigned long flags)
 
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
