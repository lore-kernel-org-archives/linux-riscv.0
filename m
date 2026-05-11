Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAD8CD484E
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 22:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3Im4P/RkTcf3R+yEhP9NsC6xpCiDq9VgBFYDL+UsWc=; b=k5GycjeDor87YX
	u+cmxDZhTjp4NwZUCvJNJmqBqARgVgjsu9zgfDZG3E1Kr49pEiKL8sMWYnPXtABwOsyUV+32pt12x
	pII1rKiUz1luKQcjTsHyN5pwH8BxOyxjQ39SsU8JidXbteRwnNGepAGb2kxgm6whB+i8eW6p1nWFe
	SmP4/6WUlCF7nRmd82SAfugMyTkhvTEFYn62eQ+Ja6B6WN6BAa2PlQJDwZHYtGvppWdab4hXAjYXC
	aEFKuJmvnq2a0aivxXHGNJV1NPfox8RIShcB3HeFUIti6hIdk0nUzRtC+RDQ4arpjoirpGnR8Equs
	vUiVHxwRuAYSllzXdH/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMYw5-0000000EtCK-0Zjl;
	Mon, 11 May 2026 22:17:13 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMYw2-0000000EtBa-2e7n
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 22:17:11 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-83945063f70so2605359b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 15:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778537830; x=1779142630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzbHlwFEvu/VdMCQ/9sPrwxhCrnSDlirFVz5WBJAiSo=;
        b=KJe5YaVcoDdcn2V8ObFYUqG8gwFfSWK6655JWJlApqJKWtapovbdAQSiE4t6rxYgRi
         wYGATBHF5S2YxkJajOY3RAPLuIjyZQvgAsJ18mpYVKE2bnyPjMxRaoyjTAseMo4nd6s4
         QIdrOeJt8uPZMedjKHjTU9edWxHz08XAjJGQDFfzryWtNF7MzChAuyjm07vleV6zrgNG
         pGHnI4VmpgDchP1gwvFDTdA2EMeihPsp0pVTZ3FwgTv7gCQh9XQqz9wvNJ6HVXWEz+tC
         NBWUks5DRXudXWQv0dXuHpcAP/qxvqHderU4A9OMlNWzgPlA6rKoXPbP8d+POpRYYxnt
         824w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778537830; x=1779142630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nzbHlwFEvu/VdMCQ/9sPrwxhCrnSDlirFVz5WBJAiSo=;
        b=QrHDSFAbs+bAVylme0mdYjEVaQD19UK7rZdB3ZWFtsoL5fEAyUCjN1aagOHWzoiwMM
         RDG7UYpESdrnJjrGHfbTuuapCP5IuMtAtUEkUmbY88/32U90abPzenND9TLJGawsLoDs
         ZucUttQgvqMWjCHiuplT9JYgfByZNylgBzeigCtgIlYZS5A1kSp6CHmvl2hu1S9yHDwx
         r/ecK5NCaTZyTHeJVxdrl1hkPt8USSrhjFIgu+mUZ3joTpselTrgeT4SodbUUAEelcbn
         9EAKp29USyRuqV41xUv1Q2iNBXYzE1DDYuq4v5bfuL+nQw4zmSJkvZnCtLCV0CzzTFXo
         NZgA==
X-Forwarded-Encrypted: i=1; AFNElJ8cAMaPkKbtTRFfEsHQauBokB8oJmodXCtzRzKBlSnNSBnROSk6P3xI0sYVEvgVGUQ3kXpct155nSXkqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFTNXFCABn/IXbJvkJOXP5+Fa6/MJmY7tttUqhCvFpEk5N7c91
	vg0J9l/Q8vX8ZRbQMhyKyR4VD2SrFLoU06rpiQO93Q16p7iJ61c7RmfP
X-Gm-Gg: Acq92OE2p5NoYKdaKZOupKB/eS/BbtrPYglPIHskqG0KzPLyB0N3+0n/CWdBvZ6Lmlq
	7ezjBEA4ivrwHnhUo0pnQmga9J5bv1N+1fWrM0uzBJ3KPgqH2DSsISjebo2gfmL5PXix1QVhhC5
	qG/VqZ43cuaBDmZ/SRbeR/Zp3jxq2YstIOJ77pW3arm7aVbhxp9778zj4zVuZ0lNXQU53eqT1Xd
	GQyg+mJJKUiEnIKGXY7Rfq0suvS/qwMD9xv6IQnR2/sUQ6lCxl0R3RUqi+svopJazCt4l8Zp145
	xd/gzZnemvNjk0MD/uRvEBnlzG5ByIPCxtmypQKaFvVFbydJpPTvA4vSoLRaJpMt6iCxMgybJ8x
	VHkinHyU9kP4aSCQAc22uTAlO4aMfJe6+HlYPNSORSJI+Jl8hT2jrNSEJqfvDXMc/pmtE33sPdC
	wBjfvjajRLKhP+eQDxUceUa6HTWjwi2xqadZrP5xtPr4CmNGiAXmUJu+IL1FOQf2jPHXRZb2j6T
	nLrLeU/SA1avLjb1wfXkpgi9EIjfxe8kw==
X-Received: by 2002:a05:6a00:f0b:b0:82f:456c:29f1 with SMTP id d2e1a72fcca58-83ee83251bemr1014107b3a.12.1778537829642;
        Mon, 11 May 2026 15:17:09 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (32.237.80.34.bc.googleusercontent.com. [34.80.237.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm21943329b3a.19.2026.05.11.15.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:17:09 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	luke.r.nels@gmail.com,
	xi.wang@gmail.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	alex@ghiti.fr,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	marscheng@google.com,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH bpf-next v2 1/3] riscv, bpf: Fix support for BPF_SDIV and BPF_SMOD in RV32 JIT
Date: Mon, 11 May 2026 22:16:46 +0000
Message-ID: <20260511221648.3251464-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260511221648.3251464-1-visitorckw@gmail.com>
References: <20260511221648.3251464-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_151710_680295_DA7BB526 
X-CRM114-Status: GOOD (  11.37  )
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

The current rv32 bpf jit compiler incorrectly treats BPF_SDIV and
BPF_SMOD as unsigned operations. The BPF instruction set allows
signed division and modulo by reusing the BPF_DIV and BPF_MOD opcodes
with the instruction offset set to 1.

Update the emit_alu_r32() function to accept an 'is_sdiv' variable and
emit the correct div and rem instructions when the offset is 1.

Before this patch:
[   44.161771] test_bpf: #165 ALU_SDIV_X: -6 / 2 = -3 jited:1 ret 2147483645 != -3 (0x7ffffffd != 0xfffffffd)FAIL (1 times)
[   44.167385] test_bpf: #166 ALU_SDIV_K: -6 / 2 = -3 jited:1 ret 2147483645 != -3 (0x7ffffffd != 0xfffffffd)FAIL (1 times)
[   44.171053] test_bpf: #169 ALU_SMOD_X: -7 % 2 = -1 jited:1 ret 1 != -1 (0x1 != 0xffffffff)FAIL (1 times)
[   44.172081] test_bpf: #170 ALU_SMOD_K: -7 % 2 = -1 jited:1 ret 1 != -1 (0x1 != 0xffffffff)FAIL (1 times)

After this patch:
[   16.002192] test_bpf: #165 ALU_SDIV_X: -6 / 2 = -3 jited:1 95 PASS
[   16.002983] test_bpf: #166 ALU_SDIV_K: -6 / 2 = -3 jited:1 1059 PASS
[   16.017167] test_bpf: #169 ALU_SMOD_X: -7 % 2 = -1 jited:1 136 PASS
[   16.023002] test_bpf: #170 ALU_SMOD_K: -7 % 2 = -1 jited:1 109 PASS

Fixes: ec0e2da95f72 ("bpf: Support new signed div/mod instructions.")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/riscv/net/bpf_jit_comp32.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
index 592dd86fbf81..7396899ea276 100644
--- a/arch/riscv/net/bpf_jit_comp32.c
+++ b/arch/riscv/net/bpf_jit_comp32.c
@@ -509,7 +509,7 @@ static void emit_alu_r64(const s8 *dst, const s8 *src,
 }
 
 static void emit_alu_r32(const s8 *dst, const s8 *src,
-			 struct rv_jit_context *ctx, const u8 op)
+			 struct rv_jit_context *ctx, const u8 op, bool is_sdiv)
 {
 	const s8 *tmp1 = bpf2rv32[TMP_REG_1];
 	const s8 *tmp2 = bpf2rv32[TMP_REG_2];
@@ -539,10 +539,16 @@ static void emit_alu_r32(const s8 *dst, const s8 *src,
 		emit(rv_mul(lo(rd), lo(rd), lo(rs)), ctx);
 		break;
 	case BPF_DIV:
-		emit(rv_divu(lo(rd), lo(rd), lo(rs)), ctx);
+		if (is_sdiv)
+			emit(rv_div(lo(rd), lo(rd), lo(rs)), ctx);
+		else
+			emit(rv_divu(lo(rd), lo(rd), lo(rs)), ctx);
 		break;
 	case BPF_MOD:
-		emit(rv_remu(lo(rd), lo(rd), lo(rs)), ctx);
+		if (is_sdiv)
+			emit(rv_rem(lo(rd), lo(rd), lo(rs)), ctx);
+		else
+			emit(rv_remu(lo(rd), lo(rd), lo(rs)), ctx);
 		break;
 	case BPF_LSH:
 		emit(rv_sll(lo(rd), lo(rd), lo(rs)), ctx);
@@ -959,6 +965,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 	u8 code = insn->code;
 	s16 off = insn->off;
 	s32 imm = insn->imm;
+	bool is_sdiv = false;
 
 	const s8 *dst = bpf2rv32[insn->dst_reg];
 	const s8 *src = bpf2rv32[insn->src_reg];
@@ -1041,7 +1048,9 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			emit_imm32(tmp2, imm, ctx);
 			src = tmp2;
 		}
-		emit_alu_r32(dst, src, ctx, BPF_OP(code));
+		if ((BPF_OP(code) == BPF_DIV || BPF_OP(code) == BPF_MOD) && insn->off == 1)
+			is_sdiv = true;
+		emit_alu_r32(dst, src, ctx, BPF_OP(code), is_sdiv);
 		break;
 
 	case BPF_ALU | BPF_MOV | BPF_K:
@@ -1065,7 +1074,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 		 * src is ignored---choose tmp2 as a dummy register since it
 		 * is not on the stack.
 		 */
-		emit_alu_r32(dst, tmp2, ctx, BPF_OP(code));
+		emit_alu_r32(dst, tmp2, ctx, BPF_OP(code), false);
 		break;
 
 	case BPF_ALU | BPF_END | BPF_FROM_LE:
-- 
2.54.0.563.g4f69b47b94-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
