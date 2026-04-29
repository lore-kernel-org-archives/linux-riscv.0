Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CFFFF8867
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 12:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MyV7H8zkBIvuZk3eaTto8MuMei9nq0q2K1gRi7OEjrg=; b=0fplDnneC0HPWR
	3bLQ4TwlfkSPpFv/uBSTt3wSaeiPjHFnncXT/RrjH5tEh15XvpSJ2akzKYM+OWL3w2qv1V+oD9AQj
	w23R1FGzrIQGJXqKagBX3A6BTz43E/t+h9eBeSvR8bYFvNbaeUi/1l9+1rFw2VTqZ7voRXz0oVhco
	tDgOsSioK3F970u9Vdq8bUiCWqf4ekJwb2uOToCBvaxcaCqlvSSPNkrgvgmnKgXpDg5AUgmq14cG8
	B0dGK3BfLPW4rcgHxpp0wYwixpvykGNozG/xlAVNwMR5uBUCrWwACrP7svYysu9ZBE+tKm55P/mOQ
	DBFwevZVd1/knaTYB6uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI48k-00000003ZtE-2af7;
	Wed, 29 Apr 2026 12:35:42 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI48i-00000003Zse-1N6E
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 12:35:41 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-35fb166b0c6so437509a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Apr 2026 05:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777466139; x=1778070939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ednz/cghQpogB1tCla7fjN5pIBUu1nziwhwuKFzLoEk=;
        b=YbU/TkwVFYcQUZzfmQ7R8fvwIXORBTklY7cBHbB1A74bgEVztDIYxFeVjXeOZyGyYk
         BD+6uZZNPvPojeYl9lkUpaCdpTB2M2lHPUk3lFBQBISCopJHKR01upkFKvnyPQmULazv
         U/IMVvfopbCd3VJzSp/D3QnP3Z0nOOjIEpbo4zbUswIm6Q1V0V3BaYJBt9RJJIHEk9rv
         tHa3KoT72RsDQr/QTBCWzKAIQDk2FVf7eTuYsn4/3xP5HxGlhxanrF2EIs2ZHq31VDPL
         WJ4gkWHkA1mRpol7+9Yyvu08lT35tdlrBOqPY/2ozi0c1ADtQ6kv0rxJmUhdIr62AcAe
         tXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777466139; x=1778070939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ednz/cghQpogB1tCla7fjN5pIBUu1nziwhwuKFzLoEk=;
        b=KbRzMDYLcer/yA0XFJRuEYIEajimJagyFv+AQrgTpXyCWSPkMadn6Mz3I/mfTKDJm/
         eeoTWjnstk/5jjpS0sHA3//okKtxH1EqbnOSbxDBm57hG+SfisI1BPWQwKoBYc20b5OV
         6WKTserOOhMkziEiiF2Z+ArCb4QJiNEsov36Xc4qUmwvUQ5HMp6DKspOQlWHJ64K0ElS
         eK+XZJFcAKhguPmqbfXtxaOzWQ/ifOgrE5IAHwsWtlbb/zDKLDp6/4YEUU0G5DTaR/n7
         pNQzTU69+o3BjtrJxVSZdBqkNWgqlH1GYfF1n6Ig1/iXIApVm+SEmICf9eQ7VbTg/Lp4
         5hfQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CpkRS8d3dfA/uotB2MonCcU2ahOq+LZK8OnJ1LEX43wZNnEwr/xdjm0+j3CmnymCXnvARfKOsJkHicg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4x3ruFmqyxrLGfjR+N4gij1tB4DwwAHc7tJx8Svej8+3FVsrL
	Gk4DyxNNdhEgadq4F/Adndv5TXd+3TCbDmJn5uu0YhHhXGATuVSrdBva
X-Gm-Gg: AeBDiettIfABzKqZaYPKYSqr7Ijvw+tCcjM/1/t1I5/TXelxPvMfqluciOm40V4tmrX
	3nV9Gnx3JsXlfDWzl8ALwhlzP39rYNS/yPGYy1qtuNefE7WOQIe5Apc6fcLL6s2C6Pk2Kl/A3NQ
	aS7gHfIa8HLKgguu4HNrpKYQ0EMYmCa9o3Ely20lQDUerzZ4kNlxzJ5448ST9uSyddnaBHy88di
	D9zKzKFwqo908cCuomwmSRXakMDmlklw6ynHO/Kwhkec0W+JtQgYW/ug8Jpa5G1AYieU2ybjUE0
	1t8hX1Z9ETCLy5WPzOw46ma+RM3tmOywZa41YWZIGEZTEUciWv5JWQeXKLCZlZff/nJE+zFwS5f
	EXMWNuMiWgrpUaLm9fO4fMAVm5G0HSf4DpGF7MPux2g4jMyZ7oeOjGPRs7xHB9AdOzpY4qJafpa
	5mnhV1bm+kz//T8fWA1rxkBhgUNTNH77yBIPrLRWKLA4oIvbkG7z/XD5uvO3MRd40wHxm300Eru
	G/8RETHHtH+v0ofKZIgivk00lwlGqlAHw7BoIT9DN6sxnF0Yz5YJC4=
X-Received: by 2002:a17:90b:394d:b0:35f:b1ae:d0ee with SMTP id 98e67ed59e1d1-364a1e69c83mr2946890a91.5.1777466139351;
        Wed, 29 Apr 2026 05:35:39 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (32.237.80.34.bc.googleusercontent.com. [34.80.237.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a419c9a6sm2261855a91.7.2026.04.29.05.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:35:39 -0700 (PDT)
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
Subject: [PATCH bpf-next 2/3] riscv, bpf: Fix support for BPF_MOVSX in RV32 JIT
Date: Wed, 29 Apr 2026 12:35:12 +0000
Message-ID: <20260429123513.3477780-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260429123513.3477780-1-visitorckw@gmail.com>
References: <20260429123513.3477780-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_053540_369781_F6F6C941 
X-CRM114-Status: GOOD (  10.46  )
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

The current rv32 bpf jit compiler incorrectly treats BPF_MOVSX as a
standard zero-extended move operation. The bpf instruction set allows
sign-extension moves by reusing the BPF_MOV opcode with the instruction
offset set to 8, 16, or 32.

Update the bpf_jit_emit_insn() function to check the offset field for
both ALU and ALU64 MOV operations. If the offset is non-zero, emit the
correct slli and srai instructions to perform the sign extension.

Before this patch:
[   19.549705] test_bpf: #82 ALU_MOVSX | BPF_B jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
[   19.551354] test_bpf: #83 ALU_MOVSX | BPF_H jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
[   19.552576] test_bpf: #84 ALU64_MOVSX | BPF_B jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
[   19.553542] test_bpf: #85 ALU64_MOVSX | BPF_H jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
[   19.554807] test_bpf: #86 ALU64_MOVSX | BPF_W jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)

After this patch:
[   17.931172] test_bpf: #82 ALU_MOVSX | BPF_B jited:1 125 PASS
[   17.932198] test_bpf: #83 ALU_MOVSX | BPF_H jited:1 124 PASS
[   17.933039] test_bpf: #84 ALU64_MOVSX | BPF_B jited:1 124 PASS
[   17.933918] test_bpf: #85 ALU64_MOVSX | BPF_H jited:1 124 PASS
[   17.934751] test_bpf: #86 ALU64_MOVSX | BPF_W jited:1 122 PASS

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/riscv/net/bpf_jit_comp32.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
index 7396899ea276..f8509950fed4 100644
--- a/arch/riscv/net/bpf_jit_comp32.c
+++ b/arch/riscv/net/bpf_jit_comp32.c
@@ -974,6 +974,24 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 
 	switch (code) {
 	case BPF_ALU64 | BPF_MOV | BPF_X:
+		if (insn->off != 0) {
+			const s8 *rd = bpf_get_reg64(dst, tmp1, ctx);
+			const s8 *rs = bpf_get_reg64(src, tmp2, ctx);
+
+			if (insn->off == 8) {
+				emit(rv_slli(lo(rd), lo(rs), 24), ctx);
+				emit(rv_srai(lo(rd), lo(rd), 24), ctx);
+			} else if (insn->off == 16) {
+				emit(rv_slli(lo(rd), lo(rs), 16), ctx);
+				emit(rv_srai(lo(rd), lo(rd), 16), ctx);
+			} else {
+				emit(rv_addi(lo(rd), lo(rs), 0), ctx);
+			}
+			emit(rv_srai(hi(rd), lo(rd), 31), ctx);
+			bpf_put_reg64(dst, rd, ctx);
+			break;
+		}
+		fallthrough;
 
 	case BPF_ALU64 | BPF_ADD | BPF_X:
 	case BPF_ALU64 | BPF_ADD | BPF_K:
@@ -1024,6 +1042,20 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			emit_zext64(dst, ctx);
 			break;
 		}
+		if (insn->off != 0) {
+			const s8 *rd = bpf_get_reg32(dst, tmp1, ctx);
+			const s8 *rs = bpf_get_reg32(src, tmp2, ctx);
+
+			if (insn->off == 8) {
+				emit(rv_slli(lo(rd), lo(rs), 24), ctx);
+				emit(rv_srai(lo(rd), lo(rd), 24), ctx);
+			} else if (insn->off == 16) {
+				emit(rv_slli(lo(rd), lo(rs), 16), ctx);
+				emit(rv_srai(lo(rd), lo(rd), 16), ctx);
+			}
+			bpf_put_reg32(dst, rd, ctx);
+			break;
+		}
 		fallthrough;
 
 	case BPF_ALU | BPF_ADD | BPF_X:
-- 
2.54.0.545.g6539524ca2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
