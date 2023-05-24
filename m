Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA426C7EE2D
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 17:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dw1p7HQlmpp7jAhAhlv5U6huBh4e7MPZoh/KrtlZ0Bg=; b=3pW4Xbk09Sv82S
	NZoBW7v1OHStl9xmgL/8bDMsxqiu3YEAOUxVV55KRJubthyMjUVjh+Gmr2SvUSbhgPMebCd/nNvk2
	HaX6N98QVgeTQZPCPg3b1YaK1XZ1z24TQ2WXiKeyJnP4g1JFhMtkdzFTibfUeq84E1vFijebne22T
	F0NP2plhmdmmRM6YAHf/O+dm/aCAkG9O4ZJ7jUXsL8uQ44skyOiZKhHPZHHwg3ysZnUVfpxwJDo+1
	GTOdAIjH8KuPZnEYeXjblSMZiKmxD9gG6YP5YdsNdMIZaL1SFWXfUK6KERKnP9fz5CV1+iQYSnhAE
	kt5c9ialk58vFm8QJVJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1se7-00EGPS-2w;
	Wed, 24 May 2023 17:51:35 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1se4-00EGOF-2f
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 17:51:34 +0000
X-QQ-mid: bizesmtp74t1684950681t6yn0ug4
Received: from linux-lab-host.localdomain ( [116.30.125.36])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 May 2023 01:51:20 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: XBN7tc9DADIjgXxH3TLgSj0VxrQrlL8zhmh+je68CBXjsGiccEXwXly8k6tY2
	sC6ZTFBT/sSxaXpDpmnl0LuhIAIGbtTvL5iSFY/1OirQIpXra0UPbmdM27b0Too6T6HMjnI
	SfX8v6h6fpBl9pr85gssp4sQRvlDlefaiz21KSWLsuDAH+5hlMhyWQ9dJJ0jaTZjmnUgZTl
	WfBb83pbAN6Y2MHZ0Z1N0713TbxSUgJgxPdTE5p4QCAwVJzfrLjfM+rchc1rauuUwS9ZL2Q
	+zzJYhPPZycNK74ty8mb/+lulh9ITcXDtfNrrrTrPvtIKDqUWa71PYM6R8Zc7w8Tx+dB1h5
	gc0kJfc4Uo+Z7HG2jUcWLfat5YfgHjhNbNwJaOt7iBXLsZ1r9c10EoJ9fC8kA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9362597726359131940
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	thomas@t-8ch.de
Subject: [PATCH 05/13] selftests/nolibc: riscv: customize makefile for rv32
Date: Thu, 25 May 2023 01:50:57 +0800
Message-Id: <7adb27a7c56dd06d782710a5f684ea6263900f98.1684949268.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1684949267.git.falcon@tinylab.org>
References: <cover.1684949267.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_105133_163803_88CA3676 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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

both riscv64 and riscv32 have the same ARCH value, it is riscv, the
default defconfig enables 64bit, to support riscv32, let's allow pass
"ARCH=riscv32" or "ARCH=riscv CONFIG_32BIT=1" to customize riscv32
setting.

Note: glibc >= 2.33 is required to avoid a bug of the old
bits/wordsize.h.

  /usr/riscv64-linux-gnu/include/bits/wordsize.h:28:3: error: #error "rv32i-based targets are not supported"
           28 | # error "rv32i-based targets are not supported"

This can not pass compile, several time64 syscalls are still missing.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/Makefile | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 47c3c89092e4..9adc8944dd80 100644
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
 
+CFLAGS_riscv = $(if $(CONFIG_32BIT),-march=rv32im -mabi=ilp32)
 CFLAGS_s390 = -m64
 CFLAGS_STACKPROTECTOR ?= $(call cc-option,-mstack-protector-guard=global $(call cc-option,-fstack-protector-all))
 CFLAGS  ?= -Os -fno-ident -fno-asynchronous-unwind-tables -std=c89 \
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
