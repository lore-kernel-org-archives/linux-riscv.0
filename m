Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345C1CD11DF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 22:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mADtb62RCicwVtcL4KfFA3DeCdh3Qyu0LFIJa0uJjdA=; b=qdlradjoUbBo+d
	ANWagC8rDRbeEy0EGBK/LVvCiDzs9qoiSS/SYgCA2pn6eQ/D/j+IppvPwOIkEVTeErGuCPfYMkbrj
	P4g4CJeRxiTfXDumtXOxYFLZYATE78TgwMAtlwAOztryi1X9SInR+whJV/DAcpGNdO1tC5SrSFjXT
	c5wnMLjgzfgp6t/g/Y2wVMM0QtjgX7qh18EXBAmj/O95UDM8wDoAH2XzUW165tvv6jdmyzODB7Ch9
	BYNcJhVsWeDjODCVLP1cgkiStDsObOxn030vcDZCVe6rzWAgr5GJAoTLzLPcCiO5c4NeivVfI4IO7
	pIWVcLOyIxL2wnGJC8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpFcK-00000006lC7-0JHZ;
	Tue, 26 Mar 2024 22:50:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpFcG-00000006l9K-06s4
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 22:50:01 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4149102e40aso4647835e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 15:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711493396; x=1712098196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqH53emhj0ZHk3SA+TnfR4YHUcLP3f6dmGi1LFi0aPE=;
        b=HMrSWmlvvuaajPXfTjdzUsh7hvo12QTc4GsnkknDdTj1r1c02nSUzOOi4uVo7JVZQ1
         Ym8izoyWqfA30r5B+FS2Tg9Y4bSO9Aa5FzrT6EOPZVShLfEOGgUjhgBHbQlxjjtrpB8M
         LX7i4fXXWxnxGR3sxQZ0iTgZBl12SSmKr5MuMg+AI/YZAT2YORfejHnEZCmNgTJ0/LT6
         YbCV3ZL0IMTjYFC5CT4Nvos0+ufmnC9q4hLG1jW8IQb++S+gE2MCnhjdUAZM0pstVXCK
         LZ+suKcEmLsM9eAhNjCXlZwwNJ/nM9cAtAO0x56R0pI3UEoFio29sJyEbGMzn7tYQVj3
         HoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711493396; x=1712098196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqH53emhj0ZHk3SA+TnfR4YHUcLP3f6dmGi1LFi0aPE=;
        b=inA+Q1D1WCaBQahRhmJJx+z40DZR9T810ENruhdG/Q74qFsDw7hkII/lZbM+WaVAWc
         gOOYXs+m2ihk0QJvKK8gLSIqPZc7UIvvQkKq3TunEtQZKaiNUV/aQJnRUxOHO3h2kYes
         0+M9cswEnW5S8kyp0U1m3korDQMj7dZbMrrjg+25jVQtxAkvGSmS/14qctaoXT1A2H9E
         /ixlqPoPdWL0WakCUiW0czu/ywvXbrc4UpDDOPA085SttrsJX7RUFEGWjVO8sdNtra9q
         +Gs4AfFNiQnh+0Br6J1YZMMvGM+HrCmDgURjEAPmdKyJj7YAMUaZ+jrMSh4QlkhhRnF+
         nN0g==
X-Forwarded-Encrypted: i=1; AJvYcCXHNpkwe/E2JAE5y5j2P8SyjrhMNuARmszA1LndO4gV8x3+70zFTfhJC8g8dWAdbr2EQ6bfO/lK+225pPzcE5ugQ+D20zmBEwbo4tH5FTaB
X-Gm-Message-State: AOJu0YyplD7vqMVQo3P2vMym7O4g5sqkLs4+xlhhFX0XML++wpuufT5F
	XrkdCDW0TyDDLJfR99hQ5sKrCmwFKtD9vltLvVod48ust61OEeAn
X-Google-Smtp-Source: AGHT+IGVs4tvD2hr/XRcoPDRw8wLKaUP0mLoeoIke8y8cC3QFM07b30ekxvcDnvYaAxc5yvrD5w/fg==
X-Received: by 2002:a05:600c:1906:b0:414:8065:2d25 with SMTP id j6-20020a05600c190600b0041480652d25mr600522wmq.38.1711493396244;
        Tue, 26 Mar 2024 15:49:56 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id h8-20020adffd48000000b0033e9d9f891csm13227006wrs.58.2024.03.26.15.49.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Mar 2024 15:49:56 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
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
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pu Lehui <pulehui@huaweicloud.com>
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next v3 2/2] bpf,riscv: Implement bpf_addr_space_cast instruction
Date: Tue, 26 Mar 2024 22:49:43 +0000
Message-Id: <20240326224943.86912-3-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326224943.86912-1-puranjay12@gmail.com>
References: <20240326224943.86912-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_155000_129320_EEAFDDD8 
X-CRM114-Status: GOOD (  12.19  )
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

LLVM generates bpf_addr_space_cast instruction while translating
pointers between native (zero) address space and
__attribute__((address_space(N))). The addr_space=0 is reserved as
bpf_arena address space.

rY = addr_space_cast(rX, 0, 1) is processed by the verifier and
converted to normal 32-bit move: wX = wY

rY = addr_space_cast(rX, 1, 0) has to be converted by JIT.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 arch/riscv/net/bpf_jit.h        |  1 +
 arch/riscv/net/bpf_jit_comp64.c | 14 ++++++++++++++
 arch/riscv/net/bpf_jit_core.c   |  1 +
 3 files changed, 16 insertions(+)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 8a47da08dd9c..5fc374ed98ea 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -82,6 +82,7 @@ struct rv_jit_context {
 	unsigned long flags;
 	int stack_size;
 	u64 arena_vm_start;
+	u64 user_vm_start;
 };
 
 /* Convert from ninsns to bytes. */
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 73726f455f6b..77ea306452d4 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1081,6 +1081,15 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 	/* dst = src */
 	case BPF_ALU | BPF_MOV | BPF_X:
 	case BPF_ALU64 | BPF_MOV | BPF_X:
+		if (insn_is_cast_user(insn)) {
+			emit_mv(RV_REG_T1, rs, ctx);
+			emit_zextw(RV_REG_T1, RV_REG_T1, ctx);
+			emit_imm(rd, (ctx->user_vm_start >> 32) << 32, ctx);
+			emit(rv_beq(RV_REG_T1, RV_REG_ZERO, 4), ctx);
+			emit_or(RV_REG_T1, rd, RV_REG_T1, ctx);
+			emit_mv(rd, RV_REG_T1, ctx);
+			break;
+		}
 		if (imm == 1) {
 			/* Special mov32 for zext */
 			emit_zextw(rd, rd, ctx);
@@ -2026,3 +2035,8 @@ bool bpf_jit_supports_ptr_xchg(void)
 {
 	return true;
 }
+
+bool bpf_jit_supports_arena(void)
+{
+	return true;
+}
diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
index 9ab739b9f9a2..8a69d6d81e32 100644
--- a/arch/riscv/net/bpf_jit_core.c
+++ b/arch/riscv/net/bpf_jit_core.c
@@ -81,6 +81,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	}
 
 	ctx->arena_vm_start = bpf_arena_get_kern_vm_start(prog->aux->arena);
+	ctx->user_vm_start = bpf_arena_get_user_vm_start(prog->aux->arena);
 	ctx->prog = prog;
 	ctx->offset = kcalloc(prog->len, sizeof(int), GFP_KERNEL);
 	if (!ctx->offset) {
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
