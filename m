Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F683C44538
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 06:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AfCgxEeRnzopLIik5fTqEH8gGRoetmAKseIkW61ZMLY=; b=pJ/0qqfQrjAo97
	7PdUib1yv2kjovd0dKzJWw+Rh3inNACqmC3RdrgPM+2dLyUaMJhsArU357F4DNl9drzr5X7hNlQx7
	j39RpTv/QWyPt5ppFutMlBwLWz+z8Z1tgfyTOGsL8Con8Km1PAlFrM35g3JpM+LdaCbxDRRgUQpRv
	lC+qUtYEVHbWE0JZmw4/y5Aoh5fx6peNUZHupI/xpnzIY3+aepgVXOLtcCCMAOc2SNtep6qd5aYGA
	r76UjtYhUDkgEONYw+GypIaiyFvhJeNQ/Hy6tzjU9aw5lIiTNXxJi/U6cSvk+erA7e2RMnMlXdDln
	tip/i3wfaoELSf5VbHYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQg7-0000000AzGU-3q5c;
	Wed, 22 Jul 2026 06:43:39 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQg5-0000000AzEv-2S5E
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 06:43:39 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4h4l8002hbz5B14y;
	Wed, 22 Jul 2026 14:43:28 +0800 (CST)
Received: from szxl2zmapp07.zte.com.cn ([10.1.32.52])
	by mse-fl2.zte.com.cn with SMTP id 66M6hMBr024367;
	Wed, 22 Jul 2026 14:43:22 +0800 (+08)
	(envelope-from gao.rui@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Wed, 22 Jul 2026 14:43:24 +0800
X-Zmail-TransId: 3e816a60668b00d-a0a85
X-Zmail-LocalSMTP: 1
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-Zmail-RealSender: gao.rui@zte.com.cn
From: Gao Rui <gao.rui@zte.com.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Feng Jiang <jiangfeng@kylinos.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gao Rui <gao.rui@zte.com.cn>
Subject: [PATCH 1/2] riscv: strnlen: fix ZBB path overflow and SIZE_MAX fallback
Date: Wed, 22 Jul 2026 14:40:26 +0800
Message-ID: <20260722064037.1111467-2-gao.rui@zte.com.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260722064037.1111467-1-gao.rui@zte.com.cn>
References: <20260722064037.1111467-1-gao.rui@zte.com.cn>
MIME-Version: 1.0
X-MAIL: mse-fl2.zte.com.cn 66M6hMBr024367
X-TLS: YES
X-ENVELOPE-SENDER: gao.rui@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Wed, 22 Jul 2026 14:43:28 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A60668F.000/4h4l8002hbz5B14y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_234337_787619_4C254517 
X-CRM114-Status: GOOD (  11.48  )
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

This patch improves the RISC-V strnlen implementation:

- Add explicit fallback to generic path when count == SIZE_MAX,
  avoiding minu instruction misbehavior.
- Add overflow check for (s + count), ensuring safe fallback
  when address addition wraps around.
- Refactor aligned boundary calculation to use (s + count - 1),
  preventing word loads beyond the valid range.
- Add fast exit when all remaining bytes are within the first word.
- Simplify generic path loop with clearer pointer/count handling.

These changes fix potential off-by-one, overflow, and extreme
input bugs, while keeping ZBB optimization for normal cases.

Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
Signed-off-by: Gao Rui <gao.rui@zte.com.cn>
---
 arch/riscv/lib/strnlen.S | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
index 53afa7b5b314..fc5d578bbffe 100644
--- a/arch/riscv/lib/strnlen.S
+++ b/arch/riscv/lib/strnlen.S
@@ -17,6 +17,7 @@ SYM_FUNC_START(strnlen)
 	__ALTERNATIVE_CFG("nop", "j strnlen_zbb", 0, RISCV_ISA_EXT_ZBB,
 		IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))
 
+strnlen_generic:
 
 	/*
 	 * Returns
@@ -27,20 +28,24 @@ SYM_FUNC_START(strnlen)
 	 *   a1 - Max length of string
 	 *
 	 * Clobbers
-	 *   t0, t1, t2
+	 *   t0, t1
 	 */
-	addi	t1, a0, -1
-	add	t2, a0, a1
+	mv	t1, a0
+
 1:
-	addi	t1, t1, 1
-	beq	t1, t2, 2f
+	beqz	a1, 2f
+	addi	a1, a1, -1
+
 	lbu	t0, 0(t1)
-	bnez	t0, 1b
+	beqz	t0, 2f
+
+	addi	t1, t1, 1
+	j	1b
+
 2:
 	sub	a0, t1, a0
 	ret
 
-
 /*
  * Variant of strnlen using the ZBB extension if available
  */
@@ -73,6 +78,16 @@ strnlen_zbb:
 	/* If maxlen is 0, return 0. */
 	beqz	a1, 3f
 
+	/*
+	 * Fallback to generic implementation when count is large enough to
+	 * cause address overflow in the ZBB optimized path, or when count
+	 * equals SIZE_MAX where the minu instruction misbehaves.
+	 */
+	li	t5, -1
+	beq	a1, t5, strnlen_generic		/* count == SIZE_MAX */
+	add	t4, a0, a1
+	bltu	t4, a0, strnlen_generic		/* a0 + a1 overflow */
+
 	/* Number of irrelevant bytes in the first word. */
 	andi	t2, a0, SZREG-1
 
@@ -83,8 +98,12 @@ strnlen_zbb:
 	sub	t3, t3, t2
 	slli	t2, t2, 3
 
-	/* Aligned boundary. */
-	add	t4, a0, a1
+	/*
+	 * Aligned boundary.  Use the address of the last valid byte
+	 * (s + count - 1) to avoid loading a word past the count
+	 * boundary in the loop below.  count == 0 is handled above.
+	 */
+	addi	t4, t4, -1
 	andi	t4, t4, -SZREG
 
 	/* Get the first word.  */
@@ -120,6 +139,9 @@ strnlen_zbb:
 
 	bgtu	t3, a0, 2f
 
+	/* All remaining bytes are in the first word, no loop needed. */
+	bgeu	t0, t4, 2f
+
 	/* Prepare for the word comparison loop. */
 	addi	t2, t0, SZREG
 	li	t3, -1
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
