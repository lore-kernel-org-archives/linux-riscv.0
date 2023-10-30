Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078D6C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 13:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gI5hQVjJ/tq2h80SsJnavWIHUsqsjHBCg6YT5PQFK3Q=; b=wVTP0BUrzMxZMV
	dwpYPFDHZ8dN9nrndMMTLzhfYcuB7jXL7B5RcBxMbcQu45z9AUmjLZK0fCWO36FRu300j6Dy5bMSB
	16S7p2aupaaqia7CegvAl7h2tzLXMkxMK95t/OqGVlQ4+ssjxk7Jept8GBmxgOImHZU7pyYUbutK4
	/FJykRa0trehKYbmKSpWW5ydJCR0mY/ZPpu6Bnz/HDoInA+NpTIL6kHgYcD5gnic5+lTNrKDObSWw
	M2hKdNEY82AhuucnYKwEZ0pSo8dy6VZZiYQVoivo60gmM9kmqZ6WHWgzCTdM6uNISomMym3TVeX84
	EozQuKOZ50yKasnLDHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSOE-003Q4U-1c;
	Mon, 30 Oct 2023 13:33:10 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSOB-003Q1k-0m
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 13:33:08 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-32f70391608so1900526f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698672785; x=1699277585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lg+2phEYGkxNvU/hCz5W3gC6On0lJ4QhzztTYgaxDUQ=;
        b=pR+M9mbQjwPxiscmYmVhEWZYMM5dMrqLAgJ5tpVp/wgwE6olYuuqJ6tR9PnkGDn2L2
         NRSXBLX2hKhXVY+8QO67jh+SpOYEUZrFfdLDF7zten+NoPoYZ5uhZ9jR9hCeRdh9M6bJ
         Fu+D/O4P16A9qzYgNlAT3z2E7b8pAEyo4NEjNZZU4nx5XamEX6KnEJk+czazwxZqlGAJ
         OdLXiHnvx/XMDX3TjW7/rW1Gdj0Bwj0EAHHKnbZ/tLdKA7myBRJ1dLhStYpQLdGuNnEH
         NFeXJP6lTlQ+pBnR1HrbbzL3Th+Kytmos8CcRBGwTUzqQZdkhUIdo5EUXOYb5UeXJjph
         +lNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698672785; x=1699277585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lg+2phEYGkxNvU/hCz5W3gC6On0lJ4QhzztTYgaxDUQ=;
        b=VDCA6lVtOA5WtX9KyEVAQz9uKUhLivLD6yT32OTnToOftNSwb3T/0/qZesfQ0NTjD3
         6/LN0Ri0NiBYFYIE5BuBBApH1s7d6Q0mr+wCYKtw4mP2sl0lYXqNK0hMl18cu3iI9NKf
         BCkxKmJ/C45Nip8rZHCx77VPraaYf2yKoRT0rbDB9VdYx2BQzOXJ9U1w6Wtsh6RAEAc9
         Ai4axDFEWPV/kyupu36IJTb4eGe53+DE8iKLK3dklkIJJ5BWIkJMUiu8pq6O7TiOiULq
         JtNodosxj+ayVuF2mgYS8HiqJm1sVsQMDb9Hz8+x2IGNtHDEQ1GvnBw036yamQlSwh3h
         PMVA==
X-Gm-Message-State: AOJu0Yw/hG5x7wg3v1WrN9G+ngmxYA1FkGcdUxvjoYFEHZNbkPGURcgj
	eFqOvepXDQHYrhFz3m6EfTcbsQ==
X-Google-Smtp-Source: AGHT+IFSVGIn3GkkCdVjrv9GJYab3GvRdyYNVKTc+rLB8DHUCDxVeEERoRHJ6rwLZ6Dt9ZCmv4emsA==
X-Received: by 2002:adf:d1ca:0:b0:32f:7967:aa4d with SMTP id b10-20020adfd1ca000000b0032f7967aa4dmr5491624wrd.68.1698672784653;
        Mon, 30 Oct 2023 06:33:04 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id d25-20020adfa419000000b0032f79e55eb8sm6061601wra.16.2023.10.30.06.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 06:33:04 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 2/4] riscv: Improve flush_tlb_range() for hugetlb pages
Date: Mon, 30 Oct 2023 14:30:26 +0100
Message-Id: <20231030133027.19542-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030133027.19542-1-alexghiti@rivosinc.com>
References: <20231030133027.19542-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_063307_278895_CB380349 
X-CRM114-Status: GOOD (  15.23  )
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
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # On RZ/Five SMARC
---
 arch/riscv/mm/tlbflush.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index fa03289853d8..b6d712a82306 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -3,6 +3,7 @@
 #include <linux/mm.h>
 #include <linux/smp.h>
 #include <linux/sched.h>
+#include <linux/hugetlb.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
 
@@ -147,7 +148,33 @@ void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
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
