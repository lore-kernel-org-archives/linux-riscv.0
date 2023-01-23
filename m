Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C46C38142
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MFAQ26ptid69ggYxziFtY0TzFxThAws9pJtDPjfuQik=; b=YHEOerlKUJIyOz
	b4iaef6TekM30/jarCrUDjIbuGn1Vw/j5FVUiCUojRidBWzSz57wQWLgS4/deMFy8LmaeZjSLSPCL
	yWxecJ5mbeYpubS8qUFEp87DzTFdbR+i3DrnKHmBsH4GBsnH3krmI/Ym24e5MS3v+H7gJxAL5EtCi
	Tlx/TWFbITF8UD2bqsqKyLY8zt6hqqQIJaPLlY6PHh52C0b38aZbohJwEDofPkdmy9zwNZJmrtLAM
	Q+meOplHp6aPwoiXFKmUwwpR7Z7qB5EGYrG+5NXivaHYzv4Lvw2nsVCswfGQJAAJuO+ERfBfYAO5P
	7dyWuBH7UdYL4Rh7eLdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyZE-0007G4-FB; Mon, 23 Jan 2023 15:17:04 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyVi-0005Sw-Jo
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 15:13:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so10846706wma.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 07:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbA6lJheuFk/8xFTT1ePhHPMDBY/JK/4xrBmt+OOi4U=;
        b=zKwo3e+7uOyJGADkS3SvY4tG/YcyQsjz83Hw5I13CEburg4Q5MNhT/O9mXFaHC1VHm
         NHpBnUzfLRasM5hHsboJ8qg0tjtusxjgkgU3z7WRakchQU+RDTPBJnRDSdlQige5MWjK
         n04J6T7rlTs3x9+hGTcOrAiMVD24XhCyrC8pae432g0HFZcOudET18IAy6qyEVL5YFKe
         tiWwsiNjm+uFGz47RWjXDJJuk1CSEYl4taTXz6UiG6pRB6Loe9dj7kV0N8md6ZyI+0ft
         Plr0jHIhb9I72XwyXwCtNsowVRCU61bWwloIL2WLm69gsGTF/KCt+exSO/oKQmjopXf0
         1F2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbA6lJheuFk/8xFTT1ePhHPMDBY/JK/4xrBmt+OOi4U=;
        b=Wc1WM7j7CtjBngPHZryoPtOOJRtDP9f6uV9rtqWicFcQSbS9giBPLs+OJnI/si6/vz
         FgnFVSGUD+suRoOhGeR520kaxDPulzMzDSPVpXtBaJwGTR8qfzOiyP0wwEI4AWXU6pVk
         6w4yxVR9LWTwH93kAFWPqxGO4sL5k90uNb3ClZ/tjkSbF2Okq8bpjXQOpjErcPtW3ACe
         eRDJ/4jj3GxTsIiPH0zLMZ0xePXfx34qGTJSdqDGju40WJetC3kkix+R2VKzY6Tci9t0
         jZHUmG5FDThUzQZ9TPhHa8BwPP84G/0ivFyA4pSnNUjH4YvU24++gDZlNod8eSI9QdkQ
         T2UA==
X-Gm-Message-State: AFqh2kotXvnkuGv8sq3CfHrJw0ZE2EX6gEa4utjZX5+bQ3rY/KObx5FF
	HeqYiz81X7Agt+gGr4edeYwkXw==
X-Google-Smtp-Source: AMrXdXszs6a9DYNOLInJHWRaCXLtQ/W1X0idHVCXTCQ9XdHt03vNRQ/V7BA7UrJDU9EYj7btHPSV3A==
X-Received: by 2002:a05:600c:181a:b0:3d2:2043:9cbf with SMTP id n26-20020a05600c181a00b003d220439cbfmr24384116wmp.10.1674486802800;
        Mon, 23 Jan 2023 07:13:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:13:22 -0800 (PST)
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
Subject: [PATCH 06/13] dt-bindings: serial: 8250_omap: drop rs485 properties
Date: Mon, 23 Jan 2023 16:12:55 +0100
Message-Id: <20230123151302.368277-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_071326_686007_2E56F174 
X-CRM114-Status: UNSURE (   8.53  )
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

The binding references rs485 schema, so there is no need to list its
properties.  Simplify a bit by removing unneeded entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/8250_omap.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250_omap.yaml b/Documentation/devicetree/bindings/serial/8250_omap.yaml
index 53dc1212ad2e..7db8e5477b03 100644
--- a/Documentation/devicetree/bindings/serial/8250_omap.yaml
+++ b/Documentation/devicetree/bindings/serial/8250_omap.yaml
@@ -70,11 +70,6 @@ properties:
   dsr-gpios: true
   rng-gpios: true
   dcd-gpios: true
-  rs485-rts-delay: true
-  rs485-rts-active-low: true
-  rs485-rx-during-tx: true
-  rs485-rts-active-high: true
-  linux,rs485-enabled-at-boot-time: true
   rts-gpio: true
   power-domains: true
   clock-frequency: true
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
