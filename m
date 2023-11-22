Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF08C61DB1
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 16:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHwoxaagzp9jPClJnb/T+cM3tfOsVudi9yw3XPss7rY=; b=YxaxHIkIUcFOu9
	ntL4BeXhauJq27qNzNiPbR/CgcxCbrHjWV17u+/PyGRD4DAxcEkBoptPoF/JvGdkhKhlirjGPNb/O
	sFBc8i/PSIP8ZM4SO3p3Kkjd+BjgUkVI19j/WFxQdDWwSqS5Tkx3ctsICXAJMVCedO3NXsoItfTKT
	7pIvRcWHwCZ3d2D4zXVrqvqPcj+x1UHq2QVak3J1o5ODRJ4l4fy5X9rk774+Q9urbZsAsseN8aZhW
	9LWc/rbf2H/d8KGF048+Oxvxt1O0D5sktpv3IpfVfqpnAjzdpDFHGXwBVjrc35Um2v2bNP2cJsEZG
	HtCAjiVdSXkOIHGwQs4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qNf-002YMq-2s;
	Wed, 22 Nov 2023 16:47:15 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qNa-002YIW-33
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 16:47:13 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54553e4888bso9853387a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 08:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700671624; x=1701276424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cF+8Zxi7cFccLQRbnATJWB2E73+MFFdN2uTHprgaKyE=;
        b=bpMAsfVDYvD9NUFK8a6510gxT9Hjja8aA+WYa6T2nEZnnk3zjIWTfvWSFsywcK95wN
         NuNInkFoGBEh99uqRxXYrrYmWiBJMb8TKc8zfFjQpcQvJWR3DWTiIFh+286LowjCuPxG
         rVDH7xX39/WRjm4c4IM+Qu4t0TOGGGlCzKnX42AIflzAjM14q1n3KnA2B09ttEFE8iLF
         5vByUiRMVBlAspsNNUB6HiF5MV6bvsporqEyHS0yAsCPJv37k32EgR/BnMqL+ye+T4n8
         Mpfmc0fVYtpKVPmAxrwGvVd8cD6+XxmTYYNAmXrtwvWeMCdme5mayuW5SIMm+IAKnIh1
         Ty8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700671624; x=1701276424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cF+8Zxi7cFccLQRbnATJWB2E73+MFFdN2uTHprgaKyE=;
        b=cu3Dfoj68hMZuMgjJ5ZK5o6tiFLn/pF0wQ5lwLM+lj0+uwtJTKScoTS0Uz+/7xmTF5
         +GmDG2Ld+5sYlTraNok943294DehlYnEI0tgHz1Lj5Lg1m1VnLxd0t9fytRz3g6QEgA0
         8ENlXnaZ8N5Cbx3l02kC+/OphNT4JWPK4c5HZDg9BzbHtki1aYfNMRjO1q0L9+bywE50
         1njR+DRYiPC0Ou6xBS+rAneEmhU1pofNubnOkXb/abhm1iGSaZcipfyTuuclWhpn5udv
         2W6boG2IfzHMEcxC/xn82cllt22NLA3IGpHLIwUinQHPaWygf8C8Slz+YJTpIIi5pPEL
         s+qA==
X-Gm-Message-State: AOJu0YzXDQDzFvcPVwYzkFANObsF1rLoZpl0A0tsCF8ALU4h/Py5mQ+y
	qZosuwF6RMMVYGV8MLT9ZlxsbmsHHgQj9w6LYwQ=
X-Google-Smtp-Source: AGHT+IEiQF4rP52lF3Phd9YPoE9ihMQYaNcypC0waJlLEababAfgIcdFJkxf1wsnbvBbpdnpZtdWYQ==
X-Received: by 2002:aa7:cc11:0:b0:531:1241:3e98 with SMTP id q17-20020aa7cc11000000b0053112413e98mr735903edt.9.1700671624082;
        Wed, 22 Nov 2023 08:47:04 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id i25-20020a05640200d900b0054026e95beesm6286924edu.76.2023.11.22.08.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 08:47:03 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v3 2/4] RISC-V: Move the hwprobe syscall to its own file
Date: Wed, 22 Nov 2023 17:47:03 +0100
Message-ID: <20231122164700.127954-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122164700.127954-6-ajones@ventanamicro.com>
References: <20231122164700.127954-6-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_084711_000783_1516B71F 
X-CRM114-Status: GOOD (  29.66  )
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

As Palmer says, hwprobe is "sort of its own thing now, and it's only
going to get bigger..."

Suggested-by: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/Makefile      |   1 +
 arch/riscv/kernel/sys_hwprobe.c | 289 ++++++++++++++++++++++++++++++++
 arch/riscv/kernel/sys_riscv.c   | 285 -------------------------------
 3 files changed, 290 insertions(+), 285 deletions(-)
 create mode 100644 arch/riscv/kernel/sys_hwprobe.c

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index fee22a3d1b53..a1f5dc145574 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -50,6 +50,7 @@ obj-y	+= setup.o
 obj-y	+= signal.o
 obj-y	+= syscall_table.o
 obj-y	+= sys_riscv.o
+obj-y	+= sys_hwprobe.o
 obj-y	+= time.o
 obj-y	+= traps.o
 obj-y	+= riscv_ksyms.o
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
new file mode 100644
index 000000000000..c0ccf1f45aaa
--- /dev/null
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -0,0 +1,289 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * The hwprobe interface, for allowing userspace to probe to see which features
+ * are supported by the hardware.  See Documentation/arch/riscv/hwprobe.rst for
+ * more details.
+ */
+#include <linux/syscalls.h>
+#include <asm/cacheflush.h>
+#include <asm/cpufeature.h>
+#include <asm/hwprobe.h>
+#include <asm/sbi.h>
+#include <asm/switch_to.h>
+#include <asm/uaccess.h>
+#include <asm/unistd.h>
+#include <asm/vector.h>
+#include <vdso/vsyscall.h>
+
+
+static void hwprobe_arch_id(struct riscv_hwprobe *pair,
+			    const struct cpumask *cpus)
+{
+	u64 id = -1ULL;
+	bool first = true;
+	int cpu;
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
+		if (first) {
+			id = cpu_id;
+			first = false;
+		}
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
+static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
+			     const struct cpumask *cpus)
+{
+	int cpu;
+	u64 missing = 0;
+
+	pair->value = 0;
+	if (has_fpu())
+		pair->value |= RISCV_HWPROBE_IMA_FD;
+
+	if (riscv_isa_extension_available(NULL, c))
+		pair->value |= RISCV_HWPROBE_IMA_C;
+
+	if (has_vector())
+		pair->value |= RISCV_HWPROBE_IMA_V;
+
+	/*
+	 * Loop through and record extensions that 1) anyone has, and 2) anyone
+	 * doesn't have.
+	 */
+	for_each_cpu(cpu, cpus) {
+		struct riscv_isainfo *isainfo = &hart_isa[cpu];
+
+#define EXT_KEY(ext)									\
+	do {										\
+		if (__riscv_isa_extension_available(isainfo->isa, RISCV_ISA_EXT_##ext))	\
+			pair->value |= RISCV_HWPROBE_EXT_##ext;				\
+		else									\
+			missing |= RISCV_HWPROBE_EXT_##ext;				\
+	} while (false)
+
+		/*
+		 * Only use EXT_KEY() for extensions which can be exposed to userspace,
+		 * regardless of the kernel's configuration, as no other checks, besides
+		 * presence in the hart_isa bitmap, are made.
+		 */
+		EXT_KEY(ZBA);
+		EXT_KEY(ZBB);
+		EXT_KEY(ZBS);
+		EXT_KEY(ZICBOZ);
+#undef EXT_KEY
+	}
+
+	/* Now turn off reporting features if any CPU is missing it. */
+	pair->value &= ~missing;
+}
+
+static bool hwprobe_ext0_has(const struct cpumask *cpus, unsigned long ext)
+{
+	struct riscv_hwprobe pair;
+
+	hwprobe_isa_ext0(&pair, cpus);
+	return (pair.value & ext);
+}
+
+static u64 hwprobe_misaligned(const struct cpumask *cpus)
+{
+	int cpu;
+	u64 perf = -1ULL;
+
+	for_each_cpu(cpu, cpus) {
+		int this_perf = per_cpu(misaligned_access_speed, cpu);
+
+		if (perf == -1ULL)
+			perf = this_perf;
+
+		if (perf != this_perf) {
+			perf = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
+			break;
+		}
+	}
+
+	if (perf == -1ULL)
+		return RISCV_HWPROBE_MISALIGNED_UNKNOWN;
+
+	return perf;
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
+	/*
+	 * The kernel already assumes that the base single-letter ISA
+	 * extensions are supported on all harts, and only supports the
+	 * IMA base, so just cheat a bit here and tell that to
+	 * userspace.
+	 */
+	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
+		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		break;
+
+	case RISCV_HWPROBE_KEY_IMA_EXT_0:
+		hwprobe_isa_ext0(pair, cpus);
+		break;
+
+	case RISCV_HWPROBE_KEY_CPUPERF_0:
+		pair->value = hwprobe_misaligned(cpus);
+		break;
+
+	case RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE:
+		pair->value = 0;
+		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
+			pair->value = riscv_cboz_block_size;
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
+static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
+			    size_t pair_count, size_t cpusetsize,
+			    unsigned long __user *cpus_user,
+			    unsigned int flags)
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
+	if (!cpusetsize && !cpus_user) {
+		cpumask_copy(&cpus, cpu_online_mask);
+	} else {
+		if (cpusetsize > cpumask_size())
+			cpusetsize = cpumask_size();
+
+		ret = copy_from_user(&cpus, cpus_user, cpusetsize);
+		if (ret)
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
+}
+
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
+	avd->homogeneous_cpus = id_bitsmash != 0 && id_bitsmash != -1;
+	return 0;
+}
+
+arch_initcall_sync(init_hwprobe_vdso_data);
+
+#endif /* CONFIG_MMU */
+
+SYSCALL_DEFINE5(riscv_hwprobe, struct riscv_hwprobe __user *, pairs,
+		size_t, pair_count, size_t, cpusetsize, unsigned long __user *,
+		cpus, unsigned int, flags)
+{
+	return do_riscv_hwprobe(pairs, pair_count, cpusetsize,
+				cpus, flags);
+}
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 5e4deb1308b8..f1c1416a9f1e 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -7,15 +7,7 @@
 
 #include <linux/syscalls.h>
 #include <asm/cacheflush.h>
-#include <asm/cpufeature.h>
-#include <asm/hwprobe.h>
-#include <asm/sbi.h>
-#include <asm/vector.h>
-#include <asm/switch_to.h>
-#include <asm/uaccess.h>
-#include <asm/unistd.h>
 #include <asm-generic/mman-common.h>
-#include <vdso/vsyscall.h>
 
 static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 			   unsigned long prot, unsigned long flags,
@@ -77,283 +69,6 @@ SYSCALL_DEFINE3(riscv_flush_icache, uintptr_t, start, uintptr_t, end,
 	return 0;
 }
 
-/*
- * The hwprobe interface, for allowing userspace to probe to see which features
- * are supported by the hardware.  See Documentation/arch/riscv/hwprobe.rst for more
- * details.
- */
-static void hwprobe_arch_id(struct riscv_hwprobe *pair,
-			    const struct cpumask *cpus)
-{
-	u64 id = -1ULL;
-	bool first = true;
-	int cpu;
-
-	for_each_cpu(cpu, cpus) {
-		u64 cpu_id;
-
-		switch (pair->key) {
-		case RISCV_HWPROBE_KEY_MVENDORID:
-			cpu_id = riscv_cached_mvendorid(cpu);
-			break;
-		case RISCV_HWPROBE_KEY_MIMPID:
-			cpu_id = riscv_cached_mimpid(cpu);
-			break;
-		case RISCV_HWPROBE_KEY_MARCHID:
-			cpu_id = riscv_cached_marchid(cpu);
-			break;
-		}
-
-		if (first) {
-			id = cpu_id;
-			first = false;
-		}
-
-		/*
-		 * If there's a mismatch for the given set, return -1 in the
-		 * value.
-		 */
-		if (id != cpu_id) {
-			id = -1ULL;
-			break;
-		}
-	}
-
-	pair->value = id;
-}
-
-static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
-			     const struct cpumask *cpus)
-{
-	int cpu;
-	u64 missing = 0;
-
-	pair->value = 0;
-	if (has_fpu())
-		pair->value |= RISCV_HWPROBE_IMA_FD;
-
-	if (riscv_isa_extension_available(NULL, c))
-		pair->value |= RISCV_HWPROBE_IMA_C;
-
-	if (has_vector())
-		pair->value |= RISCV_HWPROBE_IMA_V;
-
-	/*
-	 * Loop through and record extensions that 1) anyone has, and 2) anyone
-	 * doesn't have.
-	 */
-	for_each_cpu(cpu, cpus) {
-		struct riscv_isainfo *isainfo = &hart_isa[cpu];
-
-#define EXT_KEY(ext)									\
-	do {										\
-		if (__riscv_isa_extension_available(isainfo->isa, RISCV_ISA_EXT_##ext))	\
-			pair->value |= RISCV_HWPROBE_EXT_##ext;				\
-		else									\
-			missing |= RISCV_HWPROBE_EXT_##ext;				\
-	} while (false)
-
-		/*
-		 * Only use EXT_KEY() for extensions which can be exposed to userspace,
-		 * regardless of the kernel's configuration, as no other checks, besides
-		 * presence in the hart_isa bitmap, are made.
-		 */
-		EXT_KEY(ZBA);
-		EXT_KEY(ZBB);
-		EXT_KEY(ZBS);
-		EXT_KEY(ZICBOZ);
-#undef EXT_KEY
-	}
-
-	/* Now turn off reporting features if any CPU is missing it. */
-	pair->value &= ~missing;
-}
-
-static bool hwprobe_ext0_has(const struct cpumask *cpus, unsigned long ext)
-{
-	struct riscv_hwprobe pair;
-
-	hwprobe_isa_ext0(&pair, cpus);
-	return (pair.value & ext);
-}
-
-static u64 hwprobe_misaligned(const struct cpumask *cpus)
-{
-	int cpu;
-	u64 perf = -1ULL;
-
-	for_each_cpu(cpu, cpus) {
-		int this_perf = per_cpu(misaligned_access_speed, cpu);
-
-		if (perf == -1ULL)
-			perf = this_perf;
-
-		if (perf != this_perf) {
-			perf = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
-			break;
-		}
-	}
-
-	if (perf == -1ULL)
-		return RISCV_HWPROBE_MISALIGNED_UNKNOWN;
-
-	return perf;
-}
-
-static void hwprobe_one_pair(struct riscv_hwprobe *pair,
-			     const struct cpumask *cpus)
-{
-	switch (pair->key) {
-	case RISCV_HWPROBE_KEY_MVENDORID:
-	case RISCV_HWPROBE_KEY_MARCHID:
-	case RISCV_HWPROBE_KEY_MIMPID:
-		hwprobe_arch_id(pair, cpus);
-		break;
-	/*
-	 * The kernel already assumes that the base single-letter ISA
-	 * extensions are supported on all harts, and only supports the
-	 * IMA base, so just cheat a bit here and tell that to
-	 * userspace.
-	 */
-	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
-		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
-		break;
-
-	case RISCV_HWPROBE_KEY_IMA_EXT_0:
-		hwprobe_isa_ext0(pair, cpus);
-		break;
-
-	case RISCV_HWPROBE_KEY_CPUPERF_0:
-		pair->value = hwprobe_misaligned(cpus);
-		break;
-
-	case RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE:
-		pair->value = 0;
-		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
-			pair->value = riscv_cboz_block_size;
-		break;
-
-	/*
-	 * For forward compatibility, unknown keys don't fail the whole
-	 * call, but get their element key set to -1 and value set to 0
-	 * indicating they're unrecognized.
-	 */
-	default:
-		pair->key = -1;
-		pair->value = 0;
-		break;
-	}
-}
-
-static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
-			    size_t pair_count, size_t cpusetsize,
-			    unsigned long __user *cpus_user,
-			    unsigned int flags)
-{
-	size_t out;
-	int ret;
-	cpumask_t cpus;
-
-	/* Check the reserved flags. */
-	if (flags != 0)
-		return -EINVAL;
-
-	/*
-	 * The interface supports taking in a CPU mask, and returns values that
-	 * are consistent across that mask. Allow userspace to specify NULL and
-	 * 0 as a shortcut to all online CPUs.
-	 */
-	cpumask_clear(&cpus);
-	if (!cpusetsize && !cpus_user) {
-		cpumask_copy(&cpus, cpu_online_mask);
-	} else {
-		if (cpusetsize > cpumask_size())
-			cpusetsize = cpumask_size();
-
-		ret = copy_from_user(&cpus, cpus_user, cpusetsize);
-		if (ret)
-			return -EFAULT;
-
-		/*
-		 * Userspace must provide at least one online CPU, without that
-		 * there's no way to define what is supported.
-		 */
-		cpumask_and(&cpus, &cpus, cpu_online_mask);
-		if (cpumask_empty(&cpus))
-			return -EINVAL;
-	}
-
-	for (out = 0; out < pair_count; out++, pairs++) {
-		struct riscv_hwprobe pair;
-
-		if (get_user(pair.key, &pairs->key))
-			return -EFAULT;
-
-		pair.value = 0;
-		hwprobe_one_pair(&pair, &cpus);
-		ret = put_user(pair.key, &pairs->key);
-		if (ret == 0)
-			ret = put_user(pair.value, &pairs->value);
-
-		if (ret)
-			return -EFAULT;
-	}
-
-	return 0;
-}
-
-#ifdef CONFIG_MMU
-
-static int __init init_hwprobe_vdso_data(void)
-{
-	struct vdso_data *vd = __arch_get_k_vdso_data();
-	struct arch_vdso_data *avd = &vd->arch_data;
-	u64 id_bitsmash = 0;
-	struct riscv_hwprobe pair;
-	int key;
-
-	/*
-	 * Initialize vDSO data with the answers for the "all CPUs" case, to
-	 * save a syscall in the common case.
-	 */
-	for (key = 0; key <= RISCV_HWPROBE_MAX_KEY; key++) {
-		pair.key = key;
-		hwprobe_one_pair(&pair, cpu_online_mask);
-
-		WARN_ON_ONCE(pair.key < 0);
-
-		avd->all_cpu_hwprobe_values[key] = pair.value;
-		/*
-		 * Smash together the vendor, arch, and impl IDs to see if
-		 * they're all 0 or any negative.
-		 */
-		if (key <= RISCV_HWPROBE_KEY_MIMPID)
-			id_bitsmash |= pair.value;
-	}
-
-	/*
-	 * If the arch, vendor, and implementation ID are all the same across
-	 * all harts, then assume all CPUs are the same, and allow the vDSO to
-	 * answer queries for arbitrary masks. However if all values are 0 (not
-	 * populated) or any value returns -1 (varies across CPUs), then the
-	 * vDSO should defer to the kernel for exotic cpu masks.
-	 */
-	avd->homogeneous_cpus = id_bitsmash != 0 && id_bitsmash != -1;
-	return 0;
-}
-
-arch_initcall_sync(init_hwprobe_vdso_data);
-
-#endif /* CONFIG_MMU */
-
-SYSCALL_DEFINE5(riscv_hwprobe, struct riscv_hwprobe __user *, pairs,
-		size_t, pair_count, size_t, cpusetsize, unsigned long __user *,
-		cpus, unsigned int, flags)
-{
-	return do_riscv_hwprobe(pairs, pair_count, cpusetsize,
-				cpus, flags);
-}
-
 /* Not defined using SYSCALL_DEFINE0 to avoid error injection */
 asmlinkage long __riscv_sys_ni_syscall(const struct pt_regs *__unused)
 {
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
