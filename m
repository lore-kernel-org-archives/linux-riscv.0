Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46449E732E4
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 15:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=md3M6fGPtC9qEwLuFXZpb1KF+M8D8jm4jYl5xATnZlk=; b=T8h/PfFvp19d4w
	USFkKy8SYLIBfW0FFSML0KCc+5vtjGH4oJ2/5BLdDdN6qyRu/G4GXzrx8cc0f4povisBdW9wE+94R
	2WTSGxsbm9UPmaCupz6WQG2NdisD/aE1vN+XgRc95voKPDdSSGC35DOb47zFItyPGfHAQzJdeK8Sb
	LF8dBawOgxicVSFNsOui9rYiAy0uWUQy3h3haTT87JeHfnX7Wike2ZpMzbzOSMEwkQNLeUIYbpgdd
	4dcvT14feExQow8WNZrY0H1aAmFUZ4gaMel/B91dr3zoNn0oqM+5Hk0hvHg4/aAlw70lYnBJTKLXK
	iHkCso+nHx+CnWwiiSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsp6-005O71-1U;
	Thu, 28 Sep 2023 15:21:04 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsp2-005O39-2F
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 15:21:02 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so12482198f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 08:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695914458; x=1696519258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/s3Y1W25iZQB1mJnL4ozyyAV3qeno6bbn8hB9vh6xc=;
        b=dm6MsEmYUSFxEdax/nF+Y537tj6Bq7ezjCVY+xRvQ0zB2MksJg6ARBWwsVwqdsqvdw
         EUv+2pYI+p8ejyGsmNECGFcfoBgl4Rk4d8MbymY4HEJeqgzd/Zi6mCA3yM8+0f4nt/Bu
         qQV0m9/r9gz4ViB3MRo3FfvR99LG0XVxmiv9IaKW1hiH0gPfxwvWPk4K94WqWxBt5RFG
         EmLsTmuklbRFLgJhnDtVqrIxxMh0Ue6HZWKLMGTeOZ5MBBkr3LInKr78z2WpGcqm+/gV
         Hw4rMgqxGvoaWUvE8U2ZaoYti1QnhoK/MbUFZE6L+8BZiKOia1cQciJ+XJHnjl0bEaEU
         VcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695914458; x=1696519258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/s3Y1W25iZQB1mJnL4ozyyAV3qeno6bbn8hB9vh6xc=;
        b=X4tgvW97W5Y2PdftzZ5OJGuo90RxSDY3AzPaz2X77P08ayR8aQLQaqIIl3c27tosk3
         bdLnXd3ArFrIVYq+7n72w5Ipn4ToWBhTsFPvjTDWbwFkVs2lbS8mlnPQbsj4VJZWjjni
         N3B6d7Cm3KwuFQ65eiigZBOeCFUB/35g3WOpq8lwkzldsKT14aGfJ8zUMmU75JgXuRIz
         4UMhd1j0NuP/wKwjXPoMEqKjc6oNBD1DZSRZkqj7mv2mpMc/VWne8V1iZ9V1NzImgNem
         ixnfQSJNyiPyE1ZrK4Ai0IWJoeUcBhg9H0nGl16fsM+4eZGE+ImUaOpdrkp0LuPN2Y2v
         91ew==
X-Gm-Message-State: AOJu0Yy5kLpZmwsKUpqHXDjPJzPi4Pjkap/LpWemkRQOs7cLC/lEkCSa
	sJBwSgaUqAbMkahzQ77rUkJXHg==
X-Google-Smtp-Source: AGHT+IEd+ssB1Y2KqFPwYkco88+YASLbrAClJGH2m5sqO5EEDMYwFhwAMOmwIh6ZqOoIOyKuGB+f5w==
X-Received: by 2002:a5d:595e:0:b0:31a:e376:6bd6 with SMTP id e30-20020a5d595e000000b0031ae3766bd6mr1444503wri.45.1695914457749;
        Thu, 28 Sep 2023 08:20:57 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2a02:8440:4541:1a11:c4e7:d9ee:586b:e201])
        by smtp.gmail.com with ESMTPSA id m26-20020a056000025a00b003233a31a467sm6038630wrz.34.2023.09.28.08.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 08:20:57 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes 2/2] riscv: Fix set_huge_pte_at() for NAPOT mappings when a swap entry is set
Date: Thu, 28 Sep 2023 17:18:46 +0200
Message-Id: <20230928151846.8229-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928151846.8229-1-alexghiti@rivosinc.com>
References: <20230928151846.8229-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_082100_735120_7FB6A5C8 
X-CRM114-Status: GOOD (  14.01  )
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

We used to determine the number of page table entries to set for a NAPOT
hugepage by using the pte value which actually fails when the pte to set is
a swap entry.

So take advantage of a recent fix for arm64 reported in [1] which
introduces the size of the mapping as an argument of set_huge_pte_at(): we
can then use this size to compute the number of page table entries to set
for a NAPOT region.

Fixes: 82a1a1f3bfb6 ("riscv: mm: support Svnapot in hugetlb page")
Reported-by: Ryan Roberts <ryan.roberts@arm.com>
Closes: https://lore.kernel.org/linux-arm-kernel/20230922115804.2043771-1-ryan.roberts@arm.com/ [1]
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/hugetlbpage.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index e4a2ace92dbe..b52f0210481f 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -183,15 +183,22 @@ void set_huge_pte_at(struct mm_struct *mm,
 		     pte_t pte,
 		     unsigned long sz)
 {
+	unsigned long hugepage_shift;
 	int i, pte_num;
 
-	if (!pte_napot(pte)) {
-		set_pte_at(mm, addr, ptep, pte);
-		return;
-	}
+	if (sz >= PGDIR_SIZE)
+		hugepage_shift = PGDIR_SHIFT;
+	else if (sz >= P4D_SIZE)
+		hugepage_shift = P4D_SHIFT;
+	else if (sz >= PUD_SIZE)
+		hugepage_shift = PUD_SHIFT;
+	else if (sz >= PMD_SIZE)
+		hugepage_shift = PMD_SHIFT;
+	else
+		hugepage_shift = PAGE_SHIFT;
 
-	pte_num = napot_pte_num(napot_cont_order(pte));
-	for (i = 0; i < pte_num; i++, ptep++, addr += PAGE_SIZE)
+	pte_num = sz >> hugepage_shift;
+	for (i = 0; i < pte_num; i++, ptep++, addr += (1 << hugepage_shift))
 		set_pte_at(mm, addr, ptep, pte);
 }
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
