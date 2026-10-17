Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4853DCCA463
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 08:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:Message-Id:To:From:
	Date:In-Reply-To:Mime-Version:Cc:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i6qWnWmwtrXstiKQgn5ENHHBHk+GL1ca3t6a84KLX38=; b=wfcI1SM1wcJ86C
	XeMfxddft8YVSHaSS9dBX/tq7zHXjKUCQN0EohHdYqrEPhZ2t+phi06e1mzb9Rx4er7Ozo/bPsnAv
	pzEYEYutDN4vbGz6IGbybLNUsiBPe1Asp7qQoev/wgu1MTA8/jyt5SygXCIbg2FFKTRYUi3bEWo5q
	G5guBlll5K2ibDO7mRHGxWNYLBni842gLlkLkaE0sOyOX0wWwvBvHNWARCDUxtEDBPdPWpBGk2YEQ
	oBmuSSebE05gIQ9zrHFBpPm6Mz9LiCnZHJkB8kwmjVd1KGC6Smh7UZcPymu7XdJlq6TS3OWFTo8Co
	jIdvr9FuaixIBUwlHryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHzp5-00000004ZfF-0fPH;
	Sat, 17 Oct 2026 08:31:23 +0000
Received: from va-2-28.ptr.blmpb.com ([209.127.231.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHzoy-00000004Zbv-2LaO
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 08:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1792225870; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=YCnA7zBqcNaq8jnmICjpEvT0fhskQoni/wGpVqUlXY0=;
 b=wzbxtoCzjHF1J/p17hrX6wyAoxxLvA1MEsavanRTzCs62k1Xe0scNs4RjQ6awKhzm79gkU
 XdSuYZOJdhPwiN+2nN1qX6SMRcJOIb96IaeslOmANdQSKSPxBKC6FsYM410FXnSRt+7NFE
 kAnr2LjXIHK4DbzilapVwcsV78G3OAixfAU8MSlWiUxCqZ64zYRwmJzQrAXkP3FmJJ7ORz
 PMHsYZ03SS0J81DKJaiEJpQ/W3f8d2uEILxJ1uqJty8HHcUmNiOX8jvyFNPuB/H+AW+aPp
 g8MPCh4RGmf6cKjBBxWpWDiZ1gaCftEB9sT5kqItwgEHMie9MiGe1nh6mJ9zwA==
Received: from G9WYR9K0VW.bytedance.net ([58.250.106.101]) by smtp.feishu.cn with ESMTPS; Sat, 17 Oct 2026 16:31:08 +0800
X-Mailer: git-send-email 2.54.0
Cc: <conor@kernel.org>, <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<alex@ghiti.fr>, <andrew.jones@oss.qualcomm.com>, <cleger@meta.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>, <yang.yicong@picoheart.com>
Mime-Version: 1.0
In-Reply-To: <20261017083100.40157-1-yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Date: Sat, 17 Oct 2026 16:30:57 +0800
From: "Yicong Yang" <yang.yicong@picoheart.com>
X-Lms-Return-Path: <lba+26ad3324c+a58af2+lists.infradead.org+yang.yicong@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
Message-Id: <20261017083100.40157-3-yang.yicong@picoheart.com>
References: <20261017083100.40157-1-yang.yicong@picoheart.com>
Subject: [PATCH v5 2/5] riscv: insn: Support decoding of CBO instructions
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_013116_678070_DE929AF9 
X-CRM114-Status: UNSURE (   5.86  )
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
index 88cea321ec3d..1bb5057422ae 100644
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
