Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C02CC3ABA5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 00:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fG13nv/ZjqG8bqh+87LaBNdzUtbxYsDgzEfDVIftUaE=; b=qPTlFZSx5suhY/1VZyD8C8vFIn
	V8sYwDojHcL8KEHg72bhc2miXoBGDHjZpCjZteegKNIOnbBN45OCkLJU6MywSVZtdEy47o7Kdiuo9
	uh260kw4zJt1+PMGxfIDHg/o4se7BKGN6dboWMWJ0NAlPxnTWkvYRoTnkXwxAOM3RGy6YnSUaabHt
	1DyajxvuWzyavvp/ROQ0mjnI6x4Wy+Y+LLxJR/O0QlASzYa9NX5cdDMvRp5IXJdGT2Rhuw3Vbs2+n
	8YMg/FPoLT30fkuT0GFkGamaUT/ocWaAAnBLWxq313xKmaw5XBZdCHeVXHqo5oK3OkamWNWVGXgHN
	HcE0XSUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vfD-0000000BNhh-1OXO;
	Wed, 30 Apr 2025 00:51:03 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vfA-0000000BNgm-0y3Z
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:51:01 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7395095a505so4955447b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745974259; x=1746579059; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ABOqan36lZIveWEkLasL+8eAvkOggPga+/54lThTXZA=;
        b=21Jskh9wa5IosxJ1n7b6mSKyv/9QG+vFwbS7DJBZk2870J1HO39vGhd/Ij4gRVuuyq
         QRUqzsmawt5TcUrH3uBqeEqKRXUmp7LzHDPV1E/OZt6FqXtwozRmqGVlYVwLX9/8YPJ1
         hPSfXPQt4l9ePUz8Sr2j+4h82ZGg/Whoicbhf26AeMF470v2yXu53f4sD4Ck85sztF7l
         /ED1UWlKr+HKNybMDLuCBeR3E6r/FxsDZCAKURHqshHOBlvraQzTWwMgaoDb0aNK8yBG
         ZtQzkqiKnWrwsE3xE8LLRx6kNtGH/MXEv+plQibVnioLD/Qzo6ioVfL8JE6NZC1d+ykf
         Z47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745974259; x=1746579059;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABOqan36lZIveWEkLasL+8eAvkOggPga+/54lThTXZA=;
        b=SW5VvfoO0V/GbRcWoi3jb1IxAyjd9m67o9MNLw6qUjpz8673cHSE37RkJtirnQl3Xv
         Y/W3LetvJrsmqHVA6Oqs9MkIP2vOpGvUQM6RN8GqftQ8NADn+AA+g1TWIytCNz5AgwJ3
         RJyAENb7YH8LrAqLH21jQqTYHkjhazjDaG3Wmz24LrQqBvXGgHJ98+knPz3YQpaSh5ZI
         0GOEjpzywJsRpMjkTUTlr0ohxv7WwfSnRimfs6whW9IwmI8nWRpz20C+nep5FeHuiMZm
         kPTBXUneGo75/5GWmO9FyIjwnUoHifkXeXxjcxjxzZrCtdocU7Sunbhk2D2wi4RUcdan
         h4NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCwXlRDsmimK3PXh55pem63aBJNeNi3pFLXoppUH72smmwhuNB1GHtoIkGFS6evR0MCAFSR4Ef4wD8rw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRofdBmLkIsb1UYpR07R/+8C+/9Ucn3a19x5Rt3zxJvayHd6yH
	QOV0qgf00QMIgQGI4TOR97pW+4Rb+W3tH94fb6CXY0IDXkpOf4e/sUJoo8oB2t8OMmeizGcriNL
	mhc+cvv9VeQ==
X-Google-Smtp-Source: AGHT+IHR8EdraOTeSJWSciGTdGHVcTZQJUarxce25b/yrSiFsMjC5ucKt57s2owsMNSPbNpmZQTiX6NEqr7wMQ==
X-Received: from pfhr5.prod.google.com ([2002:a62:e405:0:b0:736:a134:94ad])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2e05:b0:73e:2359:4115 with SMTP id d2e1a72fcca58-7403a82d834mr928914b3a.23.1745974259287;
 Tue, 29 Apr 2025 17:50:59 -0700 (PDT)
Date: Wed, 30 Apr 2025 00:50:55 +0000
In-Reply-To: <cover.1745970908.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1745970908.git.yepeilin@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <875edd356603dd5d7be30b79b97d8ee15ebc59b3.1745970908.git.yepeilin@google.com>
Subject: [PATCH bpf-next 4/8] bpf, riscv64: Skip redundant zext instruction
 after load-acquire
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org
Cc: Peilin Ye <yepeilin@google.com>, linux-riscv@lists.infradead.org, 
	Andrea Parri <parri.andrea@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Mykola Lysenko <mykolal@fb.com>, 
	Shuah Khan <shuah@kernel.org>, Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, 
	Neel Natu <neelnatu@google.com>, Benjamin Segall <bsegall@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_175100_275025_6C01F071 
X-CRM114-Status: GOOD (  15.88  )
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

Currently, the verifier inserts a zext instruction right after every 8-,
16- or 32-bit load-acquire, which is already zero-extending.  Skip such
redundant zext instructions.

While we are here, update that already-obsolete comment about "skip the
next instruction" in build_body().  Also change emit_atomic_rmw()'s
parameters to keep it consistent with emit_atomic_ld_st().

Note that checking 'insn[1]' relies on 'insn' not being the last
instruction, which should have been guaranteed by the verifier; we
already use 'insn[1]' elsewhere in the file for similar purposes.
Additionally, we don't check if 'insn[1]' is actually a zext for our
load-acquire's dst_reg, or some other registers - in other words, here
we are relying on the verifier to always insert a redundant zext right
after a 8/16/32-bit load-acquire, for its dst_reg.

Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 23 ++++++++++++++++++-----
 arch/riscv/net/bpf_jit_core.c   |  3 +--
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index b71a9c88fb4f..4cb50dbbe94b 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -607,8 +607,13 @@ static void emit_store_64(u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
 	emit_sd(RV_REG_T1, 0, rs, ctx);
 }
 
-static int emit_atomic_ld_st(u8 rd, u8 rs, s16 off, s32 imm, u8 code, struct rv_jit_context *ctx)
+static int emit_atomic_ld_st(u8 rd, u8 rs, const struct bpf_insn *insn,
+			     struct rv_jit_context *ctx)
 {
+	u8 code = insn->code;
+	s32 imm = insn->imm;
+	s16 off = insn->off;
+
 	switch (imm) {
 	/* dst_reg = load_acquire(src_reg + off16) */
 	case BPF_LOAD_ACQ:
@@ -627,6 +632,12 @@ static int emit_atomic_ld_st(u8 rd, u8 rs, s16 off, s32 imm, u8 code, struct rv_
 			break;
 		}
 		emit_fence_r_rw(ctx);
+
+		/* If our next insn is a redundant zext, return 1 to tell
+		 * build_body() to skip it.
+		 */
+		if (BPF_SIZE(code) != BPF_DW && insn_is_zext(&insn[1]))
+			return 1;
 		break;
 	/* store_release(dst_reg + off16, src_reg) */
 	case BPF_STORE_REL:
@@ -654,10 +665,12 @@ static int emit_atomic_ld_st(u8 rd, u8 rs, s16 off, s32 imm, u8 code, struct rv_
 	return 0;
 }
 
-static int emit_atomic_rmw(u8 rd, u8 rs, s16 off, s32 imm, u8 code,
+static int emit_atomic_rmw(u8 rd, u8 rs, const struct bpf_insn *insn,
 			   struct rv_jit_context *ctx)
 {
-	u8 r0;
+	u8 r0, code = insn->code;
+	s16 off = insn->off;
+	s32 imm = insn->imm;
 	int jmp_offset;
 	bool is64;
 
@@ -2026,9 +2039,9 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 	case BPF_STX | BPF_ATOMIC | BPF_W:
 	case BPF_STX | BPF_ATOMIC | BPF_DW:
 		if (bpf_atomic_is_load_store(insn))
-			ret = emit_atomic_ld_st(rd, rs, off, imm, code, ctx);
+			ret = emit_atomic_ld_st(rd, rs, insn, ctx);
 		else
-			ret = emit_atomic_rmw(rd, rs, off, imm, code, ctx);
+			ret = emit_atomic_rmw(rd, rs, insn, ctx);
 		break;
 
 	case BPF_STX | BPF_PROBE_MEM32 | BPF_B:
diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
index f8cd2f70a7fb..f6ca5cfa6b2f 100644
--- a/arch/riscv/net/bpf_jit_core.c
+++ b/arch/riscv/net/bpf_jit_core.c
@@ -26,9 +26,8 @@ static int build_body(struct rv_jit_context *ctx, bool extra_pass, int *offset)
 		int ret;
 
 		ret = bpf_jit_emit_insn(insn, ctx, extra_pass);
-		/* BPF_LD | BPF_IMM | BPF_DW: skip the next instruction. */
 		if (ret > 0)
-			i++;
+			i++; /* skip the next instruction */
 		if (offset)
 			offset[i] = ctx->ninsns;
 		if (ret < 0)
-- 
2.49.0.901.g37484f566f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
