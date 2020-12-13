Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F177C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:11:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAC2B22D6F
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAC2B22D6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/tJ/AFtLLCFqgSWgzPdjw6kwBvPK8Q0M5UeVC/7taX4=; b=f3vDQoAkyKojmTOnOHoo8yxWv
	n7ghBsH2ux/LRB2pyMKhbrI+qNZY7J9TkBKQcwboobNfsCooVEly+f5yMmTaB+qchD1V8xnbWS4wQ
	D8H40JpLnVAPvxZOS+/CbOEQDm7lWGF01zeXbx3m2MfAkV6NMKhzYYl+EUJ2dq7hxVqHH2KU8ar2w
	k47RFSae1hM+BgzNzLXFMzRyxtXDtQTsvluGBm6bvl/kGJ130fyBpx1G7WfbzVhNbNoV85rGCOSSl
	41Ij2lI7LikWoSmDVsSPkyr/8hYgKeh1ZqMuRuGiT/IWhFNk+C51OxcHg1sKOrSaEV3UzRSLJZkbZ
	+wesmqlkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koMTZ-0002vF-2b; Sun, 13 Dec 2020 08:11:29 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koMTA-0002iU-Id
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 08:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607847064; x=1639383064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+/z2k3yrZphzSSBrE2sG8I+qUOzmZKRpqBGEChKvdks=;
 b=ElopOKw1GtGh3HzBPOPKXgmz1238ITh5PfVhn2GQ2ItOCdQAKc34C9nz
 vAwTZHypuO/BaXqx+dsAFpv9Ulk96xg42Zr7rEJ7QbABE2aJOhbQBMN2I
 /mLLNjU2l1Its4PMypvQuomKeVwSs/SWauf4uxQHvBuTsRP8odtrhCi7r
 G5Zuk46ThcHpMmdNs/vhDK9U5m5xB6unrV0kuBN6ieUxdt281q2BjonuL
 nou7uH3SEXlAykghjiHPpvoNEw+djgtZjPFx6EVPglyxNeZS3Ac3uoYd3
 puoWxDPXiWba2dogh10UZfyaTKoOJMj8a6lTxdFcNUdr3waD8b9+XShiz g==;
IronPort-SDR: 4Hc1bR1f5aH92bst6zTe/6aH9qgBGS2PuSznnWadW7jvUfbMeh9CmdgRrKxCaC3OGUXbaP6fS0
 qeUX82WGIKb0BRSdFjZZDLkH7UNNw2fOXwj8ZREoMwipHFZhLzWgKwt7OnpBHcQrrtPWaGG+gK
 zU4xXfQiQKxYmNKIuOobbDWNp/cvpFbhM0SCkdlkqjFiPQXWJrtb+bnGUSxA7Aplfoq4Xa+Z+/
 +RUsTuMcklDP/hzIEhw0TsCqenNI57VjSiQynd20EvVxm62FUfYkxgmHP4GOQF26PHdusRJRct
 aFg=
X-IronPort-AV: E=Sophos;i="5.78,415,1599494400"; d="scan'208";a="156235173"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 16:11:03 +0800
IronPort-SDR: f1wwp7r7Nu/7MRNE5M6CQfkhOImEVCdpA20klTLJImOXHTv685Fyqab/Crj4VqhwVG7BjewQF1
 iHkuJepPMJMc22SlD8xNbw/hcRybwUiFuk+uq1CPiPFBSPTriAXz8PU53/ZDqNhR7Vp5FTDTFt
 EuGVKgHBuca8veNzsNMhJBFjSSFQqJkZCFHXBSbtyY6OS43D+SJ0g9CiJMZHCAhm0+49opbhYa
 b7zM6rzwASQ4NxKsl/Vh/0VQ/lXVi50DoVJud3GwnqL0WaOAoyfqrcZsc8qNGJTVkTnl8beRJI
 uA7ZTSkfxf7vieUHdS8FCCQ0
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2020 23:54:51 -0800
IronPort-SDR: u9u/NPJMxuIK8sYTfJTw3v3AWOjWzLc1TTiwzsUVMOmT7Iupc6UQIYyUAPHIDacanpRJObst3Q
 Y6MC2Wx7XZBmqCTQMtWtkov28uyLW4aW4veJCtkrRuWQzxz8/QWXaCQUzEuoTw+Gre8DzotBTz
 TT8G975WiD0PLsInjseyQu1pDL9IwUa6PWCtyrdKMIImxwFu0+giAHuDg24/0Zq+RWHX4HI51Q
 Dh+VwQrt2URc86W6c9iRg7pxFnm8aMxFBlDl6l1tNri4psdoQaKYgH6AY8TKHKHx7fW01w09Sy
 1QY=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2020 00:11:02 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v9 21/22] riscv: Update Canaan Kendryte K210 defconfig
Date: Sun, 13 Dec 2020 17:10:15 +0900
Message-Id: <20201213081016.179192-22-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213081016.179192-1-damien.lemoal@wdc.com>
References: <20201213081016.179192-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_031104_844607_BDDE2FE1 
X-CRM114-Status: GOOD (  15.50  )
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
