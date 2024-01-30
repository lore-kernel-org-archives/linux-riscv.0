Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF83C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 12:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kwIgez6tg/zNfhFK25rixpbacuPWZ7M5w1Dm2D23e7o=; b=G+iAEsLyXY4ueS
	r0rV0oCb877kh7p9T1Ty4M6fqv+56hARyiKU6Tp34X6L5+uF0d3oox26uaZnpx8JL2TPLwtP3Sddq
	LfyqGzU7FFAt1xKoUlFzFjti5bNxBfm5mNMa1H+beljcQfC9Sg57fW+NpbpM5GCSUowHWzoBZFI7q
	BMDNAmf51BZ1Vka977iRbdMC6PViT75I6mXAutOKAmt/ShOvYfKb7wGGbMTATS/nh4UTDcDE2KkUS
	NaQtLyfcM8si7W7u5/Wer8x3nfLFQ0BWCSvfbmNmJXoJELvQaaa4W+WDOxeydmsKlPu77UIVeZ1dn
	b7JfwkQZRTdnujma4qGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmnq-0000000Gagv-0Fhg;
	Tue, 30 Jan 2024 12:01:22 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmno-0000000GagR-04Mj
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 12:01:21 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2d05da19a9eso4047301fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 04:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706616077; x=1707220877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rHZFoGtcJrlCRJilwMm607tqzIqnhBQPqkmzm1pT0lA=;
        b=3bICeYYI4jKtYbXFJ3Pz5m0AXw1HaCBhfbWyGBOr1S2sWpYDpyfQGFDUOsWlGJgq1y
         tmhDgpTw4YHIYaHnn7Wcpf0b4kyAHlCMuwdyMws2Z4OXO7ke4SzoCYovsY8WyXNf29Ct
         ndmVL8tl0Ola8+q2rUf/HxMpZOReaysRcDuOyPDCqKaiyvKN0ylefV+IsOqcgKJQNLgj
         xJ/2bS0u+F9oITCyFp8IqAWPT/2FNk7BmGyWCY7AFR052bXeQBB1ceVeadGen+nzqjsC
         T1eU7txOMnmd+kjVXwf2OYxa2eqv45/QUdaxVZSiM6OsxhljS8+EnuyoQ/yuaSm3jmTE
         RITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706616077; x=1707220877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHZFoGtcJrlCRJilwMm607tqzIqnhBQPqkmzm1pT0lA=;
        b=lg0nPhrBcq4r1EcDxjR5JlwsuZ+/ZePoj1rsrIWd/cFiqllJsgl49Is0Dr/RyC+U2Z
         uw97UDSjhANZrNFmYyK4pSl5mE8MWcWtypuBX53etrb2NJB2shVOWrxIbhZUQ7O9L6hQ
         59s0qzV/pHgw+RKRyiVy90xq4zVis8cdqCqJLMsHGzniFrvNNPDazO4dM0RhC1puYWcc
         pdX2fTdRXn0wr4YP9/BORnghASlWjZ+L3vV7N9KkyRSqLRPhghpF7NXhUpOImLJ6FSqp
         6ZbnGKhpP/pSgOTWPWu6RZMIpkUnMEZgmBG8ZK18WV538HjRWdK+AuL+QOh8kFos4Ziv
         sIBw==
X-Gm-Message-State: AOJu0YwOBQlIRsicEUMUWbtYzGL/Ihus48X/23hDOA0n5x2oCDIg6vRs
	83E22wVHjIscfifIiR8tPc+QcgxaR3PEjVa1aR5WueAnWF2p+fLYvLVb6QFG2EA=
X-Google-Smtp-Source: AGHT+IHKxTBCLOunly/kJxa7AZaFa9iq0AQuoHjYi4qoEZOLD43GcWUmIX9hlLSHYhq0NGwn7RPQ3w==
X-Received: by 2002:a05:651c:1a21:b0:2d0:511e:741f with SMTP id by33-20020a05651c1a2100b002d0511e741fmr3473128ljb.48.1706616077377;
        Tue, 30 Jan 2024 04:01:17 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id w5-20020a2e9585000000b002cd97c7a029sm921538ljh.16.2024.01.30.04.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 04:01:16 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes] riscv: Fix arch_hugetlb_migration_supported() for NAPOT
Date: Tue, 30 Jan 2024 13:01:14 +0100
Message-Id: <20240130120114.106003-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_040120_298734_D338094A 
X-CRM114-Status: UNSURE (   9.85  )
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

arch_hugetlb_migration_supported() must be reimplemented to add support
for NAPOT hugepages, which is done here.

Fixes: 82a1a1f3bfb6 ("riscv: mm: support Svnapot in hugetlb page")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/hugetlb.h |  3 +++
 arch/riscv/mm/hugetlbpage.c      | 16 +++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index 4c5b0e929890..20f9c3ba2341 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -11,6 +11,9 @@ static inline void arch_clear_hugepage_flags(struct page *page)
 }
 #define arch_clear_hugepage_flags arch_clear_hugepage_flags
 
+bool arch_hugetlb_migration_supported(struct hstate *h);
+#define arch_hugetlb_migration_supported arch_hugetlb_migration_supported
+
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
 #define __HAVE_ARCH_HUGE_PTE_CLEAR
 void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 87406b26c3da..29c7606414d2 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -364,7 +364,7 @@ void huge_pte_clear(struct mm_struct *mm,
 		pte_clear(mm, addr, ptep);
 }
 
-static __init bool is_napot_size(unsigned long size)
+static bool is_napot_size(unsigned long size)
 {
 	unsigned long order;
 
@@ -392,7 +392,7 @@ arch_initcall(napot_hugetlbpages_init);
 
 #else
 
-static __init bool is_napot_size(unsigned long size)
+static bool is_napot_size(unsigned long size)
 {
 	return false;
 }
@@ -409,7 +409,7 @@ int pmd_huge(pmd_t pmd)
 	return pmd_leaf(pmd);
 }
 
-bool __init arch_hugetlb_valid_size(unsigned long size)
+static bool __hugetlb_valid_size(unsigned long size)
 {
 	if (size == HPAGE_SIZE)
 		return true;
@@ -421,6 +421,16 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 		return false;
 }
 
+bool __init arch_hugetlb_valid_size(unsigned long size)
+{
+	return __hugetlb_valid_size(size);
+}
+
+bool arch_hugetlb_migration_supported(struct hstate *h)
+{
+	return __hugetlb_valid_size(huge_page_size(h));
+}
+
 #ifdef CONFIG_CONTIG_ALLOC
 static __init int gigantic_pages_init(void)
 {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
