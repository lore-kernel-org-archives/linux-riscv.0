Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07189C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 09:49:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B11523433
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 09:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B11523433
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ItIBR8WJYmeILAE1IwGTizD2gsWD2xcttH6qtx1LVlg=; b=wAhLwotlx/7d/LlNPDFpVHXXg
	nehVDONEbJ+xRn3P40Y66bZI4yf9E5euBshO9aYAHxAk80jtrgbFRqHahnCyTdGYpV7T22+2zxMrl
	F0/evil47Pk37TCLPl3TUf2Fjb1tyo7bptk2H4i4144gl//vnNWhMQc3FmEmObG7xujVSEZLeuNO0
	f490SMuMdUg7LgEQEF/pdyqDhIZvgnVbmLi+U7bUrJzCapIyB2/WpfueaVtRE1/WwvR/w61mM3ruN
	ysBAYGapCEViXqdoG37wovuHG6sLtGZdlAaPF09QWSUiJaXrv+gzxGQZUTSPyeUPuytl0wFTiak+s
	xLxVypYgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmw6I-0005r9-Qb; Wed, 09 Dec 2020 09:49:34 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmw6G-0005qN-51
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 09:49:33 +0000
Received: by mail-pf1-x442.google.com with SMTP id i3so674139pfd.6
 for <linux-riscv@lists.infradead.org>; Wed, 09 Dec 2020 01:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=swTJaeBCJSJ85jvGpvCNTGLd9zLi8EeqF0Ic677rVpg=;
 b=RxFi9/p86xNpYk+bgvT10A5D8Q5O4kxMzyz75yKU8o4khbCrIEWDcrKszYL97lxjj8
 qwxW4xuV0N1nn2pxp6Fu6TEnHrVA/00qzvN2jqVTVxFe02M0j+sI1+zO9bUvZylpgWsl
 6LbFuO0YAI5n0F0SrC9I1j3nYS/lNjlQZHWRDvAiqOaNieugsUFobG1kjNGj7Y6BSjBk
 cacQjbk9m9WuyhQPl/uJmJ+oyR1FPxtbRkLa84Gd4O8GELdBROCX6bbQYjlLz80fiss9
 zXqr4IEkBA4FTgM4oO6jtiWz1rn1KKVNYxMDsUOOftukQ+3a/7oh6heI9uwAC83KvmGb
 xfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=swTJaeBCJSJ85jvGpvCNTGLd9zLi8EeqF0Ic677rVpg=;
 b=c9mQ9yN2tGfTqDBVdAlIWs22/YgUH1XflzGxrbyBq7y6wzh3Pwzso0RLLShDM7bhbR
 bK0LSzgNLGi2cTBqry5Yei9v+o3VFB5LXaopf/qCzKYTwNq2CrvQuDexRw4gFuK8AZ+E
 kOgteoiSxFDCanFlOgfhhCADZmplRhljhikxgBZICsCN0UdNZWUHeoqgQ+d+WUHoFyAB
 o6vE+tZX1QHZkowWge66Ym4iDmXKxELGrCML38uJjUdL1DZr13AtphQdvfPdbjJ+Z3uu
 Phh1nUO3Pq8QLqiOzT/1+lJkwyqT9o8Hyw5v9ahPzRmlaVE7/2MyhWkZHQHj7Br+FQp7
 7K9A==
X-Gm-Message-State: AOAM533rVGRH8Y+benWEfR0IUnbVjRtmOtYrjq60UjEhpAABCeFWgbyh
 T4PCTPrOKOn1ytj4CVsE5n/mOQ==
X-Google-Smtp-Source: ABdhPJxxFa9Co8dth0Y5535n/HOB9tOdSNShGd/e9jPuwNVWTmIZqj1EQu6nnWEdPn7oky+hRlUOPQ==
X-Received: by 2002:a62:145:0:b029:19e:a395:bd3d with SMTP id
 66-20020a6201450000b029019ea395bd3dmr133559pfb.13.1607507370226; 
 Wed, 09 Dec 2020 01:49:30 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id 129sm1890354pfw.86.2020.12.09.01.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 01:49:29 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
 schwab@linux-m68k.org, pragnesh.patel@openfive.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, yash.shah@sifive.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v7 2/5] clk: sifive: Use common name for prci configuration
Date: Wed,  9 Dec 2020 17:49:13 +0800
Message-Id: <20201209094916.17383-3-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209094916.17383-1-zong.li@sifive.com>
References: <20201209094916.17383-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_044932_210048_C92D5FBA 
X-CRM114-Status: GOOD (  11.59  )
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
