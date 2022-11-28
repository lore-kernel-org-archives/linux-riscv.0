Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DC2C43217
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 10:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oAwt45YKnWOPdsvo1MLSnwXuzoQluy5ePKsv7DYJ63A=; b=0T3S3tcDXxa4B4
	fECHWsGWKcT0YcoVSJG5Fb/AcWDDNOsJMvnpEadKHfmt2AeaIvcG3QMrxK5NGZU6cZgESFwCkYkbC
	+U4Ao91qiGt1/o1oMpYSW7FsXFjRlRifB29OJP4RSQey3YBDa98tzrjCy6frh/fqq1KPMna4eu0FC
	Kc4y22qsP9OJw4eTPVYOIwEnCoETeuGunsmmluOQwGNXFvPFgN51j2kQ+9u1IUfMuHqdcMzOndVyp
	L+AVaCsA7WPWY/War1s1yW7Kyy9pAQ5ZjOJnkFG0Wkw9dlJSv2M9U91JKKEoEUYa80bTxvNER2R4x
	XwmMbAPRS9rvPBkZlnmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbLk-0011aO-L0; Mon, 28 Nov 2022 10:26:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbLf-0011XG-Uu
	for linux-riscv@bombadil.infradead.org; Mon, 28 Nov 2022 10:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YWk4ljpE31tt2lqVeFjBnWU41codNoj8WdD5z7p5FvU=; b=SfH+2YeATXzjhunkbNN+eXvE+A
	H5HyaYE5XYVSu/YSHaLDpJGkTAYL30iQIpMXUWPVRDgbpIP1UZDQEU4ScobnyiqjdVE5Cn1DZ9MtU
	0sStskccWn23B/d4bJs0rFL0gRNZT77V9DSrvBMOFtZ7ewr5FoZSQ+PoOzCpKjHw+Yth0bY/6I0aM
	A3XFduZeCuX5um1b8x7uc6q9YRRkLf7X2yZhEAEbHfv279psfTGZUDKmI7ohOMKYPAJRhhmFQiUIF
	isUO/bMp16YzuSff3rfxAZNGDny3HkojgcS3wUz4LNT/fLxTlL6Qdid6ckUHmwAPVBs3maraQhG/P
	J9ASXHKA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbLZ-005VXm-8P
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 10:26:48 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ozbLU-0004Xi-Ix; Mon, 28 Nov 2022 11:26:40 +0100
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v2 07/13] RISC-V: add auipc elements to parse_asm header
Date: Mon, 28 Nov 2022 11:26:26 +0100
Message-Id: <20221128102632.435174-8-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128102632.435174-1-heiko@sntech.de>
References: <20221128102632.435174-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_102646_110653_D6EA6C71 
X-CRM114-Status: UNSURE (   9.38  )
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

We will want to use the opcode parsing outside kdb as well and need
at least the auipc element there.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/insn.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index bfd306f85ec7..f10cb0fdfa96 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
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
 
+#define RVG_MASK_AUIPC		RV_INSN_OPCODE_MASK
 #define RVG_MASK_JALR		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
 #define RVG_MASK_JAL		(RV_INSN_OPCODE_MASK)
 #define RVC_MASK_C_JALR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
@@ -203,6 +206,7 @@ __RISCV_INSN_FUNCS(c_jal, RVC_MASK_C_JAL, RVC_MATCH_C_JAL)
 #else
 #define riscv_insn_is_c_jal(opcode) 0
 #endif
+__RISCV_INSN_FUNCS(auipc, RVG_MASK_AUIPC, RVG_MATCH_AUIPC)
 __RISCV_INSN_FUNCS(jalr, RVG_MASK_JALR, RVG_MATCH_JALR)
 __RISCV_INSN_FUNCS(jal, RVG_MASK_JAL, RVG_MATCH_JAL)
 __RISCV_INSN_FUNCS(c_jr, RVC_MASK_C_JR, RVC_MATCH_C_JR)
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
