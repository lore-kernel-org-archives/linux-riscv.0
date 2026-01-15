Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B472DD4661A
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 19:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3oSITeXglcESt3AmJfpvEO4w9lpVl19umKNqZKrjMSs=; b=Av5jtifBr1abh1
	y357bPjSdb6r0CqolCkYBQJCSPB0xLbMVn1I4MmmvwM6IqweI/LGy3jjpmTXm4QKtQgTH3VWMZmPE
	wR5S+zn9PjdCMFLDckuq4MO06wC0BKs0RrgKgJGEF2MqZNQVJdZIT9RXxriz10EsinT9DfyHmzEeC
	dS3MlgjoZjEb7r2SHmAsYoKmYv2mzu8m7dG8Tb8kmeasp3NhsFx/tq0tNF/mFMRh/6x6oRGbkXtQy
	12xITkq+H4FxJuz/aQIHYZtVEIPvMToceUierfl42My5LUkQqfPGKcUWHH/0zonZU/LGMc/4xYPXs
	2sJQDxLZQ+VZuC5WzCBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSrA-0000000D2aJ-1Mvj;
	Thu, 15 Jan 2026 19:18:08 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSr8-0000000D2Z9-004O
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 19:18:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42fb5810d39so1016105f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 11:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504684; x=1769109484; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcLpMVd1uoMRkrBJra0Sqn/oCunudMeXpwg5cYzBxgE=;
        b=mkOMXf6SckiBRJsLrsSxHSXeFkNFvRZ7V3L+QNIZu/1OOxGJWOAx6xoOQbtq0674Yc
         f5VpRdTEFaCRgGxCs/Jgmw3oCPo6pWyVx+kY2xBi2+CJJtiuAy2MTEvCNLzsyQmpkolM
         04qMuP7p+beeAtAmkmPNwRO84F1IDjPYc2MuqoYUwH4dp8YAxULBJGOsHmXXerFpanIF
         0uYBXh0NTOg8ZjXve2I2mVPl9cjXl7kgbLHZArdHOPh37c5iC+Q1bWpwtC6iYDm7hkzG
         McpS4gYy8ypNfhUtWZQfP/pLd3oZQ+iTdnKjl4ph8rD3RNCEitrxUqtxqGeawxRLt6k4
         Rsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504684; x=1769109484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DcLpMVd1uoMRkrBJra0Sqn/oCunudMeXpwg5cYzBxgE=;
        b=SMiI6Zp4bMcsDa3O3zthWK4Ct6q8TcLOc4iPmPdJ6G7LkDl2qhsfofilxy/GUMNZIr
         vXqg951C6a7O9k//sfAWvSJgQZkgliu4oxmjGoMJxQ7oCgnDlmqEIlJx8fDuVYMQu2rK
         DWn40x6+SC4ZSgKE7euqXZJC7d2GRy1HYYKYvOgTspffrI2BSLbttAccvMBFOGKsynUc
         t9jXSju9icoretlXtAL00N6BQmMbtKH/4ypzCGRPM+0uw9avZAxJ4yfyAXfaNUeskLg/
         gRGAEH44mk0+LLEsCqRJrkS76M9QER87VqwmbBcwctyNIgrtPtR+M2z6NjMkbFl7Fxkg
         JgKw==
X-Forwarded-Encrypted: i=1; AJvYcCWPD/RPVXbjSGM4gbcNvsGFgtbSdu4jmXDv077jTKAk8TOTGu5mai31EL7BKXV7gk7W0N24gZTStTnzXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhmPi69e0+gxsgDpRF+DEWN3uWM8uxKdROhUAkmh6lZ/3VmC4w
	4RpYZDSE4o8UB4x+W7zFuJPBs51lPxkfdSIgZn3wIcg3NvWlhdl4Au07I8e/sAij
X-Gm-Gg: AY/fxX5o9MYBMAg9bg3NuVbDQHg5wqWbSFGAQIt2GyVEv6OzB2ss0YKpdhjCWbkYB/1
	6N2NZH7834nb/YRzAcy/dLPQX7K5E5Dqds+/YNf4PY4ktAtLrYHrFS704CVf+8TczZe7L0F35LK
	/jODaOc1d6mcL8/u9O8rpMl8x/XIsquANjVj4GPPC654MkjNAFe9x0A+fM7z2kdD8ljIAKpnD6K
	tSUQAkFqv8NwrxQrvS5vbImnMA7fjGIrGwhxWcdH3rzcWFYtDoArUtzhvvD2FUe7bU+iMSRUtcd
	14uZwvKpZVbzW8VtRTu+hXqDiL0ujDZDaZznfGUlYAfuto0/dPsiB6UrrvbuW69/0VOZVvoFhLd
	POxU4C9CsqjQujppy84ONFtNtu/+JwN2FQcS6R2vYWRmJF8WuCS7dkRkQthCsgmU6cMN+lzeoaT
	LAnNGF/eMj2Th8glpmk3XA88hrVPQ3rnv/4Olo4R7PyTnX
X-Received: by 2002:a05:6000:2c01:b0:42b:2fb5:73c9 with SMTP id ffacd0b85a97d-4356a0662efmr421160f8f.58.1768504683920;
        Thu, 15 Jan 2026 11:18:03 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm692734f8f.9.2026.01.15.11.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:18:03 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Thu, 15 Jan 2026 23:17:38 +0400
Subject: [PATCH 1/8] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
MIME-Version: 1.0
Message-Id: <20260115-cv1800b-i2s-driver-v1-1-e8b22b8578ab@gmail.com>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768504677; l=2155;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=aL79ku9woK+lFHsaZx7h1/Un3D0nb/Y6kULQfvJwXrM=;
 b=4AI//Dc4zB0LAW6t0lpzfgX5E/8bFJpEz7eva9PnikVe7DJg6MMIcs3jHP05P9nsmAecK/IYd
 loHA2q9vDIbDxJcS0fEHU3K9RMuF17S/aYb71J7Go359nwtOe2HnXK6
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_111806_059016_D4F9BDA3 
X-CRM114-Status: GOOD (  11.70  )
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

Purpose: introduce DT schema for the CPU driver

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-i2s.yaml         | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
new file mode 100644
index 000000000000..cf30880a62da
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B I2S/TDM controller
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description: |
+  I2S/TDM controller found in CV1800B / Sophgo SG2002/SG2000 SoCs.
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-i2s
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: i2s
+      - const: mclk
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    description: |
+      Names of DMA channels. May be omitted. If present, one entry
+      selects a single direction, while two entries select RX and TX.
+    minItems: 1
+    maxItems: 2
+    items:
+      enum: [rx, tx]
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+
+    i2s1: i2s@4110000 {
+        compatible = "sophgo,cv1800b-i2s";
+        reg = <0x04110000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&clk CLK_APB_I2S1>,  <&clk CLK_SDMA_AUD1>;
+        clock-names = "i2s", "mclk";
+        dmas = <&dmamux 2 1>, <&dmamux 3 1>;
+        dma-names = "rx", "tx";
+    };
+...

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
