Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53485C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:39:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2416E2071E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:39:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zUsvMys7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKNYgHPl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2416E2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hWfIF5yIPCeRzNMn0CVXdHPKUw9a5giZMNUFUX3Q1K4=; b=zUsvMys71KwLKTzaSCZIZrisP
	CuDNmpbEs7EITXzrEL4fDzK6R55nYhbqS/gydtmR7o8fH7qZKIHhj0nYz7lUVvB+tPLi5/xaRWmTN
	ZEmbDFBS9mABzARjcQ3xL66ION2lVGN27Zzv7TvJdBSCSON8+MdCK5Usmac8Lwt3OZB3sMpCNZQaN
	8vaNeRVDg0GWx1qR29rzslzzcq+pSya8wfvK9hL+XI6XyV5XWt1HUnvkG2SnhavCpHz595hFz+Qm0
	f6Q+YSvIPGLcfwlKsGf+2PCcOk55fzS3S6IUod8LXfFxLi+o3UaEX7g0jf4d0gznL5PsstGPR2ZNB
	tMsadOc7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAdr0-0000Ay-3X; Tue, 25 Aug 2020 18:39:30 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAdqw-000084-Cd
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 18:39:27 +0000
Received: by mail-lj1-x241.google.com with SMTP id w25so14963642ljo.12
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 11:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PBjIV4Xi7OSluawjjYPWnIUBpYn/lgzKEqLc0lpO7Rk=;
 b=AKNYgHPlC2/OM9alLdGIliqtd3y9m1Pr5EaLW00Zpdvt+dbSlNRzaGkGkzIN4Am6/b
 jQQ4nqOp1JmnrMuYnsdUL3h9zxCjp5YFO1xVhFx8X0jsalE/s5Hx0HLvU0pLx2qEbOmF
 z9QcjMzzyxqZN6Qh8DBcAUfqS+mnyEPAjyFt1kN5Tz1JYuJpyLeAEN+OzaSMx3L+cSuM
 v/fT5yddkTi4LsJYHe+scTdGydEySy6xgT+pyJDQuuojETUxDVGFpT/0XuX8JzzPHZbI
 KT+K+z3zrBhRvv91wIX1hPH/FOUW0kpXSBPj4Eir0Y8M6+6guPGspZajHAXGgoMoWf5E
 49/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PBjIV4Xi7OSluawjjYPWnIUBpYn/lgzKEqLc0lpO7Rk=;
 b=W3wAEo/1loCReUM85lc72Fu5AWZ6KDJ74yHvi0GFmu0eDFjohu2sqR0/MF9UAEV1GK
 KOtIkxX0/SqHywdrXytwJqC9g31IgeXO1I0sw1jrFZp5YU7Wp/zJrz5qOuhCrwyIGQPA
 wfFqJGPbELcG036WG+FpXB+3XWuiyUWzkR77sfYEKnBYhzkns3TEITkFrHTBbpxoKmx7
 XZuu6wKO3E9SLLMTRFfFkn+Qb2Qaz2Om8rd3xgnOCQNQcSdPRpdQFjWpqPj6CrxH7qNY
 lGReIWUzVjw0MGyDYhTP8orsL4SGhVhs8KNfoxxz3wSPQx78MiApPhCi3imjPus98QEW
 eNsg==
X-Gm-Message-State: AOAM5321bEuDwDSCmvAXDfCBcW5kbqhV7aqyU339+cYxYEjH2mfBWr5h
 cwHm1mNeWjFJMUwMJx5Va/oD/y08CK6e1g==
X-Google-Smtp-Source: ABdhPJydiUPfBVkVXE8zx/1lzoRucQivt6QuxE+l12zyuWtuX5IYmM8jgzoJKXs8yaqXSTOiG4ulyQ==
X-Received: by 2002:a05:651c:204f:: with SMTP id
 t15mr5896619ljo.308.1598380764505; 
 Tue, 25 Aug 2020 11:39:24 -0700 (PDT)
Received: from nero.bb.dnainternet.fi
 (dyn9cmyyyyyyyyyyyyyft-3.rev.dnainternet.fi. [2001:14ba:2fa:2500::9])
 by smtp.gmail.com with ESMTPSA id e14sm3187120lfd.19.2020.08.25.11.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 11:39:23 -0700 (PDT)
From: Pekka Enberg <penberg@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 3/8] riscv/mm/fault: Move vmalloc fault handling to
 vmalloc_fault()
Date: Tue, 25 Aug 2020 21:39:02 +0300
Message-Id: <20200825183907.275950-4-penberg@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200825183907.275950-1-penberg@gmail.com>
References: <20200825183907.275950-1-penberg@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_143926_473232_F3C9BEDA 
X-CRM114-Status: GOOD (  20.30  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Pekka Enberg <penberg@kernel.org>, palmer@dabbelt.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Pekka Enberg <penberg@kernel.org>

This patch moves the vmalloc fault handling in do_page_fault() to
vmalloc_fault() function and converts gotos to calls to the new
function.
---
 arch/riscv/mm/fault.c | 164 +++++++++++++++++++++---------------------
 1 file changed, 82 insertions(+), 82 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index ac9a99255365..460ea1d6c24e 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -53,6 +53,84 @@ static inline void bad_area(struct pt_regs *regs, struct mm_struct *mm, int code
 	no_context(regs, addr);
 }
 
+static void inline vmalloc_fault(struct pt_regs *regs, int code, unsigned long addr)
+{
+	pgd_t *pgd, *pgd_k;
+	pud_t *pud, *pud_k;
+	p4d_t *p4d, *p4d_k;
+	pmd_t *pmd, *pmd_k;
+	pte_t *pte_k;
+	int index;
+
+	/* User mode accesses just cause a SIGSEGV */
+	if (user_mode(regs))
+		return do_trap(regs, SIGSEGV, code, addr);
+
+	/*
+	 * Synchronize this task's top level page-table
+	 * with the 'reference' page table.
+	 *
+	 * Do _not_ use "tsk->active_mm->pgd" here.
+	 * We might be inside an interrupt in the middle
+	 * of a task switch.
+	 */
+	index = pgd_index(addr);
+	pgd = (pgd_t *)pfn_to_virt(csr_read(CSR_SATP)) + index;
+	pgd_k = init_mm.pgd + index;
+
+	if (!pgd_present(*pgd_k)) {
+		no_context(regs, addr);
+		return;
+	}
+	set_pgd(pgd, *pgd_k);
+
+	p4d = p4d_offset(pgd, addr);
+	p4d_k = p4d_offset(pgd_k, addr);
+	if (!p4d_present(*p4d_k)) {
+		no_context(regs, addr);
+		return;
+	}
+
+	pud = pud_offset(p4d, addr);
+	pud_k = pud_offset(p4d_k, addr);
+	if (!pud_present(*pud_k)) {
+		no_context(regs, addr);
+		return;
+	}
+
+	/*
+	 * Since the vmalloc area is global, it is unnecessary
+	 * to copy individual PTEs
+	 */
+	pmd = pmd_offset(pud, addr);
+	pmd_k = pmd_offset(pud_k, addr);
+	if (!pmd_present(*pmd_k)) {
+		no_context(regs, addr);
+		return;
+	}
+	set_pmd(pmd, *pmd_k);
+
+	/*
+	 * Make sure the actual PTE exists as well to
+	 * catch kernel vmalloc-area accesses to non-mapped
+	 * addresses. If we don't do this, this will just
+	 * silently loop forever.
+	 */
+	pte_k = pte_offset_kernel(pmd_k, addr);
+	if (!pte_present(*pte_k)) {
+		no_context(regs, addr);
+		return;
+	}
+
+	/*
+	 * The kernel assumes that TLBs don't cache invalid
+	 * entries, but in RISC-V, SFENCE.VMA specifies an
+	 * ordering constraint, not a cache flush; it is
+	 * necessary even after writing invalid entries.
+	 */
+	local_flush_tlb_page(addr);
+}
+
 /*
  * This routine handles page faults.  It determines the address and the
  * problem, and then passes it off to one of the appropriate routines.
@@ -82,8 +160,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	 * only copy the information from the master page table,
 	 * nothing more.
 	 */
-	if (unlikely((addr >= VMALLOC_START) && (addr <= VMALLOC_END)))
-		goto vmalloc_fault;
+	if (unlikely((addr >= VMALLOC_START) && (addr <= VMALLOC_END))) {
+		vmalloc_fault(regs, code, addr);
+		return;
+	}
 
 	/* Enable interrupts if they were enabled in the parent context. */
 	if (likely(regs->status & SR_PIE))
@@ -211,84 +291,4 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	}
 	do_trap(regs, SIGBUS, BUS_ADRERR, addr);
 	return;
-
-vmalloc_fault:
-	{
-		pgd_t *pgd, *pgd_k;
-		pud_t *pud, *pud_k;
-		p4d_t *p4d, *p4d_k;
-		pmd_t *pmd, *pmd_k;
-		pte_t *pte_k;
-		int index;
-
-		/* User mode accesses just cause a SIGSEGV */
-		if (user_mode(regs))
-			return do_trap(regs, SIGSEGV, code, addr);
-
-		/*
-		 * Synchronize this task's top level page-table
-		 * with the 'reference' page table.
-		 *
-		 * Do _not_ use "tsk->active_mm->pgd" here.
-		 * We might be inside an interrupt in the middle
-		 * of a task switch.
-		 */
-		index = pgd_index(addr);
-		pgd = (pgd_t *)pfn_to_virt(csr_read(CSR_SATP)) + index;
-		pgd_k = init_mm.pgd + index;
-
-		if (!pgd_present(*pgd_k)) {
-			no_context(regs, addr);
-			return;
-		}
-		set_pgd(pgd, *pgd_k);
-
-		p4d = p4d_offset(pgd, addr);
-		p4d_k = p4d_offset(pgd_k, addr);
-		if (!p4d_present(*p4d_k)) {
-			no_context(regs, addr);
-			return;
-		}
-
-		pud = pud_offset(p4d, addr);
-		pud_k = pud_offset(p4d_k, addr);
-		if (!pud_present(*pud_k)) {
-			no_context(regs, addr);
-			return;
-		}
-
-		/*
-		 * Since the vmalloc area is global, it is unnecessary
-		 * to copy individual PTEs
-		 */
-		pmd = pmd_offset(pud, addr);
-		pmd_k = pmd_offset(pud_k, addr);
-		if (!pmd_present(*pmd_k)) {
-			no_context(regs, addr);
-			return;
-		}
-		set_pmd(pmd, *pmd_k);
-
-		/*
-		 * Make sure the actual PTE exists as well to
-		 * catch kernel vmalloc-area accesses to non-mapped
-		 * addresses. If we don't do this, this will just
-		 * silently loop forever.
-		 */
-		pte_k = pte_offset_kernel(pmd_k, addr);
-		if (!pte_present(*pte_k)) {
-			no_context(regs, addr);
-			return;
-		}
-
-		/*
-		 * The kernel assumes that TLBs don't cache invalid
-		 * entries, but in RISC-V, SFENCE.VMA specifies an
-		 * ordering constraint, not a cache flush; it is
-		 * necessary even after writing invalid entries.
-		 */
-		local_flush_tlb_page(addr);
-
-		return;
-	}
 }
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
