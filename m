Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9141C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 00:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PA/+TaYIJe+cH5Qp529c97Pc1VW9DJD+jCo0sVoFcU=; b=fVWf/mMUiatErP
	tMsroEN750Tu3gLauI2Zz/exDmRgsa8o0/Foroeu8IIpPf+k0DntxHobcw0NY3ESPyqy66ubbCxt9
	j3tWhS3bY8EtJzxl/UGKFHgQ0sc5OOXcPfhEqsn1Dg1p145cxg7+dFzDucBkQSfeRsorYAZWs1nT6
	E+Bele+7kdnbLStpl3h7QmCoqR10iNYE3eR16KfW/TiAFVbjig3Zhdn8xEQOm+/Wwq8FFONt2m6vN
	73WDIcFH+Vo9dUyDtXtaD5+mgNm7HuKYuYjcBHb4hcndBkV0b1U4iWdbYNi1YPNA9/fogk9jUbuHo
	GhjoeJ44HKkhfMLmvbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQys-0000000AaxH-1RRd;
	Tue, 14 Jul 2026 00:26:38 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQyq-0000000Aawn-1hnu
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 00:26:37 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2caced6038eso5606775ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 17:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783988795; x=1784593595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G4Ey8HWp4FvJFSC3M85sFIilUNxEqpxDJnLthZ96lPI=;
        b=WRdPdG9RJkBk4+nrvNDcgg0hHas/ognwnSW7opxU8DDhjVuThF6wQz2iiGMBFDXzUs
         yJyosdfQamQZ2aM4AAPbeTHIVd9Tdsl5zAg2sJ+grAA8zHhT2fFSvUdxwRIbFiRUOZGV
         HnC/g0Tk6UjOh52cM+/sml27UequLtMlNiy1GMV4v2te29tLIDtEFB4GZ9lCN0OtsnAm
         nKN8gm/UADrC+Hpwa9/BeraALhpCqIRa99KOHGzqQlu1xxzsZWNOkyrMyIXZv9ARMO1+
         cCD1LatQ7vjhlyHLmPMbnx0SVs8QHEawzr1hfk86Ox1u52CV6kzmtaseLUFNATrOat8M
         K3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783988795; x=1784593595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G4Ey8HWp4FvJFSC3M85sFIilUNxEqpxDJnLthZ96lPI=;
        b=Ee7LLXWBLevUS3DYMxQQA+Ios7MxzV6mi6NDFaDToQYEQAj061NiiW0MGYMpELYFcx
         NTeA41pz5GVdVJHqldkjThN1LgrZ2CBsV4flkBMgx8LHgnTmrsWqyq3ffpwcoaXqf8XE
         CHyESkXwRKSIxD7wtsBAWQ0lcgidfbv2l0AcuUPerghd1BQHMUxmPAHQ7Mos2N7IgjXB
         LhWC5ECDaH+7Qtm4EcwB/pyeQvij7+58SMntLJaDxV8v3x9UGAk68a0Dm7akuplBqoft
         zuAk4v6gBNZaIjdVW3M/QAYUNPdYhg5jmzkzY+YYak5Xyc2DYhVBgy+4D3ndWEVX1QsE
         3KVw==
X-Forwarded-Encrypted: i=1; AHgh+RpqqNTvWs32AKZdm+hjeE9iN3nIqmF4zz1FgduT/Moju3nnQCfqIUp3qt9VBd0D+JGdNycG+jfFzQ9bvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYseW5aeJ/l5DU5EwLUEC4yTFCGMvJiyUloyL93DKpYpVU2eWC
	F5boYY76gLRf+MALRbKcNdep7JwK8DT/EQZA3lGQ9PuewNjWL5YwPrCx
X-Gm-Gg: AfdE7ckeQ+J0FUkFjtn6Wyh9ptP3V+TfaNNZgxnrZR9ydah8Sb4u7IkpeKZYJLH6HHb
	vGVMDngknGCB9CIXFARL0IE5VFDFyO+pZask+szfPwMT3jipbPjlONyJglphL6SISc2ktd0o++T
	fsNUJXleEOZcsuq/3rbiaIV57m5/UfDrvxvzwWUl7jBicBZqOwQQcaS64JIZLeLqCu/6ri8f98i
	/hdsNjRS8Xa2DliiZ6+Dq2DKQFHY9J90SLIcmLSwXHz9tmyK0WyTupO5Ck+c21yzcZV5OZ38jho
	3I2WJYWQozw1jjJ9FLhtWw3MwuEjsigaQOKk6ZX8X2fakV8GgCeSOg1HN91gns5geb9Eqx6X4RC
	ocXMzNu9WhjPjkACg/TKNLrG3x0Mdouc2mwLJLGIbT5ws7WGawQM00GwJEYNJ4vYpsKBUwOyJi4
	g1vOdVoBbligiqslu/sBj3qFtglzo6OZ9LdoEIDhToB5mHwL+79PRcn3c25OoPxcuKdD8j8en1m
	pt6Iy0V1yWERz0=
X-Received: by 2002:a17:903:110f:b0:2cc:92ae:b36 with SMTP id d9443c01a7336-2ce82970406mr140024965ad.24.1783988795333;
        Mon, 13 Jul 2026 17:26:35 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (131.197.81.34.bc.googleusercontent.com. [34.81.197.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1edb0sm105796545ad.53.2026.07.13.17.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 17:26:34 -0700 (PDT)
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
	aou@eecs.berkeley.edu,
	pulehui@huawei.com
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	alex@ghiti.fr,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	marscheng@google.com,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH bpf-next v4 1/3] riscv, bpf: Add support for BPF_SDIV and BPF_SMOD in RV32 JIT
Date: Tue, 14 Jul 2026 00:24:49 +0000
Message-ID: <20260714002451.4091139-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260714002451.4091139-1-visitorckw@gmail.com>
References: <20260714002451.4091139-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_172636_451837_7A88201F 
X-CRM114-Status: GOOD (  11.58  )
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
Reviewed-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit_comp32.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
index 592dd86fbf81..89153946a4e4 100644
--- a/arch/riscv/net/bpf_jit_comp32.c
+++ b/arch/riscv/net/bpf_jit_comp32.c
@@ -509,12 +509,15 @@ static void emit_alu_r64(const s8 *dst, const s8 *src,
 }
 
 static void emit_alu_r32(const s8 *dst, const s8 *src,
-			 struct rv_jit_context *ctx, const u8 op)
+			 struct rv_jit_context *ctx,
+			 const struct bpf_insn *insn)
 {
 	const s8 *tmp1 = bpf2rv32[TMP_REG_1];
 	const s8 *tmp2 = bpf2rv32[TMP_REG_2];
 	const s8 *rd = bpf_get_reg32(dst, tmp1, ctx);
 	const s8 *rs = bpf_get_reg32(src, tmp2, ctx);
+	u8 op = BPF_OP(insn->code);
+	bool is_signed = insn->off == 1;
 
 	switch (op) {
 	case BPF_MOV:
@@ -539,10 +542,12 @@ static void emit_alu_r32(const s8 *dst, const s8 *src,
 		emit(rv_mul(lo(rd), lo(rd), lo(rs)), ctx);
 		break;
 	case BPF_DIV:
-		emit(rv_divu(lo(rd), lo(rd), lo(rs)), ctx);
+		emit(is_signed ? rv_div(lo(rd), lo(rd), lo(rs)) :
+				 rv_divu(lo(rd), lo(rd), lo(rs)), ctx);
 		break;
 	case BPF_MOD:
-		emit(rv_remu(lo(rd), lo(rd), lo(rs)), ctx);
+		emit(is_signed ? rv_rem(lo(rd), lo(rd), lo(rs)) :
+				 rv_remu(lo(rd), lo(rd), lo(rs)), ctx);
 		break;
 	case BPF_LSH:
 		emit(rv_sll(lo(rd), lo(rd), lo(rs)), ctx);
@@ -1041,7 +1046,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			emit_imm32(tmp2, imm, ctx);
 			src = tmp2;
 		}
-		emit_alu_r32(dst, src, ctx, BPF_OP(code));
+		emit_alu_r32(dst, src, ctx, insn);
 		break;
 
 	case BPF_ALU | BPF_MOV | BPF_K:
@@ -1065,7 +1070,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 		 * src is ignored---choose tmp2 as a dummy register since it
 		 * is not on the stack.
 		 */
-		emit_alu_r32(dst, tmp2, ctx, BPF_OP(code));
+		emit_alu_r32(dst, tmp2, ctx, insn);
 		break;
 
 	case BPF_ALU | BPF_END | BPF_FROM_LE:
-- 
2.55.0.795.g602f6c329a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
