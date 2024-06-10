Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BE5C27C5E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 04:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WTjnveEiszQUcQkH5jcZyJ0uDCLodZyOJftmaEEbAno=; b=HuAedP5XzQGUhx
	qP/DfT7XXPltJgsm5XjL/qZjQdhvoD9T669TSK7tP8sb0Qnn+IcM2LC/r8VfNZnlG3hyEpO9yI7jR
	JPBuwHhv3i7RHQnQ2tP1VE2BG0y1ZEyiPpLxUx3p5nMcsfbqNJXl5KtrON6Ny/wjnLUmM8rpWbmPg
	JERsWLTIBKbTFl5J1jh9CgJCfGszQdGCyox1DvaMWsWnYY4ZwyMAy/Khf0RU1mBwa3FAXWrDd54WA
	yjb98nD2scDZ6xZjvnCdF74OWaXlVgj7C4NncGHb4qCgP0DaCCtTDBlqcikwsD7s6qCAaQn0TN+FY
	SNtLPcSEe++SO4XViTPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWv4-00000003mlz-2Ayo;
	Mon, 10 Jun 2024 04:46:10 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWur-00000003map-3M85
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 04:46:00 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-6ce533b643dso3003836a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jun 2024 21:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994756; x=1718599556; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibOh5mhf2lDK2VgbBqycF5Y5tsRu24lzyWUxq1Ze1io=;
        b=mjH0uhvF8o/Kd1IO8lLAevwRaJ/19X1+Ibtk6nc6GrBo6opBSxNq8acp21iOlkwgfe
         v/N+XzRAo27t6n2I1+be71a1yFnMa9nSgdc+yvY2X9F0vGiD4o7wf8ZMDILdaNO2h58Z
         yHrqoKbFPLDFizFOsERcNvKmKQMX9z/9aCj6Crg4cuV1EZ9QL1SKDUCKLj3/K5j8Hzjv
         3uUxJ2hCdsEXjv+a17hkMeoEfvtdhD25CXaz8vpWsew3PwyQ2AMcDgOZmES63tX5u84M
         T6GBlpp1ZKtTr2m7e1+lyJByKAQ7EYFXqPnWvOp+UOO2jyYQ7JsuPGQB2edU2EIPSY6n
         xMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994756; x=1718599556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibOh5mhf2lDK2VgbBqycF5Y5tsRu24lzyWUxq1Ze1io=;
        b=gbnbjXVOsJyriGqDYUfhzx6Dy1w3kqzad6N/68PC8sfvjy9C/8pPLzoKnud1jI/lO1
         fOjzx6mlKrNO0PUEeT2BQvzM+zLunm4QM/qg61RWRk7nnuuMoDfZWTxuxK1qhnxW0JpY
         BbtIoiscgNMgezRGnkfn4NY1CNJr27AfR04s/RZa+ZxvQIcLet9OLPV4qF7czuGOI3Ij
         gqaDBQ5IjMiUJr7BdKYr8cKWedyCnrkxuZI+eEpzV4apLiLgFqvpoZ5np/QZHBuIcyV9
         0frDGl2zpadsjRg68VgpXyrhI2SRJLKTDtQf/GVdNRXfHjTdXp5eTzn/anqhAZGdUeDD
         8lQQ==
X-Gm-Message-State: AOJu0Yy18eu6iUx2htxc+uNzSZfqHc+2bT12qFBll4Iz4dnYIqPSdoSR
	537UZfufGnSveHMHKwkw4iyJWThNDb7/lX/2B/X4t5918cmqJVypBGkt4yt+gs0=
X-Google-Smtp-Source: AGHT+IFYiS0Xgre0TS1VgGGozSkukfN3TS+NLAwJh0YKAf0g0itcq8Gbu+ETiSnp/WBs/8H1UcS00Q==
X-Received: by 2002:a05:6a20:5611:b0:1af:b1c0:c9eb with SMTP id adf61e73a8af0-1b2f9ca345fmr8199119637.45.1717994756262;
        Sun, 09 Jun 2024 21:45:56 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ce8asm73124095ad.77.2024.06.09.21.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:45:55 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 09 Jun 2024 21:45:15 -0700
Subject: [PATCH 10/13] riscv: hwprobe: Add thead vendor extension probing
MIME-Version: 1.0
Message-Id: <20240609-xtheadvector-v1-10-3fe591d7f109@rivosinc.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
In-Reply-To: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994732; l=7283;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BUrC1FP1l+VlTkuyGPq1vdTGQN5JGzKyHjNsgNBeuVI=;
 b=9AeRYOoE5uucxnbpp0YkhPhTVDvWr6CvfGZ+kz5AmCgv82yotrmqqFhtzoC0EgvJgeoS7t58m
 mMxcCighHXCCXInGmNZQ5y5q6VtbYphkZHQKzW9X8O1qezl58rlc6Ju
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_214558_576602_D9CB91A3 
X-CRM114-Status: GOOD (  19.91  )
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

Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0" which
allows userspace to probe for the new RISCV_ISA_VENDOR_EXT_XTHEADVECTOR
vendor extension.

This new key will allow userspace code to probe for which thead vendor
extensions are supported. This API is modeled to be consistent with
RISCV_HWPROBE_KEY_IMA_EXT_0. The bitmask returned will have each bit
corresponding to a supported thead vendor extension of the cpumask set.
Just like RISCV_HWPROBE_KEY_IMA_EXT_0, this allows a userspace program
to determine all of the supported thead vendor extensions in one call.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 arch/riscv/include/asm/hwprobe.h                   |  4 +--
 .../include/asm/vendor_extensions/thead_hwprobe.h  | 18 +++++++++++
 .../include/asm/vendor_extensions/vendor_hwprobe.h | 37 ++++++++++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
 arch/riscv/include/uapi/asm/vendor/thead.h         |  3 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  5 +++
 arch/riscv/kernel/vendor_extensions/Makefile       |  1 +
 .../riscv/kernel/vendor_extensions/thead_hwprobe.c | 19 +++++++++++
 8 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 630507dff5ea..e68496b4f8de 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
- * Copyright 2023 Rivos, Inc
+ * Copyright 2023-2024 Rivos, Inc
  */
 
 #ifndef _ASM_HWPROBE_H
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 6
+#define RISCV_HWPROBE_MAX_KEY 7
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
new file mode 100644
index 000000000000..925fef39a2c0
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_HWPROBE_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_HWPROBE_H
+
+#include <linux/cpumask.h>
+
+#include <uapi/asm/hwprobe.h>
+
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
+void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus);
+#else
+static inline void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus)
+{
+	pair->value = 0;
+}
+#endif
+
+#endif
diff --git a/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h
new file mode 100644
index 000000000000..b6222e7b519e
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2024 Rivos, Inc
+ */
+
+#ifndef _ASM_RISCV_SYS_HWPROBE_H
+#define _ASM_RISCV_SYS_HWPROBE_H
+
+#include <asm/cpufeature.h>
+
+#define EXT_KEY(ext)									\
+	do {										\
+		if (__riscv_isa_extension_available(isainfo->isa, RISCV_ISA_VENDOR_EXT_##ext)) \
+			pair->value |= RISCV_HWPROBE_VENDOR_EXT_##ext;			\
+		else									\
+			missing |= RISCV_HWPROBE_VENDOR_EXT_##ext;			\
+	} while (false)
+
+/*
+ * Loop through and record extensions that 1) anyone has, and 2) anyone
+ * doesn't have.
+ *
+ * _extension_checks is an arbitrary C block to set the values of pair->value
+ * and missing. It should be filled with EXT_KEY expressions.
+ */
+#define VENDOR_EXTENSION_SUPPORTED(pair, cpus, per_hart_thead_bitmap, _extension_checks)	\
+	do {											\
+		int cpu;									\
+		u64 missing;									\
+		for_each_cpu(cpu, (cpus)) {							\
+			struct riscv_isavendorinfo *isainfo = &(per_hart_thead_bitmap)[cpu];	\
+			_extension_checks							\
+		}										\
+		(pair)->value &= ~missing;							\
+	} while (false)										\
+
+#endif /* _ASM_RISCV_SYS_HWPROBE_H */
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index dda76a05420b..155a83dd1cdf 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
- * Copyright 2023 Rivos, Inc
+ * Copyright 2023-2024 Rivos, Inc
  */
 
 #ifndef _UAPI_ASM_HWPROBE_H
@@ -68,6 +68,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
+#define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0	7
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/include/uapi/asm/vendor/thead.h b/arch/riscv/include/uapi/asm/vendor/thead.h
new file mode 100644
index 000000000000..43790ebe5faf
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/vendor/thead.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#define		RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 969ef3d59dbe..e39fa70083d3 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -13,6 +13,7 @@
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
 #include <asm/vector.h>
+#include <asm/vendor_extensions/thead_hwprobe.h>
 #include <vdso/vsyscall.h>
 
 
@@ -217,6 +218,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 			pair->value = riscv_cboz_block_size;
 		break;
 
+	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
+		hwprobe_isa_vendor_ext_thead_0(pair, cpus);
+		break;
+
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
 	 * call, but get their element key set to -1 and value set to 0
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index 353522cb3bf0..866414c81a9f 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -2,3 +2,4 @@
 
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead_hwprobe.o
diff --git a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
new file mode 100644
index 000000000000..53f65942f7e8
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/vendor_extensions/thead.h>
+#include <asm/vendor_extensions/thead_hwprobe.h>
+#include <asm/vendor_extensions/vendor_hwprobe.h>
+
+#include <linux/cpumask.h>
+#include <linux/types.h>
+
+#include <uapi/asm/hwprobe.h>
+#include <uapi/asm/vendor/thead.h>
+
+void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus)
+{
+	VENDOR_EXTENSION_SUPPORTED(pair, cpus,
+				   riscv_isa_vendor_ext_list_thead.per_hart_isa_bitmap, {
+		EXT_KEY(XTHEADVECTOR);
+	});
+}

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
