Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E723CE79AD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 07:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTUo3Auw/vBmQEBuDS3hHmV7g+n8T+h2eojtA5+vDy0=; b=edw4iunZ/9hA9j
	P9AqhVnIgUAHb8spOgGeMaMpp+JSBZcPga7yS7Coms7XhZw/YrLqsIY4dsbvnM0WyHPx9xPdcLrfU
	71HTptEaU78lhCDwC0V1WKO0qT6r8OlHxvr0E791f/CHFE5C1ZN+UZrpFFMFgI4K/UNFh/hV0s4Ts
	ZUKAq7+0LKIaaETgMFEVp8+WcFAw+c38YpY/DzRQZreA3j451v+O+uzkU8R3Lgbkkw+YHgtnFi3hr
	z6FlX96EaJbtGwnzZhi8o14/3ipHz0yABZQ8C26TGnYfVWSezI0ZvNnRIlEZjSqzbGT+BPIWRFPKT
	ISvgQwF+YAqZrIMeXpkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiroN-0029m1-2Z;
	Wed, 20 Sep 2023 07:39:51 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiroK-0029k7-32
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 07:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695195588; x=1726731588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WLrigc7M2aJBmw6Tk0aSBjJF93oGzGXZq+VW9pT9fwo=;
  b=dtc69bDUWXqG10FWQlvGhDSKFiv50sb3Dyd6pq5oCZi6uLYYLw2JWSGc
   G+WU5Rj+aLv3oIhzmVxvdP6g92NFdDMDgFPkjppLDb8lStGEbUU23dx+D
   HMXABKO9+Lk+fqzGIIUDkNiAsupNeqU82QUZQ2KVY9/uL0ioq3uJ/Ygap
   XPLMnMjWROizFcJya/+rSjItFS3+dyefqiM6dg3j1fk5WYw/62c7AIu7p
   8nUW0BMDcjhxojkvxxGSY/Vh4cDIWG5JTqlUWV/VkOZbUADhdpfJU5iRl
   ef4Lzo17gNfGHMEFXIiPqM/Hyn3y9VMSdPnQBamD9fQlOqn84QlsBbsP6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="446622623"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="446622623"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 00:39:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="816791831"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="816791831"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by fmsmga004.fm.intel.com with ESMTP; 20 Sep 2023 00:39:45 -0700
From: Xiao Wang <xiao.w.wang@intel.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org
Cc: anup@brainfault.org,
	haicheng.li@intel.com,
	ajones@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH v2 1/2] riscv: Rearrange hwcap.h and cpufeature.h
Date: Wed, 20 Sep 2023 15:46:52 +0800
Message-Id: <20230920074653.2509631-2-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230920074653.2509631-1-xiao.w.wang@intel.com>
References: <20230920074653.2509631-1-xiao.w.wang@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_003949_021628_FBC762D4 
X-CRM114-Status: GOOD (  17.81  )
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

Now hwcap.h and cpufeature.h are mutually including each other, and most of
the variable/API declarations in hwcap.h are implemented in cpufeature.c,
so, it's better to move them into cpufeature.h and leave only macros for
ISA extension logical IDs in hwcap.h.

BTW, the riscv_isa_extension_mask macro is not used now, so this patch
removes it.

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
 arch/riscv/include/asm/cpufeature.h | 83 ++++++++++++++++++++++++++
 arch/riscv/include/asm/hwcap.h      | 91 -----------------------------
 arch/riscv/include/asm/pgtable.h    |  1 +
 arch/riscv/include/asm/switch_to.h  |  2 +-
 arch/riscv/include/asm/vector.h     |  2 +-
 5 files changed, 86 insertions(+), 93 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 13b7d35648a9..3061d33abc2f 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -7,7 +7,10 @@
 #define _ASM_CPUFEATURE_H
 
 #include <linux/bitmap.h>
+#include <linux/jump_label.h>
 #include <asm/hwcap.h>
+#include <asm/alternative-macros.h>
+#include <asm/errno.h>
 
 /*
  * These are probed via a device_initcall(), via either the SBI or directly
@@ -33,4 +36,84 @@ extern struct riscv_isainfo hart_isa[NR_CPUS];
 void check_unaligned_access(int cpu);
 void riscv_user_isa_enable(void);
 
+unsigned long riscv_get_elf_hwcap(void);
+
+struct riscv_isa_ext_data {
+	const unsigned int id;
+	const char *name;
+	const char *property;
+};
+
+extern const struct riscv_isa_ext_data riscv_isa_ext[];
+extern const size_t riscv_isa_ext_count;
+extern bool riscv_isa_fallback;
+
+unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
+
+bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit);
+#define riscv_isa_extension_available(isa_bitmap, ext)	\
+	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
+
+static __always_inline bool
+riscv_has_extension_likely(const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
+			   "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+		asm_volatile_goto(
+		ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
+		:
+		: [ext] "i" (ext)
+		:
+		: l_no);
+	} else {
+		if (!__riscv_isa_extension_available(NULL, ext))
+			goto l_no;
+	}
+
+	return true;
+l_no:
+	return false;
+}
+
+static __always_inline bool
+riscv_has_extension_unlikely(const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
+			   "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+		asm_volatile_goto(
+		ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
+		:
+		: [ext] "i" (ext)
+		:
+		: l_yes);
+	} else {
+		if (__riscv_isa_extension_available(NULL, ext))
+			goto l_yes;
+	}
+
+	return false;
+l_yes:
+	return true;
+}
+
+static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_likely(ext))
+		return true;
+
+	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
+}
+
+static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsigned long ext)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_unlikely(ext))
+		return true;
+
+	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
+}
+
 #endif
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 31774bcdf1c6..141b7109c25c 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -8,9 +8,6 @@
 #ifndef _ASM_RISCV_HWCAP_H
 #define _ASM_RISCV_HWCAP_H
 
-#include <asm/alternative-macros.h>
-#include <asm/errno.h>
-#include <linux/bits.h>
 #include <uapi/asm/hwcap.h>
 
 #define RISCV_ISA_EXT_a		('a' - 'a')
@@ -67,92 +64,4 @@
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
 #endif
 
-#ifndef __ASSEMBLY__
-
-#include <linux/jump_label.h>
-#include <asm/cpufeature.h>
-
-unsigned long riscv_get_elf_hwcap(void);
-
-struct riscv_isa_ext_data {
-	const unsigned int id;
-	const char *name;
-	const char *property;
-};
-
-extern const struct riscv_isa_ext_data riscv_isa_ext[];
-extern const size_t riscv_isa_ext_count;
-extern bool riscv_isa_fallback;
-
-unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
-
-#define riscv_isa_extension_mask(ext) BIT_MASK(RISCV_ISA_EXT_##ext)
-
-bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit);
-#define riscv_isa_extension_available(isa_bitmap, ext)	\
-	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
-
-static __always_inline bool
-riscv_has_extension_likely(const unsigned long ext)
-{
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
-			   "ext must be < RISCV_ISA_EXT_MAX");
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
-		asm_volatile_goto(
-		ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
-		:
-		: [ext] "i" (ext)
-		:
-		: l_no);
-	} else {
-		if (!__riscv_isa_extension_available(NULL, ext))
-			goto l_no;
-	}
-
-	return true;
-l_no:
-	return false;
-}
-
-static __always_inline bool
-riscv_has_extension_unlikely(const unsigned long ext)
-{
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
-			   "ext must be < RISCV_ISA_EXT_MAX");
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
-		asm_volatile_goto(
-		ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
-		:
-		: [ext] "i" (ext)
-		:
-		: l_yes);
-	} else {
-		if (__riscv_isa_extension_available(NULL, ext))
-			goto l_yes;
-	}
-
-	return false;
-l_yes:
-	return true;
-}
-
-static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
-{
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_likely(ext))
-		return true;
-
-	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
-}
-
-static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsigned long ext)
-{
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_unlikely(ext))
-		return true;
-
-	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
-}
-#endif
-
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index b2ba3f79cfe9..e05b5dc1f0cb 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -291,6 +291,7 @@ static inline pte_t pud_pte(pud_t pud)
 }
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
+#include <asm/cpufeature.h>
 
 static __always_inline bool has_svnapot(void)
 {
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index a727be723c56..f90d8e42f3c7 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -9,7 +9,7 @@
 #include <linux/jump_label.h>
 #include <linux/sched/task_stack.h>
 #include <asm/vector.h>
-#include <asm/hwcap.h>
+#include <asm/cpufeature.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/csr.h>
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index c5ee07b3df07..87aaef656257 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -15,7 +15,7 @@
 #include <linux/sched.h>
 #include <linux/sched/task_stack.h>
 #include <asm/ptrace.h>
-#include <asm/hwcap.h>
+#include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/asm.h>
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
