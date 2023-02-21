Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410FDC61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 20:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kiWU1swhA1KCCRCfn1S+tuT2jniDLKuWndv7Ihw09E=; b=KC6CuEUXgBz5zN
	QKieDZ233skiR1osL+1HdBHanMWtAv5vW/SSlEHqgknm5EryM28PVmZojbwXRIit20l3tgCuwhPwf
	BE1N0tXz55Li2oCaGReEUy1qs0db4sIJsJA7tCSlVpaPH3+0HK8ZE6/y0D0cKMmwcUPduCIV4ZtLh
	dbsxMLjUQHwjwHrZfBcXOPVKo7oLDkE46diqFS/N2CyaOa1uxHbQsL6NCN9YPiggwc2gaYkGm/mxW
	aUY2txot57tzwvUh6H3mPbkRj7gYaM68n08QgtGMnJvRW3ANsJ4nFJ+YS6FtUc95/hwdzyj7VmxcP
	eFEFUunOagjWy3Gexk3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUYqg-009dTO-Be; Tue, 21 Feb 2023 20:02:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUYqf-009dSj-BZ
	for linux-riscv@bombadil.infradead.org; Tue, 21 Feb 2023 20:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KbdXcY/cyfsn3vuj+G9y8VbBmqDYFOwE9fF3Bt0phIY=; b=TZn7/Ano+thW5b2nSD9U3CDcbF
	wHvkTkpGWiytNHexyI3qVVgpzlgN3q1fOS5Li5iQhTqAO1LaOWryVqodPubFaxGJs8FJfQyoTCdtS
	gUezcUD29U1EmTwYLC545Oty4phythyakMh30KZ/wmfr2FfPLlijtoz+cpulBFsp4SHWmzneqmpD6
	KAa9z2EZPpvQGlCCZ7xHb0hSUzloLOjc/o42IsbiSXU9wtqQhGiHK+6mTnb7f9lAyz08+S+3T7Urs
	c3meWuBYfao4GqhFBIFOr7KgOedOqa7mhuHpEUX2o4NPy1nsI+IHkMMI8jJomqhJf6gj9JOIq3ZLT
	KSmEIcog==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pUY1L-00CGXi-0M
	for linux-riscv@lists.infradead.org;
	Tue, 21 Feb 2023 19:09:49 +0000
Received: by mail-pj1-x1034.google.com with SMTP id d1-20020a17090a3b0100b00229ca6a4636so6252718pjc.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 11:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbdXcY/cyfsn3vuj+G9y8VbBmqDYFOwE9fF3Bt0phIY=;
        b=csHRX7enYMnjCMTP6woBc7E2NOR8kXQNGrxRlxwRA8LYFRm+dEXDW8b5XJRYkt2T2i
         Ahe5pRPhESqNItcsWgXWfbKdy+PLMavIffxoF9BJBL/P2snpZ3JDeACBsw5ajcZKn+ac
         78mpOZYXwyOEEQxOJrhICXEKjksghXtqu8vtE5kq2ubGy9KRD/HNngW+RedQK7TS43Z4
         i8Q1lrLQhnDsHVqQvyOtaCFPL+PBFup/ns3XMrGJYw84HO49GX1ZI5I9tglYnSfoj2HF
         WzKyhZK2MY4ut9Nxd1bPPkfXLI0Sm1k/aBGYKAfqaS7ZhYgK7U+D4M1x3szK7S6lD3q3
         0Big==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbdXcY/cyfsn3vuj+G9y8VbBmqDYFOwE9fF3Bt0phIY=;
        b=rahSmaADtzvOmxhy9rl9kAhl9vlKf4mmyuB/SH/9F98aK5XTLMrng+9FRLgYph1WgA
         gL0uyilxf+XqIP1fL8t9YOovLHaKGIHeR/PeMNT4XmIpN7NBf9DoO2sMGplmQdWSo+mp
         icBTvhfrZQfr/YhQEKd4IHSE/7cSFiQHdazV0JJc96tmEYRFM+/6YMDGP9N1Iz2/Q7wD
         IMi0aXAi97mQrlqBRRHq9aELebQ7zzPfdwOhOuFxBYlm1evJqnEZCctIELiFoKM2tN7J
         8OtCFXwQ1I5u0dMMG2Ptcm0lfmEd05lYw6d2JaZQtUdupWmkHwbiyCMViAMTmpXXrEZd
         W4WA==
X-Gm-Message-State: AO0yUKU4Bo/RyKwmMNwtnG7i8Hbba/bmiYxuLC06lpdK7w+W6Qd8ts07
	zDtivmfz/pwwUMHo7K082o85Eg==
X-Google-Smtp-Source: AK7set+CUfGR7RzYMxrKACaqDuulcLWJqPhKwae9FboX5nBwOxKMOGYrVNogiJZ/96Az5zrb0+nl3g==
X-Received: by 2002:a17:903:24e:b0:198:b99c:f6ee with SMTP id j14-20020a170903024e00b00198b99cf6eemr8941360plh.65.1677006584803;
        Tue, 21 Feb 2023 11:09:44 -0800 (PST)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id b16-20020a170902b61000b0019602b2c00csm1583863pls.175.2023.02.21.11.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:09:44 -0800 (PST)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: heiko@sntech.de,
	Conor Dooley <conor@kernel.org>,
	slewis@rivosinc.com,
	vineetg@rivosinc.com,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Celeste Liu <coelacanthus@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 7/7] RISC-V: Add hwprobe vDSO function and data
Date: Tue, 21 Feb 2023 11:08:58 -0800
Message-Id: <20230221190858.3159617-8-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221190858.3159617-1-evan@rivosinc.com>
References: <20230221190858.3159617-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_190947_348694_A80469BF 
X-CRM114-Status: GOOD (  29.49  )
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

Changes in v3:
 - Introduced vDSO function


One aspect of this that's less than perfect is that there are two copies
of the arch_vdso_data in the data page. This stems from the fact that
vdso_data is arrayed by CS_BASES. Since we're very far away from filling
up the page, and this is not ABI, I left it for now. If things get full
we can move this data out to its own page, or refactor vdso_data
tree-wide to allow for non-arrayed data.

---
 arch/riscv/Kconfig                   |  1 +
 arch/riscv/include/asm/vdso/data.h   | 17 ++++++++++
 arch/riscv/kernel/sys_riscv.c        | 41 ++++++++++++++++++++++++
 arch/riscv/kernel/vdso/Makefile      |  2 ++
 arch/riscv/kernel/vdso/hwprobe.c     | 47 ++++++++++++++++++++++++++++
 arch/riscv/kernel/vdso/sys_hwprobe.S | 15 +++++++++
 arch/riscv/kernel/vdso/vdso.lds.S    |  1 +
 7 files changed, 124 insertions(+)
 create mode 100644 arch/riscv/include/asm/vdso/data.h
 create mode 100644 arch/riscv/kernel/vdso/hwprobe.c
 create mode 100644 arch/riscv/kernel/vdso/sys_hwprobe.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e2b656043abf..218e75975a15 100644
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
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index afc1b96d5c1a..113b3d97c8cc 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -14,6 +14,7 @@
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
 #include <asm-generic/mman-common.h>
+#include <vdso/vsyscall.h>
 
 static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 			   unsigned long prot, unsigned long flags,
@@ -242,6 +243,46 @@ int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs, long pair_count,
 
 }
 
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
 SYSCALL_DEFINE5(riscv_hwprobe, uintptr_t, pairs, uintptr_t, pair_count,
 		uintptr_t, cpu_count, uintptr_t, cpus, uintptr_t, flags)
 {
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 06e6b27f3bcc..107fd2162cdf 100644
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
diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
new file mode 100644
index 000000000000..1792d6c30c97
--- /dev/null
+++ b/arch/riscv/kernel/vdso/hwprobe.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2023 Rivos, Inc
+ */
+
+#include <linux/types.h>
+#include <vdso/datapage.h>
+#include <vdso/helpers.h>
+
+extern int riscv_hwprobe(struct riscv_hwprobe *pairs, long pair_count,
+			 long cpu_count, unsigned long *cpus,
+			 unsigned long flags);
+
+int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, long pair_count,
+			 long cpu_count, unsigned long *cpus,
+			 unsigned long flags)
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
index 000000000000..2511c8ba8f86
--- /dev/null
+++ b/arch/riscv/kernel/vdso/sys_hwprobe.S
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2022 Rivos, Inc */
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
index 150b1a572e61..dfe63fb71041 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -75,6 +75,7 @@ VERSION
 #endif
 		__vdso_getcpu;
 		__vdso_flush_icache;
+		__vdso_riscv_hwprobe;
 	local: *;
 	};
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
