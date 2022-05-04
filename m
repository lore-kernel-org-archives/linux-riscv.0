Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E73C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 20:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=weO2u1LMGuPZTmxhBRPQjCOlwk6o44Gy06hfWEQLuW8=; b=CP1CTh3TYAu4tT
	Q2QtN/Xcnq5eOH4tmCweScO5C8BlkSUuXNYl37VFP9QpgNgEjj4+scAwTMgQjRPLigIwKrX4Oh4c3
	lZ5Zdb0cTjiAP2Yug6uUTFKvccWCfWSOW839SGrBnzoMxe4pNrVSw7NU8I4S9uIoKcYQFSAr7PH0y
	IO1OqFDghVhiqmpUJEjd+2v9J/6OilsM7g3o1qffvXfDHIWrf6A/h1LbnfIWybvW2p7Un1mn2eyY/
	bEwJ3wtyNyE460Y1j4bqeThc06vJ4lfcg1IDF5vauyXOAsOJWelbgPI2CY0nh5mFU5NVw1l7Q6yaP
	PnYYkEyHYXjyq0eeY9hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmLie-00CaCw-UF; Wed, 04 May 2022 20:35:33 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmLiW-00Ca5l-Ew
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 20:35:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 r1-20020a1c2b01000000b00394398c5d51so1511489wmr.2
 for <linux-riscv@lists.infradead.org>; Wed, 04 May 2022 13:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/kez/qpsFQ+IZamV7zrV7LTtRW1TdlvsPTX0KFg6YaM=;
 b=OzZyx1llwNQhvtNr3EhzufY2pfeGAnTQZ8980mXd99emptugndbzow05J7OXa8m8Xu
 nqP+vnqzlOc8kFKMq/iHrWMedvjQ0wRUG+S6H4wF7jl0Za89CZBcRF4J5wksf86kGhMj
 KrIvfuB1e62wN7PxM6tUfql2MvRjusCaH8FUy4WoNLxv1xPZsxlUOaOjz0eN4iMqdeeg
 mkaG14zpKOLYsIheTbsOJqXU3Kj4mOfQNxRjiFvz9zmvBAKMTPGk8x/owLYrzK1Y9nts
 1Ts50BdFx8cFdgu/qKUZoQVP75gO+N4ac/cN7jK+IUdqCbCasA2zIH60wWTZoHtf6qwh
 2H6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/kez/qpsFQ+IZamV7zrV7LTtRW1TdlvsPTX0KFg6YaM=;
 b=MP4MTL9CDZM73JiqwXoOg7/QmVJXbghc0DToXcvYwgrBUYVgaS8LUF3M74KvufMV5C
 XAS19XXbOavk5XmuUBlscyz1N/2Y90OJhTO5X/wgRFo/SLZC/vVuDOAxnEUcg0npegk0
 TRkfgnOuj5qaQ8PrWIyBp+RHB4DvUvTYAllTF3AWu+0+xqQsslw0szgP/QZDT71urnX2
 +0/iXCZrRTHjWcMmZkusmstyCNT+c6jYsLHMoS66JqvMc1tF+yqjegO1N2p/d/8KXk5Y
 CfZqginJYmoOCuN4VOndeAtfoSuaix8w4WCuL6uws10bLSA96HpbZPP7xhCw8I0e+hEF
 YY7g==
X-Gm-Message-State: AOAM533vNvgmq8VTTKp7k+JGGv43jRVc4HXBJmhY1jiYOKO2NTH0LW6Y
 G0Y30c/PN1ffKUCL6L8TJ0UMkA==
X-Google-Smtp-Source: ABdhPJwTP+LGkjMrAS/D90kMOMXTYP/hJZZwmXwXPYgDQ3kVDjSRRrJF5JOfWaxcbNwZKXmG/pVgEQ==
X-Received: by 2002:a1c:5459:0:b0:394:1191:a1ff with SMTP id
 p25-20020a1c5459000000b003941191a1ffmr1086431wmi.96.1651696519959; 
 Wed, 04 May 2022 13:35:19 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 l20-20020adfc794000000b0020c5253d8dfsm13330101wrg.43.2022.05.04.13.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:35:19 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de, heiko@sntech.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 6/8] dt-bindings: vendor-prefixes: add Sundance DSP
Date: Wed,  4 May 2022 21:30:50 +0100
Message-Id: <20220504203051.1210355-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504203051.1210355-1-mail@conchuod.ie>
References: <20220504203051.1210355-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_133524_572039_602A614B 
X-CRM114-Status: UNSURE (   7.73  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Sundance DSP Inc. (https://www.sundancedsp.com/) is a supplier of
high-performance DSP and FPGA processor boards and I/O modules.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 01430973ecec..1d47a38c2a2e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1197,6 +1197,8 @@ patternProperties:
     description: Summit microelectronics
   "^sunchip,.*":
     description: Shenzhen Sunchip Technology Co., Ltd
+  "^sundance,.*":
+    description: Sundance DSP Inc.
   "^sunplus,.*":
     description: Sunplus Technology Co., Ltd.
   "^SUNW,.*":
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
