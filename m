Return-Path: <SRS0=4IfI=N5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FE6C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 18 Nov 2018 00:09:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C7482075B
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 18 Nov 2018 00:09:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uh7yNoeR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="un/MCNcD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C7482075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ut6Ji80m91coT/LSZBa1h2DFBQrQqkD4cPt9tA2gGuI=; b=Uh7
	yNoeRkMjZFJ4TBXwm6snNhTXN5e66LJ7KRxIElkaRRU4Qfq1vSVJK0O3fTnnL8JOvd9pl6IKFGOqW
	IL95dVtfkcB8ozYRan9FvSg+4m6QChGoBY+iUskKVws/2bZqRsK5DMUOv4STJGbN3aeUiXDMXZ8iI
	vqLJYq6T5D7PQSQjlBjvzEHgZnoeP6qtZituVd3rvbidhLl6Q9Y3cvPuJg4tg1HcgcfoTZhlqPBYP
	6bfhXMSmTphri26JDRod0P9MNhlN7OAuuBCr5gYXFu5fU/1hCB7HLdoDbHDqS2kZpqh3e1aWGmS1y
	xK1LYOonqaQHVLZPwQ3gyn68DfiMESw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOAeJ-0008JM-83; Sun, 18 Nov 2018 00:09:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOAeI-0008JG-5R
 for linux-riscv@bombadil.infradead.org; Sun, 18 Nov 2018 00:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xgGWA2BUSO0iAvAS9MUtRyUueisFiv0rGUfFlsLbJTw=; b=un/MCNcDkKSipFGw/wTgz5E1b
 hf0gQSew/DVnORi/fMo1HF+ynCz7X1AFFMec1n5wWOrncjPaFoEPJ4AE6aeZOQQMQS5lQIXyb3x+u
 TVqLHb9MaBeoyxhZA40A7TbE69hdmUfyGl1PiU+3fIzulw/I4Q4gaP4z0HNxfb/URFtrdcNFLhfdR
 P5FqOgU1vJLgzoQXJs55jUuB3xpEJA4UthDyddQV3BoYQfMMM8rs6SWTUDAGzdvIKzTiZ7LvxlCRk
 s910RItsVVOMEKe76Bhsbr3HjL2T4nBXI6JSfip16fLPcNtYKjV09sNNORIs210w8BE/qLoj1nuxX
 UdfGXufkA==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOAdl-0002lO-Mq
 for linux-riscv@lists.infradead.org; Sun, 18 Nov 2018 00:09:09 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wAI073Tp024868; Sun, 18 Nov 2018 02:07:05 +0200 (EET)
X-AuditID: 8b5b9d4d-91bff70000000e62-be-5bf0ad277984
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 FE.C4.03682.72DA0FB5; Sun, 18 Nov 2018 02:07:03 +0200 (EET)
Received: from trampakoulas.ics.forth.gr (trampakoulas.ics.forth.gr
 [139.91.92.59]) (authenticated bits=0)
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTPSA id wAI06wLb019660
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Sun, 18 Nov 2018 02:07:02 +0200
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v3] RISC-V: Update Kconfig to better handle CMDLINE
Date: Sun, 18 Nov 2018 02:06:56 +0200
Message-Id: <20181118000656.15656-1-mick@ics.forth.gr>
X-Mailer: git-send-email 2.16.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLJMWRmVeSWpSXmKPExsXSHc2orKu+9kO0wcfp4hZbf89it1h/8hOL
 xbbPLWwWze/OsVtsnrCA1YHV43DHF3aPnbPusns83HSJyWPzknqPS83X2QNYo7hsUlJzMstS
 i/TtErgyzp8+yFhwTqri3s6J7A2MjaJdjJwcEgImEh83X2DpYuTiEBI4wijR33mbGcLZyyTR
 8OIJI0SVm8Tt+ztZQWw2AU2J+ZcOAnVwcIgIKEvMv+cKUs8s0MMo0XKtkRmkRljAWWLFpvtg
 9SwCqhKT395hA7F5Bcwkbh57AzVTXuLX88/MExi5FzAyrGIUSCwz1stMLtZLyy8qydBLL9rE
 CA6Eub47GM8tsD/EKMDBqMTDW/HoXbQQa2JZcWXuIUYJDmYlEd4fL4BCvCmJlVWpRfnxRaU5
 qcWHGKU5WJTEeQ+/CA8SEkhPLEnNTk0tSC2CyTJxcEo1MBp4dT2yfrqe4RGrSq7wq/ef+3aU
 /AgL/Ju6V9HuRo79vOa1s36kSJfJNHVo3NXr3Rqtx+U7o0Hvq+MLgbieBz7nj/7mM9zgWt4V
 rRaguvj4Nuld4tdfPJPfuHr+58an0x0fR360/X/8TsW+ZeUWBY9aHxxbx+Ptoz13W8vaLc/6
 zhwys/I//U2JpTgj0VCLuag4EQAT/GrDAAIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181118_000907_098325_4C565714 
X-CRM114-Status: GOOD (  17.06  )
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
Message-ID: <20181118000656.BSng2Q6WYjUpFUSKJlEG3RYsnthfJoK11bP4pSdCZ94@z>

Added a menu to choose how the built-in command line will be
used and CMDLINE_EXTEND for compatibility with FDT code.

v2: Improved help messages, removed references to bootloader
and made them more descriptive. I also asked help from a
friend who's a language expert just in case.

v3: This time used the corrected text

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
Signed-off-by: Debbie Maliotaki <dmaliotaki@gmail.com>
---
 arch/riscv/Kconfig | 57 +++++++++++++++++++++++++++++++-----------------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 55da93f4e..808624f6b 100644
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
+	  are provided at run-time, during boot. However, there are cases
+	  where either no arguments are being provided or the provided
+	  arguments are insufficient or even invalid.
 
-	  For that, choose 'Y' here and fill in the extra boot parameters
-	  in CONFIG_CMDLINE.
+	  When that occurs, it is possible to define a built-in command
+	  line here and choose how the kernel should use it later on.
 
-	  The built-in options will be concatenated to the default command
-	  line if CMDLINE_FORCE is set to 'N'. Otherwise, the default
-	  command line will be ignored and replaced by the built-in string.
+choice
+	prompt "Built-in command line usage" if CMDLINE != ""
+	default CMDLINE_FALLBACK
+	help
+	  Choose how the kernel will handle the provided built-in command
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
+	  you don't want to or cannot modify them.
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
+	  command line on systems where you don't have or want control
+	  over it.
 
-	  If you don't know what to do here, say N.
+endchoice
 
 endmenu
 
-- 
2.16.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
