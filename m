Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DD1D29C40
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 16:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqtQCDVvP8xTw/P1SBK3AFX9DKjNg9zk0H+c7kzH++E=; b=VqjUudZOLnP7hV
	3EzRScGB1MJpsdVaA+YoGmE00nu/fJm/1bvm41MiNdw+A3JBLCJRGWCEaOCqb1vI/Tp0rVlGx3Z9B
	Kc/f9ZdhRTkap3GOS/ww9yUBvw3XGUO9lFKH8Et+1IPWcszJNc+sslin7JGOniilW439elGSHwxCF
	vE7bAvg9HOoq83Rq9ZoFPenkpDEuvEFDTC/fLXPiX9uiPC73X7NUM21T5rTah3th8xBbZ/uYH5J0Q
	6lO5tH4SopPZYRmzmze/gvQrl3UxfB8sx+MEPAcTxNmJ/Kv3C3UgALiEHTq2cZoOpv+BihL1BdjfA
	5k/F6I3jj8i7yemZT4dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs9Y-00000002Uzp-2Gud;
	Mon, 19 Jan 2026 16:30:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs9U-00000002Uui-1ZfZ
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 16:30:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso29514755e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 08:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768840250; x=1769445050; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQd+WNzdOao4inqLQiN4ne6FLA8M9wMTcCMhupP8Doc=;
        b=REnDnqUG7NAdeK8VEWZygzzsOXotQMKl3NO6/6Eo/ZA5T7ZrkmE6NntRAaxxxKsWdP
         CMbPeIDSzeDV5VTVVHhmgn0taGbDJWck0iM4iGsMZORfy7NF4RMey/RTZ4Qz6dwckQ7X
         Apf8B8GqbVZmJiyTphf44F5Qw093hzvnBcKR9k4NPCVv5R1KHBBYU4NzvujmrclH4uMd
         2rt70uumI5UTA3el5zt8mvqb1aJfra7caQYmbifAzfsT7NU9rqI0wuNAh9KBdZtXyuI9
         tR8l9msiIB/2KSrfIO001QJKpsuhX5HlejDk3JpbKiJI4GuJKpeLuUdFXF0+HISsbmCE
         uO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840250; x=1769445050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MQd+WNzdOao4inqLQiN4ne6FLA8M9wMTcCMhupP8Doc=;
        b=Na7WBn3mET8LMZyoPTxvqksch+LXH3aDEX4xW8O7qaulqToA5vonVJyJ3SDuejyTJL
         XqfypQWZxnsvNCv/kmuTMjE3CisGXb4rRH6j8DyL9fCtlxVI0gVKvxkQYIQ7/FTVP5IU
         smxkwMlk5+lVKf8SDMD6XWrzSi3OYL157OHnPKO2bYt9NUeh/WDMra1lDG9F5K3Rc0z1
         Z1FUzNsB1xCjEcuSd2zvYyUJDGKjfVrUe7k0u5dSIappfXxqs5qpRM4vVp5uGNAOSi62
         BXsQTz8pDahpl2pLzji9sP3xnbyL7GpNKE3ZUoZXimuv07yjcXq0Leoq8FM7Gcep5hzp
         A3Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVUdStyh30HVXRVnXqEwQBd5bNGc8BO9vueyR5I0Qtbj4svWtnlUvb3ZnfyGw3jxTBRoOyJZn2JlbC8iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPMkXZp608JPIQX9B0AQSFLJRCSLvKWn3IL7dLCEFeKaZwPGNZ
	bViSOuQJmZDdGm0TcCraVDuw1QkgJuegUCFACt6OmkE2qMPWaBsfjeY+
X-Gm-Gg: AY/fxX5qL1R3TqtuDZWtgVpR1vddqrwJch3Bxb2rCWJD0KtX/4zaK4VcOQ2NMzASzbT
	boNfHmXKJoXZxPOcNniX2Dc0IYuqB7/Aa6TOPokfLxnVZqV03Omxig7HhB5H9ULSiMmnm6Dd1ln
	1VdU2zCjSkuFfuWerhhBqv+diPgMy14TtaxJRn2Pf8gEtZ3Fma7HwEAn4gSp1qdLXLnWWSbuqmH
	W+Sa4riTQ87UwoIhCMxcEG/9howRfGbwSR7vO8S6LHaAHr2Lj3YHgDvg10wVj3ufa9u7JnKIjpx
	NauSrw23rVAVT6XINlKUv1se19ikFbF17WjpyMvSElAcbqFZQK8wlSVNYQNFNutBtIg+rnPwR6S
	opd2QJ5p1zxxLwlQyoyrbEmWG+Oem+z0702LhW4RTELnIaxvJq+V5kSiuq9G/L4i9Me+LUw0jBO
	AEyTK3+AmNPq+IOB2hDu8o+Npv21BhlkmxaU7U5zbORbSn
X-Received: by 2002:a05:600c:4745:b0:47a:80f8:82ab with SMTP id 5b1f17b1804b1-4801e33c17fmr160556445e9.24.1768840249805;
        Mon, 19 Jan 2026 08:30:49 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879537sm201666795e9.5.2026.01.19.08.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 08:30:49 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Mon, 19 Jan 2026 20:30:42 +0400
Subject: [PATCH v3 1/6] ASoC: dt-bindings: sophgo,cv1800b: add I2S/TDM
 controller
MIME-Version: 1.0
Message-Id: <20260119-cv1800b-i2s-driver-v3-1-04006f4111d7@gmail.com>
References: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
In-Reply-To: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768840243; l=2363;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=D6/3vLfrvpSmRRqAGiIOVS8ewVjwKf7GH3zoAMxoKHo=;
 b=/bjUfLKwlPnlPfk4DYtxlHgdXcY+lvP5GNMVM9VYSX/tdxAVVMOnsLQRkscxApXqhk58aE6Oc
 t8x0QPnx4PCCorDSC03hUrqySe6xs7VieWCNdq16mJ1+n/h65X2Z8w7
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_083052_435957_B308450E 
X-CRM114-Status: GOOD (  13.25  )
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

There are 4 TDM controllers on the SoC. Each controller can receive or
transmit data over DMA. The dma it self has 8 channels.
Each channel can be connected only to a specific i2s node. But each
of dma channel can have multiple purposes so in order to save dma
channels the configurations allows to use tx and rx, only rx, only tx
or none channels. I2S controller without channels can be useful in
configuration where I2S is used as clock source only and doesn't
produce any data.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-i2s.yaml         | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
new file mode 100644
index 000000000000..e09631308bb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
@@ -0,0 +1,67 @@
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
+description: I2S/TDM controller found in CV1800B / Sophgo SG2002/SG2000 SoCs.
+
+allOf:
+  - $ref: dai-common.yaml#
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
+    minItems: 2
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
+    minItems: 1
+    items:
+      - enum: [rx, tx]
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+
+    i2s@4110000 {
+        compatible = "sophgo,cv1800b-i2s";
+        reg = <0x04110000 0x10000>;
+        clocks = <&clk CLK_APB_I2S1>,  <&clk CLK_SDMA_AUD1>;
+        clock-names = "i2s", "mclk";
+        dmas = <&dmamux 2 1>, <&dmamux 3 1>;
+        dma-names = "rx", "tx";
+        #sound-dai-cells = <0>;
+    };
+...

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
