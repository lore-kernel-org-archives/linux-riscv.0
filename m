Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E90C433E6
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 06:59:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9661964F3B
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 06:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9661964F3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pn1MO1wIRyzMlAMnH9te32dBKcVkuyijDy+/2rZbO2g=; b=tfFXehoDWLIfLVQlXXyGV0w6Y
	Upy8q+ohRcCGhg9XPOtPodHO/yeZQpNzKRF66MuRwBAxrjMF6NihvCq1Mfy2q5VfsoBAvow9nfWa1
	fJUcKWJlS8+l5cbHwGbfuYWxDxAyqXpjuy5cdOLdwHfxSV/F5pl7Q6addt7QRmqaR7kl9qK64vO6j
	WBFq9wwd3qQcUwgFwwCgfyNVZgfXvvJ7KlBZQch6tsd3D2XP0l3koWEXGew5qdOud1ne2q82FYuw5
	v2OmO305M42189kSHU8sZwLGHsFYKC9JWkzas8rIg2TVTfqHe1ppckGxqtaKRcySs2kFVeo8pwNvd
	OxG+LEtWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7v58-0004rb-6J; Fri, 05 Feb 2021 06:59:06 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7v52-0004mN-Pi
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 06:59:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612508340; x=1644044340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=baTewvOd0Ca+b6oP67fu7diBD9GZ8yVq0VT0CXYLPk8=;
 b=BIoV8Mhmko0Uzn3aVzjLKwgpuURumXeyrTkuKCBhg7zFIxwMpJAAHnVW
 VJ+VTuX3elyHD3ZLvCbZRgyV4aGZ4nbu22kr9kRLFthc8mHXFyUIMS75W
 zRax4J+CN8ktwrevSIbBmk/trCy3geXgU/pU0NHrnekWBTvSZU58ILHzD
 +mllpFYRKectDzrrBx7WtdbLdVpkJZ35TtjfDubQG5BrdKWKD1l+j/nPx
 O1KcaOti1BS24VAEhiFovyYI1nvFu8Jtizz4SncEvTPbJz/2ESzMOXVZa
 BXQnGITziDnBdPDFbPHna1oHl1F/FLTQkG7f7tiZuCdmPw6OTwvNoUG8e g==;
IronPort-SDR: lYYGrPGZWaIGyps3vNuuFlFWzJexbFC3sOLKIyLUQOBHBi2YOd+r80dDbkELRZc4YOsnTX3iS5
 CNKk4+w3WCNV2P+zOJdcOh7dl2I9YgN40U2M6A/rcOOgApeNVXbLDOo6h4JK235/9YPwImbcS2
 vv0V/OHhKovDwzZ2xDlh1o7XMLEnCVQebxddbO5Z8nLekX4mpljjvgZ6bF4KkefBhOoPK5NEd9
 IA1Ajv128lCtDq5sdWItWD+DtjUVcfOLJ7zbDRCVTxzxb69tZoqdlCWL/PQyDE8F3RH8zFHUha
 Vx4=
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; d="scan'208";a="163655860"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 05 Feb 2021 14:59:00 +0800
IronPort-SDR: 7X8U9GG196jS9PWccte1Xt6mE+GdXU2E87Il+v0Fy0fZ+n2qSMZ6tgM20XZUC4wyvJVlgblIdD
 IIqzcUitAFMhOTrGiRbm2KrcYoOOxPuUGXdGPk0uoA8nxvGXv0mNVT/kTnCXQeimHTSBfuAIyq
 H0LHfGTjbavqDAbbnYQyjYy9GfGTNRbQSJG3X8Yb7A4HrWTQB0bqmLM7/OceaxOJuTDLpOQ12K
 GqKjlri5MIggtaLlFZ9GAroMMRs+6qWKRjaAuTos0NdBkDwjgtZXlYosLq0DAkUrzbYmGJ/BIh
 f7uVrKyIyLIXYIiP5BdiWb16
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 22:41:02 -0800
IronPort-SDR: seC8501lAqtcHf7h43O3yYZ96ZGMypMxVJRqLcPDBskOS6SkSgghiAoBswZQfmohdyJxGmOpqD
 27gVOAe8tpRdt1Bl5SEeecfsyG+YhNMA5BiuZKcFz7SQWRlJK5b76z499n2uY0WWOvNXOh8pIF
 IxFRS/g8hjXl1rmpkxygFIn0/Uxfx4YbBkcb9zjxe1dvhJYpGe1mluNJYMeRTqIwG3TK1wtrAr
 jCTd54+5aKrT+8LL3zPPEN0A5Z3CxT2L6/BY/+0f/6h22YpOVD2/oJGLP3iSz4pokOBS9zBSKI
 MIc=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Feb 2021 22:58:59 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v16 16/16] riscv: Add Canaan Kendryte K210 SD card defconfig
Date: Fri,  5 Feb 2021 15:58:27 +0900
Message-Id: <20210205065827.577285-17-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205065827.577285-1-damien.lemoal@wdc.com>
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_015901_089844_27F60EB6 
X-CRM114-Status: GOOD (  18.25  )
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
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Sean Anderson <seanga2@gmail.com>
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
(sipeed_maix_bit, sipeed_maix_dock, sipeed_maix_go, sipeed_maixduino or
canaan_kd233).

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 .../riscv/configs/nommu_k210_sdcard_defconfig | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 arch/riscv/configs/nommu_k210_sdcard_defconfig

diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
new file mode 100644
index 000000000000..61f887f65419
--- /dev/null
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -0,0 +1,92 @@
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
+# CONFIG_GCC_PLUGINS is not set
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
+# CONFIG_INPUT is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
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
+# CONFIG_GPIO_CDEV_V1 is not set
+CONFIG_GPIO_DWAPB=y
+CONFIG_GPIO_SIFIVE=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
+# CONFIG_HWMON is not set
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
+# CONFIG_SURFACE_PLATFORMS is not set
+CONFIG_EXT2_FS=y
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_LSM="[]"
+CONFIG_PRINTK_TIME=y
+# CONFIG_SYMBOLIC_ERRNAME is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
+# CONFIG_FRAME_POINTER is not set
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
