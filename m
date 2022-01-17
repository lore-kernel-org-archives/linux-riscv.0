Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B70CC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 09:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lAS3vvqN/PIWSgFyXmX2Q4Fmg4wpxNyeHG5eG6/z9Nc=; b=eYa++DXPvt2knw
	WPl5DNtJiN6Zrs8zk6dLIfTjCeIRWoq0RG/duJ8wqgcSwfCdYmbH7UhtD7aLQr6GH+eZ1tGLIb55G
	kZUfWfB689/HDfWNkCEyphJzrzvWLN7HkzhRzIIXgXXsMdy8hlHtwRyNKdSgKvrXEveTILGA27PSl
	6tgF+u9HaEJGvDEa3OKu252z/ux28vbVfG+4RcmvNymp6iHeF3CEz0ylPtxbgWsaXrRYeJ126OWfF
	cOMSoC/z/buyt9Fn9L8LrjKc/eZdNk3jLgySZM8O3VpjwtAW6FfG60R8213bL/cwwwc5Vavq3fr1t
	wC/FAhT9eVzslk0Dh3Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9OlX-00EOpP-4K; Mon, 17 Jan 2022 09:57:31 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9OlS-00EOmb-IW
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 09:57:28 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6914F3F1C9
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jan 2022 09:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642413438;
 bh=EydrzfONuvCJ3GDZ6a2m2aD/U8coEqSGBnCJGhzxmq8=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=TznLwHsyE5vk6JXWN5Sq0WamoHQO8p+QtfbSwxEaeJDZUfNKXDk7g6S5oWGTWgZ/7
 0kmN+jbsNAkXDjpEFAbsAS8hNERrEwVFyx8/Pz4NOpSpl8LpF+IA2mq8aoNIkXJk9H
 mCrUIuJs/1/99+2JqrJqDv7U40FPabdZtaAD4gUmHj8+0w0UUPwiIZLtHh02WlrheX
 YlD7fSLPfCty/6TZDzFbJ4U+Gnwb7Sh1YktnThcPKJKARfXyYIo9JvNMKvhJMJPWg3
 kKoyXvziMHohlHBsqPAOAsDCSTYzqjUmPRR+VoZQcep7SLJfPx8hCAgvyGCzkAyBBU
 U+jbD2KBF9oDQ==
Received: by mail-wm1-f70.google.com with SMTP id
 w5-20020a1cf605000000b0034b8cb1f55eso4589121wmc.0
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jan 2022 01:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EydrzfONuvCJ3GDZ6a2m2aD/U8coEqSGBnCJGhzxmq8=;
 b=LQFdpIHpt0zq9qrLAH/762tpuWGUOQ+FqpeNyAfaPWY9xVklcpjwmCs9pHyodhORBM
 SOWhjFreRtqfPsp4p0JIVxtRzl7OmzJq/EOP2zOd09J6PSZGnn1vxWlPMPbGgx1npfEN
 v3hUzMsRkBrV1PtTxFJK49m4y4R+ojqz6IoeWEtptGd54M2FIE3NchBiCkzihg1OcMEY
 igFCjEVCWgoWrt1Fty630hwaVCPfmt8/x+sWfglHYVWNOEEUTK+XgmYrQs2wtm+PBI+W
 hl5Pi9iExRnHyH3i17SkKoBmPhScT/s4YnMr0TaMkPs6h2lLNXlZTPCVt1FK4fymvHVi
 nPwQ==
X-Gm-Message-State: AOAM531uMj/1d6VD+xPiBg0w7JkxS93HZC/v4SIwM9Nrd9GOYx1uf0pY
 MIsAtnZ/5H3AsKypKOkRIcqGgcvexdwXsf+UdzZvm563krBzruDP0dmDnFDRNglvkonoZPj6HiF
 yEOvFp8Zny9StOooY3Y7ytfhc+gAwE3F8YUG+G4gCu9m9rQ==
X-Received: by 2002:a5d:64e3:: with SMTP id g3mr6090713wri.450.1642413438146; 
 Mon, 17 Jan 2022 01:57:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/4vcuV9y3MHHQHy6ByzoTMq/wmxrv5ThZ2hY99ztSdfnFZx1hQWh4V1k/sVSLvXnIbRjdvQ==
X-Received: by 2002:a5d:64e3:: with SMTP id g3mr6090701wri.450.1642413437950; 
 Mon, 17 Jan 2022 01:57:17 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1])
 by smtp.gmail.com with ESMTPSA id r132sm13691305wma.34.2022.01.17.01.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 01:57:17 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <Conor.Dooley@microchip.com>
Subject: [PATCH -next] riscv: Get rid of MAXPHYSMEM configs
Date: Mon, 17 Jan 2022 10:57:16 +0100
Message-Id: <20220117095716.2512405-1-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_015726_810558_02021762 
X-CRM114-Status: GOOD (  13.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CONFIG_MAXPHYSMEM_* are actually never used, even the nommu defconfigs
selecting the MAXPHYSMEM_2GB had no effects on PAGE_OFFSET since it was
preempted by !MMU case right before.

In addition, the move of the kernel mapping at the end of the address
space broke the use of MAXPHYSMEM_2G with MMU since it defines PAGE_OFFSET
at the same address as the kernel mapping.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: 2bfc6cd81bd1 ("riscv: Move kernel mapping outside of linear mapping")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Tested-by: Conor Dooley <Conor.Dooley@microchip.com>
---
 arch/riscv/Kconfig                            | 23 ++-----------------
 arch/riscv/configs/nommu_k210_defconfig       |  1 -
 .../riscv/configs/nommu_k210_sdcard_defconfig |  1 -
 arch/riscv/configs/nommu_virt_defconfig       |  1 -
 4 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index de89279c8f57..f961a81e58af 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -160,10 +160,9 @@ config PA_BITS
 
 config PAGE_OFFSET
 	hex
-	default 0xC0000000 if 32BIT && MAXPHYSMEM_1GB
+	default 0xC0000000 if 32BIT
 	default 0x80000000 if 64BIT && !MMU
-	default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
-	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
+	default 0xffffffe000000000 if 64BIT
 
 config KASAN_SHADOW_OFFSET
 	hex
@@ -272,24 +271,6 @@ config MODULE_SECTIONS
 	bool
 	select HAVE_MOD_ARCH_SPECIFIC
 
-choice
-	prompt "Maximum Physical Memory"
-	default MAXPHYSMEM_1GB if 32BIT
-	default MAXPHYSMEM_2GB if 64BIT && CMODEL_MEDLOW
-	default MAXPHYSMEM_128GB if 64BIT && CMODEL_MEDANY
-
-	config MAXPHYSMEM_1GB
-		depends on 32BIT
-		bool "1GiB"
-	config MAXPHYSMEM_2GB
-		depends on 64BIT
-		bool "2GiB"
-	config MAXPHYSMEM_128GB
-		depends on 64BIT && CMODEL_MEDANY
-		bool "128GiB"
-endchoice
-
-
 config SMP
 	bool "Symmetric Multi-Processing"
 	help
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index e8ceab678e8b..3f42ed87dde8 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -29,7 +29,6 @@ CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 # CONFIG_MMU is not set
 CONFIG_SOC_CANAAN=y
-CONFIG_MAXPHYSMEM_2GB=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
 CONFIG_CMDLINE="earlycon console=ttySIF0"
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index 46aa3879f19c..2a82a3b2992b 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -21,7 +21,6 @@ CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 # CONFIG_MMU is not set
 CONFIG_SOC_CANAAN=y
-CONFIG_MAXPHYSMEM_2GB=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
 CONFIG_CMDLINE="earlycon console=ttySIF0 rootdelay=2 root=/dev/mmcblk0p1 ro"
diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
index 385cca741b01..5f078156dfcd 100644
--- a/arch/riscv/configs/nommu_virt_defconfig
+++ b/arch/riscv/configs/nommu_virt_defconfig
@@ -27,7 +27,6 @@ CONFIG_SLOB=y
 # CONFIG_SLAB_MERGE_DEFAULT is not set
 # CONFIG_MMU is not set
 CONFIG_SOC_VIRT=y
-CONFIG_MAXPHYSMEM_2GB=y
 CONFIG_SMP=y
 CONFIG_CMDLINE="root=/dev/vda rw earlycon=uart8250,mmio,0x10000000,115200n8 console=ttyS0"
 CONFIG_CMDLINE_FORCE=y
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
