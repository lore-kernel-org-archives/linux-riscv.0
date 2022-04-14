Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD49C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 01:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LO0QjvX/iFhTU2pXHB+WJuHkyw3SvfTyEApAkc+wqQQ=; b=y0d91YMylIm/Zg
	rNHmBbf6R/b9ppo5FYJbzovva5pE6MOUNaW6uPM+mo1UwnJugAvNnjeQBLz0Y2dZ8UhVtZ+forn2p
	BOzwLtKer3RUREx+vvdcP1pSt5kc4+ggLB8eTK1Y971fsxyBJof3HfT/fx4kzjtVTnF82HHIwTxjK
	777ob3lJ9jFmEnHgKas1pqVz3gBJPqDGsmmmqdhIVqYcl8VFvGKjFsj6NeFQW0QdSrzZkhrg0vOD2
	lO5ggqERpfjRw3fVEK2Hm+aqHZ4eC5jIJfeAgdODcE8mJBl/vRhWM5zwmf9u0mrpKYLxqtbwQDPSL
	6F/E6A5zlr2DJpE3QHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neoTF-003Hxg-UE; Thu, 14 Apr 2022 01:40:29 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neoTD-003Hwv-40
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 01:40:28 +0000
Received: by mail-pg1-x535.google.com with SMTP id h5so3426040pgc.7
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 18:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=RdayCDxEwJD59KqBdusCEOpxaJASjBt83sSueeG1AHo=;
 b=ycMC/7bYjbOcLcEX2Tt8VKIilnYKeWYE2bx96R/lFO0m6rchL4vLEVtbx4DIHM3ORk
 UBDoEhJBvmkZ1TigC5xaY+u+GfFf+KjYS1ZNKjjfcj2SGDdkH3LMRQjQpTd2QexjnxFN
 tiicpxYwhRWaqtFUTgMbq7IG+Gtk4bo5ggk+L2LbhgUNmU4gFkofLgn07fI7ltWhQZm2
 CHPxSxMUyO+Z6yE8Nyhyq5/jerzahPX/ibsw4W/GWHCi8BeZg/ET8xiatEvsvv8GYWb/
 xDTA5AkCl+Rba/02rycJF0AWURAb834y4CuWXOSXPZLrej6FrILXK5HxFb6eMIm4CcF0
 WcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=RdayCDxEwJD59KqBdusCEOpxaJASjBt83sSueeG1AHo=;
 b=2WBYi0V7udC7v2K6sW5dokv3CPQ3rTaWdGPCPtcEMBuDy3ii/FiDavI7SR2Zb1meeM
 dr6Gl43G1PCnO1YP7D91mICJGAbeLa8k4ITVYGmL7gsIAj050oBt7pVgBMhapE+pkU5m
 GLq4eeAatmQu+65YK1Ud0lGuw13dBFYmRWKQEstPqPKqqw6cxtfKIb3zKDWVVZ2NrfvG
 lWLeD3ukMcnVHGZ2D88IGjG2cxFjlgDjBLvI2FKCq6VPPK1P93YUS8mKx3aIDFJC8O9X
 dqe/zKJNPcyDal2AKLy+Sg6gpew46ClBQmFLunqeWwygntECWjkgxk2/Z4DoAqhjTjcN
 4V7Q==
X-Gm-Message-State: AOAM5313QnqR/2Yn52KDJe9R7rXsZSuiIITr6HG6JWr9Njh1HBd/Qfac
 zXQ/p13s8NEotxchFpgy9v8zHA==
X-Google-Smtp-Source: ABdhPJwSA5lCtRjpiMXmwO58f+FjMqudVsOkIGa/B9oWV7MmYVdot6tpFhxuZ3a6QrC+ya7+j4hS+g==
X-Received: by 2002:a63:e442:0:b0:398:c06b:169c with SMTP id
 i2-20020a63e442000000b00398c06b169cmr380503pgk.170.1649900423449; 
 Wed, 13 Apr 2022 18:40:23 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 w14-20020a17090a4f4e00b001cb510021ecsm4203901pjl.49.2022.04.13.18.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 18:40:23 -0700 (PDT)
Subject: [PATCH v2] RISC-V: Add CONFIG_{NON,}PORTABLE
Date: Wed, 13 Apr 2022 18:40:10 -0700
Message-Id: <20220414014010.28110-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>,         linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_184027_203017_A0FD0B12 
X-CRM114-Status: GOOD (  12.78  )
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

---

Changes since v1:

* Fix a bunch of spelling mistakes.
* Move NONPORTABLE under the "Platform type" sub-heading.
* Fix the rv32i dependency.
---
 arch/riscv/Kconfig | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5adcbd9b5e88..3d8eb44eb889 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -213,6 +213,21 @@ source "arch/riscv/Kconfig.erratas"
 
 menu "Platform type"
 
+config NONPORTABLE
+	bool "Allow configurations that result in non-portable kernels"
+	help
+	  RISC-V kernel binaries are compatible between all known systems
+	  whenever possible, but there are some use cases that can only be
+	  satisfied by configurations that result in kernel binaries that are
+	  not portable between systems.
+
+	  Selecting N does not guarantee kernels will be portable to all knows
+	  systems.  Selecting any of the options guarded by NONPORTABLE will
+	  result in kernel binaries that are unlikely to be portable between
+	  systems.
+
+	  If unsure, say N.
+
 choice
 	prompt "Base ISA"
 	default ARCH_RV64I
@@ -222,6 +237,7 @@ choice
 
 config ARCH_RV32I
 	bool "RV32I"
+	depends on NONPORTABLE
 	select 32BIT
 	select GENERIC_LIB_ASHLDI3
 	select GENERIC_LIB_ASHRDI3
@@ -485,6 +501,7 @@ config STACKPROTECTOR_PER_TASK
 
 config PHYS_RAM_BASE_FIXED
 	bool "Explicitly specified physical RAM address"
+	depends on NONPORTABLE
 	default n
 
 config PHYS_RAM_BASE
@@ -498,7 +515,7 @@ config PHYS_RAM_BASE
 
 config XIP_KERNEL
 	bool "Kernel Execute-In-Place from ROM"
-	depends on MMU && SPARSEMEM
+	depends on MMU && SPARSEMEM && NONPORTABLE
 	# This prevents XIP from being enabled by all{yes,mod}config, which
 	# fail to build since XIP doesn't support large kernels.
 	depends on !COMPILE_TEST
@@ -538,9 +555,16 @@ endmenu
 
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
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
