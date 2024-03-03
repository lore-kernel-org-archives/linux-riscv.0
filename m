Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F3DC54E4A
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Mar 2024 17:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+fUBsXAXmqlqqy8CaZwYMK4B96ar5evHpdmtOVIf0A=; b=IzjAkmwTXHAd+z
	Ps+kAQRBTk6rv4Qg/CjpfaFNVTQGu06l2c3WhLJz8OUsbVv+nir3SYnoD/x+3ogvtFGuUcNs7H+wM
	AVyLhFlYbJBh5Jk73kyUdIfEA4EWCQgIB6zNlDW2K6kCSZDjJWaFRaRQCEp4yyQ6TcqvkV8tYAPPK
	nU3dtq0a+nWi+k9dGO8D80xcigd6fnP9ECVmskE0d1kXc+cg9hhr2cqyUaBXNnd/v2Yd/oTZFpJyO
	Pgm58RJqZs56VyoF2GVjhlA5nxK+2P+rw3Ta8twuN+ypPp4qnddSqagetbKGmqxXxfFg8FB6MViE9
	zghBTF4TK570lzTbjD0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgpEU-00000006LAt-1lrg;
	Sun, 03 Mar 2024 17:02:38 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgpEQ-00000006L98-3Rpd
	for linux-riscv@lists.infradead.org;
	Sun, 03 Mar 2024 17:02:36 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-412dda84216so4611765e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 03 Mar 2024 09:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709485353; x=1710090153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvYc8g3GAZbsuJfmgAAHT+2DTfmiAjpZz4+d9N2kLPQ=;
        b=cWaFLa5+FxbtoGDXZNUXLqthBj97lvv+xEI1wuOtGfIYub7le6RXGZol8gVeNUFylY
         YM4kc8FRA3hn/FFVQp8aiYdPuaDQiHx8BjRPmE79U9H+xIyG0F5rtDKpT1BYhe+OiQKJ
         rNTevV91IzHEl3jATD3ONI9pgnbO1ZztzCCoGcQxbxHED2nNIGOxEBmFO1ULrxsiDAg6
         JM3FLAd3YWsuE2hDCGy9uNXwnsNCnr2WNrdX/zWWQ2HYeq+nDKw7jmz7zw8RRbqOJDf2
         7eNim6oQJF07Vg3OeW4zDJuLrxYrVXL1zlLQC+BFeDTxZ6sPTK+RCGDr2v4TA3xDpJax
         LkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709485353; x=1710090153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvYc8g3GAZbsuJfmgAAHT+2DTfmiAjpZz4+d9N2kLPQ=;
        b=Aikv5ygKPwmjgIQGB0j3zMD0Psbtpys8pfNdMTmxedhUW4FwEi7f5TSEbrldo0MyRW
         bCnVO41HlqRuzGMql/akhmepQReMH0ZUjR+bH+JhZi1EgNZ+fa9wDB1EZxsMeVoWTPET
         Gc79AFRb7ZodvXtgwuEGGRWdVC3kF6/LMwQlG34RXd/ym5/H1CkEyJhb94WPPYU8eWIC
         L+nPEZsU0CAOJZQ1zJEyK3oQC64Fe0d2MwFZ8OVgFGv0xcSSTJNjLbm+BuJq0gGlBjBv
         mLmByOTGgRV2fx6TPEoyrBuo3ihncXZ6M/tr1qm1ecCHpNzPXNbmnvt/BiJnM+Czc6Ui
         9Mjw==
X-Forwarded-Encrypted: i=1; AJvYcCWASqNm5HOC60NSjmeM9A2vA2OqEUUgNQDXb7OTWWhDC8CIF/ALcUFxVlojuifyrNA2Hy97h+XjwcOc+XWJIiKGJsOsQgxRbTvWcgujuoHC
X-Gm-Message-State: AOJu0YzxFJ+caaE5+GlBdcNY7/fDWI269eZp/suE6/iSF1ZZTQNnq6kA
	u8ujQjIBAdjmXXhFVN45a5US2ru4feqnmkzWvvbsCG315XLeF++W
X-Google-Smtp-Source: AGHT+IHJ+kih4UsJQo56MpsvIUJ3v8P1m2BcJuEmo2XUFkGvKZbzm054All7iuXcvH7RlNtO90NwfQ==
X-Received: by 2002:a05:600c:5253:b0:40e:d30b:6129 with SMTP id fc19-20020a05600c525300b0040ed30b6129mr6014089wmb.13.1709485352899;
        Sun, 03 Mar 2024 09:02:32 -0800 (PST)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id je20-20020a05600c1f9400b00412e221d260sm1386813wmb.2.2024.03.03.09.02.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Mar 2024 09:02:32 -0800 (PST)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Kees Cook <keescook@chromium.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next 1/1] riscv64/cfi,bpf: Support kCFI + BPF on riscv64
Date: Sun,  3 Mar 2024 17:02:07 +0000
Message-Id: <20240303170207.82201-2-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240303170207.82201-1-puranjay12@gmail.com>
References: <20240303170207.82201-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240303_090234_898190_F765ED2D 
X-CRM114-Status: GOOD (  22.51  )
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

The riscv BPF JIT doesn't emit proper kCFI prologues for BPF programs
and struct_ops trampolines when CONFIG_CFI_CLANG is enabled.

This causes CFI failures when calling BPF programs and can even crash
the kernel due to invalid memory accesses.

Example crash:

root@rv-selftester:~/bpf# ./test_progs -a dummy_st_ops

 Unable to handle kernel paging request at virtual address ffffffff78204ffc
 Oops [#1]
 Modules linked in: bpf_testmod(OE) [....]
 CPU: 3 PID: 356 Comm: test_progs Tainted: P           OE      6.8.0-rc1 #1
 Hardware name: riscv-virtio,qemu (DT)
 epc : bpf_struct_ops_test_run+0x28c/0x5fc
  ra : bpf_struct_ops_test_run+0x26c/0x5fc
 epc : ffffffff82958010 ra : ffffffff82957ff0 sp : ff200000007abc80
  gp : ffffffff868d6218 tp : ff6000008d87b840 t0 : 000000000000000f
  t1 : 0000000000000000 t2 : 000000002005793e s0 : ff200000007abcf0
  s1 : ff6000008a90fee0 a0 : 0000000000000000 a1 : 0000000000000000
  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
  a5 : ffffffff868dba26 a6 : 0000000000000001 a7 : 0000000052464e43
  s2 : 00007ffffc0a95f0 s3 : ff6000008a90fe80 s4 : ff60000084c24c00
  s5 : ffffffff78205000 s6 : ff60000088750648 s7 : ff20000000035008
  s8 : fffffffffffffff4 s9 : ffffffff86200610 s10: 0000000000000000
  s11: 0000000000000000 t3 : ffffffff8483dc30 t4 : ffffffff8483dc10
  t5 : ffffffff8483dbf0 t6 : ffffffff8483dbd0
 status: 0000000200000120 badaddr: ffffffff78204ffc cause: 000000000000000d
 [<ffffffff82958010>] bpf_struct_ops_test_run+0x28c/0x5fc
 [<ffffffff805083ee>] bpf_prog_test_run+0x170/0x548
 [<ffffffff805029c8>] __sys_bpf+0x2d2/0x378
 [<ffffffff804ff570>] __riscv_sys_bpf+0x5c/0x120
 [<ffffffff8000e8fe>] syscall_handler+0x62/0xe4
 [<ffffffff83362df6>] do_trap_ecall_u+0xc6/0x27c
 [<ffffffff833822c4>] ret_from_exception+0x0/0x64
 Code: b603 0109 b683 0189 b703 0209 8493 0609 157d 8d65 (a303) ffca
 ---[ end trace 0000000000000000 ]---
 Kernel panic - not syncing: Fatal exception
 SMP: stopping secondary CPUs

Implement proper kCFI prologues for the BPF programs and callbacks and
drop __nocfi for riscv64. Fix the trampoline generation code to emit kCFI
prologue when a struct_ops trampoline is being prepared.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 arch/riscv/include/asm/cfi.h    | 17 +++++++++++
 arch/riscv/kernel/cfi.c         | 53 +++++++++++++++++++++++++++++++++
 arch/riscv/net/bpf_jit.h        |  2 +-
 arch/riscv/net/bpf_jit_comp32.c |  2 +-
 arch/riscv/net/bpf_jit_comp64.c | 14 ++++++++-
 arch/riscv/net/bpf_jit_core.c   |  9 +++---
 6 files changed, 90 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/cfi.h b/arch/riscv/include/asm/cfi.h
index 8f7a62257044..fb9696d7a3f2 100644
--- a/arch/riscv/include/asm/cfi.h
+++ b/arch/riscv/include/asm/cfi.h
@@ -13,11 +13,28 @@ struct pt_regs;
 
 #ifdef CONFIG_CFI_CLANG
 enum bug_trap_type handle_cfi_failure(struct pt_regs *regs);
+#define __bpfcall
+static inline int cfi_get_offset(void)
+{
+	return 4;
+}
+
+#define cfi_get_offset cfi_get_offset
+extern u32 cfi_bpf_hash;
+extern u32 cfi_bpf_subprog_hash;
+extern u32 cfi_get_func_hash(void *func);
 #else
 static inline enum bug_trap_type handle_cfi_failure(struct pt_regs *regs)
 {
 	return BUG_TRAP_TYPE_NONE;
 }
+
+#define cfi_bpf_hash 0U
+#define cfi_bpf_subprog_hash 0U
+static inline u32 cfi_get_func_hash(void *func)
+{
+	return 0;
+}
 #endif /* CONFIG_CFI_CLANG */
 
 #endif /* _ASM_RISCV_CFI_H */
diff --git a/arch/riscv/kernel/cfi.c b/arch/riscv/kernel/cfi.c
index 6ec9dbd7292e..64bdd3e1ab8c 100644
--- a/arch/riscv/kernel/cfi.c
+++ b/arch/riscv/kernel/cfi.c
@@ -75,3 +75,56 @@ enum bug_trap_type handle_cfi_failure(struct pt_regs *regs)
 
 	return report_cfi_failure(regs, regs->epc, &target, type);
 }
+
+#ifdef CONFIG_CFI_CLANG
+struct bpf_insn;
+
+/* Must match bpf_func_t / DEFINE_BPF_PROG_RUN() */
+extern unsigned int __bpf_prog_runX(const void *ctx,
+				    const struct bpf_insn *insn);
+
+/*
+ * Force a reference to the external symbol so the compiler generates
+ * __kcfi_typid.
+ */
+__ADDRESSABLE(__bpf_prog_runX);
+
+/* u32 __ro_after_init cfi_bpf_hash = __kcfi_typeid___bpf_prog_runX; */
+asm (
+"	.pushsection	.data..ro_after_init,\"aw\",@progbits	\n"
+"	.type	cfi_bpf_hash,@object				\n"
+"	.globl	cfi_bpf_hash					\n"
+"	.p2align	2, 0x0					\n"
+"cfi_bpf_hash:							\n"
+"	.word	__kcfi_typeid___bpf_prog_runX			\n"
+"	.size	cfi_bpf_hash, 4					\n"
+"	.popsection						\n"
+);
+
+/* Must match bpf_callback_t */
+extern u64 __bpf_callback_fn(u64, u64, u64, u64, u64);
+
+__ADDRESSABLE(__bpf_callback_fn);
+
+/* u32 __ro_after_init cfi_bpf_subprog_hash = __kcfi_typeid___bpf_callback_fn; */
+asm (
+"	.pushsection	.data..ro_after_init,\"aw\",@progbits	\n"
+"	.type	cfi_bpf_subprog_hash,@object			\n"
+"	.globl	cfi_bpf_subprog_hash				\n"
+"	.p2align	2, 0x0					\n"
+"cfi_bpf_subprog_hash:						\n"
+"	.word	__kcfi_typeid___bpf_callback_fn			\n"
+"	.size	cfi_bpf_subprog_hash, 4				\n"
+"	.popsection						\n"
+);
+
+u32 cfi_get_func_hash(void *func)
+{
+	u32 hash;
+
+	if (get_kernel_nofault(hash, func - cfi_get_offset()))
+		return 0;
+
+	return hash;
+}
+#endif
diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 8b35f12a4452..f4b6b3b9edda 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -1223,7 +1223,7 @@ static inline void emit_bswap(u8 rd, s32 imm, struct rv_jit_context *ctx)
 
 #endif /* __riscv_xlen == 64 */
 
-void bpf_jit_build_prologue(struct rv_jit_context *ctx);
+void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog);
 void bpf_jit_build_epilogue(struct rv_jit_context *ctx);
 
 int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
index 529a83b85c1c..f5ba73bb153d 100644
--- a/arch/riscv/net/bpf_jit_comp32.c
+++ b/arch/riscv/net/bpf_jit_comp32.c
@@ -1301,7 +1301,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 	return 0;
 }
 
-void bpf_jit_build_prologue(struct rv_jit_context *ctx)
+void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 {
 	const s8 *fp = bpf2rv32[BPF_REG_FP];
 	const s8 *r1 = bpf2rv32[BPF_REG_1];
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 869e4282a2c4..aac190085472 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -11,6 +11,7 @@
 #include <linux/memory.h>
 #include <linux/stop_machine.h>
 #include <asm/patch.h>
+#include <asm/cfi.h>
 #include "bpf_jit.h"
 
 #define RV_FENTRY_NINSNS 2
@@ -455,6 +456,12 @@ static int emit_call(u64 addr, bool fixed_addr, struct rv_jit_context *ctx)
 	return emit_jump_and_link(RV_REG_RA, off, fixed_addr, ctx);
 }
 
+static inline void emit_kcfi(u32 hash, struct rv_jit_context *ctx)
+{
+	if (IS_ENABLED(CONFIG_CFI_CLANG))
+		emit(hash, ctx);
+}
+
 static void emit_atomic(u8 rd, u8 rs, s16 off, s32 imm, bool is64,
 			struct rv_jit_context *ctx)
 {
@@ -869,6 +876,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 		emit_sd(RV_REG_SP, stack_size - 16, RV_REG_FP, ctx);
 		emit_addi(RV_REG_FP, RV_REG_SP, stack_size, ctx);
 	} else {
+		/* emit kcfi hash */
+		emit_kcfi(cfi_get_func_hash(func_addr), ctx);
 		/* For the trampoline called directly, just handle
 		 * the frame of trampoline.
 		 */
@@ -1711,7 +1720,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 	return 0;
 }
 
-void bpf_jit_build_prologue(struct rv_jit_context *ctx)
+void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 {
 	int i, stack_adjust = 0, store_offset, bpf_stack_adjust;
 
@@ -1740,6 +1749,9 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx)
 
 	store_offset = stack_adjust - 8;
 
+	/* emit kcfi type preamble immediately before the  first insn */
+	emit_kcfi(is_subprog ? cfi_bpf_subprog_hash : cfi_bpf_hash, ctx);
+
 	/* nops reserved for auipc+jalr pair */
 	for (i = 0; i < RV_FENTRY_NINSNS; i++)
 		emit(rv_nop(), ctx);
diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
index 7b70ccb7fec3..6b3acac30c06 100644
--- a/arch/riscv/net/bpf_jit_core.c
+++ b/arch/riscv/net/bpf_jit_core.c
@@ -10,6 +10,7 @@
 #include <linux/filter.h>
 #include <linux/memory.h>
 #include <asm/patch.h>
+#include <asm/cfi.h>
 #include "bpf_jit.h"
 
 /* Number of iterations to try until offsets converge. */
@@ -100,7 +101,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 		pass++;
 		ctx->ninsns = 0;
 
-		bpf_jit_build_prologue(ctx);
+		bpf_jit_build_prologue(ctx, bpf_is_subprog(prog));
 		ctx->prologue_len = ctx->ninsns;
 
 		if (build_body(ctx, extra_pass, ctx->offset)) {
@@ -160,7 +161,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	ctx->ninsns = 0;
 	ctx->nexentries = 0;
 
-	bpf_jit_build_prologue(ctx);
+	bpf_jit_build_prologue(ctx, bpf_is_subprog(prog));
 	if (build_body(ctx, extra_pass, NULL)) {
 		prog = orig_prog;
 		goto out_free_hdr;
@@ -170,9 +171,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	if (bpf_jit_enable > 1)
 		bpf_jit_dump(prog->len, prog_size, pass, ctx->insns);
 
-	prog->bpf_func = (void *)ctx->ro_insns;
+	prog->bpf_func = (void *)ctx->ro_insns + cfi_get_offset();
 	prog->jited = 1;
-	prog->jited_len = prog_size;
+	prog->jited_len = prog_size - cfi_get_offset();
 
 	if (!prog->is_func || extra_pass) {
 		if (WARN_ON(bpf_jit_binary_pack_finalize(prog, jit_data->ro_header,
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
