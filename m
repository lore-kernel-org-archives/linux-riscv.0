Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E037EC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZcXpmq7gkUXxSqdH7CufcLqF2tHoFrcphnED3JOE9EA=; b=q1c9bi3cxIumwp
	be6tvzvzLygKOpYDdQtH6d/HlhBSEe/l+vNHs93U+QwynPYi9fYBPdciA/ujL7+GkGQ9t2iJ3kz0F
	Ebst0lx88m/6+PTVkT5PtqtsaA+E3vxcNg0HwpuJEGQUGRW2Rm3jWh0ar6YcyNtOeF51itL07xilw
	TG7RTj8E8dblWyluV05TaZqIlVMIRwT9+gIFAo0/be7vR6LU7uyxjb5fHLE9pF0zeisVzfvsZxgN2
	Jg6R2nYzQC6+3SmyfdiKey33h0Id6ydZYDSDHK0XhzypgsZwNcE0BKe7ZtgvJuYRS7D3Qkk/3+hJD
	HpkGYp8d8T6F7+FliAHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cgs-00Dala-Kr; Wed, 29 Jun 2022 18:45:30 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cgC-00DaEi-1r
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 18:44:50 +0000
Received: by mail-wr1-x42a.google.com with SMTP id i25so18272952wrc.13
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 11:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XaslqtLsV+OGpzKiKNY3XRrWRC9HWQsSJkmanlRgE+c=;
        b=PZV96m+zSyDuombLQGewWnFBGvnedyQ3+dI1hcr7LVvBrxTm/bGvVqpkPGNxe9GZuS
         fRsI5nulPZJ86uidhXVECCni41C0vA1BzT5G0jxBqiaoo7CX3Kxq3zMyJrX0vHpp6Txf
         p44qFHV0ArI/Y05Xelf6D6yAh06YaA1xxlvz9miA+iu0m+pfBrQ47FFpznq0DZKe/hy4
         SUAN6ilIXPV9TpJlClLX0/YNPHZSgZOrl/1hoPuZDPhRyM7csXJ0DbpLgqJpVUzMy2eM
         +/w65a7y1Ox3yxOnJdn2omseoOfCdKxZv0N5ZS2ufAnjnfGQ7/aqoSXEVEQbgXX6e8nd
         76kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XaslqtLsV+OGpzKiKNY3XRrWRC9HWQsSJkmanlRgE+c=;
        b=ZW2vL5MD/UEyqi4zYIvAuaxGKxLVOOsodQhg7SXjc61sxW87P8CG900uIhFxi4yh0C
         RxFfOMT1NlaAJZjLRu8dptQp5rvnQHIO83Yq3/JEewrT70sdIKWVKiGKS27idC0s8X5W
         MPBEj6B3tTmeVsc9O4YNpq+R+PHPFh/e9CHpGS3pvC2FCu+ft8zhPdA5Dq+LuvrcTebs
         SFnpYkeAxqHgoIB7sJr0Q2d7nGR/j2eWJkPqxA9FeGHvvYIAJiYJcS79PgkDTAGlDaOr
         DAPMvyzmesKWNfQBjK8sUMPdpyhJngYkebER1twrhWTgZKgQvKhtgFaEkmq2bYvPzGdZ
         e4Bw==
X-Gm-Message-State: AJIora8jWEGra1ZdEIKmfPK/o9+Id/cB/9ss+cVF6sPzjUAZ0bedl4ir
	HQKlriwwJhpEKB4Qh5yjdALk5g==
X-Google-Smtp-Source: AGRyM1tKU6P+9J1S7EvrvcajpfEPLPWHYJ9QIIulL1WwyNt4gXk7nuljdIlSl36redwFztsprn60iw==
X-Received: by 2002:a5d:64cc:0:b0:21b:ba06:4d4d with SMTP id f12-20020a5d64cc000000b0021bba064d4dmr4603873wri.157.1656528285879;
        Wed, 29 Jun 2022 11:44:45 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 11:44:45 -0700 (PDT)
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
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 06/15] dt-bindings: memory-controllers: add canaan k210 sram controller
Date: Wed, 29 Jun 2022 19:43:35 +0100
Message-Id: <20220629184343.3438856-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_114448_138307_687C836F 
X-CRM114-Status: GOOD (  15.54  )
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

The k210 U-Boot port has been using the clocks defined in the
devicetree to bring up the board's SRAM, but this violates the
dt-schema. As such, move the clocks to a dedicated node with
the same compatible string & document it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../memory-controllers/canaan,k210-sram.yaml  | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
new file mode 100644
index 000000000000..82be32757713
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/canaan,k210-sram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan K210 SRAM memory controller
+
+description: |
+  The Canaan K210 SRAM memory controller is initialised and programmed by
+  firmware, but an OS might want to read its registers for error reporting
+  purposes and to learn about the DRAM topology.
+
+maintainers:
+  - Conor Dooley <conor@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - canaan,k210-sram
+
+  clocks:
+    minItems: 1
+    items:
+      - description: sram0 clock
+      - description: sram1 clock
+      - description: aisram clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: sram0
+      - const: sram1
+      - const: aisram
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/k210-clk.h>
+    memory-controller {
+        compatible = "canaan,k210-sram";
+        clocks = <&sysclk K210_CLK_SRAM0>,
+                 <&sysclk K210_CLK_SRAM1>,
+                 <&sysclk K210_CLK_AI>;
+        clock-names = "sram0", "sram1", "aisram";
+    };
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
