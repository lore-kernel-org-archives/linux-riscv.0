Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454C8EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 08:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NEqc7/+Z6O7av2s2Vk7ZyhtpHl3v6Pzqdyi59A60RYk=; b=unW3dw0fjkFh99
	KZ0qwVXTLfsNvNrVFY+U5lnZaZ/Pwd1Rc7IRq4EMgGrE0m9QfD3xqZXjkla+w2SMoQf5mmsEuW/Rh
	205Bxbn/k5GIMOIR7Kd6WmL3H9oRlivAfH4IRbMyfWE8SjZals3XBMYdbK/9fEneCdoEtyA8xSRyF
	tHEUiw8EV06c0cVDZikFtvX83UrgKAOq8bVeGD5FeRYRq+iyYFPn4XHFNhrzxI1hm9LNyZi/2wZNA
	WQPgGUA0NidUn2Yr4xNOoIzZr/hG1WXgrHpvrde6gZ8jVbCgOmaYgy6nVMeFzWmWqvXHG+CBEAdqe
	yQtm2S8eW1x4906Q5Oow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQl9x-000hEj-2O;
	Tue, 01 Aug 2023 08:55:17 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQl9u-000h9H-0T
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 08:55:15 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-314172bac25so4781850f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 01:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690880107; x=1691484907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJvQhuwass6T7QyQKJFHTMKHPeCPiB8wQ+ZaCt6WMq4=;
        b=Bpl0+hszwA8UQR0niUcF7oQehlmgEjs5cHo4HxCIX40QXmvTR8LBEK7tQ+cI0LB3ay
         rxJOT3sKokH5JRnOmREiUvCfxX57njbV54QplHg6i6M4zYzPTGgb5q/+1VpctU4MpRch
         2LyVMmWtMmogjAz6kCV0lm+c04Jpvg/Gg9NtpVwOclOafX1Kzkd5tX9nP0yk93e9KsXw
         ZvlG5WTrZQrtnkYLM60wCSK51DxKXb8RPjLidqJQRRr7d92QPdT10NppoNWWqJeyOPUC
         Py/mV7zxhLphurocEHr98As//5wdmGubwQw9Noeeewke4b5x/ZM2cUOii4fja8jMV1qz
         OdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690880107; x=1691484907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJvQhuwass6T7QyQKJFHTMKHPeCPiB8wQ+ZaCt6WMq4=;
        b=CwpYMyCORw6I/DNwyjVdcvQc899dpLAm0Yu9CWyArJKxECzk9WZG1EXT3Sqvbwplhs
         JsDoaKcrpf0LahTeCWcbfywfe66ExhDMbZc5/DNQVh/xKjol0NTpX5blx6rPrBZTdMRv
         Vwpsz0N8cMZE469FXm0hm5vputYRTTGWWYmbqFq9d8iQV+5iXxb9tkzmB5lWIwf6efcH
         joeWAKMxqcTftRwUafoTAZtiGU6V7WfV+UDE0TGU5ULfT0r0RstOk+S7e4DnVcRn6PtW
         OPn8g99VWiG/UGklGEKzk5KHmUojhgPuULs9JKwCcRStDkGSCZbzC9FIw+JvSfETsoEZ
         4j1Q==
X-Gm-Message-State: ABy/qLZTcm89o9beSHdUwuBvmGNuQFtzeScQnZ16cdUuZk85oLh4lnFx
	Il3KIP3p1Y5styCPeVNd0uvrDA==
X-Google-Smtp-Source: APBJJlHOJJYLrg+ra70JvNHoDNhW65vTt6zyHcHStm5ugNLuPe77B6588sTpV0o89m8oxwcr4IjNuw==
X-Received: by 2002:a5d:4909:0:b0:311:1aee:4e1d with SMTP id x9-20020a5d4909000000b003111aee4e1dmr1817877wrq.33.1690880107294;
        Tue, 01 Aug 2023 01:55:07 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id h18-20020adff192000000b003113ed02080sm15296992wro.95.2023.08.01.01.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 01:55:06 -0700 (PDT)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 1/4] riscv: Improve flush_tlb()
Date: Tue,  1 Aug 2023 10:53:59 +0200
Message-Id: <20230801085402.1168351-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230801085402.1168351-1-alexghiti@rivosinc.com>
References: <20230801085402.1168351-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_015514_192569_1BC43ACE 
X-CRM114-Status: GOOD (  13.28  )
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

For now, flush_tlb() simply calls flush_tlb_mm() which results in a
flush of the whole TLB. So let's use mmu_gather fields to provide a more
fine-grained flush of the TLB.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/tlb.h      | 8 +++++++-
 arch/riscv/include/asm/tlbflush.h | 3 +++
 arch/riscv/mm/tlbflush.c          | 7 +++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
index 120bcf2ed8a8..1eb5682b2af6 100644
--- a/arch/riscv/include/asm/tlb.h
+++ b/arch/riscv/include/asm/tlb.h
@@ -15,7 +15,13 @@ static void tlb_flush(struct mmu_gather *tlb);
 
 static inline void tlb_flush(struct mmu_gather *tlb)
 {
-	flush_tlb_mm(tlb->mm);
+#ifdef CONFIG_MMU
+	if (tlb->fullmm || tlb->need_flush_all)
+		flush_tlb_mm(tlb->mm);
+	else
+		flush_tlb_mm_range(tlb->mm, tlb->start, tlb->end,
+				   tlb_get_unmap_size(tlb));
+#endif
 }
 
 #endif /* _ASM_RISCV_TLB_H */
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index a09196f8de68..f5c4fb0ae642 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -32,6 +32,8 @@ static inline void local_flush_tlb_page(unsigned long addr)
 #if defined(CONFIG_SMP) && defined(CONFIG_MMU)
 void flush_tlb_all(void);
 void flush_tlb_mm(struct mm_struct *mm);
+void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
+			unsigned long end, unsigned int page_size);
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end);
@@ -52,6 +54,7 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
 }
 
 #define flush_tlb_mm(mm) flush_tlb_all()
+#define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
 #endif /* !CONFIG_SMP || !CONFIG_MMU */
 
 /* Flush a range of kernel pages */
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 77be59aadc73..fa03289853d8 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -132,6 +132,13 @@ void flush_tlb_mm(struct mm_struct *mm)
 	__flush_tlb_range(mm, 0, -1, PAGE_SIZE);
 }
 
+void flush_tlb_mm_range(struct mm_struct *mm,
+			unsigned long start, unsigned long end,
+			unsigned int page_size)
+{
+	__flush_tlb_range(mm, start, end - start, page_size);
+}
+
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
 	__flush_tlb_range(vma->vm_mm, addr, PAGE_SIZE, PAGE_SIZE);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
