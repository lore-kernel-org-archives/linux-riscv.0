Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47ABCD11DD
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 04:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=teofedqYUCla7P2gcfoEo6QiTmk4qJi5ImScnEK9wDs=; b=vko0Ibfiyn42dN
	HxY0gHyED131lVPdgLYdzE3Ctc/e02SaAzx/p9mQa42SisGQ1lOnGQR+DFtT38Ae0l8OdTQssn6Cs
	J1OlP4dJOTFTOmMmHDqTUy1uVcYkhcWrQWYfajjg2FVfFOP5iWrT1641Cr+q73Ft0AiNzPGHufYup
	0UiIDtC82bfTCf9G/iBpyUfiHfi5dr6VGX1qMgxK3hGtEI1rzM4cQjEsnAPlVTQTgtBQQlGl/EuHY
	YV1py6W/mZ6DaQdKwgFEhHLmeyIjWNnlxabF7KtmIjvaaVQjUJ4UIBUkPnKrlYWGpEGAOvFeZT6G4
	LLFmdW95Gef54WFK1xrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFT-00000007S6e-3Jh9;
	Wed, 27 Mar 2024 04:50:51 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFN-00000007S2E-0aDS
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 04:50:46 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6e6e0867be8so978219a34.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 21:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711515043; x=1712119843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tmp/TOSalTk1E9Om53lqcGFTwB3eFzfKle7hmp+7bao=;
        b=GXhuVno0S5cz4b8UFrMKyu13MukdM1yZg68RHqRIiQ+6Rw2yFHtMAsjgp7SQHPXlhp
         seYrlCfd2xgAF2VIw0wXfyV1vgxD8LSNPeONI03ZvVuwlIIn27r7o6eaXNpzeEfaV2/4
         ZqGvdfqxAEd1mHLCibgzdfp202zRdQXjwUEtulhLgwRyxHjE39TMNdYBBsqiY5Nk5YaZ
         JNkhSrUsfa0EJ8HbTcGnCzEvKXoCNlFj5bjMCnfShyx4GzEtIpJ+XyJNAXw3SU3qSwna
         eMpQLEtXF0Ss40RwW7ZQViGRP3KLOA9C8cuFJsksI7nYkcXthaRlFaiWZFbFSRm5gumN
         36zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711515043; x=1712119843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tmp/TOSalTk1E9Om53lqcGFTwB3eFzfKle7hmp+7bao=;
        b=lsA5JxlAfs3EZSdDvH37qm4JA7Ft62sdUhNdiSV0nhVJb6d/ZGKMhRrQe/xQcj1trf
         +P240uWZA6iFZYEo158J8CvRN7V3LwtKz7hYl8f7tC6TWOo0ih17ft+vz9FrOoxTsq2+
         bi7LmxeZj96W2EBs9aNp3+PCkmq4SZKzw0SnfpZs3TwwkqVOYZrZ6zqCroH7X8jGwGcL
         1//BgHGTbBLuQo96H6IJNPWilHNdDLRUZpwt+hjlJm85CXyEU2xbRbwPQwoU1dSqiW80
         PfPdXKpRm7D1xmgeXqw5/Ho7OomPMlHEn7q5zFkSxphaxeCayFYaZ2dalBr1aPQkfTqu
         TPHw==
X-Forwarded-Encrypted: i=1; AJvYcCU1Fe/ZlaIZPY22aX2aAQyPMEmRW1W4VcLjiB36J8PS2YbFZi/maVgrbQ7Xw/DnBUhDayapFaETIYP8wYaXRHTRnsw6K+yObxN5+qxaOlco
X-Gm-Message-State: AOJu0YyEG1eclZ8irkGXL7YJkKeJFzjkw4urWXFZL7XByUi79KJaRa5r
	/kxjv5T9i41YAJLUvv03chxLIz5HO6Z3QarLxhW5EKdhR1kq6wcr9T9Bj/CrvS4=
X-Google-Smtp-Source: AGHT+IFl3z8IwkcLePPXROsXhoQYUv/uXEkbIlJCNYH90sGzXXkCB+mcXoO2kI0LDgwvd8XvzM/1fA==
X-Received: by 2002:a05:6830:1bd5:b0:6e6:99da:8944 with SMTP id v21-20020a0568301bd500b006e699da8944mr3176474ota.26.1711515043004;
        Tue, 26 Mar 2024 21:50:43 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id e31-20020a63501f000000b005e4666261besm8351500pgb.50.2024.03.26.21.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 21:50:42 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v6 02/13] riscv: Factor out page table TLB synchronization
Date: Tue, 26 Mar 2024 21:49:43 -0700
Message-ID: <20240327045035.368512-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327045035.368512-1-samuel.holland@sifive.com>
References: <20240327045035.368512-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_215045_214784_7D668169 
X-CRM114-Status: GOOD (  11.14  )
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

The logic is the same for all page table levels. See commit 69be3fb111e7
("riscv: enable MMU_GATHER_RCU_TABLE_FREE for SMP && MMU").

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v6:
 - Move riscv_tlb_remove_ptdesc() definition to fix 32-bit build

Changes in v5:
 - New patch for v5

 arch/riscv/include/asm/pgalloc.h | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index deaf971253a2..b34587da8882 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -15,6 +15,14 @@
 #define __HAVE_ARCH_PUD_FREE
 #include <asm-generic/pgalloc.h>
 
+static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
+{
+	if (riscv_use_ipi_for_rfence())
+		tlb_remove_page_ptdesc(tlb, pt);
+	else
+		tlb_remove_ptdesc(tlb, pt);
+}
+
 static inline void pmd_populate_kernel(struct mm_struct *mm,
 	pmd_t *pmd, pte_t *pte)
 {
@@ -102,10 +110,7 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 		struct ptdesc *ptdesc = virt_to_ptdesc(pud);
 
 		pagetable_pud_dtor(ptdesc);
-		if (riscv_use_ipi_for_rfence())
-			tlb_remove_page_ptdesc(tlb, ptdesc);
-		else
-			tlb_remove_ptdesc(tlb, ptdesc);
+		riscv_tlb_remove_ptdesc(tlb, ptdesc);
 	}
 }
 
@@ -139,12 +144,8 @@ static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 				  unsigned long addr)
 {
-	if (pgtable_l5_enabled) {
-		if (riscv_use_ipi_for_rfence())
-			tlb_remove_page_ptdesc(tlb, virt_to_ptdesc(p4d));
-		else
-			tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
-	}
+	if (pgtable_l5_enabled)
+		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
 }
 #endif /* __PAGETABLE_PMD_FOLDED */
 
@@ -176,10 +177,7 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
 
 	pagetable_pmd_dtor(ptdesc);
-	if (riscv_use_ipi_for_rfence())
-		tlb_remove_page_ptdesc(tlb, ptdesc);
-	else
-		tlb_remove_ptdesc(tlb, ptdesc);
+	riscv_tlb_remove_ptdesc(tlb, ptdesc);
 }
 
 #endif /* __PAGETABLE_PMD_FOLDED */
@@ -190,10 +188,7 @@ static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
 	pagetable_pte_dtor(ptdesc);
-	if (riscv_use_ipi_for_rfence())
-		tlb_remove_page_ptdesc(tlb, ptdesc);
-	else
-		tlb_remove_ptdesc(tlb, ptdesc);
+	riscv_tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif /* CONFIG_MMU */
 
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
