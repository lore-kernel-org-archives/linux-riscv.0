Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899E7C388F7
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:16:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18642206D4
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:16:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yOaKPenw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="AjTeXa+h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18642206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4xkaImbewX5ExYi9G735dkAa/eMiq2UMJParda9T0tk=; b=yOaKPenwzUWNWKSxtEI1C+E3y
	/X33GDIGraGRiYHoiw3vaX7BP52bEA/xg7j5w512m29Tk/Ys03Yw242CtHSWnCgOHRUTlnTv7OIDI
	oeQ52cco9bsOTQGgJmaXeeilQ/sBSTGaIRAJ+zqs8BvYPYodc2e/dQ8+tIM5yGPqopv7KMJ6O9zAg
	VkiClw6UWCBepty/UQj7rIjXYsqu2MznpSds6C69fji5VCxesZ4r5Oqw7miQwhW63kZ9VepaMK2R/
	IXAA/9071t4bKUS3aBoTF/efQzLM4KvfbZNkV2W/EKFot/KEXMitqMGJg+vEtSC9gm2oMePwsKEKj
	FGk3yVs+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJOB-0001NB-Nc; Sat, 07 Nov 2020 08:15:59 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJO0-0001Cy-Jn
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:15:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736948; x=1636272948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XcASeM+Wtk8HLIa8mlPAWKhoAQBw/Y524saF5tWi1U0=;
 b=AjTeXa+hOeM5zlAoEwwTQT0ZZHYi2EKeDEXVWlwzhSe113j3c4/IsR8w
 mn81Wu7f0U84ZKirzRmTCSmRyldWZDkZYCvhs1cx306XC0WU5vfEuGojE
 zujQGcqU4Yz8nNZCbjJ9Qd/z1RGG38OtIpAp0r5m3EKsTAfi+iOoFDAQe
 veWb0QxkbRYymFfwapQ+iCj02DdxqgaCWwWupBHhrPeTYYrSuXi/WD7BQ
 rHJBQ9ljM7hqDd/gcXkjHNdTEFGO/dRPcGohXyq/kdC8SCNDsduFwXU7F
 idQqBLTWcjGDUPnLHS34TYEwRP4mifXRgmW0f78koyNdMLbe7SpJN8Gw6 w==;
IronPort-SDR: r19LgfA+cYwgPRu/hvJiBY5UZvBykyC05EJFZvEiU9ir58tVTJXrWxlvjcKPqPk5OyTlKmKq9N
 wYYU9W3h9ET8OiHH3E5+pVtL3/RZ5sNsqYG2w6cpj3rFoVszNzNhP3Px4TfkCnnZ5Q612gp6m0
 dPWYoH8+RRULBPYmKlSFhHjRIXTrSSwseuTkVx6TL4S8+osL90ofgL95CIshzw6HinpvSwW5Sg
 OJy9NLLz8vUiovHjvdar17igJRS2vcoo7miwQYkKdTXNoDE/GjfpSLY81xn4OZ+EPHOdUbMTEt
 x24=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079374"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:15:48 +0800
IronPort-SDR: vWUeZo56QLkWB65hqJDFZ0nJS9G1w+4tvnTHpfv1efgJS8FDDycKUPlAVyf5juyxx+Yc0/TOtS
 6oqQ5RiYHhgqCLbLNRoPrqF6X7KiJT/GNDl0EHnt9Mux8pI3gwmonPI81LbHYx1bZ44rwep6Qa
 5RAUKfX2pELBWsSKYeBdQm15K+XgR2katuoGGUOThTJWSXR/YbIkbSXD3Hy7tCn7P39wsgbO3F
 +qlMBmNDqlDDpSFUYgM7rRSLIzn9KcStlckLrEXwbg5eAPxeroT9B9Z5o44LH87Fpu0I7wGDyd
 W9RqMJEGygFVuRQ6uDhNDAyu
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:01:52 -0800
IronPort-SDR: igjqg1cSP52ZuedqtoN6ujsIzT9RexGlMkyG+AAxCpr6vZgKN6eg+4D1HP7uq2DBJZIQb1qu+A
 U15gDOBX/8gXnCBsvOiEODtsdwNTYWtCBaukEwb4mTb0lxBQ7DvJWllrCQklxg7w1alb1wL+t2
 dqVtdpjw76y4niAMm0PjLZDfGJgzBQGd2qRQ8DykV7xcXHBuj2J2c0tIQHElyGmJ+Lry+5OBzZ
 8F65Bjpyl/a6KRysexy3MhSoLsp758Ut6BGsG8uaBz/J1G7zs8O4Lt3u84E7Z9Y0bQBnFB+5A6
 db0=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:15:46 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 32/32] riscv: Update Kendryte K210 defconfig
Date: Sat,  7 Nov 2020 17:14:20 +0900
Message-Id: <20201107081420.60325-33-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031548_939635_C5ABA480 
X-CRM114-Status: GOOD (  14.04  )
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

Update the k210 nommu default configuration nommu_k210_defconfig to
include device drivers for reset, reboot, I2C, gpio, LEDs and SD card
support. The boot options are modified to mount the file system on the
first partition of the SD card as the root file system.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/configs/nommu_k210_defconfig | 45 +++++++++++++++++++------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index cd1df62b13c7..dda0f437de21 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -1,13 +1,6 @@
 # CONFIG_CPU_ISOLATION is not set
-CONFIG_LOG_BUF_SHIFT=15
+CONFIG_LOG_BUF_SHIFT=14
 CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_FORCE=y
-# CONFIG_RD_BZIP2 is not set
-# CONFIG_RD_LZMA is not set
-# CONFIG_RD_XZ is not set
-# CONFIG_RD_LZO is not set
-# CONFIG_RD_LZ4 is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_SYSFS_SYSCALL is not set
 # CONFIG_FHANDLE is not set
@@ -25,22 +18,26 @@ CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLOB=y
-# CONFIG_SLAB_MERGE_DEFAULT is not set
 # CONFIG_MMU is not set
 CONFIG_SOC_KENDRYTE=y
 CONFIG_MAXPHYSMEM_2GB=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
-CONFIG_CMDLINE="earlycon console=ttySIF0"
+CONFIG_CMDLINE="earlycon console=ttySIF0 rootdelay=2 root=/dev/mmcblk0p1 rw"
 CONFIG_CMDLINE_FORCE=y
 CONFIG_JUMP_LABEL=y
-# CONFIG_BLOCK is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_STACKPROTECTOR_STRONG is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_MQ_IOSCHED_DEADLINE is not set
+# CONFIG_MQ_IOSCHED_KYBER is not set
 CONFIG_BINFMT_FLAT=y
 # CONFIG_COREDUMP is not set
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FW_LOADER is not set
 # CONFIG_ALLOW_DEV_COREDUMP is not set
+# CONFIG_BLK_DEV is not set
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
@@ -48,16 +45,42 @@ CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_LDISC_AUTOLOAD is not set
 # CONFIG_HW_RANDOM is not set
 # CONFIG_DEVMEM is not set
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+# CONFIG_I2C_HELPER_AUTO is not set
+CONFIG_I2C_DESIGNWARE_PLATFORM=y
+CONFIG_SPI=y
+# CONFIG_SPI_MEM is not set
+CONFIG_SPI_DESIGNWARE=y
+CONFIG_SPI_DW_MMIO=y
+CONFIG_GPIO_SYSFS=y
+# CONFIG_GPIO_CDEV_V1 is not set
+CONFIG_GPIO_DWAPB=y
+CONFIG_GPIO_SIFIVE=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
 # CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+# CONFIG_PWRSEQ_EMMC is not set
+# CONFIG_PWRSEQ_SIMPLE is not set
+CONFIG_MMC_SPI=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_USER=y
 # CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
+# CONFIG_FILE_LOCKING is not set
 # CONFIG_DNOTIFY is not set
 # CONFIG_INOTIFY_USER is not set
 # CONFIG_MISC_FILESYSTEMS is not set
 CONFIG_LSM="[]"
 CONFIG_PRINTK_TIME=y
+# CONFIG_SYMBOLIC_ERRNAME is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
 # CONFIG_DEBUG_MISC is not set
 CONFIG_PANIC_ON_OOPS=y
 # CONFIG_SCHED_DEBUG is not set
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
