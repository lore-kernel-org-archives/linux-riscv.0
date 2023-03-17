Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092D1C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 11:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qIwxip/Nb/py23AwoXP2Vc6C+qWyQI3i17PUMcCl+Cc=; b=UrclmOfx7rqIYM
	w3lVuPK/UokrEWEHvf86dntwVf86vxqKWIanLllDH0MPBe3pxySASSnbkyUQnaxGytW1zOFDl/M+D
	bHbrIt3ryt5N+B43gIzpgnalKWI8H/bh4xqnfUuVNnM1XDSRv9M8lZWnqift8rnBc4gPcRBSh3yiy
	OQW0Y7xE1e0sa4ZPilkN1cVy6hqOEAUSY9gDZHOHI1dbDH4YxvwFe0qI4aA5xXx9pKCQHsAQIpLt1
	0cRsEmjN0NEw1+mi2ZtWtIUW/F6+2RdbjN8Aekx0WqxKV+fNs6EcuRdg9j0fg4lZiSD5Q//NPi7aI
	LJMB7yqwZPQUht/dj6cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8OO-0025BX-01;
	Fri, 17 Mar 2023 11:37:04 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8OK-0025A2-1x
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 11:37:02 +0000
Received: by mail-pl1-x62f.google.com with SMTP id p20so4964164plw.13
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 04:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679053019;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mt/3vG/fBmUabGwDvQKWLcM8kN7QfVyattaldKY5dpc=;
        b=LxWejpj9SOMiWpIpYiWYNdEHOxUm6m9Czolyet+zZdYF7k4CdPKCq41vR70jhGMYwD
         fx8/3OPNP972jFqgbZebu7y6c8/VmharUze6TxUnWQVpRWVmzZWAkwV0PXil2RivCK2z
         lQg+F5ikZ7Sdy/28uwUneL/zqq/6qj00qEqfs0gSJ4IV8t8iYPGW259i0rlSqMHoXi1L
         RixvP5ZKGsV1hstT/CAKQkJffeYaL2HAMlqWdslffpz8LSPrVZYwjZxxyA2sOPzExxIc
         vV+YCNAoU9GJLla+uetINmOSZrnCmOVpM9d32mbrzUxADGPP9K89vmv66YrHxIBr6u1N
         j2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679053019;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mt/3vG/fBmUabGwDvQKWLcM8kN7QfVyattaldKY5dpc=;
        b=ZoppC8bx02Xq0atTp3gA3r3Gzag9KUlFEpeKJlkfrTkHx4EllZk5IWHoeNiiv/DHCU
         Mmdbh6eusbRo73rusE+PamYkesPMJOYrL2BLb+H6NadE6M7ZNr8g9G5c7Is1D7PPFu3Q
         VTE9DhNU2IJdLZzhPYiUXkjM8aaUcN7E5EXie2H4MGvBIKR0FcViT0eXZEqnfn4f2OdH
         Zva9AY3EUWAPrY1zZLeq76v+VuP9NBHkhYyY6dCICu3gwnawSWpngiGjQJn14EtJiRcU
         TFwdf2snF4emr/bSPot+DS8eIyn9fhVW3HTWbhHRDSsDuCjyQt5YGgvTl+T5NzUGFOcp
         ltHQ==
X-Gm-Message-State: AO0yUKUN7Ya4C3S/EIDGXpLwb7VcrbwlhAlLx7KEZHLjgGGTbpJAk/l+
	rPZNGz1UZpgsz/sT3oGsPlPeZww3+TnCEC41+acnyRaRPe7NrUAxs0vjxL5iGB7LSaSzCWRAkEp
	MSlv5zUbkAcJ/ajckrT19pxjWCEUIPuDkoaCJK52RFIg68jr8iJdQ5rNCM/WnTkUqcC1vTfm7UE
	g5fckJd+a18oR3
X-Google-Smtp-Source: AK7set+rjC4MizyOUPvdKGEDY5pi3DD/eYGiUejRaVsNSQNB//zgC7i1MAy7okqg20XcCdrfoZauww==
X-Received: by 2002:a17:90b:1c02:b0:23b:4f2a:8016 with SMTP id oc2-20020a17090b1c0200b0023b4f2a8016mr8075509pjb.3.1679053019564;
        Fri, 17 Mar 2023 04:36:59 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a2cc500b0023d3845b02bsm1188740pjd.45.2023.03.17.04.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:36:59 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Liao Chang <liaochang1@huawei.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH -next v15 07/19] riscv: Introduce riscv_v_vsize to record size of Vector context
Date: Fri, 17 Mar 2023 11:35:26 +0000
Message-Id: <20230317113538.10878-8-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230317113538.10878-1-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043700_646347_30257185 
X-CRM114-Status: GOOD (  15.92  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

This patch is used to detect the size of CPU vector registers and use
riscv_v_vsize to save the size of all the vector registers. It assumes all
harts has the same capabilities in a SMP system.

Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/vector.h |  5 +++++
 arch/riscv/kernel/Makefile      |  1 +
 arch/riscv/kernel/cpufeature.c  |  2 ++
 arch/riscv/kernel/vector.c      | 21 +++++++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 arch/riscv/kernel/vector.c

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index dfe5a321b2b4..18448e24d77b 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -13,6 +13,9 @@
 #include <asm/hwcap.h>
 #include <asm/csr.h>
 
+extern unsigned long riscv_v_vsize;
+void riscv_v_setup_vsize(void);
+
 static __always_inline bool has_vector(void)
 {
 	return riscv_has_extension_likely(RISCV_ISA_EXT_v);
@@ -31,6 +34,8 @@ static __always_inline void riscv_v_disable(void)
 #else /* ! CONFIG_RISCV_ISA_V  */
 
 static __always_inline bool has_vector(void) { return false; }
+#define riscv_v_vsize (0)
+#define riscv_v_setup_vsize()	 		do {} while (0)
 
 #endif /* CONFIG_RISCV_ISA_V */
 
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 4cf303a779ab..48d345a5f326 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
 
 obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
 obj-$(CONFIG_FPU)		+= fpu.o
+obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_SMP)		+= cpu_ops.o
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index bb1d14e08a0a..265070f0158f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -22,6 +22,7 @@
 #include <asm/processor.h>
 #include <asm/smp.h>
 #include <asm/switch_to.h>
+#include <asm/vector.h>
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
@@ -258,6 +259,7 @@ void __init riscv_fill_hwcap(void)
 	}
 
 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+		riscv_v_setup_vsize();
 		/*
 		 * ISA string in device tree might have 'v' flag, but
 		 * CONFIG_RISCV_ISA_V is disabled in kernel.
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
new file mode 100644
index 000000000000..082baf2a061f
--- /dev/null
+++ b/arch/riscv/kernel/vector.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 SiFive
+ * Author: Andy Chiu <andy.chiu@sifive.com>
+ */
+#include <linux/export.h>
+
+#include <asm/vector.h>
+#include <asm/csr.h>
+
+unsigned long riscv_v_vsize __read_mostly;
+EXPORT_SYMBOL_GPL(riscv_v_vsize);
+
+void riscv_v_setup_vsize(void)
+{
+	/* There are 32 vector registers with vlenb length. */
+	riscv_v_enable();
+	riscv_v_vsize = csr_read(CSR_VLENB) * 32;
+	riscv_v_disable();
+}
+
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
