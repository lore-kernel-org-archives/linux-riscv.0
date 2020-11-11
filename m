Return-Path: <SRS0=0ydX=ER=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C862C56201
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 10:06:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E91C520729
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 10:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qBw7oS3m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GC+wCOZX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E91C520729
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8M31xTWIfUttsrqEIOFkLkkyiFCsznYAXX4jpceXv4A=; b=qBw7oS3mwfu033UCPMmqQoIpb
	2vAv10HZmtsPiax38/U81wtjBg4Prf+wINDCyMfFA14jB9t6/x4k9OcO0u88m3qtvCxA2vv0j/u7d
	pyBT39UMr2TpTP0YPjAfe5Myl6ocXBR7SS2fxa2rwa6KzdGSMPOnjjPUtgiU2ymt5rDFCPT0SaS2T
	FoLBk0SJQFfGu50k7NlCZkQhNsmWdgkM54WUn+ZnjTlHxEXPuMNN88H30OHs3AHVulXszS5bG3SSF
	xKe8wds85aA3Q0xFFNL12ydnrEQVCoFcq4MONORy7b+XXqCl2a++jSSU31FSMA/XhxJhR8qObW7T2
	syj36oKsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcn1F-0001Lp-3C; Wed, 11 Nov 2020 10:06:25 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcn1B-0001Ju-Md
 for linux-riscv@lists.infradead.org; Wed, 11 Nov 2020 10:06:22 +0000
Received: by mail-pg1-x543.google.com with SMTP id h6so1153275pgk.4
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 02:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jUzLpOLCCQxDI0oXwDQj4vn2ea5xlcrxx/Uo+2NUKPY=;
 b=GC+wCOZXigNUTzVyZoZ5sQt0B+qGYQ1rxmobkqe9PjmIvCc/rsn/BC8H3SYZc1hh7I
 ccETM+g3YzkfkhlvzwnMVXtFwOcS9ucDcp9DLB0k6R0WOAdnNzMABEvcf5WqS0Im3vSN
 Q8DKnOqwENJeRcYAZBFf2Cm/JpxjIZlkTedy2/RlgQ0hj60kJk9yTI6lvt4enmm9Rhhq
 00HHbUlbR28KDigrln9y4ub2QAB8IT1RoQdrVL8NlXWcUK/g1VPzGDK9B1xJ0dx8NrNO
 0WrqDqiHfe0ve9o60xGs5YrUO4zAbx/BYypBao5sHykIa0P47nR/r9/I5PDEpjN94jxC
 sPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jUzLpOLCCQxDI0oXwDQj4vn2ea5xlcrxx/Uo+2NUKPY=;
 b=qpt+M+z3gzNH3+8gmx03oWa43xIXEC5PTMslEd6R5Sl7l1rVS7HOPJt/XzUyfQXh/k
 MQJPZxGh8zyZFR6V9zMFXbL04yHowZaDdn8SJZ9A7QPc/Z2MM3XxzIHXWtgBwDXPqICD
 0ku+Z8LEQDuATbKcNJUlF8dhXub/sK4MNMPTNJYh86UXqymHHUNaXgWSG8nHpvUyaKWA
 q11d27V29oreOq7kK+1VDMIbMRPBXdS1Ra4rJuviWOb02GLLSqVgLWVuYcoocJbRsEqE
 fk/jhVIOy7AKX26bE34/lEWTmXaHwzz3zLIgdgT8nUKq0WzlPHiqgGY4GD1k8DZmbp4D
 A3YQ==
X-Gm-Message-State: AOAM530gEeGE8OMORL33Vr/vtRwFsN1QjnQM5BPR+3Rn9/uySLb3uYjl
 54lBbM0xgBN1yrC6kUnjgcpNLA==
X-Google-Smtp-Source: ABdhPJzaTSpLq60xMn+cJpFbOkkYXEhNYIOqlqrtQTK0CvD4ZUtz6woJa+U319CNjyJImvVsb89P1A==
X-Received: by 2002:a63:e650:: with SMTP id p16mr20477838pgj.295.1605089179165; 
 Wed, 11 Nov 2020 02:06:19 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id u22sm1872801pgf.24.2020.11.11.02.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 02:06:18 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
 schwab@linux-m68k.org, pragnesh.patel@openfive.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, yash.shah@sifive.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v4 2/4] clk: sifive: Use common name for prci configuration
Date: Wed, 11 Nov 2020 18:06:06 +0800
Message-Id: <20201111100608.108842-3-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111100608.108842-1-zong.li@sifive.com>
References: <20201111100608.108842-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_050621_742564_129A155B 
X-CRM114-Status: GOOD (  11.99  )
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
