Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D357DC7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 20:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vi3EhqCvPfXhqEwseAQc4Bpr/LsNlJV8qD1Uo/AP3is=; b=zqa8t65JUJvU/M
	sNsx0JTgJn7ZPWzjsBiKizXEt+F3tXPMiIIjBxFWFUuUurRbykIieJVCgo/gGWIsKQ/F8N5LBajhA
	SNuXxJd9Fz5a/GBJHAEDhqnt8v/4MAPmNrDwFqKcCWdjroGT1FBLyojJAmluwWz+a7EcfxQWNfnX+
	SjrMJmqPc3H0XXwEUhEaKaAybdph+JsXK7KFMIHU+nvkLL7QvLQK6OC9HQtatok83Sv3tjw8qJUwj
	ltPsvVCrFgqiD6B9/PLyw166IDjrbElc0piJEVUjJviiCDnC1hm5TSPeuIn5F5U82iKPtjmoXJC52
	LnxQRe+jv5vZ/iskwljw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3j5b-00BahX-38;
	Mon, 29 May 2023 20:03:35 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3j5Y-00Bafs-1N
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 20:03:34 +0000
X-QQ-mid: bizesmtp69t1685390599tn4jgnkv
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 04:03:18 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: k0mQ4ihyJQNl0tPjdjOgNqX0jjoVkxp1GSPuWGQl656yikeNBviNJKBitUkp6
	lm+aMUjEhrGBVafJe/0RXm005dmvPr0svXZCa00fN2INLXf8FnX81RmDUt2RhzUgAQmcJaY
	X/4en6armYsi4js8RQbWSj7MXj+1rrUUZu0TBjhA9ohK0H0sNutaoVfQBevgcxiUkv87vvL
	+//jtz8F0e5Q0CYbDrwZ5uz07UcKaxwX0zS7KvhqZyM0K2PQzxduLNZPan30L2AVmLACHeh
	eURVC7zC4QyiX2NfPz2+tAWb4UnLZt1DZtzFcv2zFEbXFBGRgAzzEve+INc5O82EGXUTX6q
	Jn2upXB9ZPMongQJPWwow/0kN1eZf1RBE53Rw0kETzF1NOKT5hNlIbUUAZG6V5q2HzXpa8i
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5246615934604989803
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 13/13] selftests/nolibc: riscv: customize makefile for rv32
Date: Tue, 30 May 2023 04:03:13 +0800
Message-Id: <6f065441a6be9e63238ffb3d43cf09a6e4ac6773.1685387485.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685387484.git.falcon@tinylab.org>
References: <cover.1685387484.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_130332_768565_A469754D 
X-CRM114-Status: GOOD (  12.69  )
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
