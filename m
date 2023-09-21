Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7019E71068
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 12:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCOZp3HytZDwL6C91VRmqb9Z1yrlJColEWTjLgBZ0MY=; b=30DXPbeLDcJ1ka
	o14OcsOO3CjWAnUj2u+ED4cKzaIhFqC209b6h8qhM1mBPkzoGgsAFid9tyaPLi81ytD7/9/9L3XcY
	aeEuR1+RIW7W1rEHFLnnAEoB/GbixYBtOII2ugFq4TdR/GI6IMRp4pf0b7M9A7VPJs21VSzIDa3oy
	Y982rBwBzhOvBqG3fiz9UlYUNG/2/Nipa3MoIJkwyKgrSDEH6Lkpz4SZQYnzyTcFMPyXbIuj6sv3D
	fLnDMISaH7We2S2XLlWVngsx78PfC+ufEHcUoLJ35arj4T4nCGcBicDeQhX3R5E89icPkd5tH2OZr
	3fZap0j9wvm03gtN2YSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJDV-0064CF-1h;
	Thu, 21 Sep 2023 12:55:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJDP-0064AN-2V
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Sep 2023 12:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Q+oIJyKJPZPpUnf42HIpb15kf8U6uMVgseCF2hvQLwc=; b=mWSrk5Lj3atJikruOkft9xuSYw
	IXiZ4ZS7FN6YIbwYyHY5MrG1JIt9h5EzJDfZy0yOYW2QEBkzlR8DGvVpkqV/GspgU3kJI6VgIO6ep
	D23GJ3n1T66b6a68kkc/qPgk4RCw/ImkWgi3XVXBqBdsRvGC795g5uPRfcpDVOcsPixVYulUnpFiR
	YpQ6dI6SqikCQ+VUAOD4OfeqeKarMMhVIp6cH6S0TGW91QCS4shG5FH0uH0ehPAJfY+aREi0qbe5h
	bqj29WD9PP6kGs3U3Z6KsQOhHa0zWprZH4Y+VMeNPY96HgaNH1p8tMl6iqedXJKmMnt7N9mvm0/17
	4kcfeqBg==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJDK-00FNnk-0L
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 12:55:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-400a087b0bfso9487125e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 05:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695300924; x=1695905724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+oIJyKJPZPpUnf42HIpb15kf8U6uMVgseCF2hvQLwc=;
        b=hVX5eyvRfKc9qoVdhDTgs32x64CSvZ6JKshUFUNQml4r0v9ERK9aWoy6RrIZgtUe8F
         52cGsG1GX+Yo09bQ9Lpee9NEDcIVJjbaJLcO6mO1copB9ooqAE+Z++makDgtgRfjLsB7
         fft8zE4dsxxyYfIUl0OgLiE2/4FVQj9gPSIku2RFqMDOIJU18UwijCLk1b/u0U7Dm8ur
         HT9cGwnk4RFV50yHPuKaaoE19ypnRyZ+WpeWlrFMj1KdRrF4dJJgABCJ9Bs2AzWeT6Fa
         YtDJO8Nk8QebJezFgrZ1YzDyLxSTaUk0hEF3FdOAfMVoLONrpF4zLhGG2I/lPGkifVVr
         6r8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695300924; x=1695905724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+oIJyKJPZPpUnf42HIpb15kf8U6uMVgseCF2hvQLwc=;
        b=kopI2a/p2gbTx6wEpKdDhhHwxgirpDMJFjIAB5Ky16GeZI767+CRixJmt2zQG5I2XV
         PyAsJb7kIy9Duxo+PVtD85NrD5dA8sgmD4k0tSrWV1hLCP+8KgF6CT1YKp7TSWW0VNah
         lxtNUE5KPFBBV6cx37RbxXshQdN7rPT/qQJqHpLwdbjiHkdepQunkor5wSf3yvCvvkzF
         c8z+6NyemHiDbKEoTXqY5slzgRTmulEKLA5Gfz5Fw+j8p5MsCMTca+GBXMWkMhhjO2fF
         +r7Vlq+jZulwMVHH79KwyXyQihj4s0qy29sL3bOCDehu8EkP7SrMWwSN0lNlMnlu3eWA
         +zlg==
X-Gm-Message-State: AOJu0YwcWuCyx/RSBmAOdBYw4kbQ3cfAkhG3ZOFhnsE6eAYY9uC+8vcn
	9zB1cMugC74ttoKP7ZYU6FubuBeJ5RtpdPEl3AM=
X-Google-Smtp-Source: AGHT+IHWanj+mqdLpxeoavkODffnmK3YPfvk77Fxbnp/+bvqs2MFCxSZRb2x1+Dcnd+bOOq8mV1Few==
X-Received: by 2002:a5d:6309:0:b0:315:8f4f:81b2 with SMTP id i9-20020a5d6309000000b003158f4f81b2mr4216186wru.64.1695300923901;
        Thu, 21 Sep 2023 05:55:23 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id z17-20020adfd0d1000000b00317a04131c5sm1718053wrh.57.2023.09.21.05.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 05:55:23 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [RFC PATCH 3/5] RISC-V: hwprobe: Introduce which-cpus flag
Date: Thu, 21 Sep 2023 14:55:22 +0200
Message-ID: <20230921125518.175428-10-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921125518.175428-7-ajones@ventanamicro.com>
References: <20230921125518.175428-7-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_135527_666570_EF279115 
X-CRM114-Status: GOOD (  24.44  )
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
do this, we implement pair merge and pair compare functions which
take the type of value (a single value vs. a bitmap of booleans) into
consideration. The flow for the which-cpus syscall variant is as
follows:

  1. Merge pairs into a set of pairs with unique keys
  2. If any unknown keys are seen, return an empty set of cpus
  3. If the platform is homogeneous, then check all the pairs
     against the "all cpu" values and return early
  4. Otherwise, check all the pairs against each cpu individually

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/riscv/hwprobe.rst       |  16 ++-
 arch/riscv/include/uapi/asm/hwprobe.h |   3 +
 arch/riscv/kernel/sys_riscv.c         | 148 +++++++++++++++++++++++++-
 3 files changed, 163 insertions(+), 4 deletions(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 132e9acaa8f4..97b1e97e7dd2 100644
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
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 86d08a0e617b..36683307c3e4 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -40,4 +40,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
+/* Flags */
+#define RISCV_HWPROBE_WHICH_CPUS	(1 << 0)
+
 #endif
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 14b6dfaa5d9f..c70a72fe6aee 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -245,14 +245,145 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	}
 }
 
+static bool hwprobe_key_is_map(__s64 key)
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
+static int hwprobe_pair_merge(struct riscv_hwprobe *to,
+			      struct riscv_hwprobe *from)
+{
+	if (to->key != from->key)
+		return -EINVAL;
+
+	if (hwprobe_key_is_map(to->key)) {
+		to->value |= from->value;
+		return 0;
+	}
+
+	return to->value == from->value ? 0 : -EINVAL;
+}
+
+static bool hwprobe_pair_cmp(struct riscv_hwprobe *pair,
+			     struct riscv_hwprobe *other_pair)
+{
+	if (pair->key != other_pair->key)
+		return false;
+
+	if (hwprobe_key_is_map(pair->key))
+		return (pair->value & other_pair->value) == other_pair->value;
+
+	return pair->value == other_pair->value;
+}
+
+static int hwprobe_which_cpus(struct riscv_hwprobe __user *pairs_user,
+			      size_t pair_count, size_t cpusetsize,
+			      cpumask_t *cpus)
+{
+	struct riscv_hwprobe pairs[RISCV_HWPROBE_MAX_KEY + 1] = {
+		[0 ... RISCV_HWPROBE_MAX_KEY] = (struct riscv_hwprobe){ .key = -1 }
+	};
+	struct riscv_hwprobe pair;
+	struct vdso_data *vd = __arch_get_k_vdso_data();
+	struct arch_vdso_data *avd = &vd->arch_data;
+	bool clear_all = false;
+	cpumask_t one_cpu;
+	int cpu, ret;
+	size_t i;
+
+	for (i = 0; i < pair_count; i++) {
+		ret = copy_from_user(&pair, &pairs_user[i], sizeof(pair));
+		if (ret)
+			return -EFAULT;
+
+		if (pair.key >= 0 && pair.key <= RISCV_HWPROBE_MAX_KEY) {
+			if (pairs[pair.key].key == -1) {
+				pairs[pair.key] = pair;
+			} else {
+				ret = hwprobe_pair_merge(&pairs[pair.key], &pair);
+				if (ret)
+					return ret;
+			}
+		} else {
+			pair.key = -1;
+			pair.value = 0;
+			ret = copy_to_user(&pairs_user[i], &pair, sizeof(pair));
+			if (ret)
+				return -EFAULT;
+			clear_all = true;
+		}
+	}
+
+	if (clear_all) {
+		cpumask_clear(cpus);
+		return 0;
+	}
+
+	if (avd->homogeneous_cpus) {
+		for (i = 0; i <= RISCV_HWPROBE_MAX_KEY; i++) {
+			if (pairs[i].key == -1)
+				continue;
+
+			pair.key = pairs[i].key;
+			pair.value = avd->all_cpu_hwprobe_values[pairs[i].key];
+
+			if (!hwprobe_pair_cmp(&pair, &pairs[i])) {
+				cpumask_clear(cpus);
+				return 0;
+			}
+		}
+
+		return 0;
+	}
+
+	cpumask_clear(&one_cpu);
+
+	for_each_cpu(cpu, cpus) {
+		cpumask_set_cpu(cpu, &one_cpu);
+
+		for (i = 0; i <= RISCV_HWPROBE_MAX_KEY; i++) {
+			if (pairs[i].key == -1)
+				continue;
+
+			pair.key = pairs[i].key;
+			pair.value = 0;
+			hwprobe_one_pair(&pair, &one_cpu);
+
+			if (!hwprobe_pair_cmp(&pair, &pairs[i])) {
+				cpumask_clear_cpu(cpu, cpus);
+				break;
+			}
+		}
+
+		cpumask_clear_cpu(cpu, &one_cpu);
+	}
+
+	return 0;
+}
+
 static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
 			    size_t pair_count, size_t cpusetsize,
 			    unsigned long __user *cpus_user,
 			    unsigned int flags)
 {
+	bool which_cpus = false;
+	cpumask_t cpus;
 	size_t out;
 	int ret;
-	cpumask_t cpus;
+
+	if (flags & RISCV_HWPROBE_WHICH_CPUS) {
+		if (!cpusetsize || !cpus_user)
+			return -EINVAL;
+		flags &= ~RISCV_HWPROBE_WHICH_CPUS;
+		which_cpus = true;
+	}
 
 	/* Check the reserved flags. */
 	if (flags != 0)
@@ -274,11 +405,24 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
 		if (ret)
 			return -EFAULT;
 
+		cpumask_and(&cpus, &cpus, cpu_online_mask);
+
+		if (which_cpus) {
+			if (cpumask_empty(&cpus))
+				cpumask_copy(&cpus, cpu_online_mask);
+			ret = hwprobe_which_cpus(pairs, pair_count, cpusetsize, &cpus);
+			if (ret)
+				return ret;
+			ret = copy_to_user(cpus_user, &cpus, cpusetsize);
+			if (ret)
+				return -EFAULT;
+			return 0;
+		}
+
 		/*
 		 * Userspace must provide at least one online CPU, without that
 		 * there's no way to define what is supported.
 		 */
-		cpumask_and(&cpus, &cpus, cpu_online_mask);
 		if (cpumask_empty(&cpus))
 			return -EINVAL;
 	}
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
