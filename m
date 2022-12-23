Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D165C10F1B
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Dec 2022 07:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TvoNO9h6MWU0kRMkGoxxVoGcyCFw4aox1ulYUH8tCXM=; b=2QM2U9YZEh30F0
	u+wTiq5rd4RUPk0Xbqffa6UXToqyYtOwFISehYfYG389AyyMs628JK8c3VErQGe/FpdeaxadRFGhI
	S0CYGiQXXUINPX6p0MM10+BgmhVP21gN6Lnao8aTIWXi2+2t5VyhYSt1Z+Ldi2Yewx7QQPuWj+xy9
	KTx2s0e9tCKHkBc5PV5RMCkdOcncNOuZ0MmN+bbe5DuqsVZy6ISdcvmuLV2xrwsCwZj4n+gYpMKQY
	3JOFSeh6+ycWzMP39oH+NznjiakRFwgdTIgchFTb6IuqbeVmxCNU9hJzIb5ijgsyDOlPuiSU+aw9h
	cWf0/ZIIBhLibvK0+K+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8yyL-00FzPA-2y; Sat, 24 Dec 2022 07:29:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8rO6-00CwEO-V0
	for linux-riscv@bombadil.infradead.org; Fri, 23 Dec 2022 23:23:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=I464f9dkbgVqHp503lFDOT0bKZNuVT98dW3eYj4WHtY=; b=DmWxj904bII9W4unD4xp9+GOax
	4K9ZLFP9Zd+Z1gmVMlOGQEfdH34ml5LLTr/aMl1hBsaEse8mr+vXJLyOUY2pWPAtg0X74bRcNra+Q
	JTJqZDWf0ikLm9j3s//6AAQCmKN9HkDMB6SAd56tOWjnF+teyj3O+gwhtHa2tlrcXnIcIO/mb1Je0
	MpULpANeA9HKPuUmjRHjxDaRHjuhO1/UUp9TtTebOuVvwsm68kydAfDwDH8Icw6m5KTqBcIJFLUT8
	3IGpRZOQKlDJ0tW+pzPktbRgh3II0+1NGH96IznQ+y2qawDB0Im6G/A5XSzCY47OW8TxnbXyZ8lFc
	RY0NGDFA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1p8qIe-00ELJm-18
	for linux-riscv@lists.infradead.org;
	Fri, 23 Dec 2022 22:14:04 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p8qIZ-0002Hc-OZ; Fri, 23 Dec 2022 23:13:51 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	prabhakar.csengg@gmail.com,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	emil.renner.berthing@canonical.com,
	jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 05/12] RISC-V: add auipc elements to parse_asm header
Date: Fri, 23 Dec 2022 23:13:25 +0100
Message-Id: <20221223221332.4127602-6-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221223221332.4127602-1-heiko@sntech.de>
References: <20221223221332.4127602-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_221356_807331_6E2CAA8A 
X-CRM114-Status: UNSURE (   9.41  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

Instruction parsing should not be done in individual code, but instead
supported by central

Right now kgdb and kprobes parse instructions and at least kprobes (and
the upcoming auipc+jalr alternative fixer-function) need the auipc
instruction.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/parse_asm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/parse_asm.h b/arch/riscv/include/asm/parse_asm.h
index e8303250f598..28742eb19034 100644
--- a/arch/riscv/include/asm/parse_asm.h
+++ b/arch/riscv/include/asm/parse_asm.h
@@ -118,6 +118,7 @@
 #define RVC_C2_RD_OPOFF		7
 
 /* parts of opcode for RVG*/
+#define RVG_OPCODE_AUIPC	0x17
 #define RVG_OPCODE_BRANCH	0x63
 #define RVG_OPCODE_JALR		0x67
 #define RVG_OPCODE_JAL		0x6f
@@ -149,6 +150,7 @@
 #define RVG_FUNCT12_EBREAK	0x1
 #define RVG_FUNCT12_SRET	0x102
 
+#define RVG_MATCH_AUIPC		(RVG_OPCODE_AUIPC)
 #define RVG_MATCH_JALR		(RV_ENCODE_FUNCT3(JALR) | RVG_OPCODE_JALR)
 #define RVG_MATCH_JAL		(RVG_OPCODE_JAL)
 #define RVG_MATCH_BEQ		(RV_ENCODE_FUNCT3(BEQ) | RVG_OPCODE_BRANCH)
@@ -167,6 +169,7 @@
 #define RVC_MATCH_C_JALR	(RVC_ENCODE_FUNCT4(C_JALR) | RVC_OPCODE_C2)
 #define RVC_MATCH_C_EBREAK	(RVC_ENCODE_FUNCT4(C_EBREAK) | RVC_OPCODE_C2)
 
+#define RVG_MASK_AUIPC		(RV_INSN_OPCODE_MASK)
 #define RVG_MASK_JALR		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
 #define RVG_MASK_JAL		(RV_INSN_OPCODE_MASK)
 #define RVC_MASK_C_JALR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
