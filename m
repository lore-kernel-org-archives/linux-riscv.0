Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B05C433E4
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:39:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 348632076C
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:39:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JEtFL9ZC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oBaTM5kC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 348632076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+UFvyrlTpqPkN8hSBxTYHrzOiNowFMwFVm1v2HiR39E=; b=JEtFL9ZCSA7s1RaYgp0wgUZ2d
	2d/8KfCi50qS56KwS2AyjCC8d2nkrfCxJS9IrUjB8bUs8MRri0xRQ1rDozfAJKOkkWviNbbERT7As
	nHfmSv8KRUg+4zWO9g9P5qS9cLyA/1nKrwuQT4IZHAfZkiiNCzu7kdgMC4PRQ5NgGFyYYVsqHuaP9
	G6h6lPiGeZPF0Bq+lA91JZon/U9Id8WFCraT3vAUb3ZcTjxglDB+VNwcpmgdtwC2qVYd1ep2SlXAL
	/hzXuIKKKaO9oNtEKHCK5fzfXgM78RtMFP5p90Aeh8Vxxa88DQj69y8AncOq3Dv2L4zCVkRazD9iH
	LEM5/o1TA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAdqz-0000AY-9H; Tue, 25 Aug 2020 18:39:29 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAdqv-00007n-ET
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 18:39:26 +0000
Received: by mail-lf1-x142.google.com with SMTP id u25so939484lfm.10
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 11:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BTnNQUIjf1Y/M0SWVRJVgAJaBwVyu/2kiQcVxsmwMWw=;
 b=oBaTM5kCHQkdh5ZFlb85fnduq3BXM0YIz+F3TYUbFAktTjSSvWhgo+Y0OzgK3cPije
 1rGdLVmW2Pe7FKn41F8+allYlJyEIjqKxIV78FnwKixUE2i7XXF4cmNze3cBDYvSSK0A
 fTdZsOAmu7/aLEkLXWJ8idRpofFcGSABUmPCfAnhhqO39OdUb9qX8aW5jDhyoNnQm/Nj
 i4TLcmQY8V5QmkU83bLAJNOHQsf6EOLZt7MVSGR4bXEXGUmdfDbraMR4kVoF7LPohqlC
 beXvKpHW953vSr1mlt1RWPPV7R5EzevsdR3Xn7uxV4fB/2Ujj8ZzgF9WvkkYjP8ozq8E
 1K1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BTnNQUIjf1Y/M0SWVRJVgAJaBwVyu/2kiQcVxsmwMWw=;
 b=Z4gMbPcqoK8FQqBx3C3D9jRMGI1Eb1c/P47185cgYgCW67b4JKDaRrc9H0Yvb3HxHp
 ttP0UkL0pv1oX66JHzwuoGkSFU0MrpWJeca/FIMp2N2Ggs/70Q6P60R2BBEzYYJqxHtk
 1OSHPMHz/HcyDN6ELi28Fh1IqJ+pnD82Y/UyY1SH/6lg0ZthYR4Iz4vvalgtTcn7FmkZ
 TdmBtd96gZ0PM9UumQ5tqsxXP/SYy1R11r/Pmo44oqyl7U0OicG4+ZgdERsNJwxd13e1
 76/Ly0ATBw8YPEZOCbT3P0jwtfHbWoVAvzyrjJNIJ3+g8zkKMWF3Eifw2tg/C+zBLA6H
 NjMA==
X-Gm-Message-State: AOAM5321K7gJ8CxUhaIjiuF68HTHnjoClYPJLkZOpcrulJYP7/en/sI6
 4zM6cdTzFtBDBA4kjhuvtoeAz8UAWT/k5g==
X-Google-Smtp-Source: ABdhPJwKcg3JfiGNNUzRuBPSbyF7ZZZdZODrCI7x8CE1yGU0JcurkCwfeprM2CUxeA3/Yikf1+W+6Q==
X-Received: by 2002:a19:306:: with SMTP id 6mr5541397lfd.214.1598380762747;
 Tue, 25 Aug 2020 11:39:22 -0700 (PDT)
Received: from nero.bb.dnainternet.fi
 (dyn9cmyyyyyyyyyyyyyft-3.rev.dnainternet.fi. [2001:14ba:2fa:2500::9])
 by smtp.gmail.com with ESMTPSA id e14sm3187120lfd.19.2020.08.25.11.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 11:39:22 -0700 (PDT)
From: Pekka Enberg <penberg@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 1/8] riscv/mm/fault: Move no context handling to no_context()
Date: Tue, 25 Aug 2020 21:39:00 +0300
Message-Id: <20200825183907.275950-2-penberg@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200825183907.275950-1-penberg@gmail.com>
References: <20200825183907.275950-1-penberg@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_143925_585948_5CFB6680 
X-CRM114-Status: GOOD (  16.69  )
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

This patch moves the no context handling in do_page_fault() to
no_context() function and converts gotos to calls to the new function.
---
 arch/riscv/mm/fault.c | 83 +++++++++++++++++++++++++++----------------
 1 file changed, 52 insertions(+), 31 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index f5c2e4a249eb..1612552478c5 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -19,6 +19,24 @@
 
 #include "../kernel/head.h"
 
+static inline void no_context(struct pt_regs *regs, unsigned long addr)
+{
+	/* Are we prepared to handle this kernel fault? */
+	if (fixup_exception(regs))
+		return;
+
+	/*
+	 * Oops. The kernel tried to access some bad page. We'll have to
+	 * terminate things with extreme prejudice.
+	 */
+	bust_spinlocks(1);
+	pr_alert("Unable to handle kernel %s at virtual address " REG_FMT "\n",
+		(addr < PAGE_SIZE) ? "NULL pointer dereference" :
+		"paging request", addr);
+	die(regs, "Oops");
+	do_exit(SIGKILL);
+}
+
 /*
  * This routine handles page faults.  It determines the address and the
  * problem, and then passes it off to one of the appropriate routines.
@@ -59,8 +77,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	 * If we're in an interrupt, have no user context, or are running
 	 * in an atomic region, then we must not take the fault.
 	 */
-	if (unlikely(faulthandler_disabled() || !mm))
-		goto no_context;
+	if (unlikely(faulthandler_disabled() || !mm)) {
+		no_context(regs, addr);
+		return;
+	}
 
 	if (user_mode(regs))
 		flags |= FAULT_FLAG_USER;
@@ -153,21 +173,8 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 		return;
 	}
 
-no_context:
-	/* Are we prepared to handle this kernel fault? */
-	if (fixup_exception(regs))
-		return;
-
-	/*
-	 * Oops. The kernel tried to access some bad page. We'll have to
-	 * terminate things with extreme prejudice.
-	 */
-	bust_spinlocks(1);
-	pr_alert("Unable to handle kernel %s at virtual address " REG_FMT "\n",
-		(addr < PAGE_SIZE) ? "NULL pointer dereference" :
-		"paging request", addr);
-	die(regs, "Oops");
-	do_exit(SIGKILL);
+	no_context(regs, addr);
+	return;
 
 	/*
 	 * We ran out of memory, call the OOM killer, and return the userspace
@@ -175,16 +182,20 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	 */
 out_of_memory:
 	mmap_read_unlock(mm);
-	if (!user_mode(regs))
-		goto no_context;
+	if (!user_mode(regs)) {
+		no_context(regs, addr);
+		return;
+	}
 	pagefault_out_of_memory();
 	return;
 
 do_sigbus:
 	mmap_read_unlock(mm);
 	/* Kernel mode? Handle exceptions or die */
-	if (!user_mode(regs))
-		goto no_context;
+	if (!user_mode(regs)) {
+		no_context(regs, addr);
+		return;
+	}
 	do_trap(regs, SIGBUS, BUS_ADRERR, addr);
 	return;
 
@@ -213,19 +224,25 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 		pgd = (pgd_t *)pfn_to_virt(csr_read(CSR_SATP)) + index;
 		pgd_k = init_mm.pgd + index;
 
-		if (!pgd_present(*pgd_k))
-			goto no_context;
+		if (!pgd_present(*pgd_k)) {
+			no_context(regs, addr);
+			return;
+		}
 		set_pgd(pgd, *pgd_k);
 
 		p4d = p4d_offset(pgd, addr);
 		p4d_k = p4d_offset(pgd_k, addr);
-		if (!p4d_present(*p4d_k))
-			goto no_context;
+		if (!p4d_present(*p4d_k)) {
+			no_context(regs, addr);
+			return;
+		}
 
 		pud = pud_offset(p4d, addr);
 		pud_k = pud_offset(p4d_k, addr);
-		if (!pud_present(*pud_k))
-			goto no_context;
+		if (!pud_present(*pud_k)) {
+			no_context(regs, addr);
+			return;
+		}
 
 		/*
 		 * Since the vmalloc area is global, it is unnecessary
@@ -233,8 +250,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 		 */
 		pmd = pmd_offset(pud, addr);
 		pmd_k = pmd_offset(pud_k, addr);
-		if (!pmd_present(*pmd_k))
-			goto no_context;
+		if (!pmd_present(*pmd_k)) {
+			no_context(regs, addr);
+			return;
+		}
 		set_pmd(pmd, *pmd_k);
 
 		/*
@@ -244,8 +263,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 		 * silently loop forever.
 		 */
 		pte_k = pte_offset_kernel(pmd_k, addr);
-		if (!pte_present(*pte_k))
-			goto no_context;
+		if (!pte_present(*pte_k)) {
+			no_context(regs, addr);
+			return;
+		}
 
 		/*
 		 * The kernel assumes that TLBs don't cache invalid
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
