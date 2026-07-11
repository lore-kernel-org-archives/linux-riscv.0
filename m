Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B498C43458
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 00:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSStiU3W/iCzokWMrLFybrdDBYqWmdIofr6C4mxQRK4=; b=CVYYyZIOAe0ixH
	/Jc5c9hEQOV1PrW5jjxb3kAqtmp7vQ5xQCkWFV4g+fLpiEBooRNlFDB+ash+0Lpl/cV4XtV/iNd1E
	pkXDH2cmtm4WbRB7VcqUpNkI1tZie0c85InFTJVgQ+JccPMx/MCfv89O5NXwGiLdnd7MHSWyhYfBh
	fFkLEVqQrtHxFjUoRypabMRxMZlv6b0ilBIoLJJ/Elhjg5R3R4WsBs9nMa+XJK8p55Tt6qvWhOyyI
	gu4ba5xPIhfVgyXr2HzSU5TOn2/vXe3DVchuvpPF5ros3vp8ZuETRG0BpfUVnLo/xb2zaAINHQdPI
	6c2HaTq2aqJz3iAQnpdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiLFR-0000000620o-35U6;
	Sat, 11 Jul 2026 00:07:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiLFQ-0000000620h-3lQ4
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jul 2026 00:07:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D6A8260051;
	Sat, 11 Jul 2026 00:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90751F000E9;
	Sat, 11 Jul 2026 00:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783728431;
	bh=jID/E32ijr04vKU7dIwHxi1yG6DfPGCSA5qifg5s8QM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=H8GkVQNnzhVWJbnvADiFgGbjbb4xSBFYLYdzIX/b1ZnZeGUdWNG5WsUU+8foV4aBm
	 8XfkPDJbe20OzJAn1gck/JbO2Pwllv8qVOW+kuRXdx70zsEMZYTWiPimdwnkDUWjvp
	 tA/VrXNppoewsG2m8A3xgiXS6quLktEJEZO04xSNJBLgUls0hxqvMdT/QyM5d7DemH
	 Gkz+kTYTKxVtKuKHyNgq0iOvRs5pEqzCOuZqY7W2z+wncCRrRLwAu9Nl4IA7RjcsBl
	 dO70mikrcYaMJkaAJFjAqi4HMQF5+jR8QrsIlpo+JxVRUSL6TXyfINypAAhH1HQVrd
	 tV7ZfHlS4v2mg==
Date: Fri, 10 Jul 2026 18:07:10 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Xu Lu <luxu.kernel@bytedance.com>
cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
    alex@ghiti.fr, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com
Subject: Re: [PATCH RESEND 1/2] riscv: mm: Apply svinval in
 update_mmu_cache()
In-Reply-To: <20250901114141.5438-2-luxu.kernel@bytedance.com>
Message-ID: <e819486e-3cf9-bba0-6000-4750dc4d65ef@kernel.org>
References: <20250901114141.5438-1-luxu.kernel@bytedance.com> <20250901114141.5438-2-luxu.kernel@bytedance.com>
MIME-Version: 1.0
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

On Mon, 1 Sep 2025, Xu Lu wrote:

> Only flush tlb of the specified mm, and apply svinval if available.
> 
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> ---
>  arch/riscv/include/asm/pgtable.h  | 16 +++++++++++++++-
>  arch/riscv/include/asm/tlbflush.h | 23 +++++++++++++++++++++++
>  arch/riscv/mm/tlbflush.c          | 23 -----------------------
>  3 files changed, 38 insertions(+), 24 deletions(-)

And here's the second patch, separated out from your original, which adds 
the Svinval path.  Thoughts?


- Paul

From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 1 Sep 2025 19:41:40 +0800
Subject: [PATCH] riscv: mm: Use Svinval if present in update_mmu_cache_range()

If the Svinval extension is present, use it in
update_mmu_cache_range(), rather than using the standard sfence.vma.
Svinval should be faster.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
Link: https://patch.msgid.link/20250901114141.5438-2-luxu.kernel@bytedance.com
[pjw@kernel.org: separate the non-Svinval path into an earlier patch; update to apply and improve the description]
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/include/asm/pgtable.h  | 16 ++++++++++++++++
 arch/riscv/include/asm/tlbflush.h | 18 ++++++++++++++++++
 arch/riscv/mm/tlbflush.c          | 18 ------------------
 3 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 755495a542cc..899d38614bb3 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -562,6 +562,17 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 #define pgd_ERROR(e) \
 	pr_err("%s:%d: bad pgd " PTE_FMT ".\n", __FILE__, __LINE__, pgd_val(e))
 
+static inline void __update_mmu_cache_range_svinval(struct vm_area_struct *vma,
+		unsigned long address, unsigned int nr)
+{
+	int i;
+	unsigned long asid = get_mm_asid(vma->vm_mm);
+
+	local_sfence_w_inval();
+	for (i = 0; i < nr; i++)
+		local_sinval_vma(address + nr * PAGE_SIZE, asid);
+	local_sfence_inval_ir();
+}
 
 /* Commit new configuration to MMU hardware */
 static inline void update_mmu_cache_range(struct vm_fault *vmf,
@@ -578,6 +589,11 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC))
 		return;
 
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)) {
+		__update_mmu_cache_range_svinval(vma, address, nr);
+		return;
+	}
+
 	/*
 	 * The kernel assumes that TLBs don't cache invalid entries, but
 	 * in RISC-V, SFENCE.VMA specifies an ordering constraint, not a
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 7c2cd5cc92d3..9636d07fe9ee 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -20,6 +20,24 @@ static inline unsigned long get_mm_asid(struct mm_struct *mm)
 	return mm ? cntx2asid(atomic_long_read(&mm->context.id)) : FLUSH_TLB_NO_ASID;
 }
 
+static inline void local_sfence_inval_ir(void)
+{
+	asm volatile(SFENCE_INVAL_IR() ::: "memory");
+}
+
+static inline void local_sfence_w_inval(void)
+{
+	asm volatile(SFENCE_W_INVAL() ::: "memory");
+}
+
+static inline void local_sinval_vma(unsigned long vma, unsigned long asid)
+{
+	if (asid != FLUSH_TLB_NO_ASID)
+		asm volatile(SINVAL_VMA(%0, %1) : : "r" (vma), "r" (asid) : "memory");
+	else
+		asm volatile(SINVAL_VMA(%0, zero) : : "r" (vma) : "memory");
+}
+
 static inline void local_flush_tlb_all(void)
 {
 	__asm__ __volatile__ ("sfence.vma" : : : "memory");
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 73c226f719c7..962db300a166 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -11,24 +11,6 @@
 
 #define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
 
-static inline void local_sfence_inval_ir(void)
-{
-	asm volatile(SFENCE_INVAL_IR() ::: "memory");
-}
-
-static inline void local_sfence_w_inval(void)
-{
-	asm volatile(SFENCE_W_INVAL() ::: "memory");
-}
-
-static inline void local_sinval_vma(unsigned long vma, unsigned long asid)
-{
-	if (asid != FLUSH_TLB_NO_ASID)
-		asm volatile(SINVAL_VMA(%0, %1) : : "r" (vma), "r" (asid) : "memory");
-	else
-		asm volatile(SINVAL_VMA(%0, zero) : : "r" (vma) : "memory");
-}
-
 /*
  * Flush entire TLB if number of entries to be flushed is greater
  * than the threshold below.
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
