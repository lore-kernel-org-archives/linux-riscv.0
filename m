Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2E9C43461
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 16:56:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0697721D24
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 16:56:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eNHXO3Z2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQqVCUrf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0697721D24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=taRowQQ5L9HZlnD21Nv1HESzZ+XG1ODQh67mPnLDfLM=; b=eNHXO3Z2d5c+y/5lsz7uIFZtlt
	62nLzLBZpcTaL4tA26J/vqCylt9iBx6CYozmCQX+H6aX0B0PfGpDm36Xmqu6EEpl9h6inwXeaRHf/
	I/63e9kywfxmJZ4WanVY169XjUuLP0YSNa3EmlFBbvZzNXP3cUv0Xr3lKPMIebW/UI+lBxsbzn8Eq
	1fsM2PoliBjtiQIduVQnFCVphYYmkvpY4TnfAjasic35LR/DeSYoV0UB6l4Ej+8v7lJOUDDqkvKZG
	ALbouhk1QCNSAsGYSUR5q/q2x/yZn8VXdM2LeAIj/TjCEE7rn/ViSmntXrgZE8gr5NuggVO4v8pSb
	dDmhPv2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIxCX-00008a-Uv; Thu, 17 Sep 2020 16:56:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIxCS-00005b-Dm; Thu, 17 Sep 2020 16:56:02 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43716206A4;
 Thu, 17 Sep 2020 16:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600361759;
 bh=aZDGZYJid2V8Fx1m0lmm3+JurcbZ8SKx/Yu1RMA/dNU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CQqVCUrfLSMMi4PrDWY4qKZjHVNOyrDoFCP+p9QOTMBKlS8x//BbLXwkbpzdWa9Zp
 ch+gydcuGEuCGdWBPVtpfyx9z+TMM2nwLPCpQ/WzrosyUBT4SpCAT3NJgYtEdVE1R3
 m8XgMvq67Xe47mK2cmpG2EKoKLHRb57Oy3xWTRsk=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Hoan Tran <hoan@os.amperecomputing.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lee Jones <lee.jones@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Anson Huang <Anson.Huang@nxp.com>, Sungbo Eo <mans0n@gorani.run>,
 Stefan Agner <stefan@agner.ch>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, Yash Shah <yash.shah@sifive.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 - <patches@opensource.cirrus.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Amelie Delaunay <amelie.delaunay@st.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Andy Teng <andy.teng@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Sricharan R <sricharan@codeaurora.org>,
 Chris Brandt <chris.brandt@renesas.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 08/13] dt-bindings: mfd: include common schema in GPIO
 controllers
Date: Thu, 17 Sep 2020 18:52:56 +0200
Message-Id: <20200917165301.23100-9-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917165301.23100-1-krzk@kernel.org>
References: <20200917165301.23100-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_125600_655486_BCA2C189 
X-CRM114-Status: GOOD (  14.50  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Include the common GPIO schema in GPIO controllers to be sure all common
properties are properly validated.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 Documentation/devicetree/bindings/mfd/cirrus,madera.yaml     | 1 +
 Documentation/devicetree/bindings/mfd/max77650.yaml          | 3 +++
 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml | 3 +++
 Documentation/devicetree/bindings/mfd/st,stmfx.yaml          | 2 ++
 Documentation/devicetree/bindings/mfd/wlf,arizona.yaml       | 1 +
 5 files changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml b/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
index 499c62c04daa..76c78f96dbd2 100644
--- a/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
+++ b/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
@@ -20,6 +20,7 @@ description: |
     bindings/sound/cirrus,madera.yaml
 
 allOf:
+  - $ref: /schemas/gpio/gpio-common.yaml#
   - $ref: /schemas/pinctrl/cirrus,madera.yaml#
   - $ref: /schemas/regulator/wlf,arizona.yaml#
   - $ref: /schemas/sound/cirrus,madera.yaml#
diff --git a/Documentation/devicetree/bindings/mfd/max77650.yaml b/Documentation/devicetree/bindings/mfd/max77650.yaml
index b0a0f0d3d9d4..382ce6363e5e 100644
--- a/Documentation/devicetree/bindings/mfd/max77650.yaml
+++ b/Documentation/devicetree/bindings/mfd/max77650.yaml
@@ -20,6 +20,9 @@ description: |
   LEDs and onkey) refer to the binding documents under the respective
   sub-system directories.
 
+allOf:
+  - $ref: /schemas/gpio/gpio-common.yaml#
+
 properties:
   compatible:
     const: maxim,max77650
diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
index 3a6a1a26e2b3..3a59ec26075d 100644
--- a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
@@ -15,6 +15,9 @@ description: |
   single-cell linear charger. Also included is a Coulomb counter, a real-time
   clock (RTC), and a 32.768 kHz clock gate.
 
+allOf:
+  - $ref: /schemas/gpio/gpio-common.yaml#
+
 properties:
   compatible:
     const: rohm,bd71828
diff --git a/Documentation/devicetree/bindings/mfd/st,stmfx.yaml b/Documentation/devicetree/bindings/mfd/st,stmfx.yaml
index 888ab4b5df45..dc7168255c18 100644
--- a/Documentation/devicetree/bindings/mfd/st,stmfx.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stmfx.yaml
@@ -31,6 +31,8 @@ properties:
 
   pinctrl:
     type: object
+    allOf:
+      - $ref: /schemas/gpio/gpio-common.yaml#
 
     properties:
       compatible:
diff --git a/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml b/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
index 9e762d474218..a8610e304a00 100644
--- a/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
+++ b/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
@@ -16,6 +16,7 @@ description: |
 allOf:
   - $ref: /schemas/sound/wlf,arizona.yaml#
   - $ref: /schemas/regulator/wlf,arizona.yaml#
+  - $ref: /schemas/gpio/gpio-common.yaml#
   - $ref: /schemas/extcon/wlf,arizona.yaml#
   - if:
       properties:
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
