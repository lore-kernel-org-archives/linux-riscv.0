Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0BACDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 09:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+iRUIOEXI8fF3l95wQMyA9+LTmGWHOUZSwmSvTYAPqc=; b=wKJZSdwrF6/74u
	aLov76t08sxP/GG8Xj/vu1dnBPL/TKDGaspOrUpI8slzssiL6YV3+t16utI7trUhMZ72A3+pqDcFo
	CU3S0ZKTOVH+AUNQnxw5Qq4/cY3f+v8KE5efcc05uTK80fZ9+7qLeKRZ4cGiVwi6kCGKu3ShcY3wh
	Ia9rS/xoz4k5yb7o9wJmgfCqT9wNR0ScC7fA/s8m1fwNFObhyOLXS4hgGYx/h4p9NcnEng/lF39IR
	5KdEu70OUXg4xi07f0Hw4kXCnHIUErzA7GCHnMk83HLKpB6KKsWhfznJ/ynV4izZ8c01SZ2CS2DXc
	UbcwPrFBmA26ZkuWQzJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqruD-000Mj6-18;
	Thu, 12 Oct 2023 09:22:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqru9-000MhH-2W
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 09:22:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2CB62B82380;
	Thu, 12 Oct 2023 09:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13C1C433C8;
	Thu, 12 Oct 2023 09:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697102571;
	bh=BjOxZ1EFiH/qIGsevCoi8uYhpDF65O0lMqqR2TjIS6k=;
	h=From:To:Cc:Subject:Date:From;
	b=lcwCF/9ZoDcUuhqXgQ0Pq042hN8vA3TNQC/1SWr9aDBoxGbvbP/tvQ+PZfAHUXIVG
	 /jJdV42rml/1RkWasOXzk+GknCxl52mRPXBC+Aab0DKchnethua7BA8LOiw6p/xnFU
	 HmTDg8xfWLdvhwsWvm8zg6WxvBbb6vJdIQCmxs4nc5juqcj02ayGahoxXM398HEjzN
	 Q+YyFBZV+Sky/n1lwPHIV8GEFMj3u+8wXEQJ0UIVltQGe8VKsLdYhPS4zTaV3+2qCk
	 m1zDz80aMEstZbyyDtOl+5yMqRuVPVsPA7jsQCbxmYSfZg/1bkeSxq8L6fRB05MwFX
	 LlhwcRn+ORueA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] soc: sifive: shunt ccache driver to drivers/cache
Date: Thu, 12 Oct 2023 10:22:09 +0100
Message-Id: <20231012-mooing-refined-ad1ab421c0d3@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4788; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=QQJmomIqc987f3Vcg8dfnw5kTv8CmJ3TfKvt43fjd9Q=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnqu/bdyFs/u6I1yr+2cEt+j8qCtZ0TZ83cVSd40q5V9 5v6ysK3HaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhIfzbDP92XE93XOwRN4hX8 /3WfSszcZmsuQZ+32Z8uXdD7vVxMOoHhf966qZ7aW+oz1iz82yemcmTlwvsMa5mil6/9Xrvy0dn 5mmwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_022254_114987_1B831320 
X-CRM114-Status: GOOD (  13.43  )
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

Move the ccache driver over to drivers/cache, out of the drivers/soc
dumping ground, to this new collection point for cache controller
drivers.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor@kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Emil Renner Berthing <kernel@esmil.dk>
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
---
 MAINTAINERS                                   | 14 +++++++-------
 drivers/cache/Kconfig                         |  8 ++++++++
 drivers/cache/Makefile                        |  3 ++-
 drivers/{soc/sifive => cache}/sifive_ccache.c |  0
 drivers/soc/Kconfig                           |  1 -
 drivers/soc/Makefile                          |  1 -
 drivers/soc/sifive/Kconfig                    | 10 ----------
 drivers/soc/sifive/Makefile                   |  3 ---
 8 files changed, 17 insertions(+), 23 deletions(-)
 rename drivers/{soc/sifive => cache}/sifive_ccache.c (100%)
 delete mode 100644 drivers/soc/sifive/Kconfig
 delete mode 100644 drivers/soc/sifive/Makefile

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..ab32599fc799 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19580,6 +19580,13 @@ S:	Supported
 N:	sifive
 K:	[^@]sifive
 
+SIFIVE CACHE DRIVER
+M:	Conor Dooley <conor@kernel.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
+F:	drivers/cache/sifive_ccache.c
+
 SIFIVE FU540 SYSTEM-ON-CHIP
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 M:	Palmer Dabbelt <palmer@dabbelt.com>
@@ -19595,13 +19602,6 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
 F:	drivers/dma/sf-pdma/
 
-SIFIVE SOC DRIVERS
-M:	Conor Dooley <conor@kernel.org>
-L:	linux-riscv@lists.infradead.org
-S:	Maintained
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
-F:	Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
-F:	drivers/soc/sifive/
 
 SILEAD TOUCHSCREEN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index a57677f908f3..433b7ded8787 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -8,4 +8,12 @@ config AX45MP_L2_CACHE
 	help
 	  Support for the L2 cache controller on Andes Technology AX45MP platforms.
 
+if ARCH_SIFIVE || ARCH_STARFIVE
+
+config SIFIVE_CCACHE
+	bool "Sifive Composable Cache controller"
+	help
+	  Support for the composable cache controller on SiFive platforms.
+
+endif
 endmenu
diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
index 2012e7fb978d..7657cff3bd6c 100644
--- a/drivers/cache/Makefile
+++ b/drivers/cache/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_AX45MP_L2_CACHE) += ax45mp_cache.o
+obj-$(CONFIG_AX45MP_L2_CACHE)	+= ax45mp_cache.o
+obj-$(CONFIG_SIFIVE_CCACHE)	+= sifive_ccache.o
diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/cache/sifive_ccache.c
similarity index 100%
rename from drivers/soc/sifive/sifive_ccache.c
rename to drivers/cache/sifive_ccache.c
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index d21e75d69294..76afeff93045 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -23,7 +23,6 @@ source "drivers/soc/qcom/Kconfig"
 source "drivers/soc/renesas/Kconfig"
 source "drivers/soc/rockchip/Kconfig"
 source "drivers/soc/samsung/Kconfig"
-source "drivers/soc/sifive/Kconfig"
 source "drivers/soc/starfive/Kconfig"
 source "drivers/soc/sunxi/Kconfig"
 source "drivers/soc/tegra/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 0706a27d13be..ba8f5b5460e1 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -28,7 +28,6 @@ obj-y				+= qcom/
 obj-y				+= renesas/
 obj-y				+= rockchip/
 obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
-obj-y				+= sifive/
 obj-y				+= sunxi/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
deleted file mode 100644
index 139884addc41..000000000000
--- a/drivers/soc/sifive/Kconfig
+++ /dev/null
@@ -1,10 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-if ARCH_SIFIVE || ARCH_STARFIVE
-
-config SIFIVE_CCACHE
-	bool "Sifive Composable Cache controller"
-	help
-	  Support for the composable cache controller on SiFive platforms.
-
-endif
diff --git a/drivers/soc/sifive/Makefile b/drivers/soc/sifive/Makefile
deleted file mode 100644
index 1f5dc339bf82..000000000000
--- a/drivers/soc/sifive/Makefile
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-obj-$(CONFIG_SIFIVE_CCACHE)	+= sifive_ccache.o
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
