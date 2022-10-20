Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC0EC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 08:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2ud2+Jpvr6cUtG0EvIBiNYcgeek/Soqd/kfnn/6fWH8=; b=0o7juelR9yc3bd
	TOxGvJduH0QiTQRodv7Ml7ujINNOq1wA2dbFghZVx+2f38vbJhPTIedzLhpSKviz2Ev1tDNKOWpr4
	AwmqD7oKGfrZTbrQMd/2rgU7D9CxZZ9pBGSUSE6HA0bbFPh6MtKaTaI8l/f2n59+w9dplx7pu/Oz3
	K5i0/neX0rh5YXdsCIvo2/PcZkzLb80p+VeJlKCcpbn/V8qBUquyQ1EtcWeyyl7U6mgtzlE2ZtYhD
	3jbs5/ZaunyZfEVQ8bNwWH+qYYBrCB0mbquCsIEO6NVihqGi1xNANna8fACFIve+fYs7zA6xk4bO+
	R+ZyszJrK27YOV4nJrqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olR57-00CKZA-PB; Thu, 20 Oct 2022 08:39:13 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olR53-00CKST-77
	for linux-riscv@lists.infradead.org; Thu, 20 Oct 2022 08:39:11 +0000
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B33D33F56D
	for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 08:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1666255140;
	bh=1Kfa+smO/072OiY7RMhUCYjDWimk98jjl4qxZmAFPfQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=dQRRkbnWKwOJVQ0bBhtzjYQrILzTob8Ovv5DRwsLGUsnW5ty8hISJ3E109mhF08m1
	 JAuifnKpnRMGZ1Wzyhf6NlscPjBuY8nvvSHCaLgxMeIgSmAOdpKahTp088d798epFj
	 rvl85FPFLwXvb9BwxECIrXFCutJqxc/TmFeey+blGWjZO7o0Kgu22mbeMXcO33EsF5
	 8HuQvaR1FZ5BNcrb7BV2v0eMYEONAZYjkXUa+CbMgoYiz7hZQJaF54Zs5tRlgDPoq6
	 NWzeGm4O/n7bP6VlaPbQhwB4Aaxm44wyb8RSuXLUWx+8iqeBjarc1wchZMPpGW2IqL
	 9cLz3hY2YOIoA==
Received: by mail-qk1-f197.google.com with SMTP id bq17-20020a05620a469100b006eeb0bbe02bso16636626qkb.5
        for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 01:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Kfa+smO/072OiY7RMhUCYjDWimk98jjl4qxZmAFPfQ=;
        b=2nGeKffj1knQTh2EeOYWOM7TlKTqO5mCWn04X3bMQ/XHcZGAKudt/nvM+IbEKd61Ml
         FvU07S5FiQy1E0agexIeb07F3i7Z8wmFjzeTp4fhaiTTq4ghE5X0PA0RLMalN/XMmd0L
         hPAlrtpuzEBPRX/D9UsKLWzkIKk7ZGulUbapml46lsFmQszLP7PiW8ukcY8u7YRKN1kh
         BkSAMDTpjmtQuP0RIf8q/K/rWGS/v0Uo5ZEcnYaARzWfxgdPFyYcHktaWKS8thEGNfPv
         7c4uNQwlwWQuT9lqwnxZS81J7SSh+AWEyHnWqyCfJnD+ZDna3meh/kVhlUAnxhlHteX+
         ja/w==
X-Gm-Message-State: ACrzQf32rygxB4R5WAs48JbZ1iVWrg+Q0OMpuWjj3K2TnHzHNyAm6Ixg
	xoy91oaiP4BOmpaVP1myzVBhzxijo8rsTxL8lFBHH8qrFms4+hgfPO68Yw5CVSgKqzqjhKrTdMM
	4MsIo7gBR/6QYEsUZC7YEr12ZEk1jgzRf+4OuDVPrTQneEA==
X-Received: by 2002:a05:622a:14d4:b0:39c:fe54:1cc6 with SMTP id u20-20020a05622a14d400b0039cfe541cc6mr5290230qtx.88.1666255139056;
        Thu, 20 Oct 2022 01:38:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5yISX1K+NROiNXKggPZO0oyltRGu4SNeg/ZNORfA01oA/O6xEKKposra24ZeKHoPZE0T7Caw==
X-Received: by 2002:a05:622a:14d4:b0:39c:fe54:1cc6 with SMTP id u20-20020a05622a14d400b0039cfe541cc6mr5290217qtx.88.1666255138842;
        Thu, 20 Oct 2022 01:38:58 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id h14-20020ac8568e000000b0039913d588fbsm5733905qta.48.2022.10.20.01.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 01:38:58 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] riscv: dts: icicle: Add GPIO controlled LEDs
Date: Thu, 20 Oct 2022 10:38:54 +0200
Message-Id: <20221020083854.1127643-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_013909_633162_CD561574 
X-CRM114-Status: GOOD (  11.26  )
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

This adds the 4 GPIO controlled LEDs to the Microchip PolarFire-SoC
Icicle Kit device tree. The schematic doesn't specify any special
function for the LEDs, so they're added here without any default
triggers and named led1, led2, led3 and led4 just like in the schematic.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../boot/dts/microchip/mpfs-icicle-kit.dts    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index ec7b7c2a3ce2..11ba4417f11a 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -5,6 +5,8 @@
 
 #include "mpfs.dtsi"
 #include "mpfs-icicle-kit-fabric.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 /* Clock frequency (in Hz) of the rtcclk */
 #define RTCCLK_FREQ		1000000
@@ -31,6 +33,34 @@ cpus {
 		timebase-frequency = <RTCCLK_FREQ>;
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led-1 {
+			gpios = <&gpio2 16 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+			label = "led1";
+		};
+
+		led-2 {
+			gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+			label = "led2";
+		};
+
+		led-3 {
+			gpios = <&gpio2 18 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_AMBER>;
+			label = "led3";
+		};
+
+		led-4 {
+			gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_AMBER>;
+			label = "led4";
+		};
+	};
+
 	ddrc_cache_lo: memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x40000000>;
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
