Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD21DC7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNn3/jXSsYnUNXilXRJj6rKQrO+cUs+NdTezp9yeJzU=; b=J8g/rSjBjfemxY
	ikI1TtOQkudtRaGnAKozV4Enhi5Ho+QT/B3DdsK9vhg4ez/bgOL5+MohWJYo4jgt+lJL75V8poP+a
	8mBTLW9bPXmxugFchI4AvfaAKxiyP8WE/h9ZEiLc5XGo6r9KScTp43vKGdj1MbpBHdiwaZWt8x/H8
	wq1SYfJ6tuolC3NisLnjTh7+2xDJbovaSH7kq/heOqK3eqfd+NCAxrhlkrpUZH2zjBguTmiaeOmIu
	z5pTP8pFYNdwkv//Qha0lTxKt6CvLKTU7x6UzA7tWUOzp4GNL4NIST6VDyJRw0QluyoxrunXK5aoi
	L4kt9PG2caNpqQXqCqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbS8-003DBh-W0; Fri, 24 Feb 2023 17:01:49 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbS6-003D6Z-0j
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:01:47 +0000
Received: by mail-pl1-x635.google.com with SMTP id s5so195238plg.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XWIh5JYM/EDcmnt1NZcIDsk8fqXi2dgnlyZIt5otLpA=;
        b=CkEh5N1u65jga/8/+cP905MaHCut3aB6loenHefv+U8jkhCrs19W4Qb1cMDb8KMC+N
         r9sGfZjVnun034ebJLM7qzEaeu8QYshK/WRUptnj/gU4u/o239xQpzhkv/ltpBV6Vmni
         izHRiqYpREQhVb0uPZE/3UkMK7FHbY5nz4h1mZ+9D8YdOYQEBBSXX9Jy5dCdd8wEfUeq
         0ALwmbuoJbSlbNTso8Zo5zIt0f9Vw8v0Z+iexClMoOxjD8No3qwCGsGHOHVaGEdga8XQ
         EllgbJg6u7v9ij/zs/qI7SQ4MdprhcPmpzvPwlauFXr8zz1xxnREQswQsESIGZxApU77
         I8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XWIh5JYM/EDcmnt1NZcIDsk8fqXi2dgnlyZIt5otLpA=;
        b=Y3wNJGGyfAShzRRMo3ur2RQZbP1yMQdxbo/gN5KoEkE69JTYntCMzNAbxdwrDuxFmD
         xHn5Hx6pc/ZOHBF/QVesag54UvD+cfzawsTuwXAjldOPiHN5UcdWuxHZpVNVx6wUiWta
         PNTKs3bJi0WLpSAv1IJjpE9mjy4Kp/6thcE67P+sZRHQdyBTWtjjbMHzQmwu618Fyj/a
         jBxt7GWKBr+zLD5t6YLqMFQIg2Dwdkrn8Jpp3K1szgXWWACNdYPU9YGwpF7EekxK55bZ
         5hwd+/FSrlovpKWxi9XiasQvTxdXrQHvrhlBG2OU07217vL9rVk2iAK6em4AmqBZtHmH
         0+5A==
X-Gm-Message-State: AO0yUKVr1ehjt4rtmcRUWy1v0P9Rmx6dZZfUKxj4kS+A/IeDfDGsKDZ7
	7F5UwR0Br52W+3TLBMomWs1vCdVFRolFFvtLfW4d86Mb4ssTAT9LLMcLGy57o4jNS9p5wX7YmOU
	CC4aaxi2swe9eDA5DbNaAs9ejmvRRbYdly1mDX7qDQ3i6AKnQN24nltKVqOL9bGMkssylTh6CG6
	pwGnABYN0UEA==
X-Google-Smtp-Source: AK7set+rxZVEgTVbq1zk3TW3EwLZSNHkhuoPmsE4flU3gpU7EajZ0u4rvvMg2wo6T+YDKSk/mF8JDA==
X-Received: by 2002:a17:903:244c:b0:19a:d453:4ac with SMTP id l12-20020a170903244c00b0019ad45304acmr20244323pls.61.1677258105180;
        Fri, 24 Feb 2023 09:01:45 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9234731pls.251.2023.02.24.09.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:01:44 -0800 (PST)
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
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Dao Lu <daolu@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: [PATCH -next v14 02/19] riscv: Extending cpufeature.c to detect V-extension
Date: Fri, 24 Feb 2023 17:01:01 +0000
Message-Id: <20230224170118.16766-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090146_085779_E13C0A34 
X-CRM114-Status: GOOD (  15.70  )
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
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/hwcap.h      |  1 +
 arch/riscv/include/asm/vector.h     | 26 ++++++++++++++++++++++++++
 arch/riscv/include/uapi/asm/hwcap.h |  1 +
 arch/riscv/kernel/cpufeature.c      | 11 +++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 arch/riscv/include/asm/vector.h

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 8f3994a7f0ca..8dd673bbcb3b 100644
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
index 59d58ee0f68d..4b82a01f5603 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -99,6 +99,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
 
 	elf_hwcap = 0;
 
@@ -255,6 +256,16 @@ void __init riscv_fill_hwcap(void)
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
