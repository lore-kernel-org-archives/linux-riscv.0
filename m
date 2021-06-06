Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F41C47096
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 09:06:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0A236120F
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 09:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0A236120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oy3+3hlCnn/DpDsQHQ1wXcUpQN8ccA8pSb6B26S3wCY=; b=W4izeHVWHYJ6ho
	6zAg0jdqYV/7BQyWtHeAklBQ1sY6K4mcoxN/R2vjdaI4CTF7lHhpbvi7Ri102olZSt7RikjNQctLG
	/QenSJe1y2M4xipL5oHcJqwlCyXR0KZ8dktKlrEEZMOREmSK96PBX/auLQXA4G4NfIXSlrA0B9LhT
	k1hltBhxsbhb8+r10x3rMSAxhBHUsT8V8kJOnz3KDW9VXMOIfxtoTGj15Lld117JAIk8KFJfxRned
	1HZBRe5J34Ux2ipX7cxZ5ZjZvdbCTqCmRHhYyv7+WwASt20uBgpPx5MK7scYK3Y5mJprZlCJ23Xoe
	od8HnuuLmH9uHhIHtJzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpoie-0002eM-09; Sun, 06 Jun 2021 09:05:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpoib-0002cj-4Q
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 09:05:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DED0F61422;
 Sun,  6 Jun 2021 09:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622970316;
 bh=wXjPzw/QbM1L1IzLq8JbsJfVZnJtz47t31tM5xC6P+c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FFLCy3J/YoWqFz5YsQAbn6YwCuQjC2kcpjBmwZC9mHaj7H4d2Pk3pYkyu+VAtxLWq
 j21MIjSlnEfbpmAttndB0rDQqCykVZKamOY4QY+didjTGNGpmV6isKTMLdd0W4NTyv
 Gerl8NppZcmQj2IpZn2UjfuLDNZ3Z35cpw4HWN/RExRciHHsZb0mLJ+vvi83pc0JW9
 bwG6Rcse0Gg7rCeTQ1eX8Uns3EjpKwneB0OLOILrV35YLNlkNq2cwj4VjCwV1jLNNc
 0Bjg4sU4ls6I9T9gbVlqUbyf7nT5StXjXrdSfKdSH8v20yYCrAQOU0qVETL33McIWv
 U29GZC0Eha/Sw==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, drew@beagleboard.org,
 liush@allwinnertech.com, lazyparser@gmail.com, wefu@redhat.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>, Atish Patra <atish.patra@wdc.com>
Subject: [RFC PATCH v2 03/11] riscv: asid: Optimize tlbflush coding convention
Date: Sun,  6 Jun 2021 09:04:00 +0000
Message-Id: <1622970249-50770-6-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622970249-50770-1-git-send-email-guoren@kernel.org>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_020517_247230_10EDF31C 
X-CRM114-Status: GOOD (  17.89  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Passing the mm_struct as the first argument, as we can derive both
the cpumask and asid from it instead of doing that in the callers.

But more importantly, the static branch check can be moved deeper
into the code to avoid a lot of duplication.

Also add FIXME comment on the non-ASID code switches to a global
flush once flushing more than a single page.

Link: https://lore.kernel.org/linux-riscv/CAJF2gTQpDYtEdw6ZrTVZUYqxGdhLPs25RjuUiQtz=xN2oKs2fw@mail.gmail.com/T/#m30f7e8d02361f21f709bc3357b9f6ead1d47ed43
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
Co-Developed-by: Christoph Hellwig <hch@lst.de>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Drew Fustini <drew@beagleboard.org>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Wei Fu <wefu@redhat.com>
Cc: Wei Wu <lazyparser@gmail.com>
---
 arch/riscv/mm/tlbflush.c | 91 ++++++++++++++++++++++--------------------------
 1 file changed, 41 insertions(+), 50 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 87b4e52..facca6e 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -12,56 +12,59 @@ void flush_tlb_all(void)
 }
 
 /*
- * This function must not be called with cmask being null.
+ * This function must not be called with mm_cpumask(mm) being null.
  * Kernel may panic if cmask is NULL.
  */
-static void __sbi_tlb_flush_range(struct cpumask *cmask, unsigned long start,
+static void __sbi_tlb_flush_range(struct mm_struct *mm,
+				  unsigned long start,
 				  unsigned long size)
 {
+	struct cpumask *cmask = mm_cpumask(mm);
 	struct cpumask hmask;
 	unsigned int cpuid;
+	bool local;
 
 	if (cpumask_empty(cmask))
 		return;
 
 	cpuid = get_cpu();
 
-	if (cpumask_any_but(cmask, cpuid) >= nr_cpu_ids) {
-		/* local cpu is the only cpu present in cpumask */
-		if (size <= PAGE_SIZE)
-			local_flush_tlb_page(start);
-		else
-			local_flush_tlb_all();
-	} else {
-		riscv_cpuid_to_hartid_mask(cmask, &hmask);
-		sbi_remote_sfence_vma(cpumask_bits(&hmask), start, size);
-	}
+	/*
+	 * check if the tlbflush needs to be sent to other CPUs, local
+	 * cpu is the only cpu present in cpumask.
+	 */
+	local = !(cpumask_any_but(cmask, cpuid) < nr_cpu_ids);
 
-	put_cpu();
-}
-
-static void __sbi_tlb_flush_range_asid(struct cpumask *cmask,
-				       unsigned long start,
-				       unsigned long size,
-				       unsigned long asid)
-{
-	struct cpumask hmask;
-	unsigned int cpuid;
-
-	if (cpumask_empty(cmask))
-		return;
-
-	cpuid = get_cpu();
+	if (static_branch_likely(&use_asid_allocator)) {
+		unsigned long asid = atomic_long_read(&mm->context.id);
 
-	if (cpumask_any_but(cmask, cpuid) >= nr_cpu_ids) {
-		if (size == -1)
-			local_flush_tlb_all_asid(asid);
-		else
-			local_flush_tlb_range_asid(start, size, asid);
+		if (likely(local)) {
+			if (size == -1)
+				local_flush_tlb_all_asid(asid);
+			else
+				local_flush_tlb_range_asid(start, size, asid);
+		} else {
+			riscv_cpuid_to_hartid_mask(cmask, &hmask);
+			sbi_remote_sfence_vma_asid(cpumask_bits(&hmask),
+						   start, size, asid);
+		}
 	} else {
-		riscv_cpuid_to_hartid_mask(cmask, &hmask);
-		sbi_remote_sfence_vma_asid(cpumask_bits(&hmask),
-					   start, size, asid);
+		if (likely(local)) {
+			/*
+			 * FIXME: The non-ASID code switches to a global flush
+			 * once flushing more than a single page. It's made by
+			 * commit 6efb16b1d551 (RISC-V: Issue a tlb page flush
+			 * if possible).
+			 */
+			if (size <= PAGE_SIZE)
+				local_flush_tlb_page(start);
+			else
+				local_flush_tlb_all();
+		} else {
+			riscv_cpuid_to_hartid_mask(cmask, &hmask);
+			sbi_remote_sfence_vma(cpumask_bits(&hmask),
+					      start, size);
+		}
 	}
 
 	put_cpu();
@@ -69,28 +72,16 @@ static void __sbi_tlb_flush_range_asid(struct cpumask *cmask,
 
 void flush_tlb_mm(struct mm_struct *mm)
 {
-	if (static_branch_unlikely(&use_asid_allocator))
-		__sbi_tlb_flush_range_asid(mm_cpumask(mm), 0, -1,
-					   atomic_long_read(&mm->context.id));
-	else
-		__sbi_tlb_flush_range(mm_cpumask(mm), 0, -1);
+	__sbi_tlb_flush_range(mm, 0, -1);
 }
 
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
-	if (static_branch_unlikely(&use_asid_allocator))
-		__sbi_tlb_flush_range_asid(mm_cpumask(vma->vm_mm), addr, PAGE_SIZE,
-					   atomic_long_read(&vma->vm_mm->context.id));
-	else
-		__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), addr, PAGE_SIZE);
+	__sbi_tlb_flush_range(vma->vm_mm, addr, PAGE_SIZE);
 }
 
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end)
 {
-	if (static_branch_unlikely(&use_asid_allocator))
-		__sbi_tlb_flush_range_asid(mm_cpumask(vma->vm_mm), start, end - start,
-					   atomic_long_read(&vma->vm_mm->context.id));
-	else
-		__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), start, end - start);
+	__sbi_tlb_flush_range(vma->vm_mm, start, end - start);
 }
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
