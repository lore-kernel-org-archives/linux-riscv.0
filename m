Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F2AC4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:41:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 706A92184D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 706A92184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/tJ/AFtLLCFqgSWgzPdjw6kwBvPK8Q0M5UeVC/7taX4=; b=GQZkWpF4aH0oQRtWO0Q2q35i2
	xhaa2CJ9V7OcOE5uc9da4bWlp3STnMjrVRp90aJIZBbvbOXi+yWm9b3WIJuwNvJjy16KwO6sUMpKE
	n1faPWGwCldBDUUHpxsQ4wisUWxLD8ceajx5y24Gym80L7o4Ss/U9LqQYmOhUvHEoeV4RT4yFECxF
	/stRoUMqcFGsm0O+3ar7QyD05S6/2CYIeT1W69M57fM/mg7bM3Ao3Q/RHdSofIFKNX5+IHdV7Xxtc
	hP34q29cxA7rtpL4HoFC7TgDJ3ov7JdP1yNsgm1EMz5Kb239MKALw/Z8Sg1010syoILKr9mqv1c6q
	HD5Qfkp9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knCpc-00059d-62; Thu, 10 Dec 2020 03:41:28 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knCp9-0004id-Px
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 03:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607571659; x=1639107659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+/z2k3yrZphzSSBrE2sG8I+qUOzmZKRpqBGEChKvdks=;
 b=OqL5b9NTNwfbYNzBl4E2Gg5nz2nZYUaO9YJ5mk7/CPPmZjBhkpVkwp3a
 LES/B70R1e0lodTqaGO8qqy9IR+re9X6GGDoKvurI+EXsm0eE38ZsAI1z
 5PnecjWayJFswVjHNCMzkobWXMI8CXHKimW8rbGBorHK9v5IvBkiVDyNa
 hyHUJpbO8Jainnwj1pkQ301k+W8HrQ57DMVnN/flCyVeIpO5dc3qWOgvg
 cwJXztkXWM5AU/Ppo6h+6AgGOu9MKSgRJgRDxe1gwA0PVqwda3E1wxa8t
 97kkfWcZRxnlMpH49OskWnmXJcV7dRN2o+yZNtcidh4qZRhRKdWFb5B2P g==;
IronPort-SDR: 64c1xZurAlW12LfZFQedpWEqPLrgUkkJJG/6EOtxdfOjJsy2vy//XNJe/lG88gP8M5vzAy6UWt
 N3t/es0+jN39pJG9mYGIA3PZBCsc+Gg2hjO/Dj4vAyO4MGVI12eVEZXtPrvl20H4D0SiJx6J6N
 Y0KGPhTuy1Scb/WnaauxLVL6dFMKyhFcRO8au4+CpQoB/Rn6Cec37+YcYOYVtjvNK/ur8t/EpG
 l90iuWj7aHAiu1LHznjaDcJkmNr+/bJuWM62VGRz582O3w7Q2Lj4BYcupKDIsg2fSJ4TywerYt
 OSs=
X-IronPort-AV: E=Sophos;i="5.78,407,1599494400"; d="scan'208";a="154813146"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 11:40:56 +0800
IronPort-SDR: ngtIGpedGxyxn6jAc2hxZbvJNXK92ZzNxZFwGjP3RkrH7cse0dbIXA9kWWKujI0hBn4Y69d7Al
 uoW0JwBDRwcCOAcHjaDn2Pj+RNV9EnXPs=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 19:24:52 -0800
IronPort-SDR: qlHSfOSI6WUoRInY9ivwHutEFMcTb0V/5PY6jRHOSpPoarqtCna4CtNrVvgJeevehlJ9ob28Rs
 A6P4ay32j6PA==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Dec 2020 19:40:54 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v7 21/22] riscv: Update Canaan Kendryte K210 defconfig
Date: Thu, 10 Dec 2020 12:40:02 +0900
Message-Id: <20201210034003.222297-22-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210034003.222297-1-damien.lemoal@wdc.com>
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_224100_005125_AE868F7E 
X-CRM114-Status: GOOD (  14.18  )
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

Update the Kendryte k210 nommu default configuration file
(nommu_k210_defconfig) to include device drivers for reset, reboot,
I2C, SPI, gpio and LEDs support. Virtual Terminal support is also
disabled as no terminal devices are supported and enabled. Disabling
CONFIG_VT (removing the no longer needed override for
CONFIG_VGA_CONSOLE) reduces the kernel image size by about 65 KB.

This default configuration remains suitable for a system using an
initramfs cpio file linked into the kernel image.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/configs/nommu_k210_defconfig | 37 +++++++++++++++++++++----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 368a28cf1467..a099c29b4b14 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -1,17 +1,19 @@
 # CONFIG_CPU_ISOLATION is not set
-CONFIG_LOG_BUF_SHIFT=15
+CONFIG_LOG_BUF_SHIFT=13
 CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_FORCE=y
+# CONFIG_RD_GZIP is not set
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
+# CONFIG_RD_ZSTD is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_SYSFS_SYSCALL is not set
 # CONFIG_FHANDLE is not set
 # CONFIG_BASE_FULL is not set
+# CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
 # CONFIG_TIMERFD is not set
@@ -25,15 +27,16 @@ CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLOB=y
-# CONFIG_SLAB_MERGE_DEFAULT is not set
 # CONFIG_MMU is not set
 CONFIG_SOC_CANAAN=y
+CONFIG_SOC_CANAAN_K210_DTB_SOURCE="k210_generic"
 CONFIG_MAXPHYSMEM_2GB=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
 CONFIG_CMDLINE="earlycon console=ttySIF0"
 CONFIG_CMDLINE_FORCE=y
-CONFIG_JUMP_LABEL=y
+# CONFIG_SECCOMP is not set
+# CONFIG_STACKPROTECTOR is not set
 # CONFIG_BLOCK is not set
 CONFIG_BINFMT_FLAT=y
 # CONFIG_COREDUMP is not set
@@ -41,23 +44,47 @@ CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FW_LOADER is not set
 # CONFIG_ALLOW_DEV_COREDUMP is not set
+# CONFIG_INPUT_LEDS is not set
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
+# CONFIG_VT is not set
+# CONFIG_UNIX98_PTYS is not set
 # CONFIG_LEGACY_PTYS is not set
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
+# CONFIG_GPIO_SYSFS is not set
+# CONFIG_GPIO_CDEV_V1 is not set
+CONFIG_GPIO_DWAPB=y
+CONFIG_GPIO_SIFIVE=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
-# CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
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
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
