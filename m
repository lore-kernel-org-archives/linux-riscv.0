Return-Path: <SRS0=Z8g5=BE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B27C433E1
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 01:01:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 011D820674
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 01:01:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QMeQ7nrV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwLTw4Fb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 011D820674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Aq6AJnBTuFYOSXI/QN4iFouCaZwwMf6ekihmHxTMZfU=; b=QMeQ7nrVjKZoiO8TebMayQsMYi
	0OJnobxILuFvr5h0YuEuxO1ifHr7B2CBBhfABxsTA1XXp/a0hffwVYOASmgSskKrryZhtkdKb6yqj
	cTfeiencZog/e3dFaEIPkkMlDQeuriYo4eD8crhjZJROqGWPJNNmO2yOk4ZB/qFkf4c1eVVofWMyM
	DY08CcjEI7e0n+QBFIFZ8ied3VfI9K2wyTLQPFCtcWPtBn4BaFKgN7h27Pr/i4xVEerXc8NvZv0nG
	hZO96VWNX7wIrDseq98GourhrcOVsiqFcODei9wFGgZK0eV2ARgamBI+0GK4WGUYiVXxhXIOM32yd
	L45qgEfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jz8Yl-0003nu-3s; Sat, 25 Jul 2020 01:01:07 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jz8Yi-0003nN-RU
 for linux-riscv@lists.infradead.org; Sat, 25 Jul 2020 01:01:05 +0000
Received: by mail-pf1-x442.google.com with SMTP id f185so1257737pfg.10
 for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2020 18:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RqfdT0iZfHl2g0qn8q8pqEPbfkgN0EeoAjSG+bhJsWM=;
 b=BwLTw4FbxSU927pXuNBAIQ/zdNnVr8ABcb1hYugeTjvBRQz75GA7I12kXAzqrx8DDg
 YV7VNEd9io8i6PLH0KBF5AjFHN9AF8CYiQkX8vqyzKOSB6SYStkcHZRyFsz0Ym5v2NDf
 MfS2FY+2zodBlmo5gkKdN+eVW91sjboR7QsX7qTOgQGRWQLeUuo1Osi9cCng/Bm9xIXb
 M8Cd7/C6Q/N7+6JIEmVKxCcTTxYeUgy8HD972pTpM2q9rfc1H/b1DMs0RXhpkeBzvem3
 xk4z3AykPin0qIvAT/DiyMNqkrwOT8gB8uOyoPPHZqmvITfeJl7Zd3Kh02qiNglUi36l
 zW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RqfdT0iZfHl2g0qn8q8pqEPbfkgN0EeoAjSG+bhJsWM=;
 b=lH5U3VeRPMc57Os267Af7sHIKWgD27w6bnvaZZUqRUcfOCyROCXtBPdLKbLtR6aluh
 5ZyUIOgKCsQicHbLnqqF5KCMaOyXl7ehw1ckWKWfCYkg0JjJYqiJroh9q4p5p3U87V8H
 1nLbyYLLuHLH5G/XOucX02JV+BetmAkVc7OyJnboihKOyP5+cK3yronh4c4C502O34Gh
 bd7hOiDZ2uf6DrH5gHhJhCXkKFVBnWH5VvEpfKfJu1mSsY3UFd9z8eABFMEHyKCp6QNM
 nFlHwOSm+NlzvMSdY5uVmw/JlFtQPUEbd8xZ5PPkqXsLFLt1XiqUbLweZFPcEayIhMbO
 YZFQ==
X-Gm-Message-State: AOAM533v9CEZsy8K75XyAXxX6s7SXM5nPJiQ4QbVGkBJC8dcrzjRpZel
 kfaIoBFUV9WkCx2q/px4Bd4=
X-Google-Smtp-Source: ABdhPJwIwSYwgF8/I5anvvdT5qNxsbMhiZWLMtmNB4W8VdwUCEpFISwzCSU0iSFsPoJarZHCBisOzQ==
X-Received: by 2002:aa7:860f:: with SMTP id p15mr11315893pfn.59.1595638860753; 
 Fri, 24 Jul 2020 18:01:00 -0700 (PDT)
Received: from localhost (g155.222-224-148.ppp.wakwak.ne.jp. [222.224.148.155])
 by smtp.gmail.com with ESMTPSA id kx3sm6886397pjb.32.2020.07.24.18.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 18:01:00 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] openrisc: Implement proper SMP tlb flushing
Date: Sat, 25 Jul 2020 10:00:47 +0900
Message-Id: <20200725010049.693421-1-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_210104_978450_6D1F671A 
X-CRM114-Status: GOOD (  15.70  )
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
Cc: Jonas Bonn <jonas@southpole.se>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@inria.fr>, openrisc@lists.librecores.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Up until now when flushing pages from the TLB on SMP OpenRISC was always
resorting to flush the entire TLB on all CPUs.  This patch adds the
mechanics for flushing specific ranges and pages based on the usage.

The function switch_mm is updated to account for cpu usage by updating
mm_struct's cpumask.  This is used in the SMP flush routines.

This mostly follows the riscv implementation.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 arch/openrisc/kernel/smp.c | 85 ++++++++++++++++++++++++++++++++++----
 arch/openrisc/mm/tlb.c     | 17 +++++---
 2 files changed, 89 insertions(+), 13 deletions(-)

diff --git a/arch/openrisc/kernel/smp.c b/arch/openrisc/kernel/smp.c
index bd1e660bbc89..29c82ef2e207 100644
--- a/arch/openrisc/kernel/smp.c
+++ b/arch/openrisc/kernel/smp.c
@@ -219,30 +219,99 @@ static inline void ipi_flush_tlb_all(void *ignored)
 	local_flush_tlb_all();
 }
 
+static inline void ipi_flush_tlb_mm(void *info)
+{
+	struct mm_struct *mm = (struct mm_struct *)info;
+
+	local_flush_tlb_mm(mm);
+}
+
+static void smp_flush_tlb_mm(struct cpumask *cmask, struct mm_struct *mm)
+{
+	unsigned int cpuid;
+
+	if (cpumask_empty(cmask))
+		return;
+
+	cpuid = get_cpu();
+
+	if (cpumask_any_but(cmask, cpuid) >= nr_cpu_ids) {
+		/* local cpu is the only cpu present in cpumask */
+		local_flush_tlb_mm(mm);
+	} else {
+		on_each_cpu_mask(cmask, ipi_flush_tlb_mm, mm, 1);
+	}
+	put_cpu();
+}
+
+struct flush_tlb_data {
+	unsigned long addr1;
+	unsigned long addr2;
+};
+
+static inline void ipi_flush_tlb_page(void *info)
+{
+	struct flush_tlb_data *fd = (struct flush_tlb_data *)info;
+
+	local_flush_tlb_page(NULL, fd->addr1);
+}
+
+static inline void ipi_flush_tlb_range(void *info)
+{
+	struct flush_tlb_data *fd = (struct flush_tlb_data *)info;
+
+	local_flush_tlb_range(NULL, fd->addr1, fd->addr2);
+}
+
+static void smp_flush_tlb_range(struct cpumask *cmask, unsigned long start,
+				unsigned long end)
+{
+	unsigned int cpuid;
+
+	if (cpumask_empty(cmask))
+		return;
+
+	cpuid = get_cpu();
+
+	if (cpumask_any_but(cmask, cpuid) >= nr_cpu_ids) {
+		/* local cpu is the only cpu present in cpumask */
+		if ((end - start) <= PAGE_SIZE)
+			local_flush_tlb_page(NULL, start);
+		else
+			local_flush_tlb_range(NULL, start, end);
+	} else {
+		struct flush_tlb_data fd;
+
+		fd.addr1 = start;
+		fd.addr2 = end;
+
+		if ((end - start) <= PAGE_SIZE)
+			on_each_cpu_mask(cmask, ipi_flush_tlb_page, &fd, 1);
+		else
+			on_each_cpu_mask(cmask, ipi_flush_tlb_range, &fd, 1);
+	}
+	put_cpu();
+}
+
 void flush_tlb_all(void)
 {
 	on_each_cpu(ipi_flush_tlb_all, NULL, 1);
 }
 
-/*
- * FIXME: implement proper functionality instead of flush_tlb_all.
- * *But*, as things currently stands, the local_tlb_flush_* functions will
- * all boil down to local_tlb_flush_all anyway.
- */
 void flush_tlb_mm(struct mm_struct *mm)
 {
-	on_each_cpu(ipi_flush_tlb_all, NULL, 1);
+	smp_flush_tlb_mm(mm_cpumask(mm), mm);
 }
 
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long uaddr)
 {
-	on_each_cpu(ipi_flush_tlb_all, NULL, 1);
+	smp_flush_tlb_range(mm_cpumask(vma->vm_mm), uaddr, uaddr + PAGE_SIZE);
 }
 
 void flush_tlb_range(struct vm_area_struct *vma,
 		     unsigned long start, unsigned long end)
 {
-	on_each_cpu(ipi_flush_tlb_all, NULL, 1);
+	smp_flush_tlb_range(mm_cpumask(vma->vm_mm), start, end);
 }
 
 /* Instruction cache invalidate - performed on each cpu */
diff --git a/arch/openrisc/mm/tlb.c b/arch/openrisc/mm/tlb.c
index 4b680aed8f5f..2b6feabf6381 100644
--- a/arch/openrisc/mm/tlb.c
+++ b/arch/openrisc/mm/tlb.c
@@ -137,21 +137,28 @@ void local_flush_tlb_mm(struct mm_struct *mm)
 void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	       struct task_struct *next_tsk)
 {
+	unsigned int cpu;
+
+	if (unlikely(prev == next))
+		return;
+
+	cpu = smp_processor_id();
+
+	cpumask_clear_cpu(cpu, mm_cpumask(prev));
+	cpumask_set_cpu(cpu, mm_cpumask(next));
+
 	/* remember the pgd for the fault handlers
 	 * this is similar to the pgd register in some other CPU's.
 	 * we need our own copy of it because current and active_mm
 	 * might be invalid at points where we still need to derefer
 	 * the pgd.
 	 */
-	current_pgd[smp_processor_id()] = next->pgd;
+	current_pgd[cpu] = next->pgd;
 
 	/* We don't have context support implemented, so flush all
 	 * entries belonging to previous map
 	 */
-
-	if (prev != next)
-		local_flush_tlb_mm(prev);
-
+	local_flush_tlb_mm(prev);
 }
 
 /*
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
