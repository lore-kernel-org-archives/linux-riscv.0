Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290A2E83057
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 05:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9cy1s+eq0g61n1bjqYG6XL5vGeswDCLxsUYH/ssE9U=; b=YTevFL1EVQ9wDB
	yIAWyrwz2rtuO1nIPK2ZaV3AxkA/8vpivDVbUtXnr995ZOiZ85JAvaQwLtoFW8+yeDq/aWRsm2tkb
	Rjhuow3b1/1/V+77ivPIZu4w1yCGd4bwNlQVbMPfCsBovngXQFopDDFrVb6Ib8vi5LAX6mnaS9U3W
	umvu1eqstk4CnagnuA+g0K7+d3goyPQnxMKzNguTVHEX0etRP0IZrBs3EbVpSjtN7xNmlIkRSwtmo
	xE5k0JK9vx9s7LtEST5EQKvGU1CRCk1R81VgdCq5n2b3VIluiLukvzEEeR5hTFdYdrckKYMHeWnvO
	N2jnP3yzTtnRq0tdDmpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9La-0000000693h-0blK;
	Tue, 03 Feb 2026 05:53:10 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9LY-0000000692S-1NVs
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 05:53:09 +0000
Received: by mail-qv1-xf43.google.com with SMTP id 6a1803df08f44-8951c720496so715846d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Feb 2026 21:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770097987; x=1770702787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uxGWuC9y0ak4TPgoWK6c0g9IlENP1gQKqGkKB74Ees=;
        b=Tjott4WseF244ECTCj+FsjdIj01yIR8lA3pRi5nWHpXJDE+o7ggj9cqyYCPBz0DbhV
         d+e6hu/pOhrjHEu9WDOzZf5NvdKd4W0p8/IYHhNjvStMwUAUcyy/vkaQVQSlV+OAYzmR
         N79IisAzamXAOdBmANUrrhY2Z5Q9yZYsH2SK3bXYevA8+1uh6xhtvLQCF7Qkts+PEtPw
         dhCOhhaTenjLMGZkPD/r6pPQIDkRckwnZSyILZkLL31ZdHyddHURJwasa/kHqw7Woyzb
         2HhN8ulCe7eiXYGFyiIxa4v/upuNwS7fJ330bggeEHje5K8M16oTMQXJoS5UPaSbI4py
         6umQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097987; x=1770702787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6uxGWuC9y0ak4TPgoWK6c0g9IlENP1gQKqGkKB74Ees=;
        b=LNx/8s85wPpAEAWnDVi430ccI+4dojCQlM5owhIkdAQ/sTfUUrqSF0sD4K8nvXVKBR
         wMfo0MiWJqyYXCr4cu0FTAnflZippZmCGLjMigKZAaEo8hscdPjIctBjZp1aTmPCRxPz
         k4P8KjegJNBUF/oDgoCPZstE5EWzwWuQwDLWh2j3+bgGQzvKou0hUeAWJ3oy030dyDVe
         LCOsQwF3KrvSMkBqrhmAagG3ygTuLjlWTSlFVJ4cfm/fYfpw1C4/ynHUKVTgjNwlKYjv
         9uvswNjsuC9HrxNu4ncv5vd4wN4jUdGgZ8aGof0ipOBcKrJ8BQ5a/tsJKRcPbHJxbdOS
         as1A==
X-Forwarded-Encrypted: i=1; AJvYcCUmvCKeXwsooeK/C5KCSE9HQJWZCjmstvNfOUGLvhIt/EHFQGAz8Y4C2N9ToegQLIgy2lawzIIMxqUA8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNd4BLGFPFVz22jvPGLUbsT6EBZsz6kaMswIzXRC5L13yd+99m
	GInIfvr7xhTu/07CVHeKg3FzM3XWnOjPT56rVgkHYX+cZ5UOhhCas7T4
X-Gm-Gg: AZuq6aJ++tt1a1xzxdurIstqIjZdstIwPZ7tBNLlTCGOrwZjyHHkicByFqqYczexues
	PuM2qHtEK//RMZuAKqJVQ2FZ0Q+Sz4QALPqQGQ4sctW1GNWuAd+zyIv3GGvEsRzgC9G3O1BE9ey
	nHlTa0xZswElKKCCyj5Ix+2M77h7Xu5EnmI7auumTnGyzb4GVgM0pOyXjL+5Tbo2FMDiiWTshb1
	GiwHkYvptVUI2QtdzqEAind/CcnLE5UTpcQZ37y6k2YndOyV0kIJCeQPBUiSrth8PC/dLBfFOlF
	jjV0rIbQYufBXc1+CnQ7EAelWn9DvbhsIsixYWVVlo3CsUvbkjWPZ2cbPWyIjipsgYBOL0cayj3
	NK1iocd45y/+nwM9RbvLv9Cu6RQufV/puiOvO94h8lY/bcZMjUwMC6rSaZcBXfGfpBxSutGVWRm
	4lP0dX9CrgieuTTapGEQ==
X-Received: by 2002:a05:6214:1c0f:b0:888:7ba5:6b35 with SMTP id 6a1803df08f44-894e9f818e5mr209940796d6.19.1770097986889;
        Mon, 02 Feb 2026 21:53:06 -0800 (PST)
Received: from 7940hx ([23.94.188.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d376e65bsm129844996d6.55.2026.02.02.21.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:53:06 -0800 (PST)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jiang.biao@linux.dev,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 2/3] bpf, riscv: add fsession support for trampolines
Date: Tue,  3 Feb 2026 13:52:30 +0800
Message-ID: <20260203055231.1088479-3-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203055231.1088479-1-dongml2@chinatelecom.cn>
References: <20260203055231.1088479-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_215308_388003_7A0EC69E 
X-CRM114-Status: GOOD (  15.08  )
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

Implement BPF_TRACE_FSESSION support in the RISC-V trampoline JIT. The
logic here is similar to what we did in x86_64.

In order to simply the logic, we factor out the function invoke_bpf() for
fentry and fexit.

Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
 arch/riscv/net/bpf_jit_comp64.c | 74 ++++++++++++++++++++++++++++-----
 1 file changed, 64 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index e4f45e2e7e2f..f10418ff6a9b 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -996,6 +996,29 @@ static int invoke_bpf_prog(struct bpf_tramp_link *l, int args_off, int retval_of
 	return ret;
 }
 
+static int invoke_bpf(struct bpf_tramp_links *tl, int args_off, int retval_off,
+		      int run_ctx_off, int func_meta_off, bool save_ret, u64 func_meta,
+		      int cookie_off, struct rv_jit_context *ctx)
+{
+	int i, cur_cookie = (cookie_off - args_off) / 8;
+
+	for (i = 0; i < tl->nr_links; i++) {
+		int err;
+
+		if (tl->links[i]->link.prog->call_session_cookie) {
+			u64 meta = func_meta | ((u64)cur_cookie << BPF_TRAMP_COOKIE_INDEX_SHIFT);
+
+			emit_store_stack_imm64(RV_REG_T1, -func_meta_off, meta, ctx);
+			cur_cookie--;
+		}
+		err = invoke_bpf_prog(tl->links[i], args_off, retval_off, run_ctx_off,
+				      save_ret, ctx);
+		if (err)
+			return err;
+	}
+	return 0;
+}
+
 static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 					 const struct btf_func_model *m,
 					 struct bpf_tramp_links *tlinks,
@@ -1005,13 +1028,15 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	int i, ret, offset;
 	int *branches_off = NULL;
 	int stack_size = 0, nr_arg_slots = 0;
-	int retval_off, args_off, nregs_off, ip_off, run_ctx_off, sreg_off, stk_arg_off;
+	int retval_off, args_off, func_meta_off, ip_off, run_ctx_off, sreg_off, stk_arg_off;
+	int cookie_off, cookie_cnt;
 	struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
 	struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
 	struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
 	bool is_struct_ops = flags & BPF_TRAMP_F_INDIRECT;
 	void *orig_call = func_addr;
 	bool save_ret;
+	u64 func_meta;
 	u32 insn;
 
 	/* Two types of generated trampoline stack layout:
@@ -1042,10 +1067,14 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	 *                  [ ...               ]
 	 * FP - args_off    [ arg1              ]
 	 *
-	 * FP - nregs_off   [ regs count        ]
+	 * FP - func_meta_off [ regs count, etc ]  always
 	 *
 	 * FP - ip_off      [ traced func	] BPF_TRAMP_F_IP_ARG
 	 *
+	 *                  [ stack cookie N    ]
+	 *                  [ ...               ]
+	 * FP - cookie_off  [ stack cookie 1    ]
+	 *
 	 * FP - run_ctx_off [ bpf_tramp_run_ctx ]
 	 *
 	 * FP - sreg_off    [ callee saved reg	]
@@ -1077,14 +1106,20 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	stack_size += nr_arg_slots * 8;
 	args_off = stack_size;
 
+	/* function metadata, such as regs count */
 	stack_size += 8;
-	nregs_off = stack_size;
+	func_meta_off = stack_size;
 
 	if (flags & BPF_TRAMP_F_IP_ARG) {
 		stack_size += 8;
 		ip_off = stack_size;
 	}
 
+	cookie_cnt = bpf_fsession_cookie_cnt(tlinks);
+	/* room for session cookies */
+	stack_size += cookie_cnt * 8;
+	cookie_off = stack_size;
+
 	stack_size += round_up(sizeof(struct bpf_tramp_run_ctx), 8);
 	run_ctx_off = stack_size;
 
@@ -1132,10 +1167,19 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	if (flags & BPF_TRAMP_F_IP_ARG)
 		emit_store_stack_imm64(RV_REG_T1, -ip_off, (u64)func_addr, ctx);
 
-	emit_store_stack_imm64(RV_REG_T1, -nregs_off, nr_arg_slots, ctx);
+	func_meta = nr_arg_slots;
+	emit_store_stack_imm64(RV_REG_T1, -func_meta_off, func_meta, ctx);
 
 	store_args(nr_arg_slots, args_off, ctx);
 
+	if (bpf_fsession_cnt(tlinks)) {
+		/* clear all session cookies' value */
+		for (i = 0; i < cookie_cnt; i++)
+			emit_sd(RV_REG_FP, -cookie_off + 8 * i, RV_REG_ZERO, ctx);
+		/* clear return value to make sure fentry always get 0 */
+		emit_sd(RV_REG_FP, -retval_off, RV_REG_ZERO, ctx);
+	}
+
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
 		emit_imm(RV_REG_A0, ctx->insns ? (const s64)im : RV_MAX_COUNT_IMM, ctx);
 		ret = emit_call((const u64)__bpf_tramp_enter, true, ctx);
@@ -1143,9 +1187,9 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 			return ret;
 	}
 
-	for (i = 0; i < fentry->nr_links; i++) {
-		ret = invoke_bpf_prog(fentry->links[i], args_off, retval_off, run_ctx_off,
-				      flags & BPF_TRAMP_F_RET_FENTRY_RET, ctx);
+	if (fentry->nr_links) {
+		ret = invoke_bpf(fentry, args_off, retval_off, run_ctx_off, func_meta_off,
+				 flags & BPF_TRAMP_F_RET_FENTRY_RET, func_meta, cookie_off, ctx);
 		if (ret)
 			return ret;
 	}
@@ -1192,9 +1236,14 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 		*(u32 *)(ctx->insns + branches_off[i]) = insn;
 	}
 
-	for (i = 0; i < fexit->nr_links; i++) {
-		ret = invoke_bpf_prog(fexit->links[i], args_off, retval_off,
-				      run_ctx_off, false, ctx);
+	/* set "is_return" flag for fsession */
+	func_meta |= (1ULL << BPF_TRAMP_IS_RETURN_SHIFT);
+	if (bpf_fsession_cnt(tlinks))
+		emit_store_stack_imm64(RV_REG_T1, -func_meta_off, func_meta, ctx);
+
+	if (fexit->nr_links) {
+		ret = invoke_bpf(fexit, args_off, retval_off, run_ctx_off, func_meta_off,
+				 false, func_meta, cookie_off, ctx);
 		if (ret)
 			goto out;
 	}
@@ -2094,3 +2143,8 @@ bool bpf_jit_inlines_helper_call(s32 imm)
 		return false;
 	}
 }
+
+bool bpf_jit_supports_fsession(void)
+{
+	return true;
+}
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
