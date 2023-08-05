Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963DBC001DE
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 18:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QdXToyuLblXgsxtIOkwX9VlGP1Ei37+vjbn1fRY8leQ=; b=MmVPmS5wDe4TJ9
	yYCmKGXjriSgJllaBPVz8eVWoUztZvW8brGiILQGQo5VtnAAfhpYiBQjViuYKa4LwMfAbRtwMVWYD
	UiaQTUtm4SGoYz0xBuw8vmM99z2/EApveuIu+w+1/YjlZFTttOBc7r0LvxFMGufX1BTRu0Ye9IDLe
	7E/dKx+41NW4uMXF/ttAM774hbK5rzLzO4xfhctuXVLmM6MgfkPqS+expr0H4aJJv0ARtv/hlDUIq
	OJmoEWdk3fYVeeVtHSYnN5ZXSFZ8aBFYL58BQEuPGNDz1aSMThgBRRkLPaKQOQyy9g4vgMp975V5R
	8P2IilGzTjbV7DLt8lQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLez-00EQmg-0o;
	Sat, 05 Aug 2023 18:05:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLeu-00EQis-16;
	Sat, 05 Aug 2023 18:05:49 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe4b45a336so12380935e9.1;
        Sat, 05 Aug 2023 11:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691258745; x=1691863545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ui9mFi+8YpeTm0k09SoqGWMWxqwLX8g/SM0GMtVVuxo=;
        b=JXaio9I8DD4b5kA/e3J4i8BugFtaIhTeAsqI8YpbFje4l002vWoSJ8cMKU0hUZuEmx
         lJAOUXG/CbuqOiK9JDZTQ473fZqnNUUQRQZYrGhXaFfFddAtxYbXuvYdP4MUOkxQVpCG
         6k6GEhMUUMZw+XmGLr874mRvlbYTfED9V1LBPWg0EqkDvmmI9ce4MBY+N6pZa1lcQNdU
         tR4H3XCjWUe/PW7LQiz97Swp4uEEos7FS9Z7u18Zjm1kVlHGpx/tx/NPI5jN2g5bkxQz
         hbiHrAB7ihoLl3P2ybOtQlJLx4Ha62sof5/RxtfZL1sivlBqdiis7qyRd3rRo0eCwJD4
         gekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691258745; x=1691863545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ui9mFi+8YpeTm0k09SoqGWMWxqwLX8g/SM0GMtVVuxo=;
        b=TJ5wmdTvZ3gbQVHt9TjGtn4CKXPismUcK3s9ghij7pt8mp18k1HuwlAOobwilL6C+w
         s2248kTdemGbV2qR6ZYkA9xuQqTpSaaQSNBAl32gJ6d1BwneYPdtBARn4qX8e7aWJ6Yz
         cCCIgImUD2c9BM7jB+Eop7Kuu/+Fd3Tig3amTSm6aq65Be3etihnZPcf17mdyQamx4Xg
         ptgxkHoyedBzf4PD2zRFrCBOkzaBWPX8lGczEw5gIhvEsQaeUmbk8klSpm/AYnH7ibH9
         u3Svb255O2vWVKTSeXIiaUNaedoyeMlADv9O+rr60C/B7rlzcvj8Vc+Lt81Ujr8CwqjY
         wx5Q==
X-Gm-Message-State: AOJu0YzWrDOqNoo9ON0VrnZVgv5C4qDud6xTPXaMnCQ3BRe3+ZnuILAV
	coqpQsgsTsgKrtzOYeP2zUc=
X-Google-Smtp-Source: AGHT+IH52KbShgZ7/MyYYljmA/7meZEjQcL6qqHPDeWo7emmXLPpHbnsfG22wPwvuhUIyNpA/ptA7Q==
X-Received: by 2002:a5d:4b43:0:b0:317:5d3d:d37c with SMTP id w3-20020a5d4b43000000b003175d3dd37cmr2878909wrs.24.1691258744489;
        Sat, 05 Aug 2023 11:05:44 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id v4-20020a5d6104000000b003176aa612b1sm5710402wrt.38.2023.08.05.11.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 11:05:44 -0700 (PDT)
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
Subject: [PATCH v1 2/5] ASoC: dt-bindings: Add schema for "allwinner,sun20i-d1-codec-analog"
Date: Sat,  5 Aug 2023 21:05:02 +0300
Message-Id: <20230805180506.718364-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805180506.718364-1-bigunclemax@gmail.com>
References: <20230805180506.718364-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_110548_379933_19905B63 
X-CRM114-Status: GOOD (  12.80  )
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

Add a DT schema to describe the analog part of the Allwinner D1/T113s
internal audio codec.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../allwinner,sun20i-d1-codec-analog.yaml     | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun20i-d1-codec-analog.yaml

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun20i-d1-codec-analog.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun20i-d1-codec-analog.yaml
new file mode 100644
index 000000000000..7586076b9bc5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun20i-d1-codec-analog.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/allwinner,sun20i-d1-codec-analog.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1 Analog Codec
+
+maintainers:
+  - Maksim Kiselev <bigunclemax@gmail.com>
+
+properties:
+  compatible:
+    const: allwinner,sun20i-d1-codec-analog
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    codec_analog: codec-analog@2030300 {
+        compatible = "allwinner,sun20i-d1-codec-analog";
+        reg = <0x02030300 0xd00>;
+    };
+
+...
+
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
