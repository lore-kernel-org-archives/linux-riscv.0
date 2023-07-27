Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8880FC001DC
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 18:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=46kCecVPzSovFYkLRJWR0z60FRtmU10YFGHj8fBpF2E=; b=pEx1rjCm4c4EZv
	7syVMKB08X+cWoN/m2bXALlRINcob92h4k1GwQFbsgZvvCKNi8pAUHB6SF55N248PYaZx1VdXoXGf
	/yaSH1H+L4MaxSDk3FDULPTNKUENAG05Ayd3hydaNw+kN5chax6vAi+zN46Z6yKjiU7ivPYnNBLpL
	UgO8LJlWZBGC5/f7+a9cgPG47L3wpKxVkQmeelZWCR2cinRwLbNKmUOvHtYdW1YNEVh5WzxMvSc8L
	S3GlhovnUbi/ODCsd5OgMUkXsSEW67h0unAiS+HyGddS2LRc68kSNhs+kd4SdyqIFZ+MNgnLbb0uX
	NkG9uHzO8Bl/BKUbo6Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP6Bb-000EvN-0a;
	Thu, 27 Jul 2023 18:58:07 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP6BY-000Eui-2L
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 18:58:05 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fbea14700bso13225065e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 11:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690484283; x=1691089083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FofimiyN+7gyzGEdPyrBP2skR/4a1H3RZbKcHwnJwCU=;
        b=KnDd+Vx9BzShpCRzLQ631/OTf/QgBq8wCBP80Yw1l/syTWuVZd1mFQHnOFb5n/3cyE
         TukhFMSWwWymirfBGHC3p4wuay/d0DWPZyl+78CJlng2+dz494c+Eglij+K8qqKQf4hv
         4/E+Yc7aIpJ5620zW+lx0o7XJTJtyN+voY8PiGKvUEvR8YD0spKu/4+n762sANqG9nlA
         JGGxpE/z8ULSbOmkC4CA3cHyh0dj8cWRd0GL1Mq0lF97VyP+Af3o43rlpnU8SYmk3Yki
         Pg0JAmuERUhqze5Ri32pwH1Xujl7bJXT0s3JtHSJ6deEL2dq525vEra8wG4vcpq+deNd
         BTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690484283; x=1691089083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FofimiyN+7gyzGEdPyrBP2skR/4a1H3RZbKcHwnJwCU=;
        b=bZnt9NG08ZTsLxvGIc0YlLshpM0Db19Dr6EfDVWfMm6Mdtor+R83i3nTo3fMizbHtL
         7xqXzjlqR1ydzA7a9K20BKaHs5W6GdalGoaDvYuUOgWDcZ6341rBXj/PmuT04+ewTIBj
         L9CjSFc+d8QC1c8ipwxAZRi+TLB8OccQGZ+seiByeis3sO5xekjFD57Bp8BAOKF+vfwF
         dIdp4BAQO0OkSyXOX+wzkc4JQyl9H2Lpr44xhhEffvbXbuDFFknal2aAXQyw7HucErL8
         jC2tmzAykkTA/jUODew2TzEeeqdwbLh4odpEc5n3tFJ67il6xstJooOdnCY0N/cATypC
         2gWA==
X-Gm-Message-State: ABy/qLZqhBOILqDr9Jgf57zppv/lAMdsfqrrOCqBehKocwLjH4bB0Ox5
	XiyOCc0Fxk97JN+0jluHQFgFbg==
X-Google-Smtp-Source: APBJJlE5yuP6dOyuWEfbshqESX2eaPb5FXyTM6wUkhll2KdkxuRc6Y2JvvBqcbIkk0EYV+e5ssUWbw==
X-Received: by 2002:a05:600c:3652:b0:3fa:934c:8350 with SMTP id y18-20020a05600c365200b003fa934c8350mr2269763wmq.27.1690484283337;
        Thu, 27 Jul 2023 11:58:03 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id a1-20020a056000050100b003141f96ed36sm2840938wrf.0.2023.07.27.11.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 11:58:03 -0700 (PDT)
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
Subject: [PATCH v2 2/4] riscv: Improve flush_tlb_range() for hugetlb pages
Date: Thu, 27 Jul 2023 20:55:51 +0200
Message-Id: <20230727185553.980262-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727185553.980262-1-alexghiti@rivosinc.com>
References: <20230727185553.980262-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_115804_764281_7A3084E0 
X-CRM114-Status: GOOD (  11.71  )
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
