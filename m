Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935F9C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 23:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOzV3e+Yrc67QKkHCwd/tbsfpYx3pnBGH+6LlJpFHU0=; b=sGZScO9a1aDV8z
	XLYs/q3IHB1Ln0jyq4x0TAhgDAT77Ialk0QULmF0PzWgDHuHMYiXgXzm5fbd9y2/6dxdYo/RlfjwA
	+U9rhiv5p8d/bHgBHWSxXkw2jubmyYnBVNoIvrJoU/w+fyotLS5HSDa2sjp0nKOKbd5ScRz5HfbIF
	ddTJDgD1p1y5FVSWw9GALH1t3fmNhEV7w4UBa/SiJE3AMZUTH+4BYlTVN6YR34z3BINPg2u9AYGK7
	aJxJp0BBmsD7Zofif8i+dJ2Z+UxgYHWqPL5YyhhyduFiUcDQFqygtrmun9mIOTM4k+Ay8EIBFWWpO
	MSsdIWHUqUI/6QmoOuLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsV1-000vSu-23;
	Sat, 28 Oct 2023 23:13:47 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsUy-000vRh-0v
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 23:13:45 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1c9d407bb15so29567485ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 28 Oct 2023 16:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698534823; x=1699139623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EsAJ3DvynnbB6jUfsinRvKaNQwCusxxXujfrC8RtXI=;
        b=Xq6bv516PfZx9bhhMnWKAHFaAWIddjlhmEw/CJRcvYmZG6Kq9YHZNf5bRnLlCm9PjN
         upIGCj71xt+ORV76iABIDDbxDZ9X0q+H/6Uluhi6LSuNtsjbS8fZoArolFepdb03Fc9u
         ghr6X6GaXjpDa1Sa1W1MzuH4U/GEEPF417wrhl1hbPZlZIvDAqVwDmCNlkZWcwQQkH/N
         04VFcHjUNW3GMh9FObeGsS8p5xBk3to54Y5tTuMRL8jjIROuabZetV0blqZJpW1c+flD
         Zq7PnP+/eeXK+XFI6SXmApj48NKzh5qwcKX/XLXvVwv0i+kOMsPrpttYPH66/5lLfbdB
         3xhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698534823; x=1699139623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2EsAJ3DvynnbB6jUfsinRvKaNQwCusxxXujfrC8RtXI=;
        b=cmGX/TX4Y4BIgFppDTklyTt6dMoIQOdzLt3WJuv6foiplNol14ss9xJbOylaBx330a
         tl7ICaGP+ttDjZvxIOP9PDqRHhvh3WsCI/bJrTe4FjrNSf7qPr+QpnJ9dqyenOKky/fd
         TocvGWr6WYu1rUmZxgG+pkA/i1XVCM6JSxY/1x47gzXHf0cxdhRoQ/3rSLi5SJa+TpzX
         XLETL3KWDBXv25kPHU6OsI+ALfm/qCoGsEd071WD1276lzxXHRCxEy2kgAfATQ7PG+Yq
         Gv34dPZiDsZTrhDX6UrD4yF8Ji9p7ZnumdoK41RYI0XnMncibxup0YVOVoPm5B4tKFNY
         aSaQ==
X-Gm-Message-State: AOJu0YwLQWihsxxPGlinenrqQM3vCF7qsPdfbaDTQvY3jIJ2VMD4E7kJ
	dWdmj8fgkFkrryHvGDPmELiDWQ==
X-Google-Smtp-Source: AGHT+IFw/0gO2jty39BfEl53e0TAm8jThBxaHB3Pi6HPPc0H5aL70GOaasoPy4Ex/mKBNftI1RCeRA==
X-Received: by 2002:a17:902:cf41:b0:1ca:8252:a91 with SMTP id e1-20020a170902cf4100b001ca82520a91mr7454451plg.41.1698534823149;
        Sat, 28 Oct 2023 16:13:43 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001b8622c1ad2sm3679345ple.130.2023.10.28.16.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 16:13:42 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Andrew Jones <ajones@ventanamicro.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 01/11] riscv: Improve tlb_flush()
Date: Sat, 28 Oct 2023 16:11:59 -0700
Message-ID: <20231028231339.3116618-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231028231339.3116618-1-samuel.holland@sifive.com>
References: <20231028231339.3116618-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_161344_323512_EAB52FA9 
X-CRM114-Status: GOOD (  11.99  )
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

From: Alexandre Ghiti <alexghiti@rivosinc.com>

For now, tlb_flush() simply calls flush_tlb_mm() which results in a
flush of the whole TLB. So let's use mmu_gather fields to provide a more
fine-grained flush of the TLB.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # On RZ/Five SMARC
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Rebase on Alexandre's "riscv: tlb flush improvements" series v5

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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
