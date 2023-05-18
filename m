Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5907FC7EE2A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vE/l4yB4ms2V5pqI3X9m+JnWe3bqn22meZww2BJF5iE=; b=NwyJkivpZJ1PHE4pSh3v+ecTxh
	UKp0DPEktfLwFt5zZAj6YG9WNVZVGh7itf7PZ6j1tfnm/AOWEA+CBy1gbYwLl5AtnsucEOo59gLGN
	ZpvU6ABAswTPxkHH+GLbuSev4smXqii180DTB1220FurhCDhl6C/fVL46bc6K+TkeJOuyvU1sY0AK
	xxu9avvxmFMezGSOMpqdmjasFSUh838F8M0gUfTGzBJohwjhoPqNvcn920ooVkyltaxobQVMwxFcG
	qA//BTYPHfZbS/SYGq4ATbsmDZYdRqnxV3x40jj3gI0RTdp16imsvD8LoT2fKdzlTybvQEX9aB5qa
	HTBeSXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhSg-00De0x-12;
	Thu, 18 May 2023 17:30:46 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgNF-00DRD2-2A
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:21:07 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-64388cf3263so1615090b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426860; x=1687018860;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ShTLilbxMyWLUQGoTSAD12rpTJu8sGTqDWBHoo4WTRA=;
        b=j/b6no5b61h4cLD0MeMj8ztuxkCuqZ1vb5Vk1nLx3vXkVHmADEC3+8goQLfitPW88G
         T7v7IlOWLfQAU4HDE1hLFH+ks0ECTVPiOAbOKOmZ/ByDjs3sQjeAyw8wSuoFlkU80/nr
         U59r1B7AE6Ptk9R2mWZC53lvDTxGjhonX8oam9ZxM6MxTNxOMijLfNuOH6qLKNv87wK0
         //CFVLRkh6iSX6gVYNgOcWUgYktjG7fJ8DRGqvkT/ynRkecNTRu3gW3GBJDtq1UR5o53
         SoHriCZykj0bSEBu21oANOp/Sk0CZWAcT35ZfARI/cnySA+9JfJ5lLdcfwtoKADNKVby
         a1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426860; x=1687018860;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ShTLilbxMyWLUQGoTSAD12rpTJu8sGTqDWBHoo4WTRA=;
        b=UbYGXKT3/Sd12E8knOjR9uTjHUJO+HennJ1hCvSc7JDdLy5uoA9TkcjgYxLbN1K+iV
         aDd6uj/Igq2YdufEQFGoL6oGBHM6iB901KjlaDjRrwvgkAX2o9rNRFa9E9RNZH43UBaL
         S6rMGK2zLyGf/9cp5EgWZ1OYp4Cg1ZbHrQI7jXYLIjoAYodUFhpjJ097mhgmx/xUyuzz
         dHZr0Jv1kXVJfdSoGwLOlujWBXGaKsfRXD7firQt7j8tFneoXRpgglNzfq2YpKCpbxFY
         ePZgZBql5jegHDxlOmaX2DeR2B80CTexPxqGD23qHfxuKxv4FUeQsVxLKKgYqsz8/iQN
         kjSQ==
X-Gm-Message-State: AC+VfDz43piaRpSJPohY8slrkrogIoxe5h7SwMA1MQUBwDobW3ngHp/T
	2meLpiKZpT9csT3PoygbLPhJcMdhZ/k7xpoTnYXU9EwTyA+RGssO1IiIGmLz6oEwBjNDKEdF/uJ
	idfRKcaaU+LEL7zDN+wwgz32A9zj+kQbdXOnOOzGUFSFT22dFBwnVKXqAIkCfAJ19Fcw1XUaGhG
	3Uwfiy0n1weR0gp50=
X-Google-Smtp-Source: ACHHUZ7YkWvX/tqItDMFWCkxRS+F2Fxhk5OtrMbd1658dUwowW9yV9Fwym+hly8gnFJ9ny7Oh6doTQ==
X-Received: by 2002:a05:6a00:1a05:b0:64d:88b:a342 with SMTP id g5-20020a056a001a0500b0064d088ba342mr4655900pfv.30.1684426859642;
        Thu, 18 May 2023 09:20:59 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:20:58 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [PATCH -next v20 08/26] riscv: Introduce riscv_v_vsize to record size of Vector context
Date: Thu, 18 May 2023 16:19:31 +0000
Message-Id: <20230518161949.11203-9-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_092105_707246_F4F2C520 
X-CRM114-Status: GOOD (  19.32  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, guoren@linux.alibaba.com, Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, Masahiro Yamada <masahiroy@kernel.org>, vineetg@rivosinc.com, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Vincent Chen <vincent.chen@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, greentime.hu@sifive.com, Heiko Stuebner <heiko.stuebner@vrull.eu>, Li Zhengyu <lizhengyu3@huawei.com>, Andrew Jones <ajones@ventanamicro.com>
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
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Changelog V19:
 - Fix grammar in WARN() (Conor)
Changelog V18:
 - Detect inconsistent VLEN setup on an SMP system (Heiko).
---
 arch/riscv/include/asm/vector.h |  8 ++++++++
 arch/riscv/kernel/Makefile      |  1 +
 arch/riscv/kernel/cpufeature.c  |  2 ++
 arch/riscv/kernel/smpboot.c     |  7 +++++++
 arch/riscv/kernel/vector.c      | 36 +++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)
 create mode 100644 arch/riscv/kernel/vector.c

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 51bb37232943..df3b5caecc87 100644
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
 	return riscv_has_extension_unlikely(RISCV_ISA_EXT_v);
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
