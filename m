Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB61EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 08:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3m6GDG/CqhtvZ8GHgpthZGPXazztB/90HXs5OA6uD8=; b=YWRAfURN1euKx/
	thpgjOPIk3yjLmy5vTFtIXxMaUNk640dM0eVod23vRslBRPOR4I8C6xSzoXOCmFgaMXSqjQpW7sNB
	Tanwfdu6xHKu95Zc3OPm7Ma/JkX69dusPO/AgQbCeqjg3/e08PjEFMfbIwFquzUM0tNoZ2DnCjSR9
	8Psam4muj14JIqtAxHqSsOqrd4hQpzEKGHsbnE25eSxqDK+5WJRvjjo+LyKJ2C4+tmMCP6ieGh7r4
	4JWnZla9gx5DdOFVoVhT+NkIp6+ym98vkSYhqZF+MVQ7noWhDaZ1C2WnXerqiYgPYX+aDMKrke8xm
	dvD8e9mtYqC53MUhFDvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEn2i-000O4b-1V;
	Thu, 29 Jun 2023 08:30:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEn2d-000O16-1X
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 08:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688027415; x=1719563415;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FyhCBQzwfA+WMj8JPqh8q7RSGYDMWs5+f1Cx9CBdUeU=;
  b=pTmqSUC7tUzftDcBj6G2Yo/YQOU+fGmpVSVCVPHBhWWbnjCN0Z/wVY2z
   ig7a+gsi+e0JTP2GccymgKu5EHEPQfBfDjxfMkVSxIUmPD412GEzGEzP8
   EPeI0R4aVmkA3Fhz6aRMQD/bNN24PE0H9uSYyCNHCNULX8uPofuYUVk6b
   DsfWxbRcqC9ZtrEng6EMD+wpfmF1kuF/pq8wqHvo0cMTOtFLY5jGH06Xa
   +U+x06SlXq496rhqUgeYOUXvcMTp9AtBZv2Ire41K2y9uCVt8Wy45AGIp
   FNdGfRev6Zwb1TWLXdUygQasbv4gezxX5iZRD+ppxOOZ2bME04Api1Wk8
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="220461307"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2023 01:30:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 29 Jun 2023 01:30:14 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 29 Jun 2023 01:30:11 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v2 10/10] RISC-V: provide a Kconfig option to disable parsing "riscv,isa"
Date: Thu, 29 Jun 2023 09:28:56 +0100
Message-ID: <20230629-resilient-grievance-d782163b09d6@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy>
References: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2700; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=FyhCBQzwfA+WMj8JPqh8q7RSGYDMWs5+f1Cx9CBdUeU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClzHY7obVavUtw9NyBe5vWxwFOv+ZZa9B6d4MElaLi3sH39 L1GJjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkIx8jw5rVnnHmXF8XyF8z4PaQEv qXySfEuc0x/uets2oXG2dcf8/IcKJg2Z2Q6tpjEw6/avzHMm3O+rCfdR9mrtNeXVv+6JC5DzMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_013015_550531_B68BB8F3 
X-CRM114-Status: GOOD (  16.66  )
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
Cc: devicetree@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, conor.dooley@microchip.com, Rob Herring <robh+dt@kernel.org>, Evan
 Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

As it says on the tin, provide a Kconfig option to disabling parsing the
"riscv,isa" devicetree property. Hide the option behind NONPORTABLE so
that only those willing to keep the pieces enable it, and make sure the
default kernel contains the fallback code.

Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig             | 16 ++++++++++++++++
 arch/riscv/kernel/cpu.c        |  3 +++
 arch/riscv/kernel/cpufeature.c |  2 +-
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 1d39efe2b940..0e1909ac5947 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -291,6 +291,22 @@ config NONPORTABLE
 
 	  If unsure, say N.
 
+config NO_RISCV_ISA_FALLBACK
+	bool "Permit falling back to parsing riscv,isa for extension support"
+	depends on NONPORTABLE
+	help
+	  Parsing the "riscv,isa" devicetree property has been deprecated and
+	  replaced by a list of explicitly defined strings. For compatibility
+	  with existing platforms, the kernel will fall back to parsing the
+	  "riscv,isa" property if the replacements are not found.
+
+	  Selecting Y here will result in a kernel without this fallback, and
+	  will not work on platforms where the devicetree does not contain the
+	  replacement 	  properties of "riscv,isa-base" and
+	  "riscv,isa-extensions". Please see the dt-binding, located at
+	  Documentation/devicetree/bindings/riscv/extensions.yaml for details
+	  on the replacement properties.
+
 choice
 	prompt "Base ISA"
 	default ARCH_RV64I
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 9a4f4a23afcd..86a1d98b8b3b 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -81,6 +81,9 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
 	return 0;
 
 old_interface:
+	if (IS_ENABLED(CONFIG_NO_RISCV_ISA_FALLBACK))
+		return -ENODEV;
+
 	if (of_property_read_string(node, "riscv,isa", &isa)) {
 		pr_warn("CPU with hartid=%lu has no \"riscv,isa-base\" or \"riscv,isa\" property\n",
 			*hart);
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 2c4503fa984f..f6fb18d2af84 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -490,7 +490,7 @@ void __init riscv_fill_hwcap(void)
 	} else {
 		int ret = riscv_fill_hwcap_from_ext_list(isa2hwcap);
 
-		if (ret) {
+		if (ret && !IS_ENABLED(CONFIG_NO_RISCV_ISA_FALLBACK)) {
 			pr_info("Falling back to deprecated \"riscv,isa\"\n");
 			riscv_fill_hwcap_from_isa_string(isa2hwcap);
 		}
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
