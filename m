Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90730CA5FD2
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NORBgg7/nyuyfwsjS34EjQVe+4BJMCRC5mcos1DoYzU=; b=gjGuW+USxz492m
	xlZiU2AlOdq6J3dD3anWbpabW/ol0rT0/hOtDXQLtUw9hxu+o9k1uhccPTis33Qht84AH5hYviFTC
	dyU3AWTT2z7NBKgq7V6vekwC9TL2ZXrN4CscLlWzKWeqtswy4xItZHcDUh3l6dJDxlnySYTX6EkuM
	L+4b+2Tus7T3FI3KfVb32HLkWFi+Hp5MlYhgVV0NBzL/CxMmEzTaTui9S9E9JZfZQ7NW0E1dKhUzp
	ryN5m8oYg6QlEpTy9Lr736aE/9W0ytb6bGW8bYtKkPM5IzNlX6sfQG4WCF6oBGaYn5IOsjKoMikkl
	GlrjPXRX19NR0ZowgpZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIun-00000009ZnF-25lB;
	Thu, 01 Oct 2026 15:41:45 +0000
Received: from out-29.mta1.migadu.com ([95.215.58.29] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIuk-00000009ZlY-199N
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 15:41:43 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=S9MbpFYOyRT/9+KRnGcXzjKFgivK18Y9a7e4BZyewfE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790869295; v=1; x=1791474095;
 b=RXmIkPuWLMPEyFKRHcMJfalc83Xlh+uD4nnctwK/qwHr+pOj43GE7+68AGj2UXt5td7U+9Kp
 mfhqLie3SRaF1pxBh3omtjNcwPpmYlR6LuiPFBXoGzNMtc3j3hiZE37n+jTk3xh3EBteh7AK5LR
 u8VSFdMWhOXgIHP15o9U7nDI=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id 30b8e7bec69cf5c8;
	Thu, 01 Oct 2026 15:41:34 +0000
X-Mizu-Trace-ID: 30b8e7bec69cf5c8
X-Migadu-Flow: FLOW_OUT
From: KaFai Wan <kafai.wan@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: KaFai Wan <kafai.wan@linux.dev>
Subject: [PATCH bpf 1/1] bpf, riscv: Fix stack arguments of struct_ops trampolines
Date: Thu,  1 Oct 2026 23:40:38 +0800
Message-ID: <20261001154038.2265210-1-kafai.wan@linux.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_084142_540495_958D00E4 
X-CRM114-Status: GOOD (  12.05  )
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

When a struct_ops trampoline takes more than 8 arguments (up to 12), the
9th and beyond are passed on the stack. store_args() copies them into the
trampoline frame using a hard-coded FP + 16 base:

	emit_ld(RV_REG_T1, 16 + (i - RV_MAX_REG_ARGS) * 8, RV_REG_FP, ctx);

That offset only holds for fentry trampolines, where the traced function's
T0/FP are saved at FP - 8/FP - 16 and its stack arguments start at FP + 16.
A struct_ops trampoline is called directly, so its stack arguments start at
FP + 0 and store_args() reads the wrong words. BPF programs then see garbage
for arg9 and beyond, which fails the selftest:

  struct_ops_multi_args/test_trampoline_stack_args:FAIL

Pass the stack argument base offset to store_args(): 0 for struct_ops
trampolines, 16 otherwise.

Fixes: 6801b0aef79d ("riscv, bpf: Add 12-argument support for RV64 bpf trampoline")
Signed-off-by: KaFai Wan <kafai.wan@linux.dev>
---
 arch/riscv/net/bpf_jit_comp64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 01fe66774f02..4ae6674f58ed 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -875,7 +875,7 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type old_t,
 	return ret;
 }
 
-static void store_args(int nr_arg_slots, int args_off, struct rv_jit_context *ctx)
+static void store_args(int nr_arg_slots, int args_off, int stack_base, struct rv_jit_context *ctx)
 {
 	int i;
 
@@ -883,8 +883,7 @@ static void store_args(int nr_arg_slots, int args_off, struct rv_jit_context *ct
 		if (i < RV_MAX_REG_ARGS) {
 			emit_sd(RV_REG_FP, -args_off, RV_REG_A0 + i, ctx);
 		} else {
-			/* skip slots for T0 and FP of traced function */
-			emit_ld(RV_REG_T1, 16 + (i - RV_MAX_REG_ARGS) * 8, RV_REG_FP, ctx);
+			emit_ld(RV_REG_T1, stack_base + (i - RV_MAX_REG_ARGS) * 8, RV_REG_FP, ctx);
 			emit_sd(RV_REG_FP, -args_off, RV_REG_T1, ctx);
 		}
 		args_off -= 8;
@@ -1179,7 +1178,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	func_meta = nr_arg_slots;
 	emit_store_stack_imm64(RV_REG_T1, -func_meta_off, func_meta, ctx);
 
-	store_args(nr_arg_slots, args_off, ctx);
+	/* skip slots for T0 and FP of traced function */
+	store_args(nr_arg_slots, args_off, is_struct_ops ? 0 : 16, ctx);
 
 	if (bpf_fsession_cnt(tnodes)) {
 		/* clear all session cookies' value */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
