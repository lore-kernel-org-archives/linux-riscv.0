Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262BEC433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 13:00:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C973A64D9D
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 13:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C973A64D9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=49s2ocOjAFFXGEb12If+26nMjeWWX+TH+opECnSP6N0=; b=kma+KxAKfPikTzrLggpjk3roN
	O374vKkWCa1HszK8VY4kXZMRgNu6T/YjZiHhyfHh1Jq2xBdYsuZ7eyEhasv6hAct0Zvh77nsBrLif
	FyGpJMATr9b5eNUM7bvD8uLgnbbFkgpTNfMIOvN18hF+5/w4aICgNjDIDyyx1FU3cgXotW4rojUfN
	MkUQrBxCio+1GC/Yey1/cvi08BUdpX6IqTRcYYXBleN3sHA87VU/jqCGGGm7VpBVQo1dYW/shfqOJ
	RfETWV4x6hUlCpQdLWr6k6INJxeoklnCuu2nFse7GagMgw0iOyCWjBZEX6kTU9fUqRfRX3U+CGGl4
	ypw9XHTsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Hm3-0006Jz-IM; Wed, 03 Feb 2021 13:00:47 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7HlR-0005u8-Bk
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 13:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612357210; x=1643893210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bLTp7TEh7haEii+R1cR3cRVOJJN7cYqZvqMyNXTVOyE=;
 b=fF4OE99DFDLEHyBkna38zs1UEk1918wP4OWiGmfMjLfsCXditJFukATl
 uHAIMPUAy2stoP3l04gJ5eo2ZS7v582Wu/q1Zu6zBABR9575XS7OXUaCa
 cb/J2hxz5QrJKnNDTw3mBph+JsR6cDA/WlDxx8KC4zudj5iQF6sLKDZlK
 3H1D9P/RIB/zB8qdQM+v46WWFnwyHIUBSpBtCo4HHwZwI42NAxy65Zrvf
 /9HeGxUZ1I0gJG0ql+kmIERnnxvOcYQQjHCf81gLGWOlFbQ3d953u9iLy
 +o49vLIT0TnQ9etZHsCam2nmlbdFWOMwk+sHOxn1osEc82VVbkD5dtR7G g==;
IronPort-SDR: 4tm9HtO0MF8iXWLOMkFvREf59LNIi6+wi8fyOd2h0TE2n1+SCg+HmtF1zEN7yo9aMI7ZIphIew
 4O4rIqTmCM4eMVyUeqY/RBqJwBblYeY0otuKzJ9CuCWIe+08hy63lOVN/+CsTpIFXKvxEHigvj
 DcRrskm/RhUDfjybsIhTx6JpGi36zlsd0OAQk3a8etCfSid2qtt9EjU114XWPqu9/YV9Si2j1w
 ReccUO70QmKsL87NfcXv8qht2qkYJ9RDGIAS+zi8+dFImx20hi3Ngpmcd2+B+eo+qplUeY4ri0
 JAc=
X-IronPort-AV: E=Sophos;i="5.79,398,1602518400"; d="scan'208";a="160202908"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Feb 2021 21:00:06 +0800
IronPort-SDR: w6pWZ9nPhTFi8bTb0AnvqyezwLRxWRDAtEijK50UVyIMRN58H3S3uLdb4Zh/hxTmWu6tWbo2u1
 LSgSeDACblMgMZybPJnHjJzKMlD6TZS59aGeEQtY4IypL+xLU1j9eqjsjn0pSYQM9vndk9yh+M
 0zuNKWBArHWGqnKZEr7DboApc3RcDPYVVP+Z/TmCvJBBwWR618UJrqx7MK7wYcoxGXM4bjZ5wE
 uokkPRMx6B2m6cL1zOA4Hx2s2jzcg/S/7rJYUm1SeXlGCFI7QrFywiSYI2S1gSyZb1A0xL9AAa
 sBVd/7tGQ+MFxJ/8fbUX3yQ9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 04:44:06 -0800
IronPort-SDR: QVF5I5N6UZ94qtD/HlxCo8zJpuN5THpnVIxGHAVdTnmhIVHwipUGXxiGDUqMXzjeakkZcxD+vS
 v4YWWrZ0shhT94BRofPmwM5rGtUF+5825r2A/EKabUJLCewWUQTqvDQ9S6Z+av15Oa75J6lmgL
 p+R5IjqxyAmPpWjLe1mikEPF7/OG6tXBHdAy48kj4iV54J75Qx/v+cVqmQABUUb1ve414ze7in
 8oNBlhqr7F3aVcc3/mLUDthNfqjvxR9f2cUnAph/RwUGj+fitLPJJ8k9Q/MfO42W2dpdf3Wg3D
 Vo0=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Feb 2021 05:00:04 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v15 15/16] riscv: Update Canaan Kendryte K210 defconfig
Date: Wed,  3 Feb 2021 21:59:12 +0900
Message-Id: <20210203125913.390949-16-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203125913.390949-1-damien.lemoal@wdc.com>
References: <20210203125913.390949-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_080009_676350_BFD09C10 
X-CRM114-Status: GOOD (  14.39  )
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
