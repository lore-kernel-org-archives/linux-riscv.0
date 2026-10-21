Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B081606A337
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 17:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xEOOt36k;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C0bGTWld
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91A8Jdge1W4dTFBDAqTw8jNS9hJlSDstcQDVxIc+X6M=; b=xEOOt36kKy5zXQ
	Uc+gdhXnVWtm38hpYdv4E7xzBEnK6tZmBSwPCH04OKKo/wRTYKUtR8vXzbw72w2Q6SDoYTcqM2YU4
	e3GFax1VtI/Nd6gQbca3zBEeyp6/6ChVkVLxgOORW2vGUtcan27Jy7p/vxKcZsOpQ6T00uvkq8ESy
	wI/sOrFtBzz9ZUU1B3XonABidUqAz0u8kZunsdnGpvlBwgab9xsrVhTiToNgYMt/9M6Q8uYPsJ2Qj
	S1dmxZGfSC8MYbQo6Xac7jOkul1wN2kdxxgzCW0gPIZ0aC0LxRw7q2Q8yP51UHl1KYqE/99NIT2Nh
	8STViBYB+sz0loxyhhpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZqu-0000000CWc6-3gDT;
	Wed, 21 Oct 2026 17:11:48 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZqr-0000000CWb7-40o5
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 17:11:47 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2e8b20a899fso5634275ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 10:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792602704; x=1793207504; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kWSErL8M0Zrcc9bNez1sKQXL8Q35fI7UYN2RBWREyKs=;
        b=C0bGTWldHt+fTW86W6b0JQlmAEvRqMCFOu4IJoe1orE5RH+n+ptUmDRlLe+10Jnixk
         XpfqhEstDAuhwixn+twa8+yKt4H3NGvOzqMEfxU8GAL/ZN6g7Yad7HNb0e8oW9Q626oq
         nodDm+imvTVL4qwFMpsHb1JVv3pwEjdATET/i5B5TwbVeefi1S2NmyflNtF/HA8unAD8
         NIOTREE0sD7MNk8oXTIJMwS7oCdOtAEViN0lIhWJgJI7PfMCrI5TiZfNSpO64Srshs7p
         MwGQjAk4y2jwO8yPcBq4lHVfRfqFYZkbIe2VhPuvGgx+PEq/ZjTOwKmEkKginKP59WvC
         26eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602704; x=1793207504;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWSErL8M0Zrcc9bNez1sKQXL8Q35fI7UYN2RBWREyKs=;
        b=CYWlkNxxmAQ0bTiMOezef9PQbW0qnL3EEU6yaKUjbU3x9ZUJ5GjWxLYgxbyLhh8gKH
         u3yePGWNAUOzCfnonymvfIXVT/wUzDFmj81ZaY2vP9AG6wPilkW6EsqEG7cFUXwj2cBn
         D+YG/1RfutLsAGwNp9+v8sTwblKwcP1dMRPOp/TNo2Hjmwe1qGsZ6jU4TjQe6Sb7KckZ
         crNnmNnQdwmyzB9rsX5ui18Tzxp/oLiLSj2Xr+QbY6ynjQPoLLNEGB2maf84WS0iRdN3
         dnQbd4ctt6mM73aSUYgEqD+F612eokcFVrjMWkA0/ybT32OyrXykIy/0sD5qyNpCryMJ
         5Khw==
X-Forwarded-Encrypted: i=1; AKwUvBxaH44XW3zfwtl9hvCrQ3ZApuEB6PmCVtkccUgflVUODQoTNTqBFZ6/E4+vPbLdbF5Si/XlH17PYAludA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIXQimVKyqlLswQvPAXtyBt6CRG39MloiIal6tSCTSAxlasEFRH
	otDCqxLTpmvBmBqPAM9EqU+CNMBRb2DaBFe5lUUEmqytRPM8bid1HOWq
X-Gm-Gg: AYBFou14wFs8ioCX9uzW0vhRF4Rr+eLkAqevvGFMt99P31wE/BLJ7j0x4O3q8nFz79x
	kGJTMB3s0SZz7u6hRz14/cijCb5ZlRvRZinx3up7yhFlsrkGx8nL/yw4jSI9K+LDJ9xvNdMlMZU
	UucB3KOH3U50IwSIHT9G76eotIaXG/MZlvBqCzshxNnZB90yvc15DDfXz6fXoREjiMZJ3kgRUE1
	SYSEGDGshg9SDF0axuJP7H3KAPmIl7XafuMKmhCxBWeDE5rMY30VN9rEFHaNPhLp3MoR+9+Mzr6
	hyOLJ9VAKZk35+kRflDXmmZn1I3G2oifuRfQSBA3R0XZz/UaPqlGIzb4bI8NYOXArtfI2esPcnm
	ibdWKV9Kvs0fvVKLU7As8L3HlYc95MayKH9hHgTafPZh+3ogUS/lVMD+iErcuQUmL0jnMi/tssK
	p2KLURfPfgdjKukY96ijyLMHlsUl9VM5Rrq3Nkdqt0CIrHqG4atVRnaVNNJFilgASO5S/pZlhOv
	akKQkC0tfclWlHUYM3LZDj5OscsTj8Yr6+GvkQGj73/9mkpWLYokY42QvP2OlHpcrVr2Lu0ELzD
	Vl8Pee6zEZrKWe38gyQ6qiwwyFxahbmuEmeXtlMwzUQfBrQ2AgD5kigzMrKlYQ==
X-Received: by 2002:a17:902:fd8f:b0:2e3:1776:278f with SMTP id d9443c01a7336-2ea43f52371mr22587935ad.42.1792602704368;
        Wed, 21 Oct 2026 10:11:44 -0700 (PDT)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b43478csm14601635ad.28.2026.10.21.10.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 10:11:43 -0700 (PDT)
Date: Wed, 21 Oct 2026 17:11:42 +0000
Message-Id: <DMAOMH0CLDLX.127F7BRYUOQEG@gmail.com>
Cc: "John Fastabend" <john.fastabend@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Quentin Monnet" <qmo@kernel.org>, "Puranjay
 Mohan" <puranjay@kernel.org>, "Xu Kuohai" <xukuohai@huaweicloud.com>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, "Pu Lehui"
 <pulehui@huawei.com>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 "Shahab Vahedi" <list+bpf@vahedi.org>, "Russell King"
 <linux@armlinux.org.uk>, "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Hengqi
 Chen" <hengqi.chen@gmail.com>, "Johan Almbladh"
 <johan.almbladh@anyfinetworks.com>, "Paul Burton" <paulburton@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Helge
 Deller" <deller@gmx.de>, "Hari Bathini" <hbathini@linux.ibm.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Naveen N Rao"
 <naveen@kernel.org>, "Luke Nelson" <luke.r.nels@gmail.com>, "Xi Wang"
 <xi.wang@gmail.com>, "Ilya Leoshkevich" <iii@linux.ibm.com>, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "David
 S. Miller" <davem@davemloft.net>, "Wang YanQing" <udknight@gmail.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 <linux-doc@vger.kernel.org>, "Tianci Cao" <ziye@zju.edu.cn>, "Yazhou Tang"
 <tangyazhou518@outlook.com>, "Shenghao Yuan" <shenghaoyuan0928@163.com>
Subject: Re: [PATCH bpf-next v2 1/8] bpf: Add UHMUL and SHMUL instructions
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <tangyazhou@zju.edu.cn>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "David Vernet" <void@manifault.com>, <bpf@ietf.org>
In-Reply-To: <20261021-bpf-hmul-v2-1-88e260099f7d@outlook.com>
References: <20261021-bpf-hmul-v2-0-88e260099f7d@outlook.com> <20261021-bpf-hmul-v2-1-88e260099f7d@outlook.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_101145_995207_F6179043 
X-CRM114-Status: GOOD (  16.17  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 10:40 PM tangyazhou@zju.edu.cn <tangyazhou@zju.edu.cn> wrote:

> +static inline bool bpf_insn_is_hmul(const struct bpf_insn *insn)
> +{
> +	return BPF_CLASS(insn->code) == BPF_ALU64 &&
> +	       BPF_OP(insn->code) == BPF_MUL &&
> +	       bpf_is_hmul_variant(insn->off);
> +}

Patch 5 adds this check to 13 JITs and nfp to opt them out.
Lets make JITs opt in instead, like bpf_jit_supports_callx().
The verifier checks it once. x86, arm64 and riscv patches add
bpf_jit_supports_hmul() that returns true. bpf_prog_is_offloaded()
covers nfp.
When JIT is on and it doesn't support them the prog is rejected with
a message in the log instead of silent fallback to the interpreter.
Then patch 5 goes away and only arm64 and riscv acks are needed.

Like:

diff --git a/include/linux/filter.h b/include/linux/filter.h
index e0218e6..6ee8d1a 100644
--- a/include/linux/filter.h
+++ b/include/linux/filter.h
@@ -152,6 +152,13 @@ struct ctl_table_header;
 #define BPF_ALU32_IMM(OP, DST, IMM)				\
 	BPF_ALU32_IMM_OFF(OP, DST, IMM, 0)

+static inline bool bpf_insn_is_hmul(const struct bpf_insn *insn)
+{
+	return BPF_CLASS(insn->code) == BPF_ALU64 &&
+	       BPF_OP(insn->code) == BPF_MUL &&
+	       (insn->off == BPF_UHMUL || insn->off == BPF_SHMUL);
+}
+
 /* Endianess conversion, cpu_to_{l,b}e(), {l,b}e_to_cpu() */

 #define BPF_ENDIAN(TYPE, DST, LEN)				\
@@ -1281,6 +1288,7 @@ bool bpf_jit_supports_kfunc_call(void);
 bool bpf_jit_supports_callx(void);
 bool bpf_jit_supports_kfunc_ret_reg_pair(void);
 bool bpf_jit_supports_unwind(void);
+bool bpf_jit_supports_hmul(void);
 bool bpf_jit_supports_stack_args(void);
 bool bpf_jit_supports_arena_args(void);
 bool bpf_jit_supports_far_kfunc_call(void);
diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index f29b0aa..90c30e5 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -34,6 +34,12 @@
 #define BPF_FROM_LE	BPF_TO_LE
 #define BPF_FROM_BE	BPF_TO_BE

+/* BPF_MUL off values for high-half multiplication; BPF_ALU64 only. */
+enum bpf_mul_variant {
+	BPF_UHMUL = 1,
+	BPF_SHMUL = 2,
+};
+
 /* jmp encodings */
 #define BPF_JNE		0x50	/* jump != */
 #define BPF_JLT		0xa0	/* LT is unsigned, '<' */
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 3030beb..e17704a 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -3405,6 +3405,12 @@ bool __weak bpf_jit_supports_unwind(void)
 	return false;
 }

+/* uhmul and shmul */
+bool __weak bpf_jit_supports_hmul(void)
+{
+	return false;
+}
+
 /*
  * How this arch places a by-value kfunc argument, or NULL for one that has
  * not opted in and so only takes an argument of a single eightbyte, which
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 5601d20..9a3c97d 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -21194,6 +21194,17 @@ static int fd_array_get_map_idx(struct bpf_verifier_env *env, u32 idx)
 	return -EPROTO;
 }

+/* The interpreter supports uhmul and shmul. JITs opt in. */
+static int check_hmul_jit(struct bpf_verifier_env *env)
+{
+	if (bpf_prog_is_offloaded(env->prog->aux) ||
+	    (env->prog->jit_requested && !bpf_jit_supports_hmul())) {
+		verbose(env, "JIT doesn't support uhmul and shmul\n");
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
 static int check_alu_fields(struct bpf_verifier_env *env, struct bpf_insn *insn)
 {
 	u8 class = BPF_CLASS(insn->code);
@@ -21249,6 +21260,13 @@ static int check_alu_fields(struct bpf_verifier_env *env, struct bpf_insn *insn)
 	case BPF_MUL:
 	case BPF_DIV:
 	case BPF_MOD:
+		if (bpf_insn_is_hmul(insn)) {
+			if (BPF_SRC(insn->code) == BPF_X ? insn->imm : insn->src_reg) {
+				verbose(env, "BPF_ALU uses reserved fields\n");
+				return -EINVAL;
+			}
+			return check_hmul_jit(env);
+		}
 		if (BPF_SRC(insn->code) == BPF_X) {
 			if (insn->imm != 0 || (insn->off != 0 && insn->off != 1) ||
 			    (insn->off == 1 && opcode != BPF_MOD && opcode != BPF_DIV)) {

pw-bot: cr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
