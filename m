Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB2FC7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 10:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lNFLYQJw935//vZ+hE6jTyMVdKdlDimOhLg8gWaD+MQ=; b=smD1QETjvWyKCjnP+iz6ADT9it
	2QmLPNzgHHwrE7pK4u4z/rLcim2HTYaGBNuvPm6ivM7Kftm4UB86Sq8fOfQqCjuA5c7KicX0rhdW9
	LM7CBwGzFhVm170/sumL8AfnD4seONPYf+Jy6h6uq/kJdbsKeFVJCp3USIQcpHPuT2uoLYroRnj0z
	7NWWNKSVJDFre+hVlqauaA1ZYeE+fNulrvCA0giayYMRH2atuJBsYayWhucUVO1Tk788hu6kK52uw
	k/GYfX7kv3OVvhQkeqFv9eXLTHSnsdSKaY10LFGVUtP/raoVJ6Nlngiq9UcJlCqKgFeB7Yq+SGA9o
	mwDV3l7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKdY-002tFY-1Y;
	Tue, 09 May 2023 10:32:04 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKdV-002tCR-0W
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:32:02 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1aae5c2423dso55636115ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628320; x=1686220320;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9dNmDeCKcESyJpSC9hlvCfiuj/5kxC6whnLBDBKP6HY=;
        b=WPy8wXShGoaX1y9t3jhDp3KE75uw/Rf+jqMcDW1a0G7RBSV39XZtuKiDv0BkdDH2Zv
         ZIPGHz8CmwuonydaL4Wz9IQ5f1fMoGaeA6PbPldu9bQJTGduODS+O3vjpcPeFgxNK82i
         ucw2ysoQLF321No2wuD6+evKHLcwCkn+qi75XcSJUJg3Y5OAJ6UYJ1ORtB8tiR4wPItC
         /D3sy3sZfOiG316IPz9tVGvrtqd9oG2je4wy/EeAoFYubeJbgm5V97GevW6qXTLRD5E/
         +u4dIHurBoXz91WbHy4WPSIZwCCnJVWuNL23rf/xV58eb3my1sdHmR4A289+nh/Iv+U9
         mEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628320; x=1686220320;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9dNmDeCKcESyJpSC9hlvCfiuj/5kxC6whnLBDBKP6HY=;
        b=iJPohrXglokCHjrkt3I1Jl4tKzzoNwvNNQ89lYZKSk4IXO4AoqTrK8kzUtWgNCN1LX
         e09myVBZIbQ2Qfhch1VdIz7eeoYD+k6nMBL3UtmibLDZ5p9O+Kv9Zd+FQmKEFVEExOXB
         09aH+C5CcawszqHNg64gNVcCgyMDQB/3pC4k8jLTK5+vkIbsujsPL5JQJHFZ6qX0uuix
         ROeuLddYyERmbepXmQeYqc05HkK9hPERmxQSONCQ5i3uTEaU41jcGnbRJxObFb3nL+hb
         PJ5vY6TGMdNaUlbCQLI5/SiTXL3LTdGkkuaYqIvv4zjUYmsErnJJ1+LNmpYhUiCtA5dZ
         7lsA==
X-Gm-Message-State: AC+VfDx5nk7jPX6HAtmvRneFHsKD08bpgYDgIyFypn4ciEytIGa0TIZr
	I+yWL4e10mAeRgtswod8uemKdKVT6VEZ1YnO2xQkkHdRKmkP6ln1Ye13nDk/mn4Sg6c+isPxkcY
	ZverZPITgzSiRucwpplkb1C17aypILkU9W7evq1l9UJmBovyh5rRkLvDHgTCgPAi4azI9QmBhSt
	3peHsqcFGXuEj9
X-Google-Smtp-Source: ACHHUZ6ntCkVRmqN5Oub1N6jZdS/zYP/THEb50rZ/rfC8D5t1e/cxCTvy7NyhdvwRfvBYuvH7NRaSQ==
X-Received: by 2002:a17:902:d304:b0:1a9:21bc:65f8 with SMTP id b4-20020a170902d30400b001a921bc65f8mr14262189plc.11.1683628320059;
        Tue, 09 May 2023 03:32:00 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:31:59 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [PATCH -next v19 08/24] riscv: Introduce riscv_v_vsize to record size of Vector context
Date: Tue,  9 May 2023 10:30:17 +0000
Message-Id: <20230509103033.11285-9-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_033201_201976_1D6B2CF7 
X-CRM114-Status: GOOD (  19.84  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, guoren@linux.alibaba.com, Jisheng Zhang <jszhang@kernel.org>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Atish Patra <atishp@rivosinc.com>, Masahiro Yamada <masahiroy@kernel.org>, vineetg@rivosinc.com, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Vincent Chen <vincent.chen@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Andrew Jones <ajones@ventanamicro.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, Li Zhengyu <lizhengyu3@huawei.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

This patch is used to detect the size of CPU vector registers and use
riscv_v_vsize to save the size of all the vector registers. It assumes all
harts has the same capabilities in a SMP system. If a core detects VLENB
that is different from the boot core, then it warns and turns off V
support for user space.

Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
Changelog V19:
 - Fix grammar in WARN() (Conor)
Changelog V18:
 - Detect inconsistent VLEN setup on an SMP system (Heiko).

 arch/riscv/include/asm/vector.h |  8 ++++++++
 arch/riscv/kernel/Makefile      |  1 +
 arch/riscv/kernel/cpufeature.c  |  2 ++
 arch/riscv/kernel/smpboot.c     |  7 +++++++
 arch/riscv/kernel/vector.c      | 36 +++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)
 create mode 100644 arch/riscv/kernel/vector.c

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index dfe5a321b2b4..68c9fe831a41 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -7,12 +7,16 @@
 #define __ASM_RISCV_VECTOR_H
 
 #include <linux/types.h>
+#include <uapi/asm-generic/errno.h>
 
 #ifdef CONFIG_RISCV_ISA_V
 
 #include <asm/hwcap.h>
 #include <asm/csr.h>
 
+extern unsigned long riscv_v_vsize;
+int riscv_v_setup_vsize(void);
+
 static __always_inline bool has_vector(void)
 {
 	return riscv_has_extension_likely(RISCV_ISA_EXT_v);
@@ -30,7 +34,11 @@ static __always_inline void riscv_v_disable(void)
 
 #else /* ! CONFIG_RISCV_ISA_V  */
 
+struct pt_regs;
+
+static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
 static __always_inline bool has_vector(void) { return false; }
+#define riscv_v_vsize (0)
 
 #endif /* CONFIG_RISCV_ISA_V */
 
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index fbdccc21418a..c51f34c2756a 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -56,6 +56,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
 
 obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
 obj-$(CONFIG_FPU)		+= fpu.o
+obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_SMP)		+= cpu_ops.o
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7aaf92fff64e..28032b083463 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -18,6 +18,7 @@
 #include <asm/hwcap.h>
 #include <asm/patch.h>
 #include <asm/processor.h>
+#include <asm/vector.h>
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
@@ -269,6 +270,7 @@ void __init riscv_fill_hwcap(void)
 	}
 
 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+		riscv_v_setup_vsize();
 		/*
 		 * ISA string in device tree might have 'v' flag, but
 		 * CONFIG_RISCV_ISA_V is disabled in kernel.
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 445a4efee267..66011bf2b36e 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -31,6 +31,8 @@
 #include <asm/tlbflush.h>
 #include <asm/sections.h>
 #include <asm/smp.h>
+#include <uapi/asm/hwcap.h>
+#include <asm/vector.h>
 
 #include "head.h"
 
@@ -169,6 +171,11 @@ asmlinkage __visible void smp_callin(void)
 	set_cpu_online(curr_cpuid, 1);
 	probe_vendor_features(curr_cpuid);
 
+	if (has_vector()) {
+		if (riscv_v_setup_vsize())
+			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
+	}
+
 	/*
 	 * Remote TLB flushes are ignored while the CPU is offline, so emit
 	 * a local TLB flush right now just in case.
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
new file mode 100644
index 000000000000..120f1ce9abf9
--- /dev/null
+++ b/arch/riscv/kernel/vector.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 SiFive
+ * Author: Andy Chiu <andy.chiu@sifive.com>
+ */
+#include <linux/export.h>
+
+#include <asm/vector.h>
+#include <asm/csr.h>
+#include <asm/elf.h>
+#include <asm/bug.h>
+
+unsigned long riscv_v_vsize __read_mostly;
+EXPORT_SYMBOL_GPL(riscv_v_vsize);
+
+int riscv_v_setup_vsize(void)
+{
+	unsigned long this_vsize;
+
+	/* There are 32 vector registers with vlenb length. */
+	riscv_v_enable();
+	this_vsize = csr_read(CSR_VLENB) * 32;
+	riscv_v_disable();
+
+	if (!riscv_v_vsize) {
+		riscv_v_vsize = this_vsize;
+		return 0;
+	}
+
+	if (riscv_v_vsize != this_vsize) {
+		WARN(1, "RISCV_ISA_V only supports one vlenb on SMP systems");
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
