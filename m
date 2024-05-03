Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CB0C10F16
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 18:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pyiZ4beuKN6kz9H9lx/ZBQL1cBC/lNqo0Zrmcx95RJA=; b=hBo59b8uleZtKH
	xDcax8oryuoj+v6q1OHKjvJrN9YIrNxFBcYZoVT5lOCDQ46mm6FS43LeYy9S9w1FPF/lWupAdecID
	a5t+WUa+pNCZywpIUGmAF1LAiB6wFmPV4n6psRQqS04+K22esX8gCS10LLYOD3M/lX9GqB2rd6b8T
	ErOFXkcjvfkPMyu701YYZsxqvm5UTYKDYljWzBYKcQzm+eDF4vA0/yJPd+rkrEGjHc3aboK1utu5K
	5VMkcKT/O/kzJP63o87K+N4juik+meGMFv3whm8lWgRoIRuisUDOQWoy6bw/t07Feg/6tWQw6qtU5
	foK5W5PZwpveuaPni4rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xVK-0000000HXLN-0tgd;
	Fri, 03 May 2024 18:19:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xUw-0000000HX2P-2nKN
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 May 2024 18:19:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ujQxTZeE520nkOipS00wFx8xEDXBPcdfeer4cCY0Dk8=; b=Tr3JRNeLUNjzfCgYcQJpB4jYes
	7aS6hegRRQXKdfxzN263H3S5BYJywCQfewFrskGvJqWROS3/N2jrevGPtO8X/uX8/SKOTcPqy4wg1
	bAx3jri6oO1eQnFmkWnjq++LO0UeYUH084UZCUBKuOS058bEn5BK7nn+oI6koJvm9xmbzB02lJdsR
	5mW+fEyGc2BFj9dccfH5bDXHSeVZoY3/oMUgPX8kJYojygQvAtZGM2yhWKJqAEzgcYUpEVcwHVr6L
	NweVj2Awa6Mb3YZzLkKMM9Af4upCAIATBk7EzkRVT+gXmPB+3jvmt/cOg6BvSCJm+bk7utpeldZ/n
	NQbAKedQ==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xUt-00000000du6-0xvp
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 18:19:05 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6f4178aec15so18887b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 11:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760341; x=1715365141; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ujQxTZeE520nkOipS00wFx8xEDXBPcdfeer4cCY0Dk8=;
        b=N6X9mVlLbYWb7QoRbLNi979z/UD0sLn/b7Gp2qRqGdhmnM5NTnHVjHL55A1g9WorQ5
         h2AhS8LBMTatvsrUtjm648OFdDzGwp5nC5Apu7BNzZX/8CGHOF6WxDjiqSzYI6Id5h7H
         J6UJlZICp4eQo1xmdVGFrxeMoRPAzsiTgsz0mhsnhI+zf94V8oX4/MoDJHR3Q35q6CGY
         XPiPylhCxOZGixDgEY2B9MG6Bjk5YBiTE1EJYw3sMzJUqaQprO3CoAJevVtzfvO41uw4
         wYzpfHXsUh09tU75jxZLZkWl0gnCzIZ+TpDvMgPDOW8RIagV1GlMXyvxnubuhPQ2Otip
         mtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760341; x=1715365141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujQxTZeE520nkOipS00wFx8xEDXBPcdfeer4cCY0Dk8=;
        b=ecktC1G2y8U2Z/z/cNiS2ZeL2jsoVarloZhCAhKvHj/J+OaxtTiZTLYJOjqw/D2e0e
         WdIPkyHFMMM3C+3Kmm4ceTo3z8Eztgf1Xmy09i6Fj5csMlJYLYoW399KRnkj46FX+VQg
         hsG/W/wZhoVRGS1UorGKpXHkL3gxrLjjx3UX3lxSOEDoE8dyHT43LjVWBWttFfWiQhLu
         sUvrIs4vwdTnTq9pGsZA0mRHjWRKsSWzXZDZF2ZB2L+1/G3zKOO6OC4bW1a7GiH0OuEy
         EYa2+L2X8bC06yuiHHPISyzR7Z5ybXFsteATw2fZMoJ/ud9k7btT1zN3U0I8LXbfWIZW
         8yWQ==
X-Gm-Message-State: AOJu0YzMJFPex5NxlPBXwfNKMf6+4B1vghz4/GXoeIytJs5co8kDEC6L
	cn0bRSmDo6kRF53O2/nMBXBUkUPVh31olCxqPoZqDyCBiEV0+dLGiqkjfHRUTgQ=
X-Google-Smtp-Source: AGHT+IEys/W7BFW1yCkUVLwbHKyE+BaLBJVWtVQG35pqqxasPxO6DmEpuLkPsaFLueOtHOV2sGKM9A==
X-Received: by 2002:a05:6a00:1a8d:b0:6f3:f30a:19b with SMTP id e13-20020a056a001a8d00b006f3f30a019bmr3067135pfv.18.1714760341150;
        Fri, 03 May 2024 11:19:01 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:19:00 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:24 -0700
Subject: [PATCH v6 09/17] riscv: Convert xandespmu to use the vendor
 extension framework
MIME-Version: 1.0
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-9-cb7624e65d82@rivosinc.com>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760319; l=8114;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=Ib4Ayc+WK72PWMBLjvh6tq7M51T5ZHochtOdzpj1j28=;
 b=SI0nN412Z2NBm5YWvzPQYJF5ZqiBEGbGo2vA2iY888NS7ytqTn5WHifENaO8YKhHZoJ/3ucQt
 7lzGlUdNH/bAXKxyiLJyRx3a7XkpbF/U+aQWwO89qQhwBgEUj5XcwWp
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_191903_441126_D5963E4D 
X-CRM114-Status: GOOD (  22.63  )
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

Migrate xandespmu out of riscv_isa_ext and into a new Andes-specific
vendor namespace.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.vendor                        | 12 ++++++++++++
 arch/riscv/errata/andes/errata.c                 |  2 ++
 arch/riscv/include/asm/hwcap.h                   |  1 -
 arch/riscv/include/asm/vendor_extensions/andes.h | 19 +++++++++++++++++++
 arch/riscv/kernel/cpufeature.c                   |  1 -
 arch/riscv/kernel/vendor_extensions.c            | 10 ++++++++++
 arch/riscv/kernel/vendor_extensions/Makefile     |  1 +
 arch/riscv/kernel/vendor_extensions/andes.c      | 18 ++++++++++++++++++
 drivers/perf/riscv_pmu_sbi.c                     |  9 ++++++---
 9 files changed, 68 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
index 85ac30496b0e..aa5a191e659e 100644
--- a/arch/riscv/Kconfig.vendor
+++ b/arch/riscv/Kconfig.vendor
@@ -16,4 +16,16 @@ config RISCV_ISA_VENDOR_EXT_THEAD
 	  If you don't know what to do here, say Y.
 endmenu
 
+menu "Andes"
+config RISCV_ISA_VENDOR_EXT_ANDES
+	bool "Andes vendor extension support"
+	default y
+	help
+	  Say N here if you want to disable all Andes vendor extension
+	  support. This will cause any Andes vendor extensions that are
+	  requested by hardware probing to be ignored.
+
+	  If you don't know what to do here, say Y.
+endmenu
+
 endmenu
diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
index f2708a9494a1..a5d96a7a4682 100644
--- a/arch/riscv/errata/andes/errata.c
+++ b/arch/riscv/errata/andes/errata.c
@@ -65,6 +65,8 @@ void __init_or_module andes_errata_patch_func(struct alt_entry *begin, struct al
 					      unsigned long archid, unsigned long impid,
 					      unsigned int stage)
 {
+	BUILD_BUG_ON(ERRATA_ANDES_NUMBER >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
+
 	if (stage == RISCV_ALTERNATIVES_BOOT)
 		errata_probe_iocp(stage, archid, impid);
 
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e17d0078a651..1f2d2599c655 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -80,7 +80,6 @@
 #define RISCV_ISA_EXT_ZFA		71
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
-#define RISCV_ISA_EXT_XANDESPMU		74
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/asm/vendor_extensions/andes.h b/arch/riscv/include/asm/vendor_extensions/andes.h
new file mode 100644
index 000000000000..7bb2fc43438f
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/andes.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_ANDES_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_ANDES_H
+
+#include <asm/vendor_extensions.h>
+
+#include <linux/types.h>
+
+#define RISCV_ISA_VENDOR_EXT_XANDESPMU		0
+
+/*
+ * Extension keys should be strictly less than max.
+ * It is safe to increment this when necessary.
+ */
+#define RISCV_ISA_VENDOR_EXT_MAX_ANDES			32
+
+extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_andes;
+
+#endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 2a5527020d0f..2993318b8ea2 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -289,7 +289,6 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
-	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
index 7910890c17de..e4d58938e6ce 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -5,6 +5,7 @@
 
 #include <asm/vendorid_list.h>
 #include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/andes.h>
 #include <asm/vendor_extensions/thead.h>
 
 #include <linux/array_size.h>
@@ -14,6 +15,9 @@ struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[] = {
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
 	&riscv_isa_vendor_ext_list_thead,
 #endif
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_ANDES
+	&riscv_isa_vendor_ext_list_andes,
+#endif
 };
 
 const size_t riscv_isa_vendor_ext_list_size = ARRAY_SIZE(riscv_isa_vendor_ext_list);
@@ -40,6 +44,12 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 		bmap = &riscv_isa_vendor_ext_list_thead.all_harts_isa_bitmap;
 		cpu_bmap = &riscv_isa_vendor_ext_list_thead.per_hart_isa_bitmap[cpu];
 		break;
+#endif
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_ANDES
+	case ANDES_VENDOR_ID:
+		bmap = &riscv_isa_vendor_ext_list_andes.all_harts_isa_bitmap;
+		cpu_bmap = &riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap[cpu];
+		break;
 #endif
 	default:
 		return false;
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index 3383066baaab..8f1c5a4dc38f 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
diff --git a/arch/riscv/kernel/vendor_extensions/andes.c b/arch/riscv/kernel/vendor_extensions/andes.c
new file mode 100644
index 000000000000..ec688c88456a
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/andes.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/cpufeature.h>
+#include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/andes.h>
+
+#include <linux/array_size.h>
+#include <linux/types.h>
+
+/* All Andes vendor extensions supported in Linux */
+const struct riscv_isa_ext_data riscv_isa_vendor_ext_andes[] = {
+	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_VENDOR_EXT_XANDESPMU),
+};
+
+struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_andes = {
+	.ext_data_count = ARRAY_SIZE(riscv_isa_vendor_ext_andes),
+	.ext_data = riscv_isa_vendor_ext_andes,
+};
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 8cbe6e5f9c39..d39b01372fa5 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -24,6 +24,8 @@
 #include <asm/errata_list.h>
 #include <asm/sbi.h>
 #include <asm/cpufeature.h>
+#include <asm/vendorid_list.h>
+#include <asm/vendor_extensions/andes.h>
 
 #define ALT_SBI_PMU_OVERFLOW(__ovl)					\
 asm volatile(ALTERNATIVE_2(						\
@@ -32,7 +34,7 @@ asm volatile(ALTERNATIVE_2(						\
 		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
 		CONFIG_ERRATA_THEAD_PMU,				\
 	"csrr %0, " __stringify(ANDES_CSR_SCOUNTEROF),			\
-		0, RISCV_ISA_EXT_XANDESPMU,				\
+		ANDES_VENDOR_ID, RISCV_ISA_VENDOR_EXT_XANDESPMU,	\
 		CONFIG_ANDES_CUSTOM_PMU)				\
 	: "=r" (__ovl) :						\
 	: "memory")
@@ -41,7 +43,7 @@ asm volatile(ALTERNATIVE_2(						\
 asm volatile(ALTERNATIVE(						\
 	"csrc " __stringify(CSR_IP) ", %0\n\t",				\
 	"csrc " __stringify(ANDES_CSR_SLIP) ", %0\n\t",			\
-		0, RISCV_ISA_EXT_XANDESPMU,				\
+		ANDES_VENDOR_ID, RISCV_ISA_VENDOR_EXT_XANDESPMU,	\
 		CONFIG_ANDES_CUSTOM_PMU)				\
 	: : "r"(__irq_mask)						\
 	: "memory")
@@ -837,7 +839,8 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 		   riscv_cached_mimpid(0) == 0) {
 		riscv_pmu_irq_num = THEAD_C9XX_RV_IRQ_PMU;
 		riscv_pmu_use_irq = true;
-	} else if (riscv_isa_extension_available(NULL, XANDESPMU) &&
+	} else if (riscv_has_vendor_extension_unlikely(ANDES_VENDOR_ID,
+						       RISCV_ISA_VENDOR_EXT_XANDESPMU) &&
 		   IS_ENABLED(CONFIG_ANDES_CUSTOM_PMU)) {
 		riscv_pmu_irq_num = ANDES_SLI_CAUSE_BASE + ANDES_RV_IRQ_PMOVI;
 		riscv_pmu_use_irq = true;

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
