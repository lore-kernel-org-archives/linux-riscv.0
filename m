Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83728C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 21:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kt9iBkVl5A+QymG7ZkaZ59El3T7AeiapgUWqQABjRZ8=; b=LeADdc6FKCbDHC
	PcrAWNi4aStYvmo1obDVgAHGkdRiVSI6U0f+pphUR+kOsYbYogOKJQvD59lt9SGTwNZcKeBz7cJdd
	yLGtSaQGgF6zyWX6EALCNEYH3FGYVFHSJTeao6+xGPE8B0JhiWs62VV19u7DoFWTIONmlzDRefRu2
	8gigUsmMYgXYhliX/nqAU8z01elpVpP3QFy5/q0n7x0+ObTtPoiTcThGsX7VFsxGAnvtwIjCBfeBf
	Ttn7I878kNQ8w2z65H8N6lC1JAUzL6jyx3NB3ygN4GX99etkqH/UPiUYuuI9WWYtZHHhRAmsfgR5C
	IWm7pEApgqxgBIAhVpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEyOH-008TWE-37;
	Sun, 17 Dec 2023 21:09:37 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEyO9-008TQ8-1k;
	Sun, 17 Dec 2023 21:09:31 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50e1d61b657so2768693e87.0;
        Sun, 17 Dec 2023 13:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702847368; x=1703452168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEmC8yzpg0VqIzMb5nxgOtA5V+BfOBifdcCXQ6xHVfo=;
        b=ACFbfqh0aWOXam72tqth0AgEP19xR0xXjVYzKEfDgDcx07byJGySAgv3WsDJkhKBRu
         8VGPeUx0WCm980jgODYBBD82BU7B7HU7KS8xr2m0hJ/erU7RPT7FAfsysHRXTTvL8B4Z
         62581YqYbnVflrAVwXD7Sql6e2dcsLxm3Hn4lpPoy5V8C+6jPANp+feNNwaSqYN09nB+
         ++kjvf9JEXEl+fVZEHRwTLPMQtMpuJ7aViTlmoyDAcmnkKQ4P0i/e5669vDnl84ggVg5
         A/VuIlMzzrIT7yoXaPxdEnVLT5tc/cM6xPxfrRTA3Agv67Ad+bpMRuBoQEnMEXvItgpn
         N1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702847368; x=1703452168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEmC8yzpg0VqIzMb5nxgOtA5V+BfOBifdcCXQ6xHVfo=;
        b=FFxga0Zg57qQ975ZyoSmVRyPPRxfcc7altul6LW0eHtiL/Um0RUgd6NKAGYt2a0MEW
         IZ9+bOMAqhfFeJcUVRNLt463+JWCgib5ac/ICr9f+arH5F+KUwN/bj2RMGIwJ3VIXerm
         RkXHyvGejRZMSuzckFduGZuIl/WmpX0WA9a9PvVP+FeGhg1hhEO+3EnW43B45xC8GpyP
         2meMbLqnx4Vc30iSqh9fRvi7KEg19gas4gsCHz1Gp8Ir3v6QdDBfuoptoVUrs9jRojzb
         JQ/3annDZfkbpKhuTX3LNFXioPPhZgIfx3j7KHHU2XrJbZl9EwmBQchI9LImdYomN5Jb
         AEqA==
X-Gm-Message-State: AOJu0YxltqSnXYyCXLLGmY2W1SuChY6EX6Cip5LVUwZTQgQgHeX5C7rQ
	nfgex3iCVfiyVUcNfC8aHWclBZjoFgSxBA==
X-Google-Smtp-Source: AGHT+IEmHz+jRu9UqOYO0LhhslWbwSbg09nII/aLGLXumsvPqPzNtDYWNyrCPwroyrvzHYdz6tqJSQ==
X-Received: by 2002:ac2:4c15:0:b0:50e:3b2a:a7ed with SMTP id t21-20020ac24c15000000b0050e3b2aa7edmr29915lfq.16.1702847367506;
        Sun, 17 Dec 2023 13:09:27 -0800 (PST)
Received: from wpc.yadro.com (188-169-139-214.dsl.utg.ge. [188.169.139.214])
        by smtp.gmail.com with ESMTPSA id vc11-20020a170907d08b00b00a1ce58e9fc7sm13316096ejc.64.2023.12.17.13.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 13:09:27 -0800 (PST)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: 
Subject: [PATCH v6 3/3] riscv: dts: allwinner: d1: Add thermal sensor
Date: Mon, 18 Dec 2023 00:06:24 +0300
Message-Id: <20231217210629.131486-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231217210629.131486-1-bigunclemax@gmail.com>
References: <20231217210629.131486-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_130929_588387_04ABF1EE 
X-CRM114-Status: UNSURE (   9.18  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Zhang Rui <rui.zhang@intel.com>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-pm@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Maxim Kiselev <bigunclemax@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Maxim Kiselev <bigunclemax@gmail.com>

This patch adds a thermal sensor controller node for the D1/T113s.
Also it adds a THS calibration data cell to efuse node.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 5a9d7f5a75b4..6f5427d9cfbf 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -166,6 +166,19 @@ gpadc: adc@2009000 {
 			#io-channel-cells = <1>;
 		};
 
+		ths: thermal-sensor@2009400 {
+			compatible = "allwinner,sun20i-d1-ths";
+			reg = <0x02009400 0x400>;
+			interrupts = <SOC_PERIPHERAL_IRQ(58) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_THS>;
+			clock-names = "bus";
+			resets = <&ccu RST_BUS_THS>;
+			nvmem-cells = <&ths_calibration>;
+			nvmem-cell-names = "calibration";
+			status = "disabled";
+			#thermal-sensor-cells = <0>;
+		};
+
 		dmic: dmic@2031000 {
 			compatible = "allwinner,sun20i-d1-dmic",
 				     "allwinner,sun50i-h6-dmic";
@@ -415,6 +428,10 @@ sid: efuse@3006000 {
 			reg = <0x3006000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			ths_calibration: thermal-sensor-calibration@14 {
+				reg = <0x14 0x4>;
+			};
 		};
 
 		crypto: crypto@3040000 {
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
