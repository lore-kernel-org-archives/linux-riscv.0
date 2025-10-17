Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E23CCD199
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 16:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ty+6JVcb2Y+AJydTel2zIySvd5oEPjIl1gAOH7HYSyI=; b=GGZNJOuTUp1w0d
	HKL0J51A9eOCKvi33r0MYUs8vxFnG9ECBNQFGk10f/fpYQd45fh0w7kNJv8mATQIeaMoRKGupBB1b
	u5GY9ARvr7RUrVfqhlD/L7gq59/kxu4AMt4fr5aNKBavAT32lAttEpf5O/VTdy8an/2rflWSdK3lY
	k3hxeZKC95A/OxENuKDwKUxRbdGe1XIHSfLX3ZmlM8ok3RXJmpYfii3Y3WkhC/2Qqiq+IMrQ6De6x
	HIZuZu5zAjQAabjkgXKIvTKnZEmFHNeO9CAMwvDVvLmoZcgIgCMN0r8bJxiO7k0ZzLFb0dvXQAIYe
	nGSbXiBN8Bzx9ruyFUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9njv-00000008WP3-2zPB;
	Fri, 17 Oct 2025 16:55:39 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9njs-00000008WOH-4B1X
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 16:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=S26scI1RaRDhZbQ8e/uTT22q3DQniQvBR99tKB2Z1BU=; b=bc073HTx+Pdu60
	36xiqzgMIXTwO7P4NUIAm75N96JZsjouxMrm23CLvyPileUwPa3nGaUsVin1+kn6AublQHVLqcjZE
	vuduAozQ+rIk5MMI+211g7UpiarvLk2t4wPcPX+Ewql/jgNyFlkZl7/RwYtZjAo0OVT3CYGti7OsB
	uozFZV/xGA1Df7xnxH0nPugCeuh/hsZcQVeq0IqBN9vK16JEWUEYQevYrnSkgAMc6s2shiIlemqyB
	4NysmWAproUii+TTYcgK53WQk2RRTJYmqv8qsLSMhHh968OJWoyuGmgPBrY1FZGVsppti0uHgVaFn
	GCgVhaI79GMmBkU8crfg==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1v9njl-005deO-9V; Fri, 17 Oct 2025 17:55:29 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1v9njl-00000002wbk-06cr;
	Fri, 17 Oct 2025 17:55:29 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ajones@ventanamicro.com,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] riscv: asm: use .insn for making custom instructioons
Date: Fri, 17 Oct 2025 17:55:27 +0100
Message-Id: <20251017165527.701934-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_095537_140780_5805478D 
X-CRM114-Status: UNSURE (   8.87  )
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

Using .word breaks with big endian builds, making something which
is not a valid or worse an instruction or pair that does something
which is not intended.

It would seem sensible to add an ASM_INSN() wrapper for anyone to
use for hand assembly of instructions.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/include/asm/asm.h      | 6 ++++++
 arch/riscv/include/asm/insn-def.h | 8 ++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 8bd2a11382a3..c92f0ff51ffa 100644
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
index c9cfcea52cbb..35b5024db0fc 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -256,10 +256,10 @@
 	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
 	       SIMM12((offset) & 0xfe0), RS1(base))
 
-#define RISCV_PAUSE	".4byte 0x100000f"
-#define ZAWRS_WRS_NTO	".4byte 0x00d00073"
-#define ZAWRS_WRS_STO	".4byte 0x01d00073"
-#define RISCV_NOP4	".4byte 0x00000013"
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
