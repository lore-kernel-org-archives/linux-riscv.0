Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831D2C3ABCC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 12:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VBtPN+DevKw7S3DaJAFT2dPenXWXr47pj2DpcSUZlcY=; b=QcqHzhfdZC6OT3
	kTDThTkT5XC9mLfHB5nF9fkAU9HUcv5JdAuD3rMU6GtrsT+tD3kRywW97i10fQdv3wfUIs6b24ubO
	znTngQm5SgUrPe1mShKqCJT0Fk+EAz7fPOLEi7vnDC5j8+F+V6YXESTWausAOqkaSGxYw+gMnJ5OO
	CxD+8BaMuXS93CxscET8JVUZAl68CbjfbvyYimkKB0jdMkUORltL+La56mW48oIugnAaioRZO6fR0
	rSNNs4/ekh3x+Mb6jg8djW7xnMlzckMHrrxzCagnEdUbfuqRLzrM046PaytGLo3XqaqJINq1Kcgx5
	gaX+CZx05cuqNW+PYiYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB4b-0000000F1aA-0rmQ;
	Wed, 14 May 2025 12:18:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8Zm-0000000EhAO-2UOJ
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 09:39:00 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vc7hFN2UqqM5rL7Gk36K+iB7d3AnRHAfrGO+aBpYAbA=;
	b=efv2uWjtPfvjaXUpGVsRwNAfTGMqfj2p+X46OY3UwsRmp4vQRvFmgCitAJpWQdX8yW3QQc
	jIpI7OrjFWP6/togPpFhu90NfDL3PbODybFCcL6sNG22rqwkGWAMS+xBFg20dgWEn5L8Ht
	sT+CsaCdYRfnR3+2acR4snS7Cyk3rtzCbyUWuP0Nh9HQjOwBGFhDHnkz91rKWvrOOrGr70
	oP6q9VDqoJfDqoaiEKu9zGS3LAyPAwEU/j3/55RObcczCZav9fLx9vJe4gfn288z3e4JZ8
	7Lo1Jy6zB0Qr4sjiw2clzLjBGvoEY13lqrZ9GAE2r1KL2rkbffPcHsaS+qp30Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vc7hFN2UqqM5rL7Gk36K+iB7d3AnRHAfrGO+aBpYAbA=;
	b=HOc7v3q09eAvQ4EwOjaF0mpWHZX7RoikzXVwKmIM97Tlf45X3InmsIVNEoDkdOwatowuZa
	3Uc0ej2t4BAAF2DQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 01/11] riscv: kprobes: Move branch_rs2_idx to insn.h
Date: Wed, 14 May 2025 11:38:40 +0200
Message-Id: <107d4a6c1818bf169be2407b273a0483e6d55bbb.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_023858_779458_0C4318FB 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

Similar to other instruction-processing macros/functions, branch_rs2_idx
should be in insn.h.

Move it into insn.h as RV_EXTRACT_RS2_REG. This new name matches the style
in insn.h.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/insn.h            | 5 +++++
 arch/riscv/kernel/probes/simulate-insn.c | 5 +----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 7c65fc8baeed..4a26cef3b5c0 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -64,6 +64,7 @@
 #define RVG_RS2_OPOFF		20
 #define RVG_RD_OPOFF		7
 #define RVG_RS1_MASK		GENMASK(4, 0)
+#define RVG_RS2_MASK		GENMASK(4, 0)
 #define RVG_RD_MASK		GENMASK(4, 0)
 
 /* The bit field of immediate value in RVC J instruction */
@@ -450,6 +451,10 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 	({typeof(x) x_ = (x); \
 	(RV_X_mask(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
 
+#define RV_EXTRACT_RS2_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_mask(x_, RVG_RS2_OPOFF, RVG_RS2_MASK)); })
+
 #define RV_EXTRACT_RD_REG(x) \
 	({typeof(x) x_ = (x); \
 	(RV_X_mask(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index 6c166029079c..77be381bb8b4 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -121,9 +121,6 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *re
 #define branch_rs1_idx(opcode) \
 	(((opcode) >> 15) & 0x1f)
 
-#define branch_rs2_idx(opcode) \
-	(((opcode) >> 20) & 0x1f)
-
 #define branch_funct3(opcode) \
 	(((opcode) >> 12) & 0x7)
 
@@ -157,7 +154,7 @@ bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *r
 	unsigned long rs2_val;
 
 	if (!rv_insn_reg_get_val(regs, branch_rs1_idx(opcode), &rs1_val) ||
-	    !rv_insn_reg_get_val(regs, branch_rs2_idx(opcode), &rs2_val))
+	    !rv_insn_reg_get_val(regs, RV_EXTRACT_RS2_REG(opcode), &rs2_val))
 		return false;
 
 	offset_tmp = branch_offset(opcode);
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
