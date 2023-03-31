Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDF6C77B62
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 07:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/uxjlwIUtg17mQBYrHBj+6SoPqt2tajS767/jyLhMQ=; b=Gw7MX/WAVAEoQI
	qMb9nr9PFY2D2uLRpDzdMhGovPSKFASE8/wBqNqyrB0rvECixG8DYUFPVq5CNTgnmpnKsPQ9yYCWY
	ZS7tepWn6Gx0M9T3et74jPz63Kpi1NviQVNZzIMxlSIQhYIWl86cKivaf/thb1cLt4K1E/3rJ3yMD
	bS/+gKa2tCugjo2YXHyOJOVyCC3dhflQqbD1VKi1dEqSSokFR0+TmOtrlw2xkGGzj7eoaXUSfQ/bs
	tIDoPqHAR4V8dchkrDbjY5lqG81yKOCWBkUOKBUUXjieFPnRfh3cZPB9pEsMHW05gezIeJVtYt6k4
	r1BUJpj+kMwD/E/Xb7vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi92K-00682l-2d;
	Fri, 31 Mar 2023 07:19:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi92I-0067z3-1s
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 07:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680247138; x=1711783138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hmGr/C098Sb3AUXweabbmZpCcG7wYNzd0OEreJaxcco=;
  b=NCsti61scp6XrceIFYpxP1qKVOaOJdJhRGjgxc5hwngqvezNUbHIMWP6
   dq/wZI2lnXJ6yXWtiJ/t2hnJ5WWTSOeFmc0fTu3NKwZG7MUgo0jVN4uAN
   r/E24wl9kcYFy2Y/FhdFDfl8D4Xpcw/7SstWDCGOdFoWGlqSmFHMi2CtU
   j+Pc8KHBBjLz3GYHGRCdPWCgDlT9E/dyQzz3jDfdQSy36CSDOvJNt11yX
   90qyrJaWwRfQvlmvTeUc9Us4T9q8kXck0hckl/Xe3W4jD8vZKJpXILfEj
   OaugqGmpS1iUnvz/ySRPL1Hv16qCvaNqV2XsGgzzmEYQ64p5Dqki00t2v
   A==;
X-IronPort-AV: E=Sophos;i="5.98,307,1673938800"; 
   d="scan'208";a="204349754"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Mar 2023 00:18:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 00:18:49 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Fri, 31 Mar 2023 00:18:46 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-fpga@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Moritz Fischer
	<mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Rob Herring
	<robh@kernel.org>
Subject: [PATCH v2 2/7] dt-bindings: soc: microchip: add a property for system controller flash
Date: Fri, 31 Mar 2023 08:18:18 +0100
Message-ID: <20230331071823.956087-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331071823.956087-1-conor.dooley@microchip.com>
References: <20230331071823.956087-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674; i=conor.dooley@microchip.com; h=from:subject; bh=hmGr/C098Sb3AUXweabbmZpCcG7wYNzd0OEreJaxcco=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClqnZat0x4YKoUkRnlFv5DtTu/kFma+UZoafsbv3LKSiOsW Vxs7SlkYxDgYZMUUWRJv97VIrf/jssO55y3MHFYmkCEMXJwCMJFZNowME/X7pt97O3VWxgGfDLfjoS U/xQycSqe9cM5bx1zQ7XVAi5Fhuaoqx9e2ZQwB7fabNzU7rVt+c0PpQQW+tK9f9xtJ3p7CDQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_001858_684893_802D8E90 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

The system controller "shares" a SPI flash device with a QSPI controller
in the MSS. This flash is used to store FPGA bitstreams & other
metadata. IAP and Auto Upgrade both write images to this flash that the
System Controller will use to re-program the FPGA.

Add a phandle property signifying which flash device is connected to the
system controller.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../soc/microchip/microchip,mpfs-sys-controller.yaml   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
index 04ffee3a7c59..aee96c639af7 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -26,6 +26,16 @@ properties:
   compatible:
     const: microchip,mpfs-sys-controller
 
+  microchip,bitstream-flash:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The SPI flash connected to the system controller's QSPI controller.
+      The system controller may retrieve FPGA bitstreams from this flash to
+      perform In-Application Programming (IAP) or during device initialisation
+      for Auto Update. The MSS and system controller have separate QSPI
+      controllers and this flash is connected to both. Software running in the
+      MSS can write bitstreams to the flash.
+
 required:
   - compatible
   - mboxes
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
