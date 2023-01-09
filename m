Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A6EC54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 18:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FowlnAXeDZch+VlKxZQoi83Jaepqky4ENviiIKF0l7c=; b=X62CfTzTKKs9Zw
	2GZ6SUevyFKs1wbZBZOwuvb18P24k0l3PwNEp3kbLXeJ2tE4pg080JJ8OPD6Z0H3bjRWZNDLj2h6B
	28uKgD022viEnlkaUbSsYVDjii3L+fJjyUPYvg9z5ilUh3vZxqRMinrmebEvudm0/w2+UDUts3EPQ
	Z9WammT9Su54JjcgCT9i/F8D3lng6bW6dcnz6cU9sHwCPC/JFC8iFD5VwQdNKRiLzd2xsvm0rnDi2
	1CBlqvBKcRUpRGUAElhvyqn1S4fhzH3ElFb4WGOBV3kIdjw7XMxdqlEYouQQ0rIJmz1v6j7+b5Hih
	JLa7pcmHYCauQB6XYLIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEwrL-003HFj-M3; Mon, 09 Jan 2023 18:26:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEwio-003DW1-UJ
	for linux-riscv@bombadil.infradead.org; Mon, 09 Jan 2023 18:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fYtHf1WMpqGCMN6ig5IFLz8FjZsLpTc5h53lmE7xqq4=; b=KACl+gTJ8Rgoc78DeDdyF4SjdD
	MUrAyDWN/8TvD/2JmZGhsTpQVWWQkvkdjCCLfnox3FPobdFKRTRL2Ekd1T0dqmOwm0IUiNTJzPcmk
	SaqIbP5zWLLo9FSZ7NNQxnTM4tzREAWPkb4as+FywyveRcaHY6DPeJ5WxCKeh4oa3H1yHQmzHwT8F
	YGdLKka4/5v1MK64U9ABUUjxtPFR7kQ4Dv82LRTCXj1fQh4RyQFFI2ULgZkx/4BUqRMlOB65P9jvF
	NPY75BNNqDRbCNqL3G8JOYlO1BKWMrIrih2EKJ3QstFRO+hw7Mzg/kopkuMmdx8zrkoJBDzXvRSQG
	8HyAPXqQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pEwib-002p21-1I
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jan 2023 18:18:01 +0000
Received: from wf0783.dip.tu-dresden.de ([141.76.183.15] helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pEwib-0005hU-CS; Mon, 09 Jan 2023 19:17:57 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v4 1/5] RISC-V: move some stray __RISCV_INSN_FUNCS definitions from kprobes
Date: Mon,  9 Jan 2023 19:17:51 +0100
Message-Id: <20230109181755.2383085-2-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230109181755.2383085-1-heiko@sntech.de>
References: <20230109181755.2383085-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_181757_506717_6306E878 
X-CRM114-Status: GOOD (  12.79  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

The __RISCV_INSN_FUNCS originally declared riscv_insn_is_* functions inside
the kprobes implementation. This got moved into a central header in
commit ec5f90877516 ("RISC-V: Move riscv_insn_is_* macros into a common header").

Though it looks like I overlooked two of them, so fix that. FENCE itself is
an instruction defined directly by its own opcode, while the created
riscv_isn_is_system function covers all instructions defined under the SYSTEM
opcode.

Fixes: ec5f90877516 ("RISC-V: Move riscv_insn_is_* macros into a common header")
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/insn.h            | 10 ++++++++++
 arch/riscv/kernel/probes/simulate-insn.h |  3 ---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 98453535324a..0455b4dcb0a7 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -128,6 +128,7 @@
 #define RVC_C2_RD_OPOFF		7
 
 /* parts of opcode for RVG*/
+#define RVG_OPCODE_FENCE	0x0f
 #define RVG_OPCODE_AUIPC	0x17
 #define RVG_OPCODE_BRANCH	0x63
 #define RVG_OPCODE_JALR		0x67
@@ -163,6 +164,7 @@
 #define RVG_MATCH_AUIPC		(RVG_OPCODE_AUIPC)
 #define RVG_MATCH_JALR		(RV_ENCODE_FUNCT3(JALR) | RVG_OPCODE_JALR)
 #define RVG_MATCH_JAL		(RVG_OPCODE_JAL)
+#define RVG_MATCH_FENCE		(RVG_OPCODE_FENCE)
 #define RVG_MATCH_BEQ		(RV_ENCODE_FUNCT3(BEQ) | RVG_OPCODE_BRANCH)
 #define RVG_MATCH_BNE		(RV_ENCODE_FUNCT3(BNE) | RVG_OPCODE_BRANCH)
 #define RVG_MATCH_BLT		(RV_ENCODE_FUNCT3(BLT) | RVG_OPCODE_BRANCH)
@@ -182,6 +184,7 @@
 #define RVG_MASK_AUIPC		(RV_INSN_OPCODE_MASK)
 #define RVG_MASK_JALR		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
 #define RVG_MASK_JAL		(RV_INSN_OPCODE_MASK)
+#define RVG_MASK_FENCE		(RV_INSN_OPCODE_MASK)
 #define RVC_MASK_C_JALR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
 #define RVC_MASK_C_JR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
 #define RVC_MASK_C_JAL		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
@@ -233,6 +236,13 @@ __RISCV_INSN_FUNCS(c_bnez, RVC_MASK_C_BNEZ, RVC_MATCH_C_BNEZ)
 __RISCV_INSN_FUNCS(c_ebreak, RVC_MASK_C_EBREAK, RVC_MATCH_C_EBREAK)
 __RISCV_INSN_FUNCS(ebreak, RVG_MASK_EBREAK, RVG_MATCH_EBREAK)
 __RISCV_INSN_FUNCS(sret, RVG_MASK_SRET, RVG_MATCH_SRET)
+__RISCV_INSN_FUNCS(fence, RVG_MASK_FENCE, RVG_MATCH_FENCE);
+
+/* special case to catch _any_ system instruction */
+static __always_inline bool riscv_insn_is_system(u32 code)
+{
+	return (code & RV_INSN_OPCODE_MASK) == RVG_OPCODE_SYSTEM;
+}
 
 /* special case to catch _any_ branch instruction */
 static __always_inline bool riscv_insn_is_branch(u32 code)
diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
index a19aaa0feb44..61e35db31001 100644
--- a/arch/riscv/kernel/probes/simulate-insn.h
+++ b/arch/riscv/kernel/probes/simulate-insn.h
@@ -12,9 +12,6 @@
 		}							\
 	} while (0)
 
-__RISCV_INSN_FUNCS(system,	0x7f, 0x73);
-__RISCV_INSN_FUNCS(fence,	0x7f, 0x0f);
-
 #define RISCV_INSN_SET_SIMULATE(name, code)				\
 	do {								\
 		if (riscv_insn_is_##name(code)) {			\
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
