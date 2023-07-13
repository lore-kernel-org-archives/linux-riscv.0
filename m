Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA64AC001E0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 12:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09KULVG6mk+30v2ST4E11iTNfjvO+d/fShpo+HL3log=; b=ua9RL+hbZ1z+Qy
	nOLZ5JciZKOIV/pJ/1UeuMiErrPO9g9M0FSn11iWXRbr/VqqjFqnT6XxRWOsbiaP4ayRY2lFYJgUT
	wD9b2S/3MQQ+NjbMWjLFYZf2KSaVfddOXhUNpd34a8TNcw8GkUnkpBRfHeoeQYk87CJPJx8T9B2Kf
	nhBRTFZOOFozEpcRwft5EQY6F/cELn6PlV5oB+y4MuWRoGh88N04AIFqcOrboHkqruiFcvdbxiAiM
	wJqeyB1+N8BIAHZUk6TZqNpasWXfkVnRwiiGKcht4+0WPQWw4oEriC15/9qjoOpRH08eS2KQbkXQ0
	3LxKyCX2MT6qwyoLCFjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvC2-003ByI-1H;
	Thu, 13 Jul 2023 12:13:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvBy-003Bua-1n
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 12:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689250387; x=1720786387;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ao2V3XKzPyOMhVIBq5e6EqE2FH88Dgn3v9ob0DWGpxw=;
  b=Y0R0owfK+U9SZM+LO8jjgIyGqm1QHTCEQNMXAP+XZaEl/udHdTxKTe6S
   8iFBN+1HES98TyP0ceCixrraPr6QJxUmZ5SA15s6wwfyJa5x0ouMQTnXX
   yQrSwSOat0YD0JPbciWmLP06I3my9WjtCCmjoUZ6LNX4CTLudx0llzscF
   FpPzRVI2VGu3RKqoV8PabE9LUEZWOow/mpvB70b2Ic0Ydhhqdhg7c07Z4
   ynzrJvEmrizAB1n2EfVP8W5kJDd8KdlmBimDi3ooC+UTBMAzHM120KJCp
   4tp4CobKgoNo8aMk/uTfXyeTVyFyHSwGCZPSg5QotLpDo5K/aHU7utoyy
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="220194646"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2023 05:13:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 13 Jul 2023 05:13:02 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 13 Jul 2023 05:12:59 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v5 11/11] RISC-V: provide Kconfig & commandline options to control parsing "riscv,isa"
Date: Thu, 13 Jul 2023 13:11:09 +0100
Message-ID: <20230713-aviator-plausibly-a35662485c2c@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713-target-much-8ac624e90df8@wendy>
References: <20230713-target-much-8ac624e90df8@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5841; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Ao2V3XKzPyOMhVIBq5e6EqE2FH88Dgn3v9ob0DWGpxw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnrX95I9v60+YCl/c5LJ3cqRWZvnjRp565oX06n/HV3lx+c ofDKq6OUhUGMg0FWTJEl8XZfi9T6Py47nHvewsxhZQIZwsDFKQATMexgZNgqPTXXwvqLudMPSY2f8V /b76280eY6dS/jD7am1S1P7WQZGZof1Ub+Pbw85ulcA+vHq+btfvHtIMc3/sxHlo/ZvUzrZ/ICAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_051306_671331_5E833484 
X-CRM114-Status: GOOD (  23.37  )
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
Cc: devicetree@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org, conor.dooley@microchip.com, Rob Herring <robh+dt@kernel.org>, Evan Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko
 Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

As it says on the tin, provide Kconfig option to control parsing the
"riscv,isa" devicetree property. If either option is used, the kernel
will fall back to parsing "riscv,isa", where "riscv,isa-base" and
"riscv,isa-extensions" are not present.
The Kconfig options are set up so that the default kernel configuration
will enable the fallback path, without needing the commandline option.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v4:
- add __init to fixup k210 build issue
- use Drew's revised wording

Changes in v3:
- Invert the Kconfig entry. It's now default y & not hidden by
  NONPORTABLE, but its entablement will now activate the fallback
- Add a commandline option to enable the fallback on kernels that do not
  enable it in Kconfig, as Drew suggested
- Default the global var to the Kconfig option & override it with the
  commandline one, rather than have checks for IS_ENABLED() and for the
  commandline option in riscv_fill_hwcap() &
  riscv_early_of_processor_hartid()
---
 .../admin-guide/kernel-parameters.txt          |  7 +++++++
 arch/riscv/Kconfig                             | 18 ++++++++++++++++++
 arch/riscv/include/asm/hwcap.h                 |  1 +
 arch/riscv/kernel/cpu.c                        |  8 +++++++-
 arch/riscv/kernel/cpufeature.c                 | 14 +++++++++++++-
 5 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a1457995fd41..bdc3fa712e92 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5468,6 +5468,13 @@
 			[KNL] Disable ring 3 MONITOR/MWAIT feature on supported
 			CPUs.
 
+	riscv_isa_fallback [RISCV]
+			When CONFIG_RISCV_ISA_FALLBACK is not enabled, permit
+			falling back to detecting extension support by parsing
+			"riscv,isa" property on devicetree systems when the
+			replacement properties are not found. See the Kconfig
+			entry for RISCV_ISA_FALLBACK.
+
 	ro		[KNL] Mount root device read-only on boot
 
 	rodata=		[KNL]
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4c07b9189c86..f52dd125ac5e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -848,6 +848,24 @@ config XIP_PHYS_ADDR
 	  be linked for and stored to.  This address is dependent on your
 	  own flash usage.
 
+config RISCV_ISA_FALLBACK
+	bool "Permit falling back to parsing riscv,isa for extension support by default"
+	default y
+	help
+	  Parsing the "riscv,isa" devicetree property has been deprecated and
+	  replaced by a list of explicitly defined strings. For compatibility
+	  with existing platforms, the kernel will fall back to parsing the
+	  "riscv,isa" property if the replacements are not found.
+
+	  Selecting N here will result in a kernel that does not use the
+	  fallback, unless the commandline "riscv_isa_fallback" parameter is
+	  present.
+
+	  Please see the dt-binding, located at
+	  Documentation/devicetree/bindings/riscv/extensions.yaml for details
+	  on the replacement properties, "riscv,isa-base" and
+	  "riscv,isa-extensions".
+
 endmenu # "Boot options"
 
 config BUILTIN_DTB
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e3cda14a486b..b7b58258f6c7 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -81,6 +81,7 @@ struct riscv_isa_ext_data {
 
 extern const struct riscv_isa_ext_data riscv_isa_ext[];
 extern const size_t riscv_isa_ext_count;
+extern bool riscv_isa_fallback;
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 28d5af21f544..208f1a700121 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -41,7 +41,7 @@ int riscv_of_processor_hartid(struct device_node *node, unsigned long *hart)
 	return 0;
 }
 
-int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *hart)
+int __init riscv_early_of_processor_hartid(struct device_node *node, unsigned long *hart)
 {
 	const char *isa;
 
@@ -87,6 +87,12 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
 	return 0;
 
 old_interface:
+	if (!riscv_isa_fallback) {
+		pr_warn("CPU with hartid=%lu is invalid: this kernel does not parse \"riscv,isa\"",
+			*hart);
+		return -ENODEV;
+	}
+
 	if (of_property_read_string(node, "riscv,isa", &isa)) {
 		pr_warn("CPU with hartid=%lu has no \"riscv,isa-base\" or \"riscv,isa\" property\n",
 			*hart);
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index fdc71e52dc2b..71fb840ee246 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -473,6 +473,18 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 	return 0;
 }
 
+#ifdef CONFIG_RISCV_ISA_FALLBACK
+bool __initdata riscv_isa_fallback = true;
+#else
+bool __initdata riscv_isa_fallback;
+static int __init riscv_isa_fallback_setup(char *__unused)
+{
+	riscv_isa_fallback = true;
+	return 1;
+}
+early_param("riscv_isa_fallback", riscv_isa_fallback_setup);
+#endif
+
 void __init riscv_fill_hwcap(void)
 {
 	char print_str[NUM_ALPHA_EXTS + 1];
@@ -492,7 +504,7 @@ void __init riscv_fill_hwcap(void)
 	} else {
 		int ret = riscv_fill_hwcap_from_ext_list(isa2hwcap);
 
-		if (ret) {
+		if (ret && riscv_isa_fallback) {
 			pr_info("Falling back to deprecated \"riscv,isa\"\n");
 			riscv_fill_hwcap_from_isa_string(isa2hwcap);
 		}
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
