Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ADFC77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 01:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2y21cKwW0nngXmIfI0nOvb8e6GqqbMZpoHWKgp79FYE=; b=nyDPrbqV9+u9cz
	7VeIa1z6GANamlTHtqIV7y1THqmoT4Hns4DkqAOeH1TtBnGm+aHtiE3fXsn2TI48hwovJupGJr43K
	JE7yhEpORVcGqne17JlHJCRYasF4CVTq8xSclawWJGHGoYvBvBvdHymMiWPsN6gDQ2U2zVk9WYowx
	pjw7/ofBjmdoafvQso665NiNf6FEcIsQT9B+G0H/zGwBYbDQrlTZCxFcaeXTriKpkdIPkQhaXs9PS
	pTdFgYVsCqHaLsbaXXVlYMd9bUKnfnBQYv1+9+prS4RkmlbqsZ5U0uFmjWrlzXzBcaWcaweucf34L
	G3I1HRRFxYreVIZSdMAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwv9E-007RbG-0R;
	Thu, 11 May 2023 01:31:12 +0000
Received: from m12.mail.163.com ([220.181.12.199])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwv9B-007Raf-0O
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 01:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Mxl2w
	NE+hmoN5CP0uUbBqPWQ/Uij5D+8xp99kCZL0l4=; b=NgycCNmjS/iGd+YGRwyZJ
	1KtUjA98iDtPZCKQGpSqcDvaRFDfMyMAZhmSuei6wclVes57hqL75bJpIsA18Zy0
	jcFMJaxSD383KKfvvt/qz2KU3QgTZODu6xSLUadZIrRlX2nlpFx9XJu0y9Vq20ut
	HvEOH5pslsyLGgO2ZrUzXg=
Received: from zhangf-virtual-machine.localdomain (unknown [180.111.102.183])
	by zwqz-smtp-mta-g2-0 (Coremail) with SMTP id _____wDX3uZPRVxk0OcZBg--.52349S2;
	Thu, 11 May 2023 09:30:56 +0800 (CST)
From: zhangfei <zhang_fei_0403@163.com>
To: zhang_fei_0403@163.com
Cc: ajones@ventanamicro.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	zhangfei@nj.iscas.ac.cn
Subject: [PATCH v2 1/2] RISC-V: lib: Improve memset assembler formatting
Date: Thu, 11 May 2023 09:30:52 +0800
Message-Id: <20230511013052.3255-1-zhang_fei_0403@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511012604.3222-1-zhang_fei_0403@163.com>
References: <20230511012604.3222-1-zhang_fei_0403@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDX3uZPRVxk0OcZBg--.52349S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF4fGF13Aw45Cr4kArW8Zwb_yoWrtF4fpw
	4fG34rGayqkF1rW34YqFyrtFWDJw4Sq3Z5Xw1ayr12kr1UKry7Za4qqFW5twnFyrW3ur4D
	ZF1DJrW7ZFy5XrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U79N-UUUUU=
X-Originating-IP: [180.111.102.183]
X-CM-SenderInfo: x2kd0w5bihxsiquqjqqrwthudrp/xtbCfApsl2DcJgttvwAAsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_183109_516666_1DAD8F8B 
X-CRM114-Status: GOOD (  11.34  )
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

From: Andrew Jones <ajones@ventanamicro.com>

Aligning the first operand of each instructions with a tab is a
typical style which improves readability. Apply it to memset.S.
While there, we also make a small grammar change to a comment.

No functional change intended.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Fei Zhang <zhangfei@nj.iscas.ac.cn>
---
 arch/riscv/lib/memset.S | 143 ++++++++++++++++++++--------------------
 1 file changed, 72 insertions(+), 71 deletions(-)

diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
index 34c5360c6705..e613c5c27998 100644
--- a/arch/riscv/lib/memset.S
+++ b/arch/riscv/lib/memset.S
@@ -3,111 +3,112 @@
  * Copyright (C) 2013 Regents of the University of California
  */
 
-
 #include <linux/linkage.h>
 #include <asm/asm.h>
 
 /* void *memset(void *, int, size_t) */
 ENTRY(__memset)
 WEAK(memset)
-	move t0, a0  /* Preserve return value */
+	move	t0, a0			/* Preserve return value */
 
 	/* Defer to byte-oriented fill for small sizes */
-	sltiu a3, a2, 16
-	bnez a3, 4f
+	sltiu	a3, a2, 16
+	bnez	a3, 4f
 
 	/*
 	 * Round to nearest XLEN-aligned address
-	 * greater than or equal to start address
+	 * greater than or equal to the start address.
 	 */
-	addi a3, t0, SZREG-1
-	andi a3, a3, ~(SZREG-1)
-	beq a3, t0, 2f  /* Skip if already aligned */
+	addi	a3, t0, SZREG-1
+	andi	a3, a3, ~(SZREG-1)
+	beq	a3, t0, 2f		/* Skip if already aligned */
+
 	/* Handle initial misalignment */
-	sub a4, a3, t0
+	sub	a4, a3, t0
 1:
-	sb a1, 0(t0)
-	addi t0, t0, 1
-	bltu t0, a3, 1b
-	sub a2, a2, a4  /* Update count */
+	sb	a1, 0(t0)
+	addi	t0, t0, 1
+	bltu	t0, a3, 1b
+	sub	a2, a2, a4		/* Update count */
 
 2: /* Duff's device with 32 XLEN stores per iteration */
 	/* Broadcast value into all bytes */
-	andi a1, a1, 0xff
-	slli a3, a1, 8
-	or a1, a3, a1
-	slli a3, a1, 16
-	or a1, a3, a1
+	andi	a1, a1, 0xff
+	slli	a3, a1, 8
+	or	a1, a3, a1
+	slli	a3, a1, 16
+	or	a1, a3, a1
 #ifdef CONFIG_64BIT
-	slli a3, a1, 32
-	or a1, a3, a1
+	slli	a3, a1, 32
+	or	a1, a3, a1
 #endif
 
 	/* Calculate end address */
-	andi a4, a2, ~(SZREG-1)
-	add a3, t0, a4
+	andi	a4, a2, ~(SZREG-1)
+	add	a3, t0, a4
 
-	andi a4, a4, 31*SZREG  /* Calculate remainder */
-	beqz a4, 3f            /* Shortcut if no remainder */
-	neg a4, a4
-	addi a4, a4, 32*SZREG  /* Calculate initial offset */
+	andi	a4, a4, 31*SZREG	/* Calculate remainder */
+	beqz	a4, 3f			/* Shortcut if no remainder */
+	neg	a4, a4
+	addi	a4, a4, 32*SZREG	/* Calculate initial offset */
 
 	/* Adjust start address with offset */
-	sub t0, t0, a4
+	sub	t0, t0, a4
 
 	/* Jump into loop body */
 	/* Assumes 32-bit instruction lengths */
-	la a5, 3f
+	la	a5, 3f
 #ifdef CONFIG_64BIT
-	srli a4, a4, 1
+	srli	a4, a4, 1
 #endif
-	add a5, a5, a4
-	jr a5
+	add	a5, a5, a4
+	jr	a5
 3:
-	REG_S a1,        0(t0)
-	REG_S a1,    SZREG(t0)
-	REG_S a1,  2*SZREG(t0)
-	REG_S a1,  3*SZREG(t0)
-	REG_S a1,  4*SZREG(t0)
-	REG_S a1,  5*SZREG(t0)
-	REG_S a1,  6*SZREG(t0)
-	REG_S a1,  7*SZREG(t0)
-	REG_S a1,  8*SZREG(t0)
-	REG_S a1,  9*SZREG(t0)
-	REG_S a1, 10*SZREG(t0)
-	REG_S a1, 11*SZREG(t0)
-	REG_S a1, 12*SZREG(t0)
-	REG_S a1, 13*SZREG(t0)
-	REG_S a1, 14*SZREG(t0)
-	REG_S a1, 15*SZREG(t0)
-	REG_S a1, 16*SZREG(t0)
-	REG_S a1, 17*SZREG(t0)
-	REG_S a1, 18*SZREG(t0)
-	REG_S a1, 19*SZREG(t0)
-	REG_S a1, 20*SZREG(t0)
-	REG_S a1, 21*SZREG(t0)
-	REG_S a1, 22*SZREG(t0)
-	REG_S a1, 23*SZREG(t0)
-	REG_S a1, 24*SZREG(t0)
-	REG_S a1, 25*SZREG(t0)
-	REG_S a1, 26*SZREG(t0)
-	REG_S a1, 27*SZREG(t0)
-	REG_S a1, 28*SZREG(t0)
-	REG_S a1, 29*SZREG(t0)
-	REG_S a1, 30*SZREG(t0)
-	REG_S a1, 31*SZREG(t0)
-	addi t0, t0, 32*SZREG
-	bltu t0, a3, 3b
-	andi a2, a2, SZREG-1  /* Update count */
+	REG_S	a1,        0(t0)
+	REG_S	a1,    SZREG(t0)
+	REG_S	a1,  2*SZREG(t0)
+	REG_S	a1,  3*SZREG(t0)
+	REG_S	a1,  4*SZREG(t0)
+	REG_S	a1,  5*SZREG(t0)
+	REG_S	a1,  6*SZREG(t0)
+	REG_S	a1,  7*SZREG(t0)
+	REG_S	a1,  8*SZREG(t0)
+	REG_S	a1,  9*SZREG(t0)
+	REG_S	a1, 10*SZREG(t0)
+	REG_S	a1, 11*SZREG(t0)
+	REG_S	a1, 12*SZREG(t0)
+	REG_S	a1, 13*SZREG(t0)
+	REG_S	a1, 14*SZREG(t0)
+	REG_S	a1, 15*SZREG(t0)
+	REG_S	a1, 16*SZREG(t0)
+	REG_S	a1, 17*SZREG(t0)
+	REG_S	a1, 18*SZREG(t0)
+	REG_S	a1, 19*SZREG(t0)
+	REG_S	a1, 20*SZREG(t0)
+	REG_S	a1, 21*SZREG(t0)
+	REG_S	a1, 22*SZREG(t0)
+	REG_S	a1, 23*SZREG(t0)
+	REG_S	a1, 24*SZREG(t0)
+	REG_S	a1, 25*SZREG(t0)
+	REG_S	a1, 26*SZREG(t0)
+	REG_S	a1, 27*SZREG(t0)
+	REG_S	a1, 28*SZREG(t0)
+	REG_S	a1, 29*SZREG(t0)
+	REG_S	a1, 30*SZREG(t0)
+	REG_S	a1, 31*SZREG(t0)
+
+	addi	t0, t0, 32*SZREG
+	bltu	t0, a3, 3b
+	andi	a2, a2, SZREG-1		/* Update count */
 
 4:
 	/* Handle trailing misalignment */
-	beqz a2, 6f
-	add a3, t0, a2
+	beqz	a2, 6f
+	add	a3, t0, a2
 5:
-	sb a1, 0(t0)
-	addi t0, t0, 1
-	bltu t0, a3, 5b
+	sb	a1, 0(t0)
+	addi	t0, t0, 1
+	bltu	t0, a3, 5b
 6:
 	ret
 END(__memset)
-- 
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
