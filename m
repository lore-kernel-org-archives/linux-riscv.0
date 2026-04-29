Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFB7FF8875
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 12:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZvqW5FG0d7RDdVVDfP85IGR1OtDDNQrt7oSIGP+tsA=; b=RmLwF4g9Wyeath
	IS7Sk5ubdb+RFBrfjxOKo1ZnYposwNOHIAcB2gd37dMHh286cmoKELRYuRIdFd3cSueRlJayXfuy7
	/kfqcN5Jo0UlQX6OY0mcpTnwXDZs8bBa3V1WTGEsqmvRomAvjIqK1sBi1ajUVEkf4lXEGa3zKvZP+
	IiPbrvTNs5MSJK3TXixuBOjz8Wt7QIvbyJVWHb0qburHmH9CKBfrMOAQbd5cxo9DnuOMpBrhRz1I1
	goCqfjVQU1vIc2yCLmuXlCefOEptnFaTt2vEGVCbTSNI/190DLZJop5NXtq7Vfx7Ygfm4g7fby4+e
	q43f5bPIEIiwrrt2c52w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI48f-00000003ZsB-1Ki5;
	Wed, 29 Apr 2026 12:35:37 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI48d-00000003ZrZ-1H2y
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 12:35:36 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso11075964a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Apr 2026 05:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777466134; x=1778070934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxdKbXflghhv0mGi1QDRLpuzGnjGR2JliNl5UkqK1ag=;
        b=D8UQnLXeXszlTgSL17/465jRcuDjYDFslKwp2BH4S4tGFhTbZd7fGwoa64parwgs5W
         +F0aF+qtgHEKKBXxq6dwCPCpJLOobUe+fOZ03mZaI0UFDb2nLOhkdSTqXBrvx2RK8b2Z
         RJPWoOM1RAxQD+f2T4FHPCiOh8CBgtRzU88oDmEeSRSddYimYrg0yXdzdcDconUvp/en
         UWs/0QkYRo1NK7pqV2R4Fyr26yIr1OPzRyKtuqHVdWWHbZVQxTYSE1OahKJtoY3Fcj5m
         oPR4ba7tmZs84wPK82QNNAMhSkJGzB/MrNOq4tzkOecNxEBkxl+kvjtsPakLocJ47mJC
         m4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777466134; x=1778070934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mxdKbXflghhv0mGi1QDRLpuzGnjGR2JliNl5UkqK1ag=;
        b=OpEKHnzhSFHjFg4rIhA6nfRVqwE7jThJJOw00rftJ4b1ah2Yjtm72VlyaqlkUSrnpo
         wHiIZQd0mesja/cMG7euc8wDMv2bvKVTjzRvS4sXgzPw+DoQV5vGJhb6WV5JQFzGfft6
         Dm35ccGJaFbH3/6W8o+oIYORwWpM+wloeDDkbJt9wpvRi6f9II07535/tIQUhWaA4US+
         6COf/8cOWWmtbCkbrVyr0vx2RGJ+qazFiUn2TV5gFfjQ2tLslmHa0XRVAqknfvenxsbs
         kCls5EVg3tfmnY1ka1Mr9TiXP3CfUR355ijmyZ56Q2G7KM/vmhBFhJ+QXYd4X9RINwCL
         fxEw==
X-Forwarded-Encrypted: i=1; AFNElJ/Hj//ItgRtdFUsSZ9L70hx3g3MZ+O08SiyIJl8uxwYQVLSc3BciHptxkrIKCeYKfFSl1serzgth6vd3g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6nUBM9YqQDpMBxun2TZBLLVRdafxk/qoYKYOkri39wZhqeMtH
	0DrWQtWU8JuGlWczEmWQAXnPTsdrfN3A7NQKT4MAsrrkfnmqAJK0RNbL
X-Gm-Gg: AeBDietOlCCxovEKh/yI45z1x2jwC9CLOASSispV2HfYDcIs/pEYFOwDFEmX33Azhzo
	j5eK2RIJSwtY97xc2IZv9CuHSaufI9p9txCeYGvWgjEMosunSZqGIyvCU5mwr/eH9AKtk50Ek2W
	TyVhtm0LQ9K5cUQaE9cH+IEndnCtvt9/M/BTq++Yp2lnyCqgEFnDdBtiIo0+3nt7z0+2GdzRoxA
	uaRHxYzGvAU3b/Ifjc3H+f1BJN+0tlJT83ezj4q18KfG1txPaLoD2wuUrh39Y78FvndHzFu/iki
	dNq1O2a6NJdTgLW8aa1W8Ndw2tRI41nibUl7oh0VhDS5aJkfhChDgXe9oakdrh4XUrVnnuLjUX2
	+4yt8eYXWpJegMMq7Tb37NXruSdbR9CooWjaM1B8xRJG7hx3sTg6qUVt5I9C1cvCF/90uNps4rS
	vN3U6FlAnY/dsBPZIX3u5L0cftgyCXbiOp9Tr07wc+fkIjXjqcrfiUJbns1sId51pdXI2QQRMNt
	kQIaikoj2NlDabL/4L15H/1SJUw2WrFTMnR7zEbo+Ql
X-Received: by 2002:a17:90b:3b8a:b0:35d:9da0:4947 with SMTP id 98e67ed59e1d1-36492019132mr7805627a91.11.1777466134253;
        Wed, 29 Apr 2026 05:35:34 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (32.237.80.34.bc.googleusercontent.com. [34.80.237.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a419c9a6sm2261855a91.7.2026.04.29.05.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:35:33 -0700 (PDT)
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
Subject: [PATCH bpf-next 1/3] riscv, bpf: Fix support for BPF_SDIV and BPF_SMOD in RV32 JIT
Date: Wed, 29 Apr 2026 12:35:11 +0000
Message-ID: <20260429123513.3477780-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260429123513.3477780-1-visitorckw@gmail.com>
References: <20260429123513.3477780-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_053535_351825_34679B4C 
X-CRM114-Status: GOOD (  11.63  )
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
2.54.0.545.g6539524ca2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
