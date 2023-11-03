Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEFEC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 16:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCwWPRF2U7MGoqks47uDRorCGwNIpUjeQHVNKQpJGm8=; b=PpBCZDLmoW4+Ah
	MK4EFg173/pr0Zl/j+Yh8l1S7DzKjcY9xwOCSSS7nWpUPBddJDhk4k1xj2sybyHJz9IAmSUFuAPqE
	nVQ69nettl5St4L0NY1k7Y56aGGMt5iBxykOS8XH3SCsFOdSV8G6oM7OojFsMRS99J4CpYhUCGM9G
	rdAOCpOaqR2jCDCrsPOjtd9x1MpxYEvcMMrKUTb7HY015PsLHN9GuBm++jXv/SpAuvi0T+asYlmqw
	zA/DH3bCoJVEKg7k+26GYZNmSEwc0qbHLYxHUsGORFdmktTip90srlL8t4kSDb044c/3wW/a2BVJJ
	kiNSz0f9kcsRgluFIFNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyweF-00Bks1-1A;
	Fri, 03 Nov 2023 16:03:51 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyweA-00BkoW-0q
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 16:03:49 +0000
X-QQ-mid: bizesmtp82t1699027400trjco16j
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 04 Nov 2023 00:03:17 +0800 (CST)
X-QQ-SSF: 01200000000000B06000000A0000000
X-QQ-FEAT: 7jw2iSiCazpcnkkT53zBV9E5I5T5DJqx1+TFUtxUfN3lRCahCSRmfodfnKjxV
	CZUVooP/s2ON1Xc7NqKw/750amPGn/HA/QmC3hjD503kq78AFBll7c+JW7zZRKRKgJ0dcBA
	fXrP4Q/oKyJmpMBY1aZwrgZA1L/EGsKMQUoOR5PupOxOnqtERz2toMY1qeVlWz/p7KZxsIk
	nY3oUd1ez40xtO3mx3yORZ0/HqylV4ibH6wp8aFM49EMpckQtLLAlVtwabPzzZ1qoI8noCY
	kYqhHDaoRthiGZg8naGoZeJJbGLrnRX5aIuzhSSszoQ36q6A0qlPDzDhUQFX3EVfpuXiQec
	mHMA3CCDPcDduASmtFWHo2AIgBomj0FnSbxAaz5DqO7Pmr8zO8=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5481933520797404592
From: Yuan Tan <tanyuan@tinylab.org>
To: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	luc.vanoostenryck@gmail.com,
	linux-sparse@vger.kernel.org
Cc: linux@weissschuh.net,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	paulmck@kernel.org,
	tim.bird@sony.com,
	tsbogend@alpha.franken.de,
	w@1wt.eu,
	tanyuan@tinylab.org,
	i@maskray.me
Subject: [PATCH v1 12/14] DCE/DSE: riscv: build reference for .pushsection in assembly
Date: Sat,  4 Nov 2023 00:03:15 +0800
Message-Id: <26be8db18604f9a9e5eee9f03cc77ed034059d9a.1699025537.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699025537.git.tanyuan@tinylab.org>
References: <cover.1699025537.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_090346_639674_945E8809 
X-CRM114-Status: UNSURE (   9.15  )
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

Add the SECTION_SHF_LINK_ORDER method and the SECTION_SHF_GROUP method
to refactor __ASM_EXTABLE_RAW, so it won't produce orphan sections
anymore.

Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 arch/riscv/include/asm/asm-extable.h |  7 ++--
 arch/riscv/lib/uaccess.S             | 60 ++++++++++++++--------------
 2 files changed, 32 insertions(+), 35 deletions(-)

diff --git a/arch/riscv/include/asm/asm-extable.h b/arch/riscv/include/asm/asm-extable.h
index 7164d871e038..99e472b7a1be 100644
--- a/arch/riscv/include/asm/asm-extable.h
+++ b/arch/riscv/include/asm/asm-extable.h
@@ -29,7 +29,7 @@
 #endif
 
 #define __ASM_EXTABLE_RAW(insn, fixup, type, data)	\
-	.pushsection	__SECTION_NAME(__ex_table), "a";		\
+	__ASM_EXTABLE_PUSH_SECTION;			\
 	.balign		4;				\
 	.long		((insn) - .);			\
 	.long		((fixup) - .);			\
@@ -37,9 +37,8 @@
 	.short		(data);				\
 	.popsection;
 
-	.macro		_asm_extable, insn, fixup
-	__ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_FIXUP, 0)
-	.endm
+#define _asm_extable(insn, fixup)			\
+	__ASM_EXTABLE_RAW(insn, fixup, EX_TYPE_FIXUP, 0)
 
 #else /* __ASSEMBLY__ */
 
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 09b47ebacf2e..91c76d3fbe2f 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -4,11 +4,9 @@
 #include <asm/asm-extable.h>
 #include <asm/csr.h>
 
-	.macro fixup op reg addr lbl
-100:
-	\op \reg, \addr
-	_asm_extable	100b, \lbl
-	.endm
+#define fixup(op, reg, addr, lbl)	\
+	100: op reg, addr;		\
+	_asm_extable(100b, lbl)
 
 ENTRY(__asm_copy_to_user)
 ENTRY(__asm_copy_from_user)
@@ -50,9 +48,9 @@ ENTRY(__asm_copy_from_user)
 	beq	a0, t1, .Lskip_align_dst
 1:
 	/* a5 - one byte for copying data */
-	fixup lb      a5, 0(a1), 10f
+	fixup(lb, a5, 0(a1), 10f)
 	addi	a1, a1, 1	/* src */
-	fixup sb      a5, 0(a0), 10f
+	fixup(sb, a5, 0(a0), 10f)
 	addi	a0, a0, 1	/* dst */
 	bltu	a0, t1, 1b	/* t1 - start of aligned dst */
 
@@ -77,22 +75,22 @@ ENTRY(__asm_copy_from_user)
 	 */
 	addi	t0, t0, -(8*SZREG) /* not to over run */
 2:
-	fixup REG_L   a4,        0(a1), 10f
-	fixup REG_L   a5,    SZREG(a1), 10f
-	fixup REG_L   a6,  2*SZREG(a1), 10f
-	fixup REG_L   a7,  3*SZREG(a1), 10f
-	fixup REG_L   t1,  4*SZREG(a1), 10f
-	fixup REG_L   t2,  5*SZREG(a1), 10f
-	fixup REG_L   t3,  6*SZREG(a1), 10f
-	fixup REG_L   t4,  7*SZREG(a1), 10f
-	fixup REG_S   a4,        0(a0), 10f
-	fixup REG_S   a5,    SZREG(a0), 10f
-	fixup REG_S   a6,  2*SZREG(a0), 10f
-	fixup REG_S   a7,  3*SZREG(a0), 10f
-	fixup REG_S   t1,  4*SZREG(a0), 10f
-	fixup REG_S   t2,  5*SZREG(a0), 10f
-	fixup REG_S   t3,  6*SZREG(a0), 10f
-	fixup REG_S   t4,  7*SZREG(a0), 10f
+	fixup(REG_L, a4,        0(a1), 10f)
+	fixup(REG_L, a5,    SZREG(a1), 10f)
+	fixup(REG_L, a6,  2*SZREG(a1), 10f)
+	fixup(REG_L, a7,  3*SZREG(a1), 10f)
+	fixup(REG_L, t1,  4*SZREG(a1), 10f)
+	fixup(REG_L, t2,  5*SZREG(a1), 10f)
+	fixup(REG_L, t3,  6*SZREG(a1), 10f)
+	fixup(REG_L, t4,  7*SZREG(a1), 10f)
+	fixup(REG_S, a4,        0(a0), 10f)
+	fixup(REG_S, a5,    SZREG(a0), 10f)
+	fixup(REG_S, a6,  2*SZREG(a0), 10f)
+	fixup(REG_S, a7,  3*SZREG(a0), 10f)
+	fixup(REG_S, t1,  4*SZREG(a0), 10f)
+	fixup(REG_S, t2,  5*SZREG(a0), 10f)
+	fixup(REG_S, t3,  6*SZREG(a0), 10f)
+	fixup(REG_S, t4,  7*SZREG(a0), 10f)
 	addi	a0, a0, 8*SZREG
 	addi	a1, a1, 8*SZREG
 	bltu	a0, t0, 2b
@@ -130,7 +128,7 @@ ENTRY(__asm_copy_from_user)
 	sub	t4, a5, t3
 
 	/* Load the first word to combine with second word */
-	fixup REG_L   a5, 0(a1), 10f
+	fixup(REG_L, a5, 0(a1), 10f)
 
 3:
 	/* Main shifting copy
@@ -142,11 +140,11 @@ ENTRY(__asm_copy_from_user)
 
 	/* At least one iteration will be executed */
 	srl	a4, a5, t3
-	fixup REG_L   a5, SZREG(a1), 10f
+	fixup(REG_L, a5, SZREG(a1), 10f)
 	addi	a1, a1, SZREG
 	sll	a2, a5, t4
 	or	a2, a2, a4
-	fixup REG_S   a2, 0(a0), 10f
+	fixup(REG_S, a2, 0(a0), 10f)
 	addi	a0, a0, SZREG
 	bltu	a0, t1, 3b
 
@@ -163,9 +161,9 @@ ENTRY(__asm_copy_from_user)
 	 */
 	bgeu	a0, t0, .Lout_copy_user  /* check if end of copy */
 4:
-	fixup lb      a5, 0(a1), 10f
+	fixup(lb, a5, 0(a1), 10f)
 	addi	a1, a1, 1	/* src */
-	fixup sb      a5, 0(a0), 10f
+	fixup(sb, a5, 0(a0), 10f)
 	addi	a0, a0, 1	/* dst */
 	bltu	a0, t0, 4b	/* t0 - end of dst */
 
@@ -205,7 +203,7 @@ ENTRY(__clear_user)
 	bgeu t0, t1, 2f
 	bltu a0, t0, 4f
 1:
-	fixup REG_S, zero, (a0), 11f
+	fixup(REG_S, zero, (a0), 11f)
 	addi a0, a0, SZREG
 	bltu a0, t1, 1b
 2:
@@ -217,12 +215,12 @@ ENTRY(__clear_user)
 	li a0, 0
 	ret
 4: /* Edge case: unalignment */
-	fixup sb, zero, (a0), 11f
+	fixup(sb, zero, (a0), 11f)
 	addi a0, a0, 1
 	bltu a0, t0, 4b
 	j 1b
 5: /* Edge case: remainder */
-	fixup sb, zero, (a0), 11f
+	fixup(sb, zero, (a0), 11f)
 	addi a0, a0, 1
 	bltu a0, a3, 5b
 	j 3b
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
