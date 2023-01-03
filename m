Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0936C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 21:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2XQmWY8ITjtnVEMKQY+l3PECozrslPxDPlMFOJGH7AQ=; b=GsEmvb14CrmjJN
	p4eRCYJXcGkB1gmkqDHne9E0m4SVRhPb5SfiJV6oXs3NqfrhE/e5BEMq1MmZ2raOX2RjjDgVWx2hi
	bF6zC2Kp1QmIvm75Yc9LGg/mqqEN/KwKafcp3R87xdmo1u4kNsOOiSYPIgB1pDCm54LgP/LqIC8fA
	as385B/DlDhukL/UMyZ4QtbGneZ5U28iy02p4wsr8C48Yh0uHd9tlwAtKfpfZbE/3C8wDxd4tmrav
	DWyIoT6EgJWYdD9xdqLO3z1o1S1tG+eBdHU5ufTKEYkv8hGtyVNs/+byIa9dTOnNZPu2iC1cW66wt
	oe9/TbHh8N/KjFnhpj8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCoZ9-0050hh-Tg; Tue, 03 Jan 2023 21:11:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCoSs-004xno-6i
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 21:04:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D392DB81107;
	Tue,  3 Jan 2023 21:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAA1C433EF;
	Tue,  3 Jan 2023 21:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672779891;
	bh=gbW76aZ9HGuqGjsmnFp+/NvAvQvLy+7M6AdSPdrCtKo=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=LcC0yCDwMR7PZS0esb/VHxJezgq0SJORsh+B/QxOrs3kw816IdMvDu4g1/v2jnudn
	 PJFoGUxSYfNCCVmNuurLtMNHvExWnzAExsIY1sQ4WN7x7l5Ow/xMdLdZdeTt2kP37z
	 SkzzgyceMgfJqgdtlUv2Xhw7Kd5GCaXn+8mIjhty3L9C70/HR+X5F5cmTOCpnGlYSL
	 lTixXFvNVUNFjenqZzqmge8fiEeS+/7Y1XZDvO7qg4SmlP2ISTcoeVYnwGCKPj4GoZ
	 UFsWy1wrxHFLM+3vRptn992u2cyIVPRp/DYbzsL2oSJIsMQBsbyYsPAMQlrSGI8U8d
	 xkPP8eBdsMFxA==
From: Conor Dooley <conor@kernel.org>
To: conor@kernel.org,
	arnd@arndb.de,
	palmer@dabbelt.com,
	prabhakar.csengg@gmail.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	ajones@ventanamicro.com,
	aou@eecs.berkeley.edu,
	apatel@ventanamicro.com,
	atishp@rivosinc.com,
	biju.das.jz@bp.renesas.com,
	devicetree@vger.kernel.org,
	geert@linux-m68k.org,
	guoren@kernel.org,
	hch@infradead.org,
	heiko@sntech.de,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	magnus.damm@gmail.com,
	nathan@kernel.org,
	paul.walmsley@sifive.com,
	philipp.tomsich@vrull.eu,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh+dt@kernel.org,
	samuel@sholland.org,
	soc@kernel.org
Subject: [RFC v5.1 6/9] cache,soc: Move SiFive CCache driver & create drivers/cache
Date: Tue,  3 Jan 2023 21:03:58 +0000
Message-Id: <20230103210400.3500626-7-conor@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <Y62nOqzyuUKqYDpq@spud>
References: <Y62nOqzyuUKqYDpq@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5910; i=conor.dooley@microchip.com; h=from:subject; bh=HN4eTseXEkj6xdKUBkDIWyi7p3BRkjUx7UVap+uWM7c=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMlbZlimT2H/ufuDGW9yvuhPtqefzqla/Ul4EaH8kj/1YmVy 3v+ujlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExE4h3Df79W78b81JfScx0W2/bemn 71WZxH6gq1Bb9mP1awWFgblMDwP6nidsr+W37aDXOL5MyfTkidEsV19VzQFGnX3BWyEb5inAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_130454_595395_29077B9B 
X-CRM114-Status: GOOD (  13.52  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

The Zicbo* set of extensions for cache maintenance arrived too late &
several SoCs exist without them that require non-coherent DMA.
As things stand, the StarFive JH7100, Microchip PolarFire SoC & Renesas
RZ/Five all require cache maintenance and lack instructions for this
purpose.
Create a subsystem for cache drivers so that vendor specific behaviour
can be isolated from arch code, but keep the interfaces etc consistent.
Move the existing SiFive CCache driver to create drivers/cache.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS                                   | 15 ++++++++-------
 drivers/Kconfig                               |  2 ++
 drivers/Makefile                              |  2 ++
 drivers/{soc/sifive => cache}/Kconfig         |  8 +++++++-
 drivers/{soc/sifive => cache}/Makefile        |  0
 drivers/{soc/sifive => cache}/sifive_ccache.c |  2 +-
 drivers/edac/sifive_edac.c                    |  2 +-
 drivers/soc/Kconfig                           |  1 -
 drivers/soc/Makefile                          |  1 -
 include/{soc/sifive => cache}/sifive_ccache.h |  0
 10 files changed, 21 insertions(+), 12 deletions(-)
 rename drivers/{soc/sifive => cache}/Kconfig (56%)
 rename drivers/{soc/sifive => cache}/Makefile (100%)
 rename drivers/{soc/sifive => cache}/sifive_ccache.c (99%)
 rename include/{soc/sifive => cache}/sifive_ccache.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index f61eb221415b..4437e96a657b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19054,13 +19054,6 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
 F:	drivers/dma/sf-pdma/
 
-SIFIVE SOC DRIVERS
-M:	Conor Dooley <conor@kernel.org>
-L:	linux-riscv@lists.infradead.org
-S:	Maintained
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
-F:	drivers/soc/sifive/
-
 SILEAD TOUCHSCREEN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	linux-input@vger.kernel.org
@@ -19873,6 +19866,14 @@ S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
 F:	drivers/staging/
 
+STANDALONE CACHE CONTROLLER DRIVERS
+M:	Conor Dooley <conor@kernel.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
+F:	drivers/cache
+F:	include/cache
+
 STARFIRE/DURALAN NETWORK DRIVER
 M:	Ion Badulescu <ionut@badula.org>
 S:	Odd Fixes
diff --git a/drivers/Kconfig b/drivers/Kconfig
index 968bd0a6fd78..e592ba5276ae 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -241,4 +241,6 @@ source "drivers/peci/Kconfig"
 
 source "drivers/hte/Kconfig"
 
+source "drivers/cache/Kconfig"
+
 endmenu
diff --git a/drivers/Makefile b/drivers/Makefile
index bdf1c66141c9..6ff60cf21823 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -38,6 +38,8 @@ obj-y				+= clk/
 # really early.
 obj-$(CONFIG_DMADEVICES)	+= dma/
 
+obj-y				+= cache/
+
 # SOC specific infrastructure drivers.
 obj-y				+= soc/
 
diff --git a/drivers/soc/sifive/Kconfig b/drivers/cache/Kconfig
similarity index 56%
rename from drivers/soc/sifive/Kconfig
rename to drivers/cache/Kconfig
index ed4c571f8771..bc852f005c10 100644
--- a/drivers/soc/sifive/Kconfig
+++ b/drivers/cache/Kconfig
@@ -1,9 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0
 
-if SOC_SIFIVE
+menuconfig CACHE_CONTROLLER
+	bool "Cache controller driver support"
+	default y if RISCV
+
+if CACHE_CONTROLLER
 
 config SIFIVE_CCACHE
 	bool "Sifive Composable Cache controller"
+	depends on RISCV
+	default y
 	help
 	  Support for the composable cache controller on SiFive platforms.
 
diff --git a/drivers/soc/sifive/Makefile b/drivers/cache/Makefile
similarity index 100%
rename from drivers/soc/sifive/Makefile
rename to drivers/cache/Makefile
diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/cache/sifive_ccache.c
similarity index 99%
rename from drivers/soc/sifive/sifive_ccache.c
rename to drivers/cache/sifive_ccache.c
index 3684f5b40a80..47e7d6557f85 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -15,7 +15,7 @@
 #include <linux/device.h>
 #include <linux/bitfield.h>
 #include <asm/cacheinfo.h>
-#include <soc/sifive/sifive_ccache.h>
+#include <cache/sifive_ccache.h>
 
 #define SIFIVE_CCACHE_DIRECCFIX_LOW 0x100
 #define SIFIVE_CCACHE_DIRECCFIX_HIGH 0x104
diff --git a/drivers/edac/sifive_edac.c b/drivers/edac/sifive_edac.c
index b844e2626fd5..9276839d58c2 100644
--- a/drivers/edac/sifive_edac.c
+++ b/drivers/edac/sifive_edac.c
@@ -10,7 +10,7 @@
 #include <linux/edac.h>
 #include <linux/platform_device.h>
 #include "edac_module.h"
-#include <soc/sifive/sifive_ccache.h>
+#include <cache/sifive_ccache.h>
 
 #define DRVNAME "sifive_edac"
 
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 5dbb09f843f7..240455963565 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -21,7 +21,6 @@ source "drivers/soc/qcom/Kconfig"
 source "drivers/soc/renesas/Kconfig"
 source "drivers/soc/rockchip/Kconfig"
 source "drivers/soc/samsung/Kconfig"
-source "drivers/soc/sifive/Kconfig"
 source "drivers/soc/sunxi/Kconfig"
 source "drivers/soc/tegra/Kconfig"
 source "drivers/soc/ti/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index fff513bd522d..9ed2e27bbb64 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -27,7 +27,6 @@ obj-y				+= qcom/
 obj-y				+= renesas/
 obj-y				+= rockchip/
 obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
-obj-$(CONFIG_SOC_SIFIVE)	+= sifive/
 obj-y				+= sunxi/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
diff --git a/include/soc/sifive/sifive_ccache.h b/include/cache/sifive_ccache.h
similarity index 100%
rename from include/soc/sifive/sifive_ccache.h
rename to include/cache/sifive_ccache.h
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
