Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6ABDC76196
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 11:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQ+2dYoU1IQz3yXaIfI1gPnNVdmy71sjyrXWlYdeZn4=; b=g45mL6Q1eLCs8P
	tuZBx6dmzBJpr3pQChV0V3EMufDSo92LlwvoPYseRTSV0GQojIYCLhHfQZqItBHcFPpq1WrSjvYTL
	70olnldYFxf39pgnomDoKK+Skgaz0miEuq65EfkKsb+S8Q51mcF3wY7axCbnry9MTtbaGnvV0Iive
	3jmq4W2T4oDpj9fG13yopJy4eDzV0uo+oP0Z3F5R8CsobI3ZtWEVA6yx00Qed2MhPbL7pDK82fIK0
	wLJ/YsoyEqPunugvQNlq1CjFrx9arsN8+VwAbpmq04Jf9v8PsRuGDQMZ5u1AQTWdr25aGEBrllkaU
	qF+wIZdAjzv80lVVyZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Nw-0024vX-1a;
	Fri, 17 Mar 2023 11:36:36 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Nt-0024su-38
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 11:36:35 +0000
Received: by mail-pl1-x62b.google.com with SMTP id v21so4973849ple.9
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 04:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679052991;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J7d/Gx92osy3qRALLSXR7ZlrWNvK4PrWEMcChV451s8=;
        b=m+xBO4XgfVJXwmrXKy2b1Ca527z7eYqi1jc45Ld0cKLnb3E+5xXWFZEahHIZTODdei
         /u5L9MQXCdrWm41pqboozLj68Xx4JnVezThCOYjcZhTKEzrgaKsSUbc2+G2eimdeCwy6
         uXFrnxb0njo+XYWvNE/qPaxbe1yXPH39o78Wq2qUsX1sB2Iiy/N+8LbLzHSAKVXUoXAf
         1FPGraCC2dgW50EjqubzGjRRyhmjLi61LMndpaNsL+zltni+uuxulQ2YJalPf1bOkUq+
         6E/BcZeuqnfrwGDFeNn0waQ3Nuak3gxQYQmQwuhtWexSQlTePWw4A2kD+4y6mAdoc+R0
         w2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679052991;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J7d/Gx92osy3qRALLSXR7ZlrWNvK4PrWEMcChV451s8=;
        b=rE2hallF1Or1oCR/RILzkki3KY/g4G9wXOrOBuDXuzwfNed2If/ymyBn84qFCw5nEA
         dskAfpowXv0ddnhfwuSXkVkW99GEessAg81Kls3cOj1UHbZkTK/IWG33wDjNEB0H8HE3
         8Qq0OiBJpHqVcUhYm7/bA4mnf84rUW178QJncVYvxZXB9Yjtwc651le0L3MoJwbQu1ar
         eSfR4JOUI+kyhf4voPhuHa6Ka2kn+EnMzGleRiYsQZ4YgiyEKNuPDmPa9cE7Ga8EyYPt
         L2SZSkfc2fMnq6LgmOb1x/sD5dz7Y8SgS9eJ0+0tFGJCTEpu6z0W2aFRQa61TCD+kH5/
         RxGQ==
X-Gm-Message-State: AO0yUKXHiPNz/uoBvzudR5/GhZjjTAUHesE9x1va28Ug80bguMM78jpf
	cf4h/BlYP/pf2MGQ5Xo4mFj4BFgUFTFpsDBY3UffVSN3ZFuuIjhyRbH6ODxlHRCVX1x5nzr9YlL
	/zB32f1bpT6X6mzRy/bAERHZvFudJaqAM51UJHa9pyG9b1Q6CIJMYz+rxKeLZx7bemHgmxosq5S
	8nCce5dTa9Zs/g
X-Google-Smtp-Source: AK7set9kIO/UYXlsxR9CUEAEGLj6sYySBuBnQixIDz6QQ/ABmEapr1cXxbDXZYVKANoDA2/CCzdH8w==
X-Received: by 2002:a17:90b:314e:b0:23a:177b:5bfa with SMTP id ip14-20020a17090b314e00b0023a177b5bfamr7746057pjb.22.1679052991334;
        Fri, 17 Mar 2023 04:36:31 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a2cc500b0023d3845b02bsm1188740pjd.45.2023.03.17.04.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:36:30 -0700 (PDT)
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: [PATCH -next v15 02/19] riscv: Extending cpufeature.c to detect V-extension
Date: Fri, 17 Mar 2023 11:35:21 +0000
Message-Id: <20230317113538.10878-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230317113538.10878-1-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043634_009681_21B96A15 
X-CRM114-Status: GOOD (  15.32  )
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
---
 arch/riscv/include/asm/hwcap.h      |  1 +
 arch/riscv/include/asm/vector.h     | 26 ++++++++++++++++++++++++++
 arch/riscv/include/uapi/asm/hwcap.h |  1 +
 arch/riscv/kernel/cpufeature.c      | 11 +++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 arch/riscv/include/asm/vector.h

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 0ed15c2a2816..154f1c45c8c7 100644
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
index 000000000000..427a3b51df72
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
+	return riscv_has_extension_likely(RISCV_ISA_EXT_v);
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
index a4728bf60b84..bb1d14e08a0a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -99,6 +99,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
 
 	elf_hwcap = 0;
 
@@ -256,6 +257,16 @@ void __init riscv_fill_hwcap(void)
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
