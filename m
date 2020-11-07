Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF932C64E75
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 772F720704
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g8VB+EIh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="O5gdys3V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 772F720704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ii/nC/UCvclJrGrVkHhSpeUcFl5nyVjcljo8J2GiNdY=; b=g8VB+EIheUpzW/fsZk0r7DnAm
	cnJwUNemVKZrBPOg4eCoANAVR2YlgNjbbemRDlob53BKrPZ5k7AZE9KF9z4F3OOsQ4RouqLvwaP+i
	jNbPQNPtnQpcL7daH67gEy9ptS8xq4cQcZh4GMcZ7SaE9lGd8p077WQr5rVYqI+rWCqO7sAtMOsAw
	C9vgScgM10ljhgOAhL0vUXJrWUwCo+XF8ujvC4TJ5+ZIplrwNnGaLqb1PWQA1Ma7ppomT2XqiO47t
	yCAor5Ac5RpLmdJuIIAPv97xBTgHeVrT4O+TCZ5RBoJqf6jEzydF2h1c4638Gu9RmSZyNpu0RUZOW
	78UsBJIOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJNE-0000gt-RA; Sat, 07 Nov 2020 08:15:00 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJNA-0000PH-F4
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736896; x=1636272896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j1x1G3XInZVmPKyvKou7aPWZB2ab3LHivJbgfaIIf1E=;
 b=O5gdys3VmVXQfy8KWcOoihCBf7O04HtITKZefJ6GZXIGFpxMYb4o6fRI
 DvrfU/yAz7aJrEktewHAnykLB4sFf6KbAcgT7L+/OpLxr8iE0xSsQYYHB
 g0z7klEA9oYocDgkdHMAwIaKTaQNGdXr3BVCqEOH3ew+BJ/0F6dNW+yIa
 zBmfzDRrSevj6AUCu+I8IhsCREISglG7ZO0R2YSwnXjMyBsFTo/xaRHK1
 5KlGV/nbogH3aaGiQm++/M6g5heEDuEZwOuaWOonrciwyVxjDMqOgLFdg
 5qzTLTft3Or0AOhXCffWnLWVhuP20zrFRI8DuXB+FT+1FrbhR0mWF+JdZ A==;
IronPort-SDR: 3NpnJuEhZAROupR/wzH3nPMAqXUXfkUIV8Us8Xt1HzzZXXfqEdDcehygig4LlvEi0mgT3JC3AM
 ahl4JtRYIlQE6/k7Mhdxb4Zeq1voqHhpvVVl1gYILxBo44tet1dKCjev/bNRYX+6ZobOj2UEUe
 OXz15IXoDdFVYHeQLDdnQAAhl0Qx9Kl9SXVHguTaCtCfyE1q0hsIxSYcZti32VBN9Gy23B7b82
 lP05EQp/tb8Rn7lwMgu4n+I8HC+V6ukhGauc3C3LrTKDITpcBwvNSbipihVaX1th2DHFbX8dzB
 Kf0=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079291"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:14:56 +0800
IronPort-SDR: iIw2GFiw4X935ow3aDLHVEvchpuXsoNMc2tKdMZ7tsvXrLSoNiApA41bcjxa4IbC+yWO2Ck2I1
 gy2FiXaqHkYlcv5jBtt2ayGHKgbkxx+R8l7QtP95MRMt7/33maul/EYNUMVZXlQJCaceXdnbbi
 27ztlY7aCyEhBnOxoM8GxfQVV/SzTbw1TkKzJsEiLmmPNc/2eECghSKjQBbSvXxiMiqprsNV++
 6otzMow5bRSY3Xy5+lg67BFpCNlrF45ZcfPYaYCOcoGXuJSpJbgwjMWXHH+kmc4GqinWEK0n3w
 aP2vHhbzf8WQTKAlUNhEk9cD
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:01:00 -0800
IronPort-SDR: cDAYLC/Y3uvh8Vg5Uw/U3omgYHlJ5tgAt5xkJ+ZX3vNx/zsmJdc7c8iZKsQEVC56BhIw0O2+mu
 CUe1wghA6cqE9JUn7x46JYF4ba2yB4PZTwKhnvYYeyQ6FsYtzu4HM7uY+6w/gVTyHCZVEj+Vtz
 rJl2S0ANRS5XszYtSghrto0CMCO3RnmSogqkj8XGq6wSLeIfsfQXLhfHCR8MFhp8n+i8akiwtp
 GFd+3ctJ2PwrEMeMCpTKE3Ov1EoV0oF4ssbXK5nOmLxCGs5RscS1lhj+8aEp1DYia90vdaLsDS
 g4k=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:14:54 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 12/32] riscv: Automatically select sysctl config options
Date: Sat,  7 Nov 2020 17:14:00 +0900
Message-Id: <20201107081420.60325-13-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031456_884981_10B1F45E 
X-CRM114-Status: GOOD (  13.87  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

With the device tree update for the Kendryte K210 SoC, most peripherals
are now defined under one of 3 advanced power buses (apb0, apb1 and
apb2) compatible with the simple-pm-bus driver. The sysctl SoC device
is defined as a syscon/simple-mfd device. Enable the configuration
options PM, SIMPLE_PM_BUS, SYSCON and MFD_SYSCON to enable drivers for
these device tree nodes.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/Kconfig.socs       |  1 +
 drivers/soc/Kconfig           |  2 +-
 drivers/soc/kendryte/Kconfig  | 19 +++++++------------
 drivers/soc/kendryte/Makefile |  2 +-
 4 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 8a55f6156661..e724fddc44ba 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -29,6 +29,7 @@ config SOC_KENDRYTE
 	select SERIAL_SIFIVE if TTY
 	select SERIAL_SIFIVE_CONSOLE if TTY
 	select SIFIVE_PLIC
+	select SOC_K210
 	help
 	  This enables support for Kendryte K210 SoC platform hardware.
 
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 425ab6f7e375..f511cad87a0e 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -9,6 +9,7 @@ source "drivers/soc/bcm/Kconfig"
 source "drivers/soc/fsl/Kconfig"
 source "drivers/soc/imx/Kconfig"
 source "drivers/soc/ixp4xx/Kconfig"
+source "drivers/soc/kendryte/Kconfig"
 source "drivers/soc/mediatek/Kconfig"
 source "drivers/soc/qcom/Kconfig"
 source "drivers/soc/renesas/Kconfig"
@@ -22,6 +23,5 @@ source "drivers/soc/ux500/Kconfig"
 source "drivers/soc/versatile/Kconfig"
 source "drivers/soc/xilinx/Kconfig"
 source "drivers/soc/zte/Kconfig"
-source "drivers/soc/kendryte/Kconfig"
 
 endmenu
diff --git a/drivers/soc/kendryte/Kconfig b/drivers/soc/kendryte/Kconfig
index 49785b1b0217..11579139ede6 100644
--- a/drivers/soc/kendryte/Kconfig
+++ b/drivers/soc/kendryte/Kconfig
@@ -1,14 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
-if SOC_KENDRYTE
-
-config K210_SYSCTL
-	bool "Kendryte K210 system controller"
-	default y
-	depends on RISCV
-	help
-	  Enables controlling the K210 various clocks and to enable
-	  general purpose use of the extra 2MB of SRAM normally
-	  reserved for the AI engine.
-
-endif
+config SOC_K210
+	bool "Kendryte K210 SoC drivers"
+	depends on RISCV && SOC_KENDRYTE && OF
+        select PM
+        select SIMPLE_PM_BUS
+        select SYSCON
+        select MFD_SYSCON
diff --git a/drivers/soc/kendryte/Makefile b/drivers/soc/kendryte/Makefile
index 002d9ce95c0d..e67425707484 100644
--- a/drivers/soc/kendryte/Makefile
+++ b/drivers/soc/kendryte/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_K210_SYSCTL)	+= k210-sysctl.o
+obj-$(CONFIG_SOC_K210)	+= k210-sysctl.o
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
