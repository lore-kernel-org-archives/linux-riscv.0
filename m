Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA1BC76196
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 15:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eC4rV5WrVacCrG4VZPS8qLjlLyrCGLV+uBJefAKSTyU=; b=WFx7NXjhJrNchZ
	OwfikjYN1VcrRW/5fb1mv6cKpYVz5ZONMZv7g1YigLCFMeuPlYpSd9288xCwRNs7m+kOM27quJYR4
	aMmhU1MAeLpFRIfjGRzxqQbX+pp2O43ol2J3wBWilX9H2ejgGWpRG2Jvz2YtQ48JVv8kSNnMol63D
	7HeP9Qx/rR6hpXz7fGmb9GOSvr/zh0diX9iPCOfIZQ2S+qXM3duqRPZpytJpsg9NYG2ahFnDx/1N9
	TjO4Uwt7OCW7Kiygy5z7HACkx6j8euEY1QfIcVGM+1B/GllNTzo5IkVVpXHWjMN7p5Vr3EhttrgaR
	Ciq9UF2yaFl7KlsgA39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMQW-002H4A-0X;
	Thu, 23 Mar 2023 15:00:28 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMQO-002Gv1-0L
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 15:00:21 +0000
Received: by mail-pj1-x1033.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso2338968pjb.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679583616;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vEs6CRaMiSaSyMADyPFyhJnxav5yWBpTn1OIiNt7Cro=;
        b=dYj5R9/RWEAxx/UepPnaJQ/552VnDdZSDIMjHCAF49+RqgNbtTzf4I9CFPZUBOSY5U
         NZ+SvXZDKrmEYrAIJrVcvyWEi9sfGMIx2YRm8dMI8mJJg2X60LjLcEKadtXwhh09qVju
         CrdkRiFxYjzrkWN0ho986sHGszMHAujla+NjDaO0o2TieMZ0Go7LWw2/oynZwdXgWT3M
         m2NVy0DjyI6Mb17WLGMcTYfiSXKrUpOIghZNiMAdDAdTXB5cd82Tt/kZKTWBbBtMokdM
         AUrGx9DsrJWgU7rv5b6urrX2x4GyYoECvCQjzCnFYhF6/JXHDSzfC8IEFvXTh/3ykX1l
         2gbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583616;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vEs6CRaMiSaSyMADyPFyhJnxav5yWBpTn1OIiNt7Cro=;
        b=627ap1DEuqEO7UjL+s3+IeIi6ozOFXsce3PWvEw8r0De+NCtUybf6VW2K/tQ0jcL/t
         GPBGuck03jKE5DrRTRnwim7VLCiVOwkEm7FOQgqKSARhp+rbUDe0VwDc1Dla8kZUK3lR
         AfU3hCu9OMOFBQ3fuvSiKiqebzZtoP4kkL8A8D8IH99+eT6heMIqngiJY/zKZnty2+tj
         bUG/z78q8ItHn+L8YbyWVPBT62Kdv52YaJJPWr+WGfaGtDblgRKdWJm+5x4ukyisiN5c
         et+MBktS0Cb1cGxd4tcTKbt0dIEP6DM1ZDniGt1lkGdmhPBXGyZi25V8b8QEC+2nNC/H
         FlHA==
X-Gm-Message-State: AO0yUKUNDvf0+XRZG2ZoHFJUcCupAVQm6zPjsBoEjhNTYVlI37oOoM+C
	fa6UpwyY+pdMCn9pCLvGEB2q79GorEVs0raQfR2c6k8KmftsEgKmnhd31S/j6ijMjqMVGdd5jbz
	TqvQLtB7pwfdyWAELdLBrP7zPj0VhiDeFDvqd6BOPaAKCCgXqL/1PiHGVx5M/rIPLyAov2FGmqn
	EhERH+QLDTapyt
X-Google-Smtp-Source: AK7set+PtVegPK51VFFk78fLlqp5HSdE85hJsVjyxbQGFMw0HWCd68xqflXn7JKfh7vFpjwOj7Qeng==
X-Received: by 2002:a17:903:64e:b0:1a1:c0e6:d8d6 with SMTP id kh14-20020a170903064e00b001a1c0e6d8d6mr5931238plb.54.1679583615268;
        Thu, 23 Mar 2023 08:00:15 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902854900b0019f53e0f136sm12503965plo.232.2023.03.23.08.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 08:00:14 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH -next v16 07/20] riscv: Introduce riscv_v_vsize to record size of Vector context
Date: Thu, 23 Mar 2023 14:59:11 +0000
Message-Id: <20230323145924.4194-8-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230323145924.4194-1-andy.chiu@sifive.com>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_080020_156076_261FF784 
X-CRM114-Status: GOOD (  16.07  )
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
 arch/riscv/kernel/vector.c      | 20 ++++++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 arch/riscv/kernel/vector.c

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index dfe5a321b2b4..e433ba3cd4da 100644
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
+#define riscv_v_setup_vsize()			do {} while (0)
 
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
index 923ca75f2192..267070f3cc9e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -17,6 +17,7 @@
 #include <asm/hwcap.h>
 #include <asm/patch.h>
 #include <asm/processor.h>
+#include <asm/vector.h>
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
@@ -263,6 +264,7 @@ void __init riscv_fill_hwcap(void)
 	}
 
 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+		riscv_v_setup_vsize();
 		/*
 		 * ISA string in device tree might have 'v' flag, but
 		 * CONFIG_RISCV_ISA_V is disabled in kernel.
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
new file mode 100644
index 000000000000..03582e2ade83
--- /dev/null
+++ b/arch/riscv/kernel/vector.c
@@ -0,0 +1,20 @@
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
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
