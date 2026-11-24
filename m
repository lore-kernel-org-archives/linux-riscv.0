Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E17606A33C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 08:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FZp1pYQz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=STBqYclq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Vg5ll9VAurhVpYceSEBInSjPAn6DFrakNc+YJWtV3PM=; b=FZp1pYQzLxrpYRY7u/Czr5us0p
	bbDR1bt3Y9gcs9wr9tBIiV9T2619kFh3di18fdUgHZKZQx4mAW+bKXOM0dQadDIwWIS2a2tyF02YY
	wcFSP++8Guqi1htInDZmuRa48+9hZn8mokqxMx4yiAn9+w+u8YeCSAnenIjYJL2r29yjPry/E/WpM
	qMdtqTp3HZ5rZN54j6R+scwnoPubvsi52OKp2otosIrF1Sd346S43+ObGIP0Q3v4UhEMzry1OUkv0
	wZe4M0AEPaFH7zhOk6qYEkWB5E+YDnTwEuIiGylcZBWwGWd1f9596kHpMsHnNjrbEMsaAJ/DBJe6o
	iYui3nIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlzt-00000005vCb-0uOE;
	Tue, 24 Nov 2026 08:35:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlzs-00000005vC0-06mE
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 08:35:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C37C141B4A;
	Tue, 24 Nov 2026 08:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4AD31F000E1;
	Tue, 24 Nov 2026 08:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795509327;
	bh=E2Iui6nyflKBUHKAAV+wZGQlF41I5Mkux6PwXcFAOMA=;
	h=From:Date:Subject:To:Cc;
	b=STBqYclqVmb2ma1VTLpCp/QBi8UOHAwSo+IbiHO0QWB9vbdoMZcBCcBV8gZAAtRBs
	 ZDfUrhZc756TScR2XhaudxyzFT4KylxqjfVmyeJQmSQqBazWhsFM1T4azw2XBxupVW
	 Dm112gsOHLdhNP9KeQq+yfrK3NBWEjRN9CE9qocdt5Fjbs7MugOtsYrAET1TPi28IP
	 RqA2l24XjGuVzdyDCywIYwOpI+CpwDTwTyBgv0ruOwnivYCJwFnRfsK7Vfcy//zVLC
	 280zd7LjfPhPlXzyWRPeGGF9/AesQFEkqsNJcP5TAIE9ktWsKpcy4qRP8LfUuRILdA
	 vF28Pkt5bRiJg==
From: "GUO Ren (XuanTie)" <guoren@kernel.org>
Date: Tue, 24 Nov 2026 08:35:04 +0000
Subject: [PATCH v7] riscv: errata: Add ERRATA WRITE_ONCE fixup
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261124-write_once-v7-1-4158a930aa80@kernel.org>
X-B4-Tracking: v=1; b=H4sIADdMBWsC/03Myw6CMBCF4Vchs7akMwEaXfkexphahlIvrZmCm
 hDeXdCNyz8555sgswTOsCsmEH6GHFJcwmwKcL2NnlVolwbS1CBSpV4SBj6l6Fi1lrA1aKwzBMv
 hIdyF9xc7HH+dx/OF3bAK66KTdFdDL2z/Ua2RDFKJ29rUTaVQ+TEJx/2VJfKtTOJhnj/Hq+SAq
 wAAAA==
X-Change-ID: 20261124-write_once-da21d717ac72
To: Drew Fustini <fustini@kernel.org>, Han Gao <gaohan@iscas.ac.cn>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, sophgo@lists.linux.dev, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Leonardo Bras <leobras@redhat.com>, Yao Zi <me@ziyao.cc>, 
 Chen Wang <unicorn_wang@outlook.com>, 
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, 
 "GUO Ren (XuanTie)" <guoren@kernel.org>
X-Mailer: b4 0.16.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The early version of XuanTie C910 core has a store merge buffer
delay problem. The store merge buffer could improve the store queue
performance by merging multi-store requests, but when there are not
continued store requests, the prior single store request would be
waiting in the store queue for a long time. That would cause
significant problems for communication between multi-cores. This
problem was found on sg2042 platform with the qspinlock lock torture
test.

So appending a fence w.o could immediately flush the store merge
buffer and let other cores see the write result.

This will apply the WRITE_ONCE errata to handle the non-standard
behavior via appending a fence w.o instruction for WRITE_ONCE().

This problem is only observed on the sg2042 hardware platform: it
takes hours of locktorture stress testing to trigger the livelock
once, and an interrupt can break the livelock. No user space
application has been observed to hit this problem, so there is no
need to modify user space WRITE_ONCE(). The vDSO code runs in user
space context as well, so its WRITE_ONCE() does not need the errata
fence either.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <gaohan@iscas.ac.cn>
Tested-by: Yao Zi <me@ziyao.cc>
Cc: Chen Wang <unicorn_wang@outlook.com>
Cc: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>
Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
Changelog

v7:
 - Define BUILD_VDSO for the riscv vDSO build (as arm64, powerpc and
   others do) and use it to keep the WRITE_ONCE errata alternative out
   of the vDSO. The vdso getrandom code uses WRITE_ONCE(), so v6 added
   .alternative entries to the vDSO and booting with
   CONFIG_DEBUG_VIRTUAL=y hit VIRTUAL_BUG_ON() in vmalloc_to_page(),
   as reported by Drew Fustini:
   https://lore.kernel.org/linux-riscv/awPgjwuswbjeDftg@thelio/
   Fold in Han Gao's "riscv: vdso: Define BUILD_VDSO" patch:
   https://lore.kernel.org/linux-riscv/20261124-riscv-vdso-build-vdso-v1-1-c52b0b3592dc@iscas.ac.cn/
 - Clarify in the commit message why user space and the vDSO are not
   affected by the livelock.
 - Rebase on v7.4-rc4.

v6:
https://lore.kernel.org/linux-riscv/20261120012712.1957564-1-guoren@kernel.org/
 - Refine the title
 - Focus on SG2042 fixup
 - Rebase on v7.4-rc3

v5:
https://lore.kernel.org/linux-riscv/20260421143154.1590156-1-guoren@kernel.org/
 - Add Acked-by: Arnd Bergmann <arnd@arndb.de> for asm/generic
 - Add Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
 - Rebase on v7.0

v4:
https://lore.kernel.org/linux-riscv/20260412143116.1445893-1-guoren@kernel.org/
 - Add Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
   (https://lore.kernel.org/linux-riscv/1cfdf6c1-a384-43ad-9588-284335d073f7@ghiti.fr/)
 - Add Tested-by: Yao Zi <me@ziyao.cc>
 - Rebase on v7.0-rc7

v3:
https://lore.kernel.org/linux-riscv/20260125063941.443777-1-guoren@kernel.org/
 - Rebase on 6.19-rc6.
 - Remove errata_list_vendors patch which has been merged.
 - Add Tested-by tag.

v2:
https://lore.kernel.org/linux-riscv/20250713155321.2064856-1-guoren@kernel.org/
 - Add new header file for errata_list_vendors.
 - Rebase newest kernel version.

v1:
https://lore.kernel.org/all/20241214143039.4139398-1-guoren@kernel.org/
---
 arch/riscv/Kconfig.errata                    | 18 +++++++++++++++++
 arch/riscv/errata/thead/errata.c             | 20 +++++++++++++++++++
 arch/riscv/include/asm/errata_list_vendors.h |  3 ++-
 arch/riscv/include/asm/rwonce.h              | 30 ++++++++++++++++++++++++++++
 arch/riscv/kernel/vdso/Makefile              |  1 +
 include/asm-generic/rwonce.h                 |  2 ++
 6 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 4f77b3c6d7fd..3505ab2bf9e4 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -179,4 +179,22 @@ config ERRATA_THEAD_GHOSTWRITE
 
 	  If you don't know what to do here, say "Y".
 
+config ERRATA_THEAD_WRITE_ONCE
+	bool "Apply T-Head WRITE_ONCE errata"
+	depends on ERRATA_THEAD
+	default y
+	help
+	  The early version of XuanTie C9xx cores of sg2042 & th1520 have a
+	  store merge buffer delay problem. The store merge buffer could
+	  improve the store queue performance by merging multi-store
+	  requests, but when there are no continued store requests, the
+	  prior single store request would be waiting in the store queue
+	  for a long time. That would cause significant problems for
+	  communication between multi-cores. Appending a fence w.o could
+	  immediately flush the store merge buffer and let other cores
+	  see the write result.
+
+	  This will apply the WRITE_ONCE errata to handle the non-standard
+	  behavior via appending a fence w.o instruction for WRITE_ONCE().
+
 endmenu # "CPU errata selection"
diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 6f1c683f0ec0..64683882d50b 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -168,6 +168,23 @@ static bool errata_probe_ghostwrite(unsigned int stage,
 	return true;
 }
 
+static bool errata_probe_write_once(unsigned int stage,
+				    unsigned long arch_id, unsigned long impid)
+{
+	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_WRITE_ONCE))
+		return false;
+
+	/* target-c9xx cores report arch_id and impid as 0 */
+	if (arch_id != 0 || impid != 0)
+		return false;
+
+	if (stage == RISCV_ALTERNATIVES_BOOT ||
+	    stage == RISCV_ALTERNATIVES_MODULE)
+		return true;
+
+	return false;
+}
+
 static u32 thead_errata_probe(unsigned int stage,
 			      unsigned long archid, unsigned long impid)
 {
@@ -183,6 +200,9 @@ static u32 thead_errata_probe(unsigned int stage,
 
 	errata_probe_ghostwrite(stage, archid, impid);
 
+	if (errata_probe_write_once(stage, archid, impid))
+		cpu_req_errata |= BIT(ERRATA_THEAD_WRITE_ONCE);
+
 	return cpu_req_errata;
 }
 
diff --git a/arch/riscv/include/asm/errata_list_vendors.h b/arch/riscv/include/asm/errata_list_vendors.h
index 02b5ab0d23a8..678cd0d42b42 100644
--- a/arch/riscv/include/asm/errata_list_vendors.h
+++ b/arch/riscv/include/asm/errata_list_vendors.h
@@ -19,7 +19,8 @@
 #define	ERRATA_THEAD_MAE 0
 #define	ERRATA_THEAD_PMU 1
 #define	ERRATA_THEAD_GHOSTWRITE 2
-#define	ERRATA_THEAD_NUMBER 3
+#define	ERRATA_THEAD_WRITE_ONCE 3
+#define	ERRATA_THEAD_NUMBER 4
 #endif
 
 #ifdef CONFIG_ERRATA_MIPS
diff --git a/arch/riscv/include/asm/rwonce.h b/arch/riscv/include/asm/rwonce.h
new file mode 100644
index 000000000000..327a663f90d2
--- /dev/null
+++ b/arch/riscv/include/asm/rwonce.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ASM_RWONCE_H
+#define __ASM_RWONCE_H
+
+#include <linux/compiler_types.h>
+#include <asm/alternative-macros.h>
+#include <asm/vendorid_list.h>
+#include <asm/errata_list_vendors.h>
+
+#if defined(CONFIG_ERRATA_THEAD_WRITE_ONCE) && !defined(NO_ALTERNATIVE) \
+					    && !defined(BUILD_VDSO)
+
+#define __WRITE_ONCE(x, val)				\
+do {							\
+	*(__volatile__ typeof(x) *)&(x) = (val);	\
+	asm volatile(ALTERNATIVE(			\
+		"nop",					\
+		"fence w, o",				\
+		THEAD_VENDOR_ID,			\
+		ERRATA_THEAD_WRITE_ONCE,		\
+		CONFIG_ERRATA_THEAD_WRITE_ONCE)		\
+		: : : "memory");			\
+} while (0)
+
+#endif /* CONFIG_ERRATA_THEAD_WRITE_ONCE && !NO_ALTERNATIVE && !BUILD_VDSO */
+
+#include <asm-generic/rwonce.h>
+
+#endif	/* __ASM_RWONCE_H */
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index c023046a3fd7..b99645672634 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -35,6 +35,7 @@ endif
 
 ccflags-y := -fno-stack-protector
 ccflags-y += -DDISABLE_BRANCH_PROFILING
+ccflags-y += -DBUILD_VDSO
 ccflags-y += -fno-builtin
 ccflags-y += $(CONFIG_CC_OPT_INLINE_MEMSET)
 ccflags-y += $(KBUILD_BASE_ISA)$(CFI_MARCH)
diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
index 52b969c7cef9..4e2d941f15a1 100644
--- a/include/asm-generic/rwonce.h
+++ b/include/asm-generic/rwonce.h
@@ -50,10 +50,12 @@
 	__READ_ONCE(x);							\
 })
 
+#ifndef __WRITE_ONCE
 #define __WRITE_ONCE(x, val)						\
 do {									\
 	*(volatile typeof(x) *)&(x) = (val);				\
 } while (0)
+#endif
 
 #define WRITE_ONCE(x, val)						\
 do {									\

---
base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
change-id: 20261124-write_once-da21d717ac72

Best regards,
--  
GUO Ren (XuanTie) <guoren@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
