Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C53C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 07:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+3KIP6CSHcyUYJ9UcMCeTfi5AeRUzS7RREP6bhmDAYw=; b=SorQP+VKST4Y0i
	NU47OUqlH2WOi2i2LaFhbyE+9+W5JskiaZAsTKP5ggZ/bW2WqoMyh4TJXi3Id0GZrT91yKw2R80KN
	8k5IiqdqUZQ5C82qULhjQxsj+TmDxmmdKzmZaUiOVlKilRiF7MclSEWWSONdUSfbQckq0NSRNoa72
	aW8y/hZslkw45dGxfHE3kRlqgNNHSqTd7CL/CAcgODmZ9pCAXviBfr+OblngsnlVwLWgJHofpsZRf
	DtMUllp7JBbpprIQp3woWCI+tVMCP+wpijjpeB/qR2CJ40Pls4NP0d13arE7IjG7UwV+anMrUOx6K
	VaIGxtR1mlcbIypwojQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAS3n-009OI8-HC; Thu, 20 Jan 2022 07:40:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAS2l-009Nm0-D0; Thu, 20 Jan 2022 07:39:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F00B1616C8;
 Thu, 20 Jan 2022 07:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CE7C340E8;
 Thu, 20 Jan 2022 07:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642664378;
 bh=6+QN3q4aqSUi1IDu4NbkVjSryq5HWg+ruxYv8ZbN7Qk=;
 h=From:To:Cc:Subject:Date:From;
 b=dPl3I2yJbJleaFuPkmDUoseXh+7prjut5qJqEplHlYJCq0Xr+iJbInBEpv76C7aj2
 Mi6uRfMA7JM5t4qTTIPS9elyryMIWtiz+pMASQsyKty2h1N9trdLBXGDQmCOKx0VFw
 NzBQPGGAvtm8zvb++Z/Pw3ffH89Bw3ydKHP7bCyjX2YFdEqKofeUfn+RrbguLVFxnL
 C5Nq2KCM/df26zpwGRnpsyGaT5+54JE0a+up6ECGHgp70fO+CJT7P60l46O0yDiCH3
 D8jtmLR38YP9yxDVtnWIUlnI1kkBcEEtUww+uHY0bRH2Bda5u4+DR5G6lySXEZ2Th9
 5b1b900NidNfQ==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de,
 hch@infradead.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 inux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 01/17] kconfig: Add SYSVIPC_COMPAT for all architectures
Date: Thu, 20 Jan 2022 15:38:54 +0800
Message-Id: <20220120073911.99857-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_233939_568412_92ACF173 
X-CRM114-Status: GOOD (  12.11  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The existing per-arch definitions are pretty much historic cruft.
Move SYSVIPC_COMPAT into init/Kconfig.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@infradead.org>
---
 arch/arm64/Kconfig   | 4 ----
 arch/mips/Kconfig    | 5 -----
 arch/parisc/Kconfig  | 4 ----
 arch/powerpc/Kconfig | 5 -----
 arch/s390/Kconfig    | 3 ---
 arch/sparc/Kconfig   | 5 -----
 arch/x86/Kconfig     | 4 ----
 init/Kconfig         | 4 ++++
 8 files changed, 4 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index f6e333b59314..f0aec4bed837 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2035,10 +2035,6 @@ config DMI
 
 endmenu
 
-config SYSVIPC_COMPAT
-	def_bool y
-	depends on COMPAT && SYSVIPC
-
 menu "Power management options"
 
 source "kernel/power/Kconfig"
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 3dd8c4618293..06b2864cee37 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3177,16 +3177,12 @@ config MIPS32_COMPAT
 config COMPAT
 	bool
 
-config SYSVIPC_COMPAT
-	bool
-
 config MIPS32_O32
 	bool "Kernel support for o32 binaries"
 	depends on 64BIT
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT
 	select MIPS32_COMPAT
-	select SYSVIPC_COMPAT if SYSVIPC
 	help
 	  Select this option if you want to run o32 binaries.  These are pure
 	  32-bit binaries as used by the 32-bit Linux/MIPS port.  Most of
@@ -3200,7 +3196,6 @@ config MIPS32_N32
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION
 	select COMPAT
 	select MIPS32_COMPAT
-	select SYSVIPC_COMPAT if SYSVIPC
 	help
 	  Select this option if you want to run n32 binaries.  These are
 	  64-bit binaries using 32-bit quantities for addressing and certain
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 43c1c880def6..bc56759d44a2 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -345,10 +345,6 @@ config COMPAT
 	def_bool y
 	depends on 64BIT
 
-config SYSVIPC_COMPAT
-	def_bool y
-	depends on COMPAT && SYSVIPC
-
 config AUDIT_ARCH
 	def_bool y
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 0631c9241af3..d6f7d4ab1396 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -297,11 +297,6 @@ config COMPAT
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT_OLD_SIGACTION
 
-config SYSVIPC_COMPAT
-	bool
-	depends on COMPAT && SYSVIPC
-	default y
-
 config SCHED_OMIT_FRAME_POINTER
 	bool
 	default y
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index f6a9475cbc8c..1321545104b6 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -460,9 +460,6 @@ config COMPAT
 	  (and some other stuff like libraries and such) is needed for
 	  executing 31 bit applications.  It is safe to say "Y".
 
-config SYSVIPC_COMPAT
-	def_bool y if COMPAT && SYSVIPC
-
 config SMP
 	def_bool y
 
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 66fc08646be5..45401b99d6cb 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -494,9 +494,4 @@ config COMPAT
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT_OLD_SIGACTION
 
-config SYSVIPC_COMPAT
-	bool
-	depends on COMPAT && SYSVIPC
-	default y
-
 source "drivers/sbus/char/Kconfig"
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 407533c835fe..199ec9d960d0 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2869,10 +2869,6 @@ config COMPAT
 if COMPAT
 config COMPAT_FOR_U64_ALIGNMENT
 	def_bool y
-
-config SYSVIPC_COMPAT
-	def_bool y
-	depends on SYSVIPC
 endif
 
 endmenu
diff --git a/init/Kconfig b/init/Kconfig
index e9119bf54b1f..589ccec56571 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -386,6 +386,10 @@ config SYSVIPC_SYSCTL
 	depends on SYSCTL
 	default y
 
+config SYSVIPC_COMPAT
+	def_bool y
+	depends on COMPAT && SYSVIPC
+
 config POSIX_MQUEUE
 	bool "POSIX Message Queues"
 	depends on NET
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
