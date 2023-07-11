Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFEFEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 07:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=46kCecVPzSovFYkLRJWR0z60FRtmU10YFGHj8fBpF2E=; b=NaQdl/HPifsO51
	gDjavpw5/eD1PfnANACdhnDKVJdujcEJiklboq1d+C11uacaDmlBuwng6G7O75hK2vMkeOTJQkgKa
	G1S9q/+Q6ySpfDlOtGpErLj3qRq0kP/F7kOGWE9FZRfVu8mFPSp9KqyGIq4EEL1qx07+uDCfKwJKo
	bnKJDBhrjYbetjGztP5UL+Srln+GVRvdfvDw8YkIOrXsgCnF5iy1poK0C4FTB38xMZE7jx/8FdVBX
	NUrtpXfxsnz+wfqD+kI/AA0lGy194rO7/HAlU8LGqFPrRsXGjVXsYbydnx9YOMsSSbuJbrSAJtJwr
	NrLynEM0FNehtWVUEH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ8El-00E2rt-0l;
	Tue, 11 Jul 2023 07:56:43 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ8Ej-00E2r2-0G
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 07:56:42 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3142a9ff6d8so5826358f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 00:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689062199; x=1691654199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FofimiyN+7gyzGEdPyrBP2skR/4a1H3RZbKcHwnJwCU=;
        b=Qf1MDi4IQVSgi+mVmNSDLBvvWhfd8ba6Ayo48Gj0+fuhQZ4V9G61dBcMO//cFS1/fC
         eMTYYy06UvyotO+oVGCBq6zI9sY1LeYU01nJRoZJ+JLckfsVKJMM97nPklKyDZRE3HOu
         TVkWiZ1s6BeKrYLS2wuPUnzE9wyBrK5LdHaTtNHXVs67A6vQfZbIP4oSE43hkg/e5u/I
         R82FjYAOaShi8TnwHOG++346KF4aekyWodyFCqKGj8HPeSDtbX8x88W80pqGP3MBU7wD
         2AUgLCJEZ6IWj8TTYNHFpXz8+pCuX+wIU15tPfBynjH9x67d68/tJq305rfx6T581tDJ
         NCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689062199; x=1691654199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FofimiyN+7gyzGEdPyrBP2skR/4a1H3RZbKcHwnJwCU=;
        b=FbnIYTQb9YpNEN1sF36QraD8IWPzUshOwltU2YOeRzgI9dw+xNsT+xQPRx6oFOcViL
         RU1g6s8oKLsLylhreacZOKEz5H3XTfRe7xf+boush2zKYmlGGh+cgkBS5tGq0kuvcEb0
         6AGYdCYgs/rFCDeStKV6ts8YRHPhZMw4QXEzHWbKgyd1dP6IBLdEg82gJbgQBiKTMuSV
         6o1/sdO+xNNnmXmzdWAAR3bV5D0Hi1oP4noZPUUujZ5jtqflFPTLQz3A0c/tIi6o6yFb
         pVJJv2VTGDlbhf8MF/RhhzbfVCJIGaC3PGA/mlXef18Liz0d1c5rYJKkboFTxCZ8ls26
         Cx4A==
X-Gm-Message-State: ABy/qLZQc64uDE0FziUIFSHXPwMM1jugAduRdPGQ+vLqqwjkREodZGKi
	cwYUg2HjqDOWPjcZygPb0uktqA==
X-Google-Smtp-Source: APBJJlFgOrHK/zRfOp0MLvbYM0U1zfW7SDksh40rSfKhwgzyv7cSwo1z6lrEN1sxG+rtuvh+ttt+lA==
X-Received: by 2002:adf:f052:0:b0:30a:a15d:eb2f with SMTP id t18-20020adff052000000b0030aa15deb2fmr16274589wro.3.1689062199178;
        Tue, 11 Jul 2023 00:56:39 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p8-20020adfe608000000b003141f3843e6sm1489099wrm.90.2023.07.11.00.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 00:56:39 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 2/4] riscv: Improve flush_tlb_range() for hugetlb pages
Date: Tue, 11 Jul 2023 09:54:32 +0200
Message-Id: <20230711075434.10936-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230711075434.10936-1-alexghiti@rivosinc.com>
References: <20230711075434.10936-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_005641_121135_7A784059 
X-CRM114-Status: GOOD (  11.87  )
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
only flush the hugetlb mapping.

Note that THPs are directly handled by flush_pmd_tlb_range().

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/tlbflush.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index fa03289853d8..3e4acef1f6bc 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -3,6 +3,7 @@
 #include <linux/mm.h>
 #include <linux/smp.h>
 #include <linux/sched.h>
+#include <linux/hugetlb.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
 
@@ -147,7 +148,14 @@ void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end)
 {
-	__flush_tlb_range(vma->vm_mm, start, end - start, PAGE_SIZE);
+	unsigned long stride_shift;
+
+	stride_shift = is_vm_hugetlb_page(vma) ?
+				huge_page_shift(hstate_vma(vma)) :
+				PAGE_SHIFT;
+
+	__flush_tlb_range(vma->vm_mm,
+			  start, end - start, 1 << stride_shift);
 }
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
