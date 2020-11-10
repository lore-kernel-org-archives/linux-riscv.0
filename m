Return-Path: <SRS0=iBsL=EQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62C1C5517A
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 07:28:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 414DA206E3
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 07:28:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zxgmEY+U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cfjg5xRE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 414DA206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zqQwspFwtdlpoHKdFIaIAO6Tm37ZRCf4ZchyVRF4ABY=; b=zxgmEY+U2+OVfM/MQyHANbIvB
	NC1rNbPQ7PRZ0X4JCsKBgyGwfdBS1MQZ9MpD1Z/btVBx86Bbto9yzQ5OHF1LpIpw9MbZ9U2Jef40l
	9SpEMjGBFqjcRKNAvht8XVAjfofbaE3ewiaXLqnf9lSHrONsfUJrzzA24FtZ77FGL+UjeDT8kGIan
	Idwnpqwtq3noLyUiEeZXpQ7n6Kg2cPxnHzoWdmp7p8pae3uxjafdmmCAVu5B9zF8O6nIY1IHIE8kO
	vAXuaEJTY2XvGz6amxVUoTdLF6GegiF03HjXu069muLqrb63jV/47OO14RrwhRS1Vk2Iz/je8s9y6
	eOQMI0CJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcO4f-0006so-Ex; Tue, 10 Nov 2020 07:28:17 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcO4b-0006rK-S5
 for linux-riscv@lists.infradead.org; Tue, 10 Nov 2020 07:28:15 +0000
Received: by mail-pf1-x444.google.com with SMTP id x13so10591819pfa.9
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 23:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZPFssOBFXPN+PkDtNsUiYXjW8B02NyB9bBJ4rxKfbCc=;
 b=cfjg5xRE/zlIowskP8odmXpMLZnFM//H9xPLln3yP9fzzd8+vqIOwCqkvFuIeW74yw
 1y8sppdzbM3r4b/9aPtW7qA5dVy5P8FarUGOAVoIxalcOD6bd4G3Mx8TdXQ3nk1gCI/b
 +LO5FxLVXaFhB+XBn8vTHNYAVGZlEc7pNrRmmHd0XYlS+6Yu5D84cAIVCy8pyLgADinC
 Bn5giJ6oumBWZ9pBTmyhfU/eNTWsaqSDIYIB8XPbnXU2S5fY8IewyAMnER03V9Ojr4mR
 UVRh3p70/Zs52hiUYA9ZR0iyXabFMDkZNVIlR3X6XtLgicdIjEH9raVr4HHGFk5nNTV4
 wD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZPFssOBFXPN+PkDtNsUiYXjW8B02NyB9bBJ4rxKfbCc=;
 b=ZvEefkn7CzPP6HmZ3IoZVv1UPxfWqpdEk59sQITXE/w9Q5L63npawueAXPQQgc8oEp
 HHhpYIbxPilIIPYJXS7R7PvgfShqhUa20QhPve9vGvcZQNoA6HLPlwbLZI/T/w5m4bOD
 7J6TaKeg0LKee+sAvU4tD0sLFvaCGrvUSwKnxULAdOvJ77xaWSuiQsCGQinvZf+sLQWC
 OB95w+hsDH6X3en2HtZUSYqUD52TtkDo/weKVYiD4FaY6rL6vlr+oC+cxOAek7ukQact
 Q88/0uonpUQNDpxTEoil/+yrHItUIUUe2HvR4MMC0fMC902B6EGYSM5LbDLk7doH+01G
 3XsA==
X-Gm-Message-State: AOAM533ErpPmq81GkdOAqyoZxG/Wo/X/r/F3kZCCEBRIwxrViE658MJh
 Xrivvr85lEdXrR+z33/timqE3vQzcl5h/g==
X-Google-Smtp-Source: ABdhPJz7FLTROBwdZkxpBd8kpEQNPBaQzHio5jHPrLvZ6LyRWGn7k/jwDec7Q3C6mvNl06pSbI/FYA==
X-Received: by 2002:a63:7e09:: with SMTP id z9mr16003742pgc.150.1604993292200; 
 Mon, 09 Nov 2020 23:28:12 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id w22sm12233191pge.25.2020.11.09.23.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 23:28:11 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
 schwab@linux-m68k.org, aou@eecs.berkeley.edu, mturquette@baylibre.com,
 yash.shah@sifive.com, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/3] clk: sifive: Use common name for prci configuration
Date: Tue, 10 Nov 2020 15:27:47 +0800
Message-Id: <20201110072748.46705-3-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201110072748.46705-1-zong.li@sifive.com>
References: <20201110072748.46705-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_022813_981920_73A68D00 
X-CRM114-Status: GOOD (  12.80  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Use generic name CLK_SIFIVE_PRCI instead of CLK_SIFIVE_FU540_PRCI. This
patch is prepared for fu740 support.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
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
