Return-Path: <SRS0=UnsP=HJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA8DC433DB
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 23:13:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF0B864E32
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 23:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF0B864E32
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=49s2ocOjAFFXGEb12If+26nMjeWWX+TH+opECnSP6N0=; b=arz5roM9fzxfGG+S0aXJqW8Sz
	GhM6HBxxreaSnY3/Clv18PvQqOvqrABIOqt6lVYrc6Bum8E2WE+dVZ6f/hwwjDcHVXrcsx07owfze
	ffmoY6cCe3DlkyyPfGjcq2GiIQaQoYqc2OAqrsqti+Gw6/wFWSmW4nnUiK11I090y1mef+zqq+KlW
	Dq7x/PyqEnJCXMHYRKbAay8ZE7RksZll2CyvlpgQnyJUgjNrLSVq0ycWTdvs2kAV4dINBkZDvj5sm
	6erEBPcmCcs65LMJTD9xq5BCjiCg6RD3YIECI3OSYj0IGxtDCS1uHJKLA+jO5NfMsnmOuV+77HkaM
	fqQWaPhng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8tFE-0006d6-Gu; Sun, 07 Feb 2021 23:13:32 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8tF7-0006R3-Ur
 for linux-riscv@lists.infradead.org; Sun, 07 Feb 2021 23:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612739605; x=1644275605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bLTp7TEh7haEii+R1cR3cRVOJJN7cYqZvqMyNXTVOyE=;
 b=I/shf3w7DIvP7CZgUKgY+0fEGkgkuJu7GYjmvt1ibjy+qmdDs2T5N1M6
 fdU8VfpdjflRDe1qT/v87HRYkdpRzt2H/Pa8X6zRFD9hFykPoYgTNCMvE
 R/hU93XRRowpaa0r4Kno/n6PLuVZiW+4UcW5gYR/Y3HQXuHayVfRwn+V/
 V4xEaNz4l020B2Dn4MaEtspCHoCUHKZVy8+2ubDg0ih4Tl+K4+m+S+ZUE
 GljabpYmLL4AqqkXqRGl/BXmiFUmiQdsWDhhecjhJmcEuzuJZN0FxwAJS
 T8ph3BzohNxWiXhBwvNpqceDgUXR32V+fbG0JW68Gs8a4Ai0PeNEHqJd9 w==;
IronPort-SDR: savTjHP4pdhAMFDhEOkG4dFsE0CJjZCVi626Hg4g7puxHzysVdXFRg3TNEsiJ9bZ+dgJBkFI9c
 D10YPQpRR76hfnOxQlNhlegwY/2jmvWpG/Oz3A5XJfVhxMooa4wa+uaMf91DASmzfcc5M3WFo9
 +MFJd26tywtPY0b/OP5nYw9hbwdH4oYZ6NUXSV3NlY8CRnGWjKvIvK0D94X6NqZgjlq2E3ZnVM
 IlTt2pkZgjuSm46qsTmyD2t4pSvUNpCsPKDg0Sqr9xeTjwBfE9scet69GDisrv+5zCTLRQpsr5
 3L0=
X-IronPort-AV: E=Sophos;i="5.81,160,1610380800"; d="scan'208";a="163861298"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2021 07:13:25 +0800
IronPort-SDR: wupVn5OwHpY+oA5odvurQMgKsBdDnDlhkQRmD+iRKvvPO+r4QRDC6b8WPYn22LzyrE711O3JBy
 MiYgBZDj++tF/V94sTR8mKHt97lDoZ2b/TIx14mkERZygjkpdZIPdizp6pNfQoXh2Comds0JPE
 A9KdSl6YOUYDswkDM2p0OJ3kkmIhqkDFOnY7XwMaHefGnxONCjzkhFwCLnmiPEnBZq4YnVvrs+
 nLQqfPzwskUDrG+sLa093dSZ3Ai9OBJKiEG5LXfbYd+DLOQYjPtzIoM+PGglEPt//7cRZzf0Nt
 JNOuY6ehO2JUO9+8ZeNxyKLT
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 14:55:21 -0800
IronPort-SDR: /3RpXIxOpD1LL/CGqzerZxmwhMS6qlxrvGpaV7UbYm6y8QNof9MY5SiB+lUQ7KcogtB5tm5yZS
 HXz/MtTE4r7kGbFcOYIjpib1MU8BEGtFrw3Aj5Sh+jvO9X03wZhgOmyMwCCwW0dBiDLcLRObFK
 jt9KWBBOW6I6DKvcysvtt7FY9OYkh4Vnl1dmTtBvmSfl2rm0zKPdateMIU/9+vCxAzWME5oJ5L
 qQHK1Zwn6tlI2Ebz23eJRODYut+Eg6RHmUNCArFDnp2b3z2ontUT/5PVHohRzyVl1ghjZekG03
 OiM=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.69])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2021 15:13:25 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v17 15/16] riscv: Update Canaan Kendryte K210 defconfig
Date: Mon,  8 Feb 2021 08:12:55 +0900
Message-Id: <20210207231256.115130-16-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210207231256.115130-1-damien.lemoal@wdc.com>
References: <20210207231256.115130-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_181327_031532_69827C2C 
X-CRM114-Status: GOOD (  13.07  )
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

Update the Kendryte k210 nommu default configuration file
(nommu_k210_defconfig) to include device drivers for reset, reboot,
I2C, SPI, gpio and LEDs support. Virtual Terminal support is also
disabled as no terminal devices are supported and enabled. Disabling
CONFIG_VT (removing the no longer needed override for
CONFIG_VGA_CONSOLE) reduces the kernel image size by about 65 KB.

This default configuration remains suitable for a system using an
initramfs cpio file linked into the kernel image.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/configs/nommu_k210_defconfig | 44 ++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 368a28cf1467..b16a2a12c82a 100644
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
@@ -25,15 +27,17 @@ CONFIG_EMBEDDED=y
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
+# CONFIG_GCC_PLUGINS is not set
 # CONFIG_BLOCK is not set
 CONFIG_BINFMT_FLAT=y
 # CONFIG_COREDUMP is not set
@@ -41,23 +45,47 @@ CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FW_LOADER is not set
 # CONFIG_ALLOW_DEV_COREDUMP is not set
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT is not set
 # CONFIG_SERIO is not set
+# CONFIG_VT is not set
+# CONFIG_UNIX98_PTYS is not set
 # CONFIG_LEGACY_PTYS is not set
 # CONFIG_LDISC_AUTOLOAD is not set
 # CONFIG_HW_RANDOM is not set
 # CONFIG_DEVMEM is not set
+CONFIG_I2C=y
+# CONFIG_I2C_COMPAT is not set
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
 # CONFIG_HWMON is not set
-# CONFIG_VGA_CONSOLE is not set
-# CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_USER=y
 # CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
+# CONFIG_SURFACE_PLATFORMS is not set
+# CONFIG_FILE_LOCKING is not set
 # CONFIG_DNOTIFY is not set
 # CONFIG_INOTIFY_USER is not set
 # CONFIG_MISC_FILESYSTEMS is not set
 CONFIG_LSM="[]"
 CONFIG_PRINTK_TIME=y
+# CONFIG_SYMBOLIC_ERRNAME is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
+# CONFIG_FRAME_POINTER is not set
 # CONFIG_DEBUG_MISC is not set
 CONFIG_PANIC_ON_OOPS=y
 # CONFIG_SCHED_DEBUG is not set
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
