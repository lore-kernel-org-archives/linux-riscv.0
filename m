Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93560C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 17:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIEGMWmJe4A/NUi4gTl7PTnYUejvyN+at1z01dKGU4I=; b=swWcj7vwEuPNYp
	MWoShfSTkw0ctP+lmpxkWUGOIjfagIj2n9O/S04wgJzJWzChxiicsCkQyngVS12JaIV+JsnEGms2e
	hccF5d/nS0fzKh+J6PZlGJwdyke9pnJH9EWu1cd0xmomWXygFHycISVOz+3u2t3HKegvprkLQiMps
	wQq3wC02RICH9SXudJP0pZCLsWVBQ3qVmK4PvqP+GP9s5GoLo2Jf25rp5dWKfJIiUkxbxJRGHX+5e
	5cfX02Qk2okqo+NnMTsSzYwi5KN/HV3L9luT1wvcBGEbi5jau3PxdwHNxO/B4VRKPTJnJFsQc3GN8
	tH5W/pO0QSXUECvJDaFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgn8A-0000000DCKR-3X4Y;
	Mon, 06 Jul 2026 17:29:18 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgn86-0000000DCJk-20H1
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 17:29:17 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2caf228a910so19751755ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 10:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358953; x=1783963753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/CMhFxVY82r5Eid4wLFl+1SdH8jeYdZBt6ircQEov1c=;
        b=EOxJ82NFhQxO1frTf17pk+xnw+sGZSXTJDq36OBtPlceu6M7IN2GRsYVx3TeylGEnt
         NOmKvChGL+rdjOTCAGhqGBvbQtPOokjgx8btjEk8CdosE2yT99XOpglfA4NFy+O1GSYx
         ZqYy5VvwEpTSEws5PgRq2TrltvXzH4xueIl64ngLgWR4m2ypABh59O+SHaBS0N8N3oOH
         caiYk3QTu1Fvi+Q2dxcn67VGhd3a+27dElHXwYkYFR+QV3ZaRt4Qi0o10N2GkWXnu8R/
         biMb2Z85hvkLb/W0OuyLTNAbawwN+pWRX0mFCh49DX+YbiQv5fE8e6VB3m+4ZAnSJJbz
         UzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358953; x=1783963753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/CMhFxVY82r5Eid4wLFl+1SdH8jeYdZBt6ircQEov1c=;
        b=UOtfVKFaZEO33/RfUJrFIrNPuMwpTlGYOruzsFyXsZuWAsjSrxAKLr7OhjgbHTn9AE
         Ahr5mTOoXgvE+YT7MGRQUSziXlhAiATrpyC4Qc9GpmjSQ4YFe0fgh4Dgcc4hOqXE6QOr
         OEjrlIQeERJcUhZzABMQsbV0DjRZZxS85ot7QgRr0nChU3syqUE4tyF+gV/nTUd/aZUn
         P3y0X1uXK6iKWa1hyJAIuGtIjdkgly0B/wibrUWtrEUHxmR+ArKeYlu+VusLWjjKYKlQ
         EZkNpyu8Odl5gmPutb8aDVos44j2Ve3OpDe3YHY076gk1gGF6F/2cu7ALEahSDYlvwG9
         5Q1w==
X-Forwarded-Encrypted: i=1; AHgh+RqV5u5jSZwmg+1kuIfW77ypcJQA66Q5Wsu64jiWe1jgDJnnPS1l57ZBk3fGZAFhTXhWawCxC7OCipQ+Rg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTu99l+KYmwHYYyJQHVicf8Kbq+mVxqwP2js7lhk2MlwcXDdOd
	ay4I+4o4ipIpwtYmcS4SJWGUF2Gdr3L1R9fQU0v5Z1MRinqMyNGpnO0/
X-Gm-Gg: AfdE7clQNOx+vR8NSuqFSpQt8/crZNKA+Xo2WjL99LVv/ihQsZa9+SA3ofTSCoyVZhr
	I6sboiQFmFsjiT++hCSxGaPAao4vqPHcBjZL4fBTdGAof08B8jm2HegJbBUXOUjRTFGpYVM0Xo8
	xAxHnVawxoterCWTv2si+F8TFRvCFhJ8YUGgoskj519NyH6z3bdY3KdwWcpeUUqNsWh4ok891vt
	YURm3NRHmxdOYiiJa47/UQE5mvVU7cuTIUsNuAKEpoUXbICK0PgrJHMyT7WsA+RxNR+aE1uaGi4
	8FJZtR3jv1D9yXS2L1ll6iZiiL41mf6JyN9j80PrqhjM5GSrZckN/95pvP0KRLB7N3gz3PgeuOQ
	bNBEUDUiY194mBqj8uhvRzVDg+zIpLYhEaj142Ue/lPjaC3gV2Q0FomWH7xiq4/r2bcR1CsDRaz
	mHlwVgG6lWMG6y9RStb8EJh4tHQ83kMLor7JXWBYMEmMGJxW4OAe47kKCgVIgVMipQfHjCx126c
	6AA9/NsjtmtGwuzcta3jCI=
X-Received: by 2002:a17:903:17c5:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2ccbdf40961mr16975285ad.0.1783358953412;
        Mon, 06 Jul 2026 10:29:13 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (32.237.80.34.bc.googleusercontent.com. [34.80.237.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e54sm54667005ad.2.2026.07.06.10.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:29:13 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 1/3] riscv, bpf: Add support for BPF_SDIV and BPF_SMOD in RV32 JIT
Date: Mon,  6 Jul 2026 17:28:44 +0000
Message-ID: <20260706172846.3876436-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
In-Reply-To: <20260706172846.3876436-1-visitorckw@gmail.com>
References: <20260706172846.3876436-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_102916_406891_5B01A85A 
X-CRM114-Status: GOOD (  11.62  )
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
2.55.0.rc2.803.g1fd1e6609c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
