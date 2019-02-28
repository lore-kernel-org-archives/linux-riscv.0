Return-Path: <SRS0=nw+9=RD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76511C10F00
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 10:32:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 468B62171F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 10:32:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EAdILGSK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 468B62171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/a5spd/zLVqUfojXKJot/eocvfJD//xFbdnw0GL7FSg=; b=EAdILGSKWHg1v0
	VJkelTFlOqRRFSvys2mCdoVghpFAkY4lBvl9YhE0lpihn7tw/ZgjAOdS1+7hb+uqxoGsywDZCnG3E
	karMQYYX+guNGetz8p38CDn18pUeVfpOc4e+Othsv9JZyOmmo3eQHjwiw83tzMQkyIz7pSypjnUwM
	knxH8yYUMGKjg3uTsETjhAuUBpve4L/Pj4aEwTp7X/sBtrG+Ubr0yiueRRzGaHV5opPSzBqHT2vZJ
	bDrw0FgMr5apjjdwGeK5jggiiMgjY6/DtknNCzRKY0vD7eMWjuTOhSLU1qzo9QaEnCFxUs5ttEjwG
	mS16EXSRidRLa0Es/AwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzIz7-0000jp-5s; Thu, 28 Feb 2019 10:32:13 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzIz3-0000hw-IZ
 for linux-riscv@lists.infradead.org; Thu, 28 Feb 2019 10:32:11 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x1SAV3WW086808;
 Thu, 28 Feb 2019 18:31:03 +0800 (GMT-8)
 (envelope-from vincentc@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Thu, 28 Feb 2019
 18:31:37 +0800
From: Vincent Chen <vincentc@andestech.com>
To: <palmer@sifive.com>, <aou@eecs.berkeley.edu>, <ebiederm@xmission.com>,
 <jimw@sifive.com>, <arnd@arndb.de>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] riscv: Add the support for c.ebreak check in
 is_valid_bugaddr()
Date: Thu, 28 Feb 2019 18:31:29 +0800
Message-ID: <1551349891-22683-2-git-send-email-vincentc@andestech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551349891-22683-1-git-send-email-vincentc@andestech.com>
References: <1551349891-22683-1-git-send-email-vincentc@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x1SAV3WW086808
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_023209_879997_7EB3568F 
X-CRM114-Status: UNSURE (   9.02  )
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

The is_valid_bugaddr() function compares the instruction pointed to by
$sepc with macro __BUG_INSN to check whether the current trap exception
is caused by an "ebreak" instruction. Hence the macro __BUG_INSN is
defined as "ebreak". However, this check flow is possibly erroneous
because the expected trap instruction possibly be translated to "c.ebreak"
by assembler if C extension is supported. Therefore, it requires
a mechanism to distinguish the length of the instruction in $spec and
compare it to the correct __BUG_INSN.

By the way, I make the kernel go to die() like BUG() when the trap
type is BUG_TRAP_TYPE_WARN because currently the WARN() does not trigger
any trap exception.

Signed-off-by: Vincent Chen <vincentc@andestech.com>
---
 arch/riscv/include/asm/bug.h |    7 ++++++-
 arch/riscv/kernel/traps.c    |    8 +++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index bfc7f09..1cab7f4 100644
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
index 24a9333..deae0e5 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -129,8 +129,7 @@ asmlinkage void do_trap_break(struct pt_regs *regs)
 		case BUG_TRAP_TYPE_NONE:
 			break;
 		case BUG_TRAP_TYPE_WARN:
-			regs->sepc += sizeof(bug_insn_t);
-			return;
+			die(regs, "Kernel BUG. Kernel got an unexpected WARN trapped by ebreak");
 		case BUG_TRAP_TYPE_BUG:
 			die(regs, "Kernel BUG");
 		}
@@ -149,7 +148,10 @@ int is_valid_bugaddr(unsigned long pc)
 		return 0;
 	if (probe_kernel_address((bug_insn_t *)pc, insn))
 		return 0;
-	return (insn == __BUG_INSN);
+	if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32)
+		return insn == __BUG_INSN_32;
+	else
+		return (insn & __COMPRESSED_INSN_MASK) == __BUG_INSN_16;
 }
 #endif /* CONFIG_GENERIC_BUG */
 
-- 
1.7.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
