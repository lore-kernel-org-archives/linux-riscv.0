Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F43C531F9
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 09:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Cc:To:References:
	Mime-Version:Message-Id:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JFK3HBGgUyosIKMqFv/IYm1oZE6x8bxRB4CIk/kUtXA=; b=1QoycjIvDvDj5xTzQCY0Kx0i23
	s5zmpgC15V7+ZdCQQePq/M3joOLidtoxi/tCzuF+xvRQGYjbQq8QZeZZigSnbFdj1lxuQiIaTtrQF
	bZTDrnv60CVGUcaXapY3f7NRNSJAa/oAUNYhaYXSPMyDWIj9Ra5z3aUrMT87Ug306QiqRJ9qSnDs5
	pUmR83w8jiK1xt3t2r8+5NNmNvKQURvBbyB9/ddNZ5Fr66CQHQH+wXxVOvlZLbOB4YGkvtmQQLOBO
	7uSgxOgG8Arq3EV3SOoB7LP+fE/LL6gRHUgYYVqwueDliGGNSp1VvaFtbia/Xy4zOQmf4Ere+jyKn
	XabNdqfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeOh-00000004s48-19Rb;
	Tue, 28 Jul 2026 09:46:51 +0000
Received: from va-2-30.ptr.blmpb.com ([209.127.231.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeOZ-00000004s06-3nex
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 09:46:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1785231999; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=7ndpDd8Fdqn6Wxv4jk2isOF3MG994mWS9xm/BxHrg2M=;
 b=HQEOMhEtwp+LKxPid4Kd+7GKHG9Lye981VeMpCS38KFXtzOocvIYsXagQYeeSXhQaZs3Qo
 SSG0cYMiRwEV7wx1nQbgEiHwC4tblPnJ2litoKLsagT3hwhAH1xyTJCXu1dvElrPdtOHJM
 r/6aY1hh3wYCDHUcnpKzGxf6lyfspLTyARdj3FiiIYrowa8e6neAsffrAFBFv9wmpZYM+5
 VvPlQBqXrNxdOON3h2hCpg6QwTY/w9Mrxvr5uLKlu4NfJrhEq2QZ7sy8KFLg+VrGWUwnal
 cELeVrJzusYvswbxXnQa/QCAR/8NsTUyLqYHeNJoCCOERW1hQ/zFtwew1mo3Kw==
From: "Yicong Yang" <yang.yicong@picoheart.com>
In-Reply-To: <20260728094627.94975-1-yang.yicong@picoheart.com>
Message-Id: <20260728094627.94975-4-yang.yicong@picoheart.com>
Mime-Version: 1.0
References: <20260728094627.94975-1-yang.yicong@picoheart.com>
X-Lms-Return-Path: <lba+26a687a7d+3930a8+lists.infradead.org+yang.yicong@picoheart.com>
X-Mailer: git-send-email 2.50.1
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
Cc: <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>, <yang.yicong@picoheart.com>
Subject: [PATCH v2 3/6] riscv: insn: Support decoding of CBO instructions
Date: Tue, 28 Jul 2026 17:46:24 +0800
Received: from G9WYR9K0VW.bytedance.net ([58.250.106.101]) by smtp.feishu.cn with ESMTPS; Tue, 28 Jul 2026 17:46:36 +0800
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_024644_048833_AEA3FD4D 
X-CRM114-Status: UNSURE (   6.76  )
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
