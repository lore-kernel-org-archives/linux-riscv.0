Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2601ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 12:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWxvAujqaPY0V25+7+dpInaxC1mlQwVZIijNdjYfgfU=; b=Db2y4eMRQ4+sKP
	lp31uUNuZUOSNEPHJK9NXBnaHEffWEt0ccbxv4+ujFRjpreo7s00ozPUyxMCotg1QxWwl032LIP8z
	TYwPYTP/0Rqyr14T1ORzZ/9TUGCvhD6dU5MAuMxybm/sa6VYS/OSPFCwtSK8Cc4IGmRisGiz03pd0
	/sxLaoBYGsFF+rB5NCSbog+/coGkE4vNkpl7YDFopzUXIFnQQQd7OrePANswxAiHj7qNuQ00jKdFZ
	IK7Tzlo9tKSXJc/PH7xbx1f2lgsGXIK5knKUM4Izz/jykEwPjORpvZ8Q0h6dRMRD9FJlpMaawoIQO
	hr4aMugWFtdkfxEliHYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0kI-00H1go-3k; Tue, 30 Aug 2022 12:53:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0k6-00H1VN-8g
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 12:53:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661864001; x=1693400001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fdjX5tbqzbcZLdj3QtoTUweKd5AlbElmyy/Hw5S6d5w=;
  b=jCYxVphdx1Zmd6LmnVXzPtdmmoBmmiPpf0EoQC6pwPHN7SrofmwmXgNO
   E4vVZDYmnbapZ/zx5w12foOrMntPPgXL1QuCgW3fb6L0Dyhs0nNkQile7
   F0kBydGjsCUAvOgtTzbU7hTUa03LihMrkkOaBDO/6MFW6XAdWxsZEu1dG
   +10ntR3tcRc9VcHFwXViCS8e2XwrTZILbkyvdh5/T6aswakHfYHDufQ9W
   +GMmpuNHmAl/0IJcdeHRccQDoyaBBnEMWX9TstmoIJAxBpYseivVIS5Of
   UR4i1sGGyf1hpvdKDfFSk7O2Y2JmCigtVjYrgwDBE7FeZgo8zz905fcZC
   A==;
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="188645501"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 05:53:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 05:53:21 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 30 Aug 2022 05:53:18 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Claudiu Beznea <claudiu.beznea@microchip.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Rob
 Herring" <robh@kernel.org>
Subject: [PATCH v4 02/13] dt-bindings: clk: microchip: mpfs: add reset controller support
Date: Tue, 30 Aug 2022 13:52:39 +0100
Message-ID: <20220830125249.2373416-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220830125110.2372514-1-conor.dooley@microchip.com>
References: <20220830125110.2372514-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_055324_020172_CF2C2B65 
X-CRM114-Status: GOOD (  10.89  )
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

The "peripheral" devices on PolarFire SoC can be put into reset, so
update the device tree binding to reflect the presence of a reset
controller.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/microchip,mpfs.yaml          | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
index 016a4f378b9b..1d0b6a4fda42 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
@@ -40,8 +40,21 @@ properties:
     const: 1
     description: |
       The clock consumer should specify the desired clock by having the clock
-      ID in its "clocks" phandle cell. See include/dt-bindings/clock/microchip,mpfs-clock.h
-      for the full list of PolarFire clock IDs.
+      ID in its "clocks" phandle cell.
+      See include/dt-bindings/clock/microchip,mpfs-clock.h for the full list of
+      PolarFire clock IDs.
+
+  resets:
+    maxItems: 1
+
+  '#reset-cells':
+    description:
+      The AHB/AXI peripherals on the PolarFire SoC have reset support, so from
+      CLK_ENVM to CLK_CFM. The reset consumer should specify the desired
+      peripheral via the clock ID in its "resets" phandle cell.
+      See include/dt-bindings/clock/microchip,mpfs-clock.h for the full list of
+      PolarFire clock IDs.
+    const: 1
 
 required:
   - compatible
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
