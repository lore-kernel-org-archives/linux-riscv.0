Return-Path: <SRS0=nw+9=RD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5B6C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 10:32:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A2552171F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 10:32:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CZKSRMQm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A2552171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AX7G3bWMiOccA6JfJHSGvsFVJRWvk3wmTLAR4PxJr80=; b=CZKSRMQmt0qKVT
	+1GUsDbJLOrX2m3DNurgCQwvEJtH1E6DZyTs0PCmzHznoFLmRCku+xpZqiOEvVTB2+MO28b4vNfFS
	iv3MjVQ2vy2jayix2oWpfTiZbqKTARvl+Pl49L0xVisX1lyB1ZGI4gjeHbdFj7IT64zsDeYI2hQ82
	jwEyfvHBz3OtUL1Wnkb8h/2xa6QRzjpaFbVvjwgfJ6HslP5Xd+xG2AbdOqi6ye6guIEsIRKetLcEF
	k8MW4FWlX6FTD9bedA2fJ7MytB22OiLh8zGkCG+HouAVCA7s1aviCku2c/z87oA7KEQtfRqbiRXc1
	3vAka2A7jT1lPzftLt4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzIzB-0000ni-QB; Thu, 28 Feb 2019 10:32:17 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzIz8-0000kW-Pf
 for linux-riscv@lists.infradead.org; Thu, 28 Feb 2019 10:32:16 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x1SAVDs7086841;
 Thu, 28 Feb 2019 18:31:13 +0800 (GMT-8)
 (envelope-from vincentc@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Thu, 28 Feb 2019
 18:31:47 +0800
From: Vincent Chen <vincentc@andestech.com>
To: <palmer@sifive.com>, <aou@eecs.berkeley.edu>, <ebiederm@xmission.com>,
 <jimw@sifive.com>, <arnd@arndb.de>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] riscv: Make WARN() related functions able to trigger a
 trap exception
Date: Thu, 28 Feb 2019 18:31:31 +0800
Message-ID: <1551349891-22683-4-git-send-email-vincentc@andestech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551349891-22683-1-git-send-email-vincentc@andestech.com>
References: <1551349891-22683-1-git-send-email-vincentc@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x1SAVDs7086841
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_023215_150497_9C4B0D33 
X-CRM114-Status: UNSURE (   7.92  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: vincentc@andestech.com, deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This can help developers to analyze the cause of WARN() because the
control will be transferred to debugging environment if the debugger is
connected.

Signed-off-by: Vincent Chen <vincentc@andestech.com>
---
 arch/riscv/include/asm/bug.h |   27 ++++++++++++++++++---------
 arch/riscv/kernel/traps.c    |   19 ++++++++++++++++---
 2 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1cab7f4..b2aa88f 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -43,38 +43,47 @@
 #define __BUG_ENTRY			\
 	__BUG_ENTRY_ADDR "\n\t"		\
 	__BUG_ENTRY_FILE "\n\t"		\
-	RISCV_SHORT " %1"
+	RISCV_SHORT " %1  \n\t"		\
+	RISCV_SHORT " %2"
 #else
 #define __BUG_ENTRY			\
-	__BUG_ENTRY_ADDR
+	__BUG_ENTRY_ADDR "\n\t"		\
+	RISCV_SHORT " %2"
 #endif
 
-#define BUG()							\
+#define __BUG_FLAGS(flags)					\
 do {								\
 	__asm__ __volatile__ (					\
 		"1:\n\t"					\
 			"ebreak\n"				\
-			".pushsection __bug_table,\"a\"\n\t"	\
+			".pushsection __bug_table,\"aw\"\n\t"	\
 		"2:\n\t"					\
 			__BUG_ENTRY "\n\t"			\
-			".org 2b + %2\n\t"			\
+			".org 2b + %3\n\t"                      \
 			".popsection"				\
 		:						\
 		: "i" (__FILE__), "i" (__LINE__),		\
-		  "i" (sizeof(struct bug_entry)));		\
-	unreachable();						\
+		  "i" (flags),					\
+		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
+
 #endif /* !__ASSEMBLY__ */
 #else /* CONFIG_GENERIC_BUG */
 #ifndef __ASSEMBLY__
-#define BUG()							\
+#define __BUG_FLAGS(flags)					\
 do {								\
 	__asm__ __volatile__ ("ebreak\n");			\
-	unreachable();						\
 } while (0)
 #endif /* !__ASSEMBLY__ */
 #endif /* CONFIG_GENERIC_BUG */
 
+#define BUG() do {						\
+	__BUG_FLAGS(0);						\
+	unreachable();						\
+} while (0)
+
+#define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
+
 #define HAVE_ARCH_BUG
 
 #include <asm-generic/bug.h>
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index dee0e5e..023208b 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -118,6 +118,17 @@ asmlinkage void name(struct pt_regs *regs)				\
 DO_ERROR_INFO(do_trap_ecall_m,
 	SIGILL, ILL_ILLTRP, "environment call from M-mode");
 
+#ifdef CONFIG_GENERIC_BUG
+static inline unsigned long get_break_insn_length(unsigned long pc)
+{
+	bug_insn_t insn;
+
+	if (probe_kernel_address((bug_insn_t *)pc, insn))
+		return 0;
+	return ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32) ? 4UL : 2UL;
+}
+#endif /* CONFIG_GENERIC_BUG */
+
 asmlinkage void do_trap_break(struct pt_regs *regs)
 {
 #ifdef CONFIG_GENERIC_BUG
@@ -129,7 +140,8 @@ asmlinkage void do_trap_break(struct pt_regs *regs)
 		case BUG_TRAP_TYPE_NONE:
 			break;
 		case BUG_TRAP_TYPE_WARN:
-			die(regs, "Kernel BUG. Kernel got an unexpected WARN trapped by ebreak");
+			regs->sepc += get_break_insn_length(regs->sepc);
+			break;
 		case BUG_TRAP_TYPE_BUG:
 			die(regs, "Kernel BUG");
 		}
@@ -149,12 +161,13 @@ int is_valid_bugaddr(unsigned long pc)
 	if (probe_kernel_address((bug_insn_t *)pc, insn))
 		return 0;
 	if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32)
-		return insn == __BUG_INSN_32;
+		return (insn == __BUG_INSN_32);
 	else
-		return (insn & __COMPRESSED_INSN_MASK) == __BUG_INSN_16;
+		return ((insn & __COMPRESSED_INSN_MASK) == __BUG_INSN_16);
 }
 #endif /* CONFIG_GENERIC_BUG */
 
+
 void __init trap_init(void)
 {
 	/*
-- 
1.7.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
