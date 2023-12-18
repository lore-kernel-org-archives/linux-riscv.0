Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6638CC35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 11:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hInlEEMNP70TaUjox6CjSRUMmtixnH1RZzUQociWOCY=; b=qRs1Z2fNNVlgQ2
	6LH006QUf8HRqCgg2tD7iuWnk16XnuTXzhr8DolguMUccAWs9Kj2vh3xuUTYAEvYxcWm7YADNDR1q
	nfzuFQ6soFTjnTFq3EUyGF1ZtWf7PoKQQiqVZs4ldBeDQUbBCsVgbpOBUOINcMnfmcVmx9QzkjgmW
	m9/srXy2wncq3eq7mjj46DvC3tteMoFN5FpdYs83J+gm5sq7fsmK+aBIxmj65Zq3md8WLgSkYNc0C
	zaYvwhrAecmYi012c/YWp/JJNhE+v9b/mvi4x5YVsSYo6+7KG0smVCI5HYAhr37Dr54HptZfi7Ny/
	dzU7MnZjx2IGxWuF0I2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBSv-009zAS-1l;
	Mon, 18 Dec 2023 11:07:17 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBSr-009z5O-3D;
	Mon, 18 Dec 2023 11:07:15 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a23566e91d5so103457466b.0;
        Mon, 18 Dec 2023 03:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702897631; x=1703502431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lerjiFsv40IIbLDp1yKfCOrHgxz1kvFlDa/xJlfcdo0=;
        b=df+BLlgRpzbi81JPiwGtrgt8eNTg4ZrKAozUpuuW8ilDxAMS/ZHW7U0FwU8VoAhzZd
         GzmhjID1UmN6Di30eigSzSMh2dvch1Pm3U5c2NQ6mN5ULravYitsVC7DA3dXCQkguT2J
         NagUkmTzFHdqjnjK2Zov4RjVQVNpz3F7UmgAshh7QejoKcg4vQA+B7Twj0ppcvK7bIss
         gE3H+tac56ULCV2wd0XadWpnLxaxfMmNaoCBd+458Npc+Jd1rln6K2nIXGt5k/ImPRfe
         RwZBtUoFiSWzCrgEYoN4ECGWq2V53xj7iQJ1gCinXNscLg5jEF4XlP+ueiyNMRWsUtTZ
         L/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702897631; x=1703502431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lerjiFsv40IIbLDp1yKfCOrHgxz1kvFlDa/xJlfcdo0=;
        b=mkwZdY0URlIH/n0lYX/nOc/rnJvUJbp2iO32TxLNEwGCYDyJ+ry7F7XPTnlK8x6Xvg
         iZFIIIAMvtp+f8ALk00IVvckQ5lEyBvv+nwWWGNbT26NT1JuC7mx+eM+ErYKOSASJO3C
         J279UBqNPS4u2QfsbiT+EGEgNoVe/Q4CKz18Q5EZ0kxj6NNWVvjgIdueA42NkfZfQJrz
         U2IgBTXJtUVXgSYislsOW9VMXtW9zhCL7R030YNIKIrlp+OqR1J7Z9CzvfZGLsGsst/E
         8e2vqftMz+pu8g3cQoSleil7+eVcso/2kj/0OYbB95x+Nnerjnh6EAlGxRdTF0PAhoTm
         uUpA==
X-Gm-Message-State: AOJu0YwqhhSrf/zxNn8a5nqbV5+4X8JWaZL3ZWSn7UNQ3BDO14MMnsi6
	BQzmOCNyNWss07lqlxThZiA=
X-Google-Smtp-Source: AGHT+IGQMtd6fso8NFusjQjFPqt6Spt8yZ8CBjuG18cqbhcpV/I/x5LWeBsLrRHnA3YL1WPAg7whNQ==
X-Received: by 2002:a17:906:11cd:b0:a23:365d:fc74 with SMTP id o13-20020a17090611cd00b00a23365dfc74mr870108eja.125.1702897630746;
        Mon, 18 Dec 2023 03:07:10 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.164])
        by smtp.gmail.com with ESMTPSA id pj4-20020a170906d78400b00a2353af1f7bsm1406769ejb.92.2023.12.18.03.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 03:07:10 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH v2 5/5] cpufreq: Make sun50i h6 cpufreq Kconfig option arch generic
Date: Mon, 18 Dec 2023 12:05:43 +0100
Message-Id: <20231218110543.64044-6-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231218110543.64044-1-fusibrandon13@gmail.com>
References: <20231218110543.64044-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_030714_062328_B7CD2BF1 
X-CRM114-Status: GOOD (  13.39  )
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

Move the Allwinner SUN50I cpufreq driver from Kconfig.arm to the
main Kconfig file so it supports other architectures, like RISC-V
in our case, and drop the 'ARM_' prefix.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/Kconfig     | 12 ++++++++++++
 drivers/cpufreq/Kconfig.arm | 12 ------------
 drivers/cpufreq/Makefile    |  2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index 35efb53d5..50aa66cfc 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -301,5 +301,17 @@ config QORIQ_CPUFREQ
 	  This adds the CPUFreq driver support for Freescale QorIQ SoCs
 	  which are capable of changing the CPU's frequency dynamically.
 
+config ALLWINNER_SUN50I_CPUFREQ_NVMEM
+	tristate "Allwinner nvmem based SUN50I CPUFreq driver"
+	depends on ARCH_SUNXI
+	depends on NVMEM_SUNXI_SID
+	select PM_OPP
+	help
+	  This adds the nvmem based CPUFreq driver for Allwinner
+	  h6/D1 SoCs.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called sun50i-cpufreq-nvmem.
+
 endif
 endmenu
diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index f91160689..98b8e6eef 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -29,18 +29,6 @@ config ACPI_CPPC_CPUFREQ_FIE
 
 	  If in doubt, say N.
 
-config ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM
-	tristate "Allwinner nvmem based SUN50I CPUFreq driver"
-	depends on ARCH_SUNXI
-	depends on NVMEM_SUNXI_SID
-	select PM_OPP
-	help
-	  This adds the nvmem based CPUFreq driver for Allwinner
-	  h6 SoC.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called sun50i-cpufreq-nvmem.
-
 config ARM_APPLE_SOC_CPUFREQ
 	tristate "Apple Silicon SoC CPUFreq support"
 	depends on ARCH_APPLE || (COMPILE_TEST && 64BIT)
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index 8d141c71b..110b676d2 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -78,7 +78,7 @@ obj-$(CONFIG_ARM_SCMI_CPUFREQ)		+= scmi-cpufreq.o
 obj-$(CONFIG_ARM_SCPI_CPUFREQ)		+= scpi-cpufreq.o
 obj-$(CONFIG_ARM_SPEAR_CPUFREQ)		+= spear-cpufreq.o
 obj-$(CONFIG_ARM_STI_CPUFREQ)		+= sti-cpufreq.o
-obj-$(CONFIG_ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM) += sun50i-cpufreq-nvmem.o
+obj-$(CONFIG_ALLWINNER_SUN50I_CPUFREQ_NVMEM) += sun50i-cpufreq-nvmem.o
 obj-$(CONFIG_ARM_TEGRA20_CPUFREQ)	+= tegra20-cpufreq.o
 obj-$(CONFIG_ARM_TEGRA124_CPUFREQ)	+= tegra124-cpufreq.o
 obj-$(CONFIG_ARM_TEGRA186_CPUFREQ)	+= tegra186-cpufreq.o
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
