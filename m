Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BC7CD4F54
	for <linux-riscv@archiver.kernel.org>; Sat, 23 May 2026 04:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UOikzhMmoT7QXerLM9nPfo7ui5LnA2SkJAJT3EEhFDM=; b=abnkmTlMpfBOz7
	tbuBdbKQlwGyk++7t/ngI3ytnvlu5FP++ham12hYDXL6Y2SnEKQ0onuAnp6QDRGFOgD7NGgNmOO0u
	TfhoXrKaqBwxd6WZleivw1WUxOnMiEBSpQ0T6VX2MDPbu2W77gF5AusTQSZh6mWMKl1jQA/m01rDG
	4ZdrLtikZEfhm41rf31IyKA+Y8oueYbj/wrNc2scE4o32s7BL/86DJv2j82Lgzcbe/c0TVGAAPYji
	GD5d/OZK65y9LLvdcOIAVubLBouSd6pEOwtOLF8lyA+1l9OqwW9O60sjpSBNYpFRrIi3izE0/5zkc
	Or9It9YM6F/nVwi4pvmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQdrJ-0000000Cfwu-3vH2;
	Sat, 23 May 2026 04:21:09 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQdrH-0000000CfwF-3AXh
	for linux-riscv@lists.infradead.org;
	Sat, 23 May 2026 04:21:08 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c70c112cb61so6486592a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 21:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1779510067; x=1780114867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o/Sl4PO82ChheiWAx9Tl91kUcgmggvPPYrF2yLqTz6g=;
        b=gw3dmsHOszOhh2svVsGr74qb+0zm6YuFjf/WBdFlq5YTUbPwpqVHSW3b3CSgza4r0U
         TvD8ItAqiMoJPg3j4RbJETXxIMDdgFUWdY996cw4tTEeuAv6qqJKGpju5RXSYAbt1Pm/
         8mJAb9QjW2VlpIzKGBo25fZlM2ccDJShS1b1WHrPbKlsvuy5G7VKAEmXzpT998VO+a/2
         fs3uHRJpdClxpeRf7uKsj96JfOLmB+ATvshNvSASOdpxdyjZFdbQMXSvlU1VdxKe65pz
         14GNt6yDE1JXV+8vixk8+cbVhH2ETX99E/6I7+N7CoyDGlqCw994xR+2n26zLcAv4hTt
         PQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779510067; x=1780114867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/Sl4PO82ChheiWAx9Tl91kUcgmggvPPYrF2yLqTz6g=;
        b=WIymWT1jGA7R5gOmV1Ws33lly4SiWAvIOgCsNuhIKLoHd9PgbeF1EyrPHG4LmqaylI
         pgMxTn4BjsL1BuF6al63x1hol+8vNtmVJyuFjWSUGM8Ce7JURumlkprOgP7ujUbL5oke
         TuJNDkLoB8DslbCjvAjVznG08rxbiAVBiVhKXqgAAj7eYSWSy4bPxESIbJNaqsPE1tDv
         ryqhV2nKMxQhhqhF8jvzDMMHLzQaHyMhGAN7ODHS5QAajR+lar+H8GL26g7oEsgPYnFW
         NXjHHF7aD0lPueaRUNojdBE3T82tAIMrqTjdHRd3sqZtrDJ60mwN4yd5xzm4UJJrj5cb
         zZBg==
X-Forwarded-Encrypted: i=1; AFNElJ+2VajlKWep7jbRLPdBQ/ceWv27LY/myx0tTnFMzkkXg8mr/6zqH9QqcPQcgmYD5IIky0sIBGSVSFnGww==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb6Se1AET8TfrSgGaXGSDrqFGqW5B20npOsZmJZWv3QCpeU7It
	nQhkc3A6aBRGgGtEn+QtRHf2qJ5vVcr/l8KCtXNzihod9Inr1QWcHNZBzgsLVmNP0u8=
X-Gm-Gg: Acq92OEG9LfDZBK4kr41FUDJ6EPdfTSmXssVcClqZnoTucc4PzlKlf1MO+J5Ckewxww
	FsUhzJyOr3D7/Te52eKZGiZZ+G46UJMbk7M42u1XD+Izcz4OIxRpTwievhJcBf999Epjj0lDgYp
	6so2Tf11BlsbGOh6RrTf3zHaPcewKoyQS7pSTeDZtqXAEdbOtTcWVZiGgCKh581Ulo+lt2V6SG6
	xR1xxGHTUz2nu9ie/hCzHTWGwVVTZjIN+8oEpInqGLlRJqvacn2krMnxVeSV+E9G6ycAHJXmOEg
	pP/E74axOJHYk9g5x7ZR9cMuDIddaQIoT25XPc6clvA2Ov1qYAFHsh2QTz2r7pu+EqETPeYuleQ
	G2gWlJZDRwij/FDtm9jVyXlxcywgVKWsT+Zs+ZE8gnHi1QVxYLdwzg8Jc6kd5iE0u5xdEcELG/a
	zW8eTq8Z14M9CceJ9sDaAOE+KL/mCCKgtTl/l255ZNflvJ6d0Pm0syx/NwZzJvoA==
X-Received: by 2002:a05:6a21:4d8d:b0:3b3:10e1:a883 with SMTP id adf61e73a8af0-3b328f4a760mr7138152637.47.1779510066555;
        Fri, 22 May 2026 21:21:06 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8520561e94sm2962104a12.22.2026.05.22.21.21.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 22 May 2026 21:21:05 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cuiyunhui@bytedance.com,
	tongtiangen@huawei.com,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [RESEND PATCH] riscv: mm: exclude invalid THP PMDs from page table check
Date: Sat, 23 May 2026 12:20:52 +0800
Message-Id: <20260523042052.35476-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_212107_803349_ED7A2899 
X-CRM114-Status: GOOD (  10.44  )
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

RISC-V THP splitting uses a temporary invalid PMD state where
pmd_mkinvalid() clears _PAGE_PRESENT and _PAGE_PROT_NONE but leaves
_PAGE_LEAF set so the MM code can still recognize the PMD as a THP split
in-progress entry.

That temporary state no longer describes a user-accessible mapping, but
page_table_check currently treats it as one because the RISC-V PMD
user-accessibility test only checks whether the PMD is a leaf and has
user permissions.

As a result, when a PMD-sized anonymous THP is split during a COW fault,
page_table_check can account the invalid intermediate PMD as a live PMD
mapping, and then account the replacement PTE mappings again when the
split installs the PTE table. This leaves stale PMD accounting behind and
later triggers page_table_check failures such as a non-zero
anon_map_count when the folio is freed.

Fix this by tightening pmd_user_accessible_page() so PMD page-table-check
accounting only considers leaf PMDs that still carry either
_PAGE_PRESENT or _PAGE_PROT_NONE. This preserves the THP split semantics
required by the MM code while preventing page_table_check from treating
invalid split PMDs as live user mappings.

With CONFIG_PAGE_TABLE_CHECK=y and CONFIG_PAGE_TABLE_CHECK_ENFORCED=y,
tools/testing/selftests/mm/cow completes successfully on RISC-V after
this change.

Fixes: 3fee229a8eb9 ("riscv/mm: enable ARCH_SUPPORTS_PAGE_TABLE_CHECK")
Cc: stable@vger.kernel.org
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index a1a7c6520a095..ecea48affd7aa 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -976,7 +976,14 @@ static inline bool pte_user_accessible_page(struct mm_struct *mm, unsigned long
 
 static inline bool pmd_user_accessible_page(struct mm_struct *mm, unsigned long addr, pmd_t pmd)
 {
-	return pmd_leaf(pmd) && pmd_user(pmd);
+	/*
+	 * page_table_check() must ignore THP split invalidation entries created by
+	 * pmd_mkinvalid(). These retain _PAGE_LEAF so pmd_present()/pmd_leaf() stay
+	 * true during the split, but they no longer describe a user-accessible
+	 * mapping once both _PAGE_PRESENT and _PAGE_PROT_NONE are cleared.
+	 */
+	return (pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROT_NONE)) &&
+		(pmd_val(pmd) & _PAGE_LEAF) && pmd_user(pmd);
 }
 
 static inline bool pud_user_accessible_page(struct mm_struct *mm, unsigned long addr, pud_t pud)
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
