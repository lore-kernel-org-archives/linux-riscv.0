Return-Path: <SRS0=E47g=33=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F59C352A2
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2020 09:52:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC3B320726
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2020 09:52:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DpdElp/y";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="g+dE/lA7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC3B320726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=62RfhKAR/Ri4okXqm018bf0oko/VlUMmOmgrha7NFJc=; b=DpdElp/yfSHMX1
	Fv5OmC1HWIRgDkla8KZr7TMaCGHGT/fUYH/gkvhedUb9rjsdyUgXQljAwiPh0bXevmNU3sPHScKTy
	vzb95WJFpXLnuTyLY6IPdPUyrEkCQjYybp6zp+zMn1SMz0gghqJrZBkTdt7C+tWSQgT118ijh/TBz
	MOUpILRnpQG9VyIOeaeEr9MHhZUS21E408Yq6Ouw+oBjF19m+I8m70lclCnwyMZ9rA2Eb2PpWgeh1
	oTFT5nINEVMKUt+uWYWJNGtx0rSx8fpawgr90grsO9n5mHVZ0ABwBzr+5wX7xMNEj0KZck/uZZfSE
	2466JbGnvkppvUM2FYCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j00Jk-0002ua-Oc; Fri, 07 Feb 2020 09:52:56 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j00Ji-0002sm-3O
 for linux-riscv@lists.infradead.org; Fri, 07 Feb 2020 09:52:55 +0000
Received: by mail-pl1-x643.google.com with SMTP id y1so784516plp.7
 for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2020 01:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=62RfhKAR/Ri4okXqm018bf0oko/VlUMmOmgrha7NFJc=;
 b=g+dE/lA71/7lIVK3CjQgSD3qoczW6hh85KWVkYh6PmYLHAZRZpwNA08GJ9z1uqakRe
 SGNXQtG4e79a71zHf/jYu8DFoZotBKdogZsY4pgMg4GGxUsAEBtbuCy4UetRoxw9/MD9
 UG1AUYjs+z0DcAnFfZSD3Jbp+va3NKSgbC3q4BhURcxvi8iuyNJ0KarQ7v7emiyexZfd
 pjKJb48Wf3bbWl42+QV2b+GrQMbRtO2YSiRtz3+i5nyUIWmv5P5eUjbuA0Zf6w23TyD6
 LodLXS0ZIw7aM1/QIkeXp8zXmfQ9A7Fthpe50K1S0C1O9GJNLv4B+qVzDWTGAeh9pf+y
 3paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=62RfhKAR/Ri4okXqm018bf0oko/VlUMmOmgrha7NFJc=;
 b=Zd45kyQ+3+aaQiGeKKWNcCL3yOUg/fg1AvST4GhHIrG5AsCSFEb3OkG+aOPAs5whB/
 3qw6hSxds3BVbl95jUr+Zl2jrePwO15sbTJur/TAs7q5dIb+4h9fnlIVfmB8XM2J/ZOT
 vHHZewzk4nzK98YkmReXjNkGdo72rH1uQU0UJDf4Z4y48dJeJYtfH+qgvB88yledHBIi
 c9BedPwSZg98RyYgBWgnRcqJIYptXv8jocmSYO/fB3Danvk0Zmgv/rVQEAhPHJcHblOt
 1ZoSVx9H38NqHaPfNzFB7BX97I6zLYH/Gf3YNmHAqWCf8+xoS3GwlZaCvHAXHhkLsVef
 wBbg==
X-Gm-Message-State: APjAAAW7CEJmvUVgDIIMJnpw9Ty/8leKRdt1hAbWmKY4Z2mbFOOxHwzo
 ZkH2Lr2dR8xE10TfNrSoC527W5dtPEU=
X-Google-Smtp-Source: APXvYqyEqxTbUYM7DH8aCdJhHthU3VF26dL8ropAoBOTPzxtNpmqZwz3S31FktC6fcgH3q3mlW/eeQ==
X-Received: by 2002:a17:90a:2ec7:: with SMTP id
 h7mr2885268pjs.107.1581069173488; 
 Fri, 07 Feb 2020 01:52:53 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id s23sm2060934pjq.17.2020.02.07.01.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 01:52:53 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: allocate a complete page size for each page table
Date: Fri,  7 Feb 2020 17:52:44 +0800
Message-Id: <20200207095245.21955-2-zong.li@sifive.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207095245.21955-1-zong.li@sifive.com>
References: <20200207095245.21955-1-zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_015254_142405_3B279618 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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
Cc: Zong Li <zong.li@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Each page table should be created by allocating a complete page size
for it. Otherwise, the content of the page table would be corrupted
somewhere through memory allocation which allocates the memory at the
middle of the page table for other use.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/mm/kasan_init.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index f0cc86040587..f8eaf7e73a23 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -46,29 +46,34 @@ asmlinkage void __init kasan_early_init(void)
 
 static void __init populate(void *start, void *end)
 {
-	unsigned long i;
+	unsigned long i, offset;
 	unsigned long vaddr = (unsigned long)start & PAGE_MASK;
 	unsigned long vend = PAGE_ALIGN((unsigned long)end);
 	unsigned long n_pages = (vend - vaddr) / PAGE_SIZE;
+	unsigned long n_ptes =
+	    ((n_pages + PTRS_PER_PTE) & -PTRS_PER_PTE) / PTRS_PER_PTE;
 	unsigned long n_pmds =
-		(n_pages % PTRS_PER_PTE) ? n_pages / PTRS_PER_PTE + 1 :
-						n_pages / PTRS_PER_PTE;
+	    ((n_ptes + PTRS_PER_PMD) & -PTRS_PER_PMD) / PTRS_PER_PMD;
+
+	pte_t *pte =
+	    memblock_alloc(n_ptes * PTRS_PER_PTE * sizeof(pte_t), PAGE_SIZE);
+	pmd_t *pmd =
+	    memblock_alloc(n_pmds * PTRS_PER_PMD * sizeof(pmd_t), PAGE_SIZE);
 	pgd_t *pgd = pgd_offset_k(vaddr);
-	pmd_t *pmd = memblock_alloc(n_pmds * sizeof(pmd_t), PAGE_SIZE);
-	pte_t *pte = memblock_alloc(n_pages * sizeof(pte_t), PAGE_SIZE);
 
 	for (i = 0; i < n_pages; i++) {
 		phys_addr_t phys = memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
-
-		set_pte(pte + i, pfn_pte(PHYS_PFN(phys), PAGE_KERNEL));
+		set_pte(&pte[i], pfn_pte(PHYS_PFN(phys), PAGE_KERNEL));
 	}
 
-	for (i = 0; i < n_pmds; ++pgd, i += PTRS_PER_PMD)
-		set_pgd(pgd, pfn_pgd(PFN_DOWN(__pa(((uintptr_t)(pmd + i)))),
+	for (i = 0, offset = 0; i < n_ptes; i++, offset += PTRS_PER_PTE)
+		set_pmd(&pmd[i],
+			pfn_pmd(PFN_DOWN(__pa(&pte[offset])),
 				__pgprot(_PAGE_TABLE)));
 
-	for (i = 0; i < n_pages; ++pmd, i += PTRS_PER_PTE)
-		set_pmd(pmd, pfn_pmd(PFN_DOWN(__pa((uintptr_t)(pte + i))),
+	for (i = 0, offset = 0; i < n_pmds; i++, offset += PTRS_PER_PMD)
+		set_pgd(&pgd[i],
+			pfn_pgd(PFN_DOWN(__pa(&pmd[offset])),
 				__pgprot(_PAGE_TABLE)));
 
 	flush_tlb_all();
-- 
2.25.0


