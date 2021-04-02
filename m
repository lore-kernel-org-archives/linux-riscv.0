Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF850C433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:24:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CC66610E8
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CC66610E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Cc:To:Subject:From:References:In-Reply-To:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ef6EtAVVOF+krLk04RFnRdS1PigPf6s/E2327dvr7kc=; b=cIx7cFQ5C/8axgrTKco2V+dC3/
	NYjJnHsoWhRsGhQ2qLKCr1/zcoM14O1SqS9TU4doKLrO7r0XQW7FkhVhgHXjl5OJq8iSGWEj7a2zB
	2/dCeWzb1oGsXAoOWbU5tKaBTJtcav0zWB4MK9KcvkJq4R271NI56pNmSwiSO7Hc0ULgrZ51nRqa3
	wVgXfwfnKZlDmeZfaZJQ8kBxjKNnCeuA6T+YF9nJlW7We2qH+2lQl/XKefHZOqiYkpDnnFh8DPImF
	Bzy4gUX/hGYBKNgqMWcm+TAZxpos3gLvp7xDrhtOoU7haqpLKmJUGYrHnydlCGAJvZXvZZkllhtd9
	3FMpy0TA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSLea-00DGg3-0x; Fri, 02 Apr 2021 15:24:08 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSLYz-00DCTx-4w; Fri, 02 Apr 2021 15:18:23 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkG25GKzz9v2mG;
 Fri,  2 Apr 2021 17:18:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Fa98FSt8wZGD; Fri,  2 Apr 2021 17:18:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkG24Cgkz9v2mF;
 Fri,  2 Apr 2021 17:18:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 30F038BB7F;
 Fri,  2 Apr 2021 17:18:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HQzlnfTPkzN2; Fri,  2 Apr 2021 17:18:20 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 611E98BB79;
 Fri,  2 Apr 2021 17:18:19 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3D03167989; Fri,  2 Apr 2021 15:18:19 +0000 (UTC)
Message-Id: <61707011a81a365ccc22a6374f797b6f63cf5030.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 17/20] xtensa: Convert to GENERIC_CMDLINE
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 microblaze <monstr@monstr.eu>, linux-mips@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org
Date: Fri,  2 Apr 2021 15:18:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_161821_374203_80D21875 
X-CRM114-Status: GOOD (  11.53  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This converts the architecture to GENERIC_CMDLINE.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/xtensa/Kconfig                         | 15 +--------------
 arch/xtensa/configs/audio_kc705_defconfig   |  1 -
 arch/xtensa/configs/common_defconfig        |  1 -
 arch/xtensa/configs/generic_kc705_defconfig |  1 -
 arch/xtensa/configs/iss_defconfig           |  1 -
 arch/xtensa/configs/nommu_kc705_defconfig   |  1 -
 arch/xtensa/configs/smp_lx200_defconfig     |  1 -
 arch/xtensa/configs/virt_defconfig          |  1 -
 arch/xtensa/configs/xip_kc705_defconfig     |  1 -
 arch/xtensa/kernel/setup.c                  | 10 ++--------
 10 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 9ad6b7b82707..42309f5e9cda 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -16,6 +16,7 @@ config XTENSA
 	select COMMON_CLK
 	select DMA_REMAP if MMU
 	select GENERIC_ATOMIC64
+	select GENERIC_CMDLINE
 	select GENERIC_IRQ_SHOW
 	select GENERIC_PCI_IOMAP
 	select GENERIC_SCHED_CLOCK
@@ -353,20 +354,6 @@ config GENERIC_CALIBRATE_DELAY
 	help
 	  The BogoMIPS value can easily be derived from the CPU frequency.
 
-config CMDLINE_BOOL
-	bool "Default bootloader kernel arguments"
-
-config CMDLINE
-	string "Initial kernel command string"
-	depends on CMDLINE_BOOL
-	default "console=ttyS0,38400 root=/dev/ram"
-	help
-	  On some architectures (EBSA110 and CATS), there is currently no way
-	  for the boot loader to pass arguments to the kernel. For these
-	  architectures, you should supply some command-line options at build
-	  time by entering them here. As a minimum, you should specify the
-	  memory size and the root device (e.g., mem=64M root=/dev/nfs).
-
 config USE_OF
 	bool "Flattened Device Tree support"
 	select OF
diff --git a/arch/xtensa/configs/audio_kc705_defconfig b/arch/xtensa/configs/audio_kc705_defconfig
index 3be62da8089b..5f8661a33ab4 100644
--- a/arch/xtensa/configs/audio_kc705_defconfig
+++ b/arch/xtensa/configs/audio_kc705_defconfig
@@ -27,7 +27,6 @@ CONFIG_PREEMPT=y
 CONFIG_HIGHMEM=y
 # CONFIG_PCI is not set
 CONFIG_XTENSA_PLATFORM_XTFPGA=y
-CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="earlycon=uart8250,mmio32native,0xfd050020,115200n8 console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=0x38000000@0"
 CONFIG_USE_OF=y
 CONFIG_BUILTIN_DTB_SOURCE="kc705"
diff --git a/arch/xtensa/configs/common_defconfig b/arch/xtensa/configs/common_defconfig
index fa9389869154..6467ebcbb080 100644
--- a/arch/xtensa/configs/common_defconfig
+++ b/arch/xtensa/configs/common_defconfig
@@ -6,7 +6,6 @@ CONFIG_MODULES=y
 CONFIG_MODVERSIONS=y
 CONFIG_XTENSA_PLATFORM_XT2000=y
 CONFIG_GENERIC_CALIBRATE_DELAY=y
-CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="console=ttyS0,38400 ip=bootp root=nfs nfsroot=/opt/montavista/pro/devkit/xtensa/linux_be/target memmap=128M@0"
 CONFIG_BINFMT_MISC=y
 CONFIG_NET=y
diff --git a/arch/xtensa/configs/generic_kc705_defconfig b/arch/xtensa/configs/generic_kc705_defconfig
index e9d6b6f6eca1..8984c4e68a42 100644
--- a/arch/xtensa/configs/generic_kc705_defconfig
+++ b/arch/xtensa/configs/generic_kc705_defconfig
@@ -26,7 +26,6 @@ CONFIG_PREEMPT=y
 CONFIG_HIGHMEM=y
 # CONFIG_PCI is not set
 CONFIG_XTENSA_PLATFORM_XTFPGA=y
-CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="earlycon=uart8250,mmio32native,0xfd050020,115200n8 console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=0x38000000@0"
 CONFIG_USE_OF=y
 CONFIG_BUILTIN_DTB_SOURCE="kc705"
diff --git a/arch/xtensa/configs/iss_defconfig b/arch/xtensa/configs/iss_defconfig
index 32ce8fb068f0..996ad115264d 100644
--- a/arch/xtensa/configs/iss_defconfig
+++ b/arch/xtensa/configs/iss_defconfig
@@ -2,7 +2,6 @@ CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
 # CONFIG_PCI is not set
-CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="console=ttyS0,38400 eth0=tuntap,,tap0 ip=192.168.168.5:192.168.168.1 root=nfs nfsroot=192.168.168.1:/opt/montavista/pro/devkit/xtensa/linux_be/target memmap=128M@0"
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_NET=y
diff --git a/arch/xtensa/configs/nommu_kc705_defconfig b/arch/xtensa/configs/nommu_kc705_defconfig
index 88b2e222d4bf..54250bc74885 100644
--- a/arch/xtensa/configs/nommu_kc705_defconfig
+++ b/arch/xtensa/configs/nommu_kc705_defconfig
@@ -33,7 +33,6 @@ CONFIG_PREEMPT=y
 CONFIG_MEMMAP_CACHEATTR=0xfff2442f
 # CONFIG_PCI is not set
 CONFIG_XTENSA_PLATFORM_XTFPGA=y
-CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="earlycon=uart8250,mmio32native,0x9d050020,115200n8 console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=256M@0x60000000"
 CONFIG_USE_OF=y
 CONFIG_BUILTIN_DTB_SOURCE="kc705_nommu"
diff --git a/arch/xtensa/configs/smp_lx200_defconfig b/arch/xtensa/configs/smp_lx200_defconfig
index a47c85638ec1..58b284fd627f 100644
--- a/arch/xtensa/configs/smp_lx200_defconfig
+++ b/arch/xtensa/configs/smp_lx200_defconfig
@@ -30,7 +30,6 @@ CONFIG_HOTPLUG_CPU=y
 # CONFIG_INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX is not set
 # CONFIG_PCI is not set
 CONFIG_XTENSA_PLATFORM_XTFPGA=y
-CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="earlycon=uart8250,mmio32native,0xfd050020,115200n8 console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=96M@0"
 CONFIG_USE_OF=y
 CONFIG_BUILTIN_DTB_SOURCE="lx200mx"
diff --git a/arch/xtensa/configs/virt_defconfig b/arch/xtensa/configs/virt_defconfig
index 6d1387dfa96f..fb4dce2c70a3 100644
--- a/arch/xtensa/configs/virt_defconfig
+++ b/arch/xtensa/configs/virt_defconfig
@@ -21,7 +21,6 @@ CONFIG_XTENSA_VARIANT_DC233C=y
 CONFIG_XTENSA_UNALIGNED_USER=y
 CONFIG_XTENSA_KSEG_512M=y
 CONFIG_HIGHMEM=y
-CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=0x80000000@0"
 CONFIG_USE_OF=y
 CONFIG_BUILTIN_DTB_SOURCE="virt"
diff --git a/arch/xtensa/configs/xip_kc705_defconfig b/arch/xtensa/configs/xip_kc705_defconfig
index 4f1ff9531f6a..ae4427773af2 100644
--- a/arch/xtensa/configs/xip_kc705_defconfig
+++ b/arch/xtensa/configs/xip_kc705_defconfig
@@ -26,7 +26,6 @@ CONFIG_KERNEL_LOAD_ADDRESS=0xf6000000
 CONFIG_XTENSA_KSEG_512M=y
 CONFIG_HIGHMEM=y
 CONFIG_XTENSA_PLATFORM_XTFPGA=y
-CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="earlycon=uart8250,mmio32native,0xfd050020,115200n8 console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=0x38000000@0"
 CONFIG_USE_OF=y
 CONFIG_BUILTIN_DTB_SOURCE="kc705"
diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index ed184106e4cf..ebb009f112a5 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -25,6 +25,7 @@
 #include <linux/cpu.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
+#include <linux/cmdline.h>
 
 #if defined(CONFIG_VGA_CONSOLE) || defined(CONFIG_DUMMY_CONSOLE)
 # include <linux/console.h>
@@ -73,10 +74,6 @@ extern unsigned long loops_per_jiffy;
 
 static char __initdata command_line[COMMAND_LINE_SIZE];
 
-#ifdef CONFIG_CMDLINE_BOOL
-static char default_command_line[COMMAND_LINE_SIZE] __initdata = CONFIG_CMDLINE;
-#endif
-
 #ifdef CONFIG_PARSE_BOOTPARAM
 /*
  * Boot parameter parsing.
@@ -257,10 +254,7 @@ void __init init_arch(bp_tag_t *bp_start)
 	early_init_devtree(dtb_start);
 #endif
 
-#ifdef CONFIG_CMDLINE_BOOL
-	if (!command_line[0])
-		strlcpy(command_line, default_command_line, COMMAND_LINE_SIZE);
-#endif
+	cmdline_build(command_line, command_line);
 
 	/* Early hook for platforms */
 
-- 
2.25.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
