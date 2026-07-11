Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9130FC44501
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 00:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HauzZcXeJFOVwgrnn7yo9fznIVtooV6BT0lV45uEv6w=; b=g9QjdoU7Khpb9t
	PLUeMQD/pNzUGJFsXdGsS4U5VxD8uYLaTfTjcouVOfL1R1KhrteUxscJtRAHy71/p4dfmt3YFyF3o
	yTxtWY4PH0J3ftT4mc2Jcgfi8VTxV3QeOl+dRrPqYLTXq6GQUpep4hbIG0Hij+szjc3W3YY8VPq4h
	zLs+GgQ+pHSPy6Z7tk2tMrVFT+qvif8n2H8ei6R9bXtwLwCbgFx+vdlwphtY8KxbvkXnoaH2wzTM1
	FVd0erj3yst56huZAwpPXJmgFzvGrJDmBj7ONfiafMVgq/ZEkBSVhCTEsy6rTlznuoHPa0NUme2S3
	g0dE9aerwEFe91gvYvnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiLCm-000000061q4-1vp3;
	Sat, 11 Jul 2026 00:04:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiLCl-000000061py-0817
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jul 2026 00:04:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D9A8600C3;
	Sat, 11 Jul 2026 00:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556671F000E9;
	Sat, 11 Jul 2026 00:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783728265;
	bh=NIBkWpvs94ifP9DOH15o1FfiAVlDV0ggO/H3owjMavQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Ci6t2GSikykjNwFxmDpqQYwroTakRV6up3m8CXbJsjetN0ReFJ4cKT7qmsSxxqqJH
	 hj4iSaeL4shGPMcRJ6l2PO9ONZSMx5Mb2BbtkKOPUw2pomQkS8uxrfqnMNqiBDFzHy
	 V5Kva4ZWD4HpEPEt8aG0svrMLfHY33qQZjg8zQ2VSlO4iGOppgxlMP+BG5c/+T3m0F
	 et1jaDwJwkVJ7VkgbPMRjCAXBVnckDos0z42gHvZZEaG5/bvM39EFn7nXnke4tIpJC
	 xwdrebTIdRDWMKC9IikiqKv5Al1PaiX3RR1Bv0KlT7r9NN7TpZt9mY1lAaBUKHGH3c
	 wfCCmi/7tFVig==
Date: Fri, 10 Jul 2026 18:04:22 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Xu Lu <luxu.kernel@bytedance.com>
cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
    alex@ghiti.fr, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com
Subject: Re: [PATCH RESEND 1/2] riscv: mm: Apply svinval in
 update_mmu_cache()
In-Reply-To: <20250901114141.5438-2-luxu.kernel@bytedance.com>
Message-ID: <dcd61aba-8622-b14d-6466-44a7f0dc0615@kernel.org>
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

Hi,

On Mon, 1 Sep 2025, Xu Lu wrote:

> Only flush tlb of the specified mm, and apply svinval if available.
> 
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>

I wound up splitting this into two separate patches, rather than one 
patch, since there seem to be two orthogonal changes.  The first change
restricts the sfence.vma to a particular ASID (below).  The second change 
involves the Svinval path, and is sent in a subsequent message.
What do you think?


- Paul


From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 1 Sep 2025 19:41:40 +0800
Subject: [PATCH 1/2] riscv: mm: flush TLB by ASID in update_mmu_cache_range()

Only flush the TLB of the specified mm (via local_flush_tlb_page_asid)

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
Link: https://patch.msgid.link/20250901114141.5438-2-luxu.kernel@bytedance.com
[pjw@kernel.org: split the non-Svinval code in the original into this patch; update description]
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/include/asm/pgtable.h  | 7 +++++--
 arch/riscv/include/asm/tlbflush.h | 5 +++++
 arch/riscv/mm/tlbflush.c          | 5 -----
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 5d5756bda82e..755495a542cc 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -568,6 +568,8 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 		struct vm_area_struct *vma, unsigned long address,
 		pte_t *ptep, unsigned int nr)
 {
+	unsigned long asid;
+
 	/*
 	 * Svvptc guarantees that the new valid pte will be visible within
 	 * a bounded timeframe, so when the uarch does not cache invalid
@@ -583,10 +585,11 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 	 * Relying on flush_tlb_fix_spurious_fault would suffice, but
 	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
 	 */
+	asid = get_mm_asid(vma->vm_mm);
 	while (nr--)
-		local_flush_tlb_page(address + nr * PAGE_SIZE);
-
+		local_flush_tlb_page_asid(address + nr * PAGE_SIZE, asid);
 }
+
 #define update_mmu_cache(vma, addr, ptep) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
 
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index eed0abc40514..7c2cd5cc92d3 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -15,6 +15,11 @@
 #define FLUSH_TLB_NO_ASID       ((unsigned long)-1)
 
 #ifdef CONFIG_MMU
+static inline unsigned long get_mm_asid(struct mm_struct *mm)
+{
+	return mm ? cntx2asid(atomic_long_read(&mm->context.id)) : FLUSH_TLB_NO_ASID;
+}
+
 static inline void local_flush_tlb_all(void)
 {
 	__asm__ __volatile__ ("sfence.vma" : : : "memory");
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 8404530ec00f..73c226f719c7 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -110,11 +110,6 @@ static void __ipi_flush_tlb_range_asid(void *info)
 	local_flush_tlb_range_asid(d->start, d->size, d->stride, d->asid);
 }
 
-static inline unsigned long get_mm_asid(struct mm_struct *mm)
-{
-	return mm ? cntx2asid(atomic_long_read(&mm->context.id)) : FLUSH_TLB_NO_ASID;
-}
-
 static void __flush_tlb_range(struct mm_struct *mm,
 			      const struct cpumask *cmask,
 			      unsigned long start, unsigned long size,
-- 
2.53.0




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
