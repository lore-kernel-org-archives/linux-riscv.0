Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34664CA0FFE
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 08:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNeND0VEefhU4bJl4K3QknBG86ne0OEwZ97eHn0sKDk=; b=OxamO+7WiuadFn
	QoL3xq5N96FKG0Ca9qrjCNkkVUo53pbchQvj9cMyRTSqxSmXGOm5WLNdfBx64U3WLVHPxGU0UUfxa
	gE5txEQeOxoGaXz1A2ir4eQ5jLW4/p0lPtYV6cRJm5OrGFMEm9rGjKJZPEZ/btFT9Z7jdOHVnBhmV
	5pMnYI0rLUUertEAcyhJd8bYcgh/xsxmvrwUaREm4jTxUyqMIOcwP2ghP9G8rZpW/xtykkajuxSRR
	KN3PvrtO72tCKXklbIT+QcriwrSsAvIbGSx4UTOYNG2polg6qoEeWB0zBjyFWnjswlyy/MoQin49E
	DVizEQqM6ADsOZYYdENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utM5X-0000000Fwmq-13mh;
	Tue, 02 Sep 2025 08:09:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLsj-0000000FrYM-1BuY
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 07:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756799805; x=1788335805;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pkx8x1NkgVeuO4YFWXM02HHwwX1ANgOv0kGU1edmzoE=;
  b=yOQ8UNuswjzr1FFIB/2pSk6m+LZ4HrywFZtyPhHhF+oFYOCbFwc4/Sk4
   TI85b/4VfBpq3Z2A4rsH4SX5MG1Khr8h+VReH/uaPKr5W3/MLMNjcjnG9
   0jb3yFEKcIreSi3jo8WE1ZX87X7z20/Q9VhbSUOyIc201AfRG+6fhF5Nq
   kwzgLSZCMj9sXUmhD+l59gYvO53Dghy9yUsswex/aiY/Q9wHJ8aCVI8fw
   qmqT42M5fVdmTgrYOlcCvWfO2ynTLBEq8Kp0X2uNd73HokOcmKuiWdMYK
   KyFEz+R8dX1R4/0DxmOZ9USOchvxnLPAb1riL997SPzr8SJe9OWgpbmeZ
   Q==;
X-CSE-ConnectionGUID: I0e7JmeXSliqGe+ljgjh1Q==
X-CSE-MsgGUID: 67nz6IXDQCmfVro4rUwmeA==
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="45916747"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Sep 2025 00:56:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 2 Sep 2025 00:56:14 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 2 Sep 2025 00:56:11 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v2 2/5] dt-bindings: riscv: microchip: document icicle kit with production device
Date: Tue, 2 Sep 2025 08:55:45 +0100
Message-ID: <20250902075548.1967613-3-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902075548.1967613-1-valentina.fernandezalanis@microchip.com>
References: <20250902075548.1967613-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_005645_332610_A5226747 
X-CRM114-Status: GOOD (  11.63  )
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

With the introduction of the Icicle Kit using the production MPFS250T
device, it's necessary to distinguish it from the engineering sample
(-es) variant. Engineering samples cannot write to flash from the MSS,
as noted in the PolarFire SoC FPGA ES errata.

Add specific compatibles for the Icicle Kit with Production device
(MPFS250T) and Icicle Kit with Engineering Sample (MPFS250T_ES).

The icicle kit reference designs in the v2025.07 release include the
Mi-V IHC IP v2, used to send/receive data between clusters when
using Asymmetric Multiprocessing (AMP) mode.

In reference design releases prior to v2025.07, the MI-V IHC subsystem
was included as a proof of concept in the design prior to becoming an
IP available in the Libero catalog.

Among other improvements, the new Mi-V IHC IP v2 includes some
changes to the register map. For this reason, make use of a new
reference design compatible to denote that v2025.07 reference design
releases are not backwards compatible.

Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 78ce76ae1b6d..8ddc5c02973e 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -18,10 +18,18 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - items:
+          - const: microchip,mpfs-icicle-prod-reference-rtl-v2507
+          - const: microchip,mpfs-icicle-kit-prod
+          - const: microchip,mpfs-icicle-kit
+          - const: microchip,mpfs-prod
+          - const: microchip,mpfs
+
       - items:
           - enum:
               - microchip,mpfs-icicle-reference-rtlv2203
               - microchip,mpfs-icicle-reference-rtlv2210
+              - microchip,mpfs-icicle-es-reference-rtl-v2507
           - const: microchip,mpfs-icicle-kit
           - const: microchip,mpfs
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
