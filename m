Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C849C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 08:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fe5+FUdgsXg1w8RbRtAkfGGW0M1A6CZZTOZ3DPUvbIg=; b=zHrClKx4BvgyKW
	EDkEK0f1LAxJMTP1rxLK/V3loSEncCIYOjUUkeK4MUY4KsUPythPxgt+WBm8DkfeiRCpof0C90SWJ
	WqC5Ev+FaWW7i8rfsP9rP8ViSm65MVWQ0MMQVpx9WE37Uy+8+Zd3O5Kgc70Wg9VFlwwWULxzp1dEp
	+i68gF99HCQzzZZ2M4rWNv+tFxAZ3dejll+v4srKdS/zbPBlmJlBdQMmQizNHmH3M9k/lK66oEHJu
	90eKz/i5BMDVnh58F78b+1LlqDxgHg+idX/j4QK6zh1HkcTvftVkP6NaA+sM946shECs3pHtgaOhb
	FT5KeqdyLhaqBu9VAF4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weq2Y-00000000zgU-27sK;
	Wed, 01 Jul 2026 08:11:26 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weq2T-00000000zew-3ByJ
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 08:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=K2
	X7FP2+XbaqjMe4yrmXcuX7vip8Xbbw8s+9bXwDLvE=; b=WX+oIeFzCjYNVBGhD6
	8t30BmeaxmmdjcnmqaROR7I/s2zI9mP9t1YhomIJqdDHYZdibPCumBXCtX/jwQwJ
	rPRZQV1YAgPNe3FUzeDQ9saD1sPK4iaubrBUqVRr6jQxuHNFmmY7mwTj8P7vj+F9
	+4LtGgzycWbE1tyQ84zaZZtTo=
Received: from Ubuntu.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBHa+Z5y0Rqn4gyFA--.16458S4;
	Wed, 01 Jul 2026 16:10:36 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiaofengmian@163.com
Subject: [PATCH v6 2/2] riscv: kprobes: add test case for c.jal instruction simulation
Date: Wed,  1 Jul 2026 08:10:33 +0000
Message-ID: <20260701081033.49871-3-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701081033.49871-1-xiaofengmian@163.com>
References: <20260701081033.49871-1-xiaofengmian@163.com>
MIME-Version: 1.0
X-CM-TRANSID: PygvCgBHa+Z5y0Rqn4gyFA--.16458S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw1kWrWDur17XFyxtFWkJFb_yoW8uF1DpF
	nrJr15KFW8Jas3Jry3WF1rAryFya1kA3yagr1DZr4rCr48Gw12yr9FgFWDtFnrKrWFv3yS
	vry8WrWxKF9xZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zioqcUUUUUU=
X-Originating-IP: [39.144.122.37]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbDAhy9wGpEy3xwqAAA3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_011122_244225_D84B83A2 
X-CRM114-Status: UNSURE (   7.50  )
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

From: Nam Cao <namcao@linutronix.de>

Add a test case validating that kprobes correctly simulates the
c.jal instruction on RV32.

The test uses two probe points: a forward c.jal and a backward
c.jal, and verifies that the containing function returns the
expected magic value KPROBE_TEST_MAGIC after kprobe interception.

Co-developed-by: Xiaofeng Yuan <xiaofengmian@163.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
---
 .../kernel/tests/kprobes/test-kprobes-asm.S   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
index f16deee9e..15e50934b 100644
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
