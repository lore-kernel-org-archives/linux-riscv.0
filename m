Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053CAC982EE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 11:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4cqePwi5QY4rcCgHmC//FbV3/ELMvK4bK/HkoxaBNnk=; b=eDMqWYmwpGLOmU
	06pljvAR8JefnPmjBOVmLyPZjvuqcmJjcFH1E3adWRfrlko3RDcbGOEtYucmcAnnagOc5iEDn53gc
	pG65jsAZMDmoBM1XPJgyCmi1d0LjJEEx20htoSb4Db+nkCMIqOVKMMlLYUfh3GnzxqTxF0Np4lX8z
	g9yqk0tC37Bvcjeq7WU61hmeV18GrJIr29rRyW009Af3MeLKqqqtxUBQqO+csCa7/Jf08muUmMdH/
	8fdQQfDVjnXaazPxKpzJkjWXQyKMksqOJBXtWfE7ncbvTs6zQh2Oys4p8A35qbPwTHGYYCUwrpIzT
	D005YszTxqgfzWewpZ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8byb-00000001q95-168U;
	Mon, 21 Sep 2026 11:14:25 +0000
Received: from mail-pz2-x22.google.com ([2607:f8b0:4864:3b::22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8byY-00000001q8S-2OUs
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 11:14:23 +0000
Received: by mail-pz2-x22.google.com with SMTP id 41be03b00d2f7-cc1cea50dc0so1160024a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 04:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989260; x=1790594060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01ra1AO1mSvOrLFVgo6C3hu4ILWJ3jo+KfsYZ5db6+s=;
        b=RgNvUP8iDBiCY+bGs9n8KsvB28kuFYdpGHb3fcHw8VXmHcM9K+yJvk6HbYDUZQ6vyX
         F4e/rN1OHTTDrRi5Wlom+nwDoY68+lz4RpnnARdQcMZcgIGGhB9GOOoR/41MMtAw1t7K
         vhKKAIY29HUpCd+9sMQTjhJMxy/XI5Grl/ZcURHuolooBrenX0Zs8H9ctz4eDMxarKvi
         /eRH/M8zKEoQpY7Hwd3265opCq7zbWJziv5FzOsvlx2LWaHSbpbGI5eQ+RRjqJb59U7t
         KxggS//WftkAtawxViG8WFzXGNHd+1xXAnnyn6SN3XZKdELWx/wBa2EG6FGP9oFbvYhp
         J+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989261; x=1790594061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=01ra1AO1mSvOrLFVgo6C3hu4ILWJ3jo+KfsYZ5db6+s=;
        b=IvRl3fLZn8zFC6S3nmpUzcu11lrhOLaADLvY7WQg+8oTd/N8/7T4trlMk2dfxz4Q4l
         JhZg00fZTF0qXv8NhcSmCmd6rgIm//uYykR0P1pDtlzDoPTiUsMDWpqdnXDQ8PQT+YnE
         OPt1qwIVlTwWAiDFsWL7ZGbcWkosxN3lhm7+ebtuE3oPLKlqgoiI9KXhcZzQBBEq2pa9
         Yc+5r/p5giZWCu421Gyjt46ottTv8z5Ca7yyoILRIuWRPA2ium71huAbpMPaye6440+7
         FYU1lA60nBp9idKRlfiS6yczrratpDPxyBZokaDdiO5rKJOxfJ+6R0TPVc3voiyeeBFQ
         L8Gw==
X-Forwarded-Encrypted: i=1; AKwUvBzbhultx0R+yglTnXcShRcbp4VI1qD0CN0kKs69z8cGyBzkqdx75KYi/C0XVKjVvqx+cMdCnfnuv/id4Q==@lists.infradead.org
X-Gm-Message-State: AFuF++m/L4U1ClPQKA4aVSaosDHJXi28R+JjD0wXAsvKdeeXpBVRVeyW
	y1ko2YG02Q3t94G7oMVmjvMW7zziGJoSap/irZbJOaWcya5hHkRbqqnM
X-Gm-Gg: AYBFou3nXs13V1CLgrZEQZBfDJ/hAkciLZIqVVHpI+tnNBEhYp7zZ/M0OT79VwrICJj
	sVbur4M/yaYIuClMB0r3LB/4VyJxIBlV/VcWj2BC1cdW6741/6fFViV1deHUaVoZ7Gv6RryG6YS
	TTQKkCUGnMS6w9WuPERD9CzktXGkDF2UFiIBGvTPgC5fkS2n4R7NptOR9Pycy8XKf4la2UFR9v1
	mVAwzHkLXwo/njNG7EVy2mQtkFf4u74JUODCV7RhLFwnUBY8pCsGYEfQ2nbDmiv+B9hMc3VmDxJ
	jic1R9POF4jPL1Tcm72FKzhyGZhibgvxPIv76kTyCvEJoxaP2YUPy/+FqYg6jNJlhXWRzagthoB
	1zx6WjCMOPxId7w1t7sspQd9jd+JWqPwNWSjPN8sb4ZxwtFcmciqoUq2QfCaUdI3tMj7bVy4rXn
	QSphCjpgNF0XrVrOAojA6sjjOtTFQYLTQZI8NgXk85pYQ0e9CkN1uwCe/yYjvX7QpM2R15cVcPl
	yRdGGDm+tOgpvNgWRwuJwJakdEzyS/9
X-Received: by 2002:a17:90b:54c4:b0:39e:4c7f:7308 with SMTP id 98e67ed59e1d1-39e55071981mr15415502a91.31.1789989260551;
        Mon, 21 Sep 2026 04:14:20 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm13438703a91.0.2026.09.21.04.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:14:20 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jinyu Tang <tjytimi@163.com>,
	Wang Yechao <wang.yechao255@zte.com.cn>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 1/5] KVM: riscv: Age all G-stage PTEs in a GFN range
Date: Mon, 21 Sep 2026 20:13:58 +0900
Message-ID: <20260921111402.120911-2-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260921111402.120911-1-suunj1331@gmail.com>
References: <20260921111402.120911-1-suunj1331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_041422_616637_7A8DFB4C 
X-CRM114-Status: GOOD (  15.13  )
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
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
