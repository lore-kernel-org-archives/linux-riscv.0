Return-Path: <SRS0=aLlD=DX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5439C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2020 09:18:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55E4B20848
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2020 09:18:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e+1IpVxu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CgtmExUW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55E4B20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8nlzwGg4nCqhBoHY0cYvscuwj4aoYl5MOQD+e6YOcIc=; b=e+1IpVxumKZe6idM7FJJ6si6K
	nnMFh2CoMLAT25OfaMgmwHEPYXlOl7V1qHfPwm+8UkYDNqWOnVch+89LUW6Kcnb142Z/9SgHlvs5M
	/G0sndTIzr/96pweNm7sWAoivjkQ7wrTTMx5b6C27H3BixXoZ42A4LVCPmYlYc4vz0VemGZg4UEXN
	dUZoyM1TjmAjvlLCMMfhqLA26ouPCyRKEPT0SM36NdhIk2XeKlF8uzZEda0UcCtOimrNxTUYV+8Tl
	0YGnkMfDecPhDnuRqmV3d+bFrxZ+Y60JZ4oCtwLgqPBE1xuCkjIgCB45fY7+5ekhMtnBVv8JGnxbT
	q/oOsfQNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTLsn-0001Fq-TL; Fri, 16 Oct 2020 09:18:41 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTLsk-0001EN-PE
 for linux-riscv@lists.infradead.org; Fri, 16 Oct 2020 09:18:39 +0000
Received: by mail-pg1-x544.google.com with SMTP id h6so1074595pgk.4
 for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2020 02:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sRaF6Mwni8+Vwf7sBaaO2gcjbQUqRqjZDqApESEWqS0=;
 b=CgtmExUWNUEU7e7SaEEmqqeZEZM11L28d+AP7kuqSmG5yFZSVxIlDqV4gUcSvKqFX7
 n3IC0WEnD1rQ5uan3+57oopZpYv0cE7nWDjW/l1BPR179a0kxYhCuPj8eFd8QpAydPY0
 LwPuHZtZPgxNAoKq8Vx5q0Db9MRQFVsx+KnLtPQvJVLzkbTMeOj8VMpg6FXOiA64x35h
 oVVXctXHgZIOM1IeIBmYaMlL+Z1+Yj7jbaqmL+4Ifzmru2nLaK0N+qn59tSXs+L+bpm/
 fNIbfqz1dwcgUfALrhMSNPE8sn6DDMwhfUM5fTK6JZZDpmoBQZdvqXk8SK2/5MHugYO7
 vCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sRaF6Mwni8+Vwf7sBaaO2gcjbQUqRqjZDqApESEWqS0=;
 b=p3qOuAkBExwBDs6T9J4ZNPXqI2tYEBQ/xaAiBaFXehXJD+4o5VrA7l8/Znd+RPlsL4
 P92mPxktyk12JoH66XuEtt9V8h6v91lHNbf1JVlaq9ADyrMUxOFKOm9f6vFMUT/qdKhC
 SpQWU3KcitrmZb5RtCI/bOKJkZPHYNY8/wAI3HsSV8t/NLszCPQRWajSZVAKP+5OY7dz
 LsorO3Ro8KHBO2B8PIR5dbXcMIjulQ+SJpD7J02knAEwQxf36A2UGfviT+R97Ste+9r1
 KAevilXRwr2dXUIBEQ7ZkxGBCa0CIjLxUc60z3A9XkQO5WxDSuoGFAWLXA0mUdfbbWJT
 v5ag==
X-Gm-Message-State: AOAM531dsWHXDfdyxHsDWMKnTNAvgJs6I6blfTLHV7mNQQSyXuH+7nbe
 yEfp7e2CwJ3F/RycazP73jN5+4srnOWmBFnx
X-Google-Smtp-Source: ABdhPJyxnrcUEp8S9lsRLnmwa+FVZoqu+DM/fPAhvhv8y9PNeFiYG6YqGB+Fq428Lw7ND66qjCBWqA==
X-Received: by 2002:a63:e057:: with SMTP id n23mr2212009pgj.87.1602839916388; 
 Fri, 16 Oct 2020 02:18:36 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h5sm2093263pfh.9.2020.10.16.02.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 02:18:35 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org, yash.shah@sifive.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 2/4] clk: sifive: Use common name for prci configuration
Date: Fri, 16 Oct 2020 17:18:24 +0800
Message-Id: <691e24d1c45a4b56b57ce1e02a04268c4253a77d.1602838910.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1602838910.git.zong.li@sifive.com>
References: <cover.1602838910.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_051838_823359_4E790323 
X-CRM114-Status: GOOD (  12.07  )
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
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Use generic name CLK_SIFIVE_PRCI instead of CLK_SIFIVE_FU540_PRCI. This
patch is prepared for fu740 support.

Signed-off-by: Zong Li <zong.li@sifive.com>
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
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
