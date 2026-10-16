Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77A3CCA48B
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 08:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4PQEyu8N93jUOB2qMS2+RffFIUGlkWPL3FdrQnBWck=; b=uQaGQNIeoW13o3
	D6WJasf8Y766jQH6cJx4sY0mbplli401JUOlwyCh944h1G3GfuJYfnMbjSi5dfKmfu5J8lGP7M8Ve
	Bqz6bm36OVYujPxzRenAA48efuAVUP8ztAx6xaXwHYtLUpPlzCabRU2fUa3spWUmZAMu54MlZFTUQ
	QieWNRbBkTu+onPuieTOza5prLMCrwKkqt2bOQ2YnBDLBhH9nES5oS9pL9ryqIj2r44i3pcLSL6xm
	tVtCj92MVJfpNWE9+s9q/9r252rQVX2pMXl6aXNBKXRaJY7R6B0G/6mSNYTNlO6k1KKqEPVak1H93
	tiCl20OdByabuT4QAPsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHd84-00000002JWw-0nmp;
	Fri, 16 Oct 2026 08:17:28 +0000
Received: from azure-sdnproxy.icoremail.net ([13.76.78.106])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHd82-00000002JVm-1Gsy
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 08:17:27 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app2 (Coremail) with SMTP id TQJkCgAXLqGD3dFqtNKGAA--.25396S4;
	Fri, 16 Oct 2026 16:17:10 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>,
	Naveen N Rao <naveen@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v6 2/2] riscv: kprobes: add KUnit test for LR/SC sequence rejection
Date: Fri, 16 Oct 2026 16:17:06 +0800
Message-Id: <20261016081706.1085-3-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20261016081706.1085-1-yuanxiaofeng@eswincomputing.com>
References: <20261016081706.1085-1-yuanxiaofeng@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgAXLqGD3dFqtNKGAA--.25396S4
X-Coremail-Antispam: 1UD129KBjvJXoWxXr43AFyrJFyDWF1DXrW3trb_yoWrXr13pF
	1DGwn0yFWkJ3ZxXry3Ww1kAa4ftw4kCw43Xr1kGr18Cw4UJr4UtwnagrWUtr1DWrWFqr1S
	vw10qFZ5Kr9rZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUml14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
	JbIYCTnIWIevJa73UjIFyTuYvjfUOdgAUUUUU
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAQECE2rRADQUGAABsT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_011726_507978_249E87A2 
X-CRM114-Status: GOOD (  14.58  )
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

Extend the kprobes KUnit test with a function containing an LR/SC
sequence and assert that register_kprobe() accepts a probe placed right
before or right after the sequence, and rejects a probe placed on the
LR, on an instruction inside the sequence, or on the SC.

Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
---
 .../kernel/tests/kprobes/test-kprobes-asm.S   | 30 ++++++++++++++++++
 .../riscv/kernel/tests/kprobes/test-kprobes.c | 31 +++++++++++++++++++
 .../riscv/kernel/tests/kprobes/test-kprobes.h |  3 ++
 3 files changed, 64 insertions(+)

diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
index 15e50934b..76826bf7e 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
@@ -100,6 +100,27 @@ test_kprobes_branch_addr8:
 	.option pop
 SYM_FUNC_END(test_kprobes_branch)
 
+/*
+ * This function is never executed; it only provides the probe addresses
+ * in test_kprobes_lrsc_offsets[] for test_kprobe_lrsc().  The lr.w/sc.w
+ * use the invalid address 0(x0) and would fault if executed, so do not
+ * add this function to test_kprobes_functions[].
+ */
+SYM_FUNC_START(test_kprobes_lrsc)
+.Llrsc_before:
+	nop
+1:
+.Llrsc_lr:
+	lr.w t0, 0(x0)
+.Llrsc_inside:
+	addi t0, t0, 1
+.Llrsc_sc:
+	sc.w t0, t0, 0(x0)
+	bnez t0, 1b
+.Llrsc_after:
+	ret
+SYM_FUNC_END(test_kprobes_lrsc)
+
 #ifdef CONFIG_RISCV_ISA_C
 
 SYM_FUNC_START(test_kprobes_c_j)
@@ -253,3 +274,12 @@ SYM_DATA_START(test_kprobes_functions)
 #endif /* CONFIG_RISCV_ISA_C */
 	RISCV_PTR 0
 SYM_DATA_END(test_kprobes_functions)
+
+.section .rodata
+SYM_DATA_START(test_kprobes_lrsc_offsets)
+	RISCV_PTR .Llrsc_before
+	RISCV_PTR .Llrsc_lr
+	RISCV_PTR .Llrsc_inside
+	RISCV_PTR .Llrsc_sc
+	RISCV_PTR .Llrsc_after
+SYM_DATA_END(test_kprobes_lrsc_offsets)
diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.c b/arch/riscv/kernel/tests/kprobes/test-kprobes.c
index 027424a3f..c2d9c87f2 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes.c
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.c
@@ -43,8 +43,39 @@ static void test_kprobe_riscv(struct kunit *test)
 	kfree(kp);
 }
 
+static void test_kprobe_lrsc(struct kunit *test)
+{
+	/*
+	 * test_kprobes_lrsc_offsets[] points, in order, at an instruction
+	 * right before an LR/SC sequence, the LR itself, an instruction
+	 * inside the sequence, the SC, and an instruction right after it.
+	 * reject[] must have the same number of entries.
+	 */
+	bool reject[] = { false, true, true, true, false };
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(reject); i++) {
+		struct kprobe kp = {};
+		int ret;
+
+		kp.pre_handler = kprobe_dummy_handler;
+		kp.addr = (kprobe_opcode_t *)test_kprobes_lrsc_offsets[i];
+
+		ret = register_kprobe(&kp);
+
+		if (reject[i])
+			KUNIT_EXPECT_LT(test, ret, 0);
+		else
+			KUNIT_EXPECT_EQ(test, ret, 0);
+
+		if (!ret)
+			unregister_kprobe(&kp);
+	}
+}
+
 static struct kunit_case kprobes_testcases[] = {
 	KUNIT_CASE(test_kprobe_riscv),
+	KUNIT_CASE(test_kprobe_lrsc),
 	{}
 };
 
diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.h b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
index 537f44aa9..65a8e7217 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes.h
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
@@ -19,6 +19,9 @@ extern void *test_kprobes_addresses[];
 /* array of functions that return KPROBE_TEST_MAGIC */
 extern long (*test_kprobes_functions[])(void);
 
+/* offsets of the probe points inside test_kprobes_lrsc() */
+extern void *test_kprobes_lrsc_offsets[];
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* TEST_KPROBES_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
