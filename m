Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F51C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:41:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F62D23A1D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F62D23A1D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZuOhcqPeSI+inIFnnHd1NrCYMZ2RJ5Gbxvf4t7yyb/s=; b=ASyjxOnDrb93BCcP3ywtvbV66
	ChSPJxK/71d8ZF34MNJ5IVwXhed9/YwPovo14DMIo9UiC6d8lcunOvXKGcVuhUHNZIjWKbaQJdbKY
	Kj6bWycEjQcZsXXcFvY0LZ6+Hqd/lcYbXqdIKz2YcXrISnFPs6AliNAmG6A8GMFi7JbKkdBYYXTTm
	7aRBDtjJUunNM0VeAPrzJxjvqVgIZnBCPlPWmJYgFEHVwoL4yD7cmXyEP2Sz3BZPFAG6XEPjA71o2
	vbhfQoZh0RDbdeHtEVYNBYhOj1fObZvKo7Lo66UOHUQ7QzRImNdE8SbJ+iY3CHMs47I61SWhXDEYm
	kSAmVWAEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knCpe-0005B3-9g; Thu, 10 Dec 2020 03:41:30 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knCpB-0004hR-OF
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 03:41:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607571661; x=1639107661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=moBcdpuy4NeYf+AnACShneSMBmwdX94fTn4G4UmmMMY=;
 b=lMNBoXQeeGEWuq4+CDFRo8H7B+fki9571eQrsumwDOLM1UMDxKAVFbsy
 wrmDYhBRcH/L1793GT6xM7xxKbGFifQZyoTcjhFDEeS+bavy8hlGhDYLh
 DJMgoMFPaavnks/YzipPIedD1rQfhbObgVsMuXMfdfg4QtMYeQjJOQ14W
 WAZgCuq/OtBeRqJc/7JVWdv3LX/XSVilHKFqa0grL+EiVDRZcLKLPk31R
 iy9+VcuPto7pFC0t37+ocQ3CmqgBWgeHYSaT8TPPaJJm5lDwCFOqa1CyB
 BjPpVI2lFh12sEnQmweuDa8D7X3pfZbbjsdb0QT6oJfy0zlBcGAZNlivN w==;
IronPort-SDR: /lbwmPr2oLW2zWHc5hZQNHTtyN/frax3h+rl4/+mcQwhLfRS0iNxUfgJFwVIVQPUL82Xzpu4di
 S0qzYpBCSu++ROJz+FvoL0Vr3eVgu7PLYfOzmwHGm3IRTYOfdeaf5w79cGOLDDOpEfSegsRs2i
 jHT96vU5d5EGstSC9Sh4340f1qqALfTvx5OsYiwtJ3ZFmFYdZF9pDNv5jik3QO2dUZgLWEt6g8
 PhbwlNbve5izci7L1glQ9Zi9TV8TVTiI293snMDSuHX26pRwJreHyH0V+ooK6ZOBoTegi9JByq
 Tbg=
X-IronPort-AV: E=Sophos;i="5.78,407,1599494400"; d="scan'208";a="154813149"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 11:40:58 +0800
IronPort-SDR: ExdfTjqoez98VAljLss0HvMzJiC+ue/sUVrRV/7p/maAcCVCOEHo3PLuel4bioj28PwHTamfqQ
 S+Xgvu/4oQosgh5jhKnmFsRQI0TQ9pxk4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 19:24:54 -0800
IronPort-SDR: XIqV7qdtSoserhbnaQfNiwmwF3FLfJ+S2C6YxOg1HOODQhVmBTIEYSTUHFFWLkBEWeiN1WKje7
 2gZ28eFAUuiQ==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Dec 2020 19:40:56 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v7 22/22] riscv: Add Canaan Kendryte K210 SD card defconfig
Date: Thu, 10 Dec 2020 12:40:03 +0900
Message-Id: <20201210034003.222297-23-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210034003.222297-1-damien.lemoal@wdc.com>
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_224101_982253_C951DBDF 
X-CRM114-Status: GOOD (  19.39  )
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

The nommu_k210_defconfig default configuration allows booting a Canaan
Kendryte K210 SoC based boards using an embedded intramfs cpio file.
Modifying this configuration to enable support for the board SD card is
not trivial for all users. To help beginners getting started with these
boards, add the nommu_k210_sdcard_defconfig default configuration file
to set all configuration options necessary to use the board mmc-spi sd
card for the root file system.

This new configuration adds support for the block layer, the mmc-spi
driver and modifies the boot options to specify the rootfs device as
mmcblk0p1 (first partition of the sd card block device). The ext2 file
system is selected by default to encourage its use as that results in
only about 4KB added to the kernel image size. As ext2 does not have
journaling, the boot options specify a read-only mount of the file
system. Similarly to the smaller nommu_k210_defconfig, this new default
configuration disables virtual terminal support to reduce the kernel
image size.

The default device tree selected is unchanged, specifying the simple
"k210_generic" device tree file. The user must change this setting to
specify the device tree suitable for the board being used
(k210_maix_bit, k210_maix_dock, k210_maix_go, k210_maixduino or
k210_kd233).

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../riscv/configs/nommu_k210_sdcard_defconfig | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 arch/riscv/configs/nommu_k210_sdcard_defconfig

diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
new file mode 100644
index 000000000000..a75388defd44
--- /dev/null
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -0,0 +1,93 @@
+# CONFIG_CPU_ISOLATION is not set
+CONFIG_LOG_BUF_SHIFT=13
+CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+# CONFIG_SYSFS_SYSCALL is not set
+# CONFIG_FHANDLE is not set
+# CONFIG_BASE_FULL is not set
+# CONFIG_FUTEX is not set
+# CONFIG_EPOLL is not set
+# CONFIG_SIGNALFD is not set
+# CONFIG_TIMERFD is not set
+# CONFIG_EVENTFD is not set
+# CONFIG_AIO is not set
+# CONFIG_IO_URING is not set
+# CONFIG_ADVISE_SYSCALLS is not set
+# CONFIG_MEMBARRIER is not set
+# CONFIG_KALLSYMS is not set
+CONFIG_EMBEDDED=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLOB=y
+# CONFIG_MMU is not set
+CONFIG_SOC_CANAAN=y
+CONFIG_SOC_CANAAN_K210_DTB_SOURCE="k210_generic"
+CONFIG_MAXPHYSMEM_2GB=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
+CONFIG_CMDLINE="earlycon console=ttySIF0 rootdelay=2 root=/dev/mmcblk0p1 ro"
+CONFIG_CMDLINE_FORCE=y
+# CONFIG_SECCOMP is not set
+# CONFIG_STACKPROTECTOR is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_MQ_IOSCHED_DEADLINE is not set
+# CONFIG_MQ_IOSCHED_KYBER is not set
+CONFIG_BINFMT_FLAT=y
+# CONFIG_COREDUMP is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_FW_LOADER is not set
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+# CONFIG_BLK_DEV is not set
+# CONFIG_INPUT_LEDS is not set
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+# CONFIG_UNIX98_PTYS is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_LDISC_AUTOLOAD is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_DEVMEM is not set
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
+# CONFIG_HWMON is not set
+# CONFIG_HID is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+# CONFIG_PWRSEQ_EMMC is not set
+# CONFIG_PWRSEQ_SIMPLE is not set
+CONFIG_MMC_SPI=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_USER=y
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
+CONFIG_EXT2_FS=y
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_LSM="[]"
+CONFIG_PRINTK_TIME=y
+# CONFIG_SYMBOLIC_ERRNAME is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_MISC is not set
+CONFIG_PANIC_ON_OOPS=y
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_FTRACE is not set
+# CONFIG_RUNTIME_TESTING_MENU is not set
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
