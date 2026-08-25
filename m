Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389F7C61DBD
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 12:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKOziUpOj/2w6vCmy119/NtdCt+82IQQUfXNXzCqvL0=; b=zoSmsoI5V4/pmz
	62JdaT3Tc0aQFBtWf2E9aQU/T+Iz/2WkvPAFK/JGU0WPswO3T+aRHnGAAlVkpYnRQgkvNSUXzA31W
	l+LsQi8i2zxXffc/SsOSXnVoGBA0thJx9WwDTFspHoeX/fwGw+PeobUVjXXYtzX4c9j36qEkHhaT/
	VzFaxqiWMv40mFPhuWczn/XghlsHQrAVOFOxxkfWt1gAAe4H1MQNH+TxT69SG5BVRlHB1aExDBL1S
	5A8XgguGCchx/iNiQ20R9qYmzdTZhp6NFq9BJ+Yu3tlSyUi3NsJTBnIi/eP7o77TUfP1far/7p3lo
	BN8e4xU6YYE8nllOSMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyq9G-00000000koS-2NBr;
	Tue, 25 Aug 2026 12:21:02 +0000
Received: from azure-sdnproxy.icoremail.net ([52.187.6.220])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyq9D-00000000knX-1zq9
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 12:21:01 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app2 (Coremail) with SMTP id TQJkCgB3jaCbiI1q14xgAA--.39139S4;
	Tue, 25 Aug 2026 20:20:48 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Nam Cao <namcao@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v2 2/2] riscv: kprobes: add nop and c.nop to the KUnit test
Date: Tue, 25 Aug 2026 20:20:20 +0800
Message-Id: <20260825122020.1192-3-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260825122020.1192-1-yuanxiaofeng@eswincomputing.com>
References: <20260825122020.1192-1-yuanxiaofeng@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgB3jaCbiI1q14xgAA--.39139S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr48tr4DXw13try3GrWxJFb_yoW8Zw4xpF
	nrJw15KF48Gasxtry7Ww18AryFya1kA3yagw1DWr4rKry8G3W3tr9FgFWUtrsrKrWFv3yS
	934rWry8KF9rAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPI14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1DMx
	kIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUo
	lk3UUUUU=
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAQEKE2qMciwftgABsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_052059_864656_16C5DF19 
X-CRM114-Status: UNSURE (   6.21  )
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

Extend the RISC-V kprobes KUnit test with test_kprobes_nop and
test_kprobes_c_nop, covering both the 32-bit nop and the
compressed c.nop simulation paths.

Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
---
 .../kernel/tests/kprobes/test-kprobes-asm.S   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
index f16deee9e0..06a9cb35c9 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
@@ -181,6 +181,25 @@ SYM_FUNC_END(test_kprobes_c_bnez)
 
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
@@ -197,7 +216,9 @@ SYM_DATA_START(test_kprobes_addresses)
 	RISCV_PTR test_kprobes_branch_addr6
 	RISCV_PTR test_kprobes_branch_addr7
 	RISCV_PTR test_kprobes_branch_addr8
+	RISCV_PTR test_kprobes_nop_addr
 #ifdef CONFIG_RISCV_ISA_C
+	RISCV_PTR test_kprobes_c_nop_addr
 	RISCV_PTR test_kprobes_branch_c_j_addr1
 	RISCV_PTR test_kprobes_branch_c_j_addr2
 	RISCV_PTR test_kprobes_c_jr_addr1
@@ -220,7 +241,9 @@ SYM_DATA_START(test_kprobes_functions)
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
