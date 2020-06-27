Return-Path: <SRS0=1V8E=AI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE9BC433DF
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 14:35:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43B9120FC3
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 14:35:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kA53Txxj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ek8QEdXM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43B9120FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5T03DmIE4EcnLUbPkguf/VkdSaC2aR8xZGcr4NB8TdM=; b=kA53Txxj6of1FiaY/CUsIwZ61
	1WhMCzevqCijgmrgDiBIcDQQYcyoZL9v8/S4hxA1TSH0DdhmFryebZQuhX9aBz2nJTxc5DdXMD86m
	t/rj1YZLzr1LS740mmRTe9xSs/FbS17S+oa96xWgoPojW2+boXfqllSl+sUXkB6cOlqIDH9R/C5zf
	JbJoe0ThmdE7ZmMScwW8MdHVJvQBRspXx90AUksVmJEjUa1iwxmlU+I4YvaAMFLPkKYPVmT8EkzMZ
	Lr7gbeepLJoJk5kzh1habqVBigABCnbBDCWzG4vHY6uhkzKV4j160bN/Tfi04omv9dIK70qHvq7bs
	PSCO2fiZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpBvX-0004sG-T0; Sat, 27 Jun 2020 14:35:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpBvP-0004p1-F8; Sat, 27 Jun 2020 14:35:26 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D79F6218AC;
 Sat, 27 Jun 2020 14:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593268522;
 bh=j94cy4Zc9VoAiVFldgIblMVG+C+RlEUAxelXYBM5V1E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ek8QEdXMUbv9KKSK2LO459tQ221aD0KjlKMk1ToADOdG/uJKMVv/jtHxcWdJhNcN8
 o2tkvKqcdxmxF97yGBYIjMzGcuUvsJiSUsavJlTRHEP3WjzNvHM9r2ZzK7wYmT6lf3
 hkjM8fAe/c2W6Sj9fa9FBRdCl4fvh7sbcdd3EiIg=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] opeinrisc: switch to generic version of pte allocation
Date: Sat, 27 Jun 2020 17:34:47 +0300
Message-Id: <20200627143453.31835-3-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200627143453.31835-1-rppt@kernel.org>
References: <20200627143453.31835-1-rppt@kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

Replace pte_alloc_one(), pte_free() and pte_free_kernel() with the generic
implementation. The only actual functional change is the addition of
__GFP_ACCOUT for the allocation of the user page tables.

The pte_alloc_one_kernel() is kept back because its implementation on
openrisc is different than the generic one.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/openrisc/include/asm/pgalloc.h | 33 +++--------------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index da12a4c38c4b..88820299ecc4 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -20,6 +20,9 @@
 #include <linux/mm.h>
 #include <linux/memblock.h>
 
+#define __HAVE_ARCH_PTE_ALLOC_ONE_KERNEL
+#include <asm-generic/pgalloc.h>
+
 extern int mem_init_done;
 
 #define pmd_populate_kernel(mm, pmd, pte) \
@@ -61,38 +64,8 @@ extern inline pgd_t *pgd_alloc(struct mm_struct *mm)
 }
 #endif
 
-static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
-{
-	free_page((unsigned long)pgd);
-}
-
 extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
 
-static inline struct page *pte_alloc_one(struct mm_struct *mm)
-{
-	struct page *pte;
-	pte = alloc_pages(GFP_KERNEL, 0);
-	if (!pte)
-		return NULL;
-	clear_page(page_address(pte));
-	if (!pgtable_pte_page_ctor(pte)) {
-		__free_page(pte);
-		return NULL;
-	}
-	return pte;
-}
-
-static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
-{
-	free_page((unsigned long)pte);
-}
-
-static inline void pte_free(struct mm_struct *mm, struct page *pte)
-{
-	pgtable_pte_page_dtor(pte);
-	__free_page(pte);
-}
-
 #define __pte_free_tlb(tlb, pte, addr)	\
 do {					\
 	pgtable_pte_page_dtor(pte);	\
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
