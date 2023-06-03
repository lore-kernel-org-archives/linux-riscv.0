Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2052C7EE2D
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 09:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vi3EhqCvPfXhqEwseAQc4Bpr/LsNlJV8qD1Uo/AP3is=; b=xrG2WUA6/7d4eO
	wKaiMWy2LBqt9moPSr5VE1MFqF6S92qZxDqHCQSO3V/ZCcZ68B8EXOCpumC7vA5W+w5LqEqwWE/cs
	l1PpU4XJcagaaOchKXzxMpDvEwl402qNYtM2DU0rHvd2WOPXwuRcViFFPg8vLKcZYyqhbwCcnf22j
	W1zW1BdXgeqHuXPfuXF9/ySJPbZ+Yl34FnGjShjwwoOEfBdonvmg6focmuoAQ2rXdGtfPsVhWczYK
	IIlu0DdOa76F1mojpJrK/oo3Yuz7W9W8LHnQjQHe+fMyj28PvORBYDtyZ4PAfHhMs1FP2bCu1+X8V
	w9o+m229YrElf45vyqPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5NDL-009AfX-2N;
	Sat, 03 Jun 2023 09:06:23 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5NDI-009Aei-2K
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jun 2023 09:06:22 +0000
X-QQ-mid: bizesmtp76t1685783167t32ijw6q
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 03 Jun 2023 17:06:06 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: XBN7tc9DADKW+yryutXgxkBktiocyVQWqIBJpHLPEYQQnedoqzSogJlmBvRch
	UNUBX4WxjurDWKmNTfPSC/M9TEYXV3HyQsc69/eU2u2ydk/ZOAHadlF7T5yBR9SLziXeNzZ
	y1gbAvQGaP56JA+VTBffneB/pGSwFKsN2TqmsgnrvnBijWdEtG7Y8erMbLLlXrxyDVCTrQ8
	j8uK1oQLbkgTFGAkrh72oZHh3CPMlzfII5e1tfN9lPwP0daM8tuwo4UiidXJWrt3BGnZKxK
	Z7GsmYsjGBzzVQGbj2jFO/yv1qhOoGd/u+TOzIWqYCmBCV1sofw9bJAhaAYDVNolJpIwBlT
	84q6FFYa13cajHnJq4k/YKSwLSfRZBWrfOTHJ/0y+pUcOspWnourKnqNfE7msxkJesw9aYe
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10907565282954652268
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v3 3/3] selftests/nolibc: riscv: customize makefile for rv32
Date: Sat,  3 Jun 2023 17:05:58 +0800
Message-Id: <ca162c288c3eeda309c33049711b5272eb80f8e2.1685780412.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685780412.git.falcon@tinylab.org>
References: <cover.1685780412.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_020621_056918_08368A2F 
X-CRM114-Status: GOOD (  12.38  )
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

Both riscv64 and riscv32 have:

* the same ARCH value, it is riscv
* the same arch/riscv source code tree

The only differences are:

* riscv64 uses defconfig, riscv32 uses rv32_defconfig
* riscv64 uses qemu-system-riscv64, riscv32 uses qemu-system-riscv32
* riscv32 has different compiler options (-march= and -mabi=)

So, riscv32 can share most of the settings with riscv64, there is no
need to add it as a whole new architecture but just need a flag to
record and reflect the difference.

The 32bit mips and loongarch may be able to use the same method, so,
let's use a meaningful flag: CONFIG_32BIT. If required in the future,
this flag can also be automatically loaded from
include/config/auto.conf.

With this patch, it is able to run nolibc test for rv32 like this:

    $ make run ARCH=riscv32 CROSS_COMPILE=riscv64-linux-gnu- ...

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/Makefile | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 44088535682e..ea434a0acdc1 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -14,6 +14,12 @@ include $(srctree)/scripts/subarch.include
 ARCH = $(SUBARCH)
 endif
 
+# Allow pass ARCH=riscv|riscv32|riscv64, riscv implies riscv64
+ifneq ($(findstring xriscv,x$(ARCH)),)
+  CONFIG_32BIT := $(if $(findstring 32x,$(ARCH)x),1)
+  override ARCH := riscv
+endif
+
 # kernel image names by architecture
 IMAGE_i386       = arch/x86/boot/bzImage
 IMAGE_x86_64     = arch/x86/boot/bzImage
@@ -34,7 +40,7 @@ DEFCONFIG_x86        = defconfig
 DEFCONFIG_arm64      = defconfig
 DEFCONFIG_arm        = multi_v7_defconfig
 DEFCONFIG_mips       = malta_defconfig
-DEFCONFIG_riscv      = defconfig
+DEFCONFIG_riscv      = $(if $(CONFIG_32BIT),rv32_defconfig,defconfig)
 DEFCONFIG_s390       = defconfig
 DEFCONFIG_loongarch  = defconfig
 DEFCONFIG            = $(DEFCONFIG_$(ARCH))
@@ -49,7 +55,7 @@ QEMU_ARCH_x86        = x86_64
 QEMU_ARCH_arm64      = aarch64
 QEMU_ARCH_arm        = arm
 QEMU_ARCH_mips       = mipsel  # works with malta_defconfig
-QEMU_ARCH_riscv      = riscv64
+QEMU_ARCH_riscv      = $(if $(CONFIG_32BIT),riscv32,riscv64)
 QEMU_ARCH_s390       = s390x
 QEMU_ARCH_loongarch  = loongarch64
 QEMU_ARCH            = $(QEMU_ARCH_$(ARCH))
@@ -76,6 +82,7 @@ else
 Q=@
 endif
 
+CFLAGS_riscv = $(if $(CONFIG_32BIT),-march=rv32i -mabi=ilp32)
 CFLAGS_s390 = -m64
 CFLAGS_STACKPROTECTOR ?= $(call cc-option,-mstack-protector-guard=global $(call cc-option,-fstack-protector-all))
 CFLAGS  ?= -Os -fno-ident -fno-asynchronous-unwind-tables -std=c89 \
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
