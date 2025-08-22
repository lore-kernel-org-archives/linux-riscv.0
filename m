Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63876CA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1STVMKmeqkFzxSyRyfVTkexjjVmPhUiGnT/meKWBGzI=; b=ujw8jYIezsxLnh
	f6xRzzDMQVOxvP/bMol47bt5oJI1u77aAAIkQ3Ckxvh69QvwlwyNCfvGQj7zyJe+srzfO7tq7+xED
	JDfwPEEhTbXB4dsKnXygfOOw3Sas7GaReGgl8R0Aw4m4Fs0/iVPfJVg+0QAwtDmLhuklvGVRdx4PM
	pGluQ6AkzlxU9q7/iHjfX4BeO49vvD5dhOOK6NeGtOr18JICYfua4evnhS5oTUjeQF9rRNs+saCOh
	KslrWWecYKFMvnzkCcFI43L0IO2wIzHU1w2djSjX8Gg4YlLVo8cbatmREnrsOlYoa0ucu+CSXZ00W
	xIY0ruJID6AZWDWW77QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphv2-00000004BUH-0RlU;
	Sat, 23 Aug 2025 06:40:04 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0b-00000003CW0-3r83
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6PCSCPqpuFp56JPOKOlVir228jVuMm2pNnRzw8GSzLY=; b=YzJJYEyWpSo3LBXSCc1zIAHGox
	k7+BpbzgjNh4kGkS0MabLXk5Y1Eq7tTDLC7ODSp+LeF7wu2mo4De2/5PzPHxU88cRnusm2Qe96zkx
	GgcN+BHa+Q+gXPj0x9rHKUK5HTHukD4ME3RZaoHn8+Rrh5bY4b7c0c3yO+RdkySvYucaw+RZGQB4r
	suRJH6jo13lQ5qax8iTtNfzWPIIuAzivlHzXR4adMY3rinr0WNlR/f9SCAqQJWjPZNUAjJrFUpDHJ
	5L5xpJeK4R10EpjAwaDCtm9+r1cyOxicrnVElgbARRVBto6Y4oJsrz8cNQ7XvZg2LLePDN6XZb0xZ
	VupAEaZg==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0U-001NH1-Jz; Fri, 22 Aug 2025 17:52:50 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DPn-34mE;
	Fri, 22 Aug 2025 17:52:50 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: -linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Javier Jardon <javier.jardon@codethink.co.uk>,
	Ben Dooks <bjdooks@gmail.com>,
	Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
	Roan Richmod <roan.richmond@codethink.co.uk>,
	Sam Grove <sgrove@mips.com>,
	Chao-ying Fu <cfu@mips.com>,
	Mukunda Aprameya <maprameya@mips.com>,
	Umesh Kalappa <ukalappa@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Kurt Martin <kmartin@mips.com>,
	allikarjuna Gouda <mgouda@mips.com>,
	Vaibhav Chauthmal <vchauthmal@mips.com>,
	wapnil Agrawal <sagrawal@mips.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 14/18] riscv: update to add ASM_INSN for .2byte instructions
Date: Fri, 22 Aug 2025 17:52:44 +0100
Message-Id: <20250822165248.289802-15-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_095257_980203_E85981F1 
X-CRM114-Status: UNSURE (   8.64  )
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

It would seem sensible to add an ASM_INSN() wrapper for anyone to
use for hand assembly of instructions.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/include/asm/asm.h      |  6 ++++++
 arch/riscv/include/asm/insn-def.h | 15 ++++-----------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index a8a2af6dfe9d..9f6245b62925 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -12,6 +12,12 @@
 #define __ASM_STR(x)	#x
 #endif
 
+#ifndef CONFIG_AS_HAS_INSN
+#define ASM_INSN(__x) ".4byte " __x
+#else
+#define ASM_INSN(__x) ".insn " __x
+#endif
+
 #if __riscv_xlen == 64
 #define __REG_SEL(a, b)	__ASM_STR(a)
 #elif __riscv_xlen == 32
diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 2a3019bc1a3b..0677d3bee40c 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -256,17 +256,10 @@
 	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
 	       SIMM12((offset) & 0xfe0), RS1(base))
 
-#ifndef CONFIG_AS_HAS_INSN
-#define RISCV_PAUSE	".4byte 0x100000f"
-#define ZAWRS_WRS_NTO	".4byte 0x00d00073"
-#define ZAWRS_WRS_STO	".4byte 0x01d00073"
-#define RISCV_NOP4	".4byte 0x00000013"
-#else
-#define RISCV_PAUSE	".insn 0x100000f"
-#define ZAWRS_WRS_NTO	".insn 0x00d00073"
-#define ZAWRS_WRS_STO	".insn 0x01d00073"
-#define RISCV_NOP4	".insn 0x00000013"
-#endif
+#define RISCV_PAUSE	ASM_INSN("0x100000f")
+#define ZAWRS_WRS_NTO	ASM_INSN("0x00d00073")
+#define ZAWRS_WRS_STO	ASM_INSN("0x01d00073")
+#define RISCV_NOP4	ASM_INSN("0x00000013")
 
 #define RISCV_INSN_NOP4	_AC(0x00000013, U)
 
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
