Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F44ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krxLaHSWHG2K/OFXEJ1UQews1TsrStkgycWUoDubayI=; b=wkHPVA+OfrbVhx
	OqBLF6u7dmm/Irq5NLyNVTFnO8Pcmc/HiXZ1EWyWn1XWWddl83J80SHk7dqfXWQPvR4OJ7+vy4fEP
	caCeuB38RbZOrwnYgUK6p3WeIZq3oDE4poouDAjaaC40nN6vOsSjQa6T3nWppTChe35HcOYl/M+LS
	3SVcB1bwG7gTJCtqAj3Y1N6s/YqlgIqqjTUsZHjWIDmxIF3xqtZatIHCrlVq+v3WvsV/pUDrcBxWs
	szjtpkJE+HMDQPuAAeCbg06qs4H6vBpvU+MirH1YfKhoI+DEpG9DyaEkSM9qn+uVb+rvaRTUvl8bY
	sN3s7xnwTwM7doYA8wGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7ZZ-00ClId-Gt; Wed, 21 Sep 2022 21:48:01 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7ZW-00ClGV-Pi
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 21:48:00 +0000
Received: by mail-pj1-x1030.google.com with SMTP id s14-20020a17090a6e4e00b0020057c70943so175532pjm.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 14:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=olGNKHmEJH+71TMcZkD0ZGQWhJ2EEH99STiEKZ89va4=;
        b=aVq4hID8qEEukk8LuM4VePyf26vjYh9KZTX7mzS9qcDL8PHSNrRR7ZwkZ/XF/AQsV2
         jccmz8kP+YoGi8mSPUG8K/V4PadVsR+EPGhUyQekfq5Q12WZzSzaeWU3gkr7+8R/YUxk
         xBCiLx5/1SCyaiz+I8nY2qGQNTQMe5/4+6quaBcXGgG+3ke/Ia2EYnPnT/lOlwfLWmfW
         YHQccNWKNGyXSk8f8MGgoYC14/ojtaJ/aM1MN7AiO45O/1mIsDDqX+OUeNr2/a9V7hrq
         CxR6BGDofbeTUmFDzfhJBLov7b+fv78xG2X/fBnvVWkGPTeyGCf2gbE+WzAsABcdJTYD
         QxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=olGNKHmEJH+71TMcZkD0ZGQWhJ2EEH99STiEKZ89va4=;
        b=SY7BNSavsd0k9e4QLwLi+XOTqaVpsfiLSAkEZOlcsjFe2GDVkrtjSyuZhOFd0Ia6VE
         pV001NJ357rEvlYNbrAbstb5A86cD+d8rH7TvyJaC4BOz8SkZ3Ct+L6lwnWDiufiHm6Q
         cLovtAuDYxjsPAbzLCM1XL8AeGcYddJq/njiZk0gw5zbw0tqFj+HMN28iCZuFh2Gl7oE
         HzGcWCmZN8IjN/+KddfClrV0o8dE8omli9UFOfhYh9M/cHQQp4SOuETx9nE3TLMp7zjY
         Jocs5iMqurXgB8iCLFVo5RskZ/eBdB6acSgCFjD3jq00oaDF5OjeSf0yljRcBh0iBl1O
         whzw==
X-Gm-Message-State: ACrzQf3jCGuhTivO1EvAaYtRRwF6GpYKXw06Z4zAmTISc/Xiv+NKpzH/
	TPF1mSBHq6eEMNulnUrWAuAZoQ==
X-Google-Smtp-Source: AMsMyM7gHe/KjK5UY39UWIx1gHdtzlkS/LQsxKDnen4yyLCy3GcJ1fJbnq0JpL5vfJJnS/DB+6/vEQ==
X-Received: by 2002:a17:903:244b:b0:178:1c88:4a4c with SMTP id l11-20020a170903244b00b001781c884a4cmr76075pls.95.1663796876749;
        Wed, 21 Sep 2022 14:47:56 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id k7-20020aa79727000000b005484d133127sm2634536pfg.129.2022.09.21.14.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 14:47:56 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: 
Cc: Greentime Hu <greentime.hu@sifive.com>,
	Guo Ren <guoren@linux.alibaba.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Chris Stillson <stillson@rivosinc.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Dao Lu <daolu@rivosinc.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Ruinland Tsai <ruinland.tsai@sifive.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Changbin Du <changbin.du@intel.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Alexander Graf <graf@amazon.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Yury Norov <yury.norov@gmail.com>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Myrtle Shah <gatecat@ds0.me>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	WANG Xuerui <git@xen0n.name>,
	Huacai Chen <chenhuacai@kernel.org>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Peter Collingbourne <pcc@google.com>,
	Colin Cross <ccross@google.com>,
	Eugene Syromiatnikov <esyr@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Barret Rhoden <brho@google.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v12 05/17] riscv: Add has_vector/riscv_vsize to save vector features.
Date: Wed, 21 Sep 2022 14:43:47 -0700
Message-Id: <20220921214439.1491510-5-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921214439.1491510-1-stillson@rivosinc.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_144758_842825_A6800C64 
X-CRM114-Status: GOOD (  21.25  )
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
