Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C500EC77B71
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 23:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NnvGMB7PCF277Bp1QNsEvZ8KmzMIBWyGFV695lwmyS4=; b=E1DRFdi5K5xqOv
	uRQ45GbbLxjbJQ/VlNtwl22zJ+lF6o5SFW8RFIk+09+ElZyOogoCRxpg5vGzGgUWb5lUySjBPXVYw
	ZY1ZIIKLwS3j4PJbbmUNHFyEh0pVSsNQ6TZp7DY7jODLCTgXy6uNFHBKa4OclyLvWvzT4i5Bh4rnP
	rD+uzwC7Hd8l1e7+H2XTCLeTiNZCC+dihj7mHsUCJb29eutsFoEeQhP9Q+5DBDiyP/vGjikFXt1Km
	sCS+thYQph+f2DU4Gp2lt+83UeARfxCca67YR1CMzgh8GIcrcHv2H3E742FYR1o7JNyVFU8d1pm8T
	WjGKDiE216hCy+EFUt8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkvF5-00BK7O-1g;
	Fri, 07 Apr 2023 23:11:39 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkvF0-00BJJg-0k
	for linux-riscv@lists.infradead.org;
	Fri, 07 Apr 2023 23:11:38 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 60-20020a17090a09c200b0023fcc8ce113so2477480pjo.4
        for <linux-riscv@lists.infradead.org>; Fri, 07 Apr 2023 16:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680909094; x=1683501094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6vUAm1E1y+jVZ1soNKBk1kahZ8Eqn9XHOxYiKuB5LU=;
        b=afUTUtVkvHEXpo2Gt8fd0ZAa1j18IlBmWdEP4cB9kOw4xp60FoN6VS5HWxHwxMcbeT
         Y1u7ZYD7Djqp5MsbY62gr0ZL1cjLeAdDzDuL7Ho3cwW9rXUCMsmyozxlqvrv+bNr9CUu
         4WF/af8nVrHjoHGSG1pbn0D04qt5kM4fz8w51exBazm4v7yqquYtfHBpPWAxWG9R1LXL
         50a6oeVFaH+aJ+zaXMxPbM35lT7m7icigAGQD6jgcESVq3VsHAzjWuOyfKasViQfISuY
         uRYyalemhHOspn5bteme7vtjoMZfeBimjwQ+COp5+XOPiKhPposz/MGVqx6vGP3nwpv5
         DnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680909094; x=1683501094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6vUAm1E1y+jVZ1soNKBk1kahZ8Eqn9XHOxYiKuB5LU=;
        b=gtKDxp4FucLJbAPLqdMMz/1oAaQkDi7TanASbXe7f+yKTMuBxuduIcWj+0uiRJMa04
         bTnhxkTl32YJHI4wuB5F3ozOICpTxcDSv80Awe97voSWo5k+aFpwgnPExyh7jVYxtj+U
         yrvrdI6qtlFSd1GBC3ghaQs2K8hSbODhZ1sUwT6U00wSURno+M5Kob3/o5cZrK8adDYH
         yEhqgTxcVBZ01emM3M4Qih/fJhJYPRBcYIMUf+UoDw43gVX8qtcHXg0Ok3q/jTtyVPPA
         FhAoBDSq3tBirzg6IdWIugCozM7V+BzGDVrl4f3aMJXqAczTJDKVDa2lpF3EAlaQ+C05
         oszw==
X-Gm-Message-State: AAQBX9eNUArzFnJNUwlUTpm9J7P49VVTzd960/6GLjmiOZJVXKQ0sSGH
	qMzD4PSub8tHe2zhDhafbWWiCg==
X-Google-Smtp-Source: AKy350Z/8doag0ydMZ8VpmG2MMPFyhCeauBXsmCOG/HDfhESVWY7bah17vvsyE5jU/WFKwkkQqZpLg==
X-Received: by 2002:a17:902:d48c:b0:1a5:2757:d40a with SMTP id c12-20020a170902d48c00b001a52757d40amr170016plg.49.1680909093842;
        Fri, 07 Apr 2023 16:11:33 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id r5-20020a170902be0500b001a076568da9sm3361526pls.216.2023.04.07.16.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 16:11:33 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: slewis@rivosinc.com,
	heiko@sntech.de,
	Conor Dooley <conor@kernel.org>,
	vineetg@rivosinc.com,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Celeste Liu <coelacanthus@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Jann Horn <jannh@google.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v6 6/6] RISC-V: Add hwprobe vDSO function and data
Date: Fri,  7 Apr 2023 16:11:03 -0700
Message-Id: <20230407231103.2622178-7-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230407231103.2622178-1-evan@rivosinc.com>
References: <20230407231103.2622178-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_161134_289460_2D400B1D 
X-CRM114-Status: GOOD (  31.85  )
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

Add a vDSO function __vdso_riscv_hwprobe, which can sit in front of the
riscv_hwprobe syscall and answer common queries. We stash a copy of
static answers for the "all CPUs" case in the vDSO data page. This data
is private to the vDSO, so we can decide later to change what's stored
there or under what conditions we defer to the syscall. Currently all
data can be discovered at boot, so the vDSO function answers all queries
when the cpumask is set to the "all CPUs" hint.

There's also a boolean in the data that lets the vDSO function know that
all CPUs are the same. In that case, the vDSO will also answer queries
for arbitrary CPU masks in addition to the "all CPUs" hint.

Signed-off-by: Evan Green <evan@rivosinc.com>
---

Changes in v6:
 - Wrap init_hwprobe_vdso_data() in CONFIG_MMU to fix nommu build break
   (Conorbot)
 - Update copyrights (Paul)

Changes in v5:
 - Fixed compat vdso compilation failure (lkp).

Changes in v4:
 - Added a prototype to fix -Wmissing-prototype warning (lkp@intel.com)
 - Fixed rv32 build failure (lkp@intel.com)
 - Make vdso prototype match syscall types update

Changes in v3:
 - Introduced vDSO function


One aspect of this that's less than perfect is that there are two copies
of the arch_vdso_data in the data page. This stems from the fact that
vdso_data is arrayed by CS_BASES. Since we're very far away from filling
up the page, and this is not ABI, I left it for now. If things get full
we can move this data out to its own page, or refactor vdso_data
tree-wide to allow for non-arrayed data.

---
 arch/riscv/Kconfig                         |  1 +
 arch/riscv/include/asm/vdso/data.h         | 17 +++++++
 arch/riscv/include/asm/vdso/gettimeofday.h |  8 ++++
 arch/riscv/kernel/compat_vdso/Makefile     |  2 +-
 arch/riscv/kernel/sys_riscv.c              | 45 +++++++++++++++++++
 arch/riscv/kernel/vdso.c                   |  6 ---
 arch/riscv/kernel/vdso/Makefile            |  4 ++
 arch/riscv/kernel/vdso/hwprobe.c           | 52 ++++++++++++++++++++++
 arch/riscv/kernel/vdso/sys_hwprobe.S       | 15 +++++++
 arch/riscv/kernel/vdso/vdso.lds.S          |  3 ++
 10 files changed, 146 insertions(+), 7 deletions(-)
 create mode 100644 arch/riscv/include/asm/vdso/data.h
 create mode 100644 arch/riscv/kernel/vdso/hwprobe.c
 create mode 100644 arch/riscv/kernel/vdso/sys_hwprobe.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c5e42cc37604..a20e105efa4e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -33,6 +33,7 @@ config RISCV
 	select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_VDSO_DATA
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_STACKWALK
diff --git a/arch/riscv/include/asm/vdso/data.h b/arch/riscv/include/asm/vdso/data.h
new file mode 100644
index 000000000000..dc2f76f58b76
--- /dev/null
+++ b/arch/riscv/include/asm/vdso/data.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __RISCV_ASM_VDSO_DATA_H
+#define __RISCV_ASM_VDSO_DATA_H
+
+#include <linux/types.h>
+#include <vdso/datapage.h>
+#include <asm/hwprobe.h>
+
+struct arch_vdso_data {
+	/* Stash static answers to the hwprobe queries when all CPUs are selected. */
+	__u64 all_cpu_hwprobe_values[RISCV_HWPROBE_MAX_KEY + 1];
+
+	/* Boolean indicating all CPUs have the same static hwprobe values. */
+	__u8 homogeneous_cpus;
+};
+
+#endif /* __RISCV_ASM_VDSO_DATA_H */
diff --git a/arch/riscv/include/asm/vdso/gettimeofday.h b/arch/riscv/include/asm/vdso/gettimeofday.h
index 77d9c2f721c4..ba3283cf7acc 100644
--- a/arch/riscv/include/asm/vdso/gettimeofday.h
+++ b/arch/riscv/include/asm/vdso/gettimeofday.h
@@ -9,6 +9,12 @@
 #include <asm/csr.h>
 #include <uapi/linux/time.h>
 
+/*
+ * 32-bit land is lacking generic time vsyscalls as well as the legacy 32-bit
+ * time syscalls like gettimeofday. Skip these definitions since on 32-bit.
+ */
+#ifdef CONFIG_GENERIC_TIME_VSYSCALL
+
 #define VDSO_HAS_CLOCK_GETRES	1
 
 static __always_inline
@@ -60,6 +66,8 @@ int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
 	return ret;
 }
 
+#endif /* CONFIG_GENERIC_TIME_VSYSCALL */
+
 static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 						 const struct vdso_data *vd)
 {
diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
index 260daf3236d3..91a3431ae1fe 100644
--- a/arch/riscv/kernel/compat_vdso/Makefile
+++ b/arch/riscv/kernel/compat_vdso/Makefile
@@ -22,7 +22,7 @@ targets := $(obj-compat_vdso) compat_vdso.so compat_vdso.so.dbg compat_vdso.lds
 obj-compat_vdso := $(addprefix $(obj)/, $(obj-compat_vdso))
 
 obj-y += compat_vdso.o
-CPPFLAGS_compat_vdso.lds += -P -C -U$(ARCH)
+CPPFLAGS_compat_vdso.lds += -P -C -DCOMPAT_VDSO -U$(ARCH)
 
 # Disable profiling and instrumentation for VDSO code
 GCOV_PROFILE := n
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 55389e7595f6..849b4170629d 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -14,6 +14,7 @@
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
 #include <asm-generic/mman-common.h>
+#include <vdso/vsyscall.h>
 
 static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 			   unsigned long prot, unsigned long flags,
@@ -243,6 +244,50 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
 	return 0;
 }
 
+#ifdef CONFIG_MMU
+
+static int __init init_hwprobe_vdso_data(void)
+{
+	struct vdso_data *vd = __arch_get_k_vdso_data();
+	struct arch_vdso_data *avd = &vd->arch_data;
+	u64 id_bitsmash = 0;
+	struct riscv_hwprobe pair;
+	int key;
+
+	/*
+	 * Initialize vDSO data with the answers for the "all CPUs" case, to
+	 * save a syscall in the common case.
+	 */
+	for (key = 0; key <= RISCV_HWPROBE_MAX_KEY; key++) {
+		pair.key = key;
+		hwprobe_one_pair(&pair, cpu_online_mask);
+
+		WARN_ON_ONCE(pair.key < 0);
+
+		avd->all_cpu_hwprobe_values[key] = pair.value;
+		/*
+		 * Smash together the vendor, arch, and impl IDs to see if
+		 * they're all 0 or any negative.
+		 */
+		if (key <= RISCV_HWPROBE_KEY_MIMPID)
+			id_bitsmash |= pair.value;
+	}
+
+	/*
+	 * If the arch, vendor, and implementation ID are all the same across
+	 * all harts, then assume all CPUs are the same, and allow the vDSO to
+	 * answer queries for arbitrary masks. However if all values are 0 (not
+	 * populated) or any value returns -1 (varies across CPUs), then the
+	 * vDSO should defer to the kernel for exotic cpu masks.
+	 */
+	avd->homogeneous_cpus = (id_bitsmash > 0);
+	return 0;
+}
+
+arch_initcall_sync(init_hwprobe_vdso_data);
+
+#endif /* CONFIG_MMU */
+
 SYSCALL_DEFINE5(riscv_hwprobe, struct riscv_hwprobe __user *, pairs,
 		size_t, pair_count, size_t, cpu_count, unsigned long __user *,
 		cpus, unsigned int, flags)
diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index cc2d1e8c8736..9a68e7eaae4d 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -14,13 +14,7 @@
 #include <asm/page.h>
 #include <asm/vdso.h>
 #include <linux/time_namespace.h>
-
-#ifdef CONFIG_GENERIC_TIME_VSYSCALL
 #include <vdso/datapage.h>
-#else
-struct vdso_data {
-};
-#endif
 
 enum vvar_pages {
 	VVAR_DATA_PAGE_OFFSET,
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 06e6b27f3bcc..022258426050 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -12,6 +12,8 @@ vdso-syms += vgettimeofday
 endif
 vdso-syms += getcpu
 vdso-syms += flush_icache
+vdso-syms += hwprobe
+vdso-syms += sys_hwprobe
 
 # Files to link into the vdso
 obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
@@ -23,6 +25,8 @@ ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday.o += -fPIC -include $(c-gettimeofday-y)
 endif
 
+CFLAGS_hwprobe.o += -fPIC
+
 # Build rules
 targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.lds
 obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
new file mode 100644
index 000000000000..d40bec6ac078
--- /dev/null
+++ b/arch/riscv/kernel/vdso/hwprobe.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2023 Rivos, Inc
+ */
+
+#include <linux/types.h>
+#include <vdso/datapage.h>
+#include <vdso/helpers.h>
+
+extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
+			 size_t cpu_count, unsigned long *cpus,
+			 unsigned int flags);
+
+/* Add a prototype to avoid -Wmissing-prototypes warning. */
+int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
+			 size_t cpu_count, unsigned long *cpus,
+			 unsigned int flags);
+
+int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
+			 size_t cpu_count, unsigned long *cpus,
+			 unsigned int flags)
+{
+	const struct vdso_data *vd = __arch_get_vdso_data();
+	const struct arch_vdso_data *avd = &vd->arch_data;
+	bool all_cpus = !cpu_count && !cpus;
+	struct riscv_hwprobe *p = pairs;
+	struct riscv_hwprobe *end = pairs + pair_count;
+
+	/*
+	 * Defer to the syscall for exotic requests. The vdso has answers
+	 * stashed away only for the "all cpus" case. If all CPUs are
+	 * homogeneous, then this function can handle requests for arbitrary
+	 * masks.
+	 */
+	if ((flags != 0) || (!all_cpus && !avd->homogeneous_cpus))
+		return riscv_hwprobe(pairs, pair_count, cpu_count, cpus, flags);
+
+	/* This is something we can handle, fill out the pairs. */
+	while (p < end) {
+		if (p->key <= RISCV_HWPROBE_MAX_KEY) {
+			p->value = avd->all_cpu_hwprobe_values[p->key];
+
+		} else {
+			p->key = -1;
+			p->value = 0;
+		}
+
+		p++;
+	}
+
+	return 0;
+}
diff --git a/arch/riscv/kernel/vdso/sys_hwprobe.S b/arch/riscv/kernel/vdso/sys_hwprobe.S
new file mode 100644
index 000000000000..4e704146c77a
--- /dev/null
+++ b/arch/riscv/kernel/vdso/sys_hwprobe.S
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2023 Rivos, Inc */
+
+#include <linux/linkage.h>
+#include <asm/unistd.h>
+
+.text
+ENTRY(riscv_hwprobe)
+	.cfi_startproc
+	li a7, __NR_riscv_hwprobe
+	ecall
+	ret
+
+	.cfi_endproc
+ENDPROC(riscv_hwprobe)
diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index 4a0606633290..82ce64900f3d 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -82,6 +82,9 @@ VERSION
 #endif
 		__vdso_getcpu;
 		__vdso_flush_icache;
+#ifndef COMPAT_VDSO
+		__vdso_riscv_hwprobe;
+#endif
 	local: *;
 	};
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
