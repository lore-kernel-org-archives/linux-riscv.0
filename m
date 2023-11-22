Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B398C61D9B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 16:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=56X+9BL8RRR55785RYU5/Qd+qlk+HavsQKEvai3lkHQ=; b=ZK/0hiWztEfY4n
	9DigTnxS3r0iA2RybB1wkwwq1/vR82F9BkqaKaVAN+Wyj69ktE5VcC6+bE9zJvVXYoO0QJmowNsiP
	4S4c4R2S4zRusuJ7fNCoJhFJCwr5VItCh70T7pOW8nKANyj90V15VDVf0WgWv7iLuMBR2aWHbwwOr
	5qXItS6lcr2SfoFLY8dalo0kQcOb2n24Juo/m1YrRp56lvWwdxckfpk5DJ5NkV97NkOHXQ1BXZdo7
	vYK77VtlosxXQ2kii2Wykkc4gHhfLghTgE7eU7ukziX4daAz0MnKeCQJ9BvmU03UoZAMwSkwkkIi5
	fRyppp4g+JnIfOJaEK8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qNe-002YMI-2I;
	Wed, 22 Nov 2023 16:47:14 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qNZ-002YIN-38
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 16:47:11 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5401bab7525so10018123a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 08:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700671623; x=1701276423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymWrg4Z6mUvHGZYV48ZEduoEKCU4YWJj4mQRZQpgV9U=;
        b=pbLOurDQRkAU26els7HJYbsXuRWgjrQohDq0m3GqmK31jpw/3ZZip8IE/d7MvAFHKU
         G5hcU5AMFYq9R+jTRCG0eDcS9XjJSX7SDFqCRooeJVK448i4I6ZEua/oxXqWXFftlJuf
         8ruKFSFqLR0pO5k8PGeA4csP2c4SjWVmmPcPvHKuGgfXBok0HGR2j2XtXmLOFeooH6V3
         mtcWR7/97r2p0xHrjrkqEq3YGF5ue+ck26KXGVolid3BsCRYVuYH3jQD7Vsp23mpoUtv
         ZaGozfug21KhbEqOvHhxrMKkMHIR88fet1Nd1p9Y1TXfJiCitzR3Cd7dlcvvmLcE+ybL
         yHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700671623; x=1701276423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymWrg4Z6mUvHGZYV48ZEduoEKCU4YWJj4mQRZQpgV9U=;
        b=jMXn9W6iRHRMKJfs/z8LjcsA9NNee+BM2Gm9CDZpQlzm2DQ1Pe2EkU0J1FBVotpT/g
         NRogY1gf6u0ZVtclsgvnRaIFwGPli59XQJ8vpiw8Ni/DlKHGy4VOCKZGxQfiNv7vtkFA
         A8LQwia2YoQyUfqGkIUdUQ+hz6+L3LkOjSIAfqefktbPZamg/mg15mLzpktic0mZ7baL
         SHM5gqArrHeMF82z7tBLrYlxVzrUqKLtLL4VdhtKgH8g0Mx+N+7g4VaaEFj7u0TFKxFM
         lRDBnPGkBSWGCu/EFI18vlxrWm2COIQuOhx9FfvBmKeG4RrnUCcegTSZViS1t8AkRs4X
         TNLw==
X-Gm-Message-State: AOJu0Yy9EyzbcjzMvTjLyvdi9RFYhUWzwpef0J4S7NZzeHXrpcPpuxq5
	VRucTMyESVbs/5uEJa//jjTSvCJtJ3V4VrlGfBk=
X-Google-Smtp-Source: AGHT+IFqdTZF1DT7ChM9x1PwAXC66YCzoniRF5ONY1Xxmeh/JSRQa4LOxQ5YFdmw4llHsTBAuVlnWQ==
X-Received: by 2002:a17:906:8305:b0:a02:90ca:a708 with SMTP id j5-20020a170906830500b00a0290caa708mr1886377ejx.64.1700671622663;
        Wed, 22 Nov 2023 08:47:02 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id y4-20020a170906470400b009fc54390966sm4902597ejq.145.2023.11.22.08.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 08:47:02 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 1/4] RISC-V: hwprobe: Clarify cpus size parameter
Date: Wed, 22 Nov 2023 17:47:02 +0100
Message-ID: <20231122164700.127954-7-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122164700.127954-6-ajones@ventanamicro.com>
References: <20231122164700.127954-6-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_084710_011763_FBCA5D86 
X-CRM114-Status: GOOD (  20.28  )
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

The "count" parameter associated with the 'cpus' parameter of the
hwprobe syscall is the size in bytes of 'cpus'. Naming it 'cpu_count'
may mislead users (it did me) to think it's the number of CPUs that
are or can be represented by 'cpus' instead. This is particularly
easy (IMO) to get wrong since 'cpus' is documented to be defined by
CPU_SET(3) and CPU_SET(3) also documents a CPU_COUNT() (the number
of CPUs in set) macro. CPU_SET(3) refers to the size of cpu sets
with 'setsize'. Adopt 'cpusetsize' for the hwprobe parameter and
specifically state it is in bytes in Documentation/riscv/hwprobe.rst
to clarify.

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/arch/riscv/hwprobe.rst              | 15 ++++++++-------
 arch/riscv/kernel/sys_riscv.c                     | 14 +++++++-------
 arch/riscv/kernel/vdso/hwprobe.c                  | 10 +++++-----
 tools/testing/selftests/riscv/hwprobe/hwprobe.c   |  2 +-
 tools/testing/selftests/riscv/hwprobe/hwprobe.h   |  2 +-
 .../testing/selftests/riscv/vector/vstate_prctl.c | 10 +---------
 6 files changed, 23 insertions(+), 30 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 7b2384de471f..132e9acaa8f4 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -12,7 +12,7 @@ is defined in <asm/hwprobe.h>::
     };
 
     long sys_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
-                           size_t cpu_count, cpu_set_t *cpus,
+                           size_t cpusetsize, cpu_set_t *cpus,
                            unsigned int flags);
 
 The arguments are split into three groups: an array of key-value pairs, a CPU
@@ -20,12 +20,13 @@ set, and some flags. The key-value pairs are supplied with a count. Userspace
 must prepopulate the key field for each element, and the kernel will fill in the
 value if the key is recognized. If a key is unknown to the kernel, its key field
 will be cleared to -1, and its value set to 0. The CPU set is defined by
-CPU_SET(3). For value-like keys (eg. vendor/arch/impl), the returned value will
-be only be valid if all CPUs in the given set have the same value. Otherwise -1
-will be returned. For boolean-like keys, the value returned will be a logical
-AND of the values for the specified CPUs. Usermode can supply NULL for cpus and
-0 for cpu_count as a shortcut for all online CPUs. There are currently no flags,
-this value must be zero for future compatibility.
+CPU_SET(3) with size ``cpusetsize`` bytes. For value-like keys (eg. vendor,
+arch, impl), the returned value will only be valid if all CPUs in the given set
+have the same value. Otherwise -1 will be returned. For boolean-like keys, the
+value returned will be a logical AND of the values for the specified CPUs.
+Usermode can supply NULL for ``cpus`` and 0 for ``cpusetsize`` as a shortcut for
+all online CPUs. There are currently no flags, this value must be zero for
+future compatibility.
 
 On success 0 is returned, on failure a negative error code is returned.
 
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index c712037dbe10..5e4deb1308b8 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -246,7 +246,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 }
 
 static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
-			    size_t pair_count, size_t cpu_count,
+			    size_t pair_count, size_t cpusetsize,
 			    unsigned long __user *cpus_user,
 			    unsigned int flags)
 {
@@ -264,13 +264,13 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
 	 * 0 as a shortcut to all online CPUs.
 	 */
 	cpumask_clear(&cpus);
-	if (!cpu_count && !cpus_user) {
+	if (!cpusetsize && !cpus_user) {
 		cpumask_copy(&cpus, cpu_online_mask);
 	} else {
-		if (cpu_count > cpumask_size())
-			cpu_count = cpumask_size();
+		if (cpusetsize > cpumask_size())
+			cpusetsize = cpumask_size();
 
-		ret = copy_from_user(&cpus, cpus_user, cpu_count);
+		ret = copy_from_user(&cpus, cpus_user, cpusetsize);
 		if (ret)
 			return -EFAULT;
 
@@ -347,10 +347,10 @@ arch_initcall_sync(init_hwprobe_vdso_data);
 #endif /* CONFIG_MMU */
 
 SYSCALL_DEFINE5(riscv_hwprobe, struct riscv_hwprobe __user *, pairs,
-		size_t, pair_count, size_t, cpu_count, unsigned long __user *,
+		size_t, pair_count, size_t, cpusetsize, unsigned long __user *,
 		cpus, unsigned int, flags)
 {
-	return do_riscv_hwprobe(pairs, pair_count, cpu_count,
+	return do_riscv_hwprobe(pairs, pair_count, cpusetsize,
 				cpus, flags);
 }
 
diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
index cadf725ef798..026b7645c5ab 100644
--- a/arch/riscv/kernel/vdso/hwprobe.c
+++ b/arch/riscv/kernel/vdso/hwprobe.c
@@ -8,21 +8,21 @@
 #include <vdso/helpers.h>
 
 extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
-			 size_t cpu_count, unsigned long *cpus,
+			 size_t cpusetsize, unsigned long *cpus,
 			 unsigned int flags);
 
 /* Add a prototype to avoid -Wmissing-prototypes warning. */
 int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
-			 size_t cpu_count, unsigned long *cpus,
+			 size_t cpusetsize, unsigned long *cpus,
 			 unsigned int flags);
 
 int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
-			 size_t cpu_count, unsigned long *cpus,
+			 size_t cpusetsize, unsigned long *cpus,
 			 unsigned int flags)
 {
 	const struct vdso_data *vd = __arch_get_vdso_data();
 	const struct arch_vdso_data *avd = &vd->arch_data;
-	bool all_cpus = !cpu_count && !cpus;
+	bool all_cpus = !cpusetsize && !cpus;
 	struct riscv_hwprobe *p = pairs;
 	struct riscv_hwprobe *end = pairs + pair_count;
 
@@ -33,7 +33,7 @@ int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
 	 * masks.
 	 */
 	if ((flags != 0) || (!all_cpus && !avd->homogeneous_cpus))
-		return riscv_hwprobe(pairs, pair_count, cpu_count, cpus, flags);
+		return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
 
 	/* This is something we can handle, fill out the pairs. */
 	while (p < end) {
diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.c b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
index c474891df307..d53e0889b59e 100644
--- a/tools/testing/selftests/riscv/hwprobe/hwprobe.c
+++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
@@ -47,7 +47,7 @@ int main(int argc, char **argv)
 	ksft_test_result(out != 0, "Bad CPU set\n");
 
 	out = riscv_hwprobe(pairs, 8, 1, 0, 0);
-	ksft_test_result(out != 0, "NULL CPU set with non-zero count\n");
+	ksft_test_result(out != 0, "NULL CPU set with non-zero size\n");
 
 	pairs[0].key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR;
 	out = riscv_hwprobe(pairs, 1, 1, &cpus, 0);
diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.h b/tools/testing/selftests/riscv/hwprobe/hwprobe.h
index 721b0ce73a56..e3fccb390c4d 100644
--- a/tools/testing/selftests/riscv/hwprobe/hwprobe.h
+++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.h
@@ -10,6 +10,6 @@
  * contain the call.
  */
 long riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
-		   size_t cpu_count, unsigned long *cpus, unsigned int flags);
+		   size_t cpusetsize, unsigned long *cpus, unsigned int flags);
 
 #endif
diff --git a/tools/testing/selftests/riscv/vector/vstate_prctl.c b/tools/testing/selftests/riscv/vector/vstate_prctl.c
index b348b475be57..8dcd399ef7fc 100644
--- a/tools/testing/selftests/riscv/vector/vstate_prctl.c
+++ b/tools/testing/selftests/riscv/vector/vstate_prctl.c
@@ -1,20 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <sys/prctl.h>
 #include <unistd.h>
-#include <asm/hwprobe.h>
 #include <errno.h>
 #include <sys/wait.h>
 
+#include "../hwprobe/hwprobe.h"
 #include "../../kselftest.h"
 
-/*
- * Rather than relying on having a new enough libc to define this, just do it
- * ourselves.  This way we don't need to be coupled to a new-enough libc to
- * contain the call.
- */
-long riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
-		   size_t cpu_count, unsigned long *cpus, unsigned int flags);
-
 #define NEXT_PROGRAM "./vstate_exec_nolibc"
 static int launch_test(int test_inherit)
 {
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
