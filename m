Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14492C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 04:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=efRp7qlf3oiHEutsgEG2s2EYHbML+KPW1zhWOZAWvUk=; b=v48QI0GS8foTv7
	XjWA9EOGkNRZdbnWZibB3xc+iOjIv0gTh+XcYMj81lwYvwuKEt2mf9w0nNZ1gwWp9tVeTsgByZxSm
	xZs9N1n6pufthy5+CvWt+4ljJgK6m45lAzEpodfjcJ9uAuIqMtyLTnXEijJxRdIdkt/jcFWjqqXko
	/rb0b0yQ8Qha/R72cn3W5EWJpUIlf2/sI/wmHjO90TuJ2QvYUxK+pWNGU3rsyN6fos23VJdDzTiot
	NYtF5Ggbvptwrfd2cAe+gO+xzr6oelyYIBxxnGtmi64zNEQ9sOG5ZrugLOW9VAggIqk/6U6r8yOgh
	TFJAmWzBsHBAcMN7NPUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaD5-0000000Am7i-1QEj;
	Tue, 16 Apr 2024 04:14:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaBS-0000000AkmI-42O2
	for linux-riscv@bombadil.infradead.org;
	Tue, 16 Apr 2024 04:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RffB0o1A20UoURN50KRa9DaryhbtpvwRES2okh3bpYE=; b=URNtBqKnQhMm2FIj5LWHSLv9mf
	voCB2OHje9IFOiuMx9KnIJWfW3ejS3UhuYgBZys6uHoOnnxlI3J8G2QNUKQkwhfcdbBHG/YgzvN9I
	8JEn9vaqqmCtSLEKlPBbJ7xfH88PiEbYSrho8XVrvXo5KhBmUCK7UYyrRKhaUNysVtLerek9zsVbh
	0Fud2i5XvNfHEw3fMToMGEBaotBQpnioLrh3CZrXJ+nIennJbHMX87zT6vi5TGgpRFd2uRGQn8/RE
	UgcD1TkkoNkk4UCGgk5onN9GwV4hvApgDKe5QnnTTAI9WputoSOxMl1fjTXmOr1kdha2YITK9g7/a
	/W4lJ7HQ==;
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaBA-0000000AtU2-2nq5
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 04:12:36 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3c709618b59so526074b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 21:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240734; x=1713845534; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RffB0o1A20UoURN50KRa9DaryhbtpvwRES2okh3bpYE=;
        b=c9RTRiEsZ08hHwsmqbRnOiljSSM+rBGarVjk/6oWMKTJyt15R2BkLmttiI1/2B1M5T
         oUSVoPb8GR6hmoEBcH58/BFb0JsJuuBzR49fGnwhW0ExX/WVedpTVfXbPtRtBbN51bkX
         KRyz7a/ttMy7Zwwt7ULQvL1P1FmJXWx+AcOBvYGm+r6064F3R18yVqkI8ahvTC2RH6dM
         W1uySWf6WWBKZJjTF0eZ7eo3SOuDzQCKdLOhbxRUKjdZ+QMNQJR9z/Tnz5q+y5QJeMKc
         tyCPrjEYAfZVcTFJs/uz8sAE2P9cuBVWtQfRwGrZ0RVapyMddrYEwz8LrdJOYdu/igZO
         C/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240734; x=1713845534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RffB0o1A20UoURN50KRa9DaryhbtpvwRES2okh3bpYE=;
        b=uoWD0rJqkXYJFOJAGc9Dx1QO5GBdYPYUQz3mmnet1zakCkx0/nReElpHML7Hwi76k6
         uuqNTt87pIrLfbbTce11EIYNMMHj3UOIc/EKiOysWGEl4YmLPVIumwSWk1Fxo/4kq5UA
         5RzlOoM7mvGVbwsuppem6BrQGwZiGmKGqJ8yoNAI3ca4Q0qh7LxdW+tDUyRrhfoGRmss
         4KH81fRd6QhCzjGPCukq9EaRAzxOVgS8oSor1iXY+DC+JzhNcVSZjqXqxzGZ2lGigPkf
         KN3pcL+BLYnuMKVZ9veIErGJKUvnGMu8aMQemmGpvLmZ4N4x+m+m+zSAEn/tANpum7wL
         tPBw==
X-Gm-Message-State: AOJu0YwY1/m4HzlqJIxgqKzprIXbKs8mS7zpRO2fDm441lPVc/3e1wP9
	vIos/nrlUSA3MrUVPqR16lqBKT/gFjS22Bxx52udqF9VT1CHfZiY+JNc+UDwtoN2b/ikG4pw8pg
	v
X-Google-Smtp-Source: AGHT+IHx670NU+TlR/f3v9B4Qzuah3bLLv9HaSlF62K+k8e99IHEN5iKr7nVeiVqlVhKiS267JiWCQ==
X-Received: by 2002:a05:6808:199d:b0:3c7:2760:d52e with SMTP id bj29-20020a056808199d00b003c72760d52emr56390oib.52.1713240734403;
        Mon, 15 Apr 2024 21:12:14 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:13 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:12:05 -0700
Subject: [PATCH v2 08/17] riscv: drivers: Convert xandespmu to use the
 vendor extension framework
MIME-Version: 1.0
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-8-c7d68c603268@rivosinc.com>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=5822;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=j7hOaHqP/gwoL4jD1U/UQdhE9yXcwGHiVrD2cYUclQM=;
 b=0uoHwtzZ0HMjLFZ1Z0+67ZBZiFLnrjEiEVZz3A7YF2aFDJgj63u3xaTgyfzFXN4Mn1NQ/QS4Z
 dUA0C2swkhUANjDq2KpMi955RECXxD7uBiZof985lROPkNPq7hUBwOM
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_051224_867211_6550E355 
X-CRM114-Status: GOOD (  19.32  )
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
---
 arch/riscv/include/asm/hwcap.h                         |  4 +++-
 arch/riscv/include/asm/vendor_extensions.h             |  3 +++
 arch/riscv/kernel/cpufeature.c                         |  1 -
 arch/riscv/kernel/vendor_extensions.c                  |  4 ++++
 arch/riscv/kernel/vendor_extensions/Makefile           |  1 +
 arch/riscv/kernel/vendor_extensions/andes_extensions.c | 13 +++++++++++++
 drivers/perf/riscv_pmu_sbi.c                           |  7 ++++---
 7 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 38157be5becd..4b986e4b56f2 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -80,7 +80,6 @@
 #define RISCV_ISA_EXT_ZFA		71
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
-#define RISCV_ISA_EXT_XANDESPMU		74
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -103,6 +102,9 @@
  */
 #define RISCV_ISA_VENDOR_EXT_BASE		0x8000
 
+/* Andes Vendor Extensions */
+#define RISCV_ISA_VENDOR_EXT_XANDESPMU		0x8000
+
 /* THead Vendor Extensions */
 #define RISCV_ISA_VENDOR_EXT_XTHEADVECTOR	0x8000
 
diff --git a/arch/riscv/include/asm/vendor_extensions.h b/arch/riscv/include/asm/vendor_extensions.h
index 0a1955e1c900..33a430cc50cb 100644
--- a/arch/riscv/include/asm/vendor_extensions.h
+++ b/arch/riscv/include/asm/vendor_extensions.h
@@ -9,6 +9,9 @@
 extern const struct riscv_isa_ext_data riscv_isa_vendor_ext_thead[];
 extern const size_t riscv_isa_vendor_ext_count_thead;
 
+extern const struct riscv_isa_ext_data riscv_isa_vendor_ext_andes[];
+extern const size_t riscv_isa_vendor_ext_count_andes;
+
 bool get_isa_vendor_ext(unsigned long vendorid, const struct riscv_isa_ext_data **isa_vendor_ext,
 			size_t *count);
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 799ec2d2e9e0..949c06970c4f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -321,7 +321,6 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
-	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
index 3a8a6c6dd34e..c5ca02ce1bb1 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -21,6 +21,10 @@ bool __init get_isa_vendor_ext(unsigned long vendorid,
 		*isa_vendor_ext = riscv_isa_vendor_ext_thead;
 		*count = riscv_isa_vendor_ext_count_thead;
 		break;
+	case ANDES_VENDOR_ID:
+		*isa_vendor_ext = riscv_isa_vendor_ext_andes;
+		*count = riscv_isa_vendor_ext_count_andes;
+		break;
 	default:
 		*isa_vendor_ext = NULL;
 		*count = 0;
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index dcf3de8d4658..8014594aafa1 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+obj-y	+= andes_extensions.o
 obj-y	+= thead_extensions.o
diff --git a/arch/riscv/kernel/vendor_extensions/andes_extensions.c b/arch/riscv/kernel/vendor_extensions/andes_extensions.c
new file mode 100644
index 000000000000..b7450f99bfb5
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/andes_extensions.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/cpufeature.h>
+#include <asm/hwcap.h>
+#include <asm/vendor_extensions.h>
+
+#include <linux/array_size.h>
+
+const struct riscv_isa_ext_data riscv_isa_vendor_ext_andes[] = {
+	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_VENDOR_EXT_XANDESPMU),
+};
+
+const size_t riscv_isa_vendor_ext_count_andes = ARRAY_SIZE(riscv_isa_vendor_ext_andes);
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 8cbe6e5f9c39..13e37296cb5f 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -24,6 +24,7 @@
 #include <asm/errata_list.h>
 #include <asm/sbi.h>
 #include <asm/cpufeature.h>
+#include <asm/vendorid_list.h>
 
 #define ALT_SBI_PMU_OVERFLOW(__ovl)					\
 asm volatile(ALTERNATIVE_2(						\
@@ -32,7 +33,7 @@ asm volatile(ALTERNATIVE_2(						\
 		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
 		CONFIG_ERRATA_THEAD_PMU,				\
 	"csrr %0, " __stringify(ANDES_CSR_SCOUNTEROF),			\
-		0, RISCV_ISA_EXT_XANDESPMU,				\
+		ANDES_VENDOR_ID, RISCV_ISA_VENDOR_EXT_XANDESPMU,	\
 		CONFIG_ANDES_CUSTOM_PMU)				\
 	: "=r" (__ovl) :						\
 	: "memory")
@@ -41,7 +42,7 @@ asm volatile(ALTERNATIVE_2(						\
 asm volatile(ALTERNATIVE(						\
 	"csrc " __stringify(CSR_IP) ", %0\n\t",				\
 	"csrc " __stringify(ANDES_CSR_SLIP) ", %0\n\t",			\
-		0, RISCV_ISA_EXT_XANDESPMU,				\
+		ANDES_VENDOR_ID, RISCV_ISA_VENDOR_EXT_XANDESPMU,	\
 		CONFIG_ANDES_CUSTOM_PMU)				\
 	: : "r"(__irq_mask)						\
 	: "memory")
@@ -837,7 +838,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 		   riscv_cached_mimpid(0) == 0) {
 		riscv_pmu_irq_num = THEAD_C9XX_RV_IRQ_PMU;
 		riscv_pmu_use_irq = true;
-	} else if (riscv_isa_extension_available(NULL, XANDESPMU) &&
+	} else if (riscv_isa_vendor_extension_available(NULL, XANDESPMU) &&
 		   IS_ENABLED(CONFIG_ANDES_CUSTOM_PMU)) {
 		riscv_pmu_irq_num = ANDES_SLI_CAUSE_BASE + ANDES_RV_IRQ_PMOVI;
 		riscv_pmu_use_irq = true;

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
