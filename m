Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066E4E83057
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 05:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=//xdL3E0X5p8lKBe7R3DbTgQGFq09fzPwoHA+HfGxBA=; b=DZvbcDWxUzNnL1
	kSscntxFdJCrs2ihgAChMLal5YmC6FvT09UPlcwmZAqBH+j6DT8OAnTtOKtr+ci1Bd3iZyDqxylwE
	+COG8tmM366GlUKaqUPoEZ2RXGs2+SEWPuK2w4m7Mecrw9AjkAdR8jba73cfvQxsRDiVf+YY+zhif
	5RZqU3/qrltMKH990kVbIgxhcbTfPBzWoQTXFt7MpyT8Cp0snupIBo8lMZA1JSaJJoT8qTXSz2qBX
	1kfrPFVyGND42SbIAkxiMii48UBPPhX4TBtlHg3QDZcsbGRQEnQKB0vexGx3gMzUlgzWOVCW6ZyVC
	yuVetcJuejMfylUgGqgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9LS-00000006901-3Mx2;
	Tue, 03 Feb 2026 05:53:02 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9LP-000000068y8-2cBL
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 05:53:00 +0000
Received: by mail-qt1-x844.google.com with SMTP id d75a77b69052e-502a98c66f7so42941811cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Feb 2026 21:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770097978; x=1770702778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzVkfCKgUCL7plixo/BQ6/TFm6BL7pd9AJ8r1pM28SI=;
        b=T68knxGob2MUxFq3KgvUABkzFpyaZUtK2Ijx40q2kX2+6FnTJFzftZPPuzkXIQGr3+
         IOVBsN7kcaPgN0l/yxNd54X3uXYzUV3YTbdAbl58fbGxRrQ3dTHCSQ4dWWEU8StuZiEx
         TSm+VLwmBc0ecBPrd5esedl51Q0aJlby2PZkyR/YkDv6XhEy1Qr8IQwtJWIJ4WvLwpHg
         B7w3S//QMvuI43V7drXyotXlm5FUaBj+YkKIk7xz6f9fKSdqmdXKTTnZ0emoBYWPq/1x
         o+nCPHlc5hzrw19ACxKSXaVGmC+dtT4NRaQ6ilTmVQJ/I8JUSvhnC9lrZZ2ZQzZz+iGy
         a8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097978; x=1770702778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PzVkfCKgUCL7plixo/BQ6/TFm6BL7pd9AJ8r1pM28SI=;
        b=L0eW/ANkeSFZ4sJbgV1foq+5eCseOvsp8uKElkEtv2YZJqoY39YkuuRWNtKP2D6gnz
         tQVn6GlctR1tKY1hJCFVsu9gSXpkTRvnSvJEOukdSMTkMOFE++v/7HcE2ZXPE3y2tAcj
         J94667vKFZfwbLeF7v1t/mYWII4hKlBnO5fFox9W/mUR46i4qJRB0wpK4nIwoyeirWXi
         OO47B1BR/zq/IZDZO0OnofGPPtqPTHQu3iQNc8gLnjvMCIuh2ADhZl9coxI6MZLwkWOT
         D6kxv/f++YQ8i/GrYpinYHAJqihxQCrB/WMgeY/wZrd143wT7z5zMctNZ0s0r0JfVUQn
         ESHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+i9jjC8Fljxnh5kDUVTclGGQp3eKyawSKzLxCNPKnBnSWCzIVvAYWYIAvteqvcmNaCNVJcSBQkz8Kcw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5cU4QFh6qLKDAyiTpdeI0R++2YTOo65aetbtR7/tlh7ukx8si
	0BltQ1fNAMsqNllVKY2GIemkNoEeh/nQrcWUJ4NAnh90la4JNL5tGWqc
X-Gm-Gg: AZuq6aKKgYiQPuN3MOdy7TwsBfJz81wYhYUlOebxvidX0bWWc3d9rqd46O6/iAdnS1Y
	IPx5O3Z5u+cW4xR7MJPhrREAniTF2DM34Fs/ECAq2hSapbhMVjAf5lZQMRvfDDHTZhn5CP0D515
	v9K9gij5QQrQpXQfqN/ireJ10K8uGJRhKxxALt8g55PzEGG92uDR0JDqLpnlr7z4DV8scEi+AZ6
	fiX0OY90PBy088SKCIUJk2GL3d7iCe2LCAGMqAT8ZpWl0H7hB7oWhBLn9Jn5DkrvZWM1h2b8O8j
	h0sRLs95cA4sjHoe2K3FScmNR70LflB96A57pMX7/6KQ/k2a86rUrMR8A49Y4yK1teiwrAvCw24
	AhJJPqSrwnWe3Kmg5/cT62UbpuamwWTxEEhlpTqfwMFEzL9KATCEg0y3a7NYQCXtechgVhC6HWq
	AnclWQrXE=
X-Received: by 2002:ac8:5a0d:0:b0:4f4:e15d:f220 with SMTP id d75a77b69052e-505d2183d83mr151199911cf.25.1770097978028;
        Mon, 02 Feb 2026 21:52:58 -0800 (PST)
Received: from 7940hx ([23.94.188.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d376e65bsm129844996d6.55.2026.02.02.21.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:52:57 -0800 (PST)
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
Subject: [PATCH bpf-next 1/3] bpf, riscv: introduce emit_store_stack_imm64() for trampoline
Date: Tue,  3 Feb 2026 13:52:29 +0800
Message-ID: <20260203055231.1088479-2-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203055231.1088479-1-dongml2@chinatelecom.cn>
References: <20260203055231.1088479-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_215259_671734_EFC0D267 
X-CRM114-Status: GOOD (  12.41  )
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

Introduce a helper to store 64-bit immediate on the trampoline stack with
a help of a register.

Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
 arch/riscv/net/bpf_jit_comp64.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 37888abee70c..e4f45e2e7e2f 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -926,6 +926,14 @@ static void restore_stack_args(int nr_stack_args, int args_off, int stk_arg_off,
 	}
 }
 
+static void emit_store_stack_imm64(u8 reg, int stack_off, u64 imm64,
+				   struct rv_jit_context *ctx)
+{
+	/* Load imm64 into reg and store it at [FP + stack_off]. */
+	emit_imm(reg, (s64)imm64, ctx);
+	emit_sd(RV_REG_FP, stack_off, reg, ctx);
+}
+
 static int invoke_bpf_prog(struct bpf_tramp_link *l, int args_off, int retval_off,
 			   int run_ctx_off, bool save_ret, struct rv_jit_context *ctx)
 {
@@ -933,12 +941,10 @@ static int invoke_bpf_prog(struct bpf_tramp_link *l, int args_off, int retval_of
 	struct bpf_prog *p = l->link.prog;
 	int cookie_off = offsetof(struct bpf_tramp_run_ctx, bpf_cookie);
 
-	if (l->cookie) {
-		emit_imm(RV_REG_T1, l->cookie, ctx);
-		emit_sd(RV_REG_FP, -run_ctx_off + cookie_off, RV_REG_T1, ctx);
-	} else {
+	if (l->cookie)
+		emit_store_stack_imm64(RV_REG_T1, -run_ctx_off + cookie_off, l->cookie, ctx);
+	else
 		emit_sd(RV_REG_FP, -run_ctx_off + cookie_off, RV_REG_ZERO, ctx);
-	}
 
 	/* arg1: prog */
 	emit_imm(RV_REG_A0, (const s64)p, ctx);
@@ -1123,13 +1129,10 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	emit_sd(RV_REG_FP, -sreg_off, RV_REG_S1, ctx);
 
 	/* store ip address of the traced function */
-	if (flags & BPF_TRAMP_F_IP_ARG) {
-		emit_imm(RV_REG_T1, (const s64)func_addr, ctx);
-		emit_sd(RV_REG_FP, -ip_off, RV_REG_T1, ctx);
-	}
+	if (flags & BPF_TRAMP_F_IP_ARG)
+		emit_store_stack_imm64(RV_REG_T1, -ip_off, (u64)func_addr, ctx);
 
-	emit_li(RV_REG_T1, nr_arg_slots, ctx);
-	emit_sd(RV_REG_FP, -nregs_off, RV_REG_T1, ctx);
+	emit_store_stack_imm64(RV_REG_T1, -nregs_off, nr_arg_slots, ctx);
 
 	store_args(nr_arg_slots, args_off, ctx);
 
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
