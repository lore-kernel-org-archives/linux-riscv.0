Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20085C38150
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 07:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G0WsIh4SaNwocbAFFmv1Lj33iTPjrNkBe4/7InMu30Y=; b=G9B3yAFcoG00Ba
	TnNFuvGwWvz7yIiB2kANxFLbrtJTdEynmDdesRT5SO7ntIjwKgD2wC+qWcGQXvDspBSH0Q1Z2otux
	Djow5irEeRiexnHdTnNk970au3vdYI16DJcr+bgpmgGkLa7PvCUh3JVeZdK0y9zFhEL9H5ihmPew/
	IGRffzDmTwtwVRuVcbKcHwSYmo/ysCK7ipMeZdmqz97IsZ8llGgrutG0wouq8xKcH59g2rfYiIN86
	D+wcvYtIxmVKHOw6gKBZf+VrLoM2LPCAcy04f1aS23IvHWbgGeLMV6jDE866wjaAoisPJFwk+YmjL
	ZE0PnYo0d/hlLfmEp84g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRS7J-00000009n8G-1zFy;
	Wed, 10 Jul 2024 07:51:57 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRS7G-00000009n4h-20nc
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 07:51:55 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WJqn86kSVz9sT0;
	Wed, 10 Jul 2024 09:51:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DO_FCbpqAp2z; Wed, 10 Jul 2024 09:51:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WJqmw5Xm4z9sTL;
	Wed, 10 Jul 2024 09:51:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AEAED8B778;
	Wed, 10 Jul 2024 09:51:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id F75U0umoaS2G; Wed, 10 Jul 2024 09:51:28 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.26])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6EC4A8B766;
	Wed, 10 Jul 2024 09:51:28 +0200 (CEST)
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
Subject: [PATCH v2 3/3] mm: Add p{g/4}d_leaf() in asm-generic/pgtable-nop{4/u}d.h
Date: Wed, 10 Jul 2024 09:51:22 +0200
Message-ID: <f69941b076bf8fec89b6bec5573fdb79483c2a75.1720597744.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <bcd6ab8246348f18fdc77694e321ee6458f05781.1720597744.git.christophe.leroy@csgroup.eu>
References: <bcd6ab8246348f18fdc77694e321ee6458f05781.1720597744.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720597882; l=2461; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=KrmMH7bKbT2qDBAZ6LB+t1vXN/9qd6MtCCjJv9qO9v0=; b=pGaWWJEGDivcTq/5LpqkCHIxHohVMbXxhf5suF8mh+EeYylaNrKQXv2k5AEG2JkUQc5H3Jal6 i+vMA84HOjbCpusC+m6HDo5+DieuE1RR+YB2uewJR0SbO5l1KYE5xsN
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_005154_700443_92F0CBC0 
X-CRM114-Status: UNSURE (   9.02  )
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

Commit 2c8a81dc0cc5 ("riscv/mm: fix two page table check related
issues") added pud_leaf() in include/asm-generic/pgtable-nopmd.h

Do the same for p4d_leaf() and pgd_leaf() to avoid getting them
erroneously defined by architectures that do not implement the
related page level.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Added pXd_leaf macro as well in asm-generic/pgtable-nopXd.h to cohabit with the fallback
---
 include/asm-generic/pgtable-nop4d.h | 2 ++
 include/asm-generic/pgtable-nopmd.h | 1 +
 include/asm-generic/pgtable-nopud.h | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/include/asm-generic/pgtable-nop4d.h b/include/asm-generic/pgtable-nop4d.h
index 03b7dae47dd4..ed7ba008469f 100644
--- a/include/asm-generic/pgtable-nop4d.h
+++ b/include/asm-generic/pgtable-nop4d.h
@@ -21,6 +21,8 @@ typedef struct { pgd_t pgd; } p4d_t;
 static inline int pgd_none(pgd_t pgd)		{ return 0; }
 static inline int pgd_bad(pgd_t pgd)		{ return 0; }
 static inline int pgd_present(pgd_t pgd)	{ return 1; }
+static inline int pgd_leaf(pgd_t pgd)		{ return 0; }
+#define pgd_leaf pgd_leaf
 static inline void pgd_clear(pgd_t *pgd)	{ }
 #define p4d_ERROR(p4d)				(pgd_ERROR((p4d).pgd))
 
diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
index b01349a312fa..e178ace2e23e 100644
--- a/include/asm-generic/pgtable-nopmd.h
+++ b/include/asm-generic/pgtable-nopmd.h
@@ -31,6 +31,7 @@ static inline int pud_none(pud_t pud)		{ return 0; }
 static inline int pud_bad(pud_t pud)		{ return 0; }
 static inline int pud_present(pud_t pud)	{ return 1; }
 static inline int pud_leaf(pud_t pud)		{ return 0; }
+#define pud_leaf pud_leaf
 static inline void pud_clear(pud_t *pud)	{ }
 #define pmd_ERROR(pmd)				(pud_ERROR((pmd).pud))
 
diff --git a/include/asm-generic/pgtable-nopud.h b/include/asm-generic/pgtable-nopud.h
index eb70c6d7ceff..655dfebea91c 100644
--- a/include/asm-generic/pgtable-nopud.h
+++ b/include/asm-generic/pgtable-nopud.h
@@ -28,6 +28,8 @@ typedef struct { p4d_t p4d; } pud_t;
 static inline int p4d_none(p4d_t p4d)		{ return 0; }
 static inline int p4d_bad(p4d_t p4d)		{ return 0; }
 static inline int p4d_present(p4d_t p4d)	{ return 1; }
+static inline int p4d_leaf(p4d_t p4d)		{ return 0; }
+#define p4d_leaf p4d_leaf
 static inline void p4d_clear(p4d_t *p4d)	{ }
 #define pud_ERROR(pud)				(p4d_ERROR((pud).p4d))
 
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
