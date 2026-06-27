Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6708CC43211
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 11:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tY+tEqpiXzgvsO0UtUa6/PH2u6l6kxYJw7Qt1vFG9CE=; b=uX1v3eUMsc3S61
	Mw1nnFav9oDz+8bdAhQzwHYEVxyLigMVHaA+GjIv0gED7JMFcCCEoTccYcDBjEiip9X1/gm73UB8C
	Q3llHSmyua5bYK9yiDQ/0FlKYjBQ7WxWeP/HpJnQBA9o8gnJDhy3UNbgp8UCf31t1xtUcocl7VNnr
	UGbtJxnoS98cB86O3+dksDIOSj/kP4YZlWgyXfqTwbigXGRmJTw/aWG3OUY9EyznViZVl+Q/mjRxF
	uXq2iE5+miXBY7uZHlg4eWTb+dMA+nBp9T8/hJQcwZw2Ahg43Xza+a1AAIH2m7bE5r11LN7seVrrJ
	2TU+OkIMYVlngXIdXnaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdRYx-0000000CQNG-3Qk2;
	Sat, 27 Jun 2026 11:51:07 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdRYv-0000000CQMQ-0HKh
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 11:51:06 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782561060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xXGPk/hKuHzuIHwgZ+J6Hs0/YjboK6uNMQO+qq/zJ48=;
	b=r0ExmnOeYA7yoOF2wrkbITA/DfXJyB1hXtlOwZYgo28Myih67jHMb4EnWUeLBREowZtx+3
	9zaxwP4RTcGidNFbN1uyqYQ9at2qo2escyvWhajPnzN4Qor3YZhqJrv8wFT2iXCNg0qo5m
	DBajziIrBe69sf0xvk5cVTLPBKMhUqpqaXE9PzA3LROLqQSBdA9eTwAy8Zt2FTClhcUWt2
	RrQ2r7qVMDLRNSAyw5/xnvShzolz69cz1FORafc2IvIr9MXEIrmwyVTFlt7V2c/WS6gDN4
	ZMDjfScaKfOp97dMZQBwXlxsAsmG6Ir5bVNRDz+8ygLRS5pC5RE5iCZFknc9PQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782561060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xXGPk/hKuHzuIHwgZ+J6Hs0/YjboK6uNMQO+qq/zJ48=;
	b=mIKWgukeoImXWNC9z+MLQnp6rBF7zIyfCxMmBDLRcupqSz3M8ZMnvpV5sgnR727E95NI5k
	5TdytqIZVUv1MFAw==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH] riscv: kprobes: Add test case for c.jal instruction simulation
Date: Sat, 27 Jun 2026 13:50:51 +0200
Message-ID: <20260627115051.3235783-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_045105_274312_17FAD808 
X-CRM114-Status: UNSURE (   4.58  )
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

Add test validating that kprobes correctly simulate the c.jal
instruction.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
the test fails without c.jal simulation patch:
https://lore.kernel.org/linux-riscv/20260627001939.3847-1-xiaofengmian@163.com/
---
 .../kernel/tests/kprobes/test-kprobes-asm.S   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
index f16deee9e091..15e50934bbd7 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
@@ -179,6 +179,23 @@ test_kprobes_c_bnez_addr3:
 	ret
 SYM_FUNC_END(test_kprobes_c_bnez)
 
+#ifdef CONFIG_32BIT
+SYM_FUNC_START(test_kprobes_c_jal)
+	li a0, 0
+	mv a1, ra
+test_kprobes_c_jal_addr1:
+	c.jal 2f
+	ret
+1:	li a0, KPROBE_TEST_MAGIC_UPPER
+	ret
+test_kprobes_c_jal_addr2:
+2:	c.jal 1b
+	li a2, KPROBE_TEST_MAGIC_LOWER
+	add a0, a0, a2
+	jr a1
+SYM_FUNC_END(test_kprobes_c_jal)
+#endif
+
 #endif /* CONFIG_RISCV_ISA_C */
 
 .section .rodata
@@ -209,6 +226,10 @@ SYM_DATA_START(test_kprobes_addresses)
 	RISCV_PTR test_kprobes_c_bnez_addr1
 	RISCV_PTR test_kprobes_c_bnez_addr2
 	RISCV_PTR test_kprobes_c_bnez_addr3
+#ifdef CONFIG_32BIT
+	RISCV_PTR test_kprobes_c_jal_addr1
+	RISCV_PTR test_kprobes_c_jal_addr2
+#endif
 #endif /* CONFIG_RISCV_ISA_C */
 	RISCV_PTR 0
 SYM_DATA_END(test_kprobes_addresses)
@@ -226,6 +247,9 @@ SYM_DATA_START(test_kprobes_functions)
 	RISCV_PTR test_kprobes_c_jalr
 	RISCV_PTR test_kprobes_c_beqz
 	RISCV_PTR test_kprobes_c_bnez
+#ifdef CONFIG_32BIT
+	RISCV_PTR test_kprobes_c_jal
+#endif
 #endif /* CONFIG_RISCV_ISA_C */
 	RISCV_PTR 0
 SYM_DATA_END(test_kprobes_functions)
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
