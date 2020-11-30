Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF51C64E8A
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 08:23:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA96020731
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 08:23:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sqx9cgCm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mfwPWEz/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA96020731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ItIBR8WJYmeILAE1IwGTizD2gsWD2xcttH6qtx1LVlg=; b=sqx9cgCmtaN6AzMuiPcGc2yyt
	c0kmau0/WWwzRd7Qxzp6ippYtkugFhZbcFydbnr+UPCJiX24CIvYdcYuPYFRLH3lYusHnKSIr818W
	IPN5cFAPsQ6CO0Kn0/i66ubosEoHUyAzvqmbyrzD21146ZgH6lHTO7T8Jh892VNJ+YQTbEHBubu5c
	d8AkQtGbq0OyU++CvVq2a3iZRmHw8bNhPWjdPxEREgMCydV/pXSkghCTQdiDIHqsL2VqJkiHerDav
	2U8EeGALlnavINgQsl84cfYcScU+O/tw3ZyJj3X6eE76wmPJUVKdEAoAOV3tZTsUfzc9Cnsrb3IeG
	RZ8SvOjjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjeTK-0008MX-C5; Mon, 30 Nov 2020 08:23:46 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjeTI-0008Ll-DG
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 08:23:45 +0000
Received: by mail-pl1-x644.google.com with SMTP id bj5so6078603plb.4
 for <linux-riscv@lists.infradead.org>; Mon, 30 Nov 2020 00:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=swTJaeBCJSJ85jvGpvCNTGLd9zLi8EeqF0Ic677rVpg=;
 b=mfwPWEz/CJRM0/NB94KY/1D3XBd67iXUIfy+EQSaTUf0ytLC0Ukj0TlmUxpSAlxAKG
 sklU3ZWcikAGPOAQWpFn6bo56QzvuTFRHhRRAHzHzM+riPPuuw6Fqqz1hRE7COjgfYqj
 wcxBGbCqM8UcXvr2pOLJskDiFZVIkKV0XnijHaUtKYtMKoUTPy5Cj2msZ8pulle8/x0D
 YlZQZtMbL8iZAPxVty7oDcemvmygD4S6DaQJX5eZ4lhCyT5Uf5NY/dOtOmHtcGgC0Zi1
 mt2Ag310MRyHBPPj9H/daPUGP8Sy5pdrfn3KcxnSbxAlicjedSbJvjp9aEQFQe0k/hpd
 /tgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=swTJaeBCJSJ85jvGpvCNTGLd9zLi8EeqF0Ic677rVpg=;
 b=L3+FTwxcVH7qTGYLpX7XiagrEKkNlGXPL5MIxmQcGsoQuGnYhVBWfCtk9wRPwvKAlB
 3sIsl7kGS0NjppZG/0kOMpAcG+Co7VEse+WOQF6B0XmwPEk+icpuBRyMEdzHJWM0iduP
 W1mz2PKbTvDcxZ4iIcPaCe64BnJt0tSyGjZLBZAPPH/cdmP5L8w9r+9XeUKtaaDH6KK5
 MK90WqIYnngaoaZaFJpWWpHoGn36bZygCbLIpB5dMkPTJ2Tx4H4VnFaLbBkKA4edOeHk
 /mRsshF/uO4WUf1GTNAyBvebieVbZSXRKvPIgpelwPum26clQXe/LmbmC0wsv9Au+cKO
 HHfw==
X-Gm-Message-State: AOAM5304noVm7ayCuCSiyYEMbt7jDbCgGtPAgw+SaS//B+Z/T6TQDMQ+
 7sBEeZLS9V6Palptl1erSBigWA==
X-Google-Smtp-Source: ABdhPJwZtC1G54KfvnBlF+6C+5WN0K0xdjy+8Ti0bGTR95m3BYdxmwHSis4NYp7UI0nkJKxolp+mCw==
X-Received: by 2002:a17:902:144:b029:d7:dbfc:beee with SMTP id
 62-20020a1709020144b02900d7dbfcbeeemr18091271plb.32.1606724622124; 
 Mon, 30 Nov 2020 00:23:42 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id u1sm21265338pjn.40.2020.11.30.00.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 00:23:41 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
 schwab@linux-m68k.org, pragnesh.patel@openfive.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, yash.shah@sifive.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v5 2/5] clk: sifive: Use common name for prci configuration
Date: Mon, 30 Nov 2020 16:23:27 +0800
Message-Id: <20201130082330.77268-3-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201130082330.77268-1-zong.li@sifive.com>
References: <20201130082330.77268-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_032344_497022_0B2A46D5 
X-CRM114-Status: GOOD (  12.91  )
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
index 51b6ebc359e4..3074cdbc6009 100644
--- a/drivers/clk/sifive/Makefile
+++ b/drivers/clk/sifive/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_CLK_SIFIVE_FU540_PRCI)	+= sifive-prci.o fu540-prci.o
+obj-$(CONFIG_CLK_SIFIVE_PRCI)	+= sifive-prci.o fu540-prci.o
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
