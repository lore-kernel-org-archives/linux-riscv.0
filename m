Return-Path: <SRS0=mtPM=MQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFF6C64EBC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Oct 2018 12:46:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B10E20684
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Oct 2018 12:46:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rZe9W4GQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="a3g8LLHy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B10E20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=LmAnh7cwaEuISDyXTuuZJQyMctkLjJPJEHZBWmrkprc=; b=rZe
	9W4GQMBBM/0lJ0haHl4lLdPMrtbTKFhCELIh+Aycwrr1aYEBzvek+43S+7VAQZDCLeowN9wmRAkel
	V3C4ZyAzWd1Fj6uffLssooKyiNQZWlkQ/C/8ZOxf0WqT4FCQ/51+BHkeOfnpN5ZVdaSS00uf6m/6D
	O56DTcZgSWMH1EtXIL4yc8B8j7OV87FxIESrQhst66dUaH6AtthNhr0MC+1GaNnoanxA81vP4jtwg
	ubncwR7iJgZ4FeA+vr7LoMzulfUPNLEF0HoiuyvVjaOXdIVyD6E71J+JMsAW1K/QWMJIG8IxNYkv3
	XjasLRqr/mOWx3lzq8cQxw05aHFB5zA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g831B-0002OO-GZ; Thu, 04 Oct 2018 12:46:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8318-0002EE-FQ
 for linux-riscv@bombadil.infradead.org; Thu, 04 Oct 2018 12:46:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R5wXYbCcHA0oSbNz35Ks5xh/kJFgvhAImRkJlp8jg6Y=; b=a3g8LLHybP1n3wxxaIZXMjlQW
 yUhjykY/B+40HF9getXpH31ATfut27NgodiMK0a6rVcFOHi8kBZuscCPI17jwOc1QcJW/9I0o/WtP
 Yi4EMR4PdU1umMRkBHpGO0SJQ3crz6oNNtkQ4z6MQVBpt2ZlUelLTaWmhy+9yLUynxza0tddTko60
 2HRPEWlXAp1ncYsFSffqO5QzZD9LCHLASSI1HRu3oECvmBvjGpFvEUTYYvE+0pRluUilSZuu2GgH6
 DEkbOiWjEHnX5aACPUfHvSffpjIlwCRdD9daO1BxzMHwonSaihC0r997puVwW5EEbyZJmaPFFgGvv
 OqOgL5ryw==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g82n8-0005oV-Cd
 for linux-riscv@lists.infradead.org; Thu, 04 Oct 2018 12:31:44 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 w94CVKAJ084441; Thu, 4 Oct 2018 15:31:22 +0300 (EEST)
X-AuditID: 8b5b9d4d-903ff70000000e62-30-5bb60818e459
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 A6.2A.03682.81806BB5; Thu,  4 Oct 2018 15:31:20 +0300 (EEST)
Received: from trampakoulas.ics.forth.gr (trampakoulas.ics.forth.gr
 [139.91.92.59]) (authenticated bits=0)
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTPSA id w94CVHCd022886
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 4 Oct 2018 15:31:20 +0300
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: devicetree@vger.kernel.org
Subject: [PATCH] OF: Handle CMDLINE when /chosen node is not present
Date: Thu,  4 Oct 2018 15:31:10 +0300
Message-Id: <20181004123110.8487-1-mick@ics.forth.gr>
X-Mailer: git-send-email 2.16.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGJMWRmVeSWpSXmKPExsXSHc2orCvBsS3aYN1WM4v5R86xWsx885/N
 YtvnFjaL5nfn2C02T1jAatG69wi7A5vHzll32T0ebrrE5LFpVSebx+Yl9R6Xmq+ze3zeJBfA
 FsVlk5Kak1mWWqRvl8CV8af7CVvBKemKqfu2Mjcw7hbrYuTkkBAwkeh4+4yxi5GLQ0jgCKPE
 oosXWCGcPUwSrx+1MENUuUncvr+TFcRmE9CUmH/pIAuILSIgJ3Hz6102EJtZYCajxPNXHiC2
 sICLxJ7/r8HqWQRUJT4vWs4OYvMKmEpsPfOFFWKmvMSv55+ZJzByL2BkWMUokFhmrJeZXKyX
 ll9UkqGXXrSJERwac313MJ5bYH+IUYCDUYmHt+Pdlmgh1sSy4srcQ4wSHMxKIrxH/22NFuJN
 SaysSi3Kjy8qzUktPsQozcGiJM57+EV4kJBAemJJanZqakFqEUyWiYNTqoExWHcL64vj5im/
 di1f/2a+SNaDhI9f5i+M1pY0aMw6lb6A9YfqZYW4htacQ4V3uyYVcZm31j+cy7ufx83qY7nD
 36NHNrtMnXnS1/Rp5MN/J+Xda/dl8pXOKvl5b7VD5uIZuy+Ymk94cdt83d20h70T6hcpbS25
 U9Zet/7ERWkVmQ9n+rLzT/VsUWIpzkg01GIuKk4EAF8npYkJAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181004_133142_552320_0B5E0FB5 
X-CRM114-Status: GOOD (  15.45  )
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
Message-ID: <20181004123110.Lp2xUUd539xgalzV8RYMYIeDuDJXGDeRJZ1YAHFAnV8@z>

The /chosen node is optional so we should handle CMDLINE regardless
the presence of /chosen/bootargs. Move handling of CMDLINE in
early_init_dt_scan() instead.

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
+	 * The /chosen node normaly contains the bootargs element
+	 * that includes the kernel's command line parameters.
+	 * However the presence of /chosen is not mandatory so
+	 * in case we didn't get a command line when scanning
+	 * nodes above, we should provide one here before we
+	 * return, if possible.
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
