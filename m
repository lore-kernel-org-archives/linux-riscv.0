Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D883DC6FA8E
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krxLaHSWHG2K/OFXEJ1UQews1TsrStkgycWUoDubayI=; b=eElLCtdSnpAORc
	yqpxYJXXzyE7m0J0s9kGwvklFlw9eQy/WlFm1tXTUAocWEtycdWQM2r1ej4Hj9mLCFqx8buV+P9Xd
	z8cZ49CA+dYW240qFCEiYBY4JGLsOhhh/o5sCnz0rKXePg9WR/6wJvRmm18xYD8v2pj8yhEd3ARo6
	Y/DFaQJdXp87+8RGhZ+FC7VBTr+U0sm1BLJq5+gZp+yCsxLBuDCQ9y1XQoT3jDt8m4SNHMkTuwt0l
	RElozS5wELZFA4c8dpAwDYwV+g9h+1O6NTx/kD6T/OOfYHcK2E6oXEdds0rzcJxYfHUbVfVdDJlKz
	w+kNk3vMhyweYHSx8/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob6qi-00CdXW-PZ; Wed, 21 Sep 2022 21:01:40 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5gI-00CUTS-Il
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 19:46:55 +0000
Received: by mail-pg1-x52f.google.com with SMTP id u69so6969821pgd.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 12:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=olGNKHmEJH+71TMcZkD0ZGQWhJ2EEH99STiEKZ89va4=;
        b=Jhai/lQBycqCeaZKKytC5dcjEGuw1kiAaEd1bchwk6HGdcQ3HpqRMf2T1ejYkXFxXa
         0o22hYu+G0dTGcgKP781mpzr5JvRM4t48nGfa+Vehiw61Z9x2cjrZkn5AfafRKHyTRSt
         drkh9FcqveSTKnVu2TunZeZ42tjtk6zr2o2WatgPan9KhhKTK0t/HIBIyYC/WBZfYBB/
         IVjjlnSnYCzWcyc21ZUZJlZLdzj7pMkVFynFVdshGNwXv6AKiHnsi1fahr6hnItR6azH
         U3CbWhRihPvGIw9JimNJRzY3/3VomaqIUSgJahrj+Se8RXtHV8OIouPBkIr3GcRtIKiJ
         xPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=olGNKHmEJH+71TMcZkD0ZGQWhJ2EEH99STiEKZ89va4=;
        b=ULZH/VJe7dSWTKDGBKz99o+oxVBhWvYvr8a6ANX6OxqwiuQjqjNNyS/+kVDdTrM2v1
         XaxEK4DymNCqQrwi+xOwUK/nihcdOu3Cqnlc/AYoQ1rCkdp+d8jq3Hl1C1hmHKGNugcW
         u72JhLuyw1xPiZW/755prAPnP5jPU3Bbds52VWRxF2HlSK9iu7z+1ysfIkCrV0IYJA+v
         t7Y+pyQnT6hYa7MiHXpsHAtEj4Sp7RboLsXDGxqSm2IWWHFiEwMn6z1r2YdnGfzaMOSI
         4MThXz7EXFEpExrYICXnmyAfXDJcHmofMcD/rJTtclY65PouAtGRQLjkthkny5az2NVT
         j1oQ==
X-Gm-Message-State: ACrzQf0n4Q8weD37wlpvFr3KvJODoGf+NRDqyR7zEdjKpgPzLqKsYb0l
	sQ4GgDBcZB7FAISKIaZ1hdDZRdrhSmMG+A==
X-Google-Smtp-Source: AMsMyM5XOje3kvXBjdwOVH4MAxZGyE8guHPwZySvIxkFpNACxKQHTQffYeflalPyk6DBAj7OK1EIPA==
X-Received: by 2002:a05:6a00:1342:b0:545:4d30:eecb with SMTP id k2-20020a056a00134200b005454d30eecbmr30208009pfu.69.1663789608249;
        Wed, 21 Sep 2022 12:46:48 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id o2-20020aa79782000000b0054aa69bc192sm2551057pfp.72.2022.09.21.12.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 12:46:47 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	jpalmer@dabbelt.com,
	kvm-riscv@lists.infradead.org
Cc: Greentime Hu <greentime.hu@sifive.com>,
	Guo Ren <guoren@linux.alibaba.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH 05/17] riscv: Add has_vector/riscv_vsize to save vector features.
Date: Wed, 21 Sep 2022 12:46:17 -0700
Message-Id: <20220921194629.1480202-6-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921194629.1480202-1-stillson@rivosinc.com>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_124650_652015_28D91381 
X-CRM114-Status: GOOD (  18.48  )
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

From: Greentime Hu <greentime.hu@sifive.com>

This patch is used to detect vector support status of CPU and use
riscv_vsize to save the size of all the vector registers. It assumes
all harts has the same capabilities in SMP system.

[guoren@linux.alibaba.com: add has_vector checking]
Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/vector.h | 14 +++++
 arch/riscv/kernel/cpufeature.c  | 19 +++++++
 arch/riscv/kernel/riscv_ksyms.c |  6 +++
 arch/riscv/kernel/vector.S      | 93 +++++++++++++++++++++++++++++++++
 4 files changed, 132 insertions(+)
 create mode 100644 arch/riscv/include/asm/vector.h
 create mode 100644 arch/riscv/kernel/vector.S

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
new file mode 100644
index 000000000000..16304b0c6a6f
--- /dev/null
+++ b/arch/riscv/include/asm/vector.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2020 SiFive
+ */
+
+#ifndef __ASM_RISCV_VECTOR_H
+#define __ASM_RISCV_VECTOR_H
+
+#include <linux/types.h>
+
+void rvv_enable(void);
+void rvv_disable(void);
+
+#endif /* ! __ASM_RISCV_VECTOR_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 8d4448c2d4f4..0487ab19b234 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -30,6 +30,14 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
 __ro_after_init DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
 EXPORT_SYMBOL(riscv_isa_ext_keys);
+#ifdef CONFIG_FPU
+__ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
+#endif
+#ifdef CONFIG_VECTOR
+#include <asm/vector.h>
+__ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_vector);
+unsigned long riscv_vsize __read_mostly;
+#endif
 
 /**
  * riscv_isa_extension_base() - Get base extension word
@@ -249,6 +257,16 @@ void __init riscv_fill_hwcap(void)
 		if (j >= 0)
 			static_branch_enable(&riscv_isa_ext_keys[j]);
 	}
+
+#ifdef CONFIG_VECTOR
+	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+		static_branch_enable(&cpu_hwcap_vector);
+		/* There are 32 vector registers with vlenb length. */
+		rvv_enable();
+		riscv_vsize = csr_read(CSR_VLENB) * 32;
+		rvv_disable();
+	}
+#endif
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
@@ -328,3 +346,4 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	}
 }
 #endif
+}
diff --git a/arch/riscv/kernel/riscv_ksyms.c b/arch/riscv/kernel/riscv_ksyms.c
index 5ab1c7e1a6ed..3489d2a20ca3 100644
--- a/arch/riscv/kernel/riscv_ksyms.c
+++ b/arch/riscv/kernel/riscv_ksyms.c
@@ -15,3 +15,9 @@ EXPORT_SYMBOL(memmove);
 EXPORT_SYMBOL(__memset);
 EXPORT_SYMBOL(__memcpy);
 EXPORT_SYMBOL(__memmove);
+
+#ifdef CONFIG_VECTOR
+#include <asm/vector.h>
+EXPORT_SYMBOL(rvv_enable);
+EXPORT_SYMBOL(rvv_disable);
+#endif
diff --git a/arch/riscv/kernel/vector.S b/arch/riscv/kernel/vector.S
new file mode 100644
index 000000000000..9f7dc70c4443
--- /dev/null
+++ b/arch/riscv/kernel/vector.S
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2017 SiFive
+ * Copyright (C) 2019 Alibaba Group Holding Limited
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#include <linux/linkage.h>
+
+#include <asm/asm.h>
+#include <asm/csr.h>
+#include <asm/asm-offsets.h>
+
+#define vstatep  a0
+#define datap    a1
+#define x_vstart t0
+#define x_vtype  t1
+#define x_vl     t2
+#define x_vcsr   t3
+#define incr     t4
+#define status   t5
+
+ENTRY(__vstate_save)
+	li      status, SR_VS
+	csrs    CSR_STATUS, status
+
+	csrr    x_vstart, CSR_VSTART
+	csrr    x_vtype, CSR_VTYPE
+	csrr    x_vl, CSR_VL
+	csrr    x_vcsr, CSR_VCSR
+	vsetvli incr, x0, e8, m8, ta, ma
+	vse8.v   v0, (datap)
+	add     datap, datap, incr
+	vse8.v   v8, (datap)
+	add     datap, datap, incr
+	vse8.v   v16, (datap)
+	add     datap, datap, incr
+	vse8.v   v24, (datap)
+
+	REG_S   x_vstart, RISCV_V_STATE_VSTART(vstatep)
+	REG_S   x_vtype, RISCV_V_STATE_VTYPE(vstatep)
+	REG_S   x_vl, RISCV_V_STATE_VL(vstatep)
+	REG_S   x_vcsr, RISCV_V_STATE_VCSR(vstatep)
+
+	csrc	CSR_STATUS, status
+	ret
+ENDPROC(__vstate_save)
+
+ENTRY(__vstate_restore)
+	li      status, SR_VS
+	csrs    CSR_STATUS, status
+
+	vsetvli incr, x0, e8, m8, ta, ma
+	vle8.v   v0, (datap)
+	add     datap, datap, incr
+	vle8.v   v8, (datap)
+	add     datap, datap, incr
+	vle8.v   v16, (datap)
+	add     datap, datap, incr
+	vle8.v   v24, (datap)
+
+	REG_L   x_vstart, RISCV_V_STATE_VSTART(vstatep)
+	REG_L   x_vtype, RISCV_V_STATE_VTYPE(vstatep)
+	REG_L   x_vl, RISCV_V_STATE_VL(vstatep)
+	REG_L   x_vcsr, RISCV_V_STATE_VCSR(vstatep)
+	vsetvl  x0, x_vl, x_vtype
+	csrw    CSR_VSTART, x_vstart
+	csrw    CSR_VCSR, x_vcsr
+
+	csrc	CSR_STATUS, status
+	ret
+ENDPROC(__vstate_restore)
+
+ENTRY(rvv_enable)
+	li      status, SR_VS
+	csrs    CSR_STATUS, status
+	ret
+ENDPROC(rvv_enable)
+
+ENTRY(rvv_disable)
+	li      status, SR_VS
+	csrc	CSR_STATUS, status
+	ret
+ENDPROC(rvv_disable)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
