Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B527C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 15:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPbHp73Q2xSKMECpX+6/k+q1Mt+6ofpkb5l5nsPo0Bc=; b=mDUOy2TsrtuUgh
	sDeM+tbb5JuJ4JMQv7Wy7w3bByPZqzxTzKQ/VjqrNYMCQDYc6DGfNGAmR3h0y8nR3x5BqdfNe7IZN
	Y4u2VR1Shf0quHw1X8hcT/A7HZC8WEbYGLvst1cksGTm2XDp/H/SBGUdYS+hTTLNu+I1Uirg8U5SW
	gXGdIDkf37D2EV5mZqz7R+MNte5g98TNWw4/jFVAE2dgalzsZIJsBBNbNVguu1vL2Vns+YNwpP0l9
	6ngI9pxs9Kkpzv1J0AWvXIEYb908jLKBeZxn32d71ff6t3HmDwuu0ph4RFfs0Hu85GhZa2i7EVKz9
	KHDtgLS3zZKKF8wi8Nfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1romex-00000000c8s-2Pkg;
	Mon, 25 Mar 2024 15:54:51 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1romeu-00000000c6s-2L3g
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 15:54:50 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2d29aad15a5so57427101fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2024 08:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711382086; x=1711986886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmdLkk4cUe3qGPre+9kRw6NuC0B6UnfZpAvLyG4RAn0=;
        b=ToiZk9HtdNoJHDOkuvGKvS36lN7l2kn2FjLvzth3wKqEBunColW/g5v/hulmpj2vU1
         otuBDQFtCtejVZOxqj9hQnZYEIH7mnih4Up/v+d74yOPyNVo6pORWqlqH48HlOkMbM5L
         vMgGUruy65WXMFvnd4VT5ysihjxCNJ6yqTxHl5Pv4QvFYls4Tnsp1KX+j9wLuCXmrHWI
         RAcFitqa98B5zmHtGCr+jE0ZEUpPh2DeQUw5us9d2+y4PXpXxip0yySZop6VA1iE418N
         AEQCu05acqgDKxBNmM1XNjGHU5Bo58pG5MS4Gyl64bM56GQ/IJAs5v+EWmiDSsVZXmpq
         uF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711382086; x=1711986886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmdLkk4cUe3qGPre+9kRw6NuC0B6UnfZpAvLyG4RAn0=;
        b=wg+Q1drJNXS2OSbuxD+GWkjrghzEQIvGKoPVYgjqK2GkTg+X2AtxPdTkgJZbq7JPFY
         0/5SZZY1n8qFjPzHapW4gnNZn+EC5zbppBsIS38x3Bs1ovSn3i2H4IhPVGpzS1DOUZJR
         g4jD6RUuhuQ33+/XxWrJvpzH2gHhE6AOL8ipiU838JSdAKbgSX0TaV2sfP+FSKMREzDn
         /r8g8R06BLf1D7O0JAcacr1ypdlMIm4GUnxwf7BXfy8dr2vGNRr5/H1MFnlyNsJ9UURi
         F2u7PO8R2z/O2n8c+oeOrE9NCNV0OhcLbrTjjFz7yxwzBACkcL42jP7ht5MVInzZBl5p
         HaJw==
X-Forwarded-Encrypted: i=1; AJvYcCXNU3tWC895jrdJS6RBMhDb59l4Zizxm3xJspK6K6FL2CzwdlEQ8PqA3ye3k4CEYemEDMOxFisRAAG0G4Rusl8wLa5mw/4LAIKDUnNUE8E7
X-Gm-Message-State: AOJu0Yxt1qAe8CZaxOX29mhlQY73/Qb6LzD7EsXth4GykX5JG66n1rc6
	YvlG6fehsk44Yx114L8jE+TM/+rVFQi5UycJp432s06rN6ybWgoY
X-Google-Smtp-Source: AGHT+IHqS/JWJGZaEB94ZvnBoK5Y0Df1gZZMiFmtgQ0mmI45U2iG7SDsch649N+Rl+c6Wu3LehSo6A==
X-Received: by 2002:a2e:8014:0:b0:2d6:a699:4bae with SMTP id j20-20020a2e8014000000b002d6a6994baemr4873921ljg.6.1711382085892;
        Mon, 25 Mar 2024 08:54:45 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id iv16-20020a05600c549000b0041409cabb39sm8734384wmb.18.2024.03.25.08.54.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Mar 2024 08:54:45 -0700 (PDT)
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
Subject: [PATCH bpf-next v2 2/2] bpf,riscv: Implement bpf_addr_space_cast instruction
Date: Mon, 25 Mar 2024 15:54:34 +0000
Message-Id: <20240325155434.65589-3-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325155434.65589-1-puranjay12@gmail.com>
References: <20240325155434.65589-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_085448_776555_95BC491F 
X-CRM114-Status: GOOD (  12.48  )
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
index 0c0588e327af..a5f049e72da2 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1083,6 +1083,15 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
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
