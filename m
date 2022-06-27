Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57163C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 19:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fexyTmP7uOZ+kw7Qfz1MmXKjRUr9tDTvMDf4KU1pYTE=; b=Sn4dkNZJk6pbOp
	jBCC4Axdv4gTM7l3SxK/y9zq2g0C3BdCcXyQv8SMaXn3oAxGlLoYepqJ4BItZ0xdT+IAPZlFgWDh4
	AueO7ZkmEZegTyC1tvolPLnn+m96eNy1cwaYYT7nTgDg+G2yUPTpLAAdypATf6CTcd36NAklH5rCQ
	jyEcyYs4tX2A5muVE40WP/0uc9wuv6ziTRb/xAw1xFCCVARxYpdMU8w93HKD/YTdnvsZGmvJ/VVrk
	tO7Iuql1hbDd+PP6LxO6WWqDi+j/Q2M38ANwn5wXCvbwu6zMuz6yp7xvwvnH5MyC7LqEQVRRk893f
	aOmdETTRCXW35jVBMUpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ubv-002ali-Nn; Mon, 27 Jun 2022 19:41:27 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ubq-002aeo-G2
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 19:41:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id o19-20020a05600c4fd300b003a0489f414cso2716095wmq.4
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 12:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wA+ekkpjde0Zx9cXanks0YsUmdtDvWig/ia7r5xRwsg=;
        b=QizeLMoa4P+K5NRfW783uv00QZQ9FUl1yrJSFvTDQ91NxzrJIEoQC1vyn7V6UN1aBI
         KC47cW6AyaaQsZOVeSRRRcDH6KVsIokTGyvzOhvNcwVXXmO9A5cBaI7DAxVPi39AhkBc
         suh5GymLQ6pb0Omy1yzYvTL9j0If9mnJhIDj0ku/aQjAl5BJ1s4s5lX4boSmhT/3axFd
         9BaZlYgOo9FI3fxMT4EBBRC7Mae04h+WHW7wbDtw8HercIYexvTAN752j8mUDTucVOX3
         dyTU0rPZKbAWUOVQJDUXIMdakema1v4gXRBDbYJnKue0E1FRC9jfhN3HZzfcP4SKHOku
         6lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wA+ekkpjde0Zx9cXanks0YsUmdtDvWig/ia7r5xRwsg=;
        b=ew7hlEa/yNi2Sv+fWsrii/0519CwwJNWFMWKMk5BurfhX3Muc7nnsDpHHuwDgq+Cc8
         B9JzPjXM/Kp7kRmwbVmz4Itbr9eVoasQNl2rNNUzjmneY6lEwYQ6KYLgGHHbHnKuL1QC
         0+cZb63zwMR2yqdo5iNTSEieazBqRYaTpYOC9yZdvnuTbnqjvqg7+bCH89uG9Vv77MGj
         kVyrR8CaVYhewzr7rKri/0Xaw6F7AtvyXBkxCt86geJBMnptghx8GSxDG4aIcU9gvKWn
         R+F7E06QCuVSeeT+6vYy/cp4mUO4GhhpHJdR/sae+3ZZfmadO+1sTY9zZTLfCckv28Tf
         GQhg==
X-Gm-Message-State: AJIora8t3exPf831B9id5UudjqCVuTrypd64j3LwKVU5ydYneacOkokf
	NG7aH4WYfjKVj8b06zSSNu8yzQ==
X-Google-Smtp-Source: AGRyM1sGEP9IS4aUetkgrW5cPwURwUYGFTM9jMyAFxw9F86IEWrWl9NXn+BD46xMXN0gtp4uxfYclw==
X-Received: by 2002:a05:600c:4e04:b0:39c:66bc:46d2 with SMTP id b4-20020a05600c4e0400b0039c66bc46d2mr22594341wmq.71.1656358878796;
        Mon, 27 Jun 2022 12:41:18 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:41:18 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Heng Sia <jee.heng.sia@intel.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 02/16] dt-bindings: display: panel: allow ilitek,ili9341 in isolation
Date: Mon, 27 Jun 2022 20:39:50 +0100
Message-Id: <20220627194003.2395484-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627194003.2395484-1-mail@conchuod.ie>
References: <20220627194003.2395484-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_124122_598473_12B16AAE 
X-CRM114-Status: GOOD (  11.79  )
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

The dt-binding for the ilitek,ili9341 does not allow it to be used as a
compatible in isolation. This generates a warning for the Canaan kd233
devicetree:
arch/riscv/boot/dts/canaan/canaan_kd233.dtb: panel@0: compatible:0: 'ilitek,ili9341' is not one of ['st,sf-tc240t-9370-t']
        From schema: Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
arch/riscv/boot/dts/canaan/canaan_kd233.dtb: panel@0: compatible: ['ilitek,ili9341'] is too short
        From schema: Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
Allow ilitek,ili9341 to be selected in isolation.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/display/panel/ilitek,ili9341.yaml     | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
index 94ca92878434..c402bedaa37a 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -19,12 +19,14 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          # ili9341 240*320 Color on stm32f429-disco board
-          - st,sf-tc240t-9370-t
-          - adafruit,yx240qv29
-      - const: ilitek,ili9341
+    oneOf:
+      - items:
+          - const: ilitek,ili9341
+      - items:
+          - enum:
+              - st,sf-tc240t-9370-t
+              - adafruit,yx240qv29
+          - const: ilitek,ili9341
 
   reg: true
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
