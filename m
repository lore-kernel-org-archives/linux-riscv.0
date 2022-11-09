Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5E0C43217
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 21:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kPs5EENoxih+cGKi5s21sPYEW1MFsUIQRt6Ss6yqo2g=; b=U2JeY8ZEpZ6Bzf
	nYTsT2Uj2WGAdtVhmwee6c0Zkrcqz0q3gLBBtui6w20pBmndXdQCBiWHuB1WN5E6f9d184x7sPIZy
	QKDb16FuTKo0xPGY9O48sxTu0mXa5zI2FW5G5S6WhwK2Z2Ke0LX0xzT5N8xWuEbaf0AGBlv629RcQ
	AZj56we6G630fqc8Vxs8L/qAlMMZLgmU3ydoigLCmxnVLNx3pdwTD13+EZGCvfsjhPkRTChzIQyvx
	NRB9gL5K5PTaY+yOqSwOcNblJGxK9mh5LDiuuJX0ivKj9iAMtAhIRKM/UrLX7XKSAztQ+LLA+jqoq
	zn855EHTJZFSjSVIMhxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ossXe-00HOUX-Gm; Wed, 09 Nov 2022 21:23:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ossXY-00HORM-4A
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 21:23:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5B0E561CD7;
	Wed,  9 Nov 2022 21:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA97C433C1;
	Wed,  9 Nov 2022 21:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668028999;
	bh=XiIWu255CJHaBr0/bQm6scm8IS8bulmV4YbxHHKL31M=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=iWH0gV6GYhDp9CGwDpJ6sCR4CkroDq78g/t12IoUrl+GKTwxgnVp8I1tG4XtclPBE
	 MxYv+n4rwUl/dz2xbqDekRiKrl8syUsM7pzhlFmnG5eAN+C6mge94S8233XRQzibPw
	 gI/I+JkB+d35sU9KDMJ0eOONndv6qe+ZwCY5/HNh2tC0n03Kp/m4Rs/hko65lHxFwz
	 B1opMoAfsjBwn5ExS/xgvv3hqgI9QGn85LaMCUBw9t67ciy1vYJcsq4QUiR7oe6u9H
	 nC/u3szgn7ti6ZbKVSNnHO1mVUwWj5EDTFnwgA+s8RDIX8W0LTuC857Vt0/f4S547x
	 UeZOpcw1nuG2A==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	soc@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 1/4] MAINTAINERS: add entries for misc. RISC-V SoC drivers and devicetrees
Date: Wed,  9 Nov 2022 21:22:17 +0000
Message-Id: <20221109212219.1598355-2-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221109212219.1598355-1-conor@kernel.org>
References: <20221109212219.1598355-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_132320_275967_36F73F19 
X-CRM114-Status: GOOD (  15.64  )
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

Following some discussion both on & off list, I have volunteered to take
over maintaining the miscellaneous RISC-V devicetrees & soc drivers from
Palmer to ease his load.

So far only SiFive and Microchip have stuff in drivers/soc. For the
former, a SiFive entry exists with a dead GitHub repo - so remove that
to avoid confusion since the patches for drivers/soc & devicetrees will
be routed via my tree & other drivers go through their subsystem trees.
The Microchip directory only contains a RISC-V driver for now, but is
likely to contain drivers for other archs in the future. To that end,
change the PolarFire SoC entry to specifically mention the RISC-V driver
& the new directory level entry does not mention an architecture.

CC: Arnd Bergmann <arnd@arndb.de>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
Link: https://lore.kernel.org/linux-riscv/mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 046ff06ff97f..b88ced1ff72c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13627,6 +13627,12 @@ S:	Supported
 F:	drivers/misc/atmel-ssc.c
 F:	include/linux/atmel-ssc.h
 
+MICROCHIP SOC DRIVERS
+M:	Conor Dooley <conor@kernel.org>
+S:	Supported
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
+F:	drivers/soc/microchip/
+
 MICROCHIP USB251XB DRIVER
 M:	Richard Leitner <richard.leitner@skidata.com>
 L:	linux-usb@vger.kernel.org
@@ -17749,12 +17755,21 @@ F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/pcie-microchip-host.c
 F:	drivers/reset/reset-mpfs.c
 F:	drivers/rtc/rtc-mpfs.c
-F:	drivers/soc/microchip/
+F:	drivers/soc/microchip/mpfs-sys-controller.c
 F:	drivers/spi/spi-microchip-core-qspi.c
 F:	drivers/spi/spi-microchip-core.c
 F:	drivers/usb/musb/mpfs.c
 F:	include/soc/microchip/mpfs.h
 
+RISC-V MISC SOC SUPPORT
+M:	Conor Dooley <conor@kernel.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+Q:	https://patchwork.kernel.org/project/linux-riscv/list/
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
+F:	Documentation/devicetree/bindings/riscv/
+F:	arch/riscv/boot/dts/
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
@@ -18781,7 +18796,6 @@ M:	Palmer Dabbelt <palmer@dabbelt.com>
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
-T:	git https://github.com/sifive/riscv-linux.git
 N:	sifive
 K:	[^@]sifive
 
@@ -18800,6 +18814,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
 F:	drivers/dma/sf-pdma/
 
+SIFIVE SOC DRIVERS
+M:	Conor Dooley <conor@kernel.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
+F:	drivers/soc/sifive/
+
 SILEAD TOUCHSCREEN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	linux-input@vger.kernel.org
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
