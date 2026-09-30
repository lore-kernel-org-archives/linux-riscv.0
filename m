Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D87ECA5FA5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 01:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GYh7J+I776fJ56nMEBERhIZtNPE2NDNmhkH30vnrkp4=; b=t9reQjy3Wvviab
	PcmARfaBEAXIVrPkvX3YSPTBqIgAyB2wpv/amcDeXlprQfZdfbWO95FcK0TbIQO8owbyiX6RSl2eA
	SI/4X5B+uBepwpijePov8sJPy4rT1U7eZ0mNlLvshmWHNA+UZDpwdMQ91P84Qx/J+EcShQ5O7f9xO
	etXFtutGoUa9W0IAHY14uIJNrqyrxN28TU6rHcBLzqcvm6pa5pvq3d/mePYB+qfEDy3EruTgaQj2O
	FIZ9BEEMdcMi9L9ZX4HStST/g3Ew8Tflu2j46kGGEwKaAihpvUeRZUaGm96NWL7srnlahF7Y+p0dK
	KJKTfmL10CvsFuq9+ytA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBjRb-00000004svh-3skB;
	Wed, 30 Sep 2026 01:49:15 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBjRZ-00000004sug-1jyQ
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 01:49:15 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hvdJ05lPjz5BNRf;
	Wed, 30 Sep 2026 09:49:04 +0800 (CST)
Received: from szxlzmapp01.zte.com.cn ([10.5.231.85])
	by mse-fl2.zte.com.cn with SMTP id 68U1mu9a068312;
	Wed, 30 Sep 2026 09:48:56 +0800 (+08)
	(envelope-from gao.rui@zte.com.cn)
Received: from mapi (szxlzmapp04[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 30 Sep 2026 09:48:57 +0800 (CST)
X-Zmail-TransId: 2b066abc6a899f1-0e97a
X-Mailer: Zmail v1.0
Message-ID: <202609300948576198tT3nfO5VwsTwUw23gA9v@zte.com.cn>
Date: Wed, 30 Sep 2026 09:48:57 +0800 (CST)
Mime-Version: 1.0
From: <gao.rui@zte.com.cn>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <jiangfeng@kylinos.cn>,
        <david.laight.linux@gmail.com>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <jmontleo@redhat.com>
Subject: =?UTF-8?B?W1BBVENIIHYzXSByaXNjdjogZml4IHN0cm5sZW4oKSBvdmVyZmxvdyBpbiBaYmIgaW1wbGVtZW50YXRpb24=?=
X-MAIL: mse-fl2.zte.com.cn 68U1mu9a068312
X-TLS: YES
X-ENVELOPE-SENDER: gao.rui@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Wed, 30 Sep 2026 09:49:04 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6ABC6A90.000/4hvdJ05lPjz5BNRf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_184913_759285_82B7B23D 
X-CRM114-Status: GOOD (  14.27  )
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

riscv: fix strnlen() overflow in Zbb implementation

The RISC-V Zbb optimized strnlen() implementation can return incorrect
results when very large count values are supplied.

The previous implementation calculates an end address based on the
input pointer and count. When count is close to SIZE_MAX, the address
calculation may overflow, resulting in incorrect termination checks and
wrong return values.

This issue was observed while running device-mapper tests:

dmsetup create testname9 --table "0 8 zero"
cat /sys/block/dm-*/dm/name
dmsetup remove testname9

Rework the Zbb implementation to use a word counter instead of an end
address. This removes the dependency on end-address calculations,
avoids overflow entirely, and simplifies the termination condition of
the word scanning loop. The final length is calculated using the saved
original pointer.

Performance was evaluated with string_bench_strnlen:

New Implementation Previous Implementation

len=0 : 71 ns/call 70 ns/call
len=1 : 82 ns/call 81 ns/call
len=7 : 83 ns/call 81 ns/call
len=8 : 83 ns/call 81 ns/call
len=16 : 94 ns/call 90 ns/call
len=31 : 117 ns/call 113 ns/call
len=64 : 175 ns/call 167 ns/call
len=127 : 259 ns/call 258 ns/call
len=512 : 802 ns/call 833 ns/call
len=1024 : 1512 ns/call 1536 ns/call
len=3173 : 4581 ns/call 4640 ns/call
len=4096 : 6256 ns/call 6068 ns/call

Results show comparable performance to the previous implementation
while fixing the overflow issue.

Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
Suggested-by: DavidLaight <david.laight.linux@gmail.com>
Signed-off-by: Gao Rui <gao.rui@zte.com.cn>

---
v3:
- Keep the original register allocation (t0-t4) and numeric labels.
- Keep the original comments.
- Calculate word count as (remaining - 1) / SZREG + 1, removing the
  branch from the calculation.
v2:
- Rework the Zbb implementation to eliminate end-address overflow
  instead of falling back to the generic path.
- Use a decrementing word counter for word scanning.
- Run KUnit string tests successfully.
- Add string_bench_strnlen benchmark results.
---
 arch/riscv/lib/strnlen.S | 54 +++++++++++++++++--------------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
index a8911605c248..000000000000 100644
--- a/arch/riscv/lib/strnlen.S
+++ b/arch/riscv/lib/strnlen.S
@@ -73,6 +73,9 @@
 	/* If maxlen is 0, return 0. */
 	beqz	a1, 3f

+	/* Save original pointer for final length calculation. */
+	mv	t4, a0
+
 	/* Number of irrelevant bytes in the first word. */
 	andi	t2, a0, SZREG-1

@@ -82,15 +85,6 @@
 	li	t3, SZREG
 	sub	t3, t3, t2
 	slli	t2, t2, 3
-
-	/*
-	 * Aligned boundary.  Use the address of the last valid byte
-	 * (s + count - 1) to avoid loading a word past the count
-	 * boundary in the loop below.  count == 0 is handled above.
-	 */
-	add	t4, a0, a1
-	addi	t4, t4, -1
-	andi	t4, t4, -SZREG

 	/* Get the first word.  */
 	REG_L	t1, 0(t0)
@@ -125,15 +119,26 @@

 	bgtu	t3, a0, 2f

-	/* All remaining bytes are in the first word, no loop needed. */
-	bgeu	t0, t4, 2f
+	/*
+	 * Use a word counter to avoid calculating an end address,
+	 * which might overflow when count is close to SIZE_MAX.
+	 */
+	sub	t2, a1, t3
+	beqz	t2, 3f

-	/* Prepare for the word comparison loop. */
-	addi	t2, t0, SZREG
+	/* Calculate the word count: count = (remaining - 1) / SZREG + 1 */
+	addi	t2, t2, -1
+#if defined(CONFIG_64BIT)
+	srli	t1, t2, 3
+#else
+	srli	t1, t2, 2
+#endif
+	addi	t2, t1, 1
+
 	li	t3, -1

 	/*
-	 * Our critical loop is 4 instructions and processes data in
+	 * Our critical loop is 6 instructions and processes data in
 	 * 4 byte or 8 byte chunks.
 	 */
 	.p2align 3
@@ -141,23 +146,22 @@
 	REG_L	t1, SZREG(t0)
 	addi	t0, t0, SZREG
 	orc.b	t1, t1
-	bgeu	t0, t4, 4f
-	beq	t1, t3, 1b
+	bne	t1, t3, 4f
+	addi	t2, t2, -1
+	bnez	t2, 1b
+
+	/* Scanned all words without finding NUL, return maxlen. */
+	mv	a0, a1
+	ret
+
 4:
 	not	t1, t1
 	CZ	t1, t1
 	srli	t1, t1, 3

-	/* Get number of processed bytes. */
-	sub	t2, t0, t2
-
-	/* Add number of characters in the first word.  */
-	add	a0, a0, t2
-
-	/* Add number of characters in the last word.  */
+	/* Length = (current - original) + offset in final word. */
+	sub	a0, t0, t4
 	add	a0, a0, t1
-
-	/* Ensure the final result does not exceed maxlen. */
 	minu	a0, a0, a1
 2:
 	ret
--
2.27.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
