Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97D0C88E75
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 07:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AhShzs98j9pVbVKj2tmTM5HOFaSa8INqSAM4vLw9kBE=; b=sl2ufpI1iYMI/4
	+Ehp0tAm7vWbx1gdOFT+/MZ+GnHAL0Vu+Mv3RTYr+mqJOb1EOPkHrH3eroM68CHo4r7Ygz3C03Q93
	IH3rw9LTeTw+4pqk0Id1GmSvjLqgbLtsOGpcuxsDD16xNH1jWv9ACHJFGY7GdOpaMWeL5XbHARlf5
	Dss6ttfTISmhhXf1ZVCpArINOokjo62eOj/t9QCgLyQFdGqIH8niYMdbz5E4BzfKTeAmHHj+i4yXn
	iodozHIWnH/99ueq59OUbh8pXZBo+RLAxoktLgKwco0ciacwP03WqqOoaUUu+gtzT9UIGunVC8jB2
	pwBTQqUUilDK8Y1Xiztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Szk-0000000DhOD-172x;
	Fri, 18 Sep 2026 07:26:52 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Szh-0000000DhMz-0Zr2
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 07:26:50 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747eb79f7so2741005ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 00:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789716408; x=1790321208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r0TiBnW0QZCej4PmxwEbVRI0oUSu1J4v1QwXVJOCioo=;
        b=rwvAM4oQNsG8IM0afS6z6NAAItyHQonmZ90env1eFg8khX8nzjRQBn2e5fcjH7s/9F
         A/JaE36+2DDzU2K1QpA5EYmv1DtP4zPvrpqi4EbYePntFiecJRyaz6yfZtGM+T6KS0zT
         emmxKy13+ylo8NCB/pVUjqAJDbgMJHOwKE53MdfYR2+niRFDL1z+dQB9LUPtFGU2Yp4A
         BtjwXeQWk+yCrtRW5oYfxz3ZZ/rvw4GG+0IsbK3oBESzLq62udmIDKanINc93lUevDiN
         TKlHluuylhr+1rJwPtm67I/+J2U8zqR6WI/ePKAIqjDHkvYRcRKT7qd8DjyNIJzhTIT6
         BXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716408; x=1790321208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r0TiBnW0QZCej4PmxwEbVRI0oUSu1J4v1QwXVJOCioo=;
        b=0ulkyugpDuALBVZKlCGMGOms5FtO1jy+Aq41y7oly7e++ILt9VGxW9KRHFVPh9Sb7m
         q+N2rQYOMW6JCvv1zK92PImhU/qRLL/uek7YA56Bx8hMLWWGgDjfE5IybQ5p7DGqwZTn
         CRoT+5xShfjnGqlo/81zr9hBSscG1rDCduCJQaav1GQl8bu7xZ8JTlpMAe/FgfNadeqy
         yWYufE+jXOEvmpJTwL+Rn0eLUsPyii04l6KFFLKpf8Vt5FkTc2vLaOgUq8aA13/mzKr6
         3RUTVsYxnOtKhlDW1UsdL2VUCdiImGJkNc6/OksYYP3/vY54V2Vjh7ecTZrHYaAhRi48
         x+rQ==
X-Forwarded-Encrypted: i=1; AKwUvBysyTVI2fROdyC433KgAcKgSgOCG2kathqnaWcXdzz+HVtuVavRfoK6y1Erkla4DQg0MUN5dYiRdDxirw==@lists.infradead.org
X-Gm-Message-State: AFuF++lOktuvMQO6QEK7aFiXS2MZSGjTUx8eoLf04wJGThB5yhmAna/O
	xSM7XTVIuabvwUKY57T5F/LER2sVhB/pUCEQbcr/VBTGhgWZaqP/63AG
X-Gm-Gg: AYBFou3kpzyslKdA8vwKpRPESAgN5RcGRdcZNtfXxawY6G2Q7QV1PVbrwA6TN2UjGO8
	ucIyluRFv41v+lcPMJ9JcX1csNffCv2hxS/VWzhOO0aFm4mx+K1A4WedhScPgIYCE8QObY+ga2p
	ZvI81GuPQi95eEQxkyiuvSkfVt6v751YkXhuDCY2b/spmP62HqKTQ4AhkMmXwRuOMoslOr6wV8f
	UHngFUyK1FkQlznju75pq8ReujvvrNW9m0hfqNU9eIp5GeAPpppkiqa4Kqp0K/bYTXx9lbprWA6
	2IzA8J8NyjuK1OL+DVELS43J3eQJUh4R2HgMjEabgLeP6XdGVBnoUUl9p2fASZcN71JKlTl6DBI
	srL/SLsDw3aJx48M7PL3dQVrDhd5QGibkpeb4bnBSYbeAhy5XZDuY+o/RCeElRtlJ4DAy0+ZwLM
	/DkjjKvFYIrI4GrQiBxBS/W9ipXZFSmv4EFztVDw1CbYX6EgBC1VT453rcA4Nm1CWmKJRpNOU1L
	0wN0NXPEifp0YIo9eFEGy4=
X-Received: by 2002:a17:902:da85:b0:2d9:3083:a3ac with SMTP id d9443c01a7336-2ddb7420950mr15441415ad.15.1789716407615;
        Fri, 18 Sep 2026 00:26:47 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb73dae10sm3772535ad.1.2026.09.18.00.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:26:45 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jinyu Tang <tjytimi@163.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH] KVM: riscv: Age all G-stage PTEs in a GFN range
Date: Fri, 18 Sep 2026 16:26:22 +0900
Message-ID: <20260918072622.284188-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_002649_178551_7335B871 
X-CRM114-Status: GOOD (  14.07  )
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

kvm_age_gfn() and kvm_test_age_gfn() only operate on the G-stage
leaf covering range->start. They also warn unless the range size is
exactly 4K, 2M, or 1G.

The MM can pass larger ranges when batching the PTEs of a large folio.
For example, a 64K mTHP range triggers the warning and only the first
4K leaf is aged, leaving the Accessed bits of the remaining leaves
unchanged.

This can be reproduced on an rv64 host with Svadu by disabling 2M THP,
enabling 64K mTHP, and running:

access_tracking_perf_test -s anonymous_thp

This results in:

WARNING: arch/riscv/kvm/mmu.c:362 at kvm_age_gfn+0x210/0x370
...
[<ffffffff800c8fc8>] kvm_age_gfn+0x210/0x370
[<ffffffff80095c90>] kvm_mmu_notifier_clear_young+0x250/0x478
[<ffffffff80ae532e>] __mmu_notifier_clear_young+0xde/0x1a0
[<ffffffff80932f76>] walk_pud_range+0x86e/0x1688
[<ffffffff80a18720>] walk_pgd_range+0x518/0x17b0
[<ffffffff80a19aa2>] __walk_page_range+0xea/0x580
[<ffffffff80a1a422>] walk_page_range+0x3a/0x80
[<ffffffff80931dc0>] try_to_inc_max_seq+0x520/0xe68
[<ffffffff80939dc0>] lru_gen_seq_write+0xd08/0x1310

Walk all G-stage leaves in the requested range. Advance by the leaf
size when a mapping is found, or by the size of the non-present region
at the level where the walk stopped. When testing the age, return as
soon as a young leaf is found.

Remove the range-size warning since arbitrary GFN ranges are valid.

Fixes: 9955371cc014 ("RISC-V: KVM: Implement MMU notifiers")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/include/asm/kvm_gstage.h |  2 ++
 arch/riscv/kvm/gstage.c             | 34 +++++++++++++++++++++++++++++
 arch/riscv/kvm/mmu.c                | 22 ++++---------------
 3 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index aaf080ba1b77..a03db1a10095 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -81,6 +81,8 @@ bool kvm_riscv_gstage_unmap_range(struct kvm_gstage *gstage,
 				  gpa_t start, gpa_t size, bool may_block);
 
 bool kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end);
+bool kvm_riscv_gstage_age_range(struct kvm_gstage *gstage, gpa_t start,
+				gpa_t end, bool test_only);
 
 bool kvm_riscv_gstage_wp_pt_masked(struct kvm_gstage *gstage, gfn_t base_gfn,
 				   unsigned long mask);
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index e5002cb9cbef..f61ba434093c 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -485,6 +485,40 @@ bool kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
 	return flush;
 }
 
+bool kvm_riscv_gstage_age_range(struct kvm_gstage *gstage, gpa_t start,
+				gpa_t end, bool test_only)
+{
+	unsigned long page_size;
+	bool young = false;
+	gpa_t addr = start;
+	pte_t *ptep;
+	u32 level;
+	bool found;
+
+	while (addr < end) {
+		found = kvm_riscv_gstage_get_leaf(gstage, addr, &ptep, &level);
+		if (gstage_level_to_page_size(gstage, level, &page_size))
+			break;
+
+		if (found) {
+			if (test_only) {
+				if (pte_young(ptep_get(ptep)))
+					return true;
+			} else {
+				young |= ptep_test_and_clear_young(NULL, 0, ptep);
+			}
+		}
+
+		/*
+		 * Advance past this leaf, or past the non-present region at
+		 * the level where the walk stopped.
+		 */
+		addr = ALIGN_DOWN(addr, page_size) + page_size;
+	}
+
+	return young;
+}
+
 static inline void clear_huge_mask(unsigned long *mask, unsigned long page_size,
 				   gfn_t base_gfn, gpa_t addr)
 {
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 3e955d808743..342f606399e5 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -351,42 +351,28 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	pte_t *ptep;
-	u32 ptep_level = 0;
-	u64 size = (range->end - range->start) << PAGE_SHIFT;
 	struct kvm_gstage gstage;
 
 	if (!kvm->arch.pgd)
 		return false;
 
-	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
-
 	kvm_riscv_gstage_init(&gstage, kvm);
-	if (!kvm_riscv_gstage_get_leaf(&gstage, range->start << PAGE_SHIFT,
-				       &ptep, &ptep_level))
-		return false;
 
-	return ptep_test_and_clear_young(NULL, 0, ptep);
+	return kvm_riscv_gstage_age_range(&gstage, range->start << PAGE_SHIFT,
+					  range->end << PAGE_SHIFT, false);
 }
 
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	pte_t *ptep;
-	u32 ptep_level = 0;
-	u64 size = (range->end - range->start) << PAGE_SHIFT;
 	struct kvm_gstage gstage;
 
 	if (!kvm->arch.pgd)
 		return false;
 
-	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
-
 	kvm_riscv_gstage_init(&gstage, kvm);
-	if (!kvm_riscv_gstage_get_leaf(&gstage, range->start << PAGE_SHIFT,
-				       &ptep, &ptep_level))
-		return false;
 
-	return pte_young(ptep_get(ptep));
+	return kvm_riscv_gstage_age_range(&gstage, range->start << PAGE_SHIFT,
+					  range->end << PAGE_SHIFT, true);
 }
 
 static bool fault_supports_gstage_huge_mapping(struct kvm_memory_slot *memslot,

base-commit: 41e81f7e3ef96594fb840445343c0ee7723aa550
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
