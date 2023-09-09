Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0210FEE14C3
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Sep 2023 20:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HWfo0SJRskoTmjuHFnlCXmFzgOh+/H54sG1vdYVGIk=; b=QuVYj5dOZq7HTi
	2G//K0ZU1njHsxLEgh2jFzjU10Gw5PCH5Yu0n0oDeuEXXfKDdsXf6n36RRLTJP27qMIMNyi74OF2J
	GODL4lq4xVTITzhhi0IAV98CKamt6Mic4mlWC+whUmMtpyZKciii3/K7tBpzxO7mCq899TlsWn4Bv
	6PJk+5lrDoTwhTmQC90UGI9AwZ/8zXRn/1lFWBnRwZVFYjerHaYyzg2nStRRwQasiN1utCtzBJrX1
	bLQd4j53KCQ7HIn1uIUt/IZ9hEUssHMwYBq74LdinsPe7B80fgcxs4ozXpDBO0apLVJdgKgLF0RpB
	NiVIvvEypB4ssK1I7deA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qf4Os-00Fl2Z-2p;
	Sat, 09 Sep 2023 20:17:50 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qf4Ol-00Fktp-27
	for linux-riscv@lists.infradead.org;
	Sat, 09 Sep 2023 20:17:45 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id A23CD3200805;
	Sat,  9 Sep 2023 16:17:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sat, 09 Sep 2023 16:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1694290662; x=
	1694377062; bh=vYgeei/BDcJ6bUB2DAGppW0ND32ofla8o2DCj1NxYPE=; b=K
	u0dd0RZHMaDqMns7iRitHO88BySItmXc1V/+Vb/OkmR3KGcO1DvaRAtq3OLHETze
	naLsbxraep105inN1mW8i3aVWoN2CHwYKGEBnzeDVwtB/CY825a4Z6xplHeKufSB
	j5nFyWllPSvSBWdcnnya2PQa8PQnYYZV8XJ5rJi+x/EQ026aTvbwXVV8VdsVpeGh
	K6pNLRO3moFbl1eU9gKfEAOCfyD/8MKFiMMKp6OiMj6Z78ZchXerkP5VT2pQbY1v
	Kah1XXspL8hkSGENcggXYwqoYZTnzsPBZM5B7wK0UGfXDstVHgvLEPFUuxcvWJ4X
	I7OZP8RqM2VGeFapjE9CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1694290662; x=
	1694377062; bh=vYgeei/BDcJ6bUB2DAGppW0ND32ofla8o2DCj1NxYPE=; b=J
	6plQnuSCnXtX5IBcgF5KYZGLQQG5MhLcW0wynftAZ0np5C/3SOw1d4GtGQhHZoeA
	RUCoGTMdxPBabmUAs8z9fzJypFl0W39j4LSRzE/kj+YtSJ+y2/NJxCWOMlC+OiBh
	E06QkMy8GJfKVsumpoaI812sFBrDYMDbN7JgsvEuVRLEJ8/imdo2h3gHSfEr1mtS
	U5OdXOVeblb2nv0zlpwDBRQC818RhI7+SAipU2efh9earF6Cmks7jZbChNmnwBYD
	Vd/3hzPGOd+tI1EvQdpIoT/1VmuvUeJxT7/xF3v23ep25CoStRL7VhCvoOIJo699
	CEAt1LarUDmRPpTBESL8w==
X-ME-Sender: <xms:5tL8ZCxRHNq-vzK9N_uG8qqhbp1rBBZJvMQ9p4a7aAHLq3NtnewxUg>
    <xme:5tL8ZOQzgpOWVkKdWgPPv6_cgUihWvwV0e4kJV3IgmdiyW0KJM_agwaPSvToF64mD
    BKKgu6Gzmjz4Bhqnw>
X-ME-Received: <xmr:5tL8ZEVIn04lOL8iEg7t_6-Bpd7rcM1EVp87tIIXdWdNEfB7mEw9ZCI9xIQrxqsnwjd_Vb-hOeWYdBkUxugRx_7CmdETWSKc1f38xGy0tjLYkUNXxf_DsCaJFXJl1xiuAhsZFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudehledgudegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
    gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:5tL8ZIgvP082q9SgyvhZDbZ69buLo0piSwbSNT3_7U8OsZV6xK8lvg>
    <xmx:5tL8ZEAxP4Bj3bU5vGdQ1eX2D8JNvBrwsjCMkx_b0-N6o3oStnzTuA>
    <xmx:5tL8ZJIUDslnDG-sxfX_w_w2fCw2f6hdrGqre1Oxj6FtmZCr892DhQ>
    <xmx:5tL8ZH9UTzbv1bS2mhrE2nMYvChZb-rj8vYZoG893ysjlGWDVmt9Dw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Sep 2023 16:17:41 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 6/7] riscv: mm: Always flush a single MM context by ASID
Date: Sat,  9 Sep 2023 15:16:34 -0500
Message-ID: <20230909201727.10909-7-samuel@sholland.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230909201727.10909-1-samuel@sholland.org>
References: <20230909201727.10909-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230909_131743_777474_E2497DF9 
X-CRM114-Status: GOOD (  14.48  )
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

Even if ASIDs are not supported, using the single-ASID variant of the
sfence.vma instruction preserves TLB entries for global (kernel) pages.
So it is always most efficient to use the single-ASID code path.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/riscv/include/asm/mmu_context.h |  2 -
 arch/riscv/include/asm/tlbflush.h    | 11 +++--
 arch/riscv/mm/context.c              |  3 +-
 arch/riscv/mm/tlbflush.c             | 68 ++++++----------------------
 4 files changed, 24 insertions(+), 60 deletions(-)

diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index 7030837adc1a..b0659413a080 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -33,8 +33,6 @@ static inline int init_new_context(struct task_struct *tsk,
 	return 0;
 }
 
-DECLARE_STATIC_KEY_FALSE(use_asid_allocator);
-
 #include <asm-generic/mmu_context.h>
 
 #endif /* _ASM_RISCV_MMU_CONTEXT_H */
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index e55831edfc19..ba27cf68b170 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -54,13 +54,18 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 #define flush_tlb_all() local_flush_tlb_all()
 #define flush_tlb_page(vma, addr) local_flush_tlb_page(addr)
 
+static inline void flush_tlb_mm(struct mm_struct *mm)
+{
+	unsigned long asid = cntx2asid(atomic_long_read(&mm->context.id));
+
+	local_flush_tlb_all_asid(asid);
+}
+
 static inline void flush_tlb_range(struct vm_area_struct *vma,
 		unsigned long start, unsigned long end)
 {
-	local_flush_tlb_all();
+	flush_tlb_mm(vma->vm_mm);
 }
-
-#define flush_tlb_mm(mm) flush_tlb_all()
 #endif /* !CONFIG_SMP || !CONFIG_MMU */
 
 /* Flush a range of kernel pages */
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 3ca9b653df7d..20057085ab8a 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -18,8 +18,7 @@
 
 #ifdef CONFIG_MMU
 
-DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
-
+static DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
 static unsigned long num_asids;
 
 static atomic_long_t current_version;
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 54c3e70ccd81..56c2d40681a2 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -6,15 +6,6 @@
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
 
-static inline void local_flush_tlb_range(unsigned long start,
-		unsigned long size, unsigned long stride)
-{
-	if (size <= stride)
-		local_flush_tlb_page(start);
-	else
-		local_flush_tlb_all();
-}
-
 static inline void local_flush_tlb_range_asid(unsigned long start,
 		unsigned long size, unsigned long stride, unsigned long asid)
 {
@@ -51,62 +42,33 @@ static void __ipi_flush_tlb_range_asid(void *info)
 	local_flush_tlb_range_asid(d->start, d->size, d->stride, d->asid);
 }
 
-static void __ipi_flush_tlb_range(void *info)
-{
-	struct flush_tlb_range_data *d = info;
-
-	local_flush_tlb_range(d->start, d->size, d->stride);
-}
-
 static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 			      unsigned long size, unsigned long stride)
 {
+	unsigned long asid = cntx2asid(atomic_long_read(&mm->context.id));
 	struct flush_tlb_range_data ftd;
 	struct cpumask *cmask = mm_cpumask(mm);
 	unsigned int cpuid;
-	bool broadcast;
 
 	if (cpumask_empty(cmask))
 		return;
 
 	cpuid = get_cpu();
 	/* check if the tlbflush needs to be sent to other CPUs */
-	broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
-	if (static_branch_unlikely(&use_asid_allocator)) {
-		unsigned long asid = cntx2asid(atomic_long_read(&mm->context.id));
-
-		if (broadcast) {
-			if (riscv_use_ipi_for_rfence()) {
-				ftd.asid = asid;
-				ftd.start = start;
-				ftd.size = size;
-				ftd.stride = stride;
-				on_each_cpu_mask(cmask,
-						 __ipi_flush_tlb_range_asid,
-						 &ftd, 1);
-			} else
-				sbi_remote_sfence_vma_asid(cmask,
-							   start, size, asid);
-		} else {
-			local_flush_tlb_range_asid(start, size, stride, asid);
-		}
-	} else {
-		if (broadcast) {
-			if (riscv_use_ipi_for_rfence()) {
-				ftd.asid = 0;
-				ftd.start = start;
-				ftd.size = size;
-				ftd.stride = stride;
-				on_each_cpu_mask(cmask,
-						 __ipi_flush_tlb_range,
-						 &ftd, 1);
-			} else
-				sbi_remote_sfence_vma(cmask, start, size);
-		} else {
-			local_flush_tlb_range(start, size, stride);
-		}
-	}
-
+	if (cpumask_any_but(cmask, cpuid) < nr_cpu_ids) {
+		if (riscv_use_ipi_for_rfence()) {
+			ftd.asid = asid;
+			ftd.start = start;
+			ftd.size = size;
+			ftd.stride = stride;
+			on_each_cpu_mask(cmask,
+					 __ipi_flush_tlb_range_asid,
+					 &ftd, 1);
+		} else
+			sbi_remote_sfence_vma_asid(cmask,
+						   start, size, asid);
+	} else
+		local_flush_tlb_range_asid(start, size, stride, asid);
 	put_cpu();
 }
 
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
