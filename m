Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB44CDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 14:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eppukMfgHkQKmSBlRV9ARnaxWFK4laDuiiqWUS947Po=; b=UAbL357j7IgAYI
	eLeaPyBwwbwd+eePOL9hssSwygDY++00ZiingoJT70PhooFt+6zbHU0+I9tSqbOAmLa9LSdnAugYz
	HrP+bCohKaCFwXFWCDIE13/vOKQFG1ChXiV+KyKrAif3mE8vsHi2tz/CLqumJXQJIOyZMWrqr1vCt
	DLUWi4KGMSvNSPVOMig/oYV0SvLKFLFTe5ZuuG5/OzHi/32rryBAsThG7tf9TZmlhvcIy5Hr4IhFn
	JeX9w+4J/H9r710vN7T/TeXx9OhwHdUm87hjPaHnCtsEvNmjyem+2E6HDAcC6cm+SWQQ+EkaukNYM
	iKvRjCgaE6g5Dl8Zy85g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTdJ-0000eK-2S;
	Thu, 19 Oct 2023 14:04:17 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTdG-0000b8-2e
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 14:04:16 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b9338e4695so109319801fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 07:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697724251; x=1698329051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ApwA47W5sfKWNkq2IymUPAqINYWJl4bGVtXFqY2oGI=;
        b=Z/4wA3uoeUsbW+xvlRJDlheR+Yx8gftG8bzo/xj47OdmmwYfdzoCmtRKVByqBfJL3c
         RH3pr5IMqWTHsVTctyh2ZahmR3QvLue7kVOP/LNhLw7CS9gut75yrGF+OU9UKecmosug
         DAH+JJqnU5N8WOy3l+9cKbUCXhX+1S3oV8NefFYpHbtehvFp87ZVKY8jsDhSERvsFNax
         vLoo138YKVa+ZEPK3VPFRg1aL8oDbQ7MYRszJYDx1E7HM6YfSpvKaX6NqBp/sgKTQFu7
         +FasPZC9fCuuidXsMCfzLTT7zBomVZ+2lea1jb9x9mNtQzRBg6/z+iTndnbsRgwtLLfF
         vtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697724251; x=1698329051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ApwA47W5sfKWNkq2IymUPAqINYWJl4bGVtXFqY2oGI=;
        b=tHT7zPqHgcAcZQ2y/mSEG6ulaay+FEbX1jWCyHvSCKbJVE9ZzMGkLp0mw4Y+Z4SQME
         MLoIK3LI+781wa33xT+jueqWyfKUbo3b52xVcLLBpfokAjJiZejiyqOChXYUWKrqJTwi
         hYKSSAcgPqcljH9J4Gld7ZkBTZxWEzH2LbbfGUDbxBGaGsB3K4cCSLrNI+BkPEo4CSWC
         DXqWKAkfrs3aIgE74J2264XMFWD5MZYZnhbLxbJltU3D4cSMeQC5978Y6fTvBg1vqT9a
         PTnUPI++zD60kfoVYk7XR/MS4U8ASh8NmIOCvW/A01aL1vmdLJxK5ZaPQa4JYlDdQb/S
         UuJA==
X-Gm-Message-State: AOJu0Ywiz4/+5micAsklgPRyWYa2X9lOOXCmykmeMyuPXnVL3bkXQSzu
	eCneNGN+pJ59Cr9/c7xNpzX57w==
X-Google-Smtp-Source: AGHT+IEBYCq6FlJQnZX7dLdouPmrLmiH7GFteySmGUDpOnC8cPojpOsH5qTZKNPlCuCg8e75j80KCg==
X-Received: by 2002:a05:651c:1502:b0:2c5:1ad0:e2ff with SMTP id e2-20020a05651c150200b002c51ad0e2ffmr2017092ljf.39.1697724250744;
        Thu, 19 Oct 2023 07:04:10 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id az15-20020a05600c600f00b00406447b798bsm4543769wmb.37.2023.10.19.07.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 07:04:05 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>,
	Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 2/4] riscv: Improve flush_tlb_range() for hugetlb pages
Date: Thu, 19 Oct 2023 16:01:49 +0200
Message-Id: <20231019140151.21629-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019140151.21629-1-alexghiti@rivosinc.com>
References: <20231019140151.21629-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_070414_859006_7E7A0AB4 
X-CRM114-Status: GOOD (  15.42  )
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

flush_tlb_range() uses a fixed stride of PAGE_SIZE and in its current form,
when a hugetlb mapping needs to be flushed, flush_tlb_range() flushes the
whole tlb: so set a stride of the size of the hugetlb mapping in order to
only flush the hugetlb mapping. However, if the hugepage is a NAPOT region,
all PTEs that constitute this mapping must be invalidated, so the stride
size must actually be the size of the PTE.

Note that THPs are directly handled by flush_pmd_tlb_range().

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/tlbflush.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index fa03289853d8..5933744df91a 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -3,6 +3,7 @@
 #include <linux/mm.h>
 #include <linux/smp.h>
 #include <linux/sched.h>
+#include <linux/hugetlb.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
 
@@ -147,7 +148,35 @@ void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end)
 {
-	__flush_tlb_range(vma->vm_mm, start, end - start, PAGE_SIZE);
+	unsigned long stride_size;
+
+	if (!is_vm_hugetlb_page(vma)) {
+		stride_size = PAGE_SIZE;
+	} else {
+		stride_size = huge_page_size(hstate_vma(vma));
+
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+		/*
+		 * As stated in the privileged specification, every PTE in a
+		 * NAPOT region must be invalidated, so reset the stride in that
+		 * case.
+		 */
+		if (has_svnapot()) {
+			if (stride_size >= PGDIR_SIZE)
+				stride_size = PGDIR_SIZE;
+			else if (stride_size >= P4D_SIZE)
+				stride_size = P4D_SIZE;
+			else if (stride_size >= PUD_SIZE)
+				stride_size = PUD_SIZE;
+			else if (stride_size >= PMD_SIZE)
+				stride_size = PMD_SIZE;
+			else
+				stride_size = PAGE_SIZE;
+		}
+#endif
+	}
+
+	__flush_tlb_range(vma->vm_mm, start, end - start, stride_size);
 }
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
