Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8085E7718D
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 15:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18mdsxLNEHTjFXh4UBsRiYapVKuxDbCLf17yxk0VuVI=; b=hmt7UgV7YISjtQ
	QMuzKQ1brqCvx4gE765lexLMHaVSkeOlRJ5R6+GPpfJQ7b8/+3F+q/B+OEHNAO+m6wZq3xXFKVOnT
	Lbe5EBNGUzFu3CPcCWT8YYx7ZMRBMN7QvEUdY379eWtPm0OEf64Za7JSqKhgWR22n6Ym17X6IoIs7
	0WR3lLvY6V1gF7rW6C+1IatTbrlRcqD5D/BDqhvvnSJk7T6erviH8GZ4ab5SuMVqz3lMWDiMAsFjl
	FlzXReRHWkn6m1zREQJ/++8zPmJkLU2czSBjjQemhM91fYcqlLkvqC9xYHsictmx8h95U321VJDez
	MCviwRBQkm+fzwgMPJlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOK-00000005NwK-1fWf;
	Fri, 20 Dec 2024 15:58:16 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOF-00000005Nqh-26bI
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 15:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AuhkpriSa43or7c14nqod3pbLZV+TBelgd27m0CLnto=; b=lhCnL2Dg5qytf1Rg+poMdXhoxr
	eYaHQTeXWcRRwBPW7UzAsYE27ExGC/XVT/veUGSfVys5WmmMKepXkCCzozqCBSEFzLBkTltsHXJBZ
	BSuc3k4JZ+NB0a9Dz96BZauqMOrgFGHKAgNsNZa3qliIF/cdcF8gek6d0yHD/FnFh9ONfqsCEmvjY
	bMDjHLuh7QjHwYBY/67TBdzwZXePWhCbcgcOKX8E2C4Kz4siLGBhIV8uPgsYqVzKY2e7AgWgsDZvh
	MDcha1Bc/7ihsHwVYFqsUebMLTvzP+PeWArc3MOQWNobYJx+eyazFePl6lwDGGTnYbFlZpWYrHDYc
	hopNLV4Q==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tOfOA-006axo-6F; Fri, 20 Dec 2024 15:58:06 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tOfO9-00000008LT3-3OxI;
	Fri, 20 Dec 2024 15:58:05 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: felix.chong@codethink.co.uk,
	lawrence.hunter@codethink.co.uk,
	roan.richmond@codethink.co.uk,
	linux-riscv@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 09/15] temp: remove various library optimisations
Date: Fri, 20 Dec 2024 15:57:55 +0000
Message-Id: <20241220155801.1988785-10-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
References: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_075811_607364_2D462E5E 
X-CRM114-Status: GOOD (  12.40  )
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

These either need fixing or checking for big endian.

- memove is deifentyl not working
- ignore memset and  memcpy optimisation for now
- uaccess code needs fixing
---
 arch/riscv/lib/memcpy.S  | 22 +++++++++++++++++++++-
 arch/riscv/lib/memmove.S |  2 +-
 arch/riscv/lib/memset.S  |  1 +
 arch/riscv/lib/strlen.S  |  2 +-
 arch/riscv/lib/uaccess.S |  7 +++++--
 5 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/lib/memcpy.S b/arch/riscv/lib/memcpy.S
index 44e009ec5fef..b51380f06204 100644
--- a/arch/riscv/lib/memcpy.S
+++ b/arch/riscv/lib/memcpy.S
@@ -7,12 +7,15 @@
 #include <asm/asm.h>
 
 /* void *memcpy(void *, const void *, size_t) */
-SYM_FUNC_START(__memcpy)
+SYM_FUNC_START(__memcpy1)
 	move t6, a0  /* Preserve return value */
 
 	/* Defer to byte-oriented copy for small sizes */
 	sltiu a3, a2, 128
+	j	4f	/* for now just always use bytes */	
+
 	bnez a3, 4f
+
 	/* Use word-oriented copy only if low-order bits match */
 	andi a3, t6, SZREG-1
 	andi a4, a1, SZREG-1
@@ -87,6 +90,7 @@ SYM_FUNC_START(__memcpy)
 	or a5, a5, a3
 	andi a5, a5, 3
 	bnez a5, 5f
+	j	5f	/* skip word */
 7:
 	lw a4, 0(a1)
 	addi a1, a1, 4
@@ -104,6 +108,22 @@ SYM_FUNC_START(__memcpy)
 	bltu a1, a3, 5b
 6:
 	ret
+
+SYM_FUNC_START(__memcpy)
+	move t6, a0  /* Preserve return value */
+	beqz a2, 6f
+	add a3, a1, a2
+
+5:
+	lb a4, 0(a1)
+	addi a1, a1, 1
+	sb a4, 0(t6)
+	addi t6, t6, 1
+	bltu a1, a3, 5b
+6:
+	ret
+
+
 SYM_FUNC_END(__memcpy)
 SYM_FUNC_ALIAS_WEAK(memcpy, __memcpy)
 SYM_FUNC_ALIAS(__pi_memcpy, __memcpy)
diff --git a/arch/riscv/lib/memmove.S b/arch/riscv/lib/memmove.S
index cb3e2e7ef0ba..c51475e4f3ce 100644
--- a/arch/riscv/lib/memmove.S
+++ b/arch/riscv/lib/memmove.S
@@ -60,7 +60,7 @@ SYM_FUNC_START(__memmove)
 	 */
 	andi t0, a2, -(2 * SZREG)
 	beqz t0, .Lbyte_copy
-
+	j .Lbyte_copy
 	/*
 	 * Now solve for t5 and t6.
 	 */
diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
index da23b8347e2d..a3cd79cb33b4 100644
--- a/arch/riscv/lib/memset.S
+++ b/arch/riscv/lib/memset.S
@@ -14,6 +14,7 @@ SYM_FUNC_START(__memset)
 	/* Defer to byte-oriented fill for small sizes */
 	sltiu a3, a2, 16
 	bnez a3, 4f
+	j 4f /* disabel optimised for now */
 
 	/*
 	 * Round to nearest XLEN-aligned address
diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
index 962983b73251..bea650fd24af 100644
--- a/arch/riscv/lib/strlen.S
+++ b/arch/riscv/lib/strlen.S
@@ -8,7 +8,7 @@
 /* int strlen(const char *s) */
 SYM_FUNC_START(strlen)
 
-	ALTERNATIVE("nop", "j strlen_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB)
+	/*ALTERNATIVE("nop", "j strlen_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB)*/
 
 	/*
 	 * Returns
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 6a9f116bb545..3d7da86277bb 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -46,7 +46,8 @@ SYM_FUNC_START(fallback_scalar_usercopy)
 	 */
 	li	a3, 9*SZREG-1 /* size must >= (word_copy stride + SZREG-1) */
 	bltu	a2, a3, .Lbyte_copy_tail
-
+	j	.Lbyte_copy_tail
+	
 	/*
 	 * Copy first bytes until dst is aligned to word boundary.
 	 * a0 - start of dst
@@ -73,7 +74,9 @@ SYM_FUNC_START(fallback_scalar_usercopy)
 	 */
 	/* a1 - start of src */
 	andi	a3, a1, SZREG-1
-	bnez	a3, .Lshift_copy
+	/*	bnez	a3, .Lshift_copy */
+	/* for now, ignore shift copy until fixed */
+	bnez	a3, .Lbyte_copy_tail
 
 .Lword_copy:
         /*
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
