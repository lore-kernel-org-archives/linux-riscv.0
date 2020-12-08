Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8ACC1B0E3
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:35:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C98D023A69
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C98D023A69
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CijumXwBGT8LnXGwE6ZoRWwn8MFBES3Wa4d7W8I2YbA=; b=LUKiPTxw0ElHtaFOCoA/xHHnU
	lk/66ev8JMKdXojmKGGuSnbLxzMExvEUEIv/921SKpLVjE6TjJ5s49lADHcJsaODmGmqChuO/HPNm
	z4nP8aphsQCZU9o9sLbcy+lRDYDEqpxP4pWaO9fLcf9NO+4s0jPcpJ6Y/NGGtR3+Y/mYgXA0VrP7q
	SIeCplNITp8clKpyB/s+Rag+rMDV0Jm/suGYLwpbqxOIwh+74C0zkLBvE7tXnIHjea3gETqPfpqC5
	97gZQscUQ7YJxTEqqFITo3MJoEaFKlTmJyGWAWL7lIDJEzcmP5RZjmvkIvJQRufp/hJmtN3QwLSn7
	7SzE33k7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmXWR-0000bk-H6; Tue, 08 Dec 2020 07:34:55 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmXWD-0000UK-Mr
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 07:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607412881; x=1638948881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vqr+7vJYBCj54xYtLqEK91uVNHh1uEBFvkgHxdpzGS8=;
 b=l5A92R+e7ElFPqWIBBVg8ersw/DLxHCnzSmCZ34mVSfhIw+MMOywa86c
 u7ceB88MeocQEquNuJGLd3IVzMVrgNW1NfUCetXo1Km9oK0oWzNU3F32k
 MWQX1DDSDbzbkZugbvJWEvF+I6dbIfMSlO8nPUeMTE/XkTP+8lQegDY7Z
 W3msnIfJbdgkcuGyfFNyxyWNnLvxACuYJdV/eyaMJU0zdL5v2hTuj2CuO
 sJ1K/05OOCOKI7eR4XAMlnFVJmI7eGdMw3NS1Z0sv8E8eRSbUXN9GH31u
 n5J71uVr335JH8TdBfcH5YnIQ4tD5IUXm8L/CH69vZ8kb6jUOz6P5ml5c w==;
IronPort-SDR: v4hvocEHJvGgjc60ocICHDrOjBMg8gIw7e6b5A8NtX3Gz588zvwPdAsyLMTspEag2P8Rjj+Anf
 uxhKap8LQ6hduIP6WmaQzlPh2vKZgduW4j+NcLFAvhJF7YSSi4nMEF1dKUKaF2AfsP2s3FdM0D
 ycplbAAhH8tgWdUgPolNUf4ybbsItkPVNbSNkoIyt5blcn/BFWEP9mkQgVZcWrh0ZgAWrgTeVP
 taqZnRra+L1It8sJnSdV7BCzPN7Doa4J94vpuBQKZvDkR8JCJEZdeK2ohfcc3AlhJ68LStiOf2
 hBo=
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; d="scan'208";a="154714937"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2020 15:34:40 +0800
IronPort-SDR: VmkpoFoeRzuX7P9nmt+o1m+YZPZdxQsstEfBS7b/w0Twdm/7GIWCQAgmTRYgFfSXtC+3VNPx+O
 n6pJru4UpicZXW/MEJAt7sgP6py23IIms=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 23:20:08 -0800
IronPort-SDR: 5BIh3cRTGeGFjbc2WmzlFhRQNXqgGIms5mk9ofYKgZtNjzRy30y2Md1bl4zYP9hxTWRcvma6XV
 yG4fTtcvi0HQ==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Dec 2020 23:34:39 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v5 20/21] riscv: Update Canaan Kendryte K210 defconfig
Date: Tue,  8 Dec 2020 16:33:54 +0900
Message-Id: <20201208073355.40828-21-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208073355.40828-1-damien.lemoal@wdc.com>
References: <20201208073355.40828-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_023442_022438_E1E68074 
X-CRM114-Status: GOOD (  14.28  )
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
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
