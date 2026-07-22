Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD9CC44536
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 04:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKzF/LmpggFvvJPBmuS0iFew2bmVVmUZOT7oH554pQQ=; b=4gFtoOXPy8P6qC
	3qpyf5umaNxqVwyD3RgwQz3iDoJ3fBRpBQKdU3QRn++iCzvSPTAndvv1rSWk0lD3s2/h8dyNgZwdG
	y56D5GFmZlf8evAXV5aG6DIhch51RGa7Tn00fqrpWe4x2oSSCe0HtE70N+atGKxghdWFiSbetSxs1
	am26KljkiJprWvdq1bBnfeilagBKwfV5LobxeDvyUNqhn+kVcgkM4JxRfIDqTMiXcTR3ev4lLpf2F
	4BJ6Qs6lyLcRl6j9EQo2o/xhwDlybrAHqp3ZEEhQDphZsZeTsZiYH/WpYAC66IRmLKBBBphTKy7e9
	njQAVX9TV48SV+VvJKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmOTb-0000000AsTd-3bZj;
	Wed, 22 Jul 2026 04:22:35 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmOTX-0000000AsRZ-3dcv
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 04:22:35 +0000
X-UUID: ed854e0a858411f1aa26b74ffac11d73-20260722
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:c69b1278-8d44-4dc6-9e7e-1265e4e14337,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:9a3cfa686445791d6e234b324b41ec1a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|850|865|898,TC:nil,Content
	:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ed854e0a858411f1aa26b74ffac11d73-20260722
X-User: jiangfeng@kylinos.cn
Received: from [127.0.0.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 801892114; Wed, 22 Jul 2026 12:22:19 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
Date: Wed, 22 Jul 2026 04:21:25 +0000
Subject: [PATCH bpf-next v4 1/3] bpf, riscv: add support for timed may_goto
MIME-Version: 1.0
Message-Id: <20260722-riscv-bpf-timed-may-goto-v4-1-e117e6337bc7@kylinos.cn>
References: <20260722-riscv-bpf-timed-may-goto-v4-0-e117e6337bc7@kylinos.cn>
In-Reply-To: <20260722-riscv-bpf-timed-may-goto-v4-0-e117e6337bc7@kylinos.cn>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Luke Nelson <luke.r.nels@gmail.com>, 
 Xi Wang <xi.wang@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Feng Jiang <jiangfeng@kylinos.cn>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_212232_607357_FA46F158 
X-CRM114-Status: GOOD (  13.55  )
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

Implement arch_bpf_timed_may_goto() for the RV64 JIT. The argument and
return value are carried in BPF_REG_AX, and BPF R0-R5 are preserved
across the call to the generic bpf_check_timed_may_goto().

Enable bpf_jit_supports_timed_may_goto() so the verifier uses the timed
expansion path.

Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 arch/riscv/net/Makefile             |  2 +-
 arch/riscv/net/bpf_jit_comp64.c     | 12 +++++++++-
 arch/riscv/net/bpf_timed_may_goto.S | 47 +++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/net/Makefile b/arch/riscv/net/Makefile
index 9a1e5f0a94e5..6458d4d51990 100644
--- a/arch/riscv/net/Makefile
+++ b/arch/riscv/net/Makefile
@@ -3,7 +3,7 @@
 obj-$(CONFIG_BPF_JIT) += bpf_jit_core.o
 
 ifeq ($(CONFIG_ARCH_RV64I),y)
-	obj-$(CONFIG_BPF_JIT) += bpf_jit_comp64.o
+	obj-$(CONFIG_BPF_JIT) += bpf_jit_comp64.o bpf_timed_may_goto.o
 else
 	obj-$(CONFIG_BPF_JIT) += bpf_jit_comp32.o
 endif
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index ad089a9a4ea9..8fe8969fb8a0 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1841,7 +1841,12 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 		if (aux->tail_call_reachable && insn->src_reg == BPF_PSEUDO_CALL)
 			emit_sd(RV_REG_SP, ctx->tcc_offset, RV_REG_TCC, ctx);
 
-		if (insn->src_reg != BPF_PSEUDO_CALL)
+		/*
+		 * arch_bpf_timed_may_goto() is emitted by the verifier and
+		 * returns its result in BPF_REG_AX instead of BPF_REG_0, so
+		 * skip the normal "move return register into R0".
+		 */
+		if (insn->src_reg != BPF_PSEUDO_CALL && addr != (u64)arch_bpf_timed_may_goto)
 			emit_mv(bpf_to_rv_reg(BPF_REG_0, ctx), RV_REG_A0, ctx);
 		break;
 	}
@@ -2161,3 +2166,8 @@ bool bpf_jit_supports_subprog_tailcalls(void)
 {
 	return true;
 }
+
+bool bpf_jit_supports_timed_may_goto(void)
+{
+	return true;
+}
diff --git a/arch/riscv/net/bpf_timed_may_goto.S b/arch/riscv/net/bpf_timed_may_goto.S
new file mode 100644
index 000000000000..f4bf2cd10586
--- /dev/null
+++ b/arch/riscv/net/bpf_timed_may_goto.S
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2026 Feng Jiang <jiangfeng@kylinos.cn> */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+
+/*
+ * Trampoline for the BPF timed may_goto loop bound. Custom calling convention:
+ *	- input:  stack offset in BPF_REG_AX (t0)
+ *	- output: updated count in BPF_REG_AX (t0)
+ *
+ * Calls bpf_check_timed_may_goto(ptr) with the standard RISC-V ABI, where
+ * ptr = BPF_REG_FP (s5) + BPF_REG_AX (t0). BPF R0-R5 (a5, a0-a4) are saved
+ * across the call; BPF_REG_FP (s5) is callee-saved and needs no saving.
+ */
+
+SYM_FUNC_START(arch_bpf_timed_may_goto)
+	addi	sp, sp, -64
+	sd	ra, 56(sp)
+	sd	s0, 48(sp)
+	addi	s0, sp, 64
+
+	/* Save BPF registers R0-R5 (a5, a0-a4) */
+	sd	a5, 40(sp)
+	sd	a0, 32(sp)
+	sd	a1, 24(sp)
+	sd	a2, 16(sp)
+	sd	a3, 8(sp)
+	sd	a4, 0(sp)
+
+	add	a0, t0, s5
+	call	bpf_check_timed_may_goto
+	mv	t0, a0
+
+	/* Restore BPF registers R0-R5 */
+	ld	a4, 0(sp)
+	ld	a3, 8(sp)
+	ld	a2, 16(sp)
+	ld	a1, 24(sp)
+	ld	a0, 32(sp)
+	ld	a5, 40(sp)
+
+	ld	s0, 48(sp)
+	ld	ra, 56(sp)
+	addi	sp, sp, 64
+	ret
+SYM_FUNC_END(arch_bpf_timed_may_goto)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
