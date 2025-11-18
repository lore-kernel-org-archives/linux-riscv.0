Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07978CEE352
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 20:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sl4mw2Svj/UFoMfT1Iu/Ai9Ax+R5YjsHpNGCbTlFxx8=; b=TP3f8UCq2436m9
	pwAJcH+4dj1/J5aZbZz42pPnyvR24JWaG/cTS+U1qhtkmdsVMxyZLVlexjnpHEoWzB+GtQLWVCdcA
	n3VpU4+Mbw1hs4tKJTH83zbsZnFVZU5h56Ak/ieGK/MDmqxGYng1Yu+i8CZ9q+TTrWg+gzCCR3XKJ
	xeKdgwiFtD4hVLbnsyvgprXr1UFs/+dXXoprWQi1GlmIedVr26YeJyZxPGbZGnaJJJ6tWAskPWX8b
	VjYyt/DvZ0/336aR+JM3V2HctbuLIrzX3hQs9oWRbs9jGW/7No5tNS5ajK2ZySxTta+8syU4w/aWw
	GcSiJp4KsqVsHPms/AgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLSDA-000000014KC-0z0R;
	Tue, 18 Nov 2025 20:22:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLSD7-000000014Jh-2ZoT
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 20:21:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E592D43B6E;
	Tue, 18 Nov 2025 20:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB131C2BCB4;
	Tue, 18 Nov 2025 20:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763497314;
	bh=3MKdjs2Tf5j0QgMB/OSHMxP4dYIcVSTy/aR4xiAsqrk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pEYusm2dlCqkmht+SH0rJipSVUeAH91fzZULJl0wZu0km5QI0LmD468TMnd/JmDL0
	 /9JePXjkbdeivb3egPohlcLHNmzcBRvrgJmioEw7+G2Bqf9weLzIH+MDQy1l8DRrHQ
	 WZW8+cjA6t6uP467zKqnbeUUnGkypnAxoE1RAElXFf16B1qwSFxeNxF+I3TEeaBzVE
	 zcTphYP92V17NPcbuBvxAWIyvas5O01T7KX6OGF5oaMvKoh3nDzNS6gAhvrKwYXyGI
	 igZy6baJ6Bas8AAcFCkjDUVUNx0x3dw/UVX+WpkP4xzVTkbFvYzb6SSlKTVoLyuYt1
	 HlD7UGUum7f9g==
Date: Tue, 18 Nov 2025 13:21:50 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, namcao@linutronix.de
Subject: Re: Re: [PATCH] riscv: fix KUnit test_kprobes crash when building
 with Clang
In-Reply-To: <108ac2f0.17c6b.19a8fc4d1ca.Coremail.xujiakai2025@iscas.ac.cn>
Message-ID: <bd82855d-4a80-58fb-c949-b968569ef1e2@kernel.org>
References: <738dd4e2.ff73.19a7cd7b4d5.Coremail.xujiakai2025@iscas.ac.cn> <621798fc-68bc-504c-755f-0a2f1f83d1c2@kernel.org> <108ac2f0.17c6b.19a8fc4d1ca.Coremail.xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_122157_715413_BD09BE29 
X-CRM114-Status: GOOD (  22.22  )
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

Hi,

On Mon, 17 Nov 2025, Jiakai Xu wrote:

> Thank you very much for reviewing my patch; your feedback was very helpful.

Great.  Here's one more request:

> &gt; Thanks for the patch.  Have you reported this difference in behavior to 

Looks like you're using a mail client that sends HTML in what should be a 
plain-text E-mail; please fix that.

> I have reported this issue to the LLVM community:
> https://github.com/llvm/llvm-project/issues/168308
> We now need to wait for feedback from the LLVM community.

Thank you.

> Below, I include the narrative from my readme for reference:

[ ... ]

> I would like to ask whether it is appropriate to include all this detail 
> directly in the patch description and email, or if it would be better to 
> submit it as a PATCH v1.

Not all of it, but some edited summary is appropriate.  I've queued the 
following revision for v6.18-rc fixes, under the theory that it would be 
good to get the test working for Clang users while the LLVM folks 
investigate.  Please let us know ASAP if you think anything in it should 
be changed.  I plan to send a PR out later this week.


thanks,

- Paul


From: =?UTF-8?q?=E8=AE=B8=E4=BD=B3=E5=87=AF?= <xujiakai2025@iscas.ac.cn>
Date: Thu, 13 Nov 2025 18:51:42 +0800
Subject: [PATCH] riscv: fix KUnit test_kprobes crash when building with Clang

Clang misaligns the test_kprobes_addresses and test_kprobes_functions
arrays, or does not export local labels by default. Both can cause
kmalloc_array() allocation errors and KUnit failures.

When testing the Clang-compiled code in QEMU, this warning was
emitted:

WARNING: CPU: 1 PID: 3000 at mm/page_alloc.c:5159 __alloc_frozen_pages_noprof+0xe6/0x2fc mm/page_alloc.c:5159

Further investigation revealed that the test_kprobes_addresses array
appeared to have over 100,000 elements, including invalid addresses;
whereas, according to test-kprobes-asm.S, test_kprobes_addresses
should only have 25 elements.

When compiling the kernel with GCC, the kernel boots correctly.

This patch fixes the issue by:
- Adding .section .rodata to explicitly place arrays in the read-only
  data segment.
- Adding .align 3 to align arrays to 8 bytes.
- Adding .globl to probe labels to ensure symbols are visible.

For detailed debug and analysis, see:
https://github.com/j1akai/temp/blob/main/20251113/readme.md

Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Link: https://patch.msgid.link/738dd4e2.ff73.19a7cd7b4d5.Coremail.xujiakai2025@iscas.ac.cn
Link: https://github.com/llvm/llvm-project/issues/168308
Cc: Nam Cao <namcao@linutronix.de>
[pjw@kernel.org: added additional context to the patch description]
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 .../kernel/tests/kprobes/test-kprobes-asm.S   | 29 +++++++++++++++++++
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
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
