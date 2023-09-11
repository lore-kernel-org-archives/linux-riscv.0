Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EC7EE57DF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 13:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NEqc7/+Z6O7av2s2Vk7ZyhtpHl3v6Pzqdyi59A60RYk=; b=ah3HQAq8YIoHDx
	iCuRo2qbjm45Xv9hGPF65RNQ0amTtoJ+rnYqw+7q5bUw+M+bs/0XLWqRHYxA4eLuNYSpIXTOBJJ+A
	1+Qqq3W9w/vMXkQTLVnQrdu742+cn/ip9CR8oDuVCdNfczcTydlNT2j5eIJ2tLgYQ/T5I2Kjj+yYh
	IG90/0zOwc+KlLPBKERjHgDBsYrfgX6Y9nLeKZo4+8cgbkLv/CTeipE8Qa0WTkiYJfUx4sqRo92F/
	l7JinABM+Xldbl6xFJgdl4C09X5DnfYX2IGCW+PtraSws0MPrdiMQFBw/tXavJGXkV8+QotwNkINH
	1YT4h9k4Jttvot5UzchA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgjP-000ZtV-2b;
	Mon, 11 Sep 2023 13:13:35 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgjM-000Zrq-04
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 13:13:33 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-402c46c49f4so47340415e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 06:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694438008; x=1695042808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJvQhuwass6T7QyQKJFHTMKHPeCPiB8wQ+ZaCt6WMq4=;
        b=hTJRalXkJBWy3HU3Ga0I6HP0iNxPFo89YPbZ7TKx4WHU0gegmEz85jqikITDEklQe3
         y6aJBViYNnYpqD3nndLpGmuN7sP8WMdQXT0E9siO2FdybCJTnioe0jHxmX2JttfoS/R9
         OlUJllYG9lXp1NGucmvKrfHADxN+JhjYiJlYwoT/tsFS8QzOUBbnPfJrght8L4Jiv7sF
         pPo+OrXZRDBf360nPDfl3/ASLNqaRvObE9zMoxLThxYiOuCXnvnP+HFhkheE0+Jpt+YH
         /f/Sr/Irvjfw77YIlM46/xeAiKfYfjbIBCGBx7ycSVxDHNnYCvyOPzfzazdsUETfrRDk
         ALtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694438008; x=1695042808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJvQhuwass6T7QyQKJFHTMKHPeCPiB8wQ+ZaCt6WMq4=;
        b=pHl+hJ4CaMGXhhfSCwbMrsi2XxgPlZlYMcjgqKVieMn0M+88WZe8h9X0nnEPL3BY4N
         5jFInmhk4K0F4LjpwSLNwRYBqeJbFf7ZVII7cNw/IO1Wg3BIKcS13q0H3liKiFk53Kvt
         2M8JcsCdIXTum2+OWQ+W6MKt3niyhsgzqIytYxzcCBHX7SM5MkF6ArKL8nS1x78tN+A6
         JIKE8qSHiF1tg3OyKfVAzyHtpkl3+c+dXDWL4T1Z2wKqg+2TEwaMjnk3T6T9XlPsRN78
         i56BMw8ptbNks1PotAmooxgvBzvdCIibpiRqdc1+ZddGIhWNdssd8qHAkLdlDLOn2N+z
         Em3A==
X-Gm-Message-State: AOJu0Yz1Lo5hT2JxjTJg3ra9xVn/jDZjV1TyOoeMI4hpj5kR53tN8Skl
	D3K2Bo2bpYdBbErUdGSpwQ/1pQ==
X-Google-Smtp-Source: AGHT+IHDNb5CqLim35ose2q7WmJ+9tXpgSAwI6QOLAumXk8SMHKSu15qIwBWXUEtVo37x5UyrTFz2g==
X-Received: by 2002:a05:6000:118f:b0:317:6d9d:1250 with SMTP id g15-20020a056000118f00b003176d9d1250mr7674314wrx.61.1694438008262;
        Mon, 11 Sep 2023 06:13:28 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id b14-20020a5d550e000000b0031f34a395e7sm10072174wrv.45.2023.09.11.06.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 06:13:27 -0700 (PDT)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 1/4] riscv: Improve flush_tlb()
Date: Mon, 11 Sep 2023 15:12:21 +0200
Message-Id: <20230911131224.61924-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230911131224.61924-1-alexghiti@rivosinc.com>
References: <20230911131224.61924-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_061332_059498_938567C6 
X-CRM114-Status: GOOD (  12.65  )
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
