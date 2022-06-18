Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6150DC43334
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jun 2022 12:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/y7aKuagHmkwNRT97LRuJmL7kZHUxALZvW1G0JARqhs=; b=f6k6V6iod5laJN
	uy84UijaKfahUfO3Me9MF+uRDRgsbOtlWNxpXgBPQX0TglPlfpBktkKDJJBxDTb3yb6Y551L4kW/I
	x2/97CKD7Q3jsI8D91Mxgud5QQLN9tHXBj419lLLH5Ccu2fqXFLZeoAKuvTsvXI6bRNH3scA/J7kU
	OZaVE78oQZOVBpiVVOFaZsKqXLXK2PxTR+j73sJscJs5E7rQyl+VeS92Ld6JHLEl6kBHJdX7fVfn9
	NLH3HQlQ109giqM++7ZNlACBD/cj2PKhnPhhVdwr87QeqXHFfovrSLUgWTuVvx29p83Nv/ioIUXZN
	z/diqaicL7PcG3VEP1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xcq-00BHnq-61; Sat, 18 Jun 2022 12:32:28 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xcb-00BHXl-Ep
	for linux-riscv@lists.infradead.org; Sat, 18 Jun 2022 12:32:15 +0000
Received: by mail-wr1-x432.google.com with SMTP id w17so8782573wrg.7
        for <linux-riscv@lists.infradead.org>; Sat, 18 Jun 2022 05:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xc3yLaPJl3fJMhU7mLPNTXUDP5YmMspTrPH6skgYH5k=;
        b=WWI5aigpx63NXABwWobIVtxzeWyDWABcTlqhEd7p5galGx1leb4l0QUX6DRW4V7R2/
         7tCNkKvAuMxDi861SOauKvR8OiOrKRFQWKbf/UOyK4ZoNWlOxvSKeVmw3Pjw/ViKSDBb
         bJGQhxOX2sak4JARX2cUY3oHghGpdM5DQO1bngmpG9k9r1Q9YO+8El+G/rDrBCypfz88
         jYj4Hwbu5WXw7XC7sEypXuV849AqQEAwqdgU0LsiCYfp++8WMxNxdrDQLMOhAiSs1NIp
         AxnI+k8juFNCyik85P9Aotl91uS4CXhVavQDoNI3Z5E9qqRGU5RemiTnsiZNhX6+GfbW
         +y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xc3yLaPJl3fJMhU7mLPNTXUDP5YmMspTrPH6skgYH5k=;
        b=3JKEdxnU22guC74RaOafAsbMQ3LEOkh/fPiLcylsT5JzvcEAqmq9NfuoJVqVMaiVeq
         f6eHlEl/cmZ1DoV3mbFPvWGEarJR4Fk6VsZbCQVKYCvytSbY6hCIkVyYlNSKhIpMmLQl
         9Lw8ZUnKeyKEHQ3dVG0L9ax3NVbAHKP0OHLc+T+odCN6kPhecc3CDtgMPJQJPKxH7isU
         kOvIHmqUN67hQVlqWmx2csDOpckspswsnN+ExWs4P5FP7zd+FscZpA+bkJH0OkLYDlQn
         q/z/Jc9oUCvX/kgqExL8VnnqvSYZxImNxiorKGuXxMtLSCL6H5Tj3KouSPD1yqOWweYR
         Amrw==
X-Gm-Message-State: AJIora9e2PEh1LQUIx3fMKoxvMKOlf/aZPvL9++MgIxIu+pb2JM5qW7C
	kkGHi/ZrK1pcmAmk3Spm/zUNRg==
X-Google-Smtp-Source: AGRyM1vjUOgV8azxYb57OQztWrqMQYhc0lprasxXMnlkIZhmfHP3nu/9sasVI2/ycyhjwJt5Z7ma0Q==
X-Received: by 2002:a05:6000:1789:b0:219:2aa8:7159 with SMTP id e9-20020a056000178900b002192aa87159mr13617696wrg.474.1655555529797;
        Sat, 18 Jun 2022 05:32:09 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jun 2022 05:32:09 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Heng Sia <jee.heng.sia@intel.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update spi-{r,t}x-bus-width for dwc-ssi
Date: Sat, 18 Jun 2022 13:30:28 +0100
Message-Id: <20220618123035.563070-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220618_053213_552307_8F7DAD07 
X-CRM114-Status: GOOD (  11.19  )
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

snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
this.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index e25d44c218f2..f2b9e3f062cd 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -135,19 +135,41 @@ properties:
       of the designware controller, and the upper limit is also subject to
       controller configuration.
 
-patternProperties:
-  "^.*@[0-9a-f]+$":
-    type: object
-    properties:
-      reg:
-        minimum: 0
-        maximum: 3
-
-      spi-rx-bus-width:
-        const: 1
-
-      spi-tx-bus-width:
-        const: 1
+if:
+  properties:
+    compatible:
+      contains:
+        const: snps,dwc-ssi-1.01a
+
+then:
+  patternProperties:
+    "^.*@[0-9a-f]+$":
+      type: object
+      properties:
+        reg:
+          minimum: 0
+          maximum: 3
+
+        spi-rx-bus-width:
+          const: 4
+
+        spi-tx-bus-width:
+          const: 4
+
+else:
+  patternProperties:
+    "^.*@[0-9a-f]+$":
+      type: object
+      properties:
+        reg:
+          minimum: 0
+          maximum: 3
+
+        spi-rx-bus-width:
+          const: 1
+
+        spi-tx-bus-width:
+          const: 1
 
 unevaluatedProperties: false
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
