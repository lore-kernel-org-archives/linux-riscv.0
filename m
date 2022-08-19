Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA21C32773
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWxvAujqaPY0V25+7+dpInaxC1mlQwVZIijNdjYfgfU=; b=1Hyr0wNrRSBwXY
	F4Z6d8bgyiY32/3+DncCJRvIE0BCyN+nuDZoRWg7bF7T2re230bISuPEyROh6Pd8dzHyLpNPr9IEf
	vieOGRAhf6k3oR9TVoLtylPkgOuMzDJn+GMvKllR32oHuMXwBGt5Vj4Pv2e6oyEa8+F5dktwn2JPc
	z0WAL8MMVEMx5a3v3B5nzPfCSS9vkQxUe662jC1f1lg3kRb5rlYLtUwetQMMBuyW+GXBhodDO26g6
	fr5dgw7NKQALP4eTXO0pg2r3oWmeOoZKI5wUvi/18mDQBKKM9luD6h4WTSp0IT3HxlI1Gq8xv/Bxa
	RXEGPn3nAmQp7nRWtAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOyiE-005Iue-Tu; Fri, 19 Aug 2022 09:54:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOyiB-005Idz-Mr
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 09:54:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660902883; x=1692438883;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fdjX5tbqzbcZLdj3QtoTUweKd5AlbElmyy/Hw5S6d5w=;
  b=rT1V7I2sZFLeJmPTcSF3oOs7OJ328V2e7vG/W58wfifXlv/N2AvzCknz
   elYd1QCVJHYhuJqcWNCeaVQTPiJyhijI1Lkzw4owe8t1hDQsoE6Y86bTD
   /yfRYbJO6/HDQi5PXdIwCf3nbI2XlghAa8+HzRzLs0aXZ3ND5kNhuj2iy
   KpDk8Ymbuv6IWvM0AcruFExaRT+ry7Wb0nPf5gYtN0ccOwiL9LcPSyNfJ
   p0bM7PW75ED63eL0HLz1KaPLauXHcB5oR4E1jlLIHJNBbnT/IoVfJdxq+
   vtBCmixKjsxrymbTW9j7EcnpC+V4KPgG/rLuX2CrGvMpwiOz3YRJWgVTU
   A==;
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="109769436"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2022 02:54:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 02:54:38 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 19 Aug 2022 02:54:36 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Daire McNamara <daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 02/13] dt-bindings: clk: microchip: mpfs: add reset controller support
Date: Fri, 19 Aug 2022 10:53:10 +0100
Message-ID: <20220819095320.40006-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220819095320.40006-1-conor.dooley@microchip.com>
References: <20220819095320.40006-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_025443_856992_18C68013 
X-CRM114-Status: GOOD (  11.01  )
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
