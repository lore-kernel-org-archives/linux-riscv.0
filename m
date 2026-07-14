Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BD6C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 00:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfWN71HIXrPLqONIlIvCJwKIx8crph4UH64mmUhtA/o=; b=BAGpEU42WzD1vL
	VgvUBlYGgdgOAkbWoZ02H4TA6cCAQXioCZI65PYZL0ZmT1PT5dyA7WbQtl4ksRcgYAgny/ZrL/Shx
	WaOQsdDJh4eownuVe6FndzepRCdguUSQIqTJgJZk1tUHZSG4HJPZD+Z9dHXOpuXPOXIE+ZVOAHxCI
	9lb/ejhcTGVEcAt1DMX/ba31KqbOVlC1ZkmLYpPC9feamU7zwzwyIYcXcAK+H732oL+V6Nf6uogIH
	SvY6d7veDCOuKIkET1Qwv5DxQRrQd/r0yU0XGIMSs7qeX+++ulrQxNe5VWRiKHQj5bfxPHrAhLupO
	yJiaHbVb7DbkUQLVLXGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQz9-0000000Ab4C-2VNg;
	Tue, 14 Jul 2026 00:26:55 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQz7-0000000Ab23-0euQ
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 00:26:54 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ce9e39fccbso3506855ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 17:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783988812; x=1784593612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgXQYuVybZT9KNEa8c+0sS3pMAKReFnk7Wi8Pjluu4g=;
        b=XzsekDYCJESQ59CsaJCRZgTCM4mRFGaqVYdPpviwVSUiRtd19RUxfOlVQWHcdfAPS9
         ueJb+/5HEFUHoIjeYtQKcooBYGeI/CBS0nh8cvE4z2WF3uJy9+PuVDhMFiiykF3tzq24
         EmvHnwL4vjkF0Llo7vEisrVXpU20G7j7WzVnBaxXPkmeYJrupu3ZA7Z9ZY1nAisFtzEy
         VtG2k9B2TTpN9DRRawep1c8r6OG6pqzbq3ZfhjGE6vPYpv+FoFugxZBTRTPHXjAzHMR0
         eo2EgI+EokOE6L481SrevbKzqB9P7XAodIvptdeXbimeuii+ocXe8tGG0LhnvfHMbn1Q
         WNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783988812; x=1784593612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KgXQYuVybZT9KNEa8c+0sS3pMAKReFnk7Wi8Pjluu4g=;
        b=ofN81pcTJy541Qp/KhZ6RLhNN9TkbH+TlwMwLlccF5lsema2/4RdEqLJ2cusaaAiZe
         ajqr9PVB4Af1t5jiCeWpgfDKZWCqbRkUI4VKbGis8nXVTzflzdscXrRh1ylKzypLwkdU
         U7o/rLYWTYbTTjAD+rU1g6LH7BX8g7hCQ+o57bMOonH5U6DXTNxEGh/Aaa+cgXR2d8Ni
         TD9V8u3c6cGn0x3zz2IxqoaE1S/XuU8ed0/J13+eo47IIliBgYNk5P61xEcBn4G3AZad
         gipOKpRrN24Gsw7boWxyIrq6Csj8xV2eJrvBII4o9wKuqOXkj0ruiY8dkMdmjlbYxGWD
         UgZA==
X-Forwarded-Encrypted: i=1; AHgh+RrYwCmkPnF3CgIOlrKQVJ8KYAGYmKCMsSJp8IzjQm/RQrdc82h0agY5IQm7NI7P0a7encKiYBsmM2ChBA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbi+Zr9ibSwCKYQYw905jq2u/moU6OFxSuCoaFhS+cNgcSNLEY
	bG2L0/LXNXIwrL/gaIOZ/7RlwFhnFceBmKnM/8wXqs4NGy3vryzfTRMo
X-Gm-Gg: AfdE7clVqtalpqzN/YspQG7Lqrm+UEg8hCLj+1LBZCI/JPT4zxq87ZEzW9rFslUXwvp
	QmtoCOgs/FNUfMj15NC/p/X4/MO3IGrroHRevEQhwsBEsorB/rjdQgx4BHyKktICzPa8deb+Wqt
	Mt7wR6vghNPbZQEPL5R1HDETs4ergPgjRM4qVJY0pGWzX63Vbc0A5dwpufpn2OikbF4ypI1ZuRm
	lbvL+sYBAtW5ml4O70rXkC6SSHisAattelGVdyfxIStCB+/FGmfRhFp31gKqqgVUNTij2u67dym
	ghKLRrdAnpSfXwRtgn6r4jHyGxLKWRtLFho6aDdJFZ4uMOwCO9bfyMr5K2dPqm0FFEInF7KfoKg
	Fr6N60akn4/ZxV/eHLRZGJooce6LmMtKzHDtIg3frvJaG2wNzzIR+V88OsW2aEVODsl/dXlVOFi
	F3zwLZs656pvk2A/qJCYYr6QTgMJOIhAofR/G+WW1elQ/gfwpI7pg8NfrbFnAeJeADh1qmutTLu
	NzrIEcvfnkG0mQ=
X-Received: by 2002:a17:902:d511:b0:2ca:d4f:adab with SMTP id d9443c01a7336-2ce8292cb2cmr149647585ad.19.1783988812034;
        Mon, 13 Jul 2026 17:26:52 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (131.197.81.34.bc.googleusercontent.com. [34.81.197.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1edb0sm105796545ad.53.2026.07.13.17.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 17:26:51 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 3/3] riscv, bpf: Add 32 bit atomic operations to RV32 JIT
Date: Tue, 14 Jul 2026 00:24:51 +0000
Message-ID: <20260714002451.4091139-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260714002451.4091139-1-visitorckw@gmail.com>
References: <20260714002451.4091139-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_172653_199919_F00848EC 
X-CRM114-Status: GOOD (  14.41  )
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
 arch/riscv/net/bpf_jit_comp32.c | 64 +++++++++++++++++++++++++++------
 1 file changed, 53 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
index 39e2b0b907dc..a9e0bd5cc81d 100644
--- a/arch/riscv/net/bpf_jit_comp32.c
+++ b/arch/riscv/net/bpf_jit_comp32.c
@@ -874,14 +874,58 @@ static int emit_load_r64(const s8 *dst, const s8 *src, s16 off,
 	return 0;
 }
 
-static int emit_store_r64(const s8 *dst, const s8 *src, s16 off,
-			  struct rv_jit_context *ctx, const u8 size,
-			  const u8 mode)
+static int emit_bpf_atomic(s8 dst, const s8 *src, const s8 *rs,
+			   struct rv_jit_context *ctx,
+			   const struct bpf_insn *insn)
+{
+	s32 imm = insn->imm;
+	bool is_fetch = (imm & BPF_FETCH) || (imm == BPF_XCHG);
+	s8 fetch_reg = is_fetch ? lo(rs) : RV_REG_ZERO;
+	int aq = is_fetch ? 1 : 0;
+	int rl = is_fetch ? 1 : 0;
+
+	switch (imm) {
+	case BPF_ADD:
+	case BPF_ADD | BPF_FETCH:
+		emit(rv_amoadd_w(fetch_reg, lo(rs), dst, aq, rl), ctx);
+		break;
+	case BPF_AND:
+	case BPF_AND | BPF_FETCH:
+		emit(rv_amoand_w(fetch_reg, lo(rs), dst, aq, rl), ctx);
+		break;
+	case BPF_OR:
+	case BPF_OR | BPF_FETCH:
+		emit(rv_amoor_w(fetch_reg, lo(rs), dst, aq, rl), ctx);
+		break;
+	case BPF_XOR:
+	case BPF_XOR | BPF_FETCH:
+		emit(rv_amoxor_w(fetch_reg, lo(rs), dst, aq, rl), ctx);
+		break;
+	case BPF_XCHG:
+		emit(rv_amoswap_w(fetch_reg, lo(rs), dst, aq, rl), ctx);
+		break;
+	default:
+		return -1;
+	}
+
+	if (is_fetch) {
+		emit(rv_addi(hi(rs), RV_REG_ZERO, 0), ctx);
+		bpf_put_reg64(src, rs, ctx);
+	}
+	return 0;
+}
+
+static int emit_store_r64(const s8 *dst, const s8 *src,
+			  struct rv_jit_context *ctx,
+			  const struct bpf_insn *insn)
 {
 	const s8 *tmp1 = bpf2rv32[TMP_REG_1];
 	const s8 *tmp2 = bpf2rv32[TMP_REG_2];
 	const s8 *rd = bpf_get_reg64(dst, tmp1, ctx);
 	const s8 *rs = bpf_get_reg64(src, tmp2, ctx);
+	u8 size = BPF_SIZE(insn->code);
+	u8 mode = BPF_MODE(insn->code);
+	s16 off = insn->off;
 
 	if (mode == BPF_ATOMIC && size != BPF_W)
 		return -1;
@@ -901,9 +945,9 @@ static int emit_store_r64(const s8 *dst, const s8 *src, s16 off,
 		case BPF_MEM:
 			emit(rv_sw(RV_REG_T0, 0, lo(rs)), ctx);
 			break;
-		case BPF_ATOMIC: /* Only BPF_ADD supported */
-			emit(rv_amoadd_w(RV_REG_ZERO, lo(rs), RV_REG_T0, 0, 0),
-			     ctx);
+		case BPF_ATOMIC:
+			if (emit_bpf_atomic(RV_REG_T0, src, rs, ctx, insn))
+				return -1;
 			break;
 		}
 		break;
@@ -1303,21 +1347,19 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			src = tmp2;
 		}
 
-		if (emit_store_r64(dst, src, off, ctx, BPF_SIZE(code),
-				   BPF_MODE(code)))
+		if (emit_store_r64(dst, src, ctx, insn))
 			return -1;
 		break;
 
 	case BPF_STX | BPF_ATOMIC | BPF_W:
-		if (insn->imm != BPF_ADD) {
+		if (insn->imm == BPF_CMPXCHG) {
 			pr_info_once(
 				"bpf-jit: not supported: atomic operation %02x ***\n",
 				insn->imm);
 			return -EFAULT;
 		}
 
-		if (emit_store_r64(dst, src, off, ctx, BPF_SIZE(code),
-				   BPF_MODE(code)))
+		if (emit_store_r64(dst, src, ctx, insn))
 			return -1;
 		break;
 
-- 
2.55.0.795.g602f6c329a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
