Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCBFC6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 16:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNiQ3+JWLk5uWsiIJOFGVe5qrfp/yJkVgaSjcKlVgug=; b=j6cp+CD+eWJZGJ
	Lm7bTjWqENxYFJkg5Z49P7kXbi0GQEV/dEyHO0vbXoQO8iovc9ZwQ66tSijzx1oaODv8+3G5JEgxk
	ZDgHcUJHWy0WBnCaN95yGLlOuIJecYwxNk/fNgPdPcZ/1DXwDbZZ4Cn+wOS3HRV4r2z/jNmDilvnK
	KJ8GPu8E2NNSfpEcBXVcHzM4sXoArk9mUK+jQDJvv35g+5Sb9llA19gHX5qJpPOovOA0r4eEWSBzY
	P0kOeKtfZr/eXEnbXoGBAQE31h4ITuPsR+7/vB2l15oDxwtWWOA42H7oy2VtFoh+m5TrHdhoii6XH
	C9kKv7oCgLwhutGLWWSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq2l-00Bkzt-36;
	Mon, 27 Mar 2023 16:50:03 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq2j-00BkyK-1P
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:50:03 +0000
Received: by mail-pj1-x102b.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so9528376pjt.5
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679935800;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ysjVmLSFjJmySy1HzqCUzkjl7bv/RwwIsrQKPYD1lk=;
        b=IkQ1q+amsjtN+vSUgBq7brAFlKNuhfOXwhE8v/PRw2U4OmffuTAg0CPZZgN3x73nTb
         XaulIDrsAsbQkjIaF7dpZ76X+LR7LS4Uc4WvEwvACKyLbHOU3NDGZPXqwl2zd9wW1GKt
         wxwcZmlRpWtFm8LEDdmf2XIK8mhBBZwVKWAUKoay/nJYB5fI/O0W6tQM4izPtzHyFLVU
         PpC7yRfezD7VQfSZ+L5jz1XRTzTDAlDJkJVyHpl5i8xUtwSOdVh8bib0123OddRd9IH/
         Xfx5ragrQn2aloiECtyD8A4iHb4OYYxM5n1oH/vug5pqUUUe5ZpbXXWRPX60qfyPJCY9
         E1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935800;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ysjVmLSFjJmySy1HzqCUzkjl7bv/RwwIsrQKPYD1lk=;
        b=Sl26/siZDfjf5krz8bkmmPOlcITxRXOydotQHYNiSccO6VlVL/v5nEBUN1raLhAEuB
         srBbvANsRULVQofEPJGFHDYMG2pu/Qn8EcyFdzpEyp33DOg/pjHOtfJXJehl2i8qg476
         Jtw4lKQRhAMrcKeS7odFg6NkHsJYc6if3wyjADBq/BgIqwengcZBGA1qvmIQXqx6Wl4e
         IEtWAMwngrFPb6ZVNRjLVewa3BfittlQZoasJFjOoQ8pJbJsR/gray2Cddt0ARDRDzt3
         WLN4NhTd6thetyK1Gi9ThGCOS1piKTMRUQyyC0dg6aPUbnujyIxKVsh5Q5IdzA7WdCUw
         QUMQ==
X-Gm-Message-State: AO0yUKVL063wz7hCLys9jpXPhI0f/sXJoxkYvhydOFeERVAgINpi/OkJ
	KUm6b99C6Mt4YRzN42VI5qzsVvSRQlG9MUM8D/ugs7Y/nSESNVr+ZpesDC7+R2CJUwFSZjZkbht
	xNxnr1xdSmjY89Lir0kNtq0k1fXKBPWq2N/nAOZYPyOJ0pQIDfd33cl9Bg3pL0v2/L11FyOqRcY
	Pc0qVTOakBMOqL
X-Google-Smtp-Source: AK7set8HAL2dYA4fCV3CsxV0johJkK+Gdsl5YGWvfqUJNd+bUXZXKmWSYs2QlvN/RER/2CO+tauJSQ==
X-Received: by 2002:a05:6a20:af1c:b0:d9:3683:bc15 with SMTP id dr28-20020a056a20af1c00b000d93683bc15mr10743515pzb.19.1679935800348;
        Mon, 27 Mar 2023 09:50:00 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm19310550pfh.22.2023.03.27.09.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:49:59 -0700 (PDT)
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
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH -next v17 02/20] riscv: Extending cpufeature.c to detect V-extension
Date: Mon, 27 Mar 2023 16:49:22 +0000
Message-Id: <20230327164941.20491-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230327164941.20491-1-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_095001_510576_123E9A87 
X-CRM114-Status: GOOD (  15.75  )
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
