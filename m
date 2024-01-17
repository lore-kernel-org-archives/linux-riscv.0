Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED27C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 19:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wI3uDJ1RCj7+1hwHPnQ63FNnpS2dE+wtPQfYaA13nWk=; b=EM0RxVy6kWG2af
	6ZP5vEyjEJkYwR6omuJcSje3UZf+cd5yDujd7634XEHmNTrxwZfQ3xScXE3i6E66cMAv7X2sjKpH4
	nFDHbnjhwRjYgM5PZOgZEI7JSUDwDTvCyGCzgl1yGVoZDNtEZI3x3BkvaEYWFep8952OS7cizuElE
	LN598hkOhty+b+ptvKJvx/Y73row5IIHN7tijgEw/Hb8mVF/VLK8WE956xpRN9VxETUGtIrV+3fY1
	tjgXS/B7BJ/7zbLUNvKKe7V/qvelmClzSzohq2giDLw8aIscmLxMJsFy5JJgmYG6HoBk7K97DIZuX
	RkQthtLWfFLuaIKm8aUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQC3u-000YjW-1M;
	Wed, 17 Jan 2024 19:58:58 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQC3q-000Yic-2f
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 19:58:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40e80046246so107135e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jan 2024 11:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705521531; x=1706126331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OW4Pp+2efBAP38SHF6DygEiJ8WxYEhemir12iniNRbY=;
        b=LOpUhVLu5iynGw042hAzN2wQ/GeaZ80OWHoaaNa0gkIZbUCkd0rPWKTTmdddm2jDZY
         /77QfQ1uReCnpz9/ak45GvyMccnj54MHcikJg9450LfpjdcCsjeI4WgQAvF5y45YFJmV
         MUlrlcIuoGRsVHxRnTJBebCN82Xir8s7K0VGSxggUklTEcbvBuNLxS/Fr+4hHlCL7Nyd
         Wl57bRt19KAV3RIM0r47TkXr0Fd4zZaW/YrF8osAwrC2BlImWZ7TKUonIlzk50ZpK3oM
         GH4gCLKG7Jd9mdZS0nNNeUXX8f80JWhvtJgcTpSWFkpu+9M8DjePq4HUANcNxAcBLadJ
         kBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705521531; x=1706126331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OW4Pp+2efBAP38SHF6DygEiJ8WxYEhemir12iniNRbY=;
        b=fvwH44GNLfzxO4d6TbHMofVd3ttejJp8qRHPWckBMJOQbvaBIxj0tp2lodMzIUWmkq
         RB1Uu25rfyvhRmrxccZ5VzFR22DOohVdaCwV7fdbR8szNqMLOceFRYmu1k9cYSf+iEqx
         2UMcTe76+ODm/ewkIDDbwyO3Bi54H/HTo4Wpb6aV6RS+qB/nYQUgg7hSuiPkLCDwU3xb
         s9dhlfqlB/S+0cRaaHM9KJCjHrT91okF8optSeV8+6HvoXrMaVw3OwbJcSI/dCJlyP0F
         Gu5VwWal2RMzTUzApdpj8WfLpG4ap/KuuQYvu46aYXFRI387acQbuIW8BiDSi/feU7r1
         Wz8Q==
X-Gm-Message-State: AOJu0Yya2o4hgcuZijuULM0JA99Mi1Ck+aZ5RBAYLJ1i+4fYUUtF1mnI
	pNH8vK89M0GGmM4PD5gkPuK2OmlNqw5e/Q==
X-Google-Smtp-Source: AGHT+IH+wmAPb2Zr2LBLfBchzsXw9gB43nlluCVXkANox4rQAmtTZpNwwjXk/z5t3IS4Fx7EKEyu2g==
X-Received: by 2002:a05:600c:30d4:b0:40e:52a6:f5af with SMTP id h20-20020a05600c30d400b0040e52a6f5afmr869311wmn.28.1705521531269;
        Wed, 17 Jan 2024 11:58:51 -0800 (PST)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v21-20020a05600c445500b0040e3bdff98asm27120885wmn.23.2024.01.17.11.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 11:58:50 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 1/2] riscv: Fix set_huge_pte_at() for NAPOT mapping
Date: Wed, 17 Jan 2024 20:57:40 +0100
Message-Id: <20240117195741.1926459-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240117195741.1926459-1-alexghiti@rivosinc.com>
References: <20240117195741.1926459-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_115854_864105_F93C63F1 
X-CRM114-Status: GOOD (  14.96  )
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

As stated by the privileged specification, we must clear a NAPOT
mapping and emit a sfence.vma before setting a new translation.

Fixes: 82a1a1f3bfb6 ("riscv: mm: support Svnapot in hugetlb page")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/hugetlbpage.c | 42 +++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index b52f0210481f..24c0179565d8 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -177,13 +177,36 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
+static void clear_flush(struct mm_struct *mm,
+			unsigned long addr,
+			pte_t *ptep,
+			unsigned long pgsize,
+			unsigned long ncontig)
+{
+	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
+	unsigned long i, saddr = addr;
+
+	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
+		ptep_get_and_clear(mm, addr, ptep);
+
+	flush_tlb_range(&vma, saddr, addr);
+}
+
+/*
+ * When dealing with NAPOT mappings, the privileged specification indicates that
+ * "if an update needs to be made, the OS generally should first mark all of the
+ * PTEs invalid, then issue SFENCE.VMA instruction(s) covering all 4 KiB regions
+ * within the range, [...] then update the PTE(s), as described in Section
+ * 4.2.1.". That's the equivalent of the Break-Before-Make approach used by
+ * arm64.
+ */
 void set_huge_pte_at(struct mm_struct *mm,
 		     unsigned long addr,
 		     pte_t *ptep,
 		     pte_t pte,
 		     unsigned long sz)
 {
-	unsigned long hugepage_shift;
+	unsigned long hugepage_shift, pgsize;
 	int i, pte_num;
 
 	if (sz >= PGDIR_SIZE)
@@ -198,7 +221,22 @@ void set_huge_pte_at(struct mm_struct *mm,
 		hugepage_shift = PAGE_SHIFT;
 
 	pte_num = sz >> hugepage_shift;
-	for (i = 0; i < pte_num; i++, ptep++, addr += (1 << hugepage_shift))
+	pgsize = 1 << hugepage_shift;
+
+	if (!pte_present(pte)) {
+		for (i = 0; i < pte_num; i++, ptep++, addr += pgsize)
+			set_ptes(mm, addr, ptep, pte, 1);
+		return;
+	}
+
+	if (!pte_napot(pte)) {
+		set_ptes(mm, addr, ptep, pte, 1);
+		return;
+	}
+
+	clear_flush(mm, addr, ptep, pgsize, pte_num);
+
+	for (i = 0; i < pte_num; i++, ptep++, addr += pgsize)
 		set_pte_at(mm, addr, ptep, pte);
 }
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
