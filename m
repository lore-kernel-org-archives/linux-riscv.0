Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2005ECDB474
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 13:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YrcW56lGImWSL4/LduF9yTp4RRRYHZKay0gpZ8Rab0=; b=xhOX5UXap+BRfb
	2ncF8x16iwIABYK2rELHSnCCWwb89dMqUx4y51u+cSOHAP45q9R4dWD1sgJkO1mxBn8kBhqh1TXNe
	EZVSEImAKQ7zOmT872jttJb93Eh4eRyzaB6WhkkYLVanpRqlXaAwugKy9CEJuybtH52BWn/RGBL5q
	bULIevQPjR5/8zUnO3SmtDsv9fgwJe+TLW1at5DNjyyot63RDr1bQjHuVuQt24X0Xss/LgcD8gaDB
	G4fCYqKsmJfLLSOHavbTHX70bE8Be4CzFsmDOgozwQ0E+wEs55YuoTel/Pj9qQ0Gysc3gHoG32iJT
	lO7t0jr2JKhuAXP3VV9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpBy-002JiS-29;
	Fri, 20 Oct 2023 13:05:30 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpBt-002JfU-0i
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 13:05:27 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9ada2e6e75fso121676166b.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 06:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697807123; x=1698411923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LM8hACtikU/O3maCzIhJ1uqgXuXcAz9/fIEHdyRCpsg=;
        b=YHPZ3nljNG5wUcYc50PmEAm+beGtMQkUmu5LAbGqF8/LNF/yeqCqdyLRzxLMQV2km5
         ko7xaC1MDCqf8Tu4XXPGh6Y0ZLxS4RWo0v4toay6fyT2tFeevieaByozIDUtpxwIbjmg
         G8h+WGJCDkYNIHrc58YpFvLY67TrDWhrnY/w8AAym6KDB+P6vTGZUWN6VInCYTZOBWTp
         3npTtzs6kReRspqL11EGZFnu3J7o7xVDPau1tFNFg1M5cvOFjdN+InXlnyHOgJ96hPDp
         +1pH95ZPFjoAl8BcL0JD3HZYaAMr4luV+OqMUz710Dk3M0h4z/t0SOWRIEkrnl+TOmD7
         jeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697807123; x=1698411923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LM8hACtikU/O3maCzIhJ1uqgXuXcAz9/fIEHdyRCpsg=;
        b=NmQ3dTfU1ZAta7FUiXOHfRgfpOUwAA4zrj6r5fzNvEOEzrji1UBy6IWvCgPv4HtXH0
         O3KttJG1z9d9UsqyzX0qgQhs46s9oaWkW4rk9e5jRheBIgLEzbG0LTP+fmNZxMHsgs3y
         pApnNbmWHACfKJqKXvvVN3Y5oYU6Fdt19JEjo1fGEF0XLZ5MP/JF5lpOS+4hF1Hwe+/W
         vvtAeMS1QP18HVNePnw0t9/97NsuSC5ovoo+g4CGZqbMTKPix2rMHWSzxq6q55f2peHM
         ds9bF/La+aCqFvnjQJf/DlaB7XiBVMNYfXpFmFS0gmxqC/bOZCXsODAltKe+Y362acK8
         +RJw==
X-Gm-Message-State: AOJu0Yxvl1izfKNpDpW4LslUS8+ooyQHhT1wV/9ub7kJ9E6JsNdgsRSM
	Bd1XuN28SAchukkJMyx3d9DMKJPs85UtKohKuDE=
X-Google-Smtp-Source: AGHT+IGwteuoCjrkB/zlve6mHnlB82W0enkREeIU6CYYsPGsN2NqvsN+CMV978FdkuQ7GvYZbFaMpQ==
X-Received: by 2002:a17:907:94c3:b0:9b6:8155:cbf2 with SMTP id dn3-20020a17090794c300b009b68155cbf2mr1376791ejc.12.1697807123367;
        Fri, 20 Oct 2023 06:05:23 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id n28-20020a5099dc000000b0053e37d13f4fsm1443551edb.52.2023.10.20.06.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 06:05:22 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v2 3/6] RISC-V: hwprobe: Introduce which-cpus flag
Date: Fri, 20 Oct 2023 15:05:19 +0200
Message-ID: <20231020130515.424577-11-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020130515.424577-8-ajones@ventanamicro.com>
References: <20231020130515.424577-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_060525_276338_F637702D 
X-CRM114-Status: GOOD (  23.71  )
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
 Documentation/riscv/hwprobe.rst       | 17 ++++-
 arch/riscv/include/asm/hwprobe.h      | 24 +++++++
 arch/riscv/include/uapi/asm/hwprobe.h |  3 +
 arch/riscv/kernel/sys_hwprobe.c       | 94 +++++++++++++++++++++++++--
 arch/riscv/kernel/vdso/hwprobe.c      | 80 ++++++++++++++++++++---
 5 files changed, 204 insertions(+), 14 deletions(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index c57437e40ffb..c6c48083d2a9 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -25,8 +25,21 @@ arch, impl), the returned value will only be valid if all CPUs in the given set
 have the same value. Otherwise -1 will be returned. For boolean-like keys, the
 value returned will be a logical AND of the values for the specified CPUs.
 Usermode can supply NULL for ``cpus`` and 0 for ``cpusetsize`` as a shortcut for
-all online CPUs. There are currently no flags, this value must be zero for
-future compatibility.
+all online CPUs. The currently supported flags are:
+
+* :c:macro:`RISCV_HWPROBE_WHICH_CPUS`: This flag basically reverses the behavior
+  of sys_riscv_hwprobe().  Instead of populating the values of keys for a given
+  set of CPUs, the values of each key are given and the set of CPUs is reduced
+  by sys_riscv_hwprobe() to only those which match each of the key-value pairs.
+  How matching is done depends on the key type.  For value-like keys, matching
+  means to be the exact same as the value.  For boolean-like keys, matching
+  means the result of a logical AND of the pair's value with the CPU's value is
+  exactly the same as the pair's value.  Additionally, when ``cpus`` is an empty
+  set, then it is initialized to all online CPUs which fit within it, i.e. the
+  CPU set returned is the reduction of all the online CPUs which can be
+  represented with a CPU set of size ``cpusetsize``.
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
index 76db48516e68..479b79b94781 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -161,10 +161,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
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
@@ -218,6 +218,92 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
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
+	if (cpumask_empty(&cpus))
+		cpumask_copy(&cpus, cpu_online_mask);
+
+	cpumask_and(&cpus, &cpus, cpu_online_mask);
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
index 026b7645c5ab..1e926e4b5881 100644
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
@@ -50,3 +46,71 @@ int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
 
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
+	unsigned char *c = (unsigned char *)cpus;
+	bool empty_cpus = true;
+	bool clear_all = false;
+	int i;
+
+	if (!cpusetsize || !cpus)
+		return -EINVAL;
+
+	for (i = 0; i < cpusetsize; i++) {
+		if (c[i]) {
+			empty_cpus = false;
+			break;
+		}
+	}
+
+	if (empty_cpus || flags != RISCV_HWPROBE_WHICH_CPUS || !avd->homogeneous_cpus)
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
+	if (clear_all) {
+		for (i = 0; i < cpusetsize; i++)
+			c[i] = 0;
+	}
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
