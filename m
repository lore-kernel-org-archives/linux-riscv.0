Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1212BEE644E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 05:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOyyBoohQ1qliCw8lg7cl2eEpDAWnOXUTvwkAT0+mlg=; b=gg6mIhjScQKoy4
	rL9K+qae2UVuntssV6jWuNBIalqNriuvw+LLZIvdB17ql8Ajx61uUzjY96/BszVPdEIZr46doA+Du
	D5R+rt3XXjqFksnkLlTCr0Xk8YE3in5xFsojZpqQ3fQC05Xy2MTzKCld+Xlp9p4SfCK9qgBrQyj/4
	5Q942+tGx4jsXCn+3zBfk2T+efig3cWsVUJTNYsvwjmxzs/+5OXbPjyFsXUCTkMOc6fC3Oyg1wJir
	yQPVBjesIqZs1e49c/PLPegFUHBRmMoyta8RBpa1z+kH+yvtcmhBarwlCycTl9oo7rfp9N5RrRDfI
	qp82mS0mM5OHo1icbMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soco9-0000000Bw25-3sBL;
	Thu, 12 Sep 2024 05:55:57 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soco6-0000000BvzQ-341h
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 05:55:56 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2055a3f80a4so4058875ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 22:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726120554; x=1726725354; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=viUMUU3u3LkA8a3hOJ7VlIwEHpNEEIfLA3woGK8oJNk=;
        b=YDqQW6q5leye5L/qDtrjAYX0EQaxeANiL5GJV1qEq4LdDa5gZX2Tf0DbbebHEqI/8Q
         S1QYlHRAETFnMwlsOBOcpW2JO3ox7nyn4nMhkmEAGjkeG1XQAGHxKoOESQGECsg04aeQ
         zfNxjMREDPqh42AZSmZNPRrN56qXpIFIU0FAWTDv65a38DkEKlNr3d8ICn6o+6KukLWz
         ymiD2re0I1eKiBhgEYuCKasb+N9AjcsCuqF/LnbZU3Kc8CBn2mj6dznPlyYFJt30cYOT
         aYBHAHA+7Tn+/P8fU5AoUVD1yw4ga7pY77uXIQadMlI5rYIndJZMKZkOWQreO+J3w/0x
         iUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726120554; x=1726725354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=viUMUU3u3LkA8a3hOJ7VlIwEHpNEEIfLA3woGK8oJNk=;
        b=sOOuC/FwiFHYAmkNWrLYEsXIeW5NeTJBUf0cRWklYLEoBarTGHpbEb8u7/cUYguyIr
         gBzR9njAPMnXK8CYoaGFunDICul7hrdwoX/DkVNFY8mDM3+VS1yF8EktZjQiCC7/COBS
         t8fy1iNsXapd1tVJ3vbLSRQNAntkmQhvLZLAOpsZYlUq7n7pyo7wN+ydO0SI9kyQ8GWL
         9kFGmz5q0TlmgUCMn73jKA6jcvdkEtUCvB9ifxuzi9E1hCkdRhUOct3yuOM09yEphOqd
         BaWZRj1T+pjS7c7T2+p38aiuVLY3g8/VDKP+17qfJEa1py47zz34GYknJuIfHnOvd4Dl
         I+SQ==
X-Gm-Message-State: AOJu0YwitI5lZoq+6/vX4PqGYiSxibUgyShDQ7Zuu5UDxpbmZhSGP6kT
	HNGlKNvl/ot3hEqlJwwewV93uDBaLCC5x4n9XljwLBZKzjgzi/jhf02mSDw6FU4=
X-Google-Smtp-Source: AGHT+IG5mpBm1eyHei4WmYfnPGCFrEapYSKJ0y8GMBu3Dp21gWH8FBOiebyWcvmarJnu/rAhe4XXlQ==
X-Received: by 2002:a17:903:18b:b0:202:301f:36fd with SMTP id d9443c01a7336-2076e361277mr25777315ad.18.1726120553537;
        Wed, 11 Sep 2024 22:55:53 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afe99b6sm7870465ad.209.2024.09.11.22.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 22:55:52 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 11 Sep 2024 22:55:12 -0700
Subject: [PATCH v10 04/14] riscv: Add thead and xtheadvector as a vendor
 extension
MIME-Version: 1.0
Message-Id: <20240911-xtheadvector-v10-4-8d3930091246@rivosinc.com>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
In-Reply-To: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5060; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=7SdRVAdBMHX6BLgD+XlbPRIw5BjYE7igOjwZllEvap0=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qjpujKtEsuX0JT9H+cVk2rs/fJ5S47O7F57erJCd4yr
 tNq3M06SlkYxDgYZMUUWXiuNTC33tEvOypaNgFmDisTyBAGLk4BmAhbMCPDu8Swk5LesyMrmJvK
 zC1a+TtlFy+KXzrf6ohbRM5jp9/7GX6zr4toNCzybo09+t3n9+evN9w/7X2//u5Vg+vMlyMvat1
 mBwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_225554_813594_E1C2A9A2 
X-CRM114-Status: GOOD (  16.53  )
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

Add support to the kernel for THead vendor extensions with the target of
the new extension xtheadvector.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.vendor                        | 13 +++++++++++++
 arch/riscv/include/asm/vendor_extensions/thead.h | 16 ++++++++++++++++
 arch/riscv/kernel/cpufeature.c                   |  1 +
 arch/riscv/kernel/vendor_extensions.c            | 10 ++++++++++
 arch/riscv/kernel/vendor_extensions/Makefile     |  1 +
 arch/riscv/kernel/vendor_extensions/thead.c      | 18 ++++++++++++++++++
 6 files changed, 59 insertions(+)

diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
index 6f1cdd32ed29..9897442bd44f 100644
--- a/arch/riscv/Kconfig.vendor
+++ b/arch/riscv/Kconfig.vendor
@@ -16,4 +16,17 @@ config RISCV_ISA_VENDOR_EXT_ANDES
 	  If you don't know what to do here, say Y.
 endmenu
 
+menu "T-Head"
+config RISCV_ISA_VENDOR_EXT_THEAD
+	bool "T-Head vendor extension support"
+	select RISCV_ISA_VENDOR_EXT
+	default y
+	help
+	  Say N here to disable detection of and support for all T-Head vendor
+	  extensions. Without this option enabled, T-Head vendor extensions will
+	  not be detected at boot and their presence not reported to userspace.
+
+	  If you don't know what to do here, say Y.
+endmenu
+
 endmenu
diff --git a/arch/riscv/include/asm/vendor_extensions/thead.h b/arch/riscv/include/asm/vendor_extensions/thead.h
new file mode 100644
index 000000000000..48421d1553ad
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/thead.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_H
+
+#include <asm/vendor_extensions.h>
+
+#include <linux/types.h>
+
+/*
+ * Extension keys must be strictly less than RISCV_ISA_VENDOR_EXT_MAX.
+ */
+#define RISCV_ISA_VENDOR_EXT_XTHEADVECTOR		0
+
+extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_thead;
+
+#endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 8f20607adb40..46e69b9d66a7 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -25,6 +25,7 @@
 #include <asm/sbi.h>
 #include <asm/vector.h>
 #include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/thead.h>
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
index b6c1e7b5d34b..662ba64a8f93 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -6,6 +6,7 @@
 #include <asm/vendorid_list.h>
 #include <asm/vendor_extensions.h>
 #include <asm/vendor_extensions/andes.h>
+#include <asm/vendor_extensions/thead.h>
 
 #include <linux/array_size.h>
 #include <linux/types.h>
@@ -14,6 +15,9 @@ struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[] = {
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_ANDES
 	&riscv_isa_vendor_ext_list_andes,
 #endif
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
+	&riscv_isa_vendor_ext_list_thead,
+#endif
 };
 
 const size_t riscv_isa_vendor_ext_list_size = ARRAY_SIZE(riscv_isa_vendor_ext_list);
@@ -41,6 +45,12 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 		cpu_bmap = &riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap[cpu];
 		break;
 	#endif
+	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
+	case THEAD_VENDOR_ID:
+		bmap = &riscv_isa_vendor_ext_list_thead.all_harts_isa_bitmap;
+		cpu_bmap = &riscv_isa_vendor_ext_list_thead.per_hart_isa_bitmap[cpu];
+		break;
+	#endif
 	default:
 		return false;
 	}
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index 6a61aed944f1..353522cb3bf0 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
diff --git a/arch/riscv/kernel/vendor_extensions/thead.c b/arch/riscv/kernel/vendor_extensions/thead.c
new file mode 100644
index 000000000000..0f27baf8d245
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/thead.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/cpufeature.h>
+#include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/thead.h>
+
+#include <linux/array_size.h>
+#include <linux/types.h>
+
+/* All T-Head vendor extensions supported in Linux */
+static const struct riscv_isa_ext_data riscv_isa_vendor_ext_thead[] = {
+	__RISCV_ISA_EXT_DATA(xtheadvector, RISCV_ISA_VENDOR_EXT_XTHEADVECTOR),
+};
+
+struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_thead = {
+	.ext_data_count = ARRAY_SIZE(riscv_isa_vendor_ext_thead),
+	.ext_data = riscv_isa_vendor_ext_thead,
+};

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
