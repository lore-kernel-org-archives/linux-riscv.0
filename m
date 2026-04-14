Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FF8ED7B9C
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 10:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krcomdAN4K1UuwpWcuRN0IsL6sw2w1/MtrRWQyDvCRY=; b=nmQqYfwWArKMFz
	Inj9HTVr31OFJijuNehwchXMdAeHKHN3BKsFdCq7iNo/Vg1qtD87O87b0ViPEHFwvOU1yUWAkqxIr
	WJLGu6QZ38U/KK2on2yINRLmexZAH6hHFj1uTr2EileOGP4lHNRI7hnlRjUJtOd//Xtz3sZdvs1EA
	fsKZjx5Lv4Lrr6P8W69BdwuyC1Duqraatok0fHPibBcSZ1dcPUXMjhNrnsxuMJnLl5bV8AMPyZOFM
	dDW93MWm+khLPgplyXvB+9k9+kgZ8/3qt5TPc+ssJnsQ0gwB6dFZrz9yjXHFHtCtPkfe7FWBVHXnC
	rWFxFW9csyJlWQ7xMZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCayV-0000000H8XZ-0ayb;
	Tue, 14 Apr 2026 10:26:31 +0000
Received: from forward100b.mail.yandex.net ([178.154.239.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCayP-0000000H8V9-1Nxl
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 10:26:28 +0000
Received: from mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:3d95:0:640:5c83:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTPS id 2A304808C6;
	Tue, 14 Apr 2026 13:26:17 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id BQI23sTa1uQ0-R3mL08dz;
	Tue, 14 Apr 2026 13:26:16 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1776162376; bh=Z0jL1QgAohAbgo95fs67NGWJEQkz9ctzazZ6iXlmN9U=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=NpKxEK1MOVqjZfCapg5ORTlx1SfQb8kKTO3zvbaYC4f68pLRFcPb2XxC7JarRFZua
	 uxOnYlX1zuE6tR8URBmk33k8cOUD9E6HbUAa4gPnmy/6qhJux+AYfNk0ByD24BMTba
	 4sS18wEyE8kqQsQKs3DjuR+mxvdIbs2XBNMN9RaU=
Authentication-Results: mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v4 1/3] riscv: add platform-specific double word shifts for riscv32
Date: Tue, 14 Apr 2026 13:26:06 +0300
Message-ID: <20260414102608.573555-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414102608.573555-1-dmantipov@yandex.ru>
References: <20260414102608.573555-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_032625_587600_30AB0C31 
X-CRM114-Status: GOOD (  16.66  )
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

Add riscv32-specific '__ashldi3()', '__ashrdi3()', and '__lshrdi3()'.
Initially it was intended to fix the following link error observed
when building EFI-enabled kernel with CONFIG_EFI_STUB=y and
CONFIG_EFI_GENERIC_STUB=y:

riscv32-linux-gnu-ld: ./drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L49':
__efistub_cmdline.c:(.init.text+0x1f2): undefined reference to `__efistub___ashldi3'
riscv32-linux-gnu-ld: __efistub_cmdline.c:(.init.text+0x202): undefined reference to `__efistub___lshrdi3'

Reported at [1] trying to build https://patchew.org/linux/20260212164413.889625-1-dmantipov@yandex.ru,
tested with 'qemu-system-riscv32 -M virt' only.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603041925.KLKqpK6N-lkp@intel.com [1]
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v4: bump version to match the series
v3: more tests by Charlie Jenkins
v2: adjust commit message
---
 arch/riscv/Kconfig             |  3 ---
 arch/riscv/kernel/image-vars.h |  7 +++++++
 arch/riscv/lib/Makefile        |  1 +
 arch/riscv/lib/ashldi3.S       | 36 +++++++++++++++++++++++++++++++++
 arch/riscv/lib/ashrdi3.S       | 37 ++++++++++++++++++++++++++++++++++
 arch/riscv/lib/lshrdi3.S       | 36 +++++++++++++++++++++++++++++++++
 6 files changed, 117 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/lib/ashldi3.S
 create mode 100644 arch/riscv/lib/ashrdi3.S
 create mode 100644 arch/riscv/lib/lshrdi3.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ddc534402400d..14b838d408b8c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -404,9 +404,6 @@ config ARCH_RV32I
 	bool "RV32I"
 	depends on NONPORTABLE
 	select 32BIT
-	select GENERIC_LIB_ASHLDI3
-	select GENERIC_LIB_ASHRDI3
-	select GENERIC_LIB_LSHRDI3
 	select GENERIC_LIB_UCMPDI2
 
 config ARCH_RV64I
diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index 3bd9d06a8b8ff..d66e06daf13eb 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -32,6 +32,13 @@ __efistub___init_text_end	= __init_text_end;
 __efistub_sysfb_primary_display	= sysfb_primary_display;
 #endif
 
+/*
+ * These double-word integer shifts are used
+ * by the library code and so EFI stub as well.
+ */
+PROVIDE(__efistub___lshrdi3    = __lshrdi3);
+PROVIDE(__efistub___ashldi3    = __ashldi3);
+
 #endif
 
 #endif /* __RISCV_KERNEL_IMAGE_VARS_H */
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index bbc031124974e..7cee3da80c682 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -13,6 +13,7 @@ ifeq ($(CONFIG_MMU), y)
 lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
 endif
 lib-$(CONFIG_MMU)	+= uaccess.o
+lib-$(CONFIG_32BIT)	+= ashldi3.o ashrdi3.o lshrdi3.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
diff --git a/arch/riscv/lib/ashldi3.S b/arch/riscv/lib/ashldi3.S
new file mode 100644
index 0000000000000..c3408862e2f6a
--- /dev/null
+++ b/arch/riscv/lib/ashldi3.S
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/**
+ * Adopted for the Linux kernel from IPXE project, see
+ * https://github.com/ipxe/ipxe/blob/master/src/arch/riscv32/libgcc/llshift.S
+ */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+
+/**
+ * Shift left
+ *
+ * @v a1:a0             Value to shift
+ * @v a2                Shift amount
+ * @ret a1:a0           Shifted value
+ */
+
+SYM_FUNC_START(__ashldi3)
+
+        /* Perform shift by 32 bits, if applicable */
+        li      t0, 32
+        sub     t1, t0, a2
+        bgtz    t1, 1f
+        mv      a1, a0
+        mv      a0, zero
+1:      /* Perform shift by modulo-32 bits, if applicable */
+        andi    a2, a2, 0x1f
+        beqz    a2, 2f
+        srl     t2, a0, t1
+        sll     a0, a0, a2
+        sll     a1, a1, a2
+        or      a1, a1, t2
+2:      ret
+
+SYM_FUNC_END(__ashldi3)
+EXPORT_SYMBOL(__ashldi3)
diff --git a/arch/riscv/lib/ashrdi3.S b/arch/riscv/lib/ashrdi3.S
new file mode 100644
index 0000000000000..dd42b3cbb173a
--- /dev/null
+++ b/arch/riscv/lib/ashrdi3.S
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/**
+ * Adopted for the Linux kernel from IPXE project, see
+ * https://github.com/ipxe/ipxe/blob/master/src/arch/riscv32/libgcc/llshift.S
+ */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+
+/**
+ * Arithmetic shift right
+ *
+ * @v a1:a0             Value to shift
+ * @v a2                Shift amount
+ * @ret a1:a0           Shifted value
+ */
+
+SYM_FUNC_START(__ashrdi3)
+
+        /* Perform shift by 32 bits, if applicable */
+        li      t0, 32
+        sub     t1, t0, a2
+        bgtz    t1, 1f
+        mv      a0, a1
+        srai    a1, a1, 16
+        srai    a1, a1, 16
+1:      /* Perform shift by modulo-32 bits, if applicable */
+        andi    a2, a2, 0x1f
+        beqz    a2, 2f
+        sll     t2, a1, t1
+        sra     a1, a1, a2
+        srl     a0, a0, a2
+        or      a0, a0, t2
+2:      ret
+
+SYM_FUNC_END(__ashrdi3)
+EXPORT_SYMBOL(__ashrdi3)
diff --git a/arch/riscv/lib/lshrdi3.S b/arch/riscv/lib/lshrdi3.S
new file mode 100644
index 0000000000000..1af03985ccb72
--- /dev/null
+++ b/arch/riscv/lib/lshrdi3.S
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/**
+ * Adopted for the Linux kernel from IPXE project, see
+ * https://github.com/ipxe/ipxe/blob/master/src/arch/riscv32/libgcc/llshift.S
+ */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+
+/**
+ * Logical shift right
+ *
+ * @v a1:a0             Value to shift
+ * @v a2                Shift amount
+ * @ret a1:a0           Shifted value
+ */
+
+SYM_FUNC_START(__lshrdi3)
+
+        /* Perform shift by 32 bits, if applicable */
+        li      t0, 32
+        sub     t1, t0, a2
+        bgtz    t1, 1f
+        mv      a0, a1
+        mv      a1, zero
+1:      /* Perform shift by modulo-32 bits, if applicable */
+        andi    a2, a2, 0x1f
+        beqz    a2, 2f
+        sll     t2, a1, t1
+        srl     a1, a1, a2
+        srl     a0, a0, a2
+        or      a0, a0, t2
+2:      ret
+
+SYM_FUNC_END(__lshrdi3)
+EXPORT_SYMBOL(__lshrdi3)
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
