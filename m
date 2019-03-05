Return-Path: <SRS0=mVee=RI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E691AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2019 03:24:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B50852082C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2019 03:24:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o2HhO00o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B50852082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=woC6Liz+Q7onCB+2iSpmODYjk3FbTVnuav7I3QBluOQ=; b=o2HhO00oZ8/Ckx
	mvOCxh24CKwBbAAgZSNkvTGVlSbZFq0+69OvF+ZKbsQpTh9+B5CeAGngATOc1TTyluuebuVezS+30
	yNQyASmQ7ofvSLIQ4Y2NBiQsJzAP6rypngL4HKnIAx+v6hakCfhlz/3ehKSqjvfR0iInqCwPTVe2K
	4TgjlCQN0OAsVwuk2qV2IYJ92GvZOsakC+OkbEmLsljY+WgmAHEPVytSuyZFrUfXgSA+yX/eF6Vzj
	nzf9APC92zWH+QKVG2jfHyqcDduW9LjNIkYG06ctwpiEHfAe42saU3ahpP+cVvxBhMnRk4B24r3Pu
	hI+w8gpZWUhf/4T8l8NQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h10gY-0005wP-NC; Tue, 05 Mar 2019 03:24:06 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h10gV-0005tW-JF
 for linux-riscv@lists.infradead.org; Tue, 05 Mar 2019 03:24:05 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x253MrPA044079;
 Tue, 5 Mar 2019 11:22:53 +0800 (GMT-8)
 (envelope-from vincentc@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Tue, 5 Mar 2019
 11:23:53 +0800
From: Vincent Chen <vincentc@andestech.com>
To: <palmer@sifive.com>, <aou@eecs.berkeley.edu>, <ebiederm@xmission.com>,
 <jimw@sifive.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] riscv: Add the support for c.ebreak check in
 is_valid_bugaddr()
Date: Tue, 5 Mar 2019 11:23:34 +0800
Message-ID: <1551756215-22299-3-git-send-email-vincentc@andestech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551756215-22299-1-git-send-email-vincentc@andestech.com>
References: <1551756215-22299-1-git-send-email-vincentc@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x253MrPA044079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_192403_886873_FE226CD5 
X-CRM114-Status: UNSURE (   9.79  )
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

The macro __BUG_INSN currently is defined as the "ebreak" opcode.
The is_valid_bugaddr() function compares the instruction pointed to by
$sepc with macro __BUG_INSN to check whether the current trap exception
is caused by an "ebreak" instruction. However, this check flow is possibly
erroneous because if C extension is supported, the expected trap
instruction "ebreak" is possibly translated to "c.ebreak" by the assembler.
Therefore, it requires a mechanism to distinguish the length of the
instruction in $spec and compare it to the correct trap instruction.

Signed-off-by: Vincent Chen <vincentc@andestech.com>
---
 arch/riscv/include/asm/bug.h |    7 ++++++-
 arch/riscv/kernel/traps.c    |   20 +++++++++++++++++---
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 4d906d8..52a1fbd 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -21,7 +21,12 @@
 #include <asm/asm.h>
 
 #ifdef CONFIG_GENERIC_BUG
-#define __BUG_INSN	_AC(0x00100073, UL) /* ebreak */
+#define __INSN_LENGTH_MASK  _UL(0x3)
+#define __INSN_LENGTH_32    _UL(0x3)
+#define __COMPRESSED_INSN_MASK	_UL(0xffff)
+
+#define __BUG_INSN_32	_UL(0x00100073) /* ebreak */
+#define __BUG_INSN_16	_UL(0x9002) /* c.ebreak */
 
 #ifndef __ASSEMBLY__
 typedef u32 bug_insn_t;
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 24a9333..6423e1a 100644
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
+	return (((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32) ? 4UL : 2UL);
+}
+#endif /* CONFIG_GENERIC_BUG */
+
 asmlinkage void do_trap_break(struct pt_regs *regs)
 {
 #ifdef CONFIG_GENERIC_BUG
@@ -129,8 +140,8 @@ asmlinkage void do_trap_break(struct pt_regs *regs)
 		case BUG_TRAP_TYPE_NONE:
 			break;
 		case BUG_TRAP_TYPE_WARN:
-			regs->sepc += sizeof(bug_insn_t);
-			return;
+			regs->sepc += get_break_insn_length(regs->sepc);
+			break;
 		case BUG_TRAP_TYPE_BUG:
 			die(regs, "Kernel BUG");
 		}
@@ -149,7 +160,10 @@ int is_valid_bugaddr(unsigned long pc)
 		return 0;
 	if (probe_kernel_address((bug_insn_t *)pc, insn))
 		return 0;
-	return (insn == __BUG_INSN);
+	if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32)
+		return (insn == __BUG_INSN_32);
+	else
+		return ((insn & __COMPRESSED_INSN_MASK) == __BUG_INSN_16);
 }
 #endif /* CONFIG_GENERIC_BUG */
 
-- 
1.7.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
