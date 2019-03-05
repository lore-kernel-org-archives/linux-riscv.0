Return-Path: <SRS0=mVee=RI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CB1C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2019 03:24:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19FA02082C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2019 03:24:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qHG1Ojrp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19FA02082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odc+g5midYPsEtoF+wmVLYaHY0LGEElozHF+2T69XYE=; b=qHG1OjrppBy7eA
	jEtSwykxXxi+D4XwX5q0oXN3OiYQO0Pw4Psl0Cr6xapUesIghWisYhp+9gyGSj7/UP/lxiAJj/vgn
	Z1mBdrHbZg0K1QDd/kt5OazJY7Tdp3oES4qWYnYw0Pt+1lF2OL+X0qQvF388l+Cq1WKLorD75LCFG
	ZCXjF8P2qGUCm0MXdt/EWqS82zX5v32HuuZLHqiBFWZ268gOpdpfs5NXIl6+T6GMWgQmKtmGFiCcx
	I8dF2sQUZXDl8nTVsqvw6g6puf+ZBp5OF4jQt62S0cJO28X2qGXbsayVGvlOrn4f28hG0YnWeDRtT
	jCK6k+hdmiBo3jyi0BKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h10gU-0005so-63; Tue, 05 Mar 2019 03:24:02 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h10gQ-0005rl-Ik
 for linux-riscv@lists.infradead.org; Tue, 05 Mar 2019 03:24:00 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x253Mmx5044059;
 Tue, 5 Mar 2019 11:22:48 +0800 (GMT-8)
 (envelope-from vincentc@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Tue, 5 Mar 2019
 11:23:48 +0800
From: Vincent Chen <vincentc@andestech.com>
To: <palmer@sifive.com>, <aou@eecs.berkeley.edu>, <ebiederm@xmission.com>,
 <jimw@sifive.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] riscv: support trap-based WARN()
Date: Tue, 5 Mar 2019 11:23:33 +0800
Message-ID: <1551756215-22299-2-git-send-email-vincentc@andestech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551756215-22299-1-git-send-email-vincentc@andestech.com>
References: <1551756215-22299-1-git-send-email-vincentc@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x253Mmx5044059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_192358_868266_72601732 
X-CRM114-Status: UNSURE (   7.28  )
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

The WARN() related function will trigger a debug exception. This can help
developers to analyze the cause of WARN() because if the debugger is
connected, the control flow will be transferred to debugging
environment.

Signed-off-by: Vincent Chen <vincentc@andestech.com>
---
 arch/riscv/include/asm/bug.h |   28 ++++++++++++++++++----------
 1 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index bfc7f09..4d906d8 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -38,38 +38,46 @@
 #define __BUG_ENTRY			\
 	__BUG_ENTRY_ADDR "\n\t"		\
 	__BUG_ENTRY_FILE "\n\t"		\
-	RISCV_SHORT " %1"
+	RISCV_SHORT " %1\n\t"		\
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
-do {								\
+#define __BUG_FLAGS(flags) do {					\
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
-- 
1.7.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
