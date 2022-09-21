Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A321ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 16:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EasbZXpNjyPFJcTspq59FynoMbgc09BAUtOvJq9OKpg=; b=Qde9qjz9ZMZoXe
	430yaUDc6nH9NNV1hW+9rqwsH1dh/qh3ejoQVewQAcqdEOq9tE+RvOUL1b3RDcbR3jMbADnfVfolp
	ApSeP3OO0E/yJYfZA1jJh8HpEVhzPDr6MNlcNMHTykeZ0tlkuztVcGiGSD6bYcTaW4OI5pfxe9j6a
	aeWyxo6/3QhLFKDKPrbf5l6qGRPEf7U3eEEvJa4HJ5AkrFbTA0HADfFTKPbQIM678ICFNLTciPUUq
	xVCGL7pfUo/GldYkDeJsiVI3Rk8S9IXetVLLq8ZG/OWmbvOMGTQVZfs0zEJa2m2DrFyArXyDPF5G4
	/4XJN/sblSr3mjzHuNLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2tP-00C2oI-Rb; Wed, 21 Sep 2022 16:48:11 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2tM-00C2kX-7L
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 16:48:09 +0000
Received: by mail-wr1-x435.google.com with SMTP id n15so3950354wrq.5
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=UPPE0WNw9dds50E1SR1uWrRZWS8hSokvrPlI99Jv2ZM=;
        b=OsrPQefhMNudSFxowvYvSAGzIlzsJfb3yMkrGo9uFTgDmOJRb352txkXujKz1WQQFt
         vXk61RRoYWd5bMljF3IFpkd6I3HzPolT41WVY6BZpcXptQl0ICcvCMM18QEWwEcsim1T
         w8Fte6Q5Ca1D6DLhvqh47/JgRpOnNUYIsaM1aI1mgLFgBe7T3aPo9xFRrFTv/2o/h4+Y
         6rYKp52bgfC+lY5Y860IcAyf9ZKL1Ij6hizvJypPQDFl5dd88vzJoRaTXfuwVcWRaMdp
         Bp+Xz6XLNg2AeBINvgAovExnYPR9WrFGWncXxcGURLpYLOzurj/Z47S0xeOHLxFKw2KU
         3v4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=UPPE0WNw9dds50E1SR1uWrRZWS8hSokvrPlI99Jv2ZM=;
        b=Akbw2buOsutQeIkfDLq7vUlJ2ddc6oIDOgEjwUeeByW1oTBhEoMteB5yubM2oHCr/+
         dziExDYm8yiNoAW15ZwtCjG6emMOpc5lZDm15nmXmU0ZxK1KafvQjOIZrfS3X0SUt40c
         KXfoxrEI8j7I/B2lmPD79tc/dU7VPj7M2Of0nBM20mhwc53i/dJsEWvCs3GnpGxJ6JgF
         f5ZAPYkICtVCUdlDrNwjaUMXnWGJRZPAGoNxMCq0uAct3wmlJitb0xkWwPS6ZzrhHTBZ
         d23w0cNmFjIaZA33+mRbUtAIfnaR4jop1vruJfe51OJ1lsTazSdmND/kLMcZqzXSn4aI
         D0cg==
X-Gm-Message-State: ACrzQf2kxcb+chsfNgeqNcZs/xzueR+/Kjh5Mak5wdxdTPqFxQvxdbg6
	rEHJt8aCLrZuQP3IRbUzp24+LvghQkIDCdZnYIS5i8oWCy1TXw==
X-Google-Smtp-Source: AMsMyM7mMm2lVfTRU8X4Qt6FrQipuqjXAQTPMOdPKdBZPGPDtuf5a7vNk/YQuLJd4DOPxvaW5PnrRtHS3p9shmyxV/o=
X-Received: by 2002:a5d:588f:0:b0:22b:623:ad04 with SMTP id
 n15-20020a5d588f000000b0022b0623ad04mr8689581wrf.607.1663778883146; Wed, 21
 Sep 2022 09:48:03 -0700 (PDT)
MIME-Version: 1.0
From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 09:47:27 -0700
Message-ID: <CAM2SziXidEa_Qjj--Wa=Kd9Cjyc4UCen-qggDXAKrkY-gydaLw@mail.gmail.com>
Subject: [PATCH 05/17] riscv: Add has_vector/riscv_vsize to save vector features.
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_094808_287439_87373B96 
X-CRM114-Status: GOOD (  17.25  )
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
@@ -30,6 +30,14 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX)
__read_mostly;

 __ro_after_init DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys,
RISCV_ISA_EXT_KEY_MAX);
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
+       if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+               static_branch_enable(&cpu_hwcap_vector);
+               /* There are 32 vector registers with vlenb length. */
+               rvv_enable();
+               riscv_vsize = csr_read(CSR_VLENB) * 32;
+               rvv_disable();
+       }
+#endif
 }

 #ifdef CONFIG_RISCV_ALTERNATIVE
@@ -328,3 +346,4 @@ void __init_or_module
riscv_cpufeature_patch_func(struct alt_entry *begin,
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
+       li      status, SR_VS
+       csrs    CSR_STATUS, status
+
+       csrr    x_vstart, CSR_VSTART
+       csrr    x_vtype, CSR_VTYPE
+       csrr    x_vl, CSR_VL
+       csrr    x_vcsr, CSR_VCSR
+       vsetvli incr, x0, e8, m8, ta, ma
+       vse8.v   v0, (datap)
+       add     datap, datap, incr
+       vse8.v   v8, (datap)
+       add     datap, datap, incr
+       vse8.v   v16, (datap)
+       add     datap, datap, incr
+       vse8.v   v24, (datap)
+
+       REG_S   x_vstart, RISCV_V_STATE_VSTART(vstatep)
+       REG_S   x_vtype, RISCV_V_STATE_VTYPE(vstatep)
+       REG_S   x_vl, RISCV_V_STATE_VL(vstatep)
+       REG_S   x_vcsr, RISCV_V_STATE_VCSR(vstatep)
+
+       csrc    CSR_STATUS, status
+       ret
+ENDPROC(__vstate_save)
+
+ENTRY(__vstate_restore)
+       li      status, SR_VS
+       csrs    CSR_STATUS, status
+
+       vsetvli incr, x0, e8, m8, ta, ma
+       vle8.v   v0, (datap)
+       add     datap, datap, incr
+       vle8.v   v8, (datap)
+       add     datap, datap, incr
+       vle8.v   v16, (datap)
+       add     datap, datap, incr
+       vle8.v   v24, (datap)
+
+       REG_L   x_vstart, RISCV_V_STATE_VSTART(vstatep)
+       REG_L   x_vtype, RISCV_V_STATE_VTYPE(vstatep)
+       REG_L   x_vl, RISCV_V_STATE_VL(vstatep)
+       REG_L   x_vcsr, RISCV_V_STATE_VCSR(vstatep)
+       vsetvl  x0, x_vl, x_vtype
+       csrw    CSR_VSTART, x_vstart
+       csrw    CSR_VCSR, x_vcsr
+
+       csrc    CSR_STATUS, status
+       ret
+ENDPROC(__vstate_restore)
+
+ENTRY(rvv_enable)
+       li      status, SR_VS
+       csrs    CSR_STATUS, status
+       ret
+ENDPROC(rvv_enable)
+
+ENTRY(rvv_disable)
+       li      status, SR_VS
+       csrc    CSR_STATUS, status
+       ret
+ENDPROC(rvv_disable)
--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
