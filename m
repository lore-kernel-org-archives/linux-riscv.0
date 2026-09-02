Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112CBC61DFD
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 08:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKOziUpOj/2w6vCmy119/NtdCt+82IQQUfXNXzCqvL0=; b=LxCLtJYKOnSddy
	lTooZrrRM07I3+TOCK6MH5y47KMLI5vWwx23VDvOaGbSV4p15oO6Wv1csOFqS+GbF5cDoNVYnwY4r
	cdvnnlWGcEf9RE+Wrez60sujvJX9SIJYqmtJ+U/QLvsqy5ZDjtfyDOvd8lC0iprUDVuXR9ivs+yBg
	WPTqIlN0p35oMqthIaQEOIfa3GSg/nHxtctO2McZVStOsNiOe17E1ADTFZjWXnNHgqY2K7Ums/OKL
	vShSKfIsntym5+Sqj571kMe6USBhIIXKgPZgIk55yCdyideJezVoX+YbF3pCl0JP4uZGzzNXPuSt5
	2i1sBOhh5Ma5DnUhTMZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1g1Y-0000000E2Q8-142C;
	Wed, 02 Sep 2026 08:08:48 +0000
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net ([162.243.161.220])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1g1V-0000000E2Oi-08CV
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 08:08:46 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app1 (Coremail) with SMTP id TAJkCgCXKW5z2ZdqoZ96AA--.27641S4;
	Wed, 02 Sep 2026 16:08:40 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Nam Cao <namcao@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v3 2/2] riscv: kprobes: add nop and c.nop to the KUnit test
Date: Wed,  2 Sep 2026 16:08:17 +0800
Message-Id: <20260902080817.681-3-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260902080817.681-1-yuanxiaofeng@eswincomputing.com>
References: <20260902080817.681-1-yuanxiaofeng@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgCXKW5z2ZdqoZ96AA--.27641S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr48tr4DXw13try3GrWxJFb_yoW8Zw4xpF
	nrJw15KF48Gasxtry7Ww18AryFya1kA3yagw1DWr4rKry8G3W3tr9FgFWUtrsrKrWFv3yS
	934rWry8KF9rAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPa14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
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
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAgESE2qW-qNgkwABsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_010845_276998_DE41CBD7 
X-CRM114-Status: UNSURE (   6.51  )
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
