Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99949C7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gMN0YSpeXZiRzGu+P24Atikmce4+6C8Ba4Y7hAV8IaA=; b=QAWdjCCiRw8Gqk
	9Mz88ieYivQCGDYH7+7zaOrP3c+3Tzk1dQ1tbeNsXEWl6hxoRvM/o5Cl6zzR7zGWLhJMn/HOJjH3F
	8ce2RKs112vcI0a1sbCVUxfjLzMD9r+/OFSgttfWYkVCzmfxdygibnOfW5ta1nFxH0aQbyeMc7asM
	xmn+6gcM2BkD8k3GPqznGyhMdG9S0CItfsfC0L9GSb+EIC33cSCzQI4cTMQgPSjew5MlCP1LAjUok
	VOsgbIW7L6+1g6JKvnZalYVOdsSRt2kN+SoDveZYP4HFGceJtvVPH7fvG7ZgLvikDVgMnnTloZ22M
	jxRmYoj9bRtE+I6HbduA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbSd-003DZN-PA; Fri, 24 Feb 2023 17:02:19 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbSa-003DCy-TW
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:02:18 +0000
Received: by mail-pj1-x1033.google.com with SMTP id x34so13665919pjj.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jdBCcSWmD/x09vfaLkK8fboQxvooLDnkzeel7XCFY9U=;
        b=bZZevSe2DQytVTGOyFQ2xDnTw4PQL3rigDBvzkiepYBQx/QHxvAQAmL2vOoZX8HUmD
         TXtGgHS6RG0EzPPRNc1AY0KbRvPhnyy1R1qMeUAGqAHlTzpyeauB1qV8Gbu1SN/Zz6E9
         o7UKRmu99/FyIPJmWYe8037CRfiiUausqb7IjxXETTwtCm1MBjjPmHQK0TgZRQsmQ8W1
         PurxMJG2xi94kXD2y/n9Y/VDzhksTH1r6CKgTrSFronmPumFPHyEHimlXQNzEMl/M1zf
         QfnF9MWDYNysGvzdFaTQAjfyMkYrBdYRBezTWS/sr9xVJzgWEj080N/i1aUTHl4W0pb5
         CKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdBCcSWmD/x09vfaLkK8fboQxvooLDnkzeel7XCFY9U=;
        b=jMtqIhA70RuR60lzZm9WEZDAj+W5cUffPd4v273c53L/LFucxYWpDfP0bxti4N6w/V
         e8tW9J38X81XDtWPKYltxtcvszAfFqB3cw2jwVw97VBVYQmYyjl3GCBY5wz2D4Omyxn0
         nV0Pu5lDM6reeNSwzWnElN9C/oh8nED73U2yBGFlIDwzXJUy7fu0zhwdZJX9XcSRBaME
         CrufvW/8cRhUVmVqlFTGslnH+i2Um4JgVrzTHj2FqSl3UoiWOScMXEmF9mstVhlfuOgO
         VCEmv5hcy0pWgeoeoqQupd5EKbOezzIsJcNZSOB2Idy36hdzz/1g13MDwJ5iT0jncTVy
         dTqg==
X-Gm-Message-State: AO0yUKV38zsAFjrGovBI2SA9JlUTnK6OekRihUdQsRWUFmywvg/zJ150
	1hBz7GToS8plwreCyOkt4iQjtvHcsp4l66gw381VR13y0Mo4QDpQzPIkMU0govsxIPMzHrmF4LU
	/yGZ2gbNMd66il/VVKTfk3D4S5ucAg1N2SPMJ5lyBDSlJ0AaqSMoiQq8b8zFW6Run2V8pqpiCG8
	1f3WmDSJQfyA==
X-Google-Smtp-Source: AK7set/VIz4IdFcCcmfDfMawU19KMH70KUxyj7igMRlChX/KsDv5plpD+hAzyc5Oik79mqw8pbV61g==
X-Received: by 2002:a17:902:d4cb:b0:19a:b033:2bb0 with SMTP id o11-20020a170902d4cb00b0019ab0332bb0mr21485385plg.46.1677258136106;
        Fri, 24 Feb 2023 09:02:16 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9234731pls.251.2023.02.24.09.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:02:15 -0800 (PST)
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
	Changbin Du <changbin.du@intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH -next v14 07/19] riscv: Introduce riscv_v_vsize to record size of Vector context
Date: Fri, 24 Feb 2023 17:01:06 +0000
Message-Id: <20230224170118.16766-8-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090216_977910_9DB10DCA 
X-CRM114-Status: GOOD (  16.12  )
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

[guoren@linux.alibaba.com: add has_vector checking]
Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/vector.h |  5 +++++
 arch/riscv/kernel/Makefile      |  1 +
 arch/riscv/kernel/cpufeature.c  |  2 ++
 arch/riscv/kernel/vector.c      | 21 +++++++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 arch/riscv/kernel/vector.c

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index dfe5a321b2b4..692d3ee2d2d3 100644
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
+#define riscv_v_setup_vsize()	 do {} while (0)
 
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
index 4b82a01f5603..e6d53e2e672b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -22,6 +22,7 @@
 #include <asm/processor.h>
 #include <asm/smp.h>
 #include <asm/switch_to.h>
+#include <asm/vector.h>
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
@@ -257,6 +258,7 @@ void __init riscv_fill_hwcap(void)
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
