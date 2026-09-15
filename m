Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31610C88E53
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 08:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Subject:References:From:Cc
	:To:Message-Id:Date:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFK3HBGgUyosIKMqFv/IYm1oZE6x8bxRB4CIk/kUtXA=; b=zBhES2jxieKdus
	Bk0y/e17MvIBFJTTPGp99YF8p4GK4OjWu26Cz8P5li4oQ0hi+vagU5yk2TLpW3dqUeXG1QCLfIqhY
	wJqR6aVL7rPJoqg3UkTk/oxrw9ToAYy0i8F44iSUNqOmTBZSJNaFFKWJHUeiB8y/RhNzG50r4XHpJ
	ODMT4Zkjmf54Tt0yEJB/uR3AnrQCxOapHGFIljWc0p/MEKUGs8MBwFdwgk3ejdzCspEMLYbOzJFeO
	wcBT1elZlX1Z/GDc2sT6jHXTHqWprDDWbRZ50TzjLpT4UkeDJ2EPHgRT9beIRB9+OWF4h6qLcR0zH
	dDSdvGDpMn8t6D0373nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ocg-00000005dBU-3jTU;
	Tue, 15 Sep 2026 08:34:38 +0000
Received: from lf-2-33.ptr.blmpb.com ([101.36.218.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Oce-00000005dA6-2uRb
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 08:34:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1789461198; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=7ndpDd8Fdqn6Wxv4jk2isOF3MG994mWS9xm/BxHrg2M=;
 b=vRF/VZgnqpRBeqr575AowtSSU/fUYWeFirKRFVseAGGwuFzpzFhZMfmS2QiZd+dSriiT5s
 7VOIrpQbKs4alT6wftBEU/QUrfYM9k6LJAZgzaloa0wxD4RFpvYjZhs3aP2BIES6SbRbov
 ljHAIp0QGXNW5g5ZU/FwHgXMVVnMOoK+IS02A/9Ek8JSrF2g2n7oIotUBh5s+Up80tSYs/
 cck6dWoXlPZbjtylCKFvGiSwhFaysIV5sjQM2Ww73VJutOdQEwH6EZxsOsE0hGSoOz9ReP
 o9lG7hr9QicgtKoqx1AbCVfqTr4nnEAQJrDi7LCvUoaxzE9AqSMDfkD8c0WpUg==
In-Reply-To: <20260915083305.81913-1-yang.yicong@picoheart.com>
Date: Tue, 15 Sep 2026 16:33:02 +0800
X-Mailer: git-send-email 2.50.1
Message-Id: <20260915083305.81913-3-yang.yicong@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
Cc: <conor@kernel.org>, <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<alex@ghiti.fr>, <andrew.jones@oss.qualcomm.com>, <cleger@meta.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>, <yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Received: from G9WYR9K0VW.bytedance.net ([61.141.241.120]) by smtp.feishu.cn with ESMTPS; Tue, 15 Sep 2026 16:33:13 +0800
References: <20260915083305.81913-1-yang.yicong@picoheart.com>
X-Lms-Return-Path: <lba+26aa902ca+577435+lists.infradead.org+yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Subject: [PATCH v4 2/5] riscv: insn: Support decoding of CBO instructions
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_013436_895079_B4C0573F 
X-CRM114-Status: UNSURE (   7.14  )
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

Add definitions for decoding CBO instructions. Rename
RVG_OPCODE_FENCE to RVG_OPCODE_MISC_MEM as spec defines
it as MISC-MEM and it's also used by CBO instructions.

Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
 arch/riscv/include/asm/insn.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index c36d1dfa16c6..f6b32d8d558d 100644
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
2.50.1 (Apple Git-155)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
