Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C617C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D0A8224DF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D0A8224DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2UHA5Zx6N+zh8lVOtrjgyus4wAyZuKbbx0clkhIRIS8=; b=eVyKOooI70Gq6KRLY00DbSknR
	wRIX0OCUL0vAWzSTVxD2cKfIeM65Z8Ao7NBR2sjbTRLYfXCv7dp4Chfr6KnkAadmfYIj1DtzbYMVt
	fefsJcnUfQg93hFmrwcp1fAfdnPEjxjnX42xJR3FfCrC+YAXY/W1eMhDU28Ql4Z7szlq1VE9cH7eL
	N3VMYHchhEg/Dly6KNnkMo6mLwf0Q2MU5HOiHJ5D88xTg6H22UHADVb+QUQa3oaLpll4Eeh9u5l/U
	OTxmOfeVsaIAiK0szwcWyzxLpWO80cD+HomViDdJLvb0bYqArDXvwJwoWBuZPO9jQjCbEhWo7crZ8
	fqZrNfwpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1JtD-0003nF-4y; Mon, 18 Jan 2021 02:03:31 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Jt8-0003gZ-0p
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 02:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610935405; x=1642471405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4XnbB3QOtetYNRnt0KEHzdhJjN/cGVbYVHe8bnOapuU=;
 b=r1uGwvRjGbD0//D+E5bsNxRdfPC3Tih3jCJ8kxFwbFqRa/XEplqjnI14
 pIrIoo3Ciuc58meXUG/Q+JjZA0AdQ5AaFJBPl6tXuQtDg1r3/9qZrZm9e
 JY3ZkqUHU5gBC4aF9fDZie01q7/yFPQX73A36CdsD7ARzZzq963Ygl3km
 pOE/+LgnVQfttSaKO9tCoV593lFOeUgd/FUb2DSjM0xheTDGLZ/s06Jb9
 JlVl/ubgkRTvNZsw0NgKHpYItmL0ADHpmdaj0q7zIKnXAzjy3WJ3th0yQ
 5eUN62SxkJiAb7i0AsQ+FdeWAweUoKMB4lzmQY7grNQr+fmxx6LCQUOr2 Q==;
IronPort-SDR: X2u9Lj/xJLS/l0zDZbeD5SGwJiRqzPKj4XBSBF1BDNvpq9ye25AhejFPOulV41jqXwyugFVnDf
 j1GzP93QqemyIYn8SP29Jo1SbiabtQN5NbV95DFfjFpcmm5JNe9TCtplYBxRAGzY9GIbEttYtZ
 X4yReIUBvUcQ+Z915fiW/ceO+1ZlQ6LhaGZCY9Qa0lKyG/Cr+Dh5Dcd7Q8l2vTvkX2kIUJbn7r
 u5FkRJ49QiN8DHTwgoskDO3tbn2gWbk7eQn+zelcJx92CinBomL3nILkDcH41KZspMBcayXtEE
 lSA=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="267979933"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 10:03:25 +0800
IronPort-SDR: 1WPzS7IXVu3P8xNkF/4Od6TSUgoWOA2pU7HJ5A/NcAD/WP+zuqP2hdgBjvVdgNc6KNu+eSYE+O
 StJ5M3FELEDicf2rrZXgl10H00bxbF5AOWyBHeCOCiyhIgn/sJ1zpLLAmvkwcI9YDckR5wdZfP
 mbHEuT7bL24E48bxNDDMSY4hiy4AOMzWoCvsH6Z5+TthTflhX896ecwBfuA/5mwZFmmh2qdaJl
 SupgfYeWi/6Cs+eXPoDbohHt2w51p0eEIe7gaNvUS5gam2XtjuSey5WFp9QBmPDxZLg1bMI9Zb
 dgc/o8htUc/dXMUrpL0OxAvr
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 17:46:02 -0800
IronPort-SDR: e+DadFOjzFzZKdIuzobV1kMRvgmWP6YX0CZWbaNweH2s0dE/kAOHiaPqSQwHCcFYHE/JGyoKYz
 MWKPYyLQh1UeDMQ9tRAcbghBMx0oj6aKf9JUUESiGh1UopAxyZc6kuQTIH55DMqygNgUtONfOB
 uootP9fRykLKBk0F7OT88PjlsRSrMhmEUFiB1Q7PFkROei4kBpgaz9uLu2kLSRnfmqrgN89s+P
 QaSU8KALu6Uf5GUsgsOkkW2cWHf+2mbnew9LdN6jxh/SjvaA0d9Vz57U4LTlxs0CLbPXW3EDc2
 wxA=
WDCIronportException: Internal
Received: from cnf011319.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.208])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Jan 2021 18:03:25 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 16/17] riscv: Update Canaan Kendryte K210 defconfig
Date: Mon, 18 Jan 2021 11:02:43 +0900
Message-Id: <20210118020244.103451-17-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118020244.103451-1-damien.lemoal@wdc.com>
References: <20210118020244.103451-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_210326_582910_FB4BD010 
X-CRM114-Status: GOOD (  12.72  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
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
