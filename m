Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD7AC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 02:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWmjat6FOXcF7iwtDE0xowC0nBmPTgY3m74P7JT8PIM=; b=0eU/GDEvF7wMVA
	zrzv1uPvYztJwOFwKwoxKcFrC1ERlJcKKRcpd0ZySGguuy3IkJpD5YxoLABzk71mLa9NCaXtBEapx
	nsX+SGnul1d66LVyWWZgnPA4ccmKrdkWO6nC99ofDRntuisPMuDwX+UoX1DNBQDOBEW8dax+JFUfM
	NaCZl2hIeNSiHHEl5P659gV37NQ45IASi6BAc0vXEu3TWQJSH3q0dkn2KhAFplH6a8r5ZSSSf+YVU
	Zh+OpyuiklpFw140lYLOSvks+/iFpLSKiNjIbMMDQAgcuTfKJWYab2iJXmGLYouSC3n5AInG2T41y
	6CngbgmQwpdSFvsUgOzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjTMS-0000000AmoS-2f7f;
	Tue, 14 Jul 2026 02:59:08 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjTMP-0000000Ammx-3Sfg
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 02:59:07 +0000
X-UUID: f35a4bce7f2f11f1aa26b74ffac11d73-20260714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:8526be9c-8b6b-4ffd-aade-cada6fc43aea,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:cce087366865555aa2dd1faeddb02eca,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|850|865|898,TC:nil,Content
	:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f35a4bce7f2f11f1aa26b74ffac11d73-20260714
X-User: jiangfeng@kylinos.cn
Received: from [127.0.0.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1998968596; Tue, 14 Jul 2026 10:58:54 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
Date: Tue, 14 Jul 2026 10:58:48 +0800
Subject: [PATCH 1/2] bpf, riscv: add support for timed may_goto
MIME-Version: 1.0
Message-Id: <20260714-riscv-bpf-timed-may-goto-v1-1-3988601fe6ac@kylinos.cn>
References: <20260714-riscv-bpf-timed-may-goto-v1-0-3988601fe6ac@kylinos.cn>
In-Reply-To: <20260714-riscv-bpf-timed-may-goto-v1-0-3988601fe6ac@kylinos.cn>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Feng Jiang <jiangfeng@kylinos.cn>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_195906_170261_343AC0E4 
X-CRM114-Status: GOOD (  11.62  )
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
 arch/riscv/net/bpf_jit_comp64.c     |  5 +++++
 arch/riscv/net/bpf_timed_may_goto.S | 44 +++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 1 deletion(-)

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
index c03c1de16b79..9832a19200c7 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -2157,3 +2157,8 @@ bool bpf_jit_supports_fsession(void)
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
index 000000000000..f54f389d921e
--- /dev/null
+++ b/arch/riscv/net/bpf_timed_may_goto.S
@@ -0,0 +1,44 @@
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
+
+	/* Save BPF registers R0-R5 (a5, a0-a4) */
+	sd	a5, 48(sp)
+	sd	a0, 40(sp)
+	sd	a1, 32(sp)
+	sd	a2, 24(sp)
+	sd	a3, 16(sp)
+	sd	a4, 8(sp)
+
+	add	a0, t0, s5
+	call	bpf_check_timed_may_goto
+	mv	t0, a0
+
+	/* Restore BPF registers R0-R5 */
+	ld	a4, 8(sp)
+	ld	a3, 16(sp)
+	ld	a2, 24(sp)
+	ld	a1, 32(sp)
+	ld	a0, 40(sp)
+	ld	a5, 48(sp)
+
+	ld	ra, 56(sp)
+	addi	sp, sp, 64
+	ret
+SYM_FUNC_END(arch_bpf_timed_may_goto)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
