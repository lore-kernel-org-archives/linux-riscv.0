Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23BFC41513
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 12:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXDHXEpaXCHjHB9GPCvGBFHjcZaSp9C8fpILor4/Jc4=; b=3XRlIErtjLuU9e
	b3cWUdo2rWKpDhBQrLy3y4I7VQ4wuz+qBGAFyH0xoQ9JkVKxEbu+IiBeX9833sRNa2kmVRyawNzYv
	qPX6O8pxssVL4qmuSWRM2VLCIbIsznYY1pmoPCKHJUIMaZ//jkZjoyuBwzDUGUVg7XqfXzmJZJM8F
	41eH5dLJXM7XgzK7L23YIRD5/aQK2zYHTewVQ30wzND0igow3n/tn+JtHqZD3rXiRgw4nd3MPza1k
	5XRjHCJGE13dHMqRB07yzl/v1dEaJKOc0eC2ROrviO++uU9Z38RclBXAmfDpKbxUjrUUf7eCmD9iK
	Zs34Ud9uUU8JCye23pcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLnK-00000008HaO-2Cz8;
	Mon, 15 Apr 2024 12:50:46 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLnF-00000008HUo-23yN
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 12:50:44 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5ED423F188
	for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 12:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713185438;
	bh=/+lz4gvRbuYKUPO9p5AcEAQ4a8bxIR1nS1c0YAZAbpc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Qi62ZbHX3jEmBBki5sgQCmjCJ0CpzUeM1/KajapOmfDC8HByZgiz646btqOHsRlny
	 m4KruAuL13iB35qHJmLCXauo9KoAk/KkdieCH566sXO/3EdhVmwlEI61IceIddpJ0L
	 +ZLVJXDflUFrVdXbAAVnQJewoDIvwm9w9vrldq4VJHc2BeMGJVGSG+Ug5gaCF0jJHC
	 ZJ6RfYvabgYIFWM4/Z1n1n5803b3jEcDpK7hZLm/pJU60XB3MeW5mW3E1MUbdFGJ5Y
	 5e/MqJ0yj1IKQ6ebp1Y4WAyNNk09JOnuRVmOoAqKh9Wz/d69j6tgcXgEcm+po/gx+o
	 SSTd2zgIjZ0Gg==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a46938e24dbso53768666b.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 05:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185438; x=1713790238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+lz4gvRbuYKUPO9p5AcEAQ4a8bxIR1nS1c0YAZAbpc=;
        b=hmf5B3dtJPpqeYrSTVYW5iX7PQ/DqZj5oDsDRglgKbeVUY5eREEtXvgHT2DLeERaG0
         OVt4sE8u4JBzFBZBbKDFqy7ELgupIuLJ23QkgkO/GX43KEhlMohR1HMUHRlJpPHozUtK
         4aBRacPkTToR5yuHgclIJgi7xVXxS7FsndJtzIXQUJE3QO02ggoZP5YQUYPepcgCcqgh
         7ShyWGi7kWSOiNUqFaInZnpnX16jOHalJJcjUR/pvkI4cAQtaTKS1W9fe6U+RIsLYb2E
         vxn/nE5iCtpVc30ciRkqB26JNWGXoFWqcp2SrIKoI9KCXtSYCxesnebfb8LTM8casfaJ
         wPCA==
X-Gm-Message-State: AOJu0YwFacGjpjZwRrTw2FWSx8/qPHsHCqYaQvpVuF8ok4wyejcVaF20
	1NfehUaOBSkkAPzYZ/SCcqbVmrSz9ceRWekPVwWUXo7HCLbiwjYxc/KEgyEsf8+SPq8isM/+XJm
	2i5TMoysSo/Gqi1VmguHQ8uaiP0KSUs4kz33pBWzloYTsw8enHtXLlVvN0S4xXtg3ssUmATG+KH
	KFWSA1Bz3Z4Y4GEA==
X-Received: by 2002:a17:906:6d0e:b0:a52:561c:ca87 with SMTP id m14-20020a1709066d0e00b00a52561cca87mr2392071ejr.1.1713185437888;
        Mon, 15 Apr 2024 05:50:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZfcd/TjRul4GHXkO5qH5k2zYzb1Tgdzi4hxLh3ejZJdiWBUESLY7cEG1prI/RLPSXTbTpRg==
X-Received: by 2002:a17:906:6d0e:b0:a52:561c:ca87 with SMTP id m14-20020a1709066d0e00b00a52561cca87mr2392062ejr.1.1713185437542;
        Mon, 15 Apr 2024 05:50:37 -0700 (PDT)
Received: from bojack.fritz.box (197-53-142-46.pool.kielnet.net. [46.142.53.197])
        by smtp.gmail.com with ESMTPSA id bz2-20020a1709070aa200b00a51a9eccf2asm5455573ejc.125.2024.04.15.05.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:50:36 -0700 (PDT)
From: Hannah Peuckmann <hannah.peuckmann@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Subject: [PATCH v1 2/2] riscv: dts: starfive: visionfive 2: Remove non-existing I2S hardware
Date: Mon, 15 Apr 2024 14:50:33 +0200
Message-Id: <20240415125033.86909-3-hannah.peuckmann@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415125033.86909-1-hannah.peuckmann@canonical.com>
References: <20240415125033.86909-1-hannah.peuckmann@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_055041_993250_7C471FBA 
X-CRM114-Status: GOOD (  11.56  )
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

This partially reverts
commit 92cfc35838b2 ("riscv: dts: starfive: Add the nodes and pins of I2Srx/I2Stx0/I2Stx1")

This added device tree nodes for I2S hardware that is not actually on the
VisionFive 2 board, but connected on the 40pin header. Many different extension
boards could be added on those pins, so this should be handled by overlays
instead.
This also conflicts with the TDM node which also attempts to grab GPIO 44:

  starfive-jh7110-sys-pinctrl 13040000.pinctrl: pin GPIO44 already requested by 10090000.tdm; cannot claim for 120c0000.i2s

Fixes: 92cfc35838b2 ("riscv: dts: starfive: Add the nodes and pins of I2Srx/I2Stx0/I2Stx1")
Signed-off-by: Hannah Peuckmann <hannah.peuckmann@canonical.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         | 58 -------------------
 1 file changed, 58 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index d89eef6e2633..2b3e952513e4 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -279,24 +279,6 @@ &i2c6 {
 	status = "okay";
 };
 
-&i2srx {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2srx_pins>;
-	status = "okay";
-};
-
-&i2stx0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mclk_ext_pins>;
-	status = "okay";
-};
-
-&i2stx1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2stx1_pins>;
-	status = "okay";
-};
-
 &mmc0 {
 	max-frequency = <100000000>;
 	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
@@ -447,46 +429,6 @@ GPOEN_SYS_I2C6_DATA,
 		};
 	};
 
-	i2srx_pins: i2srx-0 {
-		clk-sd-pins {
-			pinmux = <GPIOMUX(38, GPOUT_LOW,
-					      GPOEN_DISABLE,
-					      GPI_SYS_I2SRX_BCLK)>,
-				 <GPIOMUX(63, GPOUT_LOW,
-					      GPOEN_DISABLE,
-					      GPI_SYS_I2SRX_LRCK)>,
-				 <GPIOMUX(38, GPOUT_LOW,
-					      GPOEN_DISABLE,
-					      GPI_SYS_I2STX1_BCLK)>,
-				 <GPIOMUX(63, GPOUT_LOW,
-					      GPOEN_DISABLE,
-					      GPI_SYS_I2STX1_LRCK)>,
-				 <GPIOMUX(61, GPOUT_LOW,
-					      GPOEN_DISABLE,
-					      GPI_SYS_I2SRX_SDIN0)>;
-			input-enable;
-		};
-	};
-
-	i2stx1_pins: i2stx1-0 {
-		sd-pins {
-			pinmux = <GPIOMUX(44, GPOUT_SYS_I2STX1_SDO0,
-					      GPOEN_ENABLE,
-					      GPI_NONE)>;
-			bias-disable;
-			input-disable;
-		};
-	};
-
-	mclk_ext_pins: mclk-ext-0 {
-		mclk-ext-pins {
-			pinmux = <GPIOMUX(4, GPOUT_LOW,
-					     GPOEN_DISABLE,
-					     GPI_SYS_MCLK_EXT)>;
-			input-enable;
-		};
-	};
-
 	mmc0_pins: mmc0-0 {
 		 rst-pins {
 			pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
