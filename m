Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DBFFF8867
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 12:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5EDGEfnKhY8HJlxFRcrLd7acbG+gcM938oiAvtoKaQ=; b=BGuDNbOO3zPUho
	HpGXqG8u+47emupYzA6YipDzFy921XXTpVfigDfg4nZk/JyuENnOLoTQVyqtV33hy4e5PCWqTmvAE
	Rw2lfTqFD8mQJHzFBb4o/X87zqu8nhgszv4KbJYQV8rIk9ytmPc4/KATKk0FY9sT09SPIhM2sVjgk
	97RJydLjMo8tw3HOns6lcblFWeVW+idICq5T/Dafv1befuhjU4PyXJpz1cJ67HvNQGb9SaxD3tyEi
	LEs82qyiiavEh5KTLhhrdnm3vYqCf9rTjybo5EfGTI+jBkS+rGAeMHAFchFO8llLcUvOT1I5mfN3E
	6KgqAxnRES3v++afqydg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI48p-00000003ZuC-3qQu;
	Wed, 29 Apr 2026 12:35:47 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI48n-00000003Zte-09gq
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 12:35:46 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so8374296a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Apr 2026 05:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777466144; x=1778070944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Quty2+kN4SQkJsBp5DT7Nz27mG7X1e/3uN0TQkO7euI=;
        b=O0njYWa5P2G5kx0tca0EJaMZbAcIEYtGinaO25R//PLUDJOVurP9YGq3U+ipcF6WT9
         D2UkYADrmKykd/ALry/ZGFIhyB4DkQDSwUpVoNf2cBgSpx3g6owyDJpd1ZllunqObA/+
         1nTZmYWUfTGqIwv3BC30vp+G5I+BPw/vrUHnSUVu4EixcGqt968bIoix71xIB/Kxk0+A
         8mSz5DC8sdl3WU7UkYUhWJd4sbWZPlTXNqXLRAt3OapMMiEiXo8492/SWDBHZxZdY5Se
         Oh6g4YXmzgACo3Q9uSQI32B/Q2qp6t5K09Nx0Mh14//LTzKPLS1QszOSN5BcHb4mVbGB
         /Fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777466144; x=1778070944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Quty2+kN4SQkJsBp5DT7Nz27mG7X1e/3uN0TQkO7euI=;
        b=O+5aCOcB7XYdmk8BAhp3OuNwY22/84Et72yUS2fpefbwuVF3lHyZWQfDHRJkWMzkmX
         tNSBmASQSR4ZBvA29dC1W+kX1SyItquncHttJ3O+6laRreEiGQcYTcJqsLpc3+Bq1AeT
         9NTAG9yT4TbS6Q1/75Ze6ejq0RRekoYq8yUJV/6+2z0dggq+mVhDrGAU08gxRfeUTJhp
         sE5GtgtiIN0Wt4gNW3xVEtwbBpEely311adGsUyCWZNt5sAjJyCzEolWpil/hErnZvPj
         leeGOSprMX15eQpIHcwIodf81yYZxJHkgqs/zOF3xjwLAsXhoeFCkd5JCaXcnm1RDMDg
         Jbbw==
X-Forwarded-Encrypted: i=1; AFNElJ8a/NnDYxpdVbO2GTv5krvug+APGF/atMw/FGjwJIzWKfkrIScELnNZlRvVkBhwfpGi/0JME1FHq2AyZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzX7AJZ7vuhOJZVLg1qX6AWF/qsBHj6Y36x2q8MXvNE1kR8lCip
	Kbs4TtdaiMW8PQQd5BRhetfkzQMVPBNF/oerZUZ8JBUWCsUQovOk60vx
X-Gm-Gg: AeBDieu3or3vo6qWkus5zsoOmG9dFtISZyG83Tn6PbvAYcE3Vq38WLMekPSTUoNyO+0
	dc3RF06jq0W/Vy438UZ7SkZBnGIQk5ZL2iHUfANubISn8DpCW8RrHSBC1f93LHrwZucuajX0XT8
	w4WjUGvvhHtvkp9M5VvZWQ/Y5YjlBoVLNTf55MFRCT23AevqJ8GrDIrcMmVPIs78Sx2MmWJcb/k
	eaJx4ApZSBLFyIpwQTVrqXbw1pY//D/L1jg/j2XVyURvtfotYbPc6OblVJSF2TySgQb3WShI+dw
	BYWayzj/k2vO4WzgWIb4hNCHJ9xqRWfQ/akIeTg2R5z4DKJSLvB2K1ndFh2N+sNvoOTB1LKSahG
	WwZV9P8B6a6Ax1PB1Zg4SOvaTF5B+P8FfUxiIGDhW/yQdt+O4fill8V+h4bzjQtjIcc8i8WtLMg
	7YO4EUir08wasIHNiZEjpmTg5LrgECLgjmDgBzgpxbva/uBbTQTxyBhq5B1saxH0rz07KG1Yrrb
	VI3N7xYAlV3qE8cj2xh12IWEmoqk3+FLPrLaGimFe+G
X-Received: by 2002:a17:90b:554f:b0:35a:18b1:c245 with SMTP id 98e67ed59e1d1-36491f6c91fmr7853015a91.3.1777466144094;
        Wed, 29 Apr 2026 05:35:44 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (32.237.80.34.bc.googleusercontent.com. [34.80.237.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a419c9a6sm2261855a91.7.2026.04.29.05.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:35:43 -0700 (PDT)
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
Subject: [PATCH bpf-next 3/3] riscv, bpf: Add 32 bit atomic operations to RV32 JIT
Date: Wed, 29 Apr 2026 12:35:13 +0000
Message-ID: <20260429123513.3477780-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260429123513.3477780-1-visitorckw@gmail.com>
References: <20260429123513.3477780-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_053545_082792_3D27D70D 
X-CRM114-Status: GOOD (  13.16  )
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

The RV32 BPF JIT compiler currently only supports the BPF_ADD atomic
operation. Other 32 bit atomic operations (and, or, xor, xchg) and
their BPF_FETCH variants are not supported and gracefully fall back to
the interpreter.

Since the RISC-V A extension is required for Linux on RV32, we can
natively support these 32-bit BPF atomic operations by mapping them
directly to the corresponding RISC-V amo*.w instructions.

Implement BPF_ADD, BPF_AND, BPF_OR, BPF_XOR, and BPF_XCHG with and
without BPF_FETCH. BPF_CMPXCHG requires a more complex lr.w/sc.w
loop and is left to fall back to the interpreter.

Before this patch:
[  138.862161] test_bpf: Summary: 1054 PASSED, 0 FAILED, [843/1042 JIT'ed]

After this patch:
[  157.024124] test_bpf: Summary: 1054 PASSED, 0 FAILED, [902/1042 JIT'ed]

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/riscv/net/bpf_jit_comp32.c | 47 +++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
index f8509950fed4..710c56b20f98 100644
--- a/arch/riscv/net/bpf_jit_comp32.c
+++ b/arch/riscv/net/bpf_jit_comp32.c
@@ -877,7 +877,7 @@ static int emit_load_r64(const s8 *dst, const s8 *src, s16 off,
 
 static int emit_store_r64(const s8 *dst, const s8 *src, s16 off,
 			  struct rv_jit_context *ctx, const u8 size,
-			  const u8 mode)
+			  const u8 mode, s32 imm)
 {
 	const s8 *tmp1 = bpf2rv32[TMP_REG_1];
 	const s8 *tmp2 = bpf2rv32[TMP_REG_2];
@@ -902,11 +902,40 @@ static int emit_store_r64(const s8 *dst, const s8 *src, s16 off,
 		case BPF_MEM:
 			emit(rv_sw(RV_REG_T0, 0, lo(rs)), ctx);
 			break;
-		case BPF_ATOMIC: /* Only BPF_ADD supported */
-			emit(rv_amoadd_w(RV_REG_ZERO, lo(rs), RV_REG_T0, 0, 0),
-			     ctx);
+		case BPF_ATOMIC:
+		{
+			s8 fetch_reg = (imm & BPF_FETCH) ? lo(rs) : RV_REG_ZERO;
+
+			switch (imm) {
+			case BPF_ADD:
+			case BPF_ADD | BPF_FETCH:
+				emit(rv_amoadd_w(fetch_reg, lo(rs), RV_REG_T0, 0, 0), ctx);
+				break;
+			case BPF_AND:
+			case BPF_AND | BPF_FETCH:
+				emit(rv_amoand_w(fetch_reg, lo(rs), RV_REG_T0, 0, 0), ctx);
+				break;
+			case BPF_OR:
+			case BPF_OR | BPF_FETCH:
+				emit(rv_amoor_w(fetch_reg, lo(rs), RV_REG_T0, 0, 0), ctx);
+				break;
+			case BPF_XOR:
+			case BPF_XOR | BPF_FETCH:
+				emit(rv_amoxor_w(fetch_reg, lo(rs), RV_REG_T0, 0, 0), ctx);
+				break;
+			case BPF_XCHG:
+				emit(rv_amoswap_w(fetch_reg, lo(rs), RV_REG_T0, 0, 0), ctx);
+				break;
+			default:
+				return -1;
+			}
+			if (imm & BPF_FETCH) {
+				emit(rv_addi(hi(rs), RV_REG_ZERO, 0), ctx);
+				bpf_put_reg64(src, rs, ctx);
+			}
 			break;
 		}
+		}
 		break;
 	case BPF_DW:
 		emit(rv_sw(RV_REG_T0, 0, lo(rs)), ctx);
@@ -1308,20 +1337,16 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 		}
 
 		if (emit_store_r64(dst, src, off, ctx, BPF_SIZE(code),
-				   BPF_MODE(code)))
+				   BPF_MODE(code), 0))
 			return -1;
 		break;
 
 	case BPF_STX | BPF_ATOMIC | BPF_W:
-		if (insn->imm != BPF_ADD) {
-			pr_info_once(
-				"bpf-jit: not supported: atomic operation %02x ***\n",
-				insn->imm);
+		if (insn->imm == BPF_CMPXCHG)
 			return -EFAULT;
-		}
 
 		if (emit_store_r64(dst, src, off, ctx, BPF_SIZE(code),
-				   BPF_MODE(code)))
+				   BPF_MODE(code), insn->imm))
 			return -1;
 		break;
 
-- 
2.54.0.545.g6539524ca2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
