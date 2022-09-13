Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DC5C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 08:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h4mpfNnoj6sc98+r+szXPqwFa/c4dwUXkrN/pQmCJCU=; b=der5NsytRPq47P
	wHsS78nNJoqAVaRnxrC9aJ0Yl1vOczMFcJ6FVIfgNuRKMZ7xlA21a/B/cpOrWIO1ozkFPVKQRd4p5
	87rjKMmpXxbvQs8A9i1j2m3WM3q7BzN2ZC8aLUOcwZWzpbV4ZQWxGd7/WbHqHLzPK0y7V0PsVs8SP
	Kwg/pVUC2y6BZz99rVFkJj3iNRBfv1sB8HEFV60LSY3+aD81eIMkrVc16xkZsbp4fZkRQphzUMjbJ
	oYNELf9AaaNhy0y0e50K2t7aDOk6UmvnYhfIYUkIopZ76Bc2trKFJ57DATfOoM2UNR5bQRsIz7IOz
	jeJ5QASKqD3ptvH29Vow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY0yl-0045oR-PG; Tue, 13 Sep 2022 08:09:11 +0000
Received: from conuserg-10.nifty.com ([210.131.2.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY0yQ-0045Pf-GS; Tue, 13 Sep 2022 08:08:52 +0000
Received: from zoe.. (133-32-182-133.west.xps.vectant.ne.jp [133.32.182.133]) (authenticated)
	by conuserg-10.nifty.com with ESMTP id 28D87jCf012679;
	Tue, 13 Sep 2022 17:07:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 28D87jCf012679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1663056466;
	bh=hRKy+xo91mWnaRkbQI9H0BNDjBw4xFC3PaudVH84uKI=;
	h=From:To:Cc:Subject:Date:From;
	b=yNo192wRuaSEhwqz7Jo8da84KuMEajeifSpBAT169iQ62zrvK+SonqP89FxangvIr
	 wbPKULN2CWPJMgvuSjz+t25TRjr9rUdf+govCwoYsVXB/SORJ6os0IGJV9L5xEH+/y
	 wC/cJQQlhLwBCtYuxhsLfzVzx2f27W+JyMYw8jj5DgvlZLQItTvrqpLtnazYJ480Bq
	 W/1gted+z6CmebVkUdaVNWYRgdG7e7L6P1fenC4I7RShjZSd3nViUnfX/VvmrjYuEu
	 ZOEW1EyIsCbjHZlkcmg0D3pAkHDbnk7GmtcqOF4gtvbVeJ9T2AgVaEfUAmdIudHFu+
	 ms6D1GOMMWHmw==
X-Nifty-SrcIP: [133.32.182.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Russell King <linux@armlinux.org.uk>,
        Sven Schnelle <svens@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org
Subject: [PATCH v2] kbuild: move -Wundef from KBUILD_CFLAGS to KBUILD_CPPFLAGS
Date: Tue, 13 Sep 2022 17:07:27 +0900
Message-Id: <20220913080727.608495-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_010851_141408_545A8A21 
X-CRM114-Status: GOOD (  11.91  )
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

The use of an undefined macro in an #if directive is warned, but only
in *.c files. No warning from other files such as *.S, *.lds.S.

Since -Wundef is a preprocessor-related warning, it should be added to
KBUILD_CPPFLAGS instead of KBUILD_CFLAGS.

Fix some uncovered issues.

[1] Add -D__LINUX_ARM_ARCH__=* to KBUILD_CPPFLAGS

In file included from arch/arm/kernel/vmlinux.lds.S:13:
./arch/arm/include/asm/cache.h:23:31: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
   23 | #if defined(CONFIG_AEABI) && (__LINUX_ARM_ARCH__ >= 5)
      |                               ^~~~~~~~~~~~~~~~~~

[2] Add missing #include <asm/pgtable.h>

In file included from arch/arm/mm/cache-v7.S:17:
arch/arm/mm/proc-macros.S:109:5: warning: "L_PTE_SHARED" is not defined, evaluates to 0 [-Wundef]
  109 | #if L_PTE_SHARED != PTE_EXT_SHARED
      |     ^~~~~~~~~~~~
arch/arm/mm/proc-macros.S:109:21: warning: "PTE_EXT_SHARED" is not defined, evaluates to 0 [-Wundef]
  109 | #if L_PTE_SHARED != PTE_EXT_SHARED
      |                     ^~~~~~~~~~~~~~
arch/arm/mm/proc-macros.S:113:10: warning: "L_PTE_XN" is not defined, evaluates to 0 [-Wundef]
  113 |         (L_PTE_XN+L_PTE_USER+L_PTE_RDONLY+L_PTE_DIRTY+L_PTE_YOUNG+\
      |          ^~~~~~~~
arch/arm/mm/proc-macros.S:113:19: warning: "L_PTE_USER" is not defined, evaluates to 0 [-Wundef]
  113 |         (L_PTE_XN+L_PTE_USER+L_PTE_RDONLY+L_PTE_DIRTY+L_PTE_YOUNG+\
      |                   ^~~~~~~~~~
arch/arm/mm/proc-macros.S:113:30: warning: "L_PTE_RDONLY" is not defined, evaluates to 0 [-Wundef]
  113 |         (L_PTE_XN+L_PTE_USER+L_PTE_RDONLY+L_PTE_DIRTY+L_PTE_YOUNG+\
      |                              ^~~~~~~~~~~~
arch/arm/mm/proc-macros.S:113:43: warning: "L_PTE_DIRTY" is not defined, evaluates to 0 [-Wundef]
  113 |         (L_PTE_XN+L_PTE_USER+L_PTE_RDONLY+L_PTE_DIRTY+L_PTE_YOUNG+\
      |                                           ^~~~~~~~~~~
arch/arm/mm/proc-macros.S:113:55: warning: "L_PTE_YOUNG" is not defined, evaluates to 0 [-Wundef]
  113 |         (L_PTE_XN+L_PTE_USER+L_PTE_RDONLY+L_PTE_DIRTY+L_PTE_YOUNG+\
      |                                                       ^~~~~~~~~~~
arch/arm/mm/proc-macros.S:114:10: warning: "L_PTE_PRESENT" is not defined, evaluates to 0 [-Wundef]
  114 |          L_PTE_PRESENT) > L_PTE_SHARED
      |          ^~~~~~~~~~~~~
arch/arm/mm/proc-macros.S:114:27: warning: "L_PTE_SHARED" is not defined, evaluates to 0 [-Wundef]
  114 |          L_PTE_PRESENT) > L_PTE_SHARED
      |                           ^~~~~~~~~~~~

[3] #if -> #ifdef

arch/riscv/kernel/head.S:329:5: warning: "CONFIG_RISCV_BOOT_SPINWAIT" is not defined, evaluates to 0 [-Wundef]
  329 | #if CONFIG_RISCV_BOOT_SPINWAIT
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~

[4] #elif -> #elif defined()

arch/s390/boot/decompressor.c:28:7: warning: "CONFIG_KERNEL_ZSTD" is not defined, evaluates to 0 [-Wundef]
   28 | #elif CONFIG_KERNEL_ZSTD
      |       ^~~~~~~~~~~~~~~~~~

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Fix warnings

 Makefile                      | 4 ++--
 arch/arm/Makefile             | 1 +
 arch/arm/mm/proc-macros.S     | 1 +
 arch/riscv/kernel/head.S      | 2 +-
 arch/s390/boot/decompressor.c | 2 +-
 5 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 4beeb96f9d81..bf4328535cf9 100644
--- a/Makefile
+++ b/Makefile
@@ -523,12 +523,12 @@ LINUXINCLUDE    := \
 		$(USERINCLUDE)
 
 KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
-KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
+KBUILD_CFLAGS   := -Wall -Werror=strict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
 		   -Werror=implicit-function-declaration -Werror=implicit-int \
 		   -Werror=return-type -Wno-format-security \
 		   -std=gnu11
-KBUILD_CPPFLAGS := -D__KERNEL__
+KBUILD_CPPFLAGS := -D__KERNEL__ -Wundef
 KBUILD_AFLAGS_KERNEL :=
 KBUILD_CFLAGS_KERNEL :=
 KBUILD_AFLAGS_MODULE  := -DMODULE
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 29d15c9a433e..4bb5743fe3a4 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -129,6 +129,7 @@ AFLAGS_ISA	:=$(CFLAGS_ISA)
 endif
 
 # Need -Uarm for gcc < 3.x
+KBUILD_CPPFLAGS	+= $(filter -D%, $(arch-y))
 KBUILD_CFLAGS	+=$(CFLAGS_ABI) $(CFLAGS_ISA) $(arch-y) $(tune-y) $(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,)) -msoft-float -Uarm
 KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) $(arch-y) $(tune-y) -include asm/unified.h -msoft-float
 
diff --git a/arch/arm/mm/proc-macros.S b/arch/arm/mm/proc-macros.S
index fa6999e24b07..e43f6d716b4b 100644
--- a/arch/arm/mm/proc-macros.S
+++ b/arch/arm/mm/proc-macros.S
@@ -6,6 +6,7 @@
  *  VM_EXEC
  */
 #include <asm/asm-offsets.h>
+#include <asm/pgtable.h>
 #include <asm/thread_info.h>
 
 #ifdef CONFIG_CPU_V7M
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index b865046e4dbb..4bf6c449d78b 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -326,7 +326,7 @@ clear_bss_done:
 	call soc_early_init
 	tail start_kernel
 
-#if CONFIG_RISCV_BOOT_SPINWAIT
+#ifdef CONFIG_RISCV_BOOT_SPINWAIT
 .Lsecondary_start:
 	/* Set trap vector to spin forever to help debug */
 	la a3, .Lsecondary_park
diff --git a/arch/s390/boot/decompressor.c b/arch/s390/boot/decompressor.c
index e27c2140d620..f96657faffdc 100644
--- a/arch/s390/boot/decompressor.c
+++ b/arch/s390/boot/decompressor.c
@@ -25,7 +25,7 @@
 
 #ifdef CONFIG_KERNEL_BZIP2
 #define BOOT_HEAP_SIZE	0x400000
-#elif CONFIG_KERNEL_ZSTD
+#elif defined(CONFIG_KERNEL_ZSTD)
 #define BOOT_HEAP_SIZE	0x30000
 #else
 #define BOOT_HEAP_SIZE	0x10000
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
