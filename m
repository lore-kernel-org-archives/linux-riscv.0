Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2025F30273
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 06:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWRajDAU8S0VHiXcPBCYVb18c1QtHX1ujGhgkPRZxVY=; b=0xW/FJAsi4jCUq
	W+mT87NmE6B36lhACP868dPvvxHjA76AsaotwVEKkPwjwtMGwsddKkksj6vA92hiUhxvKDyLBRZAr
	gKC0pAmERxsxoA52Z3wsVCFd+BHiedzRmL5tAzw+wgefOQdxS1E4gPTL2DwTYzTktyZ1TA+GDvZd4
	cgwTsNXmZDurq45qbNX5rp8YR3OyX3Ufic4uaaeK5eKP8QKFLEJoL2is9MAX08lc+61/GW0bXJ7qA
	jznsLY2iQkU7dMlhp9mX3AiCBdjQJA0vS1ZmvYOSBYXRbA8Jfu2Q3cz53uLnAQqIOVi1ln1V4FAb5
	4loADV8CGKP6l7bEUc/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w215P-00000003Nsr-1UA0;
	Mon, 16 Mar 2026 06:05:55 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w215F-00000003Npx-1Tog
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 06:05:49 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-829b8b6c4d0so3395060b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 15 Mar 2026 23:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773641144; x=1774245944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xean22/tjFsNOsF/nOdABDf/+KIaxj5k5+75ISbAbNU=;
        b=haNxfbGbe2irSAD4ggDPEe1gW/ch8VFQ6eHxlHgwAcVPqEpktomi2ls7MrvrDOJVJi
         aYQ8U59ozrrzfjM+6Tt/yLut1UJnZYM7a0K+GvQXsuoxNh+DGMgAFRRIyc9GrOZt7wKx
         lDURdniJ46zwS3fQYdcSGoDVbtZDWxH3G05+eNCo0iuIuxtg9UWGt9509SY4FmP4FB4r
         i2Bg6Kh0d5dYSE2OLb6lTNTYHr1OHGNEyPxrlmhMGBwyTNzsz3gtIIR0ZSOsLjFlK518
         6sTdiaMV+ItAVFLg9JUkRkSJKkYXNvnm/fY6wSl/92JXDL3SlKN0ZlHQtJ+QuuODBTqy
         uS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773641144; x=1774245944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xean22/tjFsNOsF/nOdABDf/+KIaxj5k5+75ISbAbNU=;
        b=LuLM86tM+Pj5Vc4c3TmVXQMfRHu9BOsb+SyLwieBN8KEkbM9vShYJv5Ve5EuqA53vB
         zu2wA4szxCbRZB+V8OCfXe9vOHwQUYfP8fJSkEtDTG4AcUyWGU9MhY2oVkMS4ZAO5+j/
         KyHXv969a2IDwflxpgqZ3eQ5msmZjq3ReLlPR+fNVOKoKU2Up+4l7+MN8bRDQi8grnVT
         N07zSnI0bKklyALu+JhK+2hD6FCBlimTL++gR9eP0wCNmZab/PDas29yGZmTsEJtUt4i
         bV3vfMsN4hUi/IM9+ToshpZi5iszONm6qZvCsmsN6SBYnKABzpjMh6h2cxDxHaNhitXr
         0Iiw==
X-Gm-Message-State: AOJu0Yxyk/cNSbPXujUImsA9ftAkR3nqWk10fiBhyAPrZE6kyzZV5dUy
	SDSfmKfhMjBg28RLjXTKIMgPXPWD9BUOt4L9LJTTXTbi5t6lu9sGIS3+3bTi2A==
X-Gm-Gg: ATEYQzxqMQ2lXuJmaOsN7TJ/sKAU+lRUs4QDJ8tULaFvKjxg9b7Wz3JWrvT5Ec5tI+S
	NLtMMYpWh49eVehEM9wTZktnpvfzLc0kQNpNL4i81GiL/M1LfUUGYlzWTYxC1Xy47h53CKsedO4
	6RjWKowUPgkZboAATAmGeXY8xwKv6ZwZ0o6Q26u9cPbf4Zi9NpjL6GyvYVcslQ75JlscbU8h7xL
	yeznrwIaqdRI6JVj9ICvQw0A2Xmq9QxeuSxmCy+upKnW2YhQbsHdLZ+hmNK++ZZuPsz9+oLWrjf
	cnJ8MZsvsg3v89mAwrq5tp+G+iQqXikswgFyKEbUTsapPelEFd2nb+5UFzsAzCdEM2T8/U1AdK0
	hhbW3iFbcnRYrVebaORiGh7qoLUNvY/16L30DmRooCaLT2+KWD1mpQhevfhXm474gIb6z9YiZx1
	qySyaYjQ6HSPfWSNrzUuUW8Ovn
X-Received: by 2002:a05:6a00:2d8c:b0:829:8bb4:1034 with SMTP id d2e1a72fcca58-82a19873098mr10167099b3a.28.1773641143923;
        Sun, 15 Mar 2026 23:05:43 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07393098sm12525226b3a.62.2026.03.15.23.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 23:05:42 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: linux-riscv@lists.infradead.org,
	samuel.holland@sifive.com,
	david@redhat.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	gaohan@iscas.ac.cn,
	me@ziyao.cc
Cc: lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com,
	marcel@ziswiler.com,
	conor@kernel.org,
	kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: [RFC PATCH v2 1/3] riscv: alternatives: support auipc+load pair
Date: Sun, 15 Mar 2026 23:03:26 -0700
Message-Id: <20260316060328.1173634-2-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316060328.1173634-1-ganboing@gmail.com>
References: <20260316060328.1173634-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_230545_903357_43D693E2 
X-CRM114-Status: GOOD (  13.22  )
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

Previously only auipc+jalr pair is supported. Add auipc+load pair
to support PC-relative memory load instruction as well.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 arch/riscv/include/asm/insn.h   |  8 ++++++++
 arch/riscv/kernel/alternative.c | 11 ++++++-----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index c3005573e8c99..1c791a8732efc 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -135,6 +135,8 @@
 #define RVC_C2_RS1_MASK		GENMASK(4, 0)
 
 /* parts of opcode for RVG*/
+#define RVG_OPCODE_LOAD		0x03
+#define RVG_OPCODE_STORE	0x23
 #define RVG_OPCODE_FENCE	0x0f
 #define RVG_OPCODE_AUIPC	0x17
 #define RVG_OPCODE_BRANCH	0x63
@@ -198,6 +200,8 @@
 #define RVG_MATCH_BGE		(RV_ENCODE_FUNCT3(BGE) | RVG_OPCODE_BRANCH)
 #define RVG_MATCH_BLTU		(RV_ENCODE_FUNCT3(BLTU) | RVG_OPCODE_BRANCH)
 #define RVG_MATCH_BGEU		(RV_ENCODE_FUNCT3(BGEU) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_LOAD		(RVG_OPCODE_LOAD)
+#define RVG_MATCH_STORE		(RVG_OPCODE_STORE)
 #define RVG_MATCH_EBREAK	(RV_ENCODE_FUNCT12(EBREAK) | RVG_OPCODE_SYSTEM)
 #define RVG_MATCH_SRET		(RV_ENCODE_FUNCT12(SRET) | RVG_OPCODE_SYSTEM)
 #define RVC_MATCH_C_BEQZ	(RVC_ENCODE_FUNCT3(C_BEQZ) | RVC_OPCODE_C1)
@@ -222,6 +226,8 @@
 #define RVG_MASK_BGE		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
 #define RVG_MASK_BLTU		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
 #define RVG_MASK_BGEU		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_LOAD		(RV_INSN_OPCODE_MASK)
+#define RVG_MASK_STORE		(RV_INSN_OPCODE_MASK)
 #define RVC_MASK_C_BEQZ		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
 #define RVC_MASK_C_BNEZ		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
 #define RVC_MASK_C_EBREAK	0xffff
@@ -262,6 +268,8 @@ __RISCV_INSN_FUNCS(c_ebreak, RVC_MASK_C_EBREAK, RVC_MATCH_C_EBREAK)
 __RISCV_INSN_FUNCS(ebreak, RVG_MASK_EBREAK, RVG_MATCH_EBREAK)
 __RISCV_INSN_FUNCS(sret, RVG_MASK_SRET, RVG_MATCH_SRET)
 __RISCV_INSN_FUNCS(fence, RVG_MASK_FENCE, RVG_MATCH_FENCE);
+__RISCV_INSN_FUNCS(load, RVG_MASK_LOAD, RVG_MATCH_LOAD);
+__RISCV_INSN_FUNCS(store, RVG_MASK_STORE, RVG_MATCH_STORE);
 
 /* special case to catch _any_ system instruction */
 static __always_inline bool riscv_insn_is_system(u32 code)
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 7642704c7f184..04a9d3aed4647 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -74,7 +74,7 @@ static u32 riscv_instruction_at(void *p)
 	return (u32)parcel[0] | (u32)parcel[1] << 16;
 }
 
-static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 auipc_insn,
+static void riscv_alternative_fix_auipc_pair(void *ptr, u32 auipc_insn,
 					     u32 jalr_insn, int patch_offset)
 {
 	u32 call[2] = { auipc_insn, jalr_insn };
@@ -123,14 +123,15 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
 		if (riscv_insn_is_auipc(insn) && i < num_insn - 1) {
 			u32 insn2 = riscv_instruction_at(alt_ptr + (i + 1) * sizeof(u32));
 
-			if (!riscv_insn_is_jalr(insn2))
+			if (!riscv_insn_is_jalr(insn2) &&
+			    !riscv_insn_is_load(insn2))
 				continue;
 
-			/* if instruction pair is a call, it will use the ra register */
-			if (RV_EXTRACT_RD_REG(insn) != 1)
+			if (RV_EXTRACT_RD_REG(insn) != RV_EXTRACT_RS1_REG(insn2))
 				continue;
 
-			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
+			/* insn2 use rd of insn as rs1, patch it */
+			riscv_alternative_fix_auipc_pair(alt_ptr + i * sizeof(u32),
 							 insn, insn2, patch_offset);
 			i++;
 		}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
