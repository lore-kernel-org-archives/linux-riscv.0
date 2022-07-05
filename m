Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F77CC43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 21:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91UGSB+j6N6L4oN+rUK7JfedxCW2VFYSNlE57Bmmnkg=; b=m9njrX7pFvAN54
	NMbDBGN5pfodZoXCLyUwiibgdA3IwIQlogbmabWL1VPJ51kFyK3aw4m6jFOTkySxjH4NpSWeTeFXp
	m6EWEzCLkSMX0vOfMgfZzC+GdCFTGpaXipmUHDZUR9xpREkhQ8SDokfl708XYxJ/8Tdlu64qXxnjV
	iswkjqK7O14j7svEpyEFqiDPzDAom/wXhIrHiLOC9i10ceslY6D56WISx0zKYfH2URu49P+BdmPk8
	DNjHC0QJ83KQV5fJli6II8aoXTkJ/iihcbD8vwNNt4j8KCE62QGkTwR8uCcqKXtFoKYNY8JoWMa6W
	Un3Xi3oQLE/Uyra0mKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTH-0030Y5-EZ; Tue, 05 Jul 2022 21:52:39 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTB-0030QG-2y
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 21:52:34 +0000
Received: by mail-wm1-x32c.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so7979623wmb.5
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 14:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2GzPXU6fxlhRLcLCzHAtBw9aqp9IODNCeRsuQO5lcpY=;
        b=XT7ASFf1nIxEfdXiclNYpFSfVq9s4C412d1OLgO/lRLR31n5QoYTHi2w0+p6vqybbX
         L8rsroWGHmISyxXwTMLY5Pxl0TOG8uaNtgvh3ABkRgQei276FZRvd10cHmCHvrO97nSs
         X1TOJ070+O3zWigaRb5S9HsAQ7feSkeZGigRifEXpzQYhOCweEjRkKfebf8ovWlSg9Sm
         MATg8gxg3oOtY6sR8l+nawtwKUugNgrjxosw3dX9AbAQmizt8wGPJ0C0+p2XxxuR4VYQ
         cB+b97WOaIvDgK7CYap6O6H46outSUnrjdgeLqMg7CbGejFauZTBHZWOALqxV0SFuBD2
         cSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2GzPXU6fxlhRLcLCzHAtBw9aqp9IODNCeRsuQO5lcpY=;
        b=R7l37+lN0GomHMbEWhxixdrf7bVQgo/7/LUnfwrFTlM7iBzYRS3ZaFoQI87JWbW1Wa
         nwKKzQjPflupYuhPwfgyQolMYu02uMr1W/l4Rw+za3Z1ZpT1Ma2TVA5Efjpa5IcJMrhD
         LSc8IjC7jETs+OXMjyK9pAgGwIO6MJieKnXrLomoapJW1SFfe6T2bQlAUav3u9oll2mc
         /RDiOUWErmigzC+m5mqH6HRVPprXy/N3b/8fkEjrIAkQobjSNCq4mbzwQpe0M6cQTnJ1
         +KOKYoj13xgxgdQgvC6Ac4xXYZPOpMs7rjmL+QZ1PMeS6e9b/9J3QE8yVG0FzTjAW3UB
         tpsg==
X-Gm-Message-State: AJIora8jCgSenPt2A0q18GSfiKeicLwhvalVuXzv1ApdcbVz+VdUqHXn
	LxA+c/MIUQnt4jZAUITYxYKBkA==
X-Google-Smtp-Source: AGRyM1uhOixFRoKPZ9r+xlFuyTA+0x5iwS5mflmn1FfFUubL8NnF+MTFXr4CI29OWbYvLWfq3Ui0Iw==
X-Received: by 2002:a7b:ce0e:0:b0:3a0:4623:86b7 with SMTP id m14-20020a7bce0e000000b003a0462386b7mr39641466wmc.62.1657057949473;
        Tue, 05 Jul 2022 14:52:29 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:52:29 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan k210 sram controller
Date: Tue,  5 Jul 2022 22:52:05 +0100
Message-Id: <20220705215213.1802496-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
References: <20220705215213.1802496-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_145233_186941_AA373A02 
X-CRM114-Status: GOOD (  13.22  )
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
index 000000000000..f81fb866e319
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
+description:
+  The Canaan K210 SRAM memory controller is responsible for the system's 8 MiB
+  of SRAM. The controller is initialised by the bootloader, which configures
+  its clocks, before OS bringup.
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
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
