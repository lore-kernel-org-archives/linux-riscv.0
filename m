Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D5FEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 09:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJxxfgN9g/iPaEVgeFXzFndqW1zVJXDdNtyQGuuNbwE=; b=n4pqkC3rivpe3g
	TpSxOe15W6loSbD7qTCKyOcMgNogYNw2PblHCE1JvjMnzKGlv0mOAN3szQvS7Zw3Oj5YSQ8tiQq9J
	XJK8FVdwqPVhgHGdCPm3VvRksN4CJJ1nDNYYxEynMbtjrCpwKy/PsUHn5G/HR5vSpzXdBsntHCC0F
	KG2OgLXdfUOvzbkz/bi8fPGe9bNdoH4CSpjcIPCWTw9djOts1fm+h880oZdCeyneWzb8gIWeo0u9G
	4AUO+XoC+2VcjTP6Sc0q5UJRGrdNs+mE8P3osFqdth5WD8cbna1m0YpV/Uk0bqPlglCPcyfreh9XO
	UfohaS4+hLekWs+xTABg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInKL-00B39f-1A;
	Mon, 10 Jul 2023 09:37:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInKH-00B35r-0s
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 09:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688981822; x=1720517822;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O+veMtx+JvcXWx4LygV6hHgSQoTVwUJDCTyGDuzrzBQ=;
  b=hIFEoWxKva6gVLzyd7jj/zQfSAz2RQIzGmoNZRm38/SWGOaGhI3sPqpt
   3UoNnqWkDhmOiumj5YUsvhLtAK6biu2SDWp15oCbDGERUiq+6Ua5Wg1Uf
   9Mhsc4dSnjefU1VBsKHO/z0n9kiTF5sAZmO5X79IPatQjcRTEWAqLCgn3
   ZiwvumCAgg4kHTMFstnDULJKm/MrQ8zfgElgGyfTFGejAmL2kOQalEbvF
   l+HmEQtEgu/silUMtc7v5JZz1jUq9SuTOi8AkqqOsZKk2sUHv2xKZNpkT
   UsUl1VUGfwBK82N2FhdHRzwASOnpoBi5i+sCfm7Vn3h/nEgJJ4h22xWd1
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="222870094"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jul 2023 02:37:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 10 Jul 2023 02:36:59 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 10 Jul 2023 02:36:57 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v4 11/11] RISC-V: provide Kconfig & commandline options to control parsing "riscv,isa"
Date: Mon, 10 Jul 2023 10:35:46 +0100
Message-ID: <20230710-reappear-unable-5f954043552a@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230710-equipment-stained-dd042d66ba5d@wendy>
References: <20230710-equipment-stained-dd042d66ba5d@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5841; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=O+veMtx+JvcXWx4LygV6hHgSQoTVwUJDCTyGDuzrzBQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmrL9y8PuV2Ys/Sp1ln9klIzzh54OEpA/nQ7D/2q3hOTZnj v/iCeUcpC4MYB4OsmCJL4u2+Fqn1f1x2OPe8hZnDygQyhIGLUwAmUveUkWG1b8Le2iv7uZJ3qqh0xX 8XT9h6piP31ok5+4NWz7AKs05k+Gcnk/aSeyM3J7um42zJ1AaWd3XnZI/ef7F4Xpv/5e1vrvACAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_023701_362096_EA1072BE 
X-CRM114-Status: GOOD (  23.89  )
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
index 2c4503fa984f..5945dfc5f806 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -471,6 +471,18 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
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
@@ -490,7 +502,7 @@ void __init riscv_fill_hwcap(void)
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
