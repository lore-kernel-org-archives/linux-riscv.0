Return-Path: <SRS0=yw/l=N4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97D9C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Nov 2018 18:23:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60E612077C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Nov 2018 18:23:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qMf12AZF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="S4nSuair"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60E612077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=VLTLCOqkHhi+AS5ozqzLugYmf63v8TuuWpbvNmD1Hds=; b=qMf
	12AZFWH/xn5ZTY15SIunuiGOGXJ5nMWN/aHktthpGnzJ7bE18LJlx5rWvlwVimJOSdXvA+NAQSWJg
	vKY8WwI9q7fn7bCHMQFCYNTSq+z2pthtw13K42yF/5gnPHQIeBVEjYl5RaGnBLLYWAiQvxmMifbHJ
	tN5KqkidPEZ3V9QdVclqgNgni05fFwKx02QGDfnu6ooSUgEkA08tOQzvajNC1zDwm4CagHxaz9ucO
	zE7tO7TxqHjDxgJeTmMD+InfXMbOm5jHVk/8ERO1enkzo917JK2tHmSM++FzkTjhC1Eu+/ME/iODb
	Auc5KTUYgV0XOBZe5SkRgLvdF3a8ZrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gO5Fw-00037S-NG
	for infradead-linux-riscv@archiver.kernel.org; Sat, 17 Nov 2018 18:23:44 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gO5Fv-00037M-Nu
 for linux-riscv@bombadil.infradead.org; Sat, 17 Nov 2018 18:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6L5vkfCHH6tV6mkC+hra6vxKePth3wvvoxR4F+pMuQQ=; b=S4nSuair8oBxwJifnsSDfA0GG
 bw0gmqRWX16bw4pfr1uXYX++hTZobFLx2ECNJm/oCs+obkWh5d4s14+BVacDa6ZH1NhIMsx5keB7j
 7WNuEwDrqhRfvS7pzg0AsJqsQtmNt4+OFUEmdZ7PoQxa08uaXZ2UMoiO4as8zMXBKVcgOLlZS3LML
 /YnRNa5klFDaVPravSNqark42AGVp2VSesvmDuA2OG8FejXw8bFU9JgQJBdHF5aQp35lqZ/z9b0BZ
 TtBWISzPMc6UEFsFD4mAvyNOAHDCIj+QEmR3fZqadXGVDu57+QtCb7OpngkiVt97adgMFYojt+eZ4
 z3sIKNq4w==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gO5Fs-0006hy-G2
 for linux-riscv@lists.infradead.org; Sat, 17 Nov 2018 18:23:41 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wAHILxmv019906; Sat, 17 Nov 2018 20:22:01 +0200 (EET)
X-AuditID: 8b5b9d4d-91bff70000000e62-22-5bf05c4783b2
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 14.C4.03682.74C50FB5; Sat, 17 Nov 2018 20:21:59 +0200 (EET)
Received: from trampakoulas.ics.forth.gr (trampakoulas.ics.forth.gr
 [139.91.92.59]) (authenticated bits=0)
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTPSA id wAHILtWo009629
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Sat, 17 Nov 2018 20:21:59 +0200
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v2] RISC-V: Update Kconfig to better handle CMDLINE
Date: Sat, 17 Nov 2018 20:21:54 +0200
Message-Id: <20181117182154.14162-1-mick@ics.forth.gr>
X-Mailer: git-send-email 2.16.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDJMWRmVeSWpSXmKPExsXSHc2orOse8yHa4M4TA4utv2exW6w/+YnF
 YtvnFjaL5nfn2C02T1jA6sDqcbjjC7vHzll32T0ebrrE5LF5Sb3Hpebr7AGsUVw2Kak5mWWp
 Rfp2CVwZe/+sZiqYK1VxY9NslgbGWyJdjBwcEgImEtu/hXYxcnEICRxhlPj9ZxILhLOXSaJ1
 3Un2LkZOoCI3idv3d7KC2GwCmhLzLx1kAWkWEVCWmH/PFaSeWaCHUaLlWiMzSI2wgLPE9i9b
 WUBsFgFViT1n54DN4RUwk5iwaycTxEx5iV/PPzNPYORewMiwilEgscxYLzO5WC8tv6gkQy+9
 aBMjOAzm+u5gPLfA/hCjAAejEg9vxaN30UKsiWXFlbmHGCU4mJVEeH+8AArxpiRWVqUW5ccX
 leakFh9ilOZgURLnPfwiPEhIID2xJDU7NbUgtQgmy8TBKdXA2Hx40Tejq05s8/oVP71Wy//o
 FsbL4qS9uH/6gfdaO/Jq0gPcdAv06/b936GfVxqseuV+xI5pdT92i/yMfRt40PP85WvL+LuU
 nUJf5L4peqYoMe2a8f+XCx24m4sddeNSNymFGcZH3GdNOWS002u7c+4vps/SU4LiH7mK6tv7
 zV5RdGbm1T3CSizFGYmGWsxFxYkAmFYoSP8BAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181117_132340_855404_C64CAA75 
X-CRM114-Status: GOOD (  15.22  )
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
Cc: Nick Kossifidis <mick@ics.forth.gr>,
 Debbie Maliotaki <dmaliotaki@gmail.com>, palmer@sifive.com,
 aou@eecs.berkeley.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181117182154.aFbRYP_lojOV6yk7DFbF14QrZeDV7vaTZ_s_o9tKBL8@z>

Add a menu to chose how the built-in command line will be
used and add CMDLINE_EXTEND for compatibility with FDT code.

v2: Improved help messages, removed references to bootloader
and make them more descriptive. I also asked help from a
friend who's a language expert just in case.

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
Signed-off-by: Debbie Maliotaki <dmaliotaki@gmail.com>
---
 arch/riscv/Kconfig | 57 +++++++++++++++++++++++++++++++-----------------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 55da93f4e..9e233627a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -227,39 +227,48 @@ endmenu
 
 menu "Boot options"
 
-config CMDLINE_BOOL
-	bool "Built-in kernel command line"
+config CMDLINE
+	string "Built-in kernel command line"
 	help
-	  For most platforms, it is firmware or second stage bootloader
-	  that by default specifies the kernel command line options.
-	  However, it might be necessary or advantageous to either override
-	  the default kernel command line or add a few extra options to it.
-	  For such cases, this option allows hardcoding command line options
-	  directly into the kernel.
+	  For most platforms, the arguments for the kernel's command line
+	  are provided at run-time, during boot. However there are cases
+	  where no arguments are being provided or the provided arguments
+	  are insufficient or even invalid.
 
-	  For that, choose 'Y' here and fill in the extra boot parameters
-	  in CONFIG_CMDLINE.
+	  When that occurs, it is possible to define a built-in command
+	  line here and chose how the kernel should use it later on.
 
-	  The built-in options will be concatenated to the default command
-	  line if CMDLINE_FORCE is set to 'N'. Otherwise, the default
-	  command line will be ignored and replaced by the built-in string.
+choice
+	prompt "Built-in command line usage" if CMDLINE != ""
+	default CMDLINE_FALLBACK
+	help
+	  Chose how the kernel will handle the provided built-in command
+	  line.
 
-config CMDLINE
-	string "Built-in kernel command string"
-	depends on CMDLINE_BOOL
-	default ""
+config CMDLINE_FALLBACK
+	bool "Fallback"
 	help
-	  Supply command-line options at build time by entering them here.
+	  Use the built-in command line as fallback in case we get nothing
+	  during boot. This is the default behaviour.
+
+config CMDLINE_EXTEND
+	bool "Extension"
+	help
+	  The command-line arguments provided during boot will be
+	  appended to the built-in command line. This is useful in
+	  cases where the provided arguments are insufficient and
+	  you don't want or cannot modify them.
+
 
 config CMDLINE_FORCE
-	bool "Built-in command line overrides bootloader arguments"
-	depends on CMDLINE_BOOL
+	bool "Forced"
 	help
-	  Set this option to 'Y' to have the kernel ignore the bootloader
-	  or firmware command line.  Instead, the built-in command line
-	  will be used exclusively.
+	  Always use the built-in command line, even if we get one during
+	  boot. This is useful in case you need to override the provided
+	  command line on systems where you don't have or want any
+	  control over it.
 
-	  If you don't know what to do here, say N.
+endchoice
 
 endmenu
 
-- 
2.16.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
