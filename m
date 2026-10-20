Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EBF606A319
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 06:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S+RBkN5B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YHm4rEKvYA/o710bYXHmIqYEP3O7+h8dan3no1jCnHg=; b=S+RBkN5BmxILs/
	NNJRhaMmkmNbPDHsPSbz/YBkFNjSiJ0Nilz9DCz6gu37KGBlHZ6fjmpnKEn5F2br49aPxkfnIk7TE
	QEDeaeiVN8QI19MUS2AsJGjqZuFO46anBoZ1kZU8H64kbqwQoEmoZO6U60p/my6DELrP1MhTsnhj4
	7pubOFmRYWP7qpcm3GOq5s3zRV6IFCpisQSZlqUAYvMbvf0+wDQ6HmZ69VMyUCpIn/E+V8KM0qTFm
	4++b68c1D+R6ieSbfmQPyTJHeV0ncM3sA1LYl0w3mbT0AROYgOfa/adOZvZWQQ1YuyrMKom4MDypZ
	5FSTa3imVJ1iHlKaOdLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3Xp-00000008wIq-0Tj3;
	Tue, 20 Oct 2026 06:41:57 +0000
Received: from azure-sdnproxy.icoremail.net ([207.46.229.174])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3Xh-00000008wGY-3Wqy
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 06:41:53 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app1 (Coremail) with SMTP id TAJkCgDniXMgDddqfWGHAA--.19571S4;
	Tue, 20 Oct 2026 14:41:38 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Nam Cao <namcao@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v4 2/2] riscv: kprobes: add nop and c.nop to the KUnit test
Date: Tue, 20 Oct 2026 14:41:36 +0800
Message-Id: <20261020064136.665-3-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20261020064136.665-1-yuanxiaofeng@eswincomputing.com>
References: <20261020064136.665-1-yuanxiaofeng@eswincomputing.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgDniXMgDddqfWGHAA--.19571S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr48tr4DWr1rAF17uF4rKrg_yoW8urW5pF
	nrJw15KF48GasxtryUWr18AryFya18A3y3WryDur48KrW8Gw13tr9FgFWUtrsrKrWFv3yS
	934rXry8KF9rAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
	1c_TUUUUU
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAgEGE2rWRqodbgAEsx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_234150_466216_3350404D 
X-CRM114-Status: UNSURE (   5.91  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.6 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Extend the RISC-V kprobes KUnit test with test_kprobes_nop and
test_kprobes_c_nop, covering both the 32-bit nop and the
compressed c.nop simulation paths.

Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Reviewed-by: Nam Cao <namcao@linutronix.de>
---
 .../kernel/tests/kprobes/test-kprobes-asm.S   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
index 15e50934b..8da0be1e9 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
@@ -198,6 +198,25 @@ SYM_FUNC_END(test_kprobes_c_jal)
 
 #endif /* CONFIG_RISCV_ISA_C */
 
+SYM_FUNC_START(test_kprobes_nop)
+	.option push
+	.option norvc
+test_kprobes_nop_addr:
+	nop
+	.option pop
+	li a0, KPROBE_TEST_MAGIC
+	ret
+SYM_FUNC_END(test_kprobes_nop)
+
+#ifdef CONFIG_RISCV_ISA_C
+SYM_FUNC_START(test_kprobes_c_nop)
+test_kprobes_c_nop_addr:
+	c.nop
+	li a0, KPROBE_TEST_MAGIC
+	ret
+SYM_FUNC_END(test_kprobes_c_nop)
+#endif /* CONFIG_RISCV_ISA_C */
+
 .section .rodata
 SYM_DATA_START(test_kprobes_addresses)
 	RISCV_PTR test_kprobes_add_addr1
@@ -214,7 +233,9 @@ SYM_DATA_START(test_kprobes_addresses)
 	RISCV_PTR test_kprobes_branch_addr6
 	RISCV_PTR test_kprobes_branch_addr7
 	RISCV_PTR test_kprobes_branch_addr8
+	RISCV_PTR test_kprobes_nop_addr
 #ifdef CONFIG_RISCV_ISA_C
+	RISCV_PTR test_kprobes_c_nop_addr
 	RISCV_PTR test_kprobes_branch_c_j_addr1
 	RISCV_PTR test_kprobes_branch_c_j_addr2
 	RISCV_PTR test_kprobes_c_jr_addr1
@@ -241,7 +262,9 @@ SYM_DATA_START(test_kprobes_functions)
 	RISCV_PTR test_kprobes_jalr
 	RISCV_PTR test_kprobes_auipc
 	RISCV_PTR test_kprobes_branch
+	RISCV_PTR test_kprobes_nop
 #ifdef CONFIG_RISCV_ISA_C
+	RISCV_PTR test_kprobes_c_nop
 	RISCV_PTR test_kprobes_c_j
 	RISCV_PTR test_kprobes_c_jr
 	RISCV_PTR test_kprobes_c_jalr
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
