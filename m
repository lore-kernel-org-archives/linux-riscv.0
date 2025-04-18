Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A9BC369D0
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 05:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/nU1kNKOckkTYFYVFNynKhSdyuO/9TlO8yzBmXrVws=; b=fkCX78IVDU+4/V
	XS11o1n6rzGPg8Pgu8KOPFj9j1AdMXSDxKg9ZT6dCvLGjZRu8ciZknNf4eTb3I6Oz1UtjUROq7cxp
	C7RX/H1+kNPsqun1tnhCmwMjtujtZ6kii713V2WfsoDI9HRUi6Q1OwhzlmNLbkS/+sLUXuce9Nlpo
	DSMue+5ZhqKwXwoBioXqH+DbNUrGYBS5aoe4yX0M8wO42nkEpL42JrLa/lmG5KZl/1NoM+flkftIv
	uE/Os7x13F8vAPr5P/3HM7ZXWdE1syNiG7P3ymUh4DQ5ydsZfEHzKOkpw4c9tNKJbt1AaV8YSdUNJ
	r52wi8dlyUuimftk+P4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eMi-0000000F9Jl-1riv;
	Fri, 18 Apr 2025 05:34:16 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eMg-0000000F9I8-2csy
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 05:34:15 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-879d2e419b9so1373699a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 22:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954454; x=1745559254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gt4C7mRaX1Tb3QqSfSFlu8KMBqofhvFO09DI6sp2P0=;
        b=e3XYSIbcVmnW9q99OVIaHsADEup2CpP3sFpVa+f6nO6Kv7YUzCyoXwyOVfCRto7xma
         z1+t9JCW/SLsg5DEKfh2SMM2DXzXStNlm610diRQM+WtrJEffe0H2SxbLdpXbYyZzHdY
         T1aNj3asDrFREFSPQdPcgpspLTqjMADyda7Qn7dYE23nE1EIsnBF8UHXGjyYs2TqvEK9
         Y3KApUWGds/onpfs0O5SZEoJLZdqyrbaWktHFRu9Yy2bRy2xbeRM7fJtwlO/bcUN5z5n
         yrJy5HN0ofaVzDBs5K7q7fDla3EU08oNmvXvTk3xeSOz/2hrk6La0rAwY5cRBCul0iMR
         04yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954454; x=1745559254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gt4C7mRaX1Tb3QqSfSFlu8KMBqofhvFO09DI6sp2P0=;
        b=KzZCtHce/4r4zM7qHHdKC4XMmds1syEdYrxeLHpLJ1LW9dAaBcImnphWQnSdY4+yzL
         CHyf4nPjoCwP+/eQJju8GYil/xAKE2PTCyQIz4vpOafSJ8EoY8NXTWzUwW53gtsWFKQ5
         p2HfB47pw0hfFTHOD0ha7R2DectyJmXBx8ePlAFNf8fNkng2Z+jm8S1yPXEh/OyqMivK
         aAaZMia6c1s1gRkwcw/NdMXd0cVdUXTlfceDFbj/Yq8M1LHu7DKjYR7rMHXe7XBJhPdI
         7RtYFpNKqnNYMBimWBfSogMEiM2GdnI+pXf2KI2y8A4sdpRyeNDvEhxam9mOeqrZHrWl
         vj0w==
X-Forwarded-Encrypted: i=1; AJvYcCWyS14nJ5Vsd4Kbo9g1fJuvgmJpThJMUP8ZiAMtvKkS23Ta+23UoqAEYt+Uiw+2AP1TLpp4U/euk+Udvw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxph7E0Ri7TS6X/DBY9eAWdj6p/0cIvTc6WVO9v+RjvZQL/hcwh
	DcfGIXeKCOacEBsvDRI9GZfYXG5W1tOt/EJF2/cLuKv3PzFzMuhKX+tIvsT4hmQ=
X-Gm-Gg: ASbGncsHWG5ojBV+/7ECHb0rZENGmzimO0xE+t7u+pNnYM0nGpENyNGJbUEm388xckK
	WdAO7cUxxhhrQld+TDDM+CvcrJPKjeVBh5t+0r2ySHfioM4dDW4ouncmRWqAvqAGAkYBcnyexL5
	Owe2IjmODwO7rBAxCeNIzWgh5CltSooaW7rjjmCpgfD87oHA/Lxj8AXaupG8jPNuiNFOZfw+t1m
	ytUVlX6Ky2ZnlcX+2eYbKR22eqM8aDQx9p3euq2+lOBCt+cxg86m5YS2WVtfQBknC4Ph6Ixggsy
	DgJbVgZktV6DnI3hjDXHIYZ47G2eQoYZTSr9tNJklRVTn8Ju86aXMMMsldTV9MCH1uELr0pTtJi
	J
X-Google-Smtp-Source: AGHT+IEgetGNHpjWMYo9c+dEgZ2LTsFOxYIMy38Euwjwvezit15u6T4SPBf7yW9+lanDmIf9AJdK0A==
X-Received: by 2002:a17:903:2441:b0:220:ea90:191e with SMTP id d9443c01a7336-22c535679abmr21208205ad.4.1744954453822;
        Thu, 17 Apr 2025 22:34:13 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:13 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH 02/12] riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
Date: Fri, 18 Apr 2025 13:32:29 +0800
Message-Id: <20250418053239.4351-3-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_223414_663999_148576FF 
X-CRM114-Status: GOOD (  16.72  )
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

Add SiFive vendor extension support to the kernel with the target of
"xsfvqmaccdod" and "xsfvqmaccqoq".

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/Kconfig.vendor                     | 13 +++++++++++++
 .../include/asm/vendor_extensions/sifive.h    | 14 ++++++++++++++
 arch/riscv/kernel/vendor_extensions.c         | 10 ++++++++++
 arch/riscv/kernel/vendor_extensions/Makefile  |  1 +
 arch/riscv/kernel/vendor_extensions/sifive.c  | 19 +++++++++++++++++++
 5 files changed, 57 insertions(+)
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive.h
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive.c

diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
index b096548fe0ff..e14f26368963 100644
--- a/arch/riscv/Kconfig.vendor
+++ b/arch/riscv/Kconfig.vendor
@@ -16,6 +16,19 @@ config RISCV_ISA_VENDOR_EXT_ANDES
 	  If you don't know what to do here, say Y.
 endmenu
 
+menu "SiFive"
+config RISCV_ISA_VENDOR_EXT_SIFIVE
+	bool "SiFive vendor extension support"
+	select RISCV_ISA_VENDOR_EXT
+	default y
+	help
+	  Say N here if you want to disable all SiFive vendor extension
+	  support. This will cause any SiFive vendor extensions that are
+	  requested by hardware probing to be ignored.
+
+	  If you don't know what to do here, say Y.
+endmenu
+
 menu "T-Head"
 config RISCV_ISA_VENDOR_EXT_THEAD
 	bool "T-Head vendor extension support"
diff --git a/arch/riscv/include/asm/vendor_extensions/sifive.h b/arch/riscv/include/asm/vendor_extensions/sifive.h
new file mode 100644
index 000000000000..608004250e2e
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/sifive.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_SIFIVE_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_SIFIVE_H
+
+#include <asm/vendor_extensions.h>
+
+#include <linux/types.h>
+
+#define RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD		0
+#define RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ		1
+
+extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_sifive;
+
+#endif
diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
index 9feb7f67a0a3..92d8ff81f42c 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -6,6 +6,7 @@
 #include <asm/vendorid_list.h>
 #include <asm/vendor_extensions.h>
 #include <asm/vendor_extensions/andes.h>
+#include <asm/vendor_extensions/sifive.h>
 #include <asm/vendor_extensions/thead.h>
 
 #include <linux/array_size.h>
@@ -15,6 +16,9 @@ struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[] = {
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_ANDES
 	&riscv_isa_vendor_ext_list_andes,
 #endif
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE
+	&riscv_isa_vendor_ext_list_sifive,
+#endif
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
 	&riscv_isa_vendor_ext_list_thead,
 #endif
@@ -45,6 +49,12 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 		cpu_bmap = riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap;
 		break;
 	#endif
+	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE
+	case SIFIVE_VENDOR_ID:
+		bmap = &riscv_isa_vendor_ext_list_sifive.all_harts_isa_bitmap;
+		cpu_bmap = riscv_isa_vendor_ext_list_sifive.per_hart_isa_bitmap;
+		break;
+	#endif
 	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
 	case THEAD_VENDOR_ID:
 		bmap = &riscv_isa_vendor_ext_list_thead.all_harts_isa_bitmap;
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index 866414c81a9f..d5fdde0e863b 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+= sifive.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead_hwprobe.o
diff --git a/arch/riscv/kernel/vendor_extensions/sifive.c b/arch/riscv/kernel/vendor_extensions/sifive.c
new file mode 100644
index 000000000000..990ac83b1f81
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/sifive.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/cpufeature.h>
+#include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/sifive.h>
+
+#include <linux/array_size.h>
+#include <linux/types.h>
+
+/* All SiFive vendor extensions supported in Linux */
+const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
+	__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),
+	__RISCV_ISA_EXT_DATA(xsfvqmaccqoq, RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ),
+};
+
+struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_sifive = {
+	.ext_data_count = ARRAY_SIZE(riscv_isa_vendor_ext_sifive),
+	.ext_data = riscv_isa_vendor_ext_sifive,
+};
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
