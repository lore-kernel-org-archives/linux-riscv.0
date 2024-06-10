Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A49C27C65
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 11:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUrlUeFr2tAXCeLWtcq1llSMlonuQ6nJEz6bcj8wKkU=; b=qLKpLu6bY7od/Q
	IqlLXPHsHTGltJv/gDkRUPjfNrqnwYrLS5iSa4W1rdM/XXvrz5ldKGsfctAgXy7IyNxed9iHLqnAx
	unoA/rlLp9nO9YahhX47QG+zy8LZo9s+SBzZHe4Ip1HA7XgFGMuuaH00vPK/4ZwPdr2X2TIR4FGhw
	qqlF8IYxssq0NdNhKVZMzJjhmH/VK2cf+ykvzf1arAOLT/jOe5yqI6r30TZ01Wd6L9cjl5TzlSOGA
	HTwUtosdRNceeIwXpMT7TaBLAptviZOY3241Q6Rx2yZfhHs7SR0KCZsIacagbXBerolobiaczt60t
	U/Eyx1wIiFksWjX8gULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGcv1-00000004lyK-0wit;
	Mon, 10 Jun 2024 11:10:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGcuw-00000004lqi-20cw
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 11:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718017826; x=1749553826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RnUro+xV+qZjTj4M3EgsjQkilJTe+OeOdfJTP/zcJ8s=;
  b=vGa9oUbN+6q/ahMsuR9r2lrNlzIYOQHCrh5Es2rWfmqUkMKjA6ilmRcx
   nyGAZCNRTlHS0N5yrax6+7Ri8j+PsF1QppAR2O+DwwtfL0SQRYUapGSOY
   9yyBIL9FN1LIJY46A7KrXdxjGTk1cDyy/93A5s8isdS6pqxL2gzZ84chv
   TOTtOh9SCYi5kuews+c7EpKfTZCHXT8uW8RC5C6EaUWyygJKNYgHAgKs1
   +CuseKehgZ+uK8z7yM22ryHnsDOofP7BVGwQ9BisvdwKROJ1fBwshig05
   DlFvUmPLMlqdq0GuW24nPbLIUq2QFoInauk6apeLek+qEVDbuCfpsR2ZA
   Q==;
X-CSE-ConnectionGUID: hYLulNlPR0KPV4ewtCuJxw==
X-CSE-MsgGUID: Di/KcXTiR9GxwE3yMjYSoA==
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="194602823"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2024 04:10:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Jun 2024 04:09:41 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 10 Jun 2024 04:09:39 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Daire
 McNamara" <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v1 3/5] RISC-V: Add an MPFS erratum for PCIe
Date: Mon, 10 Jun 2024 12:09:15 +0100
Message-ID: <20240610-crux-unloaded-93b701646454@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610-vertical-frugally-a92a55427dd9@wendy>
References: <20240610-vertical-frugally-a92a55427dd9@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3432; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=RnUro+xV+qZjTj4M3EgsjQkilJTe+OeOdfJTP/zcJ8s=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlp924tK2hYLtn78kiE5nIpTf/aM3Xbtu+fbDRd4GNP3Daj v4r/OkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRRzkMfzgyjgYXnT0Qde7vhH8uum mG72e75ZR1zlV92lsl+lQ+/gwjw60vb9vOl68q8vA8emSZyuS7luz3pwvWMG9qnWf8/hZ/EwcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_041026_712156_46DF1AF2 
X-CRM114-Status: GOOD (  16.95  )
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

On PolarFire SoC the PCIe root port is limited to 32-bit addressing
(both when acting as an AXI-Slave and as an AXI-Master) due to how it
is connected to the processor core complex via a Fabric Interface
Controller (FIC), rather than being part of the Microprocessor Subsystem
(MSS) like the other hard peripherals.
The AXI buses between the FIC and the MSS are true 64-bit buses, but the
PCIe root port is (effectively) only attached to the lower 32-bits of
each bus. As PolarFire SoC is an FPGA, several of Microchip's customers
that did not want to suffer the penalty of bounce buffering inserted a
"shim" in the FPGA fabric that would alter the address of the AXI-S
transaction on the return path to the MSS (conceptually moving the 4GiB
range that the root port can address via the AXI-S interface around
64-bit space to better cover where those customers had placed their
DDR). PolarFire SoC has a memory map with various apertures into the
physical DDR, and depending on the MSS' configuration, the FPGA design
can control what physical memory addresses back each aperture.

The main apertures, which are cached memory, lie at 0x10_0000_0000 and
0x8000_0000. There are also non-cached apertures at 0xC000_0000 and
0x14_0000_0000. The "default" configuration is to have each of apertures
overlap.

Some use-cases add a shim to the FPGA fabric that will re-route
transactions from the 0x10_0000_0000 region to avoid bounce buffering
for 64-bit addresses or because the aperture at 0x8000_0000 does not
correspond to usable memory (perhaps an AMP context is using it or the
designer chose not to place memory at the aperture's physical address).
Other user-cases re-route them to the non-cached region at
0x14_0000_0000. If the latter is done,
DMA for the PCIe root ports become non-coherent. Such a scheme is only
possible because the SiFive ccache on PolarFire SoC can perform flush
invalidation of the L1/L2 cache for these types of configuration.

Add an Erratum to support this second type of configuration. Like the JH7100's
non-coherent DMA option, this requires use of DMA_GLOBAL_POOL and is
therefore incompatible with Zicbom.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.errata | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 2acc7d876e1fb..0a9e13efbe6b5 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -21,6 +21,25 @@ config ERRATA_ANDES_CMO
 
 	  If you don't know what to do here, say "Y".
 
+config ERRATA_MICROCHIP
+	bool "Microchip errata"
+	depends on ARCH_MICROCHIP
+	help
+	  All Microchip errata Kconfig options depend on this option. Disabling
+	  this option will disable all Microchip errata.
+
+config ERRATA_POLARFIRE_SOC_DMA_NON_COHERENT
+	bool "Non-coherent DMA support for PolarFire SoC"
+	depends on NONPORTABLE
+	depends on ERRATA_MICROCHIP
+	select DMA_GLOBAL_POOL
+	select RISCV_NONSTANDARD_CACHE_OPS
+	help
+	  Enable support for non-coherent DMA on PolarFire SoC.
+	  This support is not required for any peripherals in the MSS, but may
+	  be required for peripherals in the FPGA fabric and is required for
+	  the PCI root port to operate correctly, due to addressing limitations.
+
 config ERRATA_SIFIVE
 	bool "SiFive errata"
 	depends on RISCV_ALTERNATIVE
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
