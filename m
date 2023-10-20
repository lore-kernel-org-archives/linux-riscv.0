Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DBDCDB474
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3wn5HFVIuvKirl0g1tWzv8ptrCozuIvf+FAWikaLHo=; b=GgIIfpCYQ2RhjG
	ErDwYTYSJM3CP8++FUNLHl0GHUQBbnQrycEDxhP9ceTAe86i/D/FBxe8to3fthmd7WFRgADVrw/3O
	xDtzPcd+MfTYcALwChhyuiw8lqUndYDtmLYtFTqQsbiFPjo/ESJay0LMALQ92p/Cr+UjksmzJVt1H
	wUluYfeVxbtdWYdOCyFdP/NraL2Ebp5Zy8EGmpad9MYEs3Z1XlwKwaYtmO9ylp8jxIX4VM+nYl7mA
	KE3r5fUtgXesrvqo97yTwN8iHk7dH5oHQ2Gi0uCRTlJaeYNC97+64Lpu8lBmAb1WhnPRZsALhjVdY
	R3jJ7hgLuo16/WVDQj/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpBx-002Jhv-24;
	Fri, 20 Oct 2023 13:05:29 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpBs-002Jeu-0P
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 13:05:26 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9ada2e6e75fso121671766b.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 06:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697807122; x=1698411922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sf9oD6fbjILUuRoB5NO76MJymgXsb+ylLbCHO4jcTKI=;
        b=RUJCpN5O5VlBF+BaQ6rLUdHMuCVwwVJY+stM8rSYMcc0MzVV14v9pJ25GyedybqEFp
         6d0lr5R6P/HljMFtRFsH/Z9pDxgtmEwvsKIeie853/a/QFhBz0qbYi+hRitK79HcmheA
         +0vHIrTj11yKXkemhMXZmwqutlEy7ae9tjWM6ugV203ZGnPOtMLgVG9lgJ0JItY6U3V6
         nT/6ZpyDm1ET32YSXG5sYMuDVl0GbzprI9sIOQ0e/LMkdhCVsySOW7yHwHOmro1Z8+m4
         DcPw5d4+/rwVnrt3pVg27g/kgJTVJMC/M5/0IYFYPUPyqBpWuxlcdgP3vhir29jkoAxg
         lRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697807122; x=1698411922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sf9oD6fbjILUuRoB5NO76MJymgXsb+ylLbCHO4jcTKI=;
        b=UfAawtpVigMcwn4Zv5oAj5SJ9JsSK0UJ9zrmWMGcMXfM87EWSdJhdmhvcBxwkPF4Mu
         YXvpnqQaQunTe10oLZUEluCnS9OL1Gt06gVja5PNNhglwQusAYvHJh6pMgopwpYTnj2E
         GVkIsSOoQExZEvkToijQBdIOJoZeOObFp6XR1CSMHJksyiDPLnkSclh+4C14+oNEigND
         fJ/wtLJmYqjinm5p0Vz6C7YK2s8eG+GsOb+BPMUTqI65nnI40hCD4bFA7Mx4YAYXRQSW
         wfnUos4qzq/W5/vHj2HNadEIGfx75Ja/S9k0lNYCM1BEQkbcbxXonulkpy2MpNXeUhx3
         3Smw==
X-Gm-Message-State: AOJu0YyAOPhY5hiQyvewhvMj5LwKIuv/mvKW95DKvcsiLrWSCtVNAAUW
	DD0qvM8Fh3UyBUsdiezslN0iGvSgwlAHaWiwdq0=
X-Google-Smtp-Source: AGHT+IHT6VxX9LP1P5bktKNLtzXKGTMJntLKWCYfOlGWEbKR0VRSq/zG6UytZcog2LxQktbndg4t5g==
X-Received: by 2002:a17:907:c28d:b0:9c3:b3cb:29ae with SMTP id tk13-20020a170907c28d00b009c3b3cb29aemr1260451ejc.47.1697807121561;
        Fri, 20 Oct 2023 06:05:21 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id my18-20020a1709065a5200b009a9fbeb15f5sm1450140ejc.46.2023.10.20.06.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 06:05:20 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v2 2/6] RISC-V: Move the hwprobe syscall to its own file
Date: Fri, 20 Oct 2023 15:05:18 +0200
Message-ID: <20231020130515.424577-10-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020130515.424577-8-ajones@ventanamicro.com>
References: <20231020130515.424577-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_060524_173463_3FB40E9B 
X-CRM114-Status: GOOD (  28.49  )
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
---
 arch/riscv/kernel/Makefile      |   1 +
 arch/riscv/kernel/sys_hwprobe.c | 271 ++++++++++++++++++++++++++++++++
 arch/riscv/kernel/sys_riscv.c   | 267 -------------------------------
 3 files changed, 272 insertions(+), 267 deletions(-)
 create mode 100644 arch/riscv/kernel/sys_hwprobe.c

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 95cf25d48405..db7a43211b30 100644
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
index 000000000000..76db48516e68
--- /dev/null
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * The hwprobe interface, for allowing userspace to probe to see which features
+ * are supported by the hardware.  See Documentation/riscv/hwprobe.rst for more
+ * details.
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
+		if (riscv_isa_extension_available(isainfo->isa, ZBA))
+			pair->value |= RISCV_HWPROBE_EXT_ZBA;
+		else
+			missing |= RISCV_HWPROBE_EXT_ZBA;
+
+		if (riscv_isa_extension_available(isainfo->isa, ZBB))
+			pair->value |= RISCV_HWPROBE_EXT_ZBB;
+		else
+			missing |= RISCV_HWPROBE_EXT_ZBB;
+
+		if (riscv_isa_extension_available(isainfo->isa, ZBS))
+			pair->value |= RISCV_HWPROBE_EXT_ZBS;
+		else
+			missing |= RISCV_HWPROBE_EXT_ZBS;
+	}
+
+	/* Now turn off reporting features if any CPU is missing it. */
+	pair->value &= ~missing;
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
index ed3545eb1b2b..f1c1416a9f1e 100644
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
@@ -77,265 +69,6 @@ SYSCALL_DEFINE3(riscv_flush_icache, uintptr_t, start, uintptr_t, end,
 	return 0;
 }
 
-/*
- * The hwprobe interface, for allowing userspace to probe to see which features
- * are supported by the hardware.  See Documentation/riscv/hwprobe.rst for more
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
-		if (riscv_isa_extension_available(isainfo->isa, ZBA))
-			pair->value |= RISCV_HWPROBE_EXT_ZBA;
-		else
-			missing |= RISCV_HWPROBE_EXT_ZBA;
-
-		if (riscv_isa_extension_available(isainfo->isa, ZBB))
-			pair->value |= RISCV_HWPROBE_EXT_ZBB;
-		else
-			missing |= RISCV_HWPROBE_EXT_ZBB;
-
-		if (riscv_isa_extension_available(isainfo->isa, ZBS))
-			pair->value |= RISCV_HWPROBE_EXT_ZBS;
-		else
-			missing |= RISCV_HWPROBE_EXT_ZBS;
-	}
-
-	/* Now turn off reporting features if any CPU is missing it. */
-	pair->value &= ~missing;
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
