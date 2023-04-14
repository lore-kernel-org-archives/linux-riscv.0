Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA669C77B72
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5L6n5HSkzjE1iWdws5f5dMxWt7w9OAR53DVjZVU4q2w=; b=u6Zgr72XJAZpyP
	7obfGZMvjiDmYA9fX+YszqUGt9/DbQIQ4cFFtVmhgNX2CFNfGEiL5/FcchYNDeFAOVl7lgq3QTwjd
	LNhja1hVehQ+V5dj4a1LVa6WIWSeaVp3H0556WI2PG6kb6/qxwEVHEXv23l+bim2UI/wiMnYoLJ5+
	v3AZpFBuL1jIaNcjrYKJrYonK03DrhBgNWiRGDqdMUe3Pl25HsFkDPf+A0UolAHyOE+nsFHJpuX2F
	tFgSKzqXGRw9eQpkKIg0IBF/EtTWPRSIE/S73o88FEQ7PAV6qaLSdd/t4V/ASGgxYB3dDeoKoy69I
	8P+IYh5mm5cT3YadCzig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLpQ-00A1VW-02;
	Fri, 14 Apr 2023 15:59:12 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLpM-00A1Tn-2T
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 15:59:10 +0000
Received: by mail-pj1-x102e.google.com with SMTP id my14-20020a17090b4c8e00b0024708e8e2ddso8167419pjb.4
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681487947; x=1684079947;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U7ri8ZSvnPvQyAXJ6dQGQtYIAraNypeWm5i0/GIq5FY=;
        b=YGmvXm/TuZoti9wweuSje/DwLyT5H6AiJaRqLiuK8jADZAJMP4Th25m4WmcRnYQbh3
         WC1CY6kS84eID7rzBNa3mpK+uRN9O4nqQKKiOYyxKNc7OiWGMeWkAsi9wQMirwCNcmp8
         k15vupj6hAY+hZ1EXRw/8bxxxxbGYtPq7prx9AagWTmKP5iNBHC9Kgc4j0YC76tK76IO
         OzmKVA6KRzd9ZAexvU9vOVLfiXvwFp5JdiYvi91oTZOHUQB6oLP9ObWHKUpjdTMYar19
         Q4x8TLumG60vSH+2HAmEzgNEm5n8uGGctC7JDTWbImNbUWxdSjjT1GS0bGAPCQJ4d6wM
         mNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681487947; x=1684079947;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U7ri8ZSvnPvQyAXJ6dQGQtYIAraNypeWm5i0/GIq5FY=;
        b=GfsokJTjUU4CF1sFEmwQo2JPbBDgrvCM6ZFjp3GuBwtGt2bNr0Cwv6zV3hVbrMN8yv
         +PkfUBhLkGRanq/WaIvo4cmhmsEZi0vvlWz0yN68SquKSC7L7ZGFXYit6dn0Wdzm7VHQ
         g7PcQ+TrsQwJWgO0q1IgE7eOAJ1bvP6A/ARgTAOGGcwpSZ2n1ptOSGFQnMKyEfbqbLSQ
         H3phSJdiWa0e0qIn3UqfudD4y6OSDLO684gjneQG71V7LzI4b83tEdW10/xW2Xppto48
         cCKR6bBQuPPHEhaKuUoEYvhc5uhNTPA+70iCyBZwK7G7Xfo6fomCw0BuO7qiMrEnRnB/
         BuRg==
X-Gm-Message-State: AAQBX9evBKzgZRDSsiJSUhC3ZU3U9a1UGulmkQBb1txYPJiMxFL97kh3
	3pW9xiF7j581Vln9g12UL7yPBXMD9gpb2bTD2w6ppAFAImQBecenRZzVWG523adsPiWt6uNqy3f
	IXe2L/4GLrRyL02iZTM4w892cggkNVN9aIwhKRcQ57zTcuJghk7NZT7okD5FInocAMFac7RapuS
	vqfVx4OLsEWenU
X-Google-Smtp-Source: AKy350YnbAtdYK25WZBT6vEyXz1kqM58xh87+9tiIROkMCKXWs4cw9ZPIPVhDSDuh+/FG9kqtQfPXw==
X-Received: by 2002:a17:903:32cd:b0:1a5:2c2e:e41d with SMTP id i13-20020a17090332cd00b001a52c2ee41dmr4492968plr.51.1681487946919;
        Fri, 14 Apr 2023 08:59:06 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id br8-20020a17090b0f0800b00240d4521958sm3083584pjb.18.2023.04.14.08.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 08:59:06 -0700 (PDT)
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Dao Lu <daolu@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH -next v18 02/20] riscv: Extending cpufeature.c to detect V-extension
Date: Fri, 14 Apr 2023 15:58:25 +0000
Message-Id: <20230414155843.12963-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_085908_801462_EB2FD9DF 
X-CRM114-Status: GOOD (  15.59  )
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
---
 arch/riscv/include/asm/hwcap.h      |  1 +
 arch/riscv/include/asm/vector.h     | 26 ++++++++++++++++++++++++++
 arch/riscv/include/uapi/asm/hwcap.h |  1 +
 arch/riscv/kernel/cpufeature.c      | 11 +++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 arch/riscv/include/asm/vector.h

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 9af793970855..5165588d1e8c 100644
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
