Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AF5C77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 16:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zTY0kX/7DpaF+YLS6mHBrPVEn1p/4PSwymvcyWiUPgc=; b=kqNxcfkRUbJfou
	l+VpS5ZruHuH5tAGh+0HREy8ww4PsrGum5q/GasN0mrGoUKKJ7LAd5DbrwNL/otNqAPgo8OYwgCyV
	AA9XqaiNZofVi6wKS7bDPDW1dkmv4omjaMbfDUjDni1exw+5vmXnjctXUSPjTi3LSaSAUEf90ysX+
	G5g7ZOrQ1IDbHbopaLPQxQIkAUTqJmrJoX2ZXDsnc2lveyzTTfrFkWLD4ShyOQDDfD7hSRGbfLx82
	MT0nx803BG+Q/NUeEIiWJ5vUUPnM3ZXmsI3frugKwuM6+FG+5QTgRSOxS14EiGbt6qfWnUAKzP6B3
	Xx+Uhv3K274GAiJEheUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgMd-00DQty-1Y;
	Thu, 18 May 2023 16:20:27 +0000
Received: from mail-pf1-f169.google.com ([209.85.210.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgMa-00DQqt-25
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:20:26 +0000
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-643bb9cdd6eso2375060b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426822; x=1687018822;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QTuL2uiI0oFuPEE6djzm9/PdbC+T6hk/9J64Mz+FPUg=;
        b=atqqhQ6bg0qzbUUjo5+wTqp1lCQJlJSArV+/esa+5v4VQwmaTHLCfewsvdyo352GBl
         ON0OeJ+GgvVpDUQq+u1C2xFIAnTXoGbFseX5aYMObIwNUovL25NUjTlllQbf93U5NY6l
         gMe7Sz50/E+2ZZjaYonWe/T0NMfLOOrBlfQuET+fmtb+Nv8Rw6avvoXyKaVYtBS7MT5P
         9pCEMTeJLNoRTpajPDJySCUqGjmPqrVvysYicCrPfDXGjyABcAJHMjfPYXdpK/lNPYVc
         jc3qBoLbMq0jBal1io27SGE4igdkOpSBHLpFMJxhqftslmgnWfQR4RM23lDDjoiPRii+
         E6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426822; x=1687018822;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QTuL2uiI0oFuPEE6djzm9/PdbC+T6hk/9J64Mz+FPUg=;
        b=gQLZOyB80MlAExwj4cwIIvay9S34JyhgoI+UN9hN3tjXJMG4wqj5ywudWICB+xMWx6
         Hzp77r/ChlY07kywGfQI+DRxLkAt4pNJkEBomSyklqc1LfwGd6uB+YSGxBqs2Pd4WUBO
         URMgju0rvKICzYKodrK0ZV3YRcLGISOUw3HPYqWyVF/mmGvsCj/6KVCdVWq6TNu5nJ7I
         7FlA4y1DylsaYlTEqHfavufn1hLBjdmmkjsvT6bKHprUoYN9QcD8iTLWpiWIeP2BcVNZ
         nL3P3pvo6HHYN26EnGPmiLAMQJVHiO9PGcVBeaiwgnlI29YltTKcAJb3F5QcTSvZxXq1
         TBNg==
X-Gm-Message-State: AC+VfDzQK9P8BeqMvpqPA1m3z8nMSZ7b8tiF14otJM2cjeCFJ76CE20r
	OtEu/2lmzlYAjN5Rew4tKxhBOt+mctZ9eS+Zt7tLJYkUHe8W4GD1c2FLyH+3orI2R7iUuYQKDct
	lzw+V4mxDwPHqgCFveVp1wFyOCvTBEds3R+8U7+yeYNMWYMaq/vMCCuJhEbscR2nS47JrhcYiH/
	zfpzDbTZLipf0VrRI=
X-Google-Smtp-Source: ACHHUZ4r9JCFvloZNOQ7tvRAromreCSi7ksq0FlhVujkrAR1Xi3R0RKL050Z8B4irZlUVCaAtxSnOw==
X-Received: by 2002:a05:6a20:748e:b0:101:9344:bf89 with SMTP id p14-20020a056a20748e00b001019344bf89mr154013pzd.49.1684426821876;
        Thu, 18 May 2023 09:20:21 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:20:21 -0700 (PDT)
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
	Guo Ren <ren_guo@c-sky.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v20 02/26] riscv: Extending cpufeature.c to detect V-extension
Date: Thu, 18 May 2023 16:19:25 +0000
Message-Id: <20230518161949.11203-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_092024_695856_5592274B 
X-CRM114-Status: GOOD (  16.04  )
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

From: Guo Ren <ren_guo@c-sky.com>

Add V-extension into riscv_isa_ext_keys array and detect it with isa
string parsing.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Changelog v20:
s/riscv_has_extension_likely/riscv_has_extension_unlikely/ (Palmer)
---
 arch/riscv/include/asm/hwcap.h      |  1 +
 arch/riscv/include/asm/vector.h     | 26 ++++++++++++++++++++++++++
 arch/riscv/include/uapi/asm/hwcap.h |  1 +
 arch/riscv/kernel/cpufeature.c      | 11 +++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 arch/riscv/include/asm/vector.h

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e0c40a4c63d5..574385930ba7 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -22,6 +22,7 @@
 #define RISCV_ISA_EXT_m		('m' - 'a')
 #define RISCV_ISA_EXT_s		('s' - 'a')
 #define RISCV_ISA_EXT_u		('u' - 'a')
+#define RISCV_ISA_EXT_v		('v' - 'a')
 
 /*
  * These macros represent the logical IDs of each multi-letter RISC-V ISA
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
new file mode 100644
index 000000000000..bdbb05b70151
--- /dev/null
+++ b/arch/riscv/include/asm/vector.h
@@ -0,0 +1,26 @@
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
+#ifdef CONFIG_RISCV_ISA_V
+
+#include <asm/hwcap.h>
+
+static __always_inline bool has_vector(void)
+{
+	return riscv_has_extension_unlikely(RISCV_ISA_EXT_v);
+}
+
+#else /* ! CONFIG_RISCV_ISA_V  */
+
+static __always_inline bool has_vector(void) { return false; }
+
+#endif /* CONFIG_RISCV_ISA_V */
+
+#endif /* ! __ASM_RISCV_VECTOR_H */
diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index 46dc3f5ee99f..c52bb7bbbabe 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,5 +21,6 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b1d6b7e4b829..7aaf92fff64e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -107,6 +107,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
 
 	elf_hwcap = 0;
 
@@ -267,6 +268,16 @@ void __init riscv_fill_hwcap(void)
 		elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
 	}
 
+	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+		/*
+		 * ISA string in device tree might have 'v' flag, but
+		 * CONFIG_RISCV_ISA_V is disabled in kernel.
+		 * Clear V flag in elf_hwcap if CONFIG_RISCV_ISA_V is disabled.
+		 */
+		if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
+			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
+	}
+
 	memset(print_str, 0, sizeof(print_str));
 	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
 		if (riscv_isa[0] & BIT_MASK(i))
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
