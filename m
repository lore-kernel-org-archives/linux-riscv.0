Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B75C3271F
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 06:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LV+mBKhkHCZCK/gj9ZDYMNeaJjlYa5LbWnriVk1Oe+g=; b=OemmCBtTn21+KT
	bQTlGKJHHCjsW21ogyMcWrAcWG1dBH3qRyiCfajjRNP21PYNZiJ5nCqCg167PvJWPhdauZqK8Uw88
	rVR25Hg2b2UPOCHX+eDC/aOKnemo1NpWjjn22Ou7Ua8Kd1XfCWOzNO6cGAIJusM9s+Ez/I2/sdDgT
	iNUDeoKxmQ+H+Pz9YQKzGsJUo92F1bQrTHAKOWDp1NVvFY4wxxlT9UQ7hoO6NkoSlgKONFTVvpDLL
	pijGCls+4XoAjGS1Ok5r1XFAXmr3qEZbmO/SIvII64ytZbMZeRDfSBOF50LDOikI4AsMJvKn4OBIB
	4yWUk+PevPDDrFShIvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPFz6-0000000CL7F-3GLq;
	Thu, 04 Jul 2024 06:30:24 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPFz2-0000000CL4N-06yg
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 06:30:23 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WF6Fr2ZTFz9sS7;
	Thu,  4 Jul 2024 08:30:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0IvprGPQSDHR; Thu,  4 Jul 2024 08:30:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WF6Fr1r3Wz9sRy;
	Thu,  4 Jul 2024 08:30:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2F33D8B774;
	Thu,  4 Jul 2024 08:30:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 2OEaojhVLPzU; Thu,  4 Jul 2024 08:30:08 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.46])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8311F8B764;
	Thu,  4 Jul 2024 08:30:07 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH 1/3] arch/x86: Drop own definition of pgd,p4d_leaf
Date: Thu,  4 Jul 2024 08:30:03 +0200
Message-ID: <b601e1a88e3a5d4d93b130fa20184b555e2a2bea.1720074307.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720074605; l=1393; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=y1Fku5Ig+SrLh/mlbGZSDg5khbyWLz2sNH+Fhxvf8CY=; b=Pn3cDPQjTJsynYwMXz4i7tu+dV52gAPkJmLyMuCh4slMgVe6g/HMgDSmdujn73izysJbgmI+t xg36IxeSmYXAH00CChn+Qo0WztBTLEw0miy96K/UdsZPHZRXd7EOvR/
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_233020_246514_573A8D0E 
X-CRM114-Status: UNSURE (   7.79  )
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
