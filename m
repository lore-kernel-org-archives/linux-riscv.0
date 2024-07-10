Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3D9C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 07:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LV+mBKhkHCZCK/gj9ZDYMNeaJjlYa5LbWnriVk1Oe+g=; b=ebuSxgpFaMbG+/
	TftZJsAxlDfwSJ4564sYo1cF0fwoyxc8+mA1U5avraffzt0QiFoaUgYDb9wJUvXcGj6uIPs2bfReq
	lzvhBRuwRPyUZFJ1i4Un/JegN8HsoMmlGfp3fZTuCOzrfu4EPV/nxeoCyRs2N85VKMJAInh0FlEiX
	QgVYuwmf2YTMb2nVAS9kf9WWPLB5A/pX636G7vXQ28S2DpI1IXWirihf43O12pHzGQBZEPo+1Z4dL
	8PZkLo6c4UjC+LdYvHXwjuh7XXrZz2U4/Zr9IGJOIhSJp+v85VXB3Q/2MoGaicRC4zgqnxq/RNlCY
	7VpWpRCZPaDvoNnDr5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRS78-00000009n0R-0cYC;
	Wed, 10 Jul 2024 07:51:46 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRS75-00000009mye-2JZ7
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 07:51:45 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WJqn62Pw2z9sSv;
	Wed, 10 Jul 2024 09:51:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EpgCmhGS0H2a; Wed, 10 Jul 2024 09:51:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WJqmw2510z9sT8;
	Wed, 10 Jul 2024 09:51:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 35A9E8B779;
	Wed, 10 Jul 2024 09:51:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Su09KU2IeCB5; Wed, 10 Jul 2024 09:51:28 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.26])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E1D468B766;
	Wed, 10 Jul 2024 09:51:27 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>
Subject: [PATCH v2 1/3] arch/x86: Drop own definition of pgd,p4d_leaf
Date: Wed, 10 Jul 2024 09:51:20 +0200
Message-ID: <bcd6ab8246348f18fdc77694e321ee6458f05781.1720597744.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720597882; l=1393; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=y1Fku5Ig+SrLh/mlbGZSDg5khbyWLz2sNH+Fhxvf8CY=; b=ZZZbGXGTOnTKjAp08fuPZS4cmRBbyfRVezQt4Oz9YhJ7W4Res5iQwjOEEXfNvOQwA/ghhFQas Nvz5aEWhOUEA4kFg32/yccO89q7Vl3J1d9wEvAyscMk8Xay/WbsDPQO
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_005144_128389_F1E29092 
X-CRM114-Status: UNSURE (   7.87  )
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

From: Oscar Salvador <osalvador@suse.de>

We provide generic definitions of pXd_leaf in pgtable.h when the arch
do not define their own, where the generic pXd_leaf always return false.

Although x86 defines {pgd,p4d}_leaf, they end up being a no-op, so drop them
and make them fallback to the generic one.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/x86/include/asm/pgtable.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 65b8e5bb902c..772f778bac06 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -252,13 +252,6 @@ static inline unsigned long pgd_pfn(pgd_t pgd)
 	return (pgd_val(pgd) & PTE_PFN_MASK) >> PAGE_SHIFT;
 }
 
-#define p4d_leaf p4d_leaf
-static inline bool p4d_leaf(p4d_t p4d)
-{
-	/* No 512 GiB pages yet */
-	return 0;
-}
-
 #define pte_page(pte)	pfn_to_page(pte_pfn(pte))
 
 #define pmd_leaf pmd_leaf
@@ -1396,9 +1389,6 @@ static inline bool pgdp_maps_userspace(void *__ptr)
 	return (((ptr & ~PAGE_MASK) / sizeof(pgd_t)) < PGD_KERNEL_START);
 }
 
-#define pgd_leaf	pgd_leaf
-static inline bool pgd_leaf(pgd_t pgd) { return false; }
-
 #ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
 /*
  * All top-level MITIGATION_PAGE_TABLE_ISOLATION page tables are order-1 pages
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
