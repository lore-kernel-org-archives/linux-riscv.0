Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62F5C43217
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 16:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LxWEBCfDuSro5SVW+/vJFQJY0NdV7YQzZYXBOb0Ljco=; b=1yGPjinh7Kzg7I
	z/eQW40QpzTlttlDh47v+orrOPdifNNRgnocbPyLMs2eHlIjoy/gcg2z8cts19HU75ib52oSCbzBa
	eWIwuSvBHc/AlHZAjWU6tIuZtyn3XjkKCyaj0+S1KgHBv85vt3xkiNXUzu1IC8p5UnsVPleBkf4h2
	eLutv3OTNXOfwuB4yMFjHlF6XgHsaQ//GFKXqrU3HaF4/DeHJ9uX32SjM8LaKo4U03IDGKBuCrm7U
	BVYS15VkC8cQVu+KIzFSqUkxBiqximV6Q5oIOQtNcmepTIj47iO3BtYqLNzprvPchx3FosOqMJTPW
	a9IYGz7AspZ9PQgEGRYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj1Bc-00CRF8-Kl; Thu, 13 Oct 2022 16:35:56 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj1BY-00CRCy-FL
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 16:35:54 +0000
Received: by mail-pl1-x634.google.com with SMTP id c20so2296279plc.5
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 09:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXpU45zAvmtJgUkph++aomF73Zd57HyTo9c86hNxXPQ=;
        b=Eoj6/YOgMia1riy2ptiAgzzu7woEAkHpSaHbC5ixZqOqj2nWd5g9YGxzsKIG+8dZbi
         PAsOlod+P+5WlNHZ7xHEGZ0yQ1omUii7FgJizVfCrSZgo2vNqDF6nlNE12Tve8x1TSNt
         mtMrriWg/J6LnoPYHi3Kw0RZFAXT+F8pvkowwFHJ9bslDmmzbkKKLU1tQVbsJYmlRkCQ
         4iOp50vWEPGNKeYCusTV0qLXQRt5QRg6fy4KLDiENoC9TEoRd6EfQYITpAbOtYxXRASk
         nRj9inepRk4E95dostV50j0f9Ij/yBf6btEVrhh9xjaI4QT81CFR9UgdFMGEIPxXLLC6
         3KGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXpU45zAvmtJgUkph++aomF73Zd57HyTo9c86hNxXPQ=;
        b=G286o+tNCzDU+aclYfnuGEoFrGaspX5VEyv8YmhVuPXomqbQZxobm1yj5rREsegqed
         YSFJkt+zEWT8OMzhXyFn1Q/nUHBA9WT0XmJbS0PJ0SyipDhp9Z3j37XqtujT00ltMPn9
         MEko5t3iVleM642+j4/g3EOBjfAU5zw99uMuqtvyz5As0ZochH0tWrHpiW0x/OPtRMSX
         2ByAIZBVtKWhisxNYqhJmjJo9qitOQA1402waVsPCrice5pLYYfaLv4Y30JKZP7OxG6N
         oYqHZxrvrRXayOO/gU/XmKZA6idKbwd9+geN4IIuRw2x5PmWUWGDo65tAuxUxGuv+yLa
         uH2w==
X-Gm-Message-State: ACrzQf3TYHv054dVNMyIUTJRf7DhGEYBe4NdZ15KcdY/JLm+7OrJEmJL
	dB2deQmGDBHN+kENyj/cpYKsZhyRM9VqQw==
X-Google-Smtp-Source: AMsMyM4XXTEFfdPKFdeSpp4LVTwRFYOJbmcRjEh6HzFX6kdCB5RZjd+qI9xG6IEs20kC0MPPQPAxkw==
X-Received: by 2002:a17:90a:b118:b0:20d:65f4:fde9 with SMTP id z24-20020a17090ab11800b0020d65f4fde9mr11981682pjq.184.1665678949470;
        Thu, 13 Oct 2022 09:35:49 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n13-20020a170902d2cd00b00183c67844aesm105133plc.22.2022.10.13.09.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 09:35:49 -0700 (PDT)
Subject: [PATCH v1 1/5] RISC-V: Add a syscall for HW probing
Date: Thu, 13 Oct 2022 09:35:47 -0700
Message-Id: <20221013163551.6775-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221013163551.6775-1-palmer@rivosinc.com>
References: <20221013163551.6775-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_093552_540520_F160F048 
X-CRM114-Status: GOOD (  31.24  )
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

We don't have enough space for these all in ELF_HWCAP{,2} and there's no
system call that quite does this, so let's just provide an arch-specific
one to probe for hardware capabilities.  This currently just provides
m{arch,imp,vendor}id, but with the key-value pairs we can pass more in
the future.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I havn't run this yet.
---
 Documentation/riscv/hwprobe.rst       |  33 +++++++
 Documentation/riscv/index.rst         |   1 +
 arch/riscv/include/asm/cpufeature.h   |  21 +++++
 arch/riscv/include/asm/hwprobe.h      |  13 +++
 arch/riscv/include/asm/syscall.h      |   3 +
 arch/riscv/include/uapi/asm/hwprobe.h |  24 ++++++
 arch/riscv/include/uapi/asm/unistd.h  |   8 ++
 arch/riscv/kernel/cpu.c               |  45 +++++++++-
 arch/riscv/kernel/sys_riscv.c         | 118 +++++++++++++++++++++++++-
 9 files changed, 264 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/riscv/hwprobe.rst
 create mode 100644 arch/riscv/include/asm/cpufeature.h
 create mode 100644 arch/riscv/include/asm/hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/hwprobe.h

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
new file mode 100644
index 000000000000..be9ebe4af3dc
--- /dev/null
+++ b/Documentation/riscv/hwprobe.rst
@@ -0,0 +1,33 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+RISC-V Hardware Probing Interface
+---------------------------------
+
+The RISC-V hardware probing interface is based around a single syscall, which
+is defined in <asm/hwprobe.h>::
+
+    struct riscv_hwprobe {
+        __u64 key, value;
+    };
+
+    long sys_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
+                           size_t base_key, size_t cpu_count, cpu_set_t *cpus,
+                           unsigned long flags);
+
+The arguments are split into three groups: an array of key-value pairs, a CPU
+set, and some flags.  The key-value pairs are supplied with a count and an
+base, which is the first key that will be probed for.  The CPU set is defined
+by CPU_SET(3), the indicated features will be supported on all CPUs in the set.
+There are currently no flags, this value must be zero for future compatibility.
+
+On success the number of filled out pairs is returned, on failure a negative
+error code is returned.
+
+The following keys are defined:
+
+* :RISCV_HWPROBE_KEY_MVENDORID:: Contains the value of :mvendorid:, as per the
+  ISA specifications.
+* :RISCV_HWPROBE_KEY_MARCHID:: Contains the value of :marchid:, as per the ISA
+  specifications.
+* :RISCV_HWPROBE_KEY_MIMPLID:: Contains the value of :mimplid:, as per the ISA
+  specifications.
diff --git a/Documentation/riscv/index.rst b/Documentation/riscv/index.rst
index e23b876ad6eb..1c89bca55aec 100644
--- a/Documentation/riscv/index.rst
+++ b/Documentation/riscv/index.rst
@@ -7,6 +7,7 @@ RISC-V architecture
 
     boot-image-header
     vm-layout
+    hwprobe
     patch-acceptance
 
     features
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
new file mode 100644
index 000000000000..cbda062de9bd
--- /dev/null
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Rivos, Inc
+ */
+
+#ifndef _ASM_CPUFEATURE_H
+#define _ASM_CPUFEATURE_H
+
+/*
+ * These are probed via a device_initcall(), via either the SBI or directly
+ * from the cooresponding CSRs.
+ */
+struct riscv_cpuinfo {
+        unsigned long mvendorid;
+        unsigned long marchid;
+        unsigned long mimpid;
+};
+
+DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
+
+#endif
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
new file mode 100644
index 000000000000..08d1c3bdd78a
--- /dev/null
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright 2022 Rivos, Inc
+ */
+
+#ifndef _ASM_HWPROBE_H
+#define _ASM_HWPROBE_H
+
+#include <uapi/asm/hwprobe.h>
+
+#define RISCV_HWPROBE_MAX_KEY 2
+
+#endif
diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index 384a63b86420..78a6302ef711 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -75,4 +75,7 @@ static inline int syscall_get_arch(struct task_struct *task)
 }
 
 asmlinkage long sys_riscv_flush_icache(uintptr_t, uintptr_t, uintptr_t);
+
+asmlinkage long sys_riscv_hwprobe(uintptr_t, uintptr_t, uintptr_t, uintptr_t,
+				  uintptr_t, uintptr_t);
 #endif	/* _ASM_RISCV_SYSCALL_H */
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
new file mode 100644
index 000000000000..88ef9e153637
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright 2022 Rivos, Inc
+ */
+
+#ifndef _UAPI_ASM_HWPROBE_H
+#define _UAPI_ASM_HWPROBE_H
+
+#include <linux/types.h>
+
+/*
+ * Interface for probing hardware capabilities from userspace, see
+ * Documentation/riscv/hwprobe.rst for more information.
+ */
+struct riscv_hwprobe {
+    __u64 key, val;
+};
+
+#define RISCV_HWPROBE_KEY_MVENDORID	0
+#define RISCV_HWPROBE_KEY_MARCHID	1
+#define RISCV_HWPROBE_KEY_MIMPID	2
+/* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
+
+#endif
diff --git a/arch/riscv/include/uapi/asm/unistd.h b/arch/riscv/include/uapi/asm/unistd.h
index 73d7cdd2ec49..37d47302322a 100644
--- a/arch/riscv/include/uapi/asm/unistd.h
+++ b/arch/riscv/include/uapi/asm/unistd.h
@@ -43,3 +43,11 @@
 #define __NR_riscv_flush_icache (__NR_arch_specific_syscall + 15)
 #endif
 __SYSCALL(__NR_riscv_flush_icache, sys_riscv_flush_icache)
+
+/*
+ * Allows userspace to probe
+ */
+#ifndef __NR_riscv_hwprobe
+#define __NR_riscv_hwprobe (__NR_arch_specific_syscall + 14)
+#endif
+__SYSCALL(__NR_riscv_hwprobe, sys_riscv_hwprobe)
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 0be8a2403212..708ddcb6c0e7 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -3,12 +3,16 @@
  * Copyright (C) 2012 Regents of the University of California
  */
 
+#include <linux/cpuhotplug.h>
 #include <linux/init.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
+#include <asm/cpufeature.h>
+#include <asm/csr.h>
 #include <asm/hwcap.h>
-#include <asm/smp.h>
 #include <asm/pgtable.h>
+#include <asm/sbi.h>
+#include <asm/smp.h>
 
 /*
  * Returns the hart ID of the given device tree node, or -ENODEV if the node
@@ -67,7 +71,46 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 	return -1;
 }
 
+DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
+
+static int riscv_cpuinfo_starting(unsigned int cpu)
+{
+	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
+
+#if IS_ENABLED(CONFIG_RISCV_SBI)
+	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
+	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
+	ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
+#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
+	ci->mvendorid = csr_read(CSR_MVENDORID);
+	ci->marchid = csr_read(CSR_MARCHID);
+	ci->mimpid = csr_read(CSR_MIMPID);
+#else
+	ci->mvendorid = 0;
+	ci->marchid = 0;
+	ci->mimpid = 0;
+#endif
+
+	return 0;
+}
+
+static int __init riscv_cpuinfo_init(void)
+{
+	int ret;
+
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/cpuinfo:starting",
+				riscv_cpuinfo_starting, NULL);
+	if (ret < 0) {
+		pr_err("cpuinfo: failed to register hotplug callbacks.\n");
+		return ret;
+	}
+
+	return 0;
+}
+device_initcall(riscv_cpuinfo_init);
+
 #ifdef CONFIG_PROC_FS
+
 #define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
 	{							\
 		.uprop = #UPROP,				\
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 571556bb9261..2b6cb82c3491 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -6,8 +6,11 @@
  */
 
 #include <linux/syscalls.h>
-#include <asm/unistd.h>
 #include <asm/cacheflush.h>
+#include <asm/cpufeature.h>
+#include <asm/hwprobe.h>
+#include <asm/uaccess.h>
+#include <asm/unistd.h>
 #include <asm-generic/mman-common.h>
 
 static long riscv_sys_mmap(unsigned long addr, unsigned long len,
@@ -72,3 +75,116 @@ SYSCALL_DEFINE3(riscv_flush_icache, uintptr_t, start, uintptr_t, end,
 
 	return 0;
 }
+
+static long set_hwprobe(struct riscv_hwprobe __user *pair, u64 key, u64 val)
+{
+	long ret;
+
+	ret = put_user(key, &pair->key);
+	if (ret < 0)
+		return ret;
+	ret = put_user(val, &pair->val);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static long hwprobe_mid(struct riscv_hwprobe __user *pair, size_t key,
+			cpumask_t *cpus)
+{
+	long cpu, id;
+	bool first, valid;
+
+	first = true;
+	valid = false;
+	for_each_cpu(cpu, cpus) {
+		struct riscv_cpuinfo * ci = per_cpu_ptr(&riscv_cpuinfo, cpu);
+		long cpu_id;
+
+		switch (key) {
+		case RISCV_HWPROBE_KEY_MVENDORID:
+			cpu_id = ci->mvendorid;
+			break;
+		case RISCV_HWPROBE_KEY_MIMPID:
+			cpu_id = ci->mimpid;
+			break;
+		case RISCV_HWPROBE_KEY_MARCHID:
+			cpu_id = ci->marchid;
+			break;
+		}
+
+		if (first) {
+			id = cpu_id;
+			valid = true;
+		}
+
+		if (id != cpu_id)
+			valid = false;
+	}
+
+	/*
+	 * put_user() returns 0 on success, so use 1 to indicate it wasn't
+	 * called and we should skip having incremented the output.
+	 */
+	if (!valid)
+		return 1;
+
+	return set_hwprobe(pair, key, id);
+}
+
+static
+long do_riscv_hwprobe(struct riscv_hwprobe __user *pairs, long pair_count,
+		      long key_offset, long cpu_count,
+		      unsigned long __user *cpus_user, unsigned long flags)
+{
+	size_t out, k;
+	long ret;
+	struct cpumask cpus;
+
+	/* Check the reserved flags. */
+	if (flags != 0)
+		return -EINVAL;
+
+	/*
+	 * The only supported values must be the same on all CPUs, but check to
+	 * make sure userspace at least tried to provide something here for
+	 * future compatibility.
+	 */
+	cpumask_clear(&cpus);
+	if (cpu_count > cpumask_size())
+		cpu_count = cpumask_size();
+	ret = copy_from_user(&cpus, cpus_user, cpu_count);
+	if (!ret)
+		return -EFAULT;
+
+	out = 0;
+	k = key_offset;
+	while (out < pair_count && k < RISCV_HWPROBE_MAX_KEY) {
+		long ret;
+
+		switch (k) {
+		case RISCV_HWPROBE_KEY_MVENDORID:
+		case RISCV_HWPROBE_KEY_MARCHID:
+		case RISCV_HWPROBE_KEY_MIMPID:
+			ret = hwprobe_mid(pairs + out, k, &cpus);
+			break;
+		}
+
+		if (ret < 0)
+			return ret;
+		if (ret == 0)
+			out++;
+	}
+
+	return out;
+
+}
+
+SYSCALL_DEFINE6(riscv_hwprobe, uintptr_t, pairs, uintptr_t, pair_count,
+		uintptr_t, offset, uintptr_t, cpu_count, uintptr_t, cpus,
+		uintptr_t, flags)
+{
+	return do_riscv_hwprobe((void __user *)pairs, pair_count, offset,
+				cpu_count, (void __user *)cpus, flags);
+}
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
