Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EC0C38142
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 15:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dCyg+BGW0uMCXUCGW+fTreGWXe3OlhxrCZXT+vYUnI=; b=cMSGEz5bpQSzgh
	11hnV2ZJUdJ77vxfM9Ea+80YQD2HTxXE4j71TlO+o1jM9HS9GIhdTmfk8cNjCr+VLXNSmpnNnH+xq
	5zKiuYA8gKDkLSLVbLzHD7JWer1xaTu8h51xldqq3jkDC0qfGye2b2gJB4lvSoPru2PM66jDEa6X0
	tv/mQ1bsfzI7vrB4wG4RoGusWOQdZDvakhGg9kiz3BTpPzNRnAACJuwaDI9sxXwNBUPATHQDNTvCf
	o6gIzlFyu08TwMBVPaQQjRWZ5ypx6XUVWdIsH7FSBegn0KW1ZWXRSu3GWF6siA5vSWUKp8SN+uHYE
	EWlzK/KG9XwblMEe3ZiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyZ9-0007De-NR; Mon, 23 Jan 2023 15:16:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyVi-0005U7-Gw
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 15:13:28 +0000
Received: by mail-wm1-x32e.google.com with SMTP id q8so9257709wmo.5
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 07:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42Hfl1J4qT8SATIfnUTpADzmL78jDne+EhYGf6Qds8c=;
        b=yTpXkuZVxBf/Okosou2SRl8i1EYnqKjpR9qYNEiJoBGzFJVhTP1BUZcYXSwoDYMMm/
         gGEOvGj+EPw8SDiTsobtFtGxqW5JxRGzgDd8uP9l7D5gjnnmBMvuXxYa5MsvGhtFwGkh
         1tXRuYZCb+3E/KkAf+XmmfvAi5/C3Iw+uW9kmkIK8pzTnKGZIEEg6DuXqnQ1gfRJlvV4
         utPYIa2FsLiGCut+4a08Y8O9Wbw9fGRby/G9y/xEyeEUWM3TfuAwiFOOzfMPfpH7cDwZ
         YthMHBcw7/iaTz1OlbMNI73XKu2je6+LGiC+3p58LLw1SPixX4Bg6TAKC52aP69iurRt
         +TeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42Hfl1J4qT8SATIfnUTpADzmL78jDne+EhYGf6Qds8c=;
        b=s48auuJ7WUwTPt19i1UOdFu6YF8AdYUkdJYLTjfIbXozLf5CSVxVcYwe3FPKmFA6um
         Bso5jeonX7ubHSjmGkN4UC3KL4Kvup7TDti2kljfHXcYSyVZXlZMih49BaFNNtyj09LD
         cvvY0k4TWFf4tTuaiKcMooc6AJuhbssUReYMtMiwmTME6tKugsgWM/KaIex43eaR2yOg
         vz19piV7ktO/0Ob7AYlR6ucO7BM78IKSjlWIjXf8mOS9/Q1z+9sQPt56rA+uh7XhJSvx
         infE2sAGmvT2GVZrQvunz963C/LYVGkuQjGRfhUBmEoNU72w4kczI03omFRKkZWQfEZV
         goOw==
X-Gm-Message-State: AFqh2krAEXfyY94ZDfy7d4Cl+Dnd2CjJvu8uZ0L27XcaOzEJnvsS4oCr
	ZdMk2DNRpO3Z3X0lSM1OH/hNcA==
X-Google-Smtp-Source: AMrXdXu6vYRYY5wV4XGcnXHQFFjaoLMw0vFZzVv4DjurTQnJ18UGrtA3F3Fe/V27r3/7GSCupm0HyA==
X-Received: by 2002:a05:600c:3b82:b0:3d2:392b:3165 with SMTP id n2-20020a05600c3b8200b003d2392b3165mr24592200wms.12.1674486805187;
        Mon, 23 Jan 2023 07:13:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:13:24 -0800 (PST)
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
	- <devicetree@vger.kernel.org>,
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
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 07/13] dt-bindings: serial: fsl-imx-uart: drop common properties
Date: Mon, 23 Jan 2023 16:12:56 +0100
Message-Id: <20230123151302.368277-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_071326_637550_AA80CA44 
X-CRM114-Status: UNSURE (   8.91  )
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

The binding references serial and rs485 schemas, so there is no need to
list their properties.  Simplify a bit by removing unneeded entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml b/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
index 9d949296a142..b431a0d1cd6b 100644
--- a/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
@@ -83,13 +83,6 @@ properties:
       are sensible for most use cases. If you need low latency processing on
       slow connections this needs to be configured appropriately.
 
-  uart-has-rtscts: true
-
-  rs485-rts-delay: true
-  rs485-rts-active-low: true
-  rs485-rx-during-tx: true
-  linux,rs485-enabled-at-boot-time: true
-
 required:
   - compatible
   - reg
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
