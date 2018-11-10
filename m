Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D517C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 01:04:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC81F20840
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 01:04:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s8La5Lsk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rgrG5q5R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC81F20840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=TSkkwsyI+yC8gseJZyahCakMj4wyjPsGX1ERoeKHp20=; b=s8L
	a5LskpJY7wWJESYiWosWfUctavVTfj//ZRGHPa6IfLpMEt14ufO7c7MCQwc6TlxxKdzsmw9RVSmCL
	jObk6SQqX1wF9hnWJP6gxeI1XMVHKg7Lp8c/6TLq5LAhP402ZfnfHy5/bfKGxvxkguogWxgbYracD
	GCIsNn+RYvUEmEYx9F0pvPeO9pNqIiFO8i8EzGAnMlQKzl1Xi4SSFfC1Yb6IvfRtR7G6jkfow6qzk
	qLvMIG/cnMoNjfM1Y0M3lWssbcRMeENMdZKB6KI5SymWMZRlnFXVQhu8mW/kQs6Mgij4zVbQfjYP+
	9Pt/NZXTkJ7zfsl+MuhbVRsUDZPAHrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLHhG-0004It-Rv; Sat, 10 Nov 2018 01:04:22 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLHhF-0004Im-11
 for linux-riscv@bombadil.infradead.org; Sat, 10 Nov 2018 01:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kTI45FZ94kfQwzQlUq4tXEw5E5iKogB9Ea/OGRBzgrI=; b=rgrG5q5R4bq18iR34Wqtjy0yK
 HNC67ztoXvkjimmy3YK4tNze+fg0mFMlnvkSafbRLKvTWmV94QYEGsgAiGCdREtLnXMppM9EAurtR
 cAw3mKOjC/fD1pK0Zqut5S+ulLev2Arns1WfVez8fUTRVq5nHE0/+BxT4VqOg6ygGDdWuH6IY3jBn
 sFJDm34dilvoVG5tESZ3OGxgWPPK+iHprHUovCGfFm95kJ26E6BwFnlvIpFG+S5EGL7OPSkhmTerl
 STOo7y5kohWPviLQ3hA7qSIPGgepbmLBkMTDrf/U+R4ccZEShvRPsHUGED92wMyP3TKjghLIz6eKP
 orYlPEs5A==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLHhC-0000VL-9e
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 01:04:19 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wAA12mWd037959; Sat, 10 Nov 2018 03:02:50 +0200 (EET)
X-AuditID: 8b5b9d4d-903ff70000000e62-de-5be62e380430
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 FF.6D.03682.83E26EB5; Sat, 10 Nov 2018 03:02:48 +0200 (EET)
Received: from trampakoulas.ics.forth.gr (trampakoulas.ics.forth.gr
 [139.91.92.59]) (authenticated bits=0)
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTPSA id wAA12jsL027606
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Sat, 10 Nov 2018 03:02:48 +0200
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: Update Kconfig to better handle CMDLINE
Date: Sat, 10 Nov 2018 03:02:44 +0200
Message-Id: <20181110010244.5837-1-mick@ics.forth.gr>
X-Mailer: git-send-email 2.16.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAJMWRmVeSWpSXmKPExsXSHc2orGuh9yza4O07HYutv2exW2z73MJm
 0fzuHLvF5gkLWB1YPA53fGH3eLjpEpPH5iX1Hpear7MHsERx2aSk5mSWpRbp2yVwZbQuX81U
 8EukYtMNhwbGHQJdjJwcEgImErM6r7F1MXJxCAkcZpT4uW8XK4Szl0niwY5dbBBVbhK37+9k
 BbHZBDQl5l86yNLFyMEhIqAsMf+eK0iYWSBKYvO8/WBhYQEHiQffHEDCLAKqEg83zGUBsXkF
 TCW2Ll/CDjFRXuLX88/MExi5FzAyrGIUSCwz1stMLtZLyy8qydBLL9rECPb3XN8djOcW2B9i
 FOBgVOLh/bH8abQQa2JZcWXuIUYJDmYlEV7ZLUAh3pTEyqrUovz4otKc1OJDjNIcLErivIdf
 hAcJCaQnlqRmp6YWpBbBZJk4OKUaGHOk90V5Ozhm7Dvyvor1Aesnj+iNhssUVFpcuHLZGEJ4
 I9/MMzA+/7hANZs5gWWdSFrH2xy5b+ItPUt8tiWdPq5z6eTN1TPyU77vVVDeddqwQfZSOPek
 OY/jLKxvle59Ft53bNEfr74Zq121DGbdz9ufohSZyGMeVrhDpywk9F6F+AeR4m3mSizFGYmG
 WsxFxYkA66MD0/MBAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_200418_763768_5E59A9AC 
X-CRM114-Status: GOOD (  13.20  )
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
Message-ID: <20181110010244.crbP7Hgce5sZKHGVEMVf9-EbYI5GbTHlnNr2TMFh6QE@z>

Add a menu to chose how the built-in command line will be
used and add CMDLINE_EXTEND for compatibility with FDT code.

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
---
 arch/riscv/Kconfig | 45 ++++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 55da93f4e818..81f884164b52 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -227,39 +227,42 @@ endmenu
 
 menu "Boot options"
 
-config CMDLINE_BOOL
-	bool "Built-in kernel command line"
+config CMDLINE
+	string "Built-in kernel command line"
 	help
 	  For most platforms, it is firmware or second stage bootloader
 	  that by default specifies the kernel command line options.
 	  However, it might be necessary or advantageous to either override
-	  the default kernel command line or add a few extra options to it.
-	  For such cases, this option allows hardcoding command line options
-	  directly into the kernel.
+	  the provided kernel command line or add a few extra options to it.
+	  For such cases, it is possible to define a built-in command line
+	  here and chose how the kernel should use it later on.
 
-	  For that, choose 'Y' here and fill in the extra boot parameters
-	  in CONFIG_CMDLINE.
+choice
+	prompt "Built-in command line usage" if CMDLINE != ""
+	default CMDLINE_FALLBACK
+	help
+	  Chose how the kernel will handle the provided built-in command
+	  line.
 
-	  The built-in options will be concatenated to the default command
-	  line if CMDLINE_FORCE is set to 'N'. Otherwise, the default
-	  command line will be ignored and replaced by the built-in string.
+config CMDLINE_FALLBACK
+	bool "Fallback"
+	help
+	  Use the built-in command line as fallback in case we get nothing
+	  from the boot loader.
 
-config CMDLINE
-	string "Built-in kernel command string"
-	depends on CMDLINE_BOOL
-	default ""
+config CMDLINE_EXTEND
+	bool "Extension"
 	help
-	  Supply command-line options at build time by entering them here.
+	  Use the built-in command line as an extension of the command line
+	  provided by the boot loader.
 
 config CMDLINE_FORCE
-	bool "Built-in command line overrides bootloader arguments"
-	depends on CMDLINE_BOOL
+	bool "Forced"
 	help
-	  Set this option to 'Y' to have the kernel ignore the bootloader
-	  or firmware command line.  Instead, the built-in command line
-	  will be used exclusively.
+	  Use the built-in command line in place of the command line
+	  provided by the boot loader.
 
-	  If you don't know what to do here, say N.
+endchoice
 
 endmenu
 
-- 
2.16.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
