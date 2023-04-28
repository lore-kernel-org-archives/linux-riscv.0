Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD5CC77B61
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 12:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=riGd0WgNKNr3q3tXN6IK8+C7dVHq63ySQH0rs4nimFw=; b=eCSs68eRqXCjDY
	YkmftIwk5CdGxBq1uV9IKz9P0OkJCNX26BKMidDLaxT6oNctA91uMui0Ow54l4lRGXaisbBki6jqT
	rJejh/ITJMkKANxxGVtXUXMGQyhU1rmz4ao1FOrlpYCmymFqq0vpfVbjngEmWS95n9clGzb2Rz94Z
	Z3LE0YojryH3JAnipXNxa0VZSV1w8tzqJm1eLyR1WiP30e3zsgrg62qR1c3VCl+9gzcEfZwKxrW8U
	s9QDDHSgLNFx1arXb9ZZezbN5JkXQgv6Ivo2+iyc3SV++yN57jIsVeAfkpT8A3+KuRVobEbtVb4Rd
	0BTOZ28Y8lmKY/EVDH7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psMn8-009WUW-00;
	Fri, 28 Apr 2023 12:01:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psMn4-009WPt-2B
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 12:01:32 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f19ab99540so73884805e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Apr 2023 05:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682683284; x=1685275284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPte/pKtqTO+AZafGTxmXrOl5pSZO0/CWxo2rC3YnZs=;
        b=D9Ug2iDIaCBa455YEXB0pLqOEYTMOM1r/7fk8K9lGH1dNTS8fVFclpVBPxfNrGJLOw
         KaQBHohnzVJrWOaRs8uJgZ9g9w/jVBvgyEEVfLlPH5frFMgPgjCB/dUCd5TpesPNHPp7
         VrNuAtBR+oi1LVL8zOJEyZKH935LdKrl4d8GQ78+nxplASPonmGwAb8TeyBvZDvg4wdP
         DO14ek8TP3GH/KvuVxbY0GT3jdZg6pNDls+UXYFUL6++7KkNbAFKS9V5ET2WxDvAJm6M
         VPjNt1HQ8u+x7ZzEhAuhPDeinB+Hg/eyLHkOg8dW4EeLwzj0vv4xERJpi2a8H06ZcgoZ
         giQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682683284; x=1685275284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPte/pKtqTO+AZafGTxmXrOl5pSZO0/CWxo2rC3YnZs=;
        b=hjLs0W2M/EIcNhq5/46iMwmvXJMWYMLP85GO4+7zGEDR8E9/G5xdlALxiTQ8irg/UB
         sOfT+t0CBUa9Qi5Qv7H1WwKsJGlHj4g3GVIssEiKgUN/URemP7Ph+S37I1ngkfV1VtxQ
         0AGaeOdcnKwKPvXpVSJ8wPv5Ka0b23TQnSabX7e44NQzh0BRp6nljj6expjMeudRSSJs
         5RFojLNN/gk2qhq+fM7ita+/qz9aEMABH1nePeISjYARrUhDKma+I4qQA89AsV3tT2Sm
         1yg4H41e4nfQy4tM3v/CZ2B4KuFl4DKYkcM3V+UNydxf3oXXKwFW/g8DlxkPzNGBfBP7
         UHVg==
X-Gm-Message-State: AC+VfDyhykFa2jA6VSlQWizMuq+5Y5VTAZIJjJfd7cney20Ode2rl2lZ
	sPThSVMX9Rbz9+6tj+g2dx0hlw==
X-Google-Smtp-Source: ACHHUZ56NW1lU+tU1Ept9DHFEa6yhwXbLGLBDRLT8LZpAyx3okj6Vj4I+4BWrBpdsk1NON7Fn9nJ0A==
X-Received: by 2002:a05:600c:2183:b0:3f1:76d7:ae2b with SMTP id e3-20020a05600c218300b003f176d7ae2bmr4023406wme.13.1682683283971;
        Fri, 28 Apr 2023 05:01:23 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id m18-20020a7bcb92000000b003f24f245f57sm15383740wmi.42.2023.04.28.05.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 05:01:23 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes 1/2] riscv: Fix huge_ptep_set_wrprotect when PTE is a NAPOT
Date: Fri, 28 Apr 2023 14:01:19 +0200
Message-Id: <20230428120120.21620-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_050130_960272_175895B6 
X-CRM114-Status: UNSURE (   9.83  )
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

We need to avoid inconsistencies across the PTEs that form a NAPOT
region, so when we write protect such a region, we should clear and flush
all the PTEs to make sure that any of those PTEs is not cached which would
result in such inconsistencies (arm64 does the same).

Fixes: f2aeb0118ddd ("riscv: mm: support Svnapot in hugetlb page")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/hugetlbpage.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index a163a3e0f0d4..238d00bdac14 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -218,6 +218,7 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 {
 	pte_t pte = ptep_get(ptep);
 	unsigned long order;
+	pte_t orig_pte;
 	int i, pte_num;
 
 	if (!pte_napot(pte)) {
@@ -228,9 +229,12 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 	order = napot_cont_order(pte);
 	pte_num = napot_pte_num(order);
 	ptep = huge_pte_offset(mm, addr, napot_cont_size(order));
+	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
+
+	orig_pte = pte_wrprotect(orig_pte);
 
 	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
-		ptep_set_wrprotect(mm, addr, ptep);
+		set_pte_at(mm, addr, ptep, orig_pte);
 }
 
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
