Return-Path: <SRS0=mtPM=MQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD32C64EBC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Oct 2018 11:33:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBDC820877
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Oct 2018 11:33:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rJ0V2dv2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBDC820877
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Lv5OTblJi7eD113kyap6wUMIvsJP7F+C3zamw5qNKCQ=; b=rJ0
	V2dv2/XzsnX+fS8zV/wnEKBMWyDXhqHmqrXNEoYIufAqEJSHn8zjRy2tTAa4vMMoikMSR5AvlrmP2
	qGbgBcF3g9X2xbHRqoZAixA7EILypD01PjVL0MY25mUqeG9T3DeI0XCfbqXs6+p3mlhGGo5zXtCTO
	vHdrvCwoXFZv+aibaE/r3goooD2on7AEltZCVw8GdTBqGmYwyrOrVm8CDsPodK7tNh0KQifzsGQwH
	hSo1l1LR9S7tnYRpakirLVRDXST60Duci7Vc4k8YIJL/APboqcCJ73F3VJOqc9EyO4K23z9KAbB82
	S81D6gc2Ng32iAmUmdS4U0rsLAybakg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g81sT-0006fz-7B; Thu, 04 Oct 2018 11:33:09 +0000
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g81sK-0006eS-5y
 for linux-riscv@lists.infradead.org; Thu, 04 Oct 2018 11:33:06 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 w94BWaqI083419; Thu, 4 Oct 2018 14:32:38 +0300 (EEST)
X-AuditID: 8b5b9d4d-903ff70000000e62-dc-5bb5fa54e457
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 F1.1A.03682.45AF5BB5; Thu,  4 Oct 2018 14:32:36 +0300 (EEST)
Received: from trampakoulas.ics.forth.gr (dell-desktop.ics.forth.gr
 [139.91.92.59] (may be forged)) (authenticated bits=0)
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTPSA id w94BWWYM005991
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 4 Oct 2018 14:32:35 +0300
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: Update Kconfig to better handle CMDLINE
Date: Thu,  4 Oct 2018 14:32:30 +0300
Message-Id: <20181004113230.7995-1-mick@ics.forth.gr>
X-Mailer: git-send-email 2.16.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIJMWRmVeSWpSXmKPExsXSHc2orBvya2u0wfol3BZbf89it9j2uYXN
 ovndOXaLzRMWsDqweBzu+MLu8XDTJSaPzUvqPS41X2cPYInisklJzcksSy3St0vgyth27Qdj
 wReRis5JB9kaGDcJdDFyckgImEi83P2YpYuRi0NI4AijxJJFr5kgnDNMEnvuXWSFqHKTuH1/
 J5jNJqApMf/SQaAODg4RAWWJ+fdcQcLMAlESm+ftBwsLCzhIPPjmABJmEVCV6D48mQXE5hUw
 lZg75z07xER5iV/PPzNPYORewMiwilEgscxYLzO5WC8tv6gkQy+9aBMj2ONzfXcwnltgf4hR
 gINRiYe3492WaCHWxLLiytxDjBIczEoivIYLtkYL8aYkVlalFuXHF5XmpBYfYpTmYFES5z38
 IjxISCA9sSQ1OzW1ILUIJsvEwSnVwBgjnlex0F1GSOri7McMYf2iO1jZpyje/vfuqOd9qxk3
 7v4Qs+Of1Dpnorm22uyLbdrtbpHbebi+Hne8Hbd5+Yqiiq8aDhs4k20fLqtS6+cV27VN1P7Z
 +vwH3VUu9/8E//tj1T3tX8KmK+w92zk4o9cdMmWVSGyxT+x52LrXirfZdPJJprsNQkosxRmJ
 hlrMRcWJAK2t/0n0AQAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181004_043300_605767_8493455E 
X-CRM114-Status: GOOD (  11.60  )
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
Message-ID: <20181004113230.T9r8viRiwInyPlu7UcekOUnaI6vijyEiUw0eygvqKY4@z>

Add a menu to chose how the built-in command line will be used and
add CMDLINE_EXTEND for compatibility with FDT code.

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
---
 arch/riscv/Kconfig | 45 ++++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 82172bf85..cce141552 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -218,39 +218,42 @@ endmenu
 
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
