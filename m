Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0667E106FD9A
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 08:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWRajDAU8S0VHiXcPBCYVb18c1QtHX1ujGhgkPRZxVY=; b=4Pwj9mVTPx3hYl
	iMTBZ2k2U7CMNMAJ4ZshjJ96jrs+E2Z2XEw2FoGnoIEwgm0BybPOt0+76UXZimVEHSxkVhutK43gW
	N/+kFD0T7GHb15lEnUmAZEy6tAlb7QcbPn54SRi5F/QpYnXN4dJcxqJgq7nida5H8Sc8nBwMzTrvn
	7/bhqCHJPFKKNDhM0DjI0IrKGkj7iv6iU98crrwvwIlJzqjw1Xym2pP89PM37YRXY6l2ll98oU6h3
	4GEy6hasM/UBiB77o1CVdYlE3LEh9OIuCZ239l7sAtmtX0Gsno3UUPmCf+kN7Ik0nrJJ8/vOPvcKW
	5gxN79/P6ZwHmD/SpY0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yAB-0000000HIlX-4126;
	Fri, 13 Mar 2026 08:46:31 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yA9-0000000HIkj-1o9e
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 08:46:31 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-899eabc5292so22808786d6.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 01:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773391588; x=1773996388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xean22/tjFsNOsF/nOdABDf/+KIaxj5k5+75ISbAbNU=;
        b=YcgQkG5tDQkCCZAcfrtTHW8URztrhwsY4mumYFcC8uPAgZgL6t2un1lnO/UdOdXFrs
         kJP7OgHmcfXa3AEP0uIH6bCzUHtsiSLyhxnNpj9rwWVnrBVQGJQ81bqwL5V3OUsl+ecL
         PjCDaeHy3WsdAb7CfNs/+YmpTTecjJ7YRBBkIOCS3pbXeX4yRq1AOeo0jVmwqnsCP+b0
         FV9s6orIECEhgr3ckUrQ45KCjVhFNTIzDFxuoI9vVS+m/HQWW0dT+QgROt+u6ci58Dbf
         OsthMyaMxc5XO0TWs8fEGarC80ZSog+2utpa1+/S1bSV8avfIhjiiWxFycJhnRg+kC0q
         9QoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773391588; x=1773996388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xean22/tjFsNOsF/nOdABDf/+KIaxj5k5+75ISbAbNU=;
        b=mvfRicN9BHMkRqQTWONw7Q8wq9yRZkw6lhvlnbB4fM5DvLxWGvTdaYtV8aFQT7AfAI
         7opJhrYPz3ue3DMckypLeNnHYUN+/aJ0U/kO7d3ORs0QCy37/cCQNs2R7JfYzjXMEjc+
         2td4XoxcDKgfYwlHnBrXdaji9x71XIuQBBweVO0EZrKMIOz463e5Zwm/pZtG4/whBTBl
         PK3GAw8J0kLBtEGBYEXyH5q1pBkqV4egXWuP2B1Lk/1XWJ3aEOnb2QZVhW9L+AhxtoQk
         5lCsmtCam5pZHFUL4T1fXHPXhRy52JgNMY/oJyPSjGrHtvH5J37ATtW78c4oz165UyNV
         A3mw==
X-Gm-Message-State: AOJu0YzgThiSn2fCY9NZPvY2AZVNs0iAAIfHIu7UA7NjdtnbKZjGIwcx
	+dReC94fRxVa1NCQmlxZx/Xqbd4Kosv1kv5D9+JX50cr7nEqLKOfDcbRGwMcxGtO
X-Gm-Gg: ATEYQzy9pTS6ar3luNvnOp9jLi3ZeSt1QZ7y6NzY7w9bP7UK/VUrOeDTKd+p3xe3CJ5
	xDQeifzdhCeD87y7oYEPxC6v3gcUyYTJK9EEU6/Tm0wU/MIRdl8My3hUGJbn/+w9e+iqwRVa6+s
	JH0EFzVU0FZBt8S5gPoBNzOWZuISN4dLAXUkZDDy4kexnkIustKrOyTpJlgT9fApLjNPgvsWzvR
	LT8mUEHQx1tJCV6UePjBDPUMTuLgHeMgvu+u699ftpk4jB2UH3RAufGqpLExNJsAZEfK2MZItoN
	fpQVff/nRevxKOyCLI8L/AAOqQPo+7zSKZ3614K0pah/ua4wUOpANV9cRnS1pIuLRw9tPl0MmUx
	D3mHNAL/CTEEk3K+b66ebhk6tQshXi7ZPjz07m+5ZYUe7cZhXDyuA3UMUu5Ei4fTPY/GsRR5yx9
	onLqMEvF91bSHIcah6+cB4qIbR
X-Received: by 2002:ad4:5946:0:b0:89a:d41:b1c6 with SMTP id 6a1803df08f44-89a81f48ff2mr38155306d6.49.1773391587589;
        Fri, 13 Mar 2026 01:46:27 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65beb131sm50142206d6.13.2026.03.13.01.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 01:46:26 -0700 (PDT)
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
Subject: [RFC PATCH 2/6] riscv: alternatives: support auipc+load pair
Date: Fri, 13 Mar 2026 01:44:03 -0700
Message-Id: <20260313084407.29669-3-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313084407.29669-1-ganboing@gmail.com>
References: <20260313084407.29669-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_014630_304606_C1AB92BD 
X-CRM114-Status: GOOD (  13.01  )
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
