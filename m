Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761EDCD37BE
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 22:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=saPz077kM2qIqXlKddd64QAKiExUUn/vISDrfaoY5Vo=; b=Fu6OISixrCrNz2
	WEqH59PnxFJoe1dZ0uLbohvXGwtnfEqyONKt60yqFaA40miNUGXeCihx4sH79Rx4beE3yT61Jq9FF
	MJgZlUGVMr/iUn/rkBacod0klsfdpec7zhyTGik6Y3fnewuA/OzfVEtXbqVYTTFo/+rAJxiO5EgbA
	Y5iytyOPepT8a3b0oHRnjASUKjXcvDQ9FxyLwOFvqLL3s+XEpkIuoBKueUX0o6AZMkTckaE3xb/jf
	4xj4pmOEQuI81R4g2YpneFd1x4hdoXr/n9aT13aL3h5laf5bXSLlZsiA074KUl+iISpd9erUbUSHd
	kOZlX4bNPjaSgax5jk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMYwK-0000000EtIX-1Ylr;
	Mon, 11 May 2026 22:17:28 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMYwH-0000000EtGx-31rM
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 22:17:26 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so1996085a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 15:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778537845; x=1779142645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7mbGY8zUp4Stmyf9OXEpNnChS/Bjn8U2B0Qfpbuf84=;
        b=gPeMNj2+HdFJQut79yK9JI8wYtn8ygZFasQrWm2PvMWBrHBCanAP2ZN4REpFezRWHd
         6ghdaxThcf2NKRvXseJRKm9bwLzGRoxfBXTZotKYO9lE50foYLgPFl4UQdo0hKbS/OiA
         X1o4m5gQrivb+vEF7jKhoNjG7eW/d08SVfT5xscevOjA6FrtYh/i9+MQ2dhN4XQio3Mg
         U5qDyXR2UhCiAIYZYzE5xRLCQeE6N/MZ8utr2lTKS8BJoWeaJYa/7jHwRdEgQtg7yTmY
         xdIMupBdtpchxRw0rFWBHbRFimHKHBwddpTmJxAaPfUXO8T+iz5pCvSqpXuvnkRDuATJ
         9Mcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778537845; x=1779142645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n7mbGY8zUp4Stmyf9OXEpNnChS/Bjn8U2B0Qfpbuf84=;
        b=Q4ZeeFVJAAlzN6ihXsOq1aSYD6ntpGrtD77pPvrdxwqLxjfZvTrXdU9QeesB7dEF1V
         ntsp4ictABuMpfujXpGH5ay8BOf2MVqcOqJmhkYGkBDY/ozsrmjhmjMhWpNxkymz1oFA
         YHLO8nXf+2Y+k6+SfChoO1OPWpCJZwk0NCyY8AL8VJAyG70qcGdPYeQvKwlTDzHVmtVl
         rXiXSAzmUkH+eOpjtQ1Au0KLtB44wLqnzt0PKPMowoSfVf+ZJuy9/7XDn728gV4LIaPc
         h48w11EW8FDaH0rcx/gwGzRCZhSzdxglR9RKZCZr2nJaNvKruO9ZmsJlI1XBV/Bh2TG1
         Jzsg==
X-Forwarded-Encrypted: i=1; AFNElJ+893ieodW5KQSd+WI3QbLFPFrd0fDgi2QH8nxKbEJhI9aKvf8HF6PzTblzfSGKpgGJNfbtKav41rCJaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTeoeNIUijFnSQd7c0f1+aLCzcfqufIosceFwLUNFAtjgEQNIb
	htQfNUqhxEpE8zuumjSYeIjZsffip+82/Wt0dczVrJIOF40rkl4LN5Sj
X-Gm-Gg: Acq92OHUr5TRCeRHSAE0uLrhemg1CBpniz2wr1SaPPB9EKxsElHcTyA8ZiC8vF6BAeb
	nyh1Rm1/rSIl2rV7p2UYLDTRYpPAB1cD4t+cK8cSYVgJx65W1dqGd4mm/vRRvt2xv2B1UHjpW7h
	zYT6imt2iNhSMUw9+M7JXOvSy1+780ePX24qmj+L8kxEXfuKp7mnjT9GdTv7rspganyNR0Rqp+s
	VC9qQxBlygs7VoZfvZSwgQ0yLizMfTWjErTcqg8+Zn+ZIcOarouWRia/mGStRgiazpZ60u8MvOi
	iiZ+zVCJX5SNK4Q7d85fE+ZGXfJSLrKUZKpzZBFkqC7uLHgTSmXusxDMiviBRit9vaF37IdWzsU
	R8YT6NQqS+hUWpmMglgL4wB98VXEjZCZt7zIjVoSbZqmxM5BT1VuJ4UC+aZeG/1kenXxeCXLWYa
	na8RE9pNrWqW8pkLuaTP+XJB5UGeRIYxOizsfwvbal6nI53QRYeiijoIpquohHzwfTPJZsPKZso
	5Qt0NE4+uWJ/bzPYDn2caunUCjNIS/lmQ==
X-Received: by 2002:a05:6a20:6a09:b0:3a2:f14a:4290 with SMTP id adf61e73a8af0-3aa5aa7a02dmr27720750637.38.1778537844766;
        Mon, 11 May 2026 15:17:24 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (32.237.80.34.bc.googleusercontent.com. [34.80.237.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm21943329b3a.19.2026.05.11.15.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:17:24 -0700 (PDT)
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
Subject: [PATCH bpf-next v2 3/3] riscv, bpf: Add 32 bit atomic operations to RV32 JIT
Date: Mon, 11 May 2026 22:16:48 +0000
Message-ID: <20260511221648.3251464-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260511221648.3251464-1-visitorckw@gmail.com>
References: <20260511221648.3251464-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_151725_765630_E5C47C9F 
X-CRM114-Status: GOOD (  13.05  )
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
 arch/riscv/net/bpf_jit_comp32.c | 50 +++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
index f8509950fed4..7fd726a09b26 100644
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
@@ -902,11 +902,43 @@ static int emit_store_r64(const s8 *dst, const s8 *src, s16 off,
 		case BPF_MEM:
 			emit(rv_sw(RV_REG_T0, 0, lo(rs)), ctx);
 			break;
-		case BPF_ATOMIC: /* Only BPF_ADD supported */
-			emit(rv_amoadd_w(RV_REG_ZERO, lo(rs), RV_REG_T0, 0, 0),
-			     ctx);
+		case BPF_ATOMIC:
+		{
+			bool is_fetch = (imm & BPF_FETCH) || (imm == BPF_XCHG);
+			s8 fetch_reg = is_fetch ? lo(rs) : RV_REG_ZERO;
+			int aq = is_fetch ? 1 : 0;
+			int rl = is_fetch ? 1 : 0;
+
+			switch (imm) {
+			case BPF_ADD:
+			case BPF_ADD | BPF_FETCH:
+				emit(rv_amoadd_w(fetch_reg, lo(rs), RV_REG_T0, aq, rl), ctx);
+				break;
+			case BPF_AND:
+			case BPF_AND | BPF_FETCH:
+				emit(rv_amoand_w(fetch_reg, lo(rs), RV_REG_T0, aq, rl), ctx);
+				break;
+			case BPF_OR:
+			case BPF_OR | BPF_FETCH:
+				emit(rv_amoor_w(fetch_reg, lo(rs), RV_REG_T0, aq, rl), ctx);
+				break;
+			case BPF_XOR:
+			case BPF_XOR | BPF_FETCH:
+				emit(rv_amoxor_w(fetch_reg, lo(rs), RV_REG_T0, aq, rl), ctx);
+				break;
+			case BPF_XCHG:
+				emit(rv_amoswap_w(fetch_reg, lo(rs), RV_REG_T0, aq, rl), ctx);
+				break;
+			default:
+				return -1;
+			}
+			if (is_fetch) {
+				emit(rv_addi(hi(rs), RV_REG_ZERO, 0), ctx);
+				bpf_put_reg64(src, rs, ctx);
+			}
 			break;
 		}
+		}
 		break;
 	case BPF_DW:
 		emit(rv_sw(RV_REG_T0, 0, lo(rs)), ctx);
@@ -1308,20 +1340,16 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
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
2.54.0.563.g4f69b47b94-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
