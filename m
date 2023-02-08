Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B163C6379F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 22:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVbVmWeaicideOdpe+Kbuf7uk7ZKR6KhfS51W0tQsyY=; b=dWl+MuSouxsbS9
	HGs2NTSoIXlaPHRhdI9d5lGuLBdJ4slqqX6JFiChQ1oSOMO9SLbFUetRCIS5mBkLNzyftrlkYkmue
	mSfQrJZX4fYpg6J4JWwHEn51Wo28zYJ3gKK7QW3QprDxzKbfv1Ywi6h30GNTgSY0PECsYZ665ovbe
	9isGWbC6qXJ4pRsZPatYX1WLQM5vr6iqowXIJYKBVH6rt3H9WIlOV95g75EcNHNbK0i89YA+gmI6h
	t99k2i9rX4dB/bkS12hLTe3NZF7ZAJAfAO1tvb3boTjYE70lWpVc56M/t/e2iC40TFD4pkV5tUHwh
	9sp4x24irB3CGHOp6imw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPtJy-00H7t5-RO; Wed, 08 Feb 2023 22:53:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPtJt-00H7qB-CR
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 22:53:43 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pPtJi-0003OP-Vu; Wed, 08 Feb 2023 23:53:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@rivosinc.com
Cc: conor@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	christoph.muellner@vrull.eu,
	ajones@ventanamicro.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH 2/2] RISC-V: improve string-function assembly
Date: Wed,  8 Feb 2023 23:53:28 +0100
Message-Id: <20230208225328.1636017-3-heiko@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230208225328.1636017-1-heiko@sntech.de>
References: <20230208225328.1636017-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_145341_446405_48662B8B 
X-CRM114-Status: GOOD (  14.13  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

Adapt the suggestions for the assembly string functions that Andrew
suggested but that I didn't manage to include into the series that
got applied.

This includes improvements to two comments, removal of unneeded labels
and moving one instruction slightly higher to contradict an
explanatory comment.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/lib/strcmp.S  |  6 ++++--
 arch/riscv/lib/strlen.S  | 10 +++++-----
 arch/riscv/lib/strncmp.S | 16 +++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
index 8148b6418f61..fb186bf28f07 100644
--- a/arch/riscv/lib/strcmp.S
+++ b/arch/riscv/lib/strcmp.S
@@ -40,7 +40,9 @@ SYM_FUNC_START(strcmp)
 	ret
 
 /*
- * Variant of strcmp using the ZBB extension if available
+ * Variant of strcmp using the ZBB extension if available.
+ * The code was published as part of the bitmanip manual
+ * in Appendix A.
  */
 #ifdef CONFIG_RISCV_ISA_ZBB
 strcmp_zbb:
@@ -57,7 +59,7 @@ strcmp_zbb:
 	 *   a1 - string2
 	 *
 	 * Clobbers
-	 *   t0, t1, t2, t3, t4, t5
+	 *   t0, t1, t2, t3, t4
 	 */
 
 	or	t2, a0, a1
diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
index 0f9dbf93301a..898466f67000 100644
--- a/arch/riscv/lib/strlen.S
+++ b/arch/riscv/lib/strlen.S
@@ -96,7 +96,7 @@ strlen_zbb:
 	 * of valid bytes in this chunk.
 	 */
 	srli	a0, t1, 3
-	bgtu	t3, a0, 3f
+	bgtu	t3, a0, 2f
 
 	/* Prepare for the word comparison loop. */
 	addi	t2, t0, SZREG
@@ -112,20 +112,20 @@ strlen_zbb:
 	addi	t0, t0, SZREG
 	orc.b	t1, t1
 	beq	t1, t3, 1b
-2:
+
 	not	t1, t1
 	CZ	t1, t1
+	srli	t1, t1, 3
 
-	/* Get number of processed words.  */
+	/* Get number of processed bytes. */
 	sub	t2, t0, t2
 
 	/* Add number of characters in the first word.  */
 	add	a0, a0, t2
-	srli	t1, t1, 3
 
 	/* Add number of characters in the last word.  */
 	add	a0, a0, t1
-3:
+2:
 	ret
 
 .option pop
diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
index 7940ddab2d48..e36f5a6e1b16 100644
--- a/arch/riscv/lib/strncmp.S
+++ b/arch/riscv/lib/strncmp.S
@@ -70,7 +70,7 @@ strncmp_zbb:
 	li	t5, -1
 	and	t2, t2, SZREG-1
 	add	t4, a0, a2
-	bnez	t2, 4f
+	bnez	t2, 3f
 
 	/* Adjust limit for fast-path.  */
 	andi	t6, t4, -SZREG
@@ -114,23 +114,21 @@ strncmp_zbb:
 	ret
 
 	/* Simple loop for misaligned strings.  */
-3:
-	/* Restore limit for slow-path.  */
 	.p2align 3
-4:
-	bge	a0, t4, 6f
+3:
+	bge	a0, t4, 5f
 	lbu	t0, 0(a0)
 	lbu	t1, 0(a1)
 	addi	a0, a0, 1
 	addi	a1, a1, 1
-	bne	t0, t1, 5f
-	bnez	t0, 4b
+	bne	t0, t1, 4f
+	bnez	t0, 3b
 
-5:
+4:
 	sub	a0, t0, t1
 	ret
 
-6:
+5:
 	li	a0, 0
 	ret
 
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
