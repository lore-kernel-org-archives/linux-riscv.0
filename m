Return-Path: <SRS0=0ydX=ER=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F55C388F9
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 09:35:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 390FC206CA
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 09:35:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bh8RE0ql";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UGyq1yTV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 390FC206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8M31xTWIfUttsrqEIOFkLkkyiFCsznYAXX4jpceXv4A=; b=bh8RE0qlwDHpZX/tt3TcHt2b4
	PTGjN4T/i90cvEZutRLSW2PYfAtb0eB3GIlghoX+Z3MOT6DxmMqfTadEQ9WudlILlPDsBpKnrZYaD
	W1y8m43+XLulEcZWBjaNi2AbrWGHdHDrU44gnOZtkd8wNVnmr3hxTzWF71i5LCMfJWzD9YDziKRU/
	MqLaQPMiu0d8g8nW/4bk8tp4EKL5aEz+5tIODlwtY+UVdXCRRNzSeqAKsU1edZWmSQJ1nU7NuCse3
	2RjK8KhYc2IV0I9ok4Jc/q5+ku6P76pHJLYKtuUaSp4MJ+W638SL4J+LdLXWVX1LOGbC6c4OMEhYR
	P/dxfeRWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcmXO-0005p3-3B; Wed, 11 Nov 2020 09:35:34 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcmXI-0005ln-7L
 for linux-riscv@lists.infradead.org; Wed, 11 Nov 2020 09:35:31 +0000
Received: by mail-pf1-x441.google.com with SMTP id a18so1280862pfl.3
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 01:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jUzLpOLCCQxDI0oXwDQj4vn2ea5xlcrxx/Uo+2NUKPY=;
 b=UGyq1yTV49UYRiRLph02TaWZro1hVWIiT4Tk4DywL+OB71P7AOMoiNF8zcyQ4B25bg
 3aevqT98TpiAp5+XwIV1UyN7wJzO+nZikqOAlNP2B1WMvWvtqaiS8M0l2752qHJW25kN
 GWcamTWVT4wVb2fxk+gzwIe1zGK7vFnXs/tynF9G2BWlW4onBuzZzxOT4L7pX5no+767
 edU1A2k8rjNqsdPpPZyk5CTVUhDm26tTAPvWqhmlxu7sxHDmftzcXRITdsflnIv+DyAc
 o+JpWydN4tLC5jfYMR0R+MfgcdlanDbglfujs7nKqijoShFbuUhX1Ih2nd5yLgmX71BO
 6HSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jUzLpOLCCQxDI0oXwDQj4vn2ea5xlcrxx/Uo+2NUKPY=;
 b=Q+Cvz+lYXCwnShRR+Ah2AvU0lh9jhqVNRLdjENQhXDgp8+qJZQCWYn3pgfc4Sshvp3
 jGRtgjCbxgTH1qcCZfbcOvmQ5rPBYRlq3+VhIknTmj2Lq/IE+At1DllokhwOBlk8EB+g
 0e5qYuifCGMZpA7sI5KMZgxo0ez/a/C1tEksoAHlbF8LXwPc/iNs9zq7Zbia/Sa8a+U7
 ko0Qjj/1nSaaXjVjkerTGE0OONPgf2vwrbI6Y0JkDBMW8EU63W/22JxiKqTa1kxReUvS
 1Cqw1CYTv1To8lTK41bjCjpbMrsGUdIuVFJFUNIO3wJrtzQrlGKpleISw8gK51fGsUuu
 XtaA==
X-Gm-Message-State: AOAM532yCHCcTm4RzVZjH8zji/Y1bwTP1/Onkk0UiyaapxvUrJRywWvw
 HWFgG70as/V7ix4weTWFtuDE7Q==
X-Google-Smtp-Source: ABdhPJy1xLIajCcPrYI2GaBfqupBdYzvJLKKc4OlehU0OlQNjTpGwUNXC6B+xFGagGogFdDpTC8BKg==
X-Received: by 2002:a63:3c5b:: with SMTP id i27mr18893262pgn.268.1605087325273; 
 Wed, 11 Nov 2020 01:35:25 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id m6sm1862424pfa.61.2020.11.11.01.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 01:35:24 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
 schwab@linux-m68k.org, pragnesh.patel@openfive.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, yash.shah@sifive.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/3] clk: sifive: Use common name for prci configuration
Date: Wed, 11 Nov 2020 17:35:13 +0800
Message-Id: <20201111093514.103155-3-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111093514.103155-1-zong.li@sifive.com>
References: <20201111093514.103155-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_043528_363878_6F70EEE5 
X-CRM114-Status: GOOD (  12.39  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Pragnesh Patel <Pragnesh.patel@sifive.com>, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Use generic name CLK_SIFIVE_PRCI instead of CLK_SIFIVE_FU540_PRCI. This
patch is prepared for fu740 support.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Reviewed-by: Pragnesh Patel <Pragnesh.patel@sifive.com>
---
 arch/riscv/Kconfig.socs     | 2 +-
 drivers/clk/sifive/Kconfig  | 6 +++---
 drivers/clk/sifive/Makefile | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 8a55f6156661..3284d5c291be 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -5,7 +5,7 @@ config SOC_SIFIVE
 	select SERIAL_SIFIVE if TTY
 	select SERIAL_SIFIVE_CONSOLE if TTY
 	select CLK_SIFIVE
-	select CLK_SIFIVE_FU540_PRCI
+	select CLK_SIFIVE_PRCI
 	select SIFIVE_PLIC
 	help
 	  This enables support for SiFive SoC platform hardware.
diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
index f3b4eb9cb0f5..ab48cf7e0105 100644
--- a/drivers/clk/sifive/Kconfig
+++ b/drivers/clk/sifive/Kconfig
@@ -8,12 +8,12 @@ menuconfig CLK_SIFIVE
 
 if CLK_SIFIVE
 
-config CLK_SIFIVE_FU540_PRCI
-	bool "PRCI driver for SiFive FU540 SoCs"
+config CLK_SIFIVE_PRCI
+	bool "PRCI driver for SiFive SoCs"
 	select CLK_ANALOGBITS_WRPLL_CLN28HPC
 	help
 	  Supports the Power Reset Clock interface (PRCI) IP block found in
-	  FU540 SoCs.  If this kernel is meant to run on a SiFive FU540 SoC,
+	  FU540 SoCs. If this kernel is meant to run on a SiFive FU540 SoC,
 	  enable this driver.
 
 endif
diff --git a/drivers/clk/sifive/Makefile b/drivers/clk/sifive/Makefile
index 627effe2ece1..fe3e2cb4c4d8 100644
--- a/drivers/clk/sifive/Makefile
+++ b/drivers/clk/sifive/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += sifive-prci.o
 
-obj-$(CONFIG_CLK_SIFIVE_FU540_PRCI)	+= fu540-prci.o
+obj-$(CONFIG_CLK_SIFIVE_PRCI)	+= fu540-prci.o
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
