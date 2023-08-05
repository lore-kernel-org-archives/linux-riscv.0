Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB2DC00528
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 18:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhaqS12Slc4XYKuH0+uL35dKAlVvfXRehKOpzEtzN94=; b=l0V50wYmQvaMkm
	7siZuX/qZyW/V/4umXI93WJqqVh8UME7IPYlwEZMU72uDFt+1amymEYa0NqGK0VuW7pYJPQymNMXf
	2fyQcH2iJbX4wV0gi1VlD8B0rJtKwbe77NPBzmp5wVH4JUxue1nZOtMGh5OMAzmOdCBfy8EWeIO4b
	8X1Hyqqc8HrNZcC+BLe8HAwzxEfrKUDsn5owrozzKzl8gzl2ZqC5rFnhaN/7CrlC2Xxf3DNHo3S7y
	uVGyycal1M4dmcKub5rYH8gCSrCV7cnSPG8BRQO81i0BMJeHf3zoMSzvIN6puaYsW8sMwl/nEK0yC
	OR0x2QQTaSiAUubNY5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLey-00EQmI-1f;
	Sat, 05 Aug 2023 18:05:52 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLeu-00EQhj-1L;
	Sat, 05 Aug 2023 18:05:49 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fb4146e8deso31030145e9.0;
        Sat, 05 Aug 2023 11:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691258741; x=1691863541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYdoFc7rP2Qn0GrAVsnewk5f2j5o1yVoLkw8kbLJjy0=;
        b=r3Txk5RV5wSnvM9sUhJh/haq7s/rvtUErYBNeUGXZvyxG28S5pVHmusx9El8fjzzOe
         8d+FE5hPEyvs6E8G708I/QCAREgKXVfvQssxNDWoYgjFC91e/qQv7JPBnvHddK5GuU/u
         3r0ciKiuXdQpfn04ssBtDdwhkOrCPgF94itvMf4pV0ee8NBV7gE82gIDTSvSOCiCghQ7
         DI4HZoNJEaQGng6dUKIkv8kUoBRQu/+PB9b4/F6GIOnwnJ5Xk2uTAuT5jpxW0HoCSWc1
         RYStqJSmsIqGj464x8bUbin0bxRPm2TY5Cv9GtH1+nQoBAzbe6Y46Fn19RnmSOmP8Cdb
         pG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691258741; x=1691863541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYdoFc7rP2Qn0GrAVsnewk5f2j5o1yVoLkw8kbLJjy0=;
        b=dOccCoPhqJApbrp6nTdWKGrDiOzdNn0K/s+6Xy2zJaovicwkhzP8bqpmW4PE4Oy6c7
         MEMKsgX3a2GTohSQjFgq6LNdT16t4Z2OcodUNQOyODSkmkui0Ow/MEIb3MXybfU17NHv
         GB9Li2jS4T1o/Qec5mmFuKJ0HEs98rHlNCLNZHWyhHmmpTetK9uMXeMuWcvHFalLsHE+
         iCR3js2ZyNuWfTx0PFsRnmWcUWIbrLKJUSsvjLF024nJZ0c3sG1/DJ/v18MZSqDtbE2y
         Y7O8rhs/ybao7quDXxZ8rUCO4BkwhjzmFXybB6Oq2mNfyLNoSlIYnNE+U5eDfp6+tqIN
         j73w==
X-Gm-Message-State: AOJu0Yy6pQnrLM9sdkhfKe26rOgaPMJyr8zxL1HQuMSbdEZEDXdwITpx
	28q4zFfyVyz9UrC1j1olk7M=
X-Google-Smtp-Source: AGHT+IEhVL7vlQWncytTyM/13d+OkFFEwfUKiR3bSl2fOgd9CDDE30po2p9SosJ2ijsdOWBwvqj4ow==
X-Received: by 2002:a1c:7205:0:b0:3f5:fff8:d4f3 with SMTP id n5-20020a1c7205000000b003f5fff8d4f3mr3949613wmc.7.1691258741186;
        Sat, 05 Aug 2023 11:05:41 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id v4-20020a5d6104000000b003176aa612b1sm5710402wrt.38.2023.08.05.11.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 11:05:41 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Ripard <mripard@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 1/5] ASoC: dt-bindings: sun4i-a10-codec: Add binding for Allwinner D1 SoC
Date: Sat,  5 Aug 2023 21:05:01 +0300
Message-Id: <20230805180506.718364-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805180506.718364-1-bigunclemax@gmail.com>
References: <20230805180506.718364-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_110548_450345_11447FF5 
X-CRM114-Status: GOOD (  10.97  )
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

The Allwinner D1 SoC has a internal audio codec that similar to previous
ones, but it contains a three ADC channels instead of two, and also has
a separate clocks for ADC and DAC modules.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../sound/allwinner,sun4i-a10-codec.yaml      | 64 ++++++++++++++++---
 1 file changed, 56 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
index 78273647f766..cd9e2ca5783c 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
@@ -22,6 +22,7 @@ properties:
       - allwinner,sun8i-a23-codec
       - allwinner,sun8i-h3-codec
       - allwinner,sun8i-v3s-codec
+      - allwinner,sun20i-d1-codec
 
   reg:
     maxItems: 1
@@ -29,15 +30,9 @@ properties:
   interrupts:
     maxItems: 1
 
-  clocks:
-    items:
-      - description: Bus Clock
-      - description: Module Clock
+  clocks: true
 
-  clock-names:
-    items:
-      - const: apb
-      - const: codec
+  clock-names: true
 
   dmas:
     items:
@@ -103,6 +98,36 @@ required:
 
 allOf:
   - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          const: allwinner,sun20i-d1-codec
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus Clock
+            - description: ADC Module Clock
+            - description: DAC Module Clock
+
+        clock-names:
+          items:
+            - const: apb
+            - const: adc
+            - const: dac
+
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Bus Clock
+            - description: Module Clock
+
+        clock-names:
+          items:
+            - const: apb
+            - const: codec
+
   - if:
       properties:
         compatible:
@@ -111,6 +136,7 @@ allOf:
             - allwinner,sun8i-a23-codec
             - allwinner,sun8i-h3-codec
             - allwinner,sun8i-v3s-codec
+            - allwinner,sun20i-d1-codec
 
     then:
       if:
@@ -229,6 +255,28 @@ allOf:
               - Mic
               - Speaker
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun20i-d1-codec
+
+    then:
+      properties:
+        allwinner,audio-routing:
+          items:
+            enum:
+              - HP
+              - LINEIN
+              - MIC3
+              - MBIAS
+              - Headphone
+              - Headset Mic
+              - Line In
+              - Line Out
+              - Mic
+              - Speaker
+
 unevaluatedProperties: false
 
 examples:
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
