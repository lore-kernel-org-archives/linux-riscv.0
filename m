Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91702E77188
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 13:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DX0I65Cqin51Fp8Ej7Dr072TnStl5k+bkh+7NyO6oqY=; b=npqBcnSvymIMdX
	njJr3Uh2JUpwuHwHPan0FAKw2lN5Z8arzSaGvLCXW/BaHvOXpXzduRJbTA1eeUST3Ga9g7phVTo+I
	1tjvenh9kFCXY4sJuJK7Me9qLvmyhLH/evApOXzwuSv2ND4ZCvDUZMIDq8gz7RxO6/XF9OcgwWyWm
	0Pf2KXfZfdFwpWbE5KAAELMqeYIsVPgSOuvSOC1LNLjC96FdWrpaYSWKjbiXSF9TXiO5zuv34c5bj
	8DVS2WDPMTCLqUC3RrBOcww0tf3EE3F+NB4fi2xjktRUIJCIoCwKu6XklwJ8ATqd9JQm2NjNV7abi
	9IvZle68woclkzzh0YUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWYW-00000008i5w-2Das;
	Wed, 08 Jan 2025 13:57:08 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWYT-00000008i5F-3V3F
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 13:57:07 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2166f1e589cso35575215ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jan 2025 05:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736344624; x=1736949424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4pRB7K480Ktzu7LIhxM3cgafAsbUnzVulYWgonhP1nI=;
        b=LMIvl9qcXLyvKZk7X2ROr9hKyyEsuJZweROiMAZW9DVkMrM59JRi/D31BRonOy34UR
         hsVH84OuNyNpByh2ve+l2BGA2cnM3XkZe4d8WsZ55QLKCJBRdK1idW0PZVP8Zzp5Lprt
         waITGL0TON3AF6d6HN1ksp/si5fjoSfk4E8wRnbhyKnRg3/sAXmpF6v32Bi962oY4EOu
         Z1PFxugJKQBsqA6quxrU/KLgoYq8NaUzXWgShfdb9yjMmTGQD9vz3MEah3kvqQCtowaL
         ncsTBuKiuTy8hdW2JBBc+rX0CHeXhReZg7p6U1/3pingROy6YEYaI8OJJJrQ1ygNv7Ey
         +WEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736344624; x=1736949424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pRB7K480Ktzu7LIhxM3cgafAsbUnzVulYWgonhP1nI=;
        b=dAqHe6uJxQxdihFvHj+O78hhTXB7RipUbSlGZCKfzPAnwOcV3v4PO02A2QeIIfgbUw
         nyvcK9ecgKGQuZxqDO22yt7PhtJOVPaOa4jeA7dt0YRYg6VJSzwtLZNCNeyDmdVu4i9X
         YUzhJA9MS/iZc93mnJCUfrZjHX5Pkl4iwZTL520DRV/8vzvLmU7C38uENGb0LAnrbL3C
         JBlW6G39zkag+wYyS0+5mfPbDpv1HIp/JFyBj7XEzD+mxvCvOqczGOa2tyQ59ngxd418
         7phhXJVvZhG4UHAsooKSbTUQeA27uFWy8TCTLJYt73XC4cTkIXmUouPGjGldTaxlkbXK
         QBiQ==
X-Gm-Message-State: AOJu0Yz5FdjK5nuF0A4OIsjENpli2SRFL8hydBAMKxbZBk2Byj1ObV+M
	8xTz4e/B0SVDUOaY/0KSgD/pfF4Mv/Dzt/cP14cqfilqLHcIM0LuAz59wMA3OJY=
X-Gm-Gg: ASbGncvUd/LHxGStXyOCqYXAPN38zefmMwusGm5iE1wT5S2/eUaKyg7U/CVgIiBsvtg
	ww60SvsKkTm8A3A2Bcb0lfezoXDKeHHPt2NC5T7xe5PCkNPlivE5HEzsugXXvfwVH1VK0etMiSl
	Bq+PXMVyZKHxSachZ7iX5ZYU3UDlZ6UsMNBFKclmM+Nv1+EXP1XCIYULOGsWVRzTMWQPd+dLgrt
	hKFaqMtkzahoitAm5pCwwkc0ovW0do0JOkuQ/cMzmYFMGQVz18gaUT777kFincIQZVamFnEslw=
X-Google-Smtp-Source: AGHT+IFoq5GVozgjYlMOiOHZMC31npTN3aQ9ZHeqdwftoCR7nxGXgX76itHUwFHlmFm2NtgA0CBPVA==
X-Received: by 2002:a17:902:d48f:b0:216:281f:820d with SMTP id d9443c01a7336-21a83f3f560mr42421835ad.11.1736344624524;
        Wed, 08 Jan 2025 05:57:04 -0800 (PST)
Received: from abrestic.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca04c85sm326131925ad.271.2025.01.08.05.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:57:03 -0800 (PST)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Peter Xu <peterx@redhat.com>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH] riscv: Support huge pfnmaps
Date: Wed,  8 Jan 2025 05:57:00 -0800
Message-Id: <20250108135700.2614848-1-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_055706_138118_88C8944B 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

Use RSW0 as the special bit for pmds and puds, just like for ptes.
Also define the {pte,pmd,pud}_pgprot helpers which were previously
missing and are needed for the follow_pfnmap APIs.

Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
---
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/pgtable.h | 49 ++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d4a7ca0388c0..ff4849e35545 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -61,6 +61,7 @@ config RISCV
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_CFI_CLANG
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
+	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
 	# LLD >= 14: https://github.com/llvm/llvm-project/issues/50505
 	select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >= 140000
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index d4e99eef90ac..95ee745e3ef7 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -341,6 +341,14 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
 
 #define mk_pte(page, prot)       pfn_pte(page_to_pfn(page), prot)
 
+#define pte_pgprot pte_pgprot
+static inline pgprot_t pte_pgprot(pte_t pte)
+{
+	unsigned long pfn = pte_pfn(pte);
+
+	return __pgprot(pte_val(pfn_pte(pfn, __pgprot(0))) ^ pte_val(pte));
+}
+
 static inline int pte_present(pte_t pte)
 {
 	return (pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROT_NONE));
@@ -674,6 +682,11 @@ static inline pmd_t pte_pmd(pte_t pte)
 	return __pmd(pte_val(pte));
 }
 
+static inline pud_t pte_pud(pte_t pte)
+{
+	return __pud(pte_val(pte));
+}
+
 static inline pmd_t pmd_mkhuge(pmd_t pmd)
 {
 	return pmd;
@@ -699,6 +712,18 @@ static inline unsigned long pud_pfn(pud_t pud)
 	return ((__pud_to_phys(pud) & PUD_MASK) >> PAGE_SHIFT);
 }
 
+#define pmd_pgprot pmd_pgprot
+static inline pgprot_t pmd_pgprot(pmd_t pmd)
+{
+	return pte_pgprot(pmd_pte(pmd));
+}
+
+#define pud_pgprot pud_pgprot
+static inline pgprot_t pud_pgprot(pud_t pud)
+{
+	return pte_pgprot(pud_pte(pud));
+}
+
 static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 {
 	return pte_pmd(pte_modify(pmd_pte(pmd), newprot));
@@ -768,6 +793,30 @@ static inline pmd_t pmd_mkdevmap(pmd_t pmd)
 	return pte_pmd(pte_mkdevmap(pmd_pte(pmd)));
 }
 
+#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
+static inline bool pmd_special(pmd_t pmd)
+{
+	return pte_special(pmd_pte(pmd));
+}
+
+static inline pmd_t pmd_mkspecial(pmd_t pmd)
+{
+	return pte_pmd(pte_mkspecial(pmd_pte(pmd)));
+}
+#endif
+
+#ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
+static inline bool pud_special(pud_t pud)
+{
+	return pte_special(pud_pte(pud));
+}
+
+static inline pud_t pud_mkspecial(pud_t pud)
+{
+	return pte_pud(pte_mkspecial(pud_pte(pud)));
+}
+#endif
+
 static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 				pmd_t *pmdp, pmd_t pmd)
 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
