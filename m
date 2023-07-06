Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E375DEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 03:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9m0fcsinYvDAh+35QfEO1l9gbovAetpvuZshnvKnuNc=; b=gZ+VAL/2Z+/SKs
	aE9Gt3Qd0wKwrnJWVlvboN0cWpnBxztYpmqGevamYLCvoxyOESfd8mS0XxkIDvDrO7e39wCE6E7km
	Lc6ifVzLGBJeFWIaasIHKYFhht62eE11CMiF2YGJG4eTdlwAfDof/OuoNuxv173j7Ko9BERWxvUzl
	t33R6L46FvzJccsHO2y4JRdFwr9VuOov1ZsJWkCavI7crjv+YB8HVBrwOcXBx90LQUPrzrNJsQjkD
	g9uemVJelBhTzfhCR5inu6rC4pCrZSOyD/BcIq29QR1S+xZr6gtpPpL2TmJRWiPPMl0vxNKfIyOfT
	b0F1GAFVilGZy6S0TQDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHFjc-000FdQ-2b;
	Thu, 06 Jul 2023 03:32:48 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHFjZ-000Fbk-0W
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 03:32:46 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6686708c986so305185b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 20:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688614364; x=1691206364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X54Cbu5zOMSO9e4vO2L+KNC0L67rHLP6N1OU6Cg3wA8=;
        b=zKJJNZDxACZFWxRB/zHvfSWKhUbPKItCK9lk7EtkWevhCtdWzJp57LMr7M5SO4p889
         0CEiHoOsfhUxrxRMxAOHQLCywtikLQX2OGGV+bpxtN+jTpHfVSeyyPdIIIC5Wq0/MDpt
         6TV8xKx/89fEhdUG01aTS1EBWXNSz833xGU9iSxfFYTnU6hcpPzki+i8Gka177fS/dfN
         Xf5Ikzkgi7UOGvY+SkskucsCEtYH0OZlRBSr30r3SKHrN83Ru3p3d+JduZjia9Vy2lpw
         WXaYeBvWbvGBmnzlNn3c4ko+ygBEiZNgGcJjq84w5pgjn3GjSCuCTuPEi0DPa1GsQDD9
         M6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688614364; x=1691206364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X54Cbu5zOMSO9e4vO2L+KNC0L67rHLP6N1OU6Cg3wA8=;
        b=dVk6AbDfhhx4q9rV3eJ1yat0SKx0X8y0YBhguWZVcAoohdpW62Y+xA2SbeWGzBDfwx
         q/J0biXYEI1ekJ2dvbtBOgF23D+F/w5ZqeY7TD/AIsrJ+2R1CBOBa1ZcFaA1sa489wbO
         MuD+eSS2/acJesFYT8T8g6CvNtsgavtwQZ8KaUWBMA/GXaIO3DHHZL9cPJGXDexBvO2N
         Q4AK6JcTklH50+407aw9ClCsCgu4HXVuXT1L4p89MnflLk1S53KOF5tpGDTwUO30p7Gj
         6UXzl+LphCS2W3xOIqHy/CxbD1c9DBxuoCY7Xvp6IzGpI9/1fqlJRIZ8ajCr8OB2wj3J
         J0Aw==
X-Gm-Message-State: ABy/qLai2u/7Pz2gjW2NveOOiViOEG5Cd7hZ43kdgnGt1ZrKKjhDimyK
	gHfa7rMjbxJ9+k4RGkSa57Dbaw==
X-Google-Smtp-Source: APBJJlEibChBqnf08BaWR2lS6f718PlTQs2OsmFSQ3SEhFbZq18oY01nl+i2/jd3tsACHZQGlvlb+Q==
X-Received: by 2002:a05:6a00:841:b0:668:9fb6:b311 with SMTP id q1-20020a056a00084100b006689fb6b311mr777400pfk.32.1688614363983;
        Wed, 05 Jul 2023 20:32:43 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id fk13-20020a056a003a8d00b006589cf6d88bsm239785pfb.145.2023.07.05.20.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 20:32:43 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 05 Jul 2023 20:30:18 -0700
Subject: [PATCH 2/3] RISC-V: Add T-Head 0.7.1 vector extension to hwprobe
MIME-Version: 1.0
Message-Id: <20230705-thead_vendor_extensions-v1-2-ad6915349c4d@rivosinc.com>
References: <20230705-thead_vendor_extensions-v1-0-ad6915349c4d@rivosinc.com>
In-Reply-To: <20230705-thead_vendor_extensions-v1-0-ad6915349c4d@rivosinc.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, charlie@rivosinc.com, evan@rivosinc.com, 
 heiko@sntech.de, linux-doc@vger.kernel.org
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_203245_207022_26B65FF5 
X-CRM114-Status: GOOD (  18.87  )
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

Using vendor extensions in hwprobe, add the ability to query if the
0.7.1 vector extension is available. It is determined to be available
only if the kernel is compiled with vector support, and the user is
using the c906.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig.vendor                       | 11 +++++++++++
 arch/riscv/include/asm/extensions.h             | 16 ++++++++++++++++
 arch/riscv/kernel/sys_riscv.c                   | 20 ++++++++++++++++++++
 arch/riscv/vendor_extensions/Makefile           |  2 ++
 arch/riscv/vendor_extensions/thead/Makefile     |  8 ++++++++
 arch/riscv/vendor_extensions/thead/extensions.c | 24 ++++++++++++++++++++++++
 6 files changed, 81 insertions(+)

diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
index 213ac3e6fed5..b8b9d15153eb 100644
--- a/arch/riscv/Kconfig.vendor
+++ b/arch/riscv/Kconfig.vendor
@@ -1,3 +1,14 @@
 menu "Vendor extensions selection"
 
+config VENDOR_EXTENSIONS_THEAD
+	bool "T-HEAD vendor extensions"
+	depends on RISCV_ALTERNATIVE
+	default n
+	help
+	  All T-HEAD vendor extensions Kconfig depend on this Kconfig. Disabling
+	  this Kconfig will disable all T-HEAD vendor extensions. Please say "Y"
+	  here if your platform uses T-HEAD vendor extensions.
+
+	  Otherwise, please say "N" here to avoid unnecessary overhead.
+
 endmenu # "Vendor extensions selection"
diff --git a/arch/riscv/include/asm/extensions.h b/arch/riscv/include/asm/extensions.h
new file mode 100644
index 000000000000..27ce294a3d65
--- /dev/null
+++ b/arch/riscv/include/asm/extensions.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 by Rivos Inc.
+ */
+#ifndef __ASM_EXTENSIONS_H
+#define __ASM_EXTENSIONS_H
+
+#include <asm/hwprobe.h>
+#include <linux/cpumask.h>
+
+#define THEAD_ISA_EXT0 (RISCV_HWPROBE_VENDOR_EXTENSION_SPACE)
+#define THEAD_ISA_EXT0_V0_7_1 (1 << 0)
+
+int hwprobe_thead(__u64 marchid, __u64 mimpid, struct riscv_hwprobe *pair,
+		  const struct cpumask *cpus);
+#endif
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 2351a5f7b8b1..58b12eaeaf46 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -13,6 +13,7 @@
 #include <asm/vector.h>
 #include <asm/switch_to.h>
 #include <asm/uaccess.h>
+#include <asm/extensions.h>
 #include <asm/unistd.h>
 #include <asm-generic/mman-common.h>
 #include <vdso/vsyscall.h>
@@ -192,6 +193,25 @@ static int hwprobe_vendor(__u64 mvendorid, struct riscv_hwprobe *pair,
 			 const struct cpumask *cpus)
 {
 	switch (mvendorid) {
+#ifdef CONFIG_VENDOR_EXTENSIONS_THEAD
+	case THEAD_VENDOR_ID:
+		struct riscv_hwprobe marchid = {
+			.key = RISCV_HWPROBE_KEY_MARCHID,
+			.value = 0
+		};
+		struct riscv_hwprobe mimpid = {
+			.key = RISCV_HWPROBE_KEY_MIMPID,
+			.value = 0
+		};
+
+		hwprobe_arch_id(&marchid, cpus);
+		hwprobe_arch_id(&mimpid, cpus);
+		if (marchid.value != -1ULL && mimpid.value != -1ULL)
+			hwprobe_thead(marchid.value, mimpid.value, pair, cpus);
+		else
+			return -1;
+		break;
+#endif
 	default:
 		return -1;
 	}
diff --git a/arch/riscv/vendor_extensions/Makefile b/arch/riscv/vendor_extensions/Makefile
index e815895e9372..38c3e80469fd 100644
--- a/arch/riscv/vendor_extensions/Makefile
+++ b/arch/riscv/vendor_extensions/Makefile
@@ -1,3 +1,5 @@
 ifdef CONFIG_RELOCATABLE
 KBUILD_CFLAGS += -fno-pie
 endif
+
+obj-$(CONFIG_VENDOR_EXTENSIONS_THEAD) += thead/
diff --git a/arch/riscv/vendor_extensions/thead/Makefile b/arch/riscv/vendor_extensions/thead/Makefile
new file mode 100644
index 000000000000..7cf43c629b66
--- /dev/null
+++ b/arch/riscv/vendor_extensions/thead/Makefile
@@ -0,0 +1,8 @@
+ifdef CONFIG_FTRACE
+CFLAGS_REMOVE_extensions.o = $(CC_FLAGS_FTRACE)
+endif
+ifdef CONFIG_KASAN
+KASAN_SANITIZE_extensions.o := n
+endif
+
+obj-y += extensions.o
diff --git a/arch/riscv/vendor_extensions/thead/extensions.c b/arch/riscv/vendor_extensions/thead/extensions.c
new file mode 100644
index 000000000000..a177501bc99c
--- /dev/null
+++ b/arch/riscv/vendor_extensions/thead/extensions.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 by Rivos Inc.
+ */
+
+#include <asm/extensions.h>
+
+int hwprobe_thead(__u64 marchid, __u64 mimpid, struct riscv_hwprobe *pair,
+		  const struct cpumask *cpus)
+{
+	pair->value = 0;
+	switch (pair->key) {
+	case THEAD_ISA_EXT0:
+#ifdef CONFIG_RISCV_ISA_V
+		if (marchid == 0 && mimpid == 0)
+			pair->value |= THEAD_ISA_EXT0_V0_7_1;
+#endif
+		break;
+	default:
+		return -1;
+	}
+
+	return 0;
+}

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
