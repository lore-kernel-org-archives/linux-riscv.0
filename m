Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F79AC624DD
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8TT0O+jDDvJO9f2e/qyQEGYvXFIspATdzvlJu+DHZHU=; b=rSo9iiWNZjkwPn
	RPIgv+Mle/586YP1RoSnxsJUW90RmsG6sdZwhsUEfBlUVc66B/omkl+CYAtdfVUSYZOQ4OMV21BE7
	p+UWjeDI5faT9VroGXv7UYjhd0M1SM2/frJNizUWXC0kJlSPEb0u2F9c/MchRYo3WAAVF9BTJAxD0
	bjjHWo1NB42Tg7oOwRdRAISlM7HtTSjU4ljPby7wC5Z83j4i7M6laOq3IUdas4+qeW6OdtOdH6njH
	fDt3NACnZApHG5arWt8/MQQk/kxAhhujixLxtf7LjEWlgWAFu9HBExuxQ2LWjmsA/krpoiUIAnegV
	MmlsEeBZx3CYTFKKgG+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1p-0000000FEJp-3vhT;
	Wed, 02 Sep 2026 16:41:38 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1j-0000000FE5Q-35Vb
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:32 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-84842381150so1606939b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367290; x=1788972090; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FhHpGJsy4eqTyD8gJTN9GI3bxNYhY9zj5ahy9gYJIhU=;
        b=oaa3po1xSA5nhfPhwWwiVPznXvX8A9oBrUw1cH8pzGYkxjwROUUvTuweL8lR/R3rSE
         vERA0TvZgFty9n+kun1xVigdY7basv7SRAJbDTAOvuMD1qGI7dS/PY0z63CdwilrrF2g
         VeSPe/hD4MFrjtdWSlSMs+JNrNLiYM916u39I49qo3kDeRcew4MUo5cx5NXrIDQb5Ao4
         yryCJVfpsO2VhdmnVA7Md1P6rfG5cNdPkvnAK2RNLXDx3futgxF/1Wrx4CBIWZk+thzu
         oR/ZVlg9iHKAtFMymHdn6HplIMBhdAPgppxqzv0FE+U9uBiNNNib4yrjL00udAnpNvxa
         w4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367290; x=1788972090;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FhHpGJsy4eqTyD8gJTN9GI3bxNYhY9zj5ahy9gYJIhU=;
        b=Qt6K48qFoaxrMWdATcEofOWJRwAjAHOXyzciPs2wzDw/64XKvymkK96/devY9ikJVG
         +hdbMST5twcdTPE+pQdg93lJufu45Nlj5qdeLMniXcT2XZgxiI/3Ars1UjPwKfBcQYer
         e30stJg2Pl1i/HW0YBQ6Iv3+OphVT1PwI+/Oh4P2fORqlG3Opje5U7wDSdKQ6eh/TkYq
         QvpQPeetlgsOkMC6PW8BK5zeFgGS7cDVhakm5QV0brbpqh0hk6dJN7Vl15dguLQzuxuQ
         OA+VVZXmIfjNXBtOzWwSt5F5moYiIJyZjJSpw2TjMSlFz+6JymckJJziq2vPt2lWQD2h
         T/VA==
X-Forwarded-Encrypted: i=1; AKwUvBx80QNMNHeeaf+HNqLwelF23t5RWg3rw5T5RQAz1wri3B3+v+2YivcPVPSx++3amxIZ01X4PBPMb4odvg==@lists.infradead.org
X-Gm-Message-State: AFuF++n4JcrL7r08Bx4g9sjk67M2VxlbY1WuJrKNY7scFSNY9778BNUN
	JOsUrFi7+0dlzeuYXPe/VRPj/BSHMQnaqAZdBKjv/8ZWHL/vS3v2bWqnxD4T6r72hGgVDt/TfI4
	Ge148qA==
X-Received: from pfxa26.prod.google.com ([2002:a05:6a00:1d1a:b0:848:4f56:7671])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2305:b0:857:7384:b5fd
 with SMTP id d2e1a72fcca58-85ed5015dfemr6019071b3a.25.1788367289034; Wed, 02
 Sep 2026 09:41:29 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:07 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-5-seanjc@google.com>
Subject: [PATCH v2 04/20] KVM: selftests: Rename "num" param to "nr_pages" for
 physical page allocators
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_094131_774125_4762D145 
X-CRM114-Status: GOOD (  16.28  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Rename the "num" param in the physical page allocator APIs to "nr_pages" to
make the unit and role of the param more obvious.

Opportunistically rework the function comment to drop the superfluous
kerneldoc style, and to very explicitly call out that success is guaranteed.

No functional change intended.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  |  6 ++--
 tools/testing/selftests/kvm/lib/kvm_util.c    | 35 ++++++-------------
 2 files changed, 14 insertions(+), 27 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 5a7a455b5387..95bc0a78d2bc 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -991,11 +991,11 @@ void kvm_gsi_routing_write(struct kvm_vm *vm, struct kvm_irq_routing *routing);
 const char *exit_reason_str(unsigned int exit_reason);
 
 gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot);
-gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t num, gpa_t min_gpa,
+gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			   u32 memslot, bool protected);
 gpa_t vm_alloc_page_table(struct kvm_vm *vm);
 
-static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
+static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 				       gpa_t min_gpa, u32 memslot)
 {
 	/*
@@ -1003,7 +1003,7 @@ static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
 	 * protected memory, as the majority of memory for such VMs is
 	 * protected, i.e. using shared memory is effectively opt-in.
 	 */
-	return __vm_phy_pages_alloc(vm, num, min_gpa, memslot,
+	return __vm_phy_pages_alloc(vm, nr_pages, min_gpa, memslot,
 				    vm_arch_has_protected_memory(vm));
 }
 
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 9ddc047d5c27..b071d77dd301 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2025,33 +2025,20 @@ const char *exit_reason_str(unsigned int exit_reason)
 }
 
 /*
- * Physical Contiguous Page Allocator
+ * Allocate contiguous (guest) physical pages in a given memory region, at or
+ * the minimum specific GPA.  If the memory is protected/private, also add the
+ * allocate pages to the region's set of protected pages, e.g. so that arch
+ * code knows which pages need to be encrypted when launching the VM.
  *
- * Input Args:
- *   vm - Virtual Machine
- *   num - number of pages
- *   min_gpa - Physical address minimum
- *   memslot - Memory region to allocate page from
- *   protected - True if the pages will be used as protected/private memory
- *
- * Output Args: None
- *
- * Return:
- *   Starting physical address
- *
- * Within the VM specified by vm, locates a range of available physical
- * pages at or above min_gpa. If found, the pages are marked as in use
- * and their base address is returned. A TEST_ASSERT failure occurs if
- * not enough pages are available at or above min_gpa.
+ * Note, success is guaranteed!
  */
-gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
-			   gpa_t min_gpa, u32 memslot,
-			   bool protected)
+gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
+			   u32 memslot, bool protected)
 {
 	struct userspace_mem_region *region;
 	sparsebit_idx_t pg, base;
 
-	TEST_ASSERT(num > 0, "Must allocate at least one page");
+	TEST_ASSERT(nr_pages, "Must allocate at least one page");
 
 	TEST_ASSERT((min_gpa % vm->page_size) == 0, "Min physical address "
 		"not divisible by page size.\n"
@@ -2064,13 +2051,13 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
 
 	base = pg = min_gpa >> vm->page_shift;
 	do {
-		for (; pg < base + num; ++pg) {
+		for (; pg < base + nr_pages; ++pg) {
 			if (!sparsebit_is_set(region->unused_phy_pages, pg)) {
 				base = pg = sparsebit_next_set(region->unused_phy_pages, pg);
 				break;
 			}
 		}
-	} while (pg && pg != base + num);
+	} while (pg && pg != base + nr_pages);
 
 	if (pg == 0) {
 		fprintf(stderr, "No guest physical page available, "
@@ -2081,7 +2068,7 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
 		abort();
 	}
 
-	for (pg = base; pg < base + num; ++pg) {
+	for (pg = base; pg < base + nr_pages; ++pg) {
 		sparsebit_clear(region->unused_phy_pages, pg);
 		if (protected)
 			sparsebit_set(region->protected_phy_pages, pg);
-- 
2.55.0.966.g6673acef38-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
