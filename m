Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98387C28B30
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 14:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mswiHucDp1nHvm2AI6HP+zYH2tKgqiRNwRsTxA81/1Y=; b=XiTbXjf+yZq2oG
	DwTez/Pp6FuyQLP8jq43p3pVuSPSj1n1hBekelftswoDsO16xiL596NSO6OAYS2MabCpqD+cgD6do
	OGQXhAqTd9pjC3iwinTZVZBmKEOw3sy8OhYbjJc7DlSY+CDhkcvQArKSMTSMgskJTS88Iwbkmhaqq
	dBV9k2dvH5ipfjiEa2ivjfu+UOM43IrezRcs0Sp3ig5UECBcXeDGfjgMtur57gity42ArnH9YYKww
	5Qa+NI3GIasTyaNYyeUXQbkrAXnTNxsFrzTSe1AP4NUHxdpRiJlZGdhY2PL8gcTwqnubMFUIhaqiZ
	+oYQwxEC0phWuUrolvhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBVb-00000002xqX-0gtn;
	Mon, 17 Mar 2025 14:32:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBLo-00000002uUI-0WF7;
	Mon, 17 Mar 2025 14:21:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C87A25DC;
	Mon, 17 Mar 2025 07:22:02 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64BEE3F63F;
	Mon, 17 Mar 2025 07:21:49 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org
Subject: [PATCH 05/11] sparc64: mm: Call ctor/dtor for kernel PTEs
Date: Mon, 17 Mar 2025 14:16:54 +0000
Message-ID: <20250317141700.3701581-6-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250317141700.3701581-1-kevin.brodsky@arm.com>
References: <20250317141700.3701581-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_072156_197265_53E5FDFA 
X-CRM114-Status: GOOD (  11.55  )
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

The generic implementation of pte_{alloc_one,free}_kernel now calls
the [cd]tor, without initialising the ptlock needlessly as
pagetable_pte_ctor() skips it for init_mm.

Align sparc64 with the generic implementation by ensuring
pagetable_pte_[cd]tor() are called for kernel PTEs. As a result
the kernel and user alloc/free functions have the same
implementation, and since pgtable_t is defined as pte_t *, we can
have both call a common helper.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/sparc/mm/init_64.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index cd60a0a8ca0e..0a1b2b1adad4 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2882,18 +2882,7 @@ void __flush_tlb_all(void)
 			     : : "r" (pstate));
 }
 
-pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
-{
-	struct page *page = alloc_page(GFP_KERNEL | __GFP_ZERO);
-	pte_t *pte = NULL;
-
-	if (page)
-		pte = (pte_t *) page_address(page);
-
-	return pte;
-}
-
-pgtable_t pte_alloc_one(struct mm_struct *mm)
+static pte_t *__pte_alloc_one(struct mm_struct *mm)
 {
 	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL | __GFP_ZERO, 0);
 
@@ -2906,9 +2895,14 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
 	return ptdesc_address(ptdesc);
 }
 
-void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
+pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 {
-	free_page((unsigned long)pte);
+	return __pte_alloc_one(mm);
+}
+
+pgtable_t pte_alloc_one(struct mm_struct *mm)
+{
+	return __pte_alloc_one(mm);
 }
 
 static void __pte_free(pgtable_t pte)
@@ -2919,6 +2913,11 @@ static void __pte_free(pgtable_t pte)
 	pagetable_free(ptdesc);
 }
 
+void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
+{
+	__pte_free(pte);
+}
+
 void pte_free(struct mm_struct *mm, pgtable_t pte)
 {
 	__pte_free(pte);
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
