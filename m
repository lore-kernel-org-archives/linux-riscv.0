Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A7ACD5BC2
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4niE8BNVr3WZIyZ9iG/yxe9o/Ua0UUG26npisTLeuj4=; b=BPPmEBb3/gh1n7
	HDjxMukWRjAKTu+c3A7At7+m9UrQxVPqBkjdx+FUrSwKgjSGGeaFp+DrZ9FW4ldUi8FwGJ6GzyixJ
	3CYS13nMSGFS4pOCjZwNGvWGKURftmJsJ4dE4iGDiWHYg7fze/LdH5TYdAb6/zzQa8j+gsIz3Ch09
	00aQiWB1EsOAoyLKwe8PWwAOoFKfcAGGdLhzUC/b6xAZRR1QrzrZjvAx/kos67qaG7enlyG57rgQu
	bIodcXlCVIgZciIN1Smtd07vNp5moOB8WOPdPRhF1ByKQtZPW6av/iEXxZT1IDqHaS7yj+S8U0EJo
	oeLDeyTxQNaPjbnsDbeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUvm-0000000AKG6-0fWk;
	Thu, 13 Nov 2025 10:51:58 +0000
Received: from smtp20.cstnet.cn ([159.226.251.20] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUvh-0000000AKFH-3Jaj
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 10:51:56 +0000
Received: from xujiakai2025$iscas.ac.cn ( [210.73.43.101] ) by
 ajax-webmail-APP-10 (Coremail) ; Thu, 13 Nov 2025 18:51:42 +0800
 (GMT+08:00)
X-Originating-IP: [210.73.43.101]
Date: Thu, 13 Nov 2025 18:51:42 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?6K645L2z5Yev?= <xujiakai2025@iscas.ac.cn>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>
Subject: [PATCH] riscv: fix KUnit test_kprobes crash when building with
 Clang
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT5 build
 20240627(e6c6db66) Copyright (c) 2002-2025 www.mailtech.cn cnic.cn
MIME-Version: 1.0
Message-ID: <738dd4e2.ff73.19a7cd7b4d5.Coremail.xujiakai2025@iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: tACowAAnEOg_uBVp25oBAA--.19303W
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCQ4FCWkVqNMfUQABsD
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_025154_218362_BF2A7F65 
X-CRM114-Status: UNSURE (   3.41  )
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

Clang misaligns the test_kprobes_addresses and test_kprobes_functions
arrays, or does not export local labels by default. Both can cause
kmalloc_array() allocation errors and KUnit failures.

This patch fixes the issue by:
- Adding .section .rodata to explicitly place arrays in the read-only data segment.
- Adding .align 3 to align arrays to 8 bytes.
- Adding .globl to probe labels to ensure symbols are visible.

For detailed debug and analysis, see:
https://github.com/j1akai/temp/blob/main/20251113/readme.md

Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
---
 arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S   | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
index b951d0f12482..ac5ce305b1bd 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
@@ -7,8 +7,10 @@
 SYM_FUNC_START(test_kprobes_add)
 	li a1, KPROBE_TEST_MAGIC_UPPER
 	li a2, KPROBE_TEST_MAGIC_LOWER
+.globl test_kprobes_add_addr1
 test_kprobes_add_addr1:
 	add a1, a1, a2
+.globl test_kprobes_add_addr2
 test_kprobes_add_addr2:
 	add a0, a1, x0
 	ret
@@ -19,6 +21,7 @@ SYM_FUNC_START(test_kprobes_jal)
 	mv a1, ra
 	.option push
 	.option norvc
+.globl test_kprobes_jal_addr1
 test_kprobes_jal_addr1:
 	jal x0, 2f
 	ret
@@ -27,6 +30,7 @@ test_kprobes_jal_addr1:
 	ret
 	.option push
 	.option norvc
+.globl test_kprobes_jal_addr2
 test_kprobes_jal_addr2:
 2:	jal 1b
 	.option pop
@@ -40,6 +44,7 @@ SYM_FUNC_START(test_kprobes_jalr)
 	mv a1, ra
 	.option push
 	.option norvc
+.globl test_kprobes_jalr_addr
 test_kprobes_jalr_addr:
 	jalr a0
 	.option pop
@@ -51,6 +56,7 @@ test_kprobes_jalr_addr:
 SYM_FUNC_END(test_kprobes_jalr)
 
 SYM_FUNC_START(test_kprobes_auipc)
+.globl test_kprobes_auipc_addr
 test_kprobes_auipc_addr:
 	auipc a0, KPROBE_TEST_MAGIC_LOWER
 	la a1, test_kprobes_auipc_addr
@@ -67,20 +73,26 @@ SYM_FUNC_START(test_kprobes_branch)
 	li a0, 0
 	li a1, 1
 	li a2, 2
+.globl test_kprobes_branch_addr1
 test_kprobes_branch_addr1:
 	beqz a0, 1f
 	ret
 1:
+.globl test_kprobes_branch_addr2
 test_kprobes_branch_addr2:
 	beqz a1, 3f
+.globl test_kprobes_branch_addr3
 test_kprobes_branch_addr3:
 	bnez a0, 3f
+.globl test_kprobes_branch_addr4
 test_kprobes_branch_addr4:
 	bnez a2, 1f
 	ret
 1:
+.globl test_kprobes_branch_addr5
 test_kprobes_branch_addr5:
 	bge a1, a2, 3f
+.globl test_kprobes_branch_addr6
 test_kprobes_branch_addr6:
 	bge a2, a1, 2f
 	ret
@@ -89,9 +101,11 @@ test_kprobes_branch_addr6:
 	add a0, a0, t0
 	ret
 2:
+.globl test_kprobes_branch_addr7
 test_kprobes_branch_addr7:
 	blt a2, a1, 3f
 	li a0, KPROBE_TEST_MAGIC_LOWER
+.globl test_kprobes_branch_addr8
 test_kprobes_branch_addr8:
 	blt a1, a2, 1b
 3:
@@ -104,6 +118,7 @@ SYM_FUNC_END(test_kprobes_branch)
 
 SYM_FUNC_START(test_kprobes_c_j)
 	li a0, 0
+.globl test_kprobes_branch_c_j_addr1
 test_kprobes_branch_c_j_addr1:
 	c.j 2f
 1:
@@ -111,12 +126,14 @@ test_kprobes_branch_c_j_addr1:
 	add a0, a0, a1
 	ret
 2:	li a0, KPROBE_TEST_MAGIC_LOWER
+.globl test_kprobes_branch_c_j_addr2
 test_kprobes_branch_c_j_addr2:
 	c.j 1b
 SYM_FUNC_END(test_kprobes_c_j)
 
 SYM_FUNC_START(test_kprobes_c_jr)
 	la a0, 2f
+.globl test_kprobes_c_jr_addr1
 test_kprobes_c_jr_addr1:
 	c.jr a0
 	ret
@@ -126,6 +143,7 @@ test_kprobes_c_jr_addr1:
 2:
 	li a0, KPROBE_TEST_MAGIC_UPPER
 	la a1, 1b
+.globl test_kprobes_c_jr_addr2
 test_kprobes_c_jr_addr2:
 	c.jr a1
 SYM_FUNC_END(test_kprobes_c_jr)
@@ -133,6 +151,7 @@ SYM_FUNC_END(test_kprobes_c_jr)
 SYM_FUNC_START(test_kprobes_c_jalr)
 	mv a1, ra
 	la a0, 1f
+.globl test_kprobes_c_jalr_addr
 test_kprobes_c_jalr_addr:
 	c.jalr a0
 	li a2, KPROBE_TEST_MAGIC_UPPER
@@ -145,16 +164,19 @@ SYM_FUNC_END(test_kprobes_c_jalr)
 SYM_FUNC_START(test_kprobes_c_beqz)
 	li a0, 0
 	li a1, 1
+.globl test_kprobes_c_beqz_addr1
 test_kprobes_c_beqz_addr1:
 	c.beqz a0, 2f
 	ret
 1:	li a1, KPROBE_TEST_MAGIC_UPPER
 	add a0, a0, a1
 	ret
+.globl test_kprobes_c_beqz_addr2
 test_kprobes_c_beqz_addr2:
 2:	c.beqz a1, 3f
 	li a0, KPROBE_TEST_MAGIC_LOWER
 	mv a1, x0
+.globl test_kprobes_c_beqz_addr3
 test_kprobes_c_beqz_addr3:
 	c.beqz a1, 1b
 3:	li a0, 0
@@ -164,15 +186,18 @@ SYM_FUNC_END(test_kprobes_c_beqz)
 SYM_FUNC_START(test_kprobes_c_bnez)
 	li a0, 0
 	li a1, 1
+.globl test_kprobes_c_bnez_addr1
 test_kprobes_c_bnez_addr1:
 	c.bnez a1, 2f
 	ret
 1:	li a1, KPROBE_TEST_MAGIC_UPPER
 	add a0, a0, a1
 	ret
+.globl test_kprobes_c_bnez_addr2
 test_kprobes_c_bnez_addr2:
 2:	c.bnez a0, 3f
 	li a0, KPROBE_TEST_MAGIC_LOWER
+.globl test_kprobes_c_bnez_addr3
 test_kprobes_c_bnez_addr3:
 	c.bnez a0, 1b
 3:	li a0, 0
@@ -181,6 +206,8 @@ SYM_FUNC_END(test_kprobes_c_bnez)
 
 #endif /* CONFIG_RISCV_ISA_C */
 
+.section .rodata
+.align 3
 SYM_DATA_START(test_kprobes_addresses)
 	RISCV_PTR test_kprobes_add_addr1
 	RISCV_PTR test_kprobes_add_addr2
@@ -212,6 +239,8 @@ SYM_DATA_START(test_kprobes_addresses)
 	RISCV_PTR 0
 SYM_DATA_END(test_kprobes_addresses)
 
+.section .rodata
+.align 3
 SYM_DATA_START(test_kprobes_functions)
 	RISCV_PTR test_kprobes_add
 	RISCV_PTR test_kprobes_jal
-- 
2.34.1

</xujiakai2025@iscas.ac.cn>
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
