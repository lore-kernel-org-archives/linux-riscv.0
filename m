Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5727C54EED
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 09:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v+3lBoYTjLadmolZZeaVyrTQH3L8DWz1Bbu94bDcUI8=; b=HFMEv1qFhZbcbw
	kYJwQBN1PU0mk9FeXoU/nDWmnPEiXSDJExueMj2RcWTwOUeZR0Pwgz3xKNp3xJhTGYUUMLnpDSbIt
	dSfsT/WrwNVahvRggSK5LqIL2+xgOMyjqzloc0wm8kdNKuWtYaZU1ZDDHTIjfsQIKf9wjmx+5v4mF
	xF9hZMA3xUA3PloMKeGCX9xk4M0O+kxcMyFOIZEv9X5G4EMxFTAIJeC5/cKHhPf872ZLvfm8+Cpgv
	Ev4v7t5O26M119psSG6AlDyfHchz07vuLMBInC5mQxAXwyBcwVp+tzTA7AZ4O1Dsalt5mxZxhmak/
	tN5wOb/Ak1E2RkiK6O5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFT3-002rIO-PC; Tue, 24 Jan 2023 09:19:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFT1-002rFe-5Y
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 09:19:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so10419630wms.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jan 2023 01:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nb5CwN4fN4XTwRx3Tj+I+Ommhby0lGr2iuTrQcxIb/0=;
        b=Erz+EhOmyjtVC8y8TD1tzEzfeEI+tUpI6auPlhOS+L8rFcrpspoGstb2EvkLgGuuAp
         DpKD+EnP0qVzHF5BpeHg6bzd83CFhVrmFGWodo0QhT85JTbjUDY9rlI2F2q9CqFUqE8H
         Mo/TmRVuwZRoWTTKcd5YrFHbXefcW6Vjg15ub+DUMbZ5/zXbGi+oynGVNw7VL8aiHpzk
         yRUkxDf57i6EJjuOmrAQh0V5XQ3cJSG/q6lOFE89YcI0jNM4Yd9chTApm8BS3Tp2Lz0c
         ytWEkYuRtJnN5GvA0nQYxCJPky8Tviyyop+mibt4vI/EKUDqf+YKvXMhb1EO2OGo3A4D
         EEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nb5CwN4fN4XTwRx3Tj+I+Ommhby0lGr2iuTrQcxIb/0=;
        b=ip6TSe76WPlBlTyXhGWJy9KDmFxVDOqJQfSQk4NPuJXti6jjMzWAcIXWV4fMLFXJUp
         RuaXj9zQi25Sw8g82/srR7DacnubJQrICLfSVbtiwh5nleZipW68nQ6uAiIrTw5Ral0a
         lb2KCRXGxdQB79a1EbfqYO1JIt6XbxrVt1wuPbB7RhIEstkYs+rUILDUPTU7rqcsn7N9
         hbT1WKz0BxMbKOG8/r30vuiw3XBOZEUxNqwn2OUS/ro3YB29h/isChsKPTp7Qa1yBbNV
         wnpyPc4bs+Qs2b6vV2eotpOHVLFzxeXyH9ykKllL62LjY3sZL6gLEiqU9smkxGlS99KL
         ERUQ==
X-Gm-Message-State: AFqh2koDbhT9Y98oVeSUAvkBWdfLmlGAJOi/N1xhmMbsTVsYLM3G7pk3
	Gs00HIG/s1xYUiwk1Z0CuS9vlg==
X-Google-Smtp-Source: AMrXdXtDAh7QFXNJKNHeXnVkYsOgnO5HNUP0pkqugffnYolM/QSylK27RP72alQg+Wi0pRiLhcw4xg==
X-Received: by 2002:a05:600c:4928:b0:3da:909f:1f6b with SMTP id f40-20020a05600c492800b003da909f1f6bmr27413613wmp.1.1674551983490;
        Tue, 24 Jan 2023 01:19:43 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:19:42 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v2 04/12] dt-bindings: serial: correct ref to serial.yaml
Date: Tue, 24 Jan 2023 10:19:08 +0100
Message-Id: <20230124091916.45054-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_011947_243371_7C2D24F1 
X-CRM114-Status: GOOD (  11.89  )
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

The serial bindings should reference the local (in kernel) serial.yaml,
not the /schemas/serial.yaml.  The latter comes from dtschema package
and is a small subset of serial bindings.

Usage of the local serial.yaml allows typical properties and children:

  xilinx/avnet-ultra96-rev1.dtb: serial@ff000000: Unevaluated properties are not allowed ('bluetooth' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Michal Simek <michal.simek@amd.com>
---
 Documentation/devicetree/bindings/serial/cdns,uart.yaml         | 2 +-
 Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
index 876b8cf1cafb..0c118d5336cc 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Michal Simek <michal.simek@xilinx.com>
 
 allOf:
-  - $ref: /schemas/serial.yaml#
+  - $ref: serial.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml
index 2f4390e8d4e8..6f65e9a81c29 100644
--- a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml
+++ b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml
@@ -63,7 +63,7 @@ required:
   - xlnx,use-parity
 
 allOf:
-  - $ref: /schemas/serial.yaml#
+  - $ref: serial.yaml#
   - if:
       properties:
         xlnx,use-parity:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
