Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4D3C54E58
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 15:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/K3NqeniM5yrYfhhfgS9XyudpKCyIym0519MhGDdtxs=; b=eiZakE9uSjmwMe
	d8P2FrGXGdIYRxUXzdeptF9xu5y2ii5kLNWfK3r3DOmrXsoJtdEBo18ta3aa3FFANWtqdyOGC179e
	XQoVTDsryiMHNQxwCe0b4Ls0RXQ6g5jWpYUl7pxLGkYuzaDuaUl4DsymvK8mhi2Idz4giof6UXBGM
	jJkJCTPXkHddLTIshHVctIX6LqDkejXvYYIyL/WFmroPfVxhmltnBiQX4iqZfhZ+x0o9iQHDaB80Z
	eImRiTNdcWyctcOvE5OViVIOry+kVEwVy7B+SEQP5Hnd9IoYNeqPVYn5zSsQ4A6j/9Tq+F6tgJ34J
	bE99fWsBK5nq+tc+LQng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro3ai-0000000AfBg-27aa;
	Sat, 23 Mar 2024 15:47:28 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro3ae-0000000AfA3-3QT2
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 15:47:26 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2d220e39907so44100821fa.1
        for <linux-riscv@lists.infradead.org>; Sat, 23 Mar 2024 08:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711208840; x=1711813640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ay+jcBPkjGLbrzuCqBdp1fIpXDsG9gp+1V2JFol5/jQ=;
        b=bnAb9cifJOl6QumO+jdHnHgLrFO+3Hob9m2i+86789iX0qgzBTn+1ta3FXOrXd75jw
         zqrikOxJwZrQwMDW3lSkmJ0lRUIq/k3OMfR5leOZB04vsFfYVr4gbkKVgtJdVc1KhNfg
         odpQ54BzGbbBsIpDxbK+k0ovSRGA4z11OEVPrJWyiKXVrdRKl4BG/nurOk7WN54KQti7
         ov2N4g2jdY3Q1uwS7HT/EpBHFIGTb2BajwHSoVZPsN+OeTFKtIA6aks0l1yCVCH5FcIn
         61jZvhFWZGFcEPIdWVUfCVcIgJroG8vBifj8JPgbA0FsUaAMzCWv6yW/PzFrKmryrOpu
         kNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711208840; x=1711813640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ay+jcBPkjGLbrzuCqBdp1fIpXDsG9gp+1V2JFol5/jQ=;
        b=SQiDOucbhPl1acgv8vX1HDAEo7QOuXk+1EXS/9Kr8PomESPizx7wVCRSBBKrZGjUtj
         DX/1ATg9f9I9TBWKX/NesLGAYIv2p8twVW8selfPK4pCIh/wTxzEx0opd/CspUVZnf0w
         rWI/jip1Zi6NLY9UjVsHtXijjZSZ5YsgK3/ydW+1exmS7g93f61eQwhqYBK9Dj5q8P6x
         1lKO9Szg2s1UqWWzzZ1DXJyY9MTL7ZPD69zPHF1wcr1MJSrYB6eOLqSGUQOTAXyBp2Lb
         nObdZ6JDh7AgY8C/hwZWaV0kPfj8ouXg+9ptX7VAE6q1uAOziw4nyJsuD9wKHxyeagnN
         JmrA==
X-Forwarded-Encrypted: i=1; AJvYcCXQLDaKsBTcN+6yUCwiLhyTW3jwzog705dLlcj5wdvC6ZouyCJjYHXcuXzr2pIVJdNNSm996CoDjybF/6CiaFte6/HBQLllb64xzZkemtDw
X-Gm-Message-State: AOJu0YwhjZcFkwHUFYYHfuP8jFa4O6LZIaDhTSB4z2XEdzahGT8hDXtB
	6PaeXZckDJ8T9M/2PhG44d1pM57JXJbBXjnhQEkfNTnjO7eUpBoz
X-Google-Smtp-Source: AGHT+IFkp577tDhpMqE6g4lzfPBqHjO/0IXLmRGAIlqrGpT/rmtEg6S9Fthz6rn6wJ37q+lXPaTRrQ==
X-Received: by 2002:a2e:9b8a:0:b0:2d4:9f78:4f62 with SMTP id z10-20020a2e9b8a000000b002d49f784f62mr1644660lji.0.1711208840003;
        Sat, 23 Mar 2024 08:47:20 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c339300b00414041032casm765572wmp.1.2024.03.23.08.47.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 Mar 2024 08:47:19 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next 2/2] bpf,riscv: Implement bpf_addr_space_cast instruction
Date: Sat, 23 Mar 2024 15:46:52 +0000
Message-Id: <20240323154652.54572-3-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240323154652.54572-1-puranjay12@gmail.com>
References: <20240323154652.54572-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_084724_881878_9068953C 
X-CRM114-Status: GOOD (  12.83  )
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

rY = addr_space_cast(rX, 1, 0) has to be converted by JIT:

Here I explain using symbolic language what the JIT is supposed to do:
We have:
	src = [src_upper32][src_lower32] // 64 bit src kernel pointer
	uvm = [uvm_upper32][uvm_lower32] // 64 bit user_vm_start

The JIT has to make the dst reg like following
	dst = [uvm_upper32][src_lower32] // if src_lower32 != 0
	dst = [00000000000][00000000000] // if src_lower32 == 0

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 arch/riscv/net/bpf_jit.h        |  1 +
 arch/riscv/net/bpf_jit_comp64.c | 15 +++++++++++++++
 arch/riscv/net/bpf_jit_core.c   |  1 +
 3 files changed, 17 insertions(+)

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
index f51b832eafb6..3c389e75cb96 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1083,6 +1083,16 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 	/* dst = src */
 	case BPF_ALU | BPF_MOV | BPF_X:
 	case BPF_ALU64 | BPF_MOV | BPF_X:
+		if (BPF_CLASS(insn->code) == BPF_ALU64 && insn->off == BPF_ADDR_SPACE_CAST &&
+		    insn->imm == 1U << 16) {
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
@@ -2010,3 +2020,8 @@ bool bpf_jit_supports_ptr_xchg(void)
 {
 	return true;
 }
+
+bool bpf_jit_supports_arena(void)
+{
+	return true;
+}
diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
index 9b6696b1290a..aaef1d0c7c46 100644
--- a/arch/riscv/net/bpf_jit_core.c
+++ b/arch/riscv/net/bpf_jit_core.c
@@ -82,6 +82,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
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
