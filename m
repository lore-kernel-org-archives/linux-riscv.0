Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6129C25B4E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 09:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqQRROyveFwwIPi0Q9cBvLwIjBItOQXvAjg2SnKp2nE=; b=yGAE2bSbN9MFjN
	E9Y9j+qJ2Iudau9NSHSmHUa0UuIKt3OU4R/LD3Y+CHmZVw7iVvhCjlLLDA95E/8OXwEJSVO+v749T
	GUQ1zpCZdjFPPh+G7CT8vouLmlXnlDjpVCqJe8BnHuZ821rVKD18JTSnAFu2cIEduxVc3Lg7uva2y
	nVZspQW1mdeKZ/A+Tu1uks425nGEU73Jxd9vWYgwmNLUIJGACMWegVJXQxJnOUMH7+ImLItQ9AqkS
	eZ0rLolBmMoRC8AGpJA2pIEt9QjWUeiSh+ZQpkU7NGorQ3AipUW9vZiZma/xYJKKHTvuU3eaa9/J0
	StZfJlkr3UksbTsmlr0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFWQ-002t3l-AT; Tue, 24 Jan 2023 09:23:18 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFTH-002rRq-7l
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 09:20:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id m15so10903364wms.4
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jan 2023 01:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lf7sCIV+g7d4Io27nUeL8AFqRST4Uv3gC9DO+XLsu5c=;
        b=lJt9WL7RKgvvoDL5lBaSpU4gI2CocxNuvfSF7KVONAUJZs6yobUDwpIrRRcqnKcSlh
         aNDWJDYWKfjIEQmmfZgp4C5NLnLeNKnOJesf6wxCwj41xz8PqrRZ7tjSC8H8N0V4EEeX
         +xizfcHf3c82CKkFo7AQqRhYNYPvoRtBDK+EXg+6QmTy9xPPR8CBPOC8DoeiMSYrSbRs
         +2DI2O+4byNqNaZyrmaj3+gStKEZGYRL2VdyxtSesXHBrddWdYqIhFx4JI+GWpKz3Slh
         OWFvdMspBlVRsUsPNBB+Y+39reJ3/ujkk2aEvYLuP0fdQ6n4AIU3td9/81nygjPGkAD3
         XXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lf7sCIV+g7d4Io27nUeL8AFqRST4Uv3gC9DO+XLsu5c=;
        b=TjgK7+jgmPOxGL5M+v2qrqbWFZyCXGd+X3GXucDL95oVUhSkAPT4qNdAsGOcQQ7NBw
         RM//Iv3qZenWYlixAAPTOZYVr2xcsVx02Fkhqr7Tj2uKmQIV37DaVLqB7B0fcymPxS7Y
         FnxlcK856EhjDgYTh7SkdLzyNzWYiQPAYhtTrPu6OAZ0EqQYnNyl8+cDqnpBOxqGd1sw
         au9Qi9gvHzDW1xt9TZ2FxTrNmruWGQNgd2oopLFJzeW4Qkhm+F1hVT2EyU9oEAIAs9+0
         kqlLzq90AG6VKgQeEm/CwQdBMm60dynaDmm7Fkuzb+dDUSuqiwS3w84/FKRzgC/Yjdpq
         qokA==
X-Gm-Message-State: AFqh2kodNd1fgK04pGs9n+6cW8OloZ8ttNr3cIcgrKfHcUBD4YUlDFIr
	Bp644dGnmCVQDDLmW/55il2YOg==
X-Google-Smtp-Source: AMrXdXujRawjXpcdvGx0/kXpoe2kFjce8Y2HGF30EtbJZyHYimc6YERQVrxgL3vyTREcg4RVSGKu7A==
X-Received: by 2002:a05:600c:3512:b0:3db:1665:2a98 with SMTP id h18-20020a05600c351200b003db16652a98mr22374802wmq.16.1674552001966;
        Tue, 24 Jan 2023 01:20:01 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:20:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Chester Lin <clin@suse.com>,
	Fugang Duan <fugang.duan@nxp.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Pragnesh Patel <pragnesh.patel@sifive.com>,
	Le Ray <erwan.leray@foss.st.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 09/12] dt-bindings: serial: fsl-lpuart: allow other serial properties
Date: Tue, 24 Jan 2023 10:19:13 +0100
Message-Id: <20230124091916.45054-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_012003_339104_5B3C9893 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

Reference common serial properties bindings to allow typical serial
properties:

  imx8qxp-ai_ml.dtb: serial@5a060000: Unevaluated properties are not allowed ('uart-has-rtscts' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index b1e81a6451a6..26c3593fa98b 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: "rs485.yaml"
+  - $ref: serial.yaml#
 
 properties:
   compatible:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
