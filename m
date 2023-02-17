Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F1BC64ED6
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 16:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Veu7f3Xc0EE6pRoGaaeGGiI0rroKO9DMzGeQTcTaxX4=; b=BDJIVe3DPg1z1s
	Hul7n3eGC04KRYGN93gCXWSW9rtNt5ojEytkg+fb74bQgB7argXWRZvTkiYKNdcPKeQx3D6HQ33IN
	cscE5lsNNrTbuZZiGs03nOc3/BOHRNybqa6MU0CV1jXfNgOH920BRkky+V4UoY0iDK6CUeBFR801k
	Z5cpWo0DpsPwbLyrHvWSEEsNzZiHiEDTjO3JvM7vLiSG22pvIBcHqyk24Or2xFI0HJsLMZ5AuEhQY
	hkQ24LQsocqAd0fFgNAzXUriWBGT2iMcZFIh5sG3Aft68Q9SiI/plmkniKALimhKXmNyYS1aQz4oW
	q+QCnKbC+nFeoGRlaMsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3nA-00F7KW-4u; Fri, 17 Feb 2023 16:41:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3n2-00F7Es-EV
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 16:40:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3B1F61EF1;
	Fri, 17 Feb 2023 16:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906D2C433A0;
	Fri, 17 Feb 2023 16:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676652047;
	bh=8Pkfc5Vtr1bS1mfUGRyytTI2Goy5iCLpHwo24Vj3Z4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iZopDMN/t/u+V8+JAFkyK6Easm2YKxMfzovzbDhLKTTW2uoA5pibaW9nNphyrlgPz
	 dJ0fJ20e9NpMGoo7A4gTbsCDA9XlNt//MDfR/QQfs6TqzccOPsfWC2JWhmEVadY5lY
	 /8eW3K6sYTTm32hR2LP0uqhZybx1CHfx5zvrwehpKfHTaP+q5vPqwQsmsVcGGLm67g
	 tT5D1SgNpCHUnyRhYhh6dh6dChwNcNqFZ9DvBV6EwVxLwb6dQFiWVlW7ghGkIJmFaz
	 Ipj1QHKjMN5wzFrTSDrcI2hhrUOt7IQGf23kVgVHcrOZSlrS8UOzauNiq+iEkmVlez
	 4qJe7N94WqvOA==
From: Conor Dooley <conor@kernel.org>
To: Xu Yilun <yilun.xu@intel.com>,
	conor@kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Tom Rix <trix@redhat.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org
Subject: [PATCH v1 2/6] dt-bindings: soc: microchip: add a property for system controller flash
Date: Fri, 17 Feb 2023 16:40:19 +0000
Message-Id: <20230217164023.14255-3-conor@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217164023.14255-1-conor@kernel.org>
References: <20230217164023.14255-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1632; i=conor.dooley@microchip.com; h=from:subject; bh=fTElDZa5UroElstrQ0dzqW+hmPb678nX3XRMkYJvFsI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMnv17498Deyouk5h1zP2z+h8+6vbr/qvOLkvAp5xQ4Lz/CX 0mcXd5SyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAix88yMpz/c+1uxwu1xe8XzvD6o7 9m46nA+kczWkVF1IVXJM3dNi+e4Z/NJD0Wl4fxFZF8+c4Ta/pbGO9NWxbErHfykcLz/RFq6lwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_084052_591792_46F985AC 
X-CRM114-Status: GOOD (  11.51  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The system controller "shares" a SPI flash device with a QSPI controller
in the MSS. This flash is used to store FPGA bitstreams & other
metadata. IAP and Auto Upgrade both write images to this flash that the
System Controller will use to re-program the FPGA.

Add a phandle property signifying which flash device is connected to the
system controller.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../soc/microchip/microchip,mpfs-sys-controller.yaml   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
index 04ffee3a7c59..97a7cb74cbf9 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -26,6 +26,16 @@ properties:
   compatible:
     const: microchip,mpfs-sys-controller
 
+  microchip,bitstream-flash:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
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
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
