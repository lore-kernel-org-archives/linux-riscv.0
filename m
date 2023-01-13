Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0D9C3DA78
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 21:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dG9KhkRflb0eObikN9jOyGnhhBUGckXZLV2rlfgaOKo=; b=JKEw257yEdaAkV
	MZlxWrXf+NrdF1S1gmzu4L262ZNd8485BOlXPAUfQ2QBjAUvDlw5s4avu4mAh84H2fiRO45iB8oSK
	7FsvVw3bL29tmx449P+xz0Mw+5v4ZmcUnzCtNfgWlLyOPJpLdw+ZXFxco8yfjaSAAwmvk+rDjzX5v
	4/cFM26mCMVZZ9qb6SMGFNpUMZ0aX78hi1qdr0IQ2PhTzk/xzwIbknX0vqzhvYbAw93+7cxvlpLUG
	78Gocm8qameBXTtFKdaD4qQNuUxoWszf5tVmBs6tqtV6hoVEOku+7KOosaoNCPBxGHkoptpOz9F1q
	NCdf1xa+uTRQIhFn/ICw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRXJ-004bE5-UG; Fri, 13 Jan 2023 21:24:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRWm-004ayB-Pp
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 21:24:03 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pGRWl-0003WV-Dt; Fri, 13 Jan 2023 22:23:55 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH 4/4] RISC-V: add strcmp variant using zbb and fast-unaligned access
Date: Fri, 13 Jan 2023 22:23:51 +0100
Message-Id: <20230113212351.3534769-5-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230113212351.3534769-1-heiko@sntech.de>
References: <20230113212351.3534769-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_132356_896353_03B9815B 
X-CRM114-Status: GOOD (  17.85  )
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

On cores that can do unaligned access fast in hardware,
there are some more optimizations possible, so add a second
strcmp variant for that case.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/lib/strcmp.S | 170 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 169 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
index ce85bbbee4b9..53f41d032aae 100644
--- a/arch/riscv/lib/strcmp.S
+++ b/arch/riscv/lib/strcmp.S
@@ -9,7 +9,13 @@
 /* int strcmp(const char *cs, const char *ct) */
 SYM_FUNC_START(strcmp)
 
-	ALTERNATIVE_2("nop", "j strcmp_zbb", 0, CPUFEATURE_ZBB, 0, CONFIG_RISCV_ISA_ZBB)
+	ALTERNATIVE_2("nop",
+		      "j strcmp_zbb_unaligned", 0, 
+			CPUFEATURE_ZBB | CPUFEATURE_FAST_UNALIGNED, 0,
+			CONFIG_RISCV_ISA_ZBB,
+		      "j strcmp_zbb", 0,
+			CPUFEATURE_ZBB, CPUFEATURE_FAST_UNALIGNED,
+			CONFIG_RISCV_ISA_ZBB)
 
 	/*
 	 * Returns
@@ -116,6 +122,168 @@ strcmp_zbb:
 	sub	a0, t0, t1
 	ret
 
+strcmp_zbb_unaligned:
+
+	/*
+	 * Returns
+	 *   a0 - comparison result, value like strcmp
+	 *
+	 * Parameters
+	 *   a0 - string1
+	 *   a1 - string2
+	 *
+	 * Clobbers
+	 *   a3, a4, a5, a6, a7, t0, t1, t2, t3, t4, t5
+	 */
+
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+# error big endian is untested!
+# define CZ	ctz
+# define SHIFT	srl
+# define SHIFT2	sll
+#else
+# define CZ	ctz
+# define SHIFT	sll
+# define SHIFT2	srl
+#endif
+
+	/* a3...delta from a0 to a1.  */
+	sub	a3, a1, a0
+	li	a4, -1
+	andi	a7, a3, SZREG-1
+	andi	a5, a0, SZREG-1
+	bnez	a7, 7f
+	bnez	a5, 6f
+
+	.p2align 4
+1:
+	REG_L	t0, 0(a0)
+	add	a7, a0, a3
+	addi	a0, a0, SZREG
+	REG_L	t1, 0(a7)
+
+2:
+	orc.b	t3, t0
+	bne	t3, a4, 4f
+	beq	t0, t1, 1b
+
+	/* Words don't match, and no NUL byte in one word.
+	   Get bytes in big-endian order and compare as words.  */
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+	rev8	t0, t0
+	rev8	t1, t1
+#endif
+	/* Synthesize (t0 >= t1) ? 1 : -1 in a branchless sequence.  */
+	sltu	a0, t0, t1
+	neg	a0, a0
+	ori	a0, a0, 1
+	ret
+
+3:
+	orc.b	t3, t0
+4:
+	/* Words don't match or NUL byte in at least one word.
+	   t3 holds orc.b value of t0.  */
+	xor	a7, t0, t1
+	orc.b	a7, a7
+
+	orn	a7, a7, t3
+	CZ	t5, a7
+
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+	rev8	t0, t0
+	rev8	t1, t1
+#endif
+	sll	t0, t0, t5
+	sll	t1, t1, t5
+	srl	t0, t0, SZREG*8-8
+	srl	t1, t1, SZREG*8-8
+
+5:
+	sub	a0, t0, t1
+	ret
+
+	.p2align 4
+6:
+	/* Sources are mutually aligned, but are not currently at an
+	   alignment boundary.  Round down the addresses and then mask a3
+	   the bytes that precede the start point.  */
+	andi	a0, a0, -SZREG
+	add	a7, a0, a3
+	REG_L	t0, 0(a0)
+	addi	a0, a0, SZREG
+	REG_L	t1, 0(a7)
+	/* Get number of bits to mask.  */
+	sll	t5, a1, 3
+	/* Bits to mask are now 0, others are 1.  */
+	SHIFT	a7, a4, t5
+	/* Or with inverted value -> masked bits become 1.  */
+	orn	t0, t0, a7
+	orn	t1, t1, a7
+	j	2b
+
+7:
+	/* Skip slow loop if a0 is aligned.  */
+	beqz	a5, 9f
+8:
+	/* Align a0 to 8 bytes.  */
+	lbu	t0, 0(a0)
+	lbu	t1, 0(a1)
+	beqz	t0, 5b
+	bne	t0, t1, 5b
+	addi	a0, a0, 1
+	addi	a1, a1, 1
+	andi	a5, a0, SZREG-1
+	bnez	a5, 8b
+
+9:
+	/* a0 is aligned. Align a1 down and check for NUL there.
+	 * If there is no NUL, we may read the next word from a1.
+	 * If there is a NUL, we must not read a complete word from a1
+	 * because we might cross a page boundary.  */
+	/* Get number of bits to mask (upper bits are ignored by shifts).  */
+	sll	t5, a1, 3
+	/* a6 := align_down (a1)  */
+	andi	a6, a1, -SZREG
+	REG_L   t2, 0(a6)
+	addi	a6, a6, SZREG
+
+	/* Bits to mask are now 0, others are 1.  */
+	SHIFT	a7, a4, t5
+	/* Or with inverted value -> masked bits become 1.  */
+	orn	t4, t2, a7
+	/* Check for NUL in next aligned word.  */
+	orc.b	t4, t4
+	bne	t4, a4, 11f
+
+	.p2align 4
+10:
+	/* Read the (aligned) t0 and the unaligned t1.  */
+	REG_L	t0, 0(a0)
+	addi	a0, a0, SZREG
+	REG_L	t1, 0(a1)
+	addi	a1, a1, SZREG
+	orc.b	t3, t0
+	bne	t3, a4, 4b
+	bne	t0, t1, 4b
+
+	/* Read the next aligned-down word.  */
+	REG_L	t2, 0(a6)
+	addi	a6, a6, SZREG
+	orc.b	t4, t2
+	beq	t4, a4, 10b
+
+11:
+	/* a0 points to unread word (only first bytes relevant).
+	 * t2 holds next aligned-down word with NUL.
+	 * Compare the first bytes of t0 with the last bytes of t2.  */
+	REG_L	t0, 0(a0)
+	/* Shift NUL bytes into t2 to become t1.  */
+	SHIFT2	t1, t2, t5
+	bne	t0, t1, 3b
+	li	a0, 0
+	ret
+
 .option pop
 #endif
 SYM_FUNC_END(strcmp)
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
