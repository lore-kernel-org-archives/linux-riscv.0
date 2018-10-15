Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5C2C04AA5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 14:20:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F0C9205C9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 14:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c21z8dxR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F0C9205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=8df+y3z3/GA7ikZGcC9y0Abj2W5/IdqP9F66ScJeG+o=; b=c21
	z8dxRpc5xV3CqoLbzXWwWHkC/xT3AZrFfhlqeBi7sFvM+YMihSZmw9u+pkMlTyYjqN3r6SZYkiuxg
	ZiHEUwoomsDjzBKhqr0v9/dbimwFqcKRz/8WccgqeMKgzf7gEcWq79lniQ11UVECsy5LH95lS6Jwt
	EAGhKBzax8Ce0ZQjY+j6nfKaPPe+gcjq+geCgBlbM5weD0IIXLfBTurEbze/Gf52QFScd5l0pioKE
	fUX44LSPxpF3EaHrkKh6mCN5H9787oviBmM1HZJw4OLzBGnahvSf/bOBtAAzvMIRRM8AyADcV8WfL
	R+FwoMyTbf0xLSFmqv8JG7LXMTP74aQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gC3jd-0003dy-Ig; Mon, 15 Oct 2018 14:20:41 +0000
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC3ja-00038Y-1i
 for linux-riscv@lists.infradead.org; Mon, 15 Oct 2018 14:20:40 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 w9FEKER3039552; Mon, 15 Oct 2018 17:20:17 +0300 (EEST)
X-AuditID: 8b5b9d4d-903ff70000000e62-8b-5bc4a2204de5
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 69.E3.03682.022A4CB5; Mon, 15 Oct 2018 17:20:17 +0300 (EEST)
Received: from trampakoulas.ics.forth.gr (john-laptop.ics.forth.gr
 [139.91.92.59] (may be forged)) (authenticated bits=0)
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTPSA id w9FEKDF4012971
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Mon, 15 Oct 2018 17:20:16 +0300
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: devicetree@vger.kernel.org
Subject: [PATCH v2] OF: Handle CMDLINE when /chosen node is not present
Date: Mon, 15 Oct 2018 17:20:10 +0300
Message-Id: <20181015142010.13401-1-mick@ics.forth.gr>
X-Mailer: git-send-email 2.16.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGJMWRmVeSWpSXmKPExsXSHc2orKu46Ei0Qf83Fov5R86xWsx885/N
 YtvnFjaL5nfn2C02T1jAatG69wi7A5vHzll32T0ebrrE5LFpVSebx+Yl9R6Xmq+ze3zeJBfA
 FsVlk5Kak1mWWqRvl8CVMfHXbtaCt9IVvzZeZG9gvCbWxcjJISFgIvGi7xtTFyMXh5DAUUaJ
 bfcmskA4Z5gkvjw/xwJR5SZx+/5OVhCbTUBTYv6lg2BxEQE5iZtf77KB2MwCMxklnr/yALGF
 Bdwlem88AqthEVCVOLx3KlgNr4CZRMOa7WwQM+Ulfj3/zDyBkXsBI8MqRoHEMmO9zORivbT8
 opIMvfSiTYzg0Jjru4Px3AL7Q4wCHIxKPLx/HI9EC7EmlhVX5h5ilOBgVhLhlQg5FC3Em5JY
 WZValB9fVJqTWnyIUZqDRUmc9/CL8CAhgfTEktTs1NSC1CKYLBMHp1QDY5OFexHrrq3928p3
 eu44G3XUu9vLueXyBa2S40IranTfdVq3Kaa9PbOtUO3CR6tNobP/X/+z0qNqYcapS4Lsdsnv
 5Iv+ObPsOtui5izpe3xr8t3cbdrCusvjpOX5NMt+Ft53bjsi8m4Z61oRfb19L3JuhEU2Lnq+
 RSP2QslScWbbZex3rdMalViKMxINtZiLihMBhRxG6AkCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_072038_478726_B43E3851 
X-CRM114-Status: GOOD (  11.81  )
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 robh+dt@kernel.org, frowand.list@gmail.com, palmer@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015142010.EKezuq3RPyXUiLOQL2ciHRnZ0NAuHDIImZ2CDucOtuI@z>

The /chosen node is optional so we should handle CMDLINE regardless
the presence of /chosen/bootargs. Move handling of CMDLINE in
early_init_dt_scan() instead.

v2: Fix typo on comments section

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
---
 drivers/of/fdt.c | 69 +++++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 48 insertions(+), 21 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 800ad252c..868464b0b 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -31,6 +31,14 @@
 
 #include "of_private.h"
 
+#ifdef CONFIG_CMDLINE
+#ifdef CONFIG_CMDLINE_FORCE
+static const char fixed_cmdline[] __initconst = CONFIG_CMDLINE;
+#else
+static char builtin_cmdline[] __initdata = CONFIG_CMDLINE;
+#endif
+#endif
+
 /*
  * of_fdt_limit_memory - limit the number of regions in the /memory node
  * @limit: maximum entries
@@ -1088,28 +1096,10 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 
 	/* Retrieve command line */
 	p = of_get_flat_dt_prop(node, "bootargs", &l);
-	if (p != NULL && l > 0)
+	if (p != NULL && l > 0) {
 		strlcpy(data, p, min((int)l, COMMAND_LINE_SIZE));
-
-	/*
-	 * CONFIG_CMDLINE is meant to be a default in case nothing else
-	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
-	 * is set in which case we override whatever was found earlier.
-	 */
-#ifdef CONFIG_CMDLINE
-#if defined(CONFIG_CMDLINE_EXTEND)
-	strlcat(data, " ", COMMAND_LINE_SIZE);
-	strlcat(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
-#elif defined(CONFIG_CMDLINE_FORCE)
-	strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
-#else
-	/* No arguments from boot loader, use kernel's  cmdl*/
-	if (!((char *)data)[0])
-		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
-#endif
-#endif /* CONFIG_CMDLINE */
-
-	pr_debug("Command line is: %s\n", (char*)data);
+		pr_debug("Got bootargs: %s\n", (char *) data);
+	}
 
 	/* break now */
 	return 1;
@@ -1240,6 +1230,43 @@ bool __init early_init_dt_scan(void *params)
 		return false;
 
 	early_init_dt_scan_nodes();
+
+	/*
+	 * The /chosen node normally contains the bootargs element
+	 * that includes the kernel's command line parameters.
+	 * However the presence of /chosen is not mandatory so
+	 * in case we didn't get a command line when scanning
+	 * nodes above, we need to provide one here before we
+	 * return if possible.
+	 *
+	 * The built-in command line can be used as a default
+	 * command line in case we received nothing from the
+	 * device tree/bootloader. It can also be used for
+	 * extending or replacing the received command line.
+	 */
+#ifdef CONFIG_CMDLINE
+#if defined(CONFIG_CMDLINE_EXTEND)
+	/*
+	 * Order of parameters shouldn't matter for most cases,
+	 * so prepending or appending the built-in command line
+	 * shouldn't make a difference. In cases where it does
+	 * it's up to the user to configure the kernel and/or
+	 * the bootloader properly.
+	 */
+	if (builtin_cmdline[0]) {
+		strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
+		strlcat(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
+	}
+#elif defined(CONFIG_CMDLINE_FORCE)
+	if (fixed_cmdline[0])
+		strlcpy(boot_command_line, fixed_cmdline, COMMAND_LINE_SIZE);
+#else
+	/* No arguments from boot loader, use kernel's cmdline */
+	if (!boot_command_line[0] && builtin_cmdline[0])
+		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
+#endif
+#endif /* CONFIG_CMDLINE */
+
 	return true;
 }
 
-- 
2.16.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
