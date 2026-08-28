Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A58C61DB9
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 09:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LM0z5YsH8GUspxeEsF4wI7iBvPUFxU90+sWp08r2feQ=; b=o9oF4Oy13XNqVh
	s4S9J5z2haR32VLSsOxgFi/QmdBnUIT9+N6TCEsC0PBYHZfeYmvdXZSUV8SqB57UbiIQk2ZPiyBxi
	in8tXncBvG+e29a1M48qJqjQYmOGE4UGjlDs4oFq/VztBQAvEPWZnK3S1TzxX3Ka83fsENIs9Pejq
	cDmPE50gw2wtiIKK+colDa7WFi2el9Ix5BJELP9JpcPj7tC966Os90173Hd0VkOWBcdkM0nIM4iq7
	fOUuV1qinJUL7DhtuOq7v/dJjRLN4qfeIjVK8ts2T1HyruWvEHXrAoeJBR4TW5KPcInorq/7/4pm/
	hKDeqY5cyf9NP+vFcyQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsdw-00000005PW7-1ibV;
	Fri, 28 Aug 2026 09:13:00 +0000
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net ([206.189.79.184])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsds-00000005PUz-48Ax
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 09:12:58 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app2 (Coremail) with SMTP id TQJkCgAXHpwAUZFq3NppAA--.5375S4;
	Fri, 28 Aug 2026 17:12:49 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Nam Cao <namcao@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v4 2/2] riscv: kprobes: add KUnit test for LR/SC sequence rejection
Date: Fri, 28 Aug 2026 17:12:02 +0800
Message-Id: <20260828091202.1124-3-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260828091202.1124-1-yuanxiaofeng@eswincomputing.com>
References: <20260828091202.1124-1-yuanxiaofeng@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgAXHpwAUZFq3NppAA--.5375S4
X-Coremail-Antispam: 1UD129KBjvJXoWxZrWkuF1fWw48AF4DuryDKFg_yoWrXrykpF
	4DGw1YyFWkJ3ZrX343Ww1kAa4xta1kuw43Xr1DGr18Cw47Ar1jy3ZagrWUtw1qgrWFq34f
	Zw1FqFWkKr9rZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPa14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r
	1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
	bManUUUUU
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAQENE2qQZqwX-gAAsH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_021257_783022_734CD5F8 
X-CRM114-Status: GOOD (  11.21  )
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

Add a KUnit test that probes an instruction inside and right after an
LR/SC sequence, and check that the former is rejected while the latter
is accepted.

The probe points are declared as local (.L) labels, which are filtered
out of the kallsyms symbol table, so kallsyms_lookup_size_offset()
always resolves to the enclosing function and the forward scan starts
from the correct function boundary.  A probe address that coincided
with a kallsyms symbol would make the offset 0 and skip the scan
entirely.

Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
---
v4: New in v4: add a dedicated KUnit test for the LR/SC rejection path.
    The existing test_kprobe_riscv only probes ordinary instructions, so
    the LR/SC rejection path was never exercised and the two
    backward-scan bugs went unnoticed.
---
 .../kernel/tests/kprobes/test-kprobes-asm.S   | 19 +++++++++++++++++++
 .../riscv/kernel/tests/kprobes/test-kprobes.c | 19 +++++++++++++++++++
 .../riscv/kernel/tests/kprobes/test-kprobes.h |  6 ++++++
 3 files changed, 44 insertions(+)

diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
index f16deee9e0..f2c412aedd 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
@@ -181,6 +181,25 @@ SYM_FUNC_END(test_kprobes_c_bnez)
 
 #endif /* CONFIG_RISCV_ISA_C */
 
+SYM_FUNC_START(test_kprobes_lrsc)
+	li a0, 1
+1:
+	lr.w a1, 0(x0)
+.Llrsc_inside:
+	addi a1, a1, 1
+	sc.w a2, a1, 0(x0)
+	bnez a2, 1b
+.Llrsc_after:
+	li a0, KPROBE_TEST_MAGIC
+	ret
+SYM_FUNC_END(test_kprobes_lrsc)
+
+.section .rodata
+SYM_DATA_START(test_kprobes_lrsc_offsets)
+	RISCV_PTR .Llrsc_inside - test_kprobes_lrsc
+	RISCV_PTR .Llrsc_after - test_kprobes_lrsc
+SYM_DATA_END(test_kprobes_lrsc_offsets)
+
 .section .rodata
 SYM_DATA_START(test_kprobes_addresses)
 	RISCV_PTR test_kprobes_add_addr1
diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.c b/arch/riscv/kernel/tests/kprobes/test-kprobes.c
index 027424a3ff..25bd103e20 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes.c
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.c
@@ -43,8 +43,27 @@ static void test_kprobe_riscv(struct kunit *test)
 	kfree(kp);
 }
 
+static void test_kprobe_lrsc(struct kunit *test)
+{
+	struct kprobe kp = {};
+
+	kp.pre_handler = kprobe_dummy_handler;
+
+	/* a probe inside an LR/SC sequence must be rejected */
+	kp.addr = (kprobe_opcode_t *)((unsigned long)test_kprobes_lrsc +
+				      test_kprobes_lrsc_offsets[0]);
+	KUNIT_EXPECT_LT(test, register_kprobe(&kp), 0);
+
+	/* a probe right after the sequence must be accepted */
+	kp.addr = (kprobe_opcode_t *)((unsigned long)test_kprobes_lrsc +
+				      test_kprobes_lrsc_offsets[1]);
+	KUNIT_EXPECT_EQ(test, 0, register_kprobe(&kp));
+	unregister_kprobe(&kp);
+}
+
 static struct kunit_case kprobes_testcases[] = {
 	KUNIT_CASE(test_kprobe_riscv),
+	KUNIT_CASE(test_kprobe_lrsc),
 	{}
 };
 
diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.h b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
index 537f44aa9d..58be980fdf 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes.h
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
@@ -19,6 +19,12 @@ extern void *test_kprobes_addresses[];
 /* array of functions that return KPROBE_TEST_MAGIC */
 extern long (*test_kprobes_functions[])(void);
 
+/* function containing an LR/SC sequence, and offsets (from its start) of
+ * the instruction inside and right after the sequence
+ */
+extern void test_kprobes_lrsc(void);
+extern unsigned long test_kprobes_lrsc_offsets[];
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* TEST_KPROBES_H */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
