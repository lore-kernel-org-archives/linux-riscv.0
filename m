Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417E5C76196
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNiQ3+JWLk5uWsiIJOFGVe5qrfp/yJkVgaSjcKlVgug=; b=Gzsp+p14tfJDEE
	S+S1X4cipBDAEovxPBpSc1b+q4fVZ1l+zTsyrG1i2rJLpW/AOA3pxu/lbrowMJ51kZsR1sb4RI1jJ
	rRr43pLG3zWzh6F42x9SN39Yh7Ku0mEpCr+kX2Mtp2bTxmQQL4wCmCxW0tAYrlcFGxXRGnj+S7LVL
	Io3+xxQY9uuOsn5Kdfw+ppfVH0EdnLL+4EvJCjDL9HEmQzhOUvKy762+7XIflwW0nviv2/ouxqXYM
	HJE78z4nSpEsFiYHYqpM4EamzbG5wNMF8d0IvP4i8XaZPNWVNqIQzzp/4Fw5opq+C0SsQM4dVPJFa
	q5QwyW0dy6Sh3Z21kUFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMPw-002Gcp-2b;
	Thu, 23 Mar 2023 14:59:52 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMPt-002Gag-31
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 14:59:51 +0000
Received: by mail-pj1-x102f.google.com with SMTP id a16so17365234pjs.4
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 07:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679583587;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ysjVmLSFjJmySy1HzqCUzkjl7bv/RwwIsrQKPYD1lk=;
        b=mOQ06MlFhAwl4tdwszxSxr1cfY5V78ViEsk9APJqofD0UlU/77e/kNfcI/QRqczkAr
         V5BzJS8O5fqGR71Pk5cAU1c1viCQEztnwNbjf8SQhGVq7+7Tsnn7OFeZglBYjlOK6EW1
         X9dyItoOJVC8q0lx6gtjXOv3A/sG2hEKvGAw6WafQHYz3xFz/xvhVdzcMrXp7sAKAW1e
         EdJhyUj6goBP5Ym5ya7IQNX8RxHuFMheSs3bo2MxIIG/dndSd/QxuCZCwkGOdGW+7F1h
         12cxJNxhFpxjvPPVsOKZ0DUNZHi/JAymogfQs/iVqNIYXuR9D29vbZ2y4cocvy6GIc6U
         8+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583587;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ysjVmLSFjJmySy1HzqCUzkjl7bv/RwwIsrQKPYD1lk=;
        b=2gjGvGcAeEzBLAR2x9n33pZPCdaLEl1rwEd1DVcwqgVds48h2gW9RgPWl5Ten3S/kD
         RHb5ciVMCxU29aGH1071+tzTewh1edkeazWNnH99qx/EhQapVgVSw0SlMQLwNdVkA1EX
         DfP4I9yI0lyn2IDMn7QmVe688HlNFjyhQ87iovfhJb2WdSbjqxXC2AfIN3PbdJS5KUNt
         d6WTM5P5RfWCaYFGuySE/ayoHW5VLN6MZ9sgrmLKDzQT+Q03go3NEWvglJXgNgmaGBcf
         Z+r4ZcYKaPV7MisL5l01F4jF99SZe/7b05kxy4+f7TtixX+ymceAu93e2DNPADGoiHVm
         2eUw==
X-Gm-Message-State: AO0yUKUR+iPNL3+ogxRqYjMKUC8vWYtOiIHnH2z5LdmmcenA659OXVFC
	xj0nVXCm1K+SdedY4+bS1EEBIov0FH16cV2YVu9SgvHu+xuRRQtfcy8HA/aNMieCGlyWM+aZOEm
	2zqPR2nLuZphg5dJuAi23dNwX+IBB6b8SQufIuONlZUIoraAdXv98y5gmYo/wy3plC3MrC2Yvs6
	h9ib2019lTFiHN
X-Google-Smtp-Source: AK7set86fbWkiv9YiIHGj3faRY7lEf+H+q24ZHOdFTkQ2PKKWiqta70OHUd/x0D9fUsMvnjP04qxrg==
X-Received: by 2002:a17:902:e543:b0:1a0:7422:939a with SMTP id n3-20020a170902e54300b001a07422939amr8624796plf.4.1679583586964;
        Thu, 23 Mar 2023 07:59:46 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902854900b0019f53e0f136sm12503965plo.232.2023.03.23.07.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 07:59:46 -0700 (PDT)
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
	Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Dao Lu <daolu@rivosinc.com>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH -next v16 02/20] riscv: Extending cpufeature.c to detect V-extension
Date: Thu, 23 Mar 2023 14:59:06 +0000
Message-Id: <20230323145924.4194-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230323145924.4194-1-andy.chiu@sifive.com>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_075949_976655_93EE55F2 
X-CRM114-Status: GOOD (  15.72  )
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
index bbde5aafa957..7df8db320934 100644
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
index 00d7cd2c9043..923ca75f2192 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -103,6 +103,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
 
 	elf_hwcap = 0;
 
@@ -261,6 +262,16 @@ void __init riscv_fill_hwcap(void)
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
