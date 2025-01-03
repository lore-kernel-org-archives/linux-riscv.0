Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12022E77188
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 18:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5eazIx01WSBhH/M0em3pgNA6rnCEv6sBSZ3Su/3zf4=; b=VLmC1M3uFfcszW
	LxToonGoiCUYy7cOQiNnRZiHgN3ZHDOu0oxVP1PyskfEXufnpVZ9/AT34dFNVzpe1LSoXQ++Ly0yD
	i1HKg/eXnTNkbJtgso6UY1+98bkb9ybOyiDrke4ouF/Thh931uUgU73qgM5FRMgU1Wv1DXZ1raiNA
	ITcl9t8Ao1IEgbBYaTOxy3/ypxIUC1DagQpaz4zCTYahdPtua0YY0+gPycWgE4ztQVXO+Gatrk/2M
	ZLYPv0yWbzC7AyD8xh+GMWNUdW+TzvCjU7R+QteDYgxNS9l2fFXJVQIx2xelCIajppIs82Hfd454V
	jRt6jvHa/RnfD7dLC2mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmkn-0000000DlPX-2a9Z;
	Fri, 03 Jan 2025 18:50:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmf8-0000000DjVU-3wF6;
	Fri, 03 Jan 2025 18:44:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92BE9150C;
	Fri,  3 Jan 2025 10:45:14 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CBB03F673;
	Fri,  3 Jan 2025 10:44:42 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	loongarch@lists.linux.dev,
	x86@kernel.org
Subject: [PATCH v2 4/6] ARM: mm: Rename PGD helpers
Date: Fri,  3 Jan 2025 18:44:13 +0000
Message-ID: <20250103184415.2744423-5-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250103184415.2744423-1-kevin.brodsky@arm.com>
References: <20250103184415.2744423-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_104447_023774_5327B966 
X-CRM114-Status: UNSURE (   9.71  )
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

Generic implementations of __pgd_alloc and __pgd_free are about to
be introduced. Rename the macros in arch/arm/mm/pgd.c to avoid
clashes. While we're at it, also pass down the mm as argument to
those helpers, as it will be needed to call the generic
__pgd_{alloc,free}.

Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm/mm/pgd.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mm/pgd.c b/arch/arm/mm/pgd.c
index f8e9bc58a84f..2a1077747758 100644
--- a/arch/arm/mm/pgd.c
+++ b/arch/arm/mm/pgd.c
@@ -17,11 +17,11 @@
 #include "mm.h"
 
 #ifdef CONFIG_ARM_LPAE
-#define __pgd_alloc()	kmalloc_array(PTRS_PER_PGD, sizeof(pgd_t), GFP_KERNEL)
-#define __pgd_free(pgd)	kfree(pgd)
+#define _pgd_alloc(mm)		kmalloc_array(PTRS_PER_PGD, sizeof(pgd_t), GFP_KERNEL)
+#define _pgd_free(mm, pgd)	kfree(pgd)
 #else
-#define __pgd_alloc()	(pgd_t *)__get_free_pages(GFP_KERNEL, 2)
-#define __pgd_free(pgd)	free_pages((unsigned long)pgd, 2)
+#define _pgd_alloc(mm)		(pgd_t *)__get_free_pages(GFP_KERNEL, 2)
+#define _pgd_free(mm, pgd)	free_pages((unsigned long)pgd, 2)
 #endif
 
 /*
@@ -35,7 +35,7 @@ pgd_t *pgd_alloc(struct mm_struct *mm)
 	pmd_t *new_pmd, *init_pmd;
 	pte_t *new_pte, *init_pte;
 
-	new_pgd = __pgd_alloc();
+	new_pgd = _pgd_alloc(mm);
 	if (!new_pgd)
 		goto no_pgd;
 
@@ -134,7 +134,7 @@ pgd_t *pgd_alloc(struct mm_struct *mm)
 no_pud:
 	p4d_free(mm, new_p4d);
 no_p4d:
-	__pgd_free(new_pgd);
+	_pgd_free(mm, new_pgd);
 no_pgd:
 	return NULL;
 }
@@ -207,5 +207,5 @@ void pgd_free(struct mm_struct *mm, pgd_t *pgd_base)
 		p4d_free(mm, p4d);
 	}
 #endif
-	__pgd_free(pgd_base);
+	_pgd_free(mm, pgd_base);
 }
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
