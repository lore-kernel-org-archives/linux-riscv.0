Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D5CCAC589
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 12:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNeND0VEefhU4bJl4K3QknBG86ne0OEwZ97eHn0sKDk=; b=RddUg+1iw9Bns9
	ll1+tsFM2nNsSSOMOrGzKyKGsNGFCgoeDuFA73w/a4eFmHCdy5wu/pbaKArMPS9hoecmHGp/VhJgh
	ZhgpAcasoyuPpCWp8GyUG6Afryv0ooXBZBe1Ca828hY3x2aqY5M7Q1esDUDEpZFwDSGcBLBvC1ORG
	DyAaejEmHgz+q6zk6sO1rxmZWorc1sLqcioyxidaDw0t1MzS5k7IkdrZfFdzeprxdZTr2qtLStdvy
	RaLQIaHY0FzDybf+GUlOY1rQhvrdpd0O/QsztIrT/nbMu36E1QP41nD0gdwbZvaoa5FvD941dtUfr
	/ayqeAycwq0zcHQw0yMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbNM-0000000HAnP-2u6V;
	Mon, 08 Sep 2025 12:53:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvaMl-0000000Glkh-26x4
	for linux-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 11:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757332139; x=1788868139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pkx8x1NkgVeuO4YFWXM02HHwwX1ANgOv0kGU1edmzoE=;
  b=iSxbMUYjftrA6sF9lzC0JOACEAOKBSChktYdUcHl3Us6RjaYcb9WzA6H
   QiF9Jhd30k+c4DvJqKbN81UH+KUE5psxqx/AC4foWPAWAccwZzLDqQIpm
   zFGD+xoSFGGE5BUvNLjWuGu411yIno9yw46agDcIlGoUSY4+3PhNE84Lg
   852n2cTwutPWeoxejIRvKwUcKIihuLgyZoISHCImuKP5Yl9bfxN0z4gSi
   bKCp5MnqIgnLZP3MnnSc2g6mexjlMA/isljGL0127glpqmqNN48nLNGP5
   7cyL/84a8lo/Gzgs7EuDqd8qp+tSVU5U1C5RE1uoUoJJV/GZj8wDbSX0h
   w==;
X-CSE-ConnectionGUID: vDOPHTnsQiaqmkXt9yltVw==
X-CSE-MsgGUID: 0R7GstWqQE6E+l/S+UyVDg==
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="45634877"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Sep 2025 04:48:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 8 Sep 2025 04:48:40 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 8 Sep 2025 04:48:37 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v3 2/6] dt-bindings: riscv: microchip: document icicle kit with production device
Date: Mon, 8 Sep 2025 12:57:28 +0100
Message-ID: <20250908115732.31092-3-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908115732.31092-1-valentina.fernandezalanis@microchip.com>
References: <20250908115732.31092-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_044859_598515_2F92DC7B 
X-CRM114-Status: GOOD (  11.45  )
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
