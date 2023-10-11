Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AB4CD6E73
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 13:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idgGtB5DblV8WnsMPRu8YWAp57fZFKZAeAYlHL9jW98=; b=axHTi4F9DNWGej
	eK/Nb4yINvZZz5cVIT4rXsROXBzp04JLXb72AtsVRDqR5PJJhJLSslqvVQ8a4oxTz2HYcou8XDGtR
	qYYSRv8hIIMozzatCsIJnfBdFuFewLy86Aaw/4NJiZ6r7ItJk6sgVqNkLjEkTUsLecz1nVWnoZFJh
	VvVIWw0x09BDT0SeikKaQFCcUIkY+o6toN0YV18cwIdvZ0XGybNVKyVTsqovdTe9gP4orp68Ke0xT
	G9OPa+o/w40bE0HaBJbDni3bBQdVTEURdvmMgtxHyCpcS0AQ/1FByckxpvO5Z2RfZkibuvp/OZsEK
	K0qKgjuKhJbzUaYVNhdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZhH-00G20e-2z;
	Wed, 11 Oct 2023 13:56:23 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZhE-00G1wk-0a
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 13:56:22 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-307d58b3efbso6063067f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 06:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697032575; x=1697637375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNAa7mG5naS9GCQV651SBDMESpVNN7lY/GISIq2k5Zs=;
        b=Ic/e2YRM2ymrrwGNlNu6/jJwfEdLv1Lu7Eq7uJvDsiokIbQjY1LUuTl064aHLr7FXp
         LnPjF4GnqEWe8Ih6iL33lfAMb3Ejil9Y/WdTj0aNQiTdPBDozG4xB856O9kXv/rCLFp8
         jIe77KvNOlQDk0QKQOLPR5/civkK5JsmibCAaV5P+7ncRPuOKtf4KHhBPkjUuwHGkDJS
         /6D0B3AnmCTQyoh6ocRzz/j4aVZHSXI0CwGpR6DjSH3+jv/Y0MGT3kWOkgFr4xtpFG/s
         2v/HvJ2g96BwQlg0Dubi4Y+fvtB1Kv1y3Za8vcTt0nfJHNWJfDmW5Mo59VW+9KICYYbZ
         se8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697032575; x=1697637375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNAa7mG5naS9GCQV651SBDMESpVNN7lY/GISIq2k5Zs=;
        b=ggl0rAb7aWkkUNCAqVR9jxWCD36L68bMqwpu35u6F3xScsLowwxxHS8Joghds+odkw
         /pKIbKbdRaqQSRP+o0Fu8YtGq6FIKVXGnpCPGr0ETBSo2Y5nQPhBqf9rQDErO0kzIUXb
         gxgao0lrPGmwavVmL3XrBMrp4/e1AFlZILTVoWmcZd3MjVtov6l2/DPsnUv2HfT7L1o1
         DzI2miTpJDHLXDJinbzIe/ImKhK0fioNJqt8qJqR18mZLQhAdtvKlc9m9ks5BAqrKagT
         E2v8CIj6F2CxDXP/w9viNVQGoUYK6colZ1KAa2Zi6sE9V5NXmyaNq0IQlWWrvGOM9koq
         QGCw==
X-Gm-Message-State: AOJu0YzNVtVKrNby1nUFTSBNvYzjLuo6qa20bMjMjqelyyXw4uCqdTMv
	GuQQ7xA2mA8VAzoLsvbSC6GGGgC0EzCgwPBLCb0=
X-Google-Smtp-Source: AGHT+IGeQUuD2vR7prEMTCqSyFhSgnus1h/+P3/AJA+psTQhMPzVu/ulpHIMte3Lxks03FDR4NCA2w==
X-Received: by 2002:adf:a387:0:b0:32d:8894:6aa2 with SMTP id l7-20020adfa387000000b0032d88946aa2mr1243785wrb.2.1697032575506;
        Wed, 11 Oct 2023 06:56:15 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ce9-20020a5d5e09000000b0032d687fd9d0sm3974402wrb.19.2023.10.11.06.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 06:56:15 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v1 3/6] RISC-V: hwprobe: Introduce which-cpus flag
Date: Wed, 11 Oct 2023 15:56:14 +0200
Message-ID: <20231011135610.122850-11-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011135610.122850-8-ajones@ventanamicro.com>
References: <20231011135610.122850-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_065620_228469_246D3BE5 
X-CRM114-Status: GOOD (  23.69  )
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

Introduce the first flag for the hwprobe syscall. The flag basically
reverses its behavior, i.e. instead of populating the values of keys
for a given set of cpus, the set of cpus after the call is the result
of finding a set which supports the values of the keys. In order to
do this, we implement a pair compare function which takes the type of
value (a single value vs. a bitmask of booleans) into consideration.
We also implement vdso support for the new flag.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/riscv/hwprobe.rst       | 16 ++++-
 arch/riscv/include/asm/hwprobe.h      | 24 +++++++
 arch/riscv/include/uapi/asm/hwprobe.h |  3 +
 arch/riscv/kernel/sys_hwprobe.c       | 93 +++++++++++++++++++++++++--
 arch/riscv/kernel/vdso/hwprobe.c      | 68 +++++++++++++++++---
 5 files changed, 190 insertions(+), 14 deletions(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index c57437e40ffb..576aa03f56bb 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -25,8 +25,20 @@ arch, impl), the returned value will only be valid if all CPUs in the given set
 have the same value. Otherwise -1 will be returned. For boolean-like keys, the
 value returned will be a logical AND of the values for the specified CPUs.
 Usermode can supply NULL for ``cpus`` and 0 for ``cpusetsize`` as a shortcut for
-all online CPUs. There are currently no flags, this value must be zero for
-future compatibility.
+all online CPUs. The currently supported flags are:
+
+* :c:macro:`RISCV_HWPROBE_WHICH_CPUS`: This flag basically reverses the behavior
+  of sys_riscv_hwprobe().  Instead of populating the values of keys for a given
+  set of CPUs, the set of CPUs is initially all unset and the values of each key
+  are given.  Upon return, the CPUs which all match each of the given key-value
+  pairs are set in ``cpus``.  How matching is done depends on the key type.  For
+  value-like keys, matching means to be the exact same as the value.  For
+  boolean-like keys, matching means the result of a logical AND of the pair's
+  value with the CPU's value is exactly the same as the pair's value.  ``cpus``
+  may also initially have set bits, in which case the bits of any CPUs which do
+  not match the pairs will be cleared, but no other bits will be set.
+
+All other flags are reserved for future compatibility and must be zero.
 
 On success 0 is returned, on failure a negative error code is returned.
 
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 7cad513538d8..a68764149e51 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -15,4 +15,28 @@ static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 	return key >= 0 && key <= RISCV_HWPROBE_MAX_KEY;
 }
 
+static inline bool hwprobe_key_is_bitmask(__s64 key)
+{
+	switch (key) {
+	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
+	case RISCV_HWPROBE_KEY_IMA_EXT_0:
+	case RISCV_HWPROBE_KEY_CPUPERF_0:
+		return true;
+	}
+
+	return false;
+}
+
+static inline bool riscv_hwprobe_pair_cmp(struct riscv_hwprobe *pair,
+					  struct riscv_hwprobe *other_pair)
+{
+	if (pair->key != other_pair->key)
+		return false;
+
+	if (hwprobe_key_is_bitmask(pair->key))
+		return (pair->value & other_pair->value) == other_pair->value;
+
+	return pair->value == other_pair->value;
+}
+
 #endif
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 006bfb48343d..1d4134befc48 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -38,4 +38,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
+/* Flags */
+#define RISCV_HWPROBE_WHICH_CPUS	(1 << 0)
+
 #endif
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 69ad5f793374..de294538ca25 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -166,10 +166,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	}
 }
 
-static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
-			    size_t pair_count, size_t cpusetsize,
-			    unsigned long __user *cpus_user,
-			    unsigned int flags)
+static int hwprobe_get_values(struct riscv_hwprobe __user *pairs,
+			      size_t pair_count, size_t cpusetsize,
+			      unsigned long __user *cpus_user,
+			      unsigned int flags)
 {
 	size_t out;
 	int ret;
@@ -223,6 +223,91 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
 	return 0;
 }
 
+static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
+			    size_t pair_count, size_t cpusetsize,
+			    unsigned long __user *cpus_user,
+			    unsigned int flags)
+{
+	cpumask_t cpus, one_cpu;
+	bool clear_all = false;
+	size_t i;
+	int ret;
+
+	if (flags != RISCV_HWPROBE_WHICH_CPUS)
+		return -EINVAL;
+
+	if (!cpusetsize || !cpus_user)
+		return -EINVAL;
+
+	if (cpusetsize > cpumask_size())
+		cpusetsize = cpumask_size();
+
+	ret = copy_from_user(&cpus, cpus_user, cpusetsize);
+	if (ret)
+		return -EFAULT;
+
+	cpumask_and(&cpus, &cpus, cpu_online_mask);
+	if (cpumask_empty(&cpus))
+		cpumask_copy(&cpus, cpu_online_mask);
+
+	cpumask_clear(&one_cpu);
+
+	for (i = 0; i < pair_count; i++) {
+		struct riscv_hwprobe pair, tmp;
+		int cpu;
+
+		ret = copy_from_user(&pair, &pairs[i], sizeof(pair));
+		if (ret)
+			return -EFAULT;
+
+		if (!riscv_hwprobe_key_is_valid(pair.key)) {
+			clear_all = true;
+			pair = (struct riscv_hwprobe){ .key = -1, };
+			ret = copy_to_user(&pairs[i], &pair, sizeof(pair));
+			if (ret)
+				return -EFAULT;
+		}
+
+		if (clear_all)
+			continue;
+
+		tmp = (struct riscv_hwprobe){ .key = pair.key, };
+
+		for_each_cpu(cpu, &cpus) {
+			cpumask_set_cpu(cpu, &one_cpu);
+
+			hwprobe_one_pair(&tmp, &one_cpu);
+
+			if (!riscv_hwprobe_pair_cmp(&tmp, &pair))
+				cpumask_clear_cpu(cpu, &cpus);
+
+			cpumask_clear_cpu(cpu, &one_cpu);
+		}
+	}
+
+	if (clear_all)
+		cpumask_clear(&cpus);
+
+	ret = copy_to_user(cpus_user, &cpus, cpusetsize);
+	if (ret)
+		return -EFAULT;
+
+	return 0;
+}
+
+static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
+			    size_t pair_count, size_t cpusetsize,
+			    unsigned long __user *cpus_user,
+			    unsigned int flags)
+{
+	if (flags & RISCV_HWPROBE_WHICH_CPUS)
+		return hwprobe_get_cpus(pairs, pair_count, cpusetsize,
+					cpus_user, flags);
+
+	return hwprobe_get_values(pairs, pair_count, cpusetsize,
+				  cpus_user, flags);
+}
+
 #ifdef CONFIG_MMU
 
 static int __init init_hwprobe_vdso_data(void)
diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
index 026b7645c5ab..e6c324d64544 100644
--- a/arch/riscv/kernel/vdso/hwprobe.c
+++ b/arch/riscv/kernel/vdso/hwprobe.c
@@ -3,6 +3,7 @@
  * Copyright 2023 Rivos, Inc
  */
 
+#include <linux/string.h>
 #include <linux/types.h>
 #include <vdso/datapage.h>
 #include <vdso/helpers.h>
@@ -11,14 +12,9 @@ extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
 			 size_t cpusetsize, unsigned long *cpus,
 			 unsigned int flags);
 
-/* Add a prototype to avoid -Wmissing-prototypes warning. */
-int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
-			 size_t cpusetsize, unsigned long *cpus,
-			 unsigned int flags);
-
-int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
-			 size_t cpusetsize, unsigned long *cpus,
-			 unsigned int flags)
+static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
+				 size_t cpusetsize, unsigned long *cpus,
+				 unsigned int flags)
 {
 	const struct vdso_data *vd = __arch_get_vdso_data();
 	const struct arch_vdso_data *avd = &vd->arch_data;
@@ -50,3 +46,59 @@ int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
 
 	return 0;
 }
+
+static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size_t pair_count,
+			       size_t cpusetsize, unsigned long *cpus,
+			       unsigned int flags)
+{
+	const struct vdso_data *vd = __arch_get_vdso_data();
+	const struct arch_vdso_data *avd = &vd->arch_data;
+	struct riscv_hwprobe *p = pairs;
+	struct riscv_hwprobe *end = pairs + pair_count;
+	bool clear_all = false;
+
+	if (!cpusetsize || !cpus)
+		return -EINVAL;
+
+	if (flags != RISCV_HWPROBE_WHICH_CPUS || !avd->homogeneous_cpus)
+		return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
+
+	while (p < end) {
+		if (riscv_hwprobe_key_is_valid(p->key)) {
+			struct riscv_hwprobe t = {
+				.key = p->key,
+				.value = avd->all_cpu_hwprobe_values[p->key],
+			};
+
+			if (!riscv_hwprobe_pair_cmp(&t, p))
+				clear_all = true;
+		} else {
+			clear_all = true;
+			p->key = -1;
+			p->value = 0;
+		}
+		p++;
+	}
+
+	if (clear_all)
+		memset(cpus, 0, cpusetsize);
+
+	return 0;
+}
+
+/* Add a prototype to avoid -Wmissing-prototypes warning. */
+int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
+			 size_t cpusetsize, unsigned long *cpus,
+			 unsigned int flags);
+
+int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
+			 size_t cpusetsize, unsigned long *cpus,
+			 unsigned int flags)
+{
+	if (flags & RISCV_HWPROBE_WHICH_CPUS)
+		return riscv_vdso_get_cpus(pairs, pair_count, cpusetsize,
+					   cpus, flags);
+
+	return riscv_vdso_get_values(pairs, pair_count, cpusetsize,
+				     cpus, flags);
+}
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
