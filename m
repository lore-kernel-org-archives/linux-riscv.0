Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EDFC636D7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 20:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlLoZro3MQziqmBHTqJGHNiwMGiTuZXY1/2PLvheJtE=; b=f7mXsU5zE0d52s
	LkK7hdu264n/h9PsX4EeX/la1q98ofKatwi4yp7lxp5Wtdy610aLGShfqOXrd+ADkApf330BV8fDf
	3ciyjydKSSVrvUr1dq1alGHuJhFRbokXDDOZTBh6EKEdgymoL4MOS5EfDWQOk5AV68fz2yHBHL/Dz
	NIh/lVGV5bNRDJaCZEbOduYUyvvkezh3Br4wqONHjwpsHRkGsRUF3TAc4kE/CMl+VGl5NI7U5IZ8x
	5C9y3L/nyA7/1hqEXZIq0yTxJrh/WqI/ubqJJqHRGCXGVdn7wSwOP4YOiQ0xySoi4PCebmg2lavTz
	AbyMoXoWFr3W273sGH1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUYpt-009d0T-H7; Tue, 21 Feb 2023 20:02:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUYpr-009czu-Sw
	for linux-riscv@bombadil.infradead.org; Tue, 21 Feb 2023 20:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1d1h6gvf1z05DXGK1jMMZmsuuxnjdONUzCq/fBHE8HU=; b=K2/1TPBCdIZdCIrIiW2uThhvHB
	jrdML/u006MLP7BrnKdXEp2MMOp7OeuGtA0vMgix/E+3ebIRmtrMoIf+XLkZnxdSs2UKQYa5xYHkH
	Yn5u0Y1InD6D0xgJTY0GB66iCiUSPh0IpQ3N0JH8Mf85XXk7uLv8FcAkdFHdcKXWDi6tnJTkhI5sA
	2XS2N9QxghYp9/QtImIi1/h35Nz/0DY/JEtqLODn9hLAgFGL+J7QNL0wCQntU7ouTWZ3vr2wRuBvg
	vFacVKENuOPCCF4U0E9Ft0lt/cU/cxP1g56VLruGWZs0t8nptMcbEuvRFlwX/KDp+7ayk5lpyug8f
	WyhgMIMA==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pUY13-00CGUI-0J
	for linux-riscv@lists.infradead.org;
	Tue, 21 Feb 2023 19:09:34 +0000
Received: by mail-pj1-x102c.google.com with SMTP id i1-20020a17090ad34100b00234463de251so5922262pjx.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 11:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1d1h6gvf1z05DXGK1jMMZmsuuxnjdONUzCq/fBHE8HU=;
        b=NQWHRkJKY5Bl6xf4PWUlTa6jk+BND6P8FriX5GzSHGehnPqAcV31vMAclAUeHaEhx1
         UMM/EQ95G3oYYkk5Z8+oypFsWn6LTXhdMEueAP3061aTHOHknQZ73HepdwbzQje993mL
         Cpa2KfvB/2nsdsyF71PI3mWzJI+WMs5gAGmTt8ZlU93KZOCeqESp8SxHn+ar4y0E+sgN
         E6BtHLyyJw7GW+GCeQVMvB3SJcQlJzbuY8E5O1Ma+dVS+MHngGOoCMx/Ubg4WWF/CWcw
         GLoaZAK/8ygXWmvEpJcxY0t9WlleaWrqudZc0EJ/v7xaCsahzs9HadeQ1yDocxb6GAq1
         DBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1d1h6gvf1z05DXGK1jMMZmsuuxnjdONUzCq/fBHE8HU=;
        b=C0cIuAwDk+7BInV54uVfQ5OTnWeMhdug4IRelOVIua+RGAYMMD9o5E4UHLjqGsc6d4
         1DMiA440XCoeRGOGrp4l28JEvU6WdEMpVxG8mukBe/9KrKVuuBxRxA0Jx8tG3lntnPcC
         +TCuJ1UXbhDwtQQXOi9M0jCSD2WNKxG9LpZa2GocHFcXTUFcgJo/b6LUJ77ZU/lWEmbr
         iax2LafH+0hKlp7dnRP5seTBIg7b93QfhFM4JlXftN+9DdgFK7Y9SfcoTfEFOnHRDDjL
         Q/POapl68VwB6u1rt/hrJDwzugoN6Bu6X2hOMeKIB8m8fLi05PXz5ezjpWYkWqsPeNB7
         Uplg==
X-Gm-Message-State: AO0yUKWewSptmbpn+O0qDwL6I4q9M6Gl7uKnSCPD9Joc1PgRipQd3te0
	FFypvv6grWlM1ayl5KLIUgMP+A==
X-Google-Smtp-Source: AK7set8JjLGiaWRLurHznFToX0U9BCQDBtItExZOhKCMOGwdiRn6LYF21cyqclsdEmJ56Jtl3xA04Q==
X-Received: by 2002:a17:903:1108:b0:19a:8811:5dee with SMTP id n8-20020a170903110800b0019a88115deemr7537396plh.35.1677006565716;
        Tue, 21 Feb 2023 11:09:25 -0800 (PST)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id b16-20020a170902b61000b0019602b2c00csm1583863pls.175.2023.02.21.11.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:09:25 -0800 (PST)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 2/7] RISC-V: Add a syscall for HW probing
Date: Tue, 21 Feb 2023 11:08:53 -0800
Message-Id: <20230221190858.3159617-3-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221190858.3159617-1-evan@rivosinc.com>
References: <20230221190858.3159617-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_190929_532207_46FF44D3 
X-CRM114-Status: GOOD (  35.37  )
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, heiko@sntech.de, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, slewis@rivosinc.com, Bagas Sanjaya <bagasdotme@gmail.com>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Tobias Klauser <tklauser@distanz.ch>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, vineetg@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We don't have enough space for these all in ELF_HWCAP{,2} and there's no
system call that quite does this, so let's just provide an arch-specific
one to probe for hardware capabilities.  This currently just provides
m{arch,imp,vendor}id, but with the key-value pairs we can pass more in
the future.

Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Evan Green <evan@rivosinc.com>

---

Changes in v3:
 - Refactored functions so that kernel mode can query too, in
   preparation for the vDSO data population.
 - Changed the vendor/arch/imp IDs to return a value of -1 on mismatch
   rather than failing the whole call.
 - Const cpumask pointer in hwprobe_mid()
 - Embellished documentation WRT cpu_set and the returned values.
 - Renamed hwprobe_mid() to hwprobe_arch_id() (Conor)
 - Fixed machine ID doc warnings, changed elements to c:macro:.
 - Completed dangling unistd.h comment (Conor)
 - Fixed line breaks and minor logic optimization (Conor).
 - Use riscv_cached_mxxxid() (Conor)

Changes in v2:
 - Changed the interface to look more like poll(). Rather than supplying
   key_offset and getting back an array of values with numerically
   contiguous keys, have the user pre-fill the key members of the array,
   and the kernel will fill in the corresponding values. For any key it
   doesn't recognize, it will set the key of that element to -1. This
   allows usermode to quickly ask for exactly the elements it cares
   about, and not get bogged down in a back and forth about newer keys
   that older kernels might not recognize. In other words, the kernel
   can communicate that it doesn't recognize some of the keys while
   still providing the data for the keys it does know.
 - Added a shortcut to the cpuset parameters that if a size of 0 and
   NULL is provided for the CPU set, the kernel will use a cpu mask of
   all online CPUs. This is convenient because I suspect most callers
   will only want to act on a feature if it's supported on all CPUs, and
   it's a headache to dynamically allocate an array of all 1s, not to
   mention a waste to have the kernel loop over all of the offline bits.


---
 Documentation/riscv/hwprobe.rst       |  39 ++++++++
 Documentation/riscv/index.rst         |   1 +
 arch/riscv/include/asm/hwprobe.h      |  13 +++
 arch/riscv/include/asm/syscall.h      |   3 +
 arch/riscv/include/uapi/asm/hwprobe.h |  25 +++++
 arch/riscv/include/uapi/asm/unistd.h  |   9 ++
 arch/riscv/kernel/cpu.c               |   3 +-
 arch/riscv/kernel/sys_riscv.c         | 134 +++++++++++++++++++++++++-
 8 files changed, 225 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/riscv/hwprobe.rst
 create mode 100644 arch/riscv/include/asm/hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/hwprobe.h

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
new file mode 100644
index 000000000000..88b015a2026e
--- /dev/null
+++ b/Documentation/riscv/hwprobe.rst
@@ -0,0 +1,39 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+RISC-V Hardware Probing Interface
+---------------------------------
+
+The RISC-V hardware probing interface is based around a single syscall, which
+is defined in <asm/hwprobe.h>::
+
+    struct riscv_hwprobe {
+        __s64 key;
+        __u64 value;
+    };
+
+    long sys_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
+                           size_t cpu_count, cpu_set_t *cpus,
+                           unsigned long flags);
+
+The arguments are split into three groups: an array of key-value pairs, a CPU
+set, and some flags. The key-value pairs are supplied with a count. Userspace
+must prepopulate the key field for each element, and the kernel will fill in the
+value if the key is recognized. If a key is unknown to the kernel, its key field
+will be cleared to -1, and its value set to 0. The CPU set is defined by
+CPU_SET(3). For value-like keys (eg. vendor/arch/impl), the returned value will
+be only be valid if all CPUs in the given set have the same value. Otherwise -1
+will be returned. For boolean-like keys, the value returned will be a logical
+AND of the values for the specified CPUs. Usermode can supply NULL for cpus and
+0 for cpu_count as a shortcut for all online CPUs. There are currently no flags,
+this value must be zero for future compatibility.
+
+On success 0 is returned, on failure a negative error code is returned.
+
+The following keys are defined:
+
+* :c:macro:`RISCV_HWPROBE_KEY_MVENDORID`: Contains the value of ``mvendorid``,
+  as defined by the RISC-V privileged architecture specification.
+* :c:macro:`RISCV_HWPROBE_KEY_MARCHID`: Contains the value of ``marchid``, as
+  defined by the RISC-V privileged architecture specification.
+* :c:macro:`RISCV_HWPROBE_KEY_MIMPLID`: Contains the value of ``mimplid``, as
+  defined by the RISC-V privileged architecture specification.
diff --git a/Documentation/riscv/index.rst b/Documentation/riscv/index.rst
index 2e5b18fbb145..175a91db0200 100644
--- a/Documentation/riscv/index.rst
+++ b/Documentation/riscv/index.rst
@@ -7,6 +7,7 @@ RISC-V architecture
 
     boot-image-header
     vm-layout
+    hwprobe
     patch-acceptance
     uabi
 
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
index 000000000000..591802047460
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -0,0 +1,25 @@
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
+	__s64 key;
+	__u64 value;
+};
+
+#define RISCV_HWPROBE_KEY_MVENDORID	0
+#define RISCV_HWPROBE_KEY_MARCHID	1
+#define RISCV_HWPROBE_KEY_MIMPID	2
+/* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
+
+#endif
diff --git a/arch/riscv/include/uapi/asm/unistd.h b/arch/riscv/include/uapi/asm/unistd.h
index 73d7cdd2ec49..950ab3fd4409 100644
--- a/arch/riscv/include/uapi/asm/unistd.h
+++ b/arch/riscv/include/uapi/asm/unistd.h
@@ -43,3 +43,12 @@
 #define __NR_riscv_flush_icache (__NR_arch_specific_syscall + 15)
 #endif
 __SYSCALL(__NR_riscv_flush_icache, sys_riscv_flush_icache)
+
+/*
+ * Allows userspace to query the kernel for CPU architecture and
+ * microarchitecture details across a given set of CPUs.
+ */
+#ifndef __NR_riscv_hwprobe
+#define __NR_riscv_hwprobe (__NR_arch_specific_syscall + 14)
+#endif
+__SYSCALL(__NR_riscv_hwprobe, sys_riscv_hwprobe)
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 684e5419d37d..d0fb3567cc3d 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -4,15 +4,16 @@
  */
 
 #include <linux/cpu.h>
+#include <linux/cpuhotplug.h>
 #include <linux/init.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/hwcap.h>
+#include <asm/pgtable.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
-#include <asm/pgtable.h>
 
 /*
  * Returns the hart ID of the given device tree node, or -ENODEV if the node
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 5d3f2fbeb33c..02c2f1f7417e 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -6,8 +6,11 @@
  */
 
 #include <linux/syscalls.h>
-#include <asm/unistd.h>
 #include <asm/cacheflush.h>
+#include <asm/hwprobe.h>
+#include <asm/sbi.h>
+#include <asm/uaccess.h>
+#include <asm/unistd.h>
 #include <asm-generic/mman-common.h>
 
 static long riscv_sys_mmap(unsigned long addr, unsigned long len,
@@ -69,3 +72,132 @@ SYSCALL_DEFINE3(riscv_flush_icache, uintptr_t, start, uintptr_t, end,
 
 	return 0;
 }
+
+/*
+ * The hwprobe interface, for allowing userspace to probe to see which features
+ * are supported by the hardware.  See Documentation/riscv/hwprobe.rst for more
+ * details.
+ */
+static void hwprobe_arch_id(struct riscv_hwprobe *pair,
+			    const struct cpumask *cpus)
+{
+	u64 cpu, id = -1ULL;
+	bool first = true;
+
+	for_each_cpu(cpu, cpus) {
+		u64 cpu_id;
+
+		switch (pair->key) {
+		case RISCV_HWPROBE_KEY_MVENDORID:
+			cpu_id = riscv_cached_mvendorid(cpu);
+			break;
+		case RISCV_HWPROBE_KEY_MIMPID:
+			cpu_id = riscv_cached_mimpid(cpu);
+			break;
+		case RISCV_HWPROBE_KEY_MARCHID:
+			cpu_id = riscv_cached_marchid(cpu);
+			break;
+		}
+
+		if (first)
+			id = cpu_id;
+
+		/*
+		 * If there's a mismatch for the given set, return -1 in the
+		 * value.
+		 */
+		if (id != cpu_id) {
+			id = -1ULL;
+			break;
+		}
+	}
+
+	pair->value = id;
+}
+
+static void hwprobe_one_pair(struct riscv_hwprobe *pair,
+			     const struct cpumask *cpus)
+{
+	switch (pair->key) {
+	case RISCV_HWPROBE_KEY_MVENDORID:
+	case RISCV_HWPROBE_KEY_MARCHID:
+	case RISCV_HWPROBE_KEY_MIMPID:
+		hwprobe_arch_id(pair, cpus);
+		break;
+
+	/*
+	 * For forward compatibility, unknown keys don't fail the whole
+	 * call, but get their element key set to -1 and value set to 0
+	 * indicating they're unrecognized.
+	 */
+	default:
+		pair->key = -1;
+		pair->value = 0;
+		break;
+	}
+}
+
+static
+int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs, long pair_count,
+		      long cpu_count, unsigned long __user *cpus_user,
+		      unsigned long flags)
+{
+	size_t out;
+	int ret;
+	cpumask_t cpus;
+
+	/* Check the reserved flags. */
+	if (flags != 0)
+		return -EINVAL;
+
+	/*
+	 * The interface supports taking in a CPU mask, and returns values that
+	 * are consistent across that mask. Allow userspace to specify NULL and
+	 * 0 as a shortcut to all online CPUs.
+	 */
+	cpumask_clear(&cpus);
+	if (!cpu_count && !cpus_user) {
+		cpumask_copy(&cpus, cpu_online_mask);
+	} else {
+		if (cpu_count > cpumask_size())
+			cpu_count = cpumask_size();
+
+		ret = copy_from_user(&cpus, cpus_user, cpu_count);
+		if (!ret)
+			return -EFAULT;
+
+		/*
+		 * Userspace must provide at least one online CPU, without that
+		 * there's no way to define what is supported.
+		 */
+		cpumask_and(&cpus, &cpus, cpu_online_mask);
+		if (cpumask_empty(&cpus))
+			return -EINVAL;
+	}
+
+	for (out = 0; out < pair_count; out++, pairs++) {
+		struct riscv_hwprobe pair;
+
+		if (get_user(pair.key, &pairs->key))
+			return -EFAULT;
+
+		pair.value = 0;
+		hwprobe_one_pair(&pair, &cpus);
+		ret = put_user(pair.key, &pairs->key);
+		if (ret == 0)
+			ret = put_user(pair.value, &pairs->value);
+
+		if (ret)
+			return -EFAULT;
+	}
+
+	return 0;
+
+}
+
+SYSCALL_DEFINE5(riscv_hwprobe, uintptr_t, pairs, uintptr_t, pair_count,
+		uintptr_t, cpu_count, uintptr_t, cpus, uintptr_t, flags)
+{
+	return do_riscv_hwprobe((void __user *)pairs, pair_count, cpu_count,
+				(void __user *)cpus, flags);
+}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
