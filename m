Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAFEC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 03:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mCCHfgYZsYUsoEI3N17c6jR/i2EWiMjiQSuoXNBVxsg=; b=o7nyFpKDJYWaZs
	akpGW/TaeqQJTHFPVAeAZzOpWrcZ/kx6voxQU7DBVHMesSKCPlEl+RcYEZT1jp7pt9/oqFLnEwozy
	BIV8wuyJJJoMB6pF5VM2OXaxkLK7rSuJEBCfJXf0ipeMfm0ocRuKroLa1OUSAh/G3xAZp81/4s2Tz
	g1Lo1C/rwUmzbuP0Uh6rUJP8Qn7A5fjo8xb404kdMwrrqKPZMxXjiMsiHRWFBiVHsOK5TIOAXLteR
	h345w2qfho33ZwTLPmmA0l14DbS6vdnS7SCMgl6V+VUKy5+pWURrzVLqUikRKi1giWCUNZoOWA3Zw
	AnADV5CoD7QQSUXr9yvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nozXS-009ggT-Fb; Thu, 12 May 2022 03:30:54 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nozXP-009gfI-8H
 for linux-riscv@lists.infradead.org; Thu, 12 May 2022 03:30:53 +0000
Received: by mail-pf1-x431.google.com with SMTP id 204so3651604pfx.3
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 20:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/JUiAQKzBnPtASw9bBA0S7cim7i54c+lQ4bL89Ie24Y=;
 b=I1Hitc0sLSDuMW3ftGYZTxAqH/9FyBOmqNrTUHH81bqpO9FBcaQ/T+/LHHvkStLHRa
 FU4Ub/I2yIy/K2Vwj28s9yropHNijLHUJ15ftInxMEgmf4XWvO9RIM8mXLkB3PTGugUW
 d+Yq1psfwoFC1yfBuK6RzDkH0twRPszSUfv5Ohzj2bn2ZEr52p8wU6rBnsvcxU+CD1oL
 HwFmvyDylbp2gw0rHcXFptpuvC5T5mArzgEIgOdcO7ym7PU9mSRQ4Q4Bqdz1pgOItv80
 vwrRrqlNG9gugvt3g07tgEDVemCmKTPwp+XMVAdU/L74vBynDn3roP9wxqLyTYzrh24f
 iJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/JUiAQKzBnPtASw9bBA0S7cim7i54c+lQ4bL89Ie24Y=;
 b=ELkm+0vE/frIgbaAScgHcfwuba7aFZmaKt1Mi6l2dPv3iBNcu1t7d4bG/pbxx7VZbV
 s+Z3XmaZmTxBn6p1yKNyXDvJp5flZsmb6NfBiLnR4JMhwlGzZ+oiDiT9zhBV/q+hNuIJ
 g8j0DU5f4AyVRjMEy4mkhlN35aVOs5f/pDxYwj4XOSHnhE34EDrG4wQOiUc/XBA19vhP
 VMTv2oI6x4aU+6au+3m1ny7tE1YTNamwo9YVHHb4VZj23LaR/G/5pfIITPNIZe7/Hm/4
 iTrCnZ7xdGjsAr0su2vAadi2l4+NGuDNRveZuUZbsFMk3iGUV6OCW1c3CXZ4RSaY7NpF
 oVbA==
X-Gm-Message-State: AOAM530KKfXChGn1YY583zrnIfvmxs0bV5JMOUCUp0GM5cw2vhkrOZQb
 uAdPnoPKqDEqdlJBBRtgCl9nBw==
X-Google-Smtp-Source: ABdhPJykn6Ud83qc5fsETVgHN6MByMTgZhcIbGoXC/W37OdrZ8Vl/0675MIvuB2S1LCC0JPiPYwnog==
X-Received: by 2002:aa7:88ce:0:b0:510:72bd:5a61 with SMTP id
 k14-20020aa788ce000000b0051072bd5a61mr28315689pff.21.1652326249120; 
 Wed, 11 May 2022 20:30:49 -0700 (PDT)
Received: from daolu.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a170902d5ca00b0015e8d4eb283sm2695684plh.205.2022.05.11.20.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 20:30:48 -0700 (PDT)
From: Dao Lu <daolu@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Dao Lu <daolu@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Subject: [PATCH] arch/riscv: Add Zihintpause extension support 
Date: Wed, 11 May 2022 20:30:45 -0700
Message-Id: <20220512033045.1101909-1-daolu@rivosinc.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_203051_554971_BAF659E9 
X-CRM114-Status: GOOD (  13.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch:
  1. Build with _zihintpause if the toolchain has support for it
  2. Detects if the platform supports the extension
  3. Use PAUSE for cpu_relax if both toolchain and the platform support it

Signed-off-by: Dao Lu <daolu@rivosinc.com>
---
 arch/riscv/Makefile                     |  4 ++++
 arch/riscv/include/asm/hwcap.h          |  1 +
 arch/riscv/include/asm/vdso/processor.h | 19 ++++++++++++++++---
 arch/riscv/kernel/cpu.c                 |  1 +
 arch/riscv/kernel/cpufeature.c          |  7 +++++++
 5 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 7d81102cffd4..900a8fda1a2d 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -56,6 +56,10 @@ riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zicsr_zifencei)
 riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
 
+# Check if the toolchain supports Zihintpause extension
+toolchain-supports-zihintpause := $(call cc-option-yn, -march=$(riscv-march-y)_zihintpause)
+riscv-march-$(toolchain-supports-zihintpause) := $(riscv-march-y)_zihintpause
+
 KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
 KBUILD_AFLAGS += -march=$(riscv-march-y)
 
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 0734e42f74f2..caa9ee5459b4 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -52,6 +52,7 @@ extern unsigned long elf_hwcap;
  */
 enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
+	RISCV_ISA_EXT_ZIHINTPAUSE,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include/asm/vdso/processor.h
index 134388cbaaa1..106b35ba8cac 100644
--- a/arch/riscv/include/asm/vdso/processor.h
+++ b/arch/riscv/include/asm/vdso/processor.h
@@ -4,15 +4,28 @@
 
 #ifndef __ASSEMBLY__
 
+#include <linux/jump_label.h>
 #include <asm/barrier.h>
+#include <asm/hwcap.h>
 
+extern struct static_key_false riscv_pause_available;
 static inline void cpu_relax(void)
 {
+	if (!static_branch_likely(&riscv_pause_available)) {
 #ifdef __riscv_muldiv
-	int dummy;
-	/* In lieu of a halt instruction, induce a long-latency stall. */
-	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
+		int dummy;
+		/* In lieu of a halt instruction, induce a long-latency stall. */
+		__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
 #endif
+	} else {
+#ifdef __riscv_zihintpause
+		/*
+		 * Reduce instruction retirement.
+		 * This assumes the PC changes.
+		 */
+		__asm__ __volatile__ ("pause");
+#endif
+	}
 	barrier();
 }
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index ccb617791e56..89e563e9c4cc 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -88,6 +88,7 @@ int riscv_of_parent_hartid(struct device_node *node)
  */
 static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
+	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1b2d42d7f589..327c19507dbb 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -24,6 +24,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 #ifdef CONFIG_FPU
 __ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
 #endif
+DEFINE_STATIC_KEY_FALSE(riscv_pause_available);
+EXPORT_SYMBOL_GPL(riscv_pause_available);
 
 /**
  * riscv_isa_extension_base() - Get base extension word
@@ -192,6 +194,7 @@ void __init riscv_fill_hwcap(void)
 				set_bit(*ext - 'a', this_isa);
 			} else {
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
+				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
 			}
 #undef SET_ISA_EXT_MAP
 		}
@@ -213,6 +216,10 @@ void __init riscv_fill_hwcap(void)
 
 	}
 
+	if (__riscv_isa_extension_available(riscv_isa, RISCV_ISA_EXT_ZIHINTPAUSE)) {
+		static_branch_enable(&riscv_pause_available);
+	}
+
 	/* We don't support systems with F but without D, so mask those out
 	 * here. */
 	if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
