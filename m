Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B85CC43143
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 14:23:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C683C206B2
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 14:23:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yszrevsa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C683C206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=oBMLcYzH3RACmIRLMxjjxygsv7I0SU76NyNE1IBqY+U=; b=Ysz
	revsaawVe5XU0ofOgpLqDnP09fmQjQfcpPvxoIoGSYX4DXX9O8hrZ3nUbLRH4yBJb9ZCASZ2TIqYf
	WCswQLeuea636KjBWtm/UcjYatCuVi7xjqgavHarh3HUh7A5apEMVnBsDXGt8Je3h289XOyw3gCR/
	rbjTy0QubxPjVWj1liVCwJ9qQu+P2c4+HCABKK2lLi3jpWm/RI2VjDfn+mP7CvCHEf91A0oip6vbT
	b/x4qoWavsW6WesLAZwXM5FR2uSY7+AZBP90uxAomSpttSwz11z7k/x2e/l39vM1sXiJcGNxQBMhl
	S/JL4sQpr27qryzlTEZexMR4NChwKFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7LZw-0007GO-Ph; Tue, 02 Oct 2018 14:23:12 +0000
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7LIk-0006Ty-Aj
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 14:07:26 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 w92E52qb037349; Tue, 2 Oct 2018 17:05:04 +0300 (EEST)
X-AuditID: 8b5b9d4d-903ff70000000e62-88-5bb37b0d3d6e
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 6C.D7.03682.D0B73BB5; Tue,  2 Oct 2018 17:05:01 +0300 (EEST)
Received: from trampakoulas.ics.forth.gr (dell-desktop.ics.forth.gr
 [139.91.92.59] (may be forged)) (authenticated bits=0)
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTPSA id w92E4wlf008475
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 2 Oct 2018 17:05:01 +0300
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: Implement built-in command line feature
Date: Tue,  2 Oct 2018 17:04:49 +0300
Message-Id: <20181002140449.24147-1-mick@ics.forth.gr>
X-Mailer: git-send-email 2.16.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEJMWRmVeSWpSXmKPExsXSHc2orMtbvTnaYG+LrcXW37PYLbZ9bmGz
 aH53jt1i84QFrA4sHoc7vrB7PNx0iclj85J6j0vN19kDWKK4bFJSczLLUov07RK4MtYtXMFa
 cF2s4tTn/WwNjBuFuhg5OSQETCS2rm9n7WLk4hASOMoosebnISjnDJPE6/b97BBVbhK37+9k
 BbHZBDQl5l86yNLFyMEhIqAsMf+eK0iYWSBKYvO8/SwgtrCAg8Saq1fAWlkEVCU2n5zJCGLz
 CphJ7D33BWqkvMSv55+ZJzByL2BkWMUokFhmrJeZXKyXll9UkqGXXrSJEezzub47GM8tsD/E
 KMDBqMTDyyC/KVqINbGsuDL3EKMEB7OSCG9f4uZoId6UxMqq1KL8+KLSnNTiQ4zSHCxK4ryH
 X4QHCQmkJ5akZqemFqQWwWSZODilGhgF/d3v3Nv58Vh94paSzs8qFj+3zncIDDjy+JzX222N
 O64eOxBzPyy54civDwaZ1RG//F6t2L9BMvZW6tum/Cot0Z0fWiMvRK9/ubiv3KNi4vxVD30K
 /l0/ls7XvV+57s3lzkADW/P20sBLiTsN9puuP3DRJShrUs7/pSXJz2PM76Y+lz86Y1OKEktx
 RqKhFnNRcSIAGf42NfUBAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_070526_791541_5B0F7633 
X-CRM114-Status: UNSURE (   9.89  )
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, palmer@sifive.com,
 aou@eecs.berkeley.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002140449.2Yd1Ns8hS_NRo9T78BecqikX83kXhbH9MrroMR5Mo-4@z>

This patch enables the use of a built-in kernel command line, which can
optionaly also override the command line provided by the boot loader.

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
---
 arch/riscv/kernel/setup.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index aee603123..fd171ca7f 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -30,6 +30,7 @@
 #include <linux/of_platform.h>
 #include <linux/sched/task.h>
 #include <linux/swiotlb.h>
+#include <linux/string.h>
 
 #include <asm/setup.h>
 #include <asm/sections.h>
@@ -39,6 +40,14 @@
 #include <asm/tlbflush.h>
 #include <asm/thread_info.h>
 
+#ifdef CONFIG_CMDLINE_BOOL
+#ifdef CONFIG_CMDLINE_FORCE
+	static const char fixed_cmdline[] __initconst = CONFIG_CMDLINE;
+#else
+	static char builtin_cmdline[] __initdata = CONFIG_CMDLINE;
+#endif
+#endif
+
 #ifdef CONFIG_EARLY_PRINTK
 static void sbi_console_write(struct console *co, const char *buf,
 			      unsigned int n)
@@ -215,6 +224,46 @@ void __init setup_arch(char **cmdline_p)
                register_console(early_console);
        }
 #endif
+
+	/* When we return, cmdline_p should point to a temporary
+	 * buffer on the kernel's init section (that gets cleaned up
+	 * later on) to be saved on static_command_line and parsed for
+	 * parameters.
+	 *
+	 * That string may get tweaked during parameter parsing so we
+	 * also want to keep an untouched version of the command line
+	 * to display on dmesg, /proc/cmdline etc.
+	 *
+	 * At this point boot_command_line is a temporary buffer
+	 * (also on the init section) that contains the command line
+	 * string passed from the boot loader. After we return,
+	 * it will be saved to saved_command_line that holds the
+	 * untouched version of the command line.
+	 *
+	 * Since we won't be doing any parameter parsing here, we'll
+	 * hold the initial/untouched command line string on
+	 * boot_command_line and make cmdline_p point to it as well.
+	 * This way boot_command_line will be copied to both
+	 * saved_command_line and static_command_line.
+	 */
+#ifdef CONFIG_CMDLINE_BOOL
+#ifdef CONFIG_CMDLINE_FORCE
+	/* Built-in args override boot loader args and
+	 * boot loader args are being ignored.
+	 */
+	strlcpy(boot_command_line, fixed_cmdline, COMMAND_LINE_SIZE);
+#else
+	/* Boot loader args override built-in args so we
+	 * need to put built-in args before boot loader args.
+	 */
+	if (builtin_cmdline[0]) {
+		strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
+		strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
+		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
+	}
+#endif
+#endif
+
 	*cmdline_p = boot_command_line;
 
 	parse_early_param();
-- 
2.16.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
