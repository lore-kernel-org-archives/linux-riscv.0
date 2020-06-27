Return-Path: <SRS0=1V8E=AI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72521C433DF
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 14:37:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4359B20757
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 14:37:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JDNqB6f6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vedhTYE9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4359B20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VOcV9fmlmGO9irr0HzweJu/SCdQ2Mjcf4hV2z9c9lkQ=; b=JDNqB6f6/k0RdaEfCf9hv1gZj
	MjtHQKztIUYdn0Q2zK4G9o1BKPEig+HZiJWtk39B9GMD824Dt+DXO5cWTopuiGNNWRg66OJzY0cu1
	SlwmzkTuLV7yT/S/613MoWAfSwWnAfIWYiFH217btYYumceZZidoYOi7/dggn8AwyAb221do8GAgd
	hNSZytowDGUk1FbBBL312S+IBZXr/NRnQ6RHjWCEwrdYdxY2MfrRwO/91JEdMAvZDr8XXpRSoIAgg
	vcTDVvNdw/wzZqrA/CZH64B5JRrmp/OecpoVZjMDY2mK2HDTGTRVV+CVCcRDiC7gkKANO+L1J6gzu
	Ln4uY/+Og==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpBxA-0005Wg-6y; Sat, 27 Jun 2020 14:37:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpBwF-00057t-3k; Sat, 27 Jun 2020 14:36:24 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D28792089D;
 Sat, 27 Jun 2020 14:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593268574;
 bh=7yKGaSys/x4kSwsiwsgHnvwOIWo9krh7zT7L0zfUSqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vedhTYE9T67avhoKl2zDmD+CF8XE3npkylRfYp07gEBnq/wQv81HahhSLX12TWWXt
 Q7apuh6XkhDqPkOu1zRv2yq0e5GqbJDequ8aSDANQRvuz7aSP+Dmn/IKErWl9fGhG/
 riDKDn6+/FvQBd8H0M/pmjSmyHQLO7e5+/A0lSk8=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] mm: move p?d_alloc_track to separate header file
Date: Sat, 27 Jun 2020 17:34:53 +0300
Message-Id: <20200627143453.31835-9-rppt@kernel.org>
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
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Andy Lutomirski <luto@kernel.org>,
 Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Joerg Roedel <jroedel@suse.de>

The functions are only used in two source files, both residing in mm/
subdirectory, so there is no need for them to be in the global <linux/mm.h>
header.  Move them to the new mm/pgalloc-track.h header and include it only
where needed.

[rppt: mv include/linux/pgalloc-track.h mm/]

Link: http://lkml.kernel.org/r/20200609120533.25867-1-joro@8bytes.org
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Rostedt (VMware) <rostedt@goodmis.org>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 include/linux/mm.h | 45 ----------------------------------------
 mm/ioremap.c       |  2 ++
 mm/pgalloc-track.h | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 mm/vmalloc.c       |  1 +
 4 files changed, 54 insertions(+), 45 deletions(-)
 create mode 100644 mm/pgalloc-track.h

diff --git a/include/linux/mm.h b/include/linux/mm.h
index dc7b87310c10..5e878a3c7c57 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2093,51 +2093,11 @@ static inline pud_t *pud_alloc(struct mm_struct *mm, p4d_t *p4d,
 		NULL : pud_offset(p4d, address);
 }
 
-static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
-				     unsigned long address,
-				     pgtbl_mod_mask *mod_mask)
-
-{
-	if (unlikely(pgd_none(*pgd))) {
-		if (__p4d_alloc(mm, pgd, address))
-			return NULL;
-		*mod_mask |= PGTBL_PGD_MODIFIED;
-	}
-
-	return p4d_offset(pgd, address);
-}
-
-static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
-				     unsigned long address,
-				     pgtbl_mod_mask *mod_mask)
-{
-	if (unlikely(p4d_none(*p4d))) {
-		if (__pud_alloc(mm, p4d, address))
-			return NULL;
-		*mod_mask |= PGTBL_P4D_MODIFIED;
-	}
-
-	return pud_offset(p4d, address);
-}
-
 static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
 {
 	return (unlikely(pud_none(*pud)) && __pmd_alloc(mm, pud, address))?
 		NULL: pmd_offset(pud, address);
 }
-
-static inline pmd_t *pmd_alloc_track(struct mm_struct *mm, pud_t *pud,
-				     unsigned long address,
-				     pgtbl_mod_mask *mod_mask)
-{
-	if (unlikely(pud_none(*pud))) {
-		if (__pmd_alloc(mm, pud, address))
-			return NULL;
-		*mod_mask |= PGTBL_PUD_MODIFIED;
-	}
-
-	return pmd_offset(pud, address);
-}
 #endif /* CONFIG_MMU */
 
 #if USE_SPLIT_PTE_PTLOCKS
@@ -2253,11 +2213,6 @@ static inline void pgtable_pte_page_dtor(struct page *page)
 	((unlikely(pmd_none(*(pmd))) && __pte_alloc_kernel(pmd))? \
 		NULL: pte_offset_kernel(pmd, address))
 
-#define pte_alloc_kernel_track(pmd, address, mask)			\
-	((unlikely(pmd_none(*(pmd))) &&					\
-	  (__pte_alloc_kernel(pmd) || ({*(mask)|=PGTBL_PMD_MODIFIED;0;})))?\
-		NULL: pte_offset_kernel(pmd, address))
-
 #if USE_SPLIT_PMD_PTLOCKS
 
 static struct page *pmd_to_page(pmd_t *pmd)
diff --git a/mm/ioremap.c b/mm/ioremap.c
index 5ee3526f71b8..5fa1ab41d152 100644
--- a/mm/ioremap.c
+++ b/mm/ioremap.c
@@ -13,6 +13,8 @@
 #include <linux/export.h>
 #include <asm/cacheflush.h>
 
+#include "pgalloc-track.h"
+
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
 static int __read_mostly ioremap_p4d_capable;
 static int __read_mostly ioremap_pud_capable;
diff --git a/mm/pgalloc-track.h b/mm/pgalloc-track.h
new file mode 100644
index 000000000000..1dcc865029a2
--- /dev/null
+++ b/mm/pgalloc-track.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_PGALLLC_TRACK_H
+#define _LINUX_PGALLLC_TRACK_H
+
+#if defined(CONFIG_MMU)
+static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
+				     unsigned long address,
+				     pgtbl_mod_mask *mod_mask)
+{
+	if (unlikely(pgd_none(*pgd))) {
+		if (__p4d_alloc(mm, pgd, address))
+			return NULL;
+		*mod_mask |= PGTBL_PGD_MODIFIED;
+	}
+
+	return p4d_offset(pgd, address);
+}
+
+static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
+				     unsigned long address,
+				     pgtbl_mod_mask *mod_mask)
+{
+	if (unlikely(p4d_none(*p4d))) {
+		if (__pud_alloc(mm, p4d, address))
+			return NULL;
+		*mod_mask |= PGTBL_P4D_MODIFIED;
+	}
+
+	return pud_offset(p4d, address);
+}
+
+static inline pmd_t *pmd_alloc_track(struct mm_struct *mm, pud_t *pud,
+				     unsigned long address,
+				     pgtbl_mod_mask *mod_mask)
+{
+	if (unlikely(pud_none(*pud))) {
+		if (__pmd_alloc(mm, pud, address))
+			return NULL;
+		*mod_mask |= PGTBL_PUD_MODIFIED;
+	}
+
+	return pmd_offset(pud, address);
+}
+#endif /* CONFIG_MMU */
+
+#define pte_alloc_kernel_track(pmd, address, mask)			\
+	((unlikely(pmd_none(*(pmd))) &&					\
+	  (__pte_alloc_kernel(pmd) || ({*(mask)|=PGTBL_PMD_MODIFIED;0;})))?\
+		NULL: pte_offset_kernel(pmd, address))
+
+#endif /* _LINUX_PGALLLC_TRACK_H */
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 5a2b55c8dd9a..5be3cf3b59de 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -41,6 +41,7 @@
 #include <asm/shmparam.h>
 
 #include "internal.h"
+#include "pgalloc-track.h"
 
 bool is_vmalloc_addr(const void *x)
 {
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
