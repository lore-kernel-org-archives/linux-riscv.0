Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D5FC38142
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 09:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dCyg+BGW0uMCXUCGW+fTreGWXe3OlhxrCZXT+vYUnI=; b=eAKgFjhmQvwER4
	bLlsQ74kw89dJIy/rkzu1calKedyyEcDCmBQ3ZKtRfDd8okRp09sxheU4USuA0/Uu3x2TmpthRG4P
	ABdtHss72vBcnk5VsMO8jPNBHgWPKEju9qyj9V7gbr37L7g/S65e4PrAC5svD++gOzgwoPIncXIUI
	Iu6NzYynikzk2xJhFYXT3Qb/tQpnRYRsNwO6XZVdNae2kyLe9TiYYM/gidZTgdHhbG+c7mwHWlDX4
	76jKCF5iSocU0udwys9N9KxwUpgWTUPv5jEE3/pedZRiRx/srYZgKZUS2vl4Z79i5HtLfMqsimw00
	6UGQ1u1wefsev8Q9XdFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFUw-002sGi-HU; Tue, 24 Jan 2023 09:21:46 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFTC-002rMG-2M
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 09:20:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso10401509wmq.5
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jan 2023 01:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42Hfl1J4qT8SATIfnUTpADzmL78jDne+EhYGf6Qds8c=;
        b=BfLinym/cklYezWvUdj/D3yAkf3NS77r92L10AME1y3JOtClKrEyZemZUji43xEfmE
         1CTGJHL8LxpGTSF3AkvFqeVNgE+wNerxDjURu1GcsX8rSNVpDps+fEwxFUsL1xhzvIiB
         +JmwNDp9o2c47v+qoJpdwZjZjMOt18r0Fc2C4iVYdDxnRsFioUSNzd9hAO5fdSylxvpr
         UUpTk957V2QsLmu9PRjgqzFHSbSzImHl6JKpF9omsRIvzHfPuFAVkaXEXwuO1hzWJOBA
         0yl9HepBj47QjGkby3EUe8AYOG4bhg7R8UD5AgoB/ADnPyyfeGIxtjSl3t1dXmFoRS3j
         T0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42Hfl1J4qT8SATIfnUTpADzmL78jDne+EhYGf6Qds8c=;
        b=ci+LiFAGIodNudLsV/Z7mDGb3vjeihBhULHYkC8OXTlws2ndb40mxLX84X4bSuZCzw
         s9Hwqqx+JstvRLm5M6TonaasA7yQkhJ+NZLdREXpV7KS3SVT4DshyYLDJRhKQO1NM0Dw
         +ukshFjwVMSWWczVnf+xp5lZFj6fMGP5Zvu00NkmFsM6NOdNyY6I5jTQbLPiRwkYBlUh
         J4w4DNeczklr4cXKNcAtI4qTL8yGPDTjuxwoHx1TOs8uHJpuRnCz/oA0L6B2YmvV8pOZ
         p6PN8tQaJ0BBNFN3iZzb0Uu6l5AYCQTCjmjlm0N2pXO0ER5hDlcjgmZMu9t3h3Iq/rA7
         dGLg==
X-Gm-Message-State: AFqh2kpYr8A0sgtPWoPD9d7ZCOqN7M1ErFIv1EtfKtK1YPF8laqaY+Gk
	E3degZ3bL7NHBKCkTyvwuc4G+w==
X-Google-Smtp-Source: AMrXdXs6ofs80YXfseUtI8imesuJyhITR5jNUBCkTkhOsWQiGBk4hZUL16Iu0n0uoxEvTPx24lzRdw==
X-Received: by 2002:a05:600c:540a:b0:3db:a3a:45ac with SMTP id he10-20020a05600c540a00b003db0a3a45acmr26791047wmb.32.1674551994306;
        Tue, 24 Jan 2023 01:19:54 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:19:53 -0800 (PST)
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
Subject: [PATCH v2 07/12] dt-bindings: serial: fsl-imx-uart: drop common properties
Date: Tue, 24 Jan 2023 10:19:11 +0100
Message-Id: <20230124091916.45054-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_011958_153559_0A4BC803 
X-CRM114-Status: UNSURE (   9.56  )
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
