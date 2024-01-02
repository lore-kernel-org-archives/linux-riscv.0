Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59987C4725D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 22:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mo9gJJi7Z+yz2KjdlT3YSJtt7HxAnmBA43+v9ViQ0vc=; b=WeRiMBtrTny233
	BeGm6xQMBHRlg5bEN9PcP0GKAvmz5uRMw3v+Da9ZjJoRW1or5FrTst3GbuG5vH1OXc1bqFdw9ar8M
	E4CgZGu6oR8xX1EBSy3xL4/FWqs4RAlHrWu3gnKSH2uUEs9l2RHM7W8MJ2epggMcKtxFKzStjuB+S
	/0J4Zsb/CjlQnZPFOpogLXVVooFHooSXHXkg4irXts4LCHranIsh52h7CzNp+KTAU581N36VmL21R
	4OpVQJ8gZUeDz3NKBbfqWKvfuRReL7nEf5lig3AJ7D0BNHQn42NNgWIuxxehU4wOIviXvn7OS5dMz
	sXOtQCq2bjujv78lqSmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpW-0098Sa-1w;
	Tue, 02 Jan 2024 22:01:46 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpR-0098Oo-1V
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 22:01:43 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5ce2aada130so1632181a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 14:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704232900; x=1704837700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XA8TOHyyeKTc95PFXJRpYatfRR5oPHMuobG+iziT3HE=;
        b=bid0IVD1UhOWLJjZNRJ2sv9L3VbbzQR6I483xDi0pYPPzzvvLg0NtNx/2T8O42Ryjp
         e6ZBH7Xg1tJS+7EMGMW4TlgRTrV4dObEt/8gDD9IMwJh57G+Zh4HL0AhMabizFD//slk
         ou5pz3gAwpJf/aTrGEZ3S9lavQux1ov4Cn6fdsUpvv60BcezTG8lu4vMLkxB/awVTer5
         zhJpd6zW2CihF/gy+lRCQwgeVBHaRhO7pQL9uU+DuI75GIM63zUlv2pkA/BzFzAXraQB
         TRp5yn2lengE6zjNpTbGG7WaY7oUgKs+hYoJTUMuULz8sylYRV0a2VouFRyT0ftXrTF3
         GYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704232900; x=1704837700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XA8TOHyyeKTc95PFXJRpYatfRR5oPHMuobG+iziT3HE=;
        b=a+AXH19U1P7wRodaamzfUDZJVtH7vzot+flJ9x6SrChJyEiaKpYFn9tmL3WbvYKhXg
         trjVzgb5rcS5HXcffa7yE6lFXA44EGwmp8af6NavsSxL3stIqTT2hFHshZoirDKcCUxy
         2MxgMN43hl83yweO63ogyUo52gU552c+DBQQJCI3sOvve//eCdYD0VlIH4ly7uubAvfx
         DHKBf8Ni1Ga3jNKJ+XOUR1LGgJ3ccYBDF4JI9GFcin6BG8ndFBruFQTxZAXeTBoQFWa+
         Lwqah+LdsfBDAVWtdD99+Nj+fo4x8Qyin8t0YP7wjXqDKaW985kuYBjdm4pmQUx3UY3K
         Ye+A==
X-Gm-Message-State: AOJu0YwwCnmiF9BBhrsgvLRnsCnFzY07HncbRknj/Z8H8cYjDj0AaHYp
	B8CB0SNPjbz4LxxULXM69m/D+asnvYKRrioIYEgpPBG4ZsI=
X-Google-Smtp-Source: AGHT+IGXoPWHR5PafwwvCfsK03qnPYeIgtaQPhGwO0vZvHcHemW0jssRCcGF3figFCmbRtQxmnrgGQ==
X-Received: by 2002:a17:90a:974c:b0:28c:accc:b1db with SMTP id i12-20020a17090a974c00b0028cacccb1dbmr2272863pjw.44.1704232900428;
        Tue, 02 Jan 2024 14:01:40 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id r59-20020a17090a43c100b0028ce507cd7dsm101724pjg.55.2024.01.02.14.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 14:01:40 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 03/12] riscv: mm: Broadcast kernel TLB flushes only when needed
Date: Tue,  2 Jan 2024 14:00:40 -0800
Message-ID: <20240102220134.3229156-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240102220134.3229156-1-samuel.holland@sifive.com>
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_140141_505585_2C630689 
X-CRM114-Status: GOOD (  13.98  )
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

__flush_tlb_range() avoids broadcasting TLB flushes when an mm context
is only active on the local CPU. Apply this same optimization to TLB
flushes of kernel memory when only one CPU is online. This check can be
constant-folded when SMP is disabled.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v4:
 - New patch for v4

 arch/riscv/mm/tlbflush.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 09b03bf71e6a..2f18fe6fc4f3 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -98,27 +98,23 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 {
 	const struct cpumask *cmask;
 	unsigned long asid = FLUSH_TLB_NO_ASID;
-	bool broadcast;
+	unsigned int cpu;
 
 	if (mm) {
-		unsigned int cpuid;
-
 		cmask = mm_cpumask(mm);
 		if (cpumask_empty(cmask))
 			return;
 
-		cpuid = get_cpu();
-		/* check if the tlbflush needs to be sent to other CPUs */
-		broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
-
 		if (static_branch_unlikely(&use_asid_allocator))
 			asid = atomic_long_read(&mm->context.id) & asid_mask;
 	} else {
 		cmask = cpu_online_mask;
-		broadcast = true;
 	}
 
-	if (!broadcast) {
+	cpu = get_cpu();
+
+	/* Check if the TLB flush needs to be sent to other CPUs. */
+	if (cpumask_any_but(cmask, cpu) >= nr_cpu_ids) {
 		local_flush_tlb_range_asid(start, size, stride, asid);
 	} else if (riscv_use_sbi_for_rfence()) {
 		sbi_remote_sfence_vma_asid(cmask, start, size, asid);
@@ -132,8 +128,7 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 		on_each_cpu_mask(cmask, __ipi_flush_tlb_range_asid, &ftd, 1);
 	}
 
-	if (mm)
-		put_cpu();
+	put_cpu();
 }
 
 void flush_tlb_mm(struct mm_struct *mm)
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
