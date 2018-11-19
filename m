Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CE2C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 21:06:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B144020823
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 21:06:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i2PAkcn/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jeoV0Q6a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B144020823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:Message-Id:
	Date:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xorGm/ggFY0d6/rDuq/GrX37CCBhL1FUbPvNxAxiEmg=; b=i2PAkcn/SuA9W8
	/2r3M8YSvc4Cgr6G1CH124jynpmmERs0fqO4UCs4FxyX7fc9DmXg108P6pajM+tDgSHi//Zq5H4oH
	ikIOc+mxBU+4VlwCrHhiabsqp3Wk3zU3LbU+x8fMYgtYnqqBAXZiMP3emnxfwsj+9MNU5tLD5OQFj
	kHOm1WdmWpjEUgJzYTppVIM4J2sqOzNks8wviaSXPKS8V1ZLi0mjYY5qVrnqIhxuWRk2LNJ5v5I6R
	FyahK3XjAGaGFxDY9+BxtF00B7dC/d2Eu+k8RK77+VhMfnO+KTBw7sO6j6xzVpr+Swlu7fhJbjNZ4
	16HnkoZadhvjLOe/jBdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOqkC-0002fm-10; Mon, 19 Nov 2018 21:06:08 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOqk4-0002Tc-My
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 21:06:02 +0000
Received: by mail-pf1-x443.google.com with SMTP id b7so2206001pfi.8
 for <linux-riscv@lists.infradead.org>; Mon, 19 Nov 2018 13:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:cc:from:to;
 bh=L5wwL34PyGgziVwXHLMgtJ9ExyAFaIYBQz/zqSoClbQ=;
 b=jeoV0Q6aujVbRyVxYh91E1XGfPzssLWAE04uK27j2LhMqlapvBwwl5/ms6ZayZbCNx
 4u2PVHRFT8Ji8cVG8X5Tkxl7c7tExmujZPwJmXagLLfgXNITwkKTILjcNgdVTdNwqycQ
 hv/51B+IdUJAyr/c9iZNfbNnJ7fi9mtUKqsmD2AQAHvpvhJhV1D8460747SNoAnxrsbK
 q1WfH3oSlippF0nurpxogRAgxj2PofR82a9fRFbZSyF2Um4ydKlZreKJ4nu/IpIZYW9B
 hs2Z4iyA1DpSjJTABuIcmc/S+yoMhxYbrSBQs8cDyW2oJ8vCuGSAQD8K9ttQFywq4W53
 WTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:cc:from:to;
 bh=L5wwL34PyGgziVwXHLMgtJ9ExyAFaIYBQz/zqSoClbQ=;
 b=NkDP7vKVdQq4Fir/7nKdTZtgUqhfQc6LWWQCQKhoDDY1Jdof+HetaC8I1aYqzqEDF5
 pnkC0gOnYfpNHrs7PIVjboNe0HJesMSbKOyo7w34J28TX/AKJf9oA0HbttCzBJNctxcM
 HJfCvNhzzr08GWx4xJl/k6FuiOZHjX/fjJ8dIVDbtzv/JtLyn06z6Y8hQ8ZRbIk6NKz4
 +aJiCTZbqf+M3QEBXXPhL5ECWuSUTSL0sgzc/1OW9351o7Xp6l1CyjcefBvUpBjk3RrN
 h9XMU+t9EG8p6TEBwzTWbYLoo2y74Jhf6Zf9/bk9R52WJty8gm2WyUPHF2sw73iUAtb9
 oOxA==
X-Gm-Message-State: AGRZ1gJouHS/faR2uJjmm0IEY8g1cnqXqpcS1INI6377yiLl7pN5wGIb
 dRfosvWZLYV6t8FuByzKq5l5U98gZvc=
X-Google-Smtp-Source: AJdET5fzJq/y0S3WszGVKXyL4yNS0yWlsTo7Euf/zsSyvPg7iBuv5Y26kb2725qQsiTLhd2Yrr8lGQ==
X-Received: by 2002:a63:5a57:: with SMTP id k23mr21339648pgm.5.1542661549676; 
 Mon, 19 Nov 2018 13:05:49 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 123sm43698387pgd.75.2018.11.19.13.05.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Nov 2018 13:05:48 -0800 (PST)
Subject: [PATCH v4] RISC-V: Update Kconfig to better handle CMDLINE
Date: Mon, 19 Nov 2018 13:04:02 -0800
Message-Id: <20181119210402.8176-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
From: Palmer Dabbelt <palmer@sifive.com>
To: mick@ics.forth.gr, dmaliotaki@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_130600_844835_A3DE8BD8 
X-CRM114-Status: GOOD (  16.99  )
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
Message-ID: <20181119210402.j13QTcfYvfPQwsRf5Q4itFoyo2ZaJc4FdhuPjRof8Z4@z>

From: Nick Kossifidis <mick@ics.forth.gr>

Added a menu to choose how the built-in command line will be
used and CMDLINE_EXTEND for compatibility with FDT code.

v2: Improved help messages, removed references to bootloader
and made them more descriptive. I also asked help from a
friend who's a language expert just in case.

v3: This time used the corrected text

v4: Copy the config strings from the arm32 port.

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
Signed-off-by: Debbie Maliotaki <dmaliotaki@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/Kconfig | 57 +++++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 55da93f4e818..808624f6b906 100644
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
2.18.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
