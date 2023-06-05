Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62B9C7EE2D
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zTY0kX/7DpaF+YLS6mHBrPVEn1p/4PSwymvcyWiUPgc=; b=Tt4e7rwNUHcjtu
	DYxO7/rElJgpUzjcaZ2bkAPvfqU78gJRgcZhxL8oKmR3wlCi0Z8FMqcsTYkqSy8BzRa+hZt8t6xU/
	PskVww2YskrGwmgIG6gswFJX5uxN4LoVyr0ogyPZ18XeFHPXko9Y9Uy8JbKaza1S8eRGVRlrRry1d
	DKIYmwmFSmUilCPyO9LaZBFlAULJxJjsV86l19W/aFbrkBNn9mYqyyIHmicROpcQoOkpD6YFQ/HfV
	nn6b+BL9p8c4xHNbulh+B3B4FGC8ljpCpaNdJXziM4Gn/68NjZAEo24R7qXj1fasCit+p5uDttWPj
	EYanul7kNOw+qQBt9QDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CJH-00FyaT-2i;
	Mon, 05 Jun 2023 15:39:55 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CJE-00FyYI-2b
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:39:54 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b021cddb74so22593165ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979590; x=1688571590;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QTuL2uiI0oFuPEE6djzm9/PdbC+T6hk/9J64Mz+FPUg=;
        b=ZhP8GjWEpGFoayG38V5gvFyNU8chjofIbB/n0RNUU/iMJM81Ux4LoiFJDPWjmeBbOi
         SZnF6FLwqVoWo23YTZGnROW6cGlIJAfo8nlF+ho21iZP1nw5dLmdA3GtaOWizicz7LVi
         IeQbbknQb1HhK7mPHziObWBIp9DmhImbOP0FNLs2D8rSWVnVaY256cEoWLaqkFhO6e2B
         dSXpi/6VfR9NSQd8RnNZkTmLSQnmfS8VwpoK6LmViKcIW/wo9cf+vxHps60i7aJvmziy
         6XuOXzqAUrkNDI9wFxmlYbcOwgJ50foR9bQgel3VwyTmFTlrO+uByafyiYfr7orr+N3V
         OEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979590; x=1688571590;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QTuL2uiI0oFuPEE6djzm9/PdbC+T6hk/9J64Mz+FPUg=;
        b=APL0lUnPncHitGgmbQXh8qEkay+I/wFxfDiIN7MdMTmRsWgs0tR7sUTxxahdRCV0XR
         Fa6nV/fhBsozyrISbNxRxFkUiJhzGlMWIqEcwPFEZTcMfLfatXOzkFYlCSfaDI6xBznS
         zFilqgBTSeWztQgHXKkaWrkW6Ta51rTZN4lMmC/ToqiNd4z50aXrYLMLJjEpTxc3KZAf
         2HEZlSiPbUr1PRnTVhDwgLnbIUxu3C3/PeOd6MrQ647BffQypmPWUMuik+WDTtHPPfZ1
         tmtPgjkRfMMKbbciu0AeMD7a0mZnP9/uVG3VwF3gty/IHoaV7HsYfb0pN6TasKtghZo4
         tHnQ==
X-Gm-Message-State: AC+VfDxp71m1BDXjpr4WJZtrnNUS3aVp71vIHlccAcp4zZ+VGcbU2jGx
	cZSq+yLrwIjSNqA5I6R0puNj+28qHkFffbjvQbjZNqshYPTUiLD7TFj2fMsoIUdH5Unhq7XyOK/
	YXeSWb03RA3+xShUacGVUhSiK1DrLfFuFE/SsBrQ1ewJymW8R0kJs3ktCVIz0U6heu/yTlxBYaJ
	CskCyxhvYI/I4snIQ=
X-Google-Smtp-Source: ACHHUZ5iCIIsrXrKTV4YvyRboc0MLsM11Lz4h8qRpKBqgpdjkuJM73cXRy4Xbnn6WlDgx2Wd7WCO0w==
X-Received: by 2002:a17:902:e850:b0:1b0:fd8:e693 with SMTP id t16-20020a170902e85000b001b00fd8e693mr3879112plg.7.1685979590559;
        Mon, 05 Jun 2023 08:39:50 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:39:49 -0700 (PDT)
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
Subject: [PATCH -next v21 02/27] riscv: Extending cpufeature.c to detect V-extension
Date: Mon,  5 Jun 2023 11:06:59 +0000
Message-Id: <20230605110724.21391-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_083952_839899_DE523686 
X-CRM114-Status: GOOD (  15.87  )
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
