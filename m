Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FDDC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 21 May 2022 20:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G1sF4GJbwR6CYy8H+E8rqBj/h/0/AqUybGuP2QZBoZ8=; b=P+Vuwo4nMW6Sf3
	dx5PB9uc1pFdEbbdk3axjTLmY0lesA2YoZ7SBJPz3wn1madKfd/Pla5tPzSLcONRCsqXgrbCZ+66Y
	IkL+QPGsv7yVZ1YkS7Zxjk2UacCx2uuqpc/Ck12FF8f+KfGE76huy1m8VxpluZGsA2zjDE2mJoYmg
	O2Hv58Op1dkMA9LUBUAZkpd/c32G50qgYn98Wi25Pm7wNv3OxsQqwXuxwUsZMtWa25Y1wbj7VnuWA
	yj+AlI5l9m+ZyAaWEqyorvEhYjHj5d2aNWsghktQ66qYHNmjUvZheUlib6ySnsiEiBbuvDi4T5nzv
	4Z+492YIPBmVDRYo3pqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsVzv-00HUXc-W9; Sat, 21 May 2022 20:46:52 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsVzo-00HUTG-8K
 for linux-riscv@lists.infradead.org; Sat, 21 May 2022 20:46:47 +0000
Received: by mail-pg1-x52f.google.com with SMTP id x12so10473179pgj.7
 for <linux-riscv@lists.infradead.org>; Sat, 21 May 2022 13:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=usyhwP/KwRkMAAW3OjtqeLeezQkFXtj2bkw/kE19m5Q=;
 b=1YyhYIEIaB24tj28Re+FkAgGzvmYJUoPfz+vFi5S2BnvCTcUOa7KBTg4/TZsySrRb7
 XJs3RGcdcGVEoCnC39Un23ArHdivPh26Ss+unkT28Y5i7eCHbSbLijN/PyTh2pYZoCEo
 p2stm6cDp0Nw+iEhRYOb4U+x2Qo10Lxkzgdh/mDS8erQB3eLlV1u8Ur6dplcgV8km+oD
 3XfZ3m8Z/lia6JlGzBIdrr45kTV11Cx3aDnhghFHckspAPX0F/9+gR85ieAl2JrnEqxM
 faf51/ZmCHV/4VcgBvKNrl3dNVui9NIXH15JHg33cclg3/xDmE9VtWU5CXNxLZGFrcrb
 FVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=usyhwP/KwRkMAAW3OjtqeLeezQkFXtj2bkw/kE19m5Q=;
 b=hn/yaHTvpl4ooRcmxfsZfA6cZGw84PuLG+8XP2E1SEzUkTdNgtDFlirTu2L5W4/P8c
 XKMWMGl0z+hITh6Tpp+fkMFtr6hNcNr+1cMh7UBcOTE4mAj5tRpZJb2BoAPo5ovGgUhP
 /lAyG+PZg8S0WwPLctCUwKlNB0wL5UqiUF41/JkGtwKvhF/l2cBF64DYcTmdjp5exQGB
 pRadv390dge8yQUuGAyIEJuZy9j1WwcsPEMKCOUIVYb9uBH1uXQAWV9YQ3RMWlzQWUIp
 41NNlIZLQNV2T/imgrb3w06F1i/VT7IM36Qiv+ceISy+/nSWQwD0F8f/h0jcbi31riGe
 teRg==
X-Gm-Message-State: AOAM532RIzssK6SwfIst2slDMPdWuG5YV7Ah9e/1KXUBaoIpBpc8Mz+F
 BQcNZPGgTR7dxhMH5hC/HaOI7w==
X-Google-Smtp-Source: ABdhPJxTe/x0IsEod7AHPDynxPnajNHzpIfJC5+mhuOEbsM1Ivf0vj0d66+wgOtLpXZXwq3QnVmMXg==
X-Received: by 2002:a63:4f1e:0:b0:3f5:cf9b:7b94 with SMTP id
 d30-20020a634f1e000000b003f5cf9b7b94mr13726257pgb.457.1653166002598; 
 Sat, 21 May 2022 13:46:42 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 k2-20020a17090a62c200b001df3d5a441bsm4013626pjs.53.2022.05.21.13.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 13:46:42 -0700 (PDT)
Subject: [PATCH v3] RISC-V: Add CONFIG_{NON,}PORTABLE
Date: Sat, 21 May 2022 12:33:57 -0700
Message-Id: <20220521193356.26562-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, rdunlap@infradead.org, Arnd Bergmann <arnd@arndb.de>,
 anup@brainfault.org, 
 alexandre.ghiti@canonical.com, damien.lemoal@opensource.wdc.com,
 Atish Patra <atishp@rivosinc.com>, 
 axboe@kernel.dk, guoren@kernel.org, mchitale@ventanamicro.com,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux@rivosinc.com,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_134644_307017_F0909DF2 
X-CRM114-Status: GOOD (  16.37  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

The RISC-V port has collected a handful of options that are
fundamentally non-portable.  To prevent users from shooting themselves
in the foot, hide them all behind a config entry that explicitly calls
out that non-portable binaries may be produced.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Changes since v2:

* Update the nommu and rv32 defconfigs.  I'm still getting some ugliness
  like

    $ make.riscv rv32_defconfig
    *** Default configuration is based on 'defconfig'
    #
    # configuration written to .config
    #
    Using .config as base
    Merging ./arch/riscv/configs/32-bit.config
    Value of CONFIG_PORTABLE is redefined by fragment ./arch/riscv/configs/32-bit.config:
    Previous value: CONFIG_PORTABLE=y
    New value: # CONFIG_PORTABLE is not set
    
    Value of CONFIG_NONPORTABLE is redefined by fragment ./arch/riscv/configs/32-bit.config:
    Previous value: # CONFIG_NONPORTABLE is not set
    New value: CONFIG_NONPORTABLE=y
    
    #
    # merged configuration written to .config (needs make)
    #
    .config:3831:warning: override: ARCH_RV32I changes choice state
    #
    # configuration written to .config
    #

  not sure if there's a better way to do this.

Changes since v1:

* Fix a bunch of spelling mistakes.
* Move NONPORTABLE under the "Platform type" sub-heading.
* Fix the rv32i dependency.

---
 arch/riscv/Kconfig                            | 28 +++++++++++++++++--
 arch/riscv/configs/32-bit.config              |  2 ++
 arch/riscv/configs/nommu_k210_defconfig       |  1 +
 .../riscv/configs/nommu_k210_sdcard_defconfig |  1 +
 arch/riscv/configs/nommu_virt_defconfig       |  1 +
 arch/riscv/configs/rv32_defconfig             |  1 +
 6 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f863065b478c..cd67b09a80f5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -222,6 +222,21 @@ source "arch/riscv/Kconfig.erratas"
 
 menu "Platform type"
 
+config NONPORTABLE
+	bool "Allow configurations that result in non-portable kernels"
+	help
+	  RISC-V kernel binaries are compatible between all known systems
+	  whenever possible, but there are some use cases that can only be
+	  satisfied by configurations that result in kernel binaries that are
+	  not portable between systems.
+
+	  Selecting N does not guarantee kernels will be portable to all known
+	  systems.  Selecting any of the options guarded by NONPORTABLE will
+	  result in kernel binaries that are unlikely to be portable between
+	  systems.
+
+	  If unsure, say N.
+
 choice
 	prompt "Base ISA"
 	default ARCH_RV64I
@@ -231,6 +246,7 @@ choice
 
 config ARCH_RV32I
 	bool "RV32I"
+	depends on NONPORTABLE
 	select 32BIT
 	select GENERIC_LIB_ASHLDI3
 	select GENERIC_LIB_ASHRDI3
@@ -541,6 +557,7 @@ config STACKPROTECTOR_PER_TASK
 
 config PHYS_RAM_BASE_FIXED
 	bool "Explicitly specified physical RAM address"
+	depends on NONPORTABLE
 	default n
 
 config PHYS_RAM_BASE
@@ -554,7 +571,7 @@ config PHYS_RAM_BASE
 
 config XIP_KERNEL
 	bool "Kernel Execute-In-Place from ROM"
-	depends on MMU && SPARSEMEM
+	depends on MMU && SPARSEMEM && NONPORTABLE
 	# This prevents XIP from being enabled by all{yes,mod}config, which
 	# fail to build since XIP doesn't support large kernels.
 	depends on !COMPILE_TEST
@@ -594,9 +611,16 @@ endmenu
 
 config BUILTIN_DTB
 	bool
-	depends on OF
+	depends on OF && NONPORTABLE
 	default y if XIP_KERNEL
 
+config PORTABLE
+	bool
+	default !NONPORTABLE
+	select EFI
+	select OF
+	select MMU
+
 menu "Power management options"
 
 source "kernel/power/Kconfig"
diff --git a/arch/riscv/configs/32-bit.config b/arch/riscv/configs/32-bit.config
index 43f41323b67e..f6af0f708df4 100644
--- a/arch/riscv/configs/32-bit.config
+++ b/arch/riscv/configs/32-bit.config
@@ -1,2 +1,4 @@
 CONFIG_ARCH_RV32I=y
 CONFIG_32BIT=y
+# CONFIG_PORTABLE is not set
+CONFIG_NONPORTABLE=y
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 2438fa39f8ae..96fe8def644c 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -28,6 +28,7 @@ CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 # CONFIG_MMU is not set
 CONFIG_SOC_CANAAN=y
+CONFIG_NONPORTABLE=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
 CONFIG_CMDLINE="earlycon console=ttySIF0"
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index 9a133e63ae5b..379740654373 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -20,6 +20,7 @@ CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 # CONFIG_MMU is not set
 CONFIG_SOC_CANAAN=y
+CONFIG_NONPORTABLE=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
 CONFIG_CMDLINE="earlycon console=ttySIF0 root=/dev/mmcblk0p1 rootwait ro"
diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
index 5269fbb6b4fc..1a56eda5ce46 100644
--- a/arch/riscv/configs/nommu_virt_defconfig
+++ b/arch/riscv/configs/nommu_virt_defconfig
@@ -25,6 +25,7 @@ CONFIG_EXPERT=y
 CONFIG_SLOB=y
 # CONFIG_MMU is not set
 CONFIG_SOC_VIRT=y
+CONFIG_NONPORTABLE=y
 CONFIG_SMP=y
 CONFIG_CMDLINE="root=/dev/vda rw earlycon=uart8250,mmio,0x10000000,115200n8 console=ttyS0"
 CONFIG_CMDLINE_FORCE=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 7e5efdc3829d..77bdb1d05a88 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -18,6 +18,7 @@ CONFIG_EXPERT=y
 CONFIG_PROFILING=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
+CONFIG_NONPORTABLE=y
 CONFIG_ARCH_RV32I=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
