Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0408DCD5BAC
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 17:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lNVfh1BT3Bt7VI1DnjfT4tKEBC7Cq6kgfENrKBOESJ4=; b=IpQw/5hJ7TxBxZ
	zY/a/kP3+PyO2ssWTn+H2zrMqnmN19MJ8Fcaz7u1vEkgClNkQYKKFqRv3BpFCexouSxbgH+6CPtQB
	RgVxHUruCRGCApgpZRdv/U1E3ykq1ulWEROumnFNkoaa5eKn6ezdt7InNxYwcOJbbuNYlnH3pptna
	YGW7pbqq+hZPKor0easSWbyRMGz8yW3+8q2/bvu0aj5JBXi+BU5eFiWSFKeiFiIqFr30WKgndgd04
	uAl/R5cgIPqc23yeGa1V7/GfAQjZJfnYq8uxwQ17+cvCqkb2rMaRuNdfra6mSx+DrSgSCTxrOLhGx
	+I+Bvv4N8rLc60RJdkdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPOA8-00000002NAr-0zdK;
	Tue, 19 May 2026 17:23:24 +0000
Received: from forward102a.mail.yandex.net ([178.154.239.85])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPOA3-00000002N3q-1sSZ
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 17:23:21 +0000
Received: from mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:190d:0:640:bab5:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id 92750C005E;
	Tue, 19 May 2026 20:23:13 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (smtp) with ESMTPSA id 0NVul40SU0U0-Gci2XP8h;
	Tue, 19 May 2026 20:23:12 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1779211393; bh=RlBllG7xaFB9wd9pV2iJ33aeysyHThnJfl/5cV3wCu4=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=dApCFRiUhX27g6H/mF6Ny4fWKiH1sHsKJoznxAYCWzp9cXa9GBzXe0JZaOOtCEYpp
	 YYY4H10H4hnNNUiXZQv3rb3lHKrCW8ur1cAuF+8fsF4fS6nFMXE9Y3dyggz6k2T0MP
	 qDkS4UoQoxmpBx6gKNDtQ0ProDuW2eda/opDukLI=
Authentication-Results: mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v11 6/8] riscv: add platform-specific double word shifts for riscv32
Date: Tue, 19 May 2026 20:22:57 +0300
Message-ID: <20260519172259.908980-7-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519172259.908980-1-dmantipov@yandex.ru>
References: <20260519172259.908980-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_102319_661169_A64770F0 
X-CRM114-Status: GOOD (  19.86  )
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
Assisted-by: Gemini:gemini-3.1-pro-preview sashiko
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v11: add prototypes to arch/riscv/include/asm/asm-prototypes.h (Sashiko)
v10: bump version to match merged series
v7: export for stub and optimize '__ashrdi3()' (Sashiko)
v4, v5, v6: and upwards: bump version to match the series
v3: more tests by Charlie Jenkins
v2: adjust commit message
---
 arch/riscv/Kconfig                      |  3 ---
 arch/riscv/include/asm/asm-prototypes.h |  4 +++
 arch/riscv/kernel/image-vars.h          |  9 +++++++
 arch/riscv/lib/Makefile                 |  1 +
 arch/riscv/lib/ashldi3.S                | 36 +++++++++++++++++++++++++
 arch/riscv/lib/ashrdi3.S                | 36 +++++++++++++++++++++++++
 arch/riscv/lib/lshrdi3.S                | 36 +++++++++++++++++++++++++
 7 files changed, 122 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/lib/ashldi3.S
 create mode 100644 arch/riscv/lib/ashrdi3.S
 create mode 100644 arch/riscv/lib/lshrdi3.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c5754942cf85..0d10b299bad8 100644
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
diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index 5b90ba5314ee..a0ca9efff267 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -5,6 +5,10 @@
 #include <linux/ftrace.h>
 #include <asm-generic/asm-prototypes.h>
 
+long long __lshrdi3(long long a, int b);
+long long __ashrdi3(long long a, int b);
+long long __ashldi3(long long a, int b);
+
 long long __lshrti3(long long a, int b);
 long long __ashrti3(long long a, int b);
 long long __ashlti3(long long a, int b);
diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index 3bd9d06a8b8f..7b44b94f1283 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -32,6 +32,15 @@ __efistub___init_text_end	= __init_text_end;
 __efistub_sysfb_primary_display	= sysfb_primary_display;
 #endif
 
+/*
+ * These double-word integer shifts are used by the library code, and
+ * the first two of them are required to link EFI stub. Note __ashrdi3()
+ * is not actually used by the stub but this may change in the future.
+ */
+PROVIDE(__efistub___lshrdi3	= __lshrdi3);
+PROVIDE(__efistub___ashldi3	= __ashldi3);
+PROVIDE(__efistub___ashrdi3	= __ashrdi3);
+
 #endif
 
 #endif /* __RISCV_KERNEL_IMAGE_VARS_H */
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 6f767b2a349d..f668b98970bd 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -16,6 +16,7 @@ ifeq ($(CONFIG_MMU), y)
 lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
 endif
 lib-$(CONFIG_MMU)	+= uaccess.o
+lib-$(CONFIG_32BIT)	+= ashldi3.o ashrdi3.o lshrdi3.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
diff --git a/arch/riscv/lib/ashldi3.S b/arch/riscv/lib/ashldi3.S
new file mode 100644
index 000000000000..c3408862e2f6
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
index 000000000000..426de0946606
--- /dev/null
+++ b/arch/riscv/lib/ashrdi3.S
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
+        srai    a1, a1, 31
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
index 000000000000..1af03985ccb7
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
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
