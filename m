Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2853C606A31B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 07:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DKfv3m+y;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=uLdonLlM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:From:Cc:Mime-Version:Message-Id
	:Subject:In-Reply-To:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mvs5W9g2pJKQdAUcDZxqRi7y5UE0RNSaE30ViySEruQ=; b=DKfv3m+yu3Ok9elbcZ+pSGnZiv
	4Vercw76/huhvt7S7OvOdxAKPpOOYAESEULDzewlNV0Y8GA9DnGK4YKKA++3F3cJ+RYVO0ehPvdQZ
	0wXtFb0CBEFkmZHYqPtSVFgZxGUWyYkQaA1wf0DqHpLkQWnCG8uB0zQ3RsnIRbBzLamYhRxMGKRdF
	21g3ghj26tJKl15dg3/r/YVKXwaCtQbsQWEhaTBGqMO84/k8SEHh7C0lfWjGJKNdUDh27p4JgCHKH
	dtCeSeuo3kJiDaRJd/Ct4B7qExGs3Tv5KpgPOGDK1KANKjBVj+/jG1FajFI/fhkeDFpGDIqV15kNY
	t5FwCsDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVsA-00000004cex-30Vr;
	Wed, 04 Nov 2026 07:57:30 +0000
Received: from va-2-35.ptr.blmpb.com ([209.127.231.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVs5-00000004ccY-2V7i
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 07:57:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1793779037; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=HfVci3L+4JmfyeTH4UZuJwbhFq5bkU7AT+EsPzeUS6I=;
 b=uLdonLlMtYe/O5vj05T1VeiMbUyKepDw/K2kzoqoWrlCIRwSURkQTMt8TJI4FZCF13PmTo
 ieXjo1byo1qQIytOTMrZ5FizaLvr//+732mayPUML8RnvOLqXfxMbDaEUeGghxXeS3oZo4
 GJGYQ8JCK1s/UUY9BBV1PTnDEWSVmTfWNQEmY/Z1pkDUS6eWkAZE1xVY0JMs73Yvqthzsi
 G+ZK6++sk4e9OOawtDyVz1TFVj6gk5muZvldJZ7gM8KfuUCx68Q+LziY9c4dn/EbJCfglm
 26vfAnXr8kyjMqHEEC1xIaWrIOhf+LoUz/eF1F2vXWTmJyuGKFJ8c4iVJtJODA==
References: <20261104075706.73657-1-yang.yicong@picoheart.com>
Received: from G9WYR9K0VW.bytedance.net ([61.141.241.113]) by smtp.feishu.cn with ESMTPS; Wed, 04 Nov 2026 15:57:14 +0800
In-Reply-To: <20261104075706.73657-1-yang.yicong@picoheart.com>
Subject: [PATCH v6 2/5] riscv: insn: Support decoding of CBO instructions
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Message-Id: <20261104075706.73657-3-yang.yicong@picoheart.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26aeae55b+00b5e9+lists.infradead.org+yang.yicong@picoheart.com>
X-Mailer: git-send-email 2.54.0
Cc: <conor@kernel.org>, <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<alex@ghiti.fr>, <cleger@meta.com>, <geshijian@picoheart.com>, 
	<niehaitao@picoheart.com>, <cuiyunhui@bytedance.com>, 
	<gaohan@iscas.ac.cn>, <yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
Date: Wed,  4 Nov 2026 15:57:03 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_235725_708606_1A88B53F 
X-CRM114-Status: UNSURE (   7.02  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add definitions for decoding CBO instructions. Rename
RVG_OPCODE_FENCE to RVG_OPCODE_MISC_MEM as spec defines
it as MISC-MEM and it's also used by CBO instructions.

Tested-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
 arch/riscv/include/asm/insn.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 6fe5eb487c45..0fe81a4ca062 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -12,6 +12,7 @@
 #define RV_INSN_FUNCT3_OPOFF	12
 #define RV_INSN_OPCODE_MASK	GENMASK(6, 0)
 #define RV_INSN_OPCODE_OPOFF	0
+#define RV_INSN_FUNCT12_MASK	GENMASK(31, 20)
 #define RV_INSN_FUNCT12_OPOFF	20
 
 #define RV_ENCODE_FUNCT3(f_)	(RVG_FUNCT3_##f_ << RV_INSN_FUNCT3_OPOFF)
@@ -135,7 +136,7 @@
 #define RVC_C2_RS1_MASK		GENMASK(4, 0)
 
 /* parts of opcode for RVG*/
-#define RVG_OPCODE_FENCE	0x0f
+#define RVG_OPCODE_MISC_MEM	0x0f
 #define RVG_OPCODE_AUIPC	0x17
 #define RVG_OPCODE_BRANCH	0x63
 #define RVG_OPCODE_JALR		0x67
@@ -171,6 +172,7 @@
 #define RVG_FUNCT3_JALR		0x0
 #define RVG_FUNCT3_BEQ		0x0
 #define RVG_FUNCT3_BNE		0x1
+#define RVG_FUNCT3_CBO		0x2
 #define RVG_FUNCT3_BLT		0x4
 #define RVG_FUNCT3_BGE		0x5
 #define RVG_FUNCT3_BLTU		0x6
@@ -186,12 +188,14 @@
 #define RVC_FUNCT4_C_EBREAK	0x9
 
 #define RVG_FUNCT12_EBREAK	0x1
+#define RVG_FUNCT12_CBO_CLEAN	0x1
+#define RVG_FUNCT12_CBO_FLUSH	0x2
 #define RVG_FUNCT12_SRET	0x102
 
 #define RVG_MATCH_AUIPC		(RVG_OPCODE_AUIPC)
 #define RVG_MATCH_JALR		(RV_ENCODE_FUNCT3(JALR) | RVG_OPCODE_JALR)
 #define RVG_MATCH_JAL		(RVG_OPCODE_JAL)
-#define RVG_MATCH_FENCE		(RVG_OPCODE_FENCE)
+#define RVG_MATCH_FENCE		(RVG_OPCODE_MISC_MEM)
 #define RVG_MATCH_BEQ		(RV_ENCODE_FUNCT3(BEQ) | RVG_OPCODE_BRANCH)
 #define RVG_MATCH_BNE		(RV_ENCODE_FUNCT3(BNE) | RVG_OPCODE_BRANCH)
 #define RVG_MATCH_BLT		(RV_ENCODE_FUNCT3(BLT) | RVG_OPCODE_BRANCH)
-- 
2.54.0 (Apple Git-157)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
