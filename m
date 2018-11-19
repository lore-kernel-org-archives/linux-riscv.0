Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20F7C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 21:10:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8FC220851
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 21:10:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TFTQ2BXm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mCg3k6Ne"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8FC220851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:Message-Id:
	Date:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GMJwDSMPZjquQy8vq8YusaIvzr6sf9aFtfC5iSiDnA0=; b=TFTQ2BXmt0AmE2
	rOO7OhuJZ8hfNYfyAC4iWjYv3/fn2BWYibwahH7QqjOIccqarA9OUYzD0i3/RwSrl0w0UrEXCVBB0
	0Zy0rJRvX/I2ghw0lXS/f8G2c7VHqcDQRQGgfSX/9WwumIccJ9e8dASwGZGuEauAkMhcbh0WXNuPo
	6DBEhGA4YqCvFWGoG4O/exBuHhtuvKzo0CdSC6xp6/drjAHFLjwep8L7SuxK0yF7dR/bor1pXHpVx
	DSdFsz44ZO/oJDr+0VQ2nuIVfAYQwSe4ZcWHgKED2p7mbwNMDt15XuMuXeeMXXZjDSoxb5vEDg9SS
	VtRTPWDezAlgvYy+aTew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOqoL-0005RY-B5; Mon, 19 Nov 2018 21:10:25 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOqoJ-0005RC-42
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 21:10:24 +0000
Received: by mail-pg1-x541.google.com with SMTP id y4so14365003pgc.12
 for <linux-riscv@lists.infradead.org>; Mon, 19 Nov 2018 13:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:cc:from:to;
 bh=wk6r2f4GWrgKqHlnQOzVKEkbQRO1v+ZVi/qyPedHjBA=;
 b=mCg3k6Ne0PZePc1J5GrJdT9V9e+3nr1h3Vjj/oezOR8Nxz30mcDkPjtmMoI2eY7yTn
 LZUXHiOkgDoaWLFKybIuFaoPX+yql8fP9Pa3xqBmy5DgqfCaWiKPxDaPDIjHyQuXFAaS
 bxYYrKqdiGa3Odghuk+WgwcjTntavAULNcHtPPPJ5fPV5mtM4oZdr0DNKTAhJVQU4RKT
 dT3kMjZN1rPlS8G37oMEs1BO6CSnBIMF1FZbvjUBk8OHrNH+hnlBMxD8FFW9x1SY/fx6
 y/JbRsflggNlYSaLuc4Klch2YyDrSEhQt17iMnqAlNrV9uSBcwPCZSGrO9w6I2Mvnqgj
 ai2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:cc:from:to;
 bh=wk6r2f4GWrgKqHlnQOzVKEkbQRO1v+ZVi/qyPedHjBA=;
 b=nDJQ+m44A7Sy2UMvPs896eQ0d0VyN4bL0507lPt/32zHY6KppzMeUup+ZpxVUtyOPJ
 cufZFguToS7oPNnu1DvIn8jPSL98LI6XnUZdDyz6VTLv+14cM82LVoi5yRy/YTKikeIn
 qctLZIE3XdJ9QLQ4tk1xLVTbcCKEkzs+YuTLwghkgmvkL6PccBVzITni6JIUrwGS00Zb
 zD4eNYuBUxjlxWbJl7QrJxjFYig1F+/ovYnZOb03HCj6i5o9jCaqdddCWPEYukW85shF
 0lzOMZrhT8/Hnwd62KoaPkEwTEnqPS6VfLdmJnHisRx9vGkoy5T/Ev55mIAfr3Tm0I1l
 XCvw==
X-Gm-Message-State: AGRZ1gJvmZHll9CLkF0Pz5qVCO+UvuJpsUnrzd+w8cYxDoKLIvjskofZ
 E39ZrR6Khiw3j7HrLwE1R+DUjATL8zE=
X-Google-Smtp-Source: AJdET5cV+PNV9mNtY4oWum/fwdWlclYtqvJLAra25hJLmRuN4pXw5btyO+9DzC/eo67GWH6GZ97pow==
X-Received: by 2002:a63:2447:: with SMTP id
 k68-v6mr20920152pgk.156.1542661811641; 
 Mon, 19 Nov 2018 13:10:11 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a16-v6sm35224535pfh.107.2018.11.19.13.10.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Nov 2018 13:10:10 -0800 (PST)
Subject: [PATCH v5] RISC-V: Update Kconfig to better handle CMDLINE
Date: Mon, 19 Nov 2018 13:09:07 -0800
Message-Id: <20181119210907.12040-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
From: Palmer Dabbelt <palmer@sifive.com>
To: mick@ics.forth.gr, dmaliotaki@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_131023_184639_C311725D 
X-CRM114-Status: GOOD (  17.41  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119210907.1mBIq9WM4OS1iVZoPcqNmqQO-wlgFjUxiWjIEGQ-8pM@z>

From: Nick Kossifidis <mick@ics.forth.gr>

Added a menu to choose how the built-in command line will be
used and CMDLINE_EXTEND for compatibility with FDT code.

v2: Improved help messages, removed references to bootloader
and made them more descriptive. I also asked help from a
friend who's a language expert just in case.

v3: This time used the corrected text

v4: Copy the config strings from the arm32 port.

v5: Actually copy the config strings from the arm32 port.

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
Signed-off-by: Debbie Maliotaki <dmaliotaki@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/Kconfig | 57 +++++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 55da93f4e818..23ac6d6f9ab2 100644
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
+	bool "Use bootloader kernel arguments if available"
 	help
-	  Supply command-line options at build time by entering them here.
+	  Use the built-in command line as fallback in case we get nothing
+	  during boot. This is the default behaviour.
+
+config CMDLINE_EXTEND
+	bool "Extend bootloader kernel arguments"
+	help
+	  The command-line arguments provided during boot will be
+	  appended to the built-in command line. This is useful in
+	  cases where the provided arguments are insufficient and
+	  you don't want to or cannot modify them.
+
 
 config CMDLINE_FORCE
-	bool "Built-in command line overrides bootloader arguments"
-	depends on CMDLINE_BOOL
+	bool "Always use the default kernel command string"
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
2.18.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
