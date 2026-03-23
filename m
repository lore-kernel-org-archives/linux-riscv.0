Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53663EC01B4
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 10:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MSLYsr3TZTBW7zJ4XLmkRJBtlVLUiVo2N4MBZ7j9ELI=; b=D4O7gu5VKGmU8F
	y18+XnBK5gIJ+FoSg3kB0jtpfEdovEy3CXLgFFvxFea4QlIze6hNpH7/3q0tExXyc0fVVGRJCSl7r
	4ihTsRNslxj9vH6I5ImQxC9QOmU1D9bpQQtmx+iyX+srp40K9GUj3dvrjiGRG+2OUxG6AbD3POpZr
	C10m0PKtvNFvCYtfrSAJfsYMekzMgmrlEcHipqQbZnXFmRXH7pFBjUW1Lc+UGRxbDUN7OXuY0iNDy
	ueKgUV3qZa0Gkkc4eF9fhBIFffhycMF9KHkOi+tRM6z2e6Dw4XfxjqBTTMMbp5o22f2QnhddrohqO
	9XGcpPJYspx+/gInSG6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cNr-0000000GU4v-2zQe;
	Mon, 23 Mar 2026 10:19:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cNn-0000000GU2s-1hLl
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 10:19:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-482f454be5bso46402745e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 03:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261178; x=1774865978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzM6tXzzJeFaZBA5QZ0/60M4eJdHh0h1cI1z3A71Evc=;
        b=kiqgbRmoFG8x6MX/xjkG4z8Uvf4vxLeo+vsFm7FjyydkGp9blXegI2Ul92sshC8b4g
         URtwqrM1kIvjbqr2MGBxQZsVZp8w3W7y7AvA6Uk4k2pFCXkBn8X49VrtO1IXSocP0bXj
         AgrSEPbP/NaNQkcQJ8JsCJq+8LZ2hiuXk6AyTarr0BYu6FJovpB6AdjTEHAxqcEvott/
         S+ULky0SPs9sKaAGRSzcTTF5jhmUpo3gwHbIGpGYdHNcQRpw2q/LQPb5+enF+lhiaq73
         UJ332KRrO2kkBmtXgd5uuwYnfk5ieqVgc/CMd3TENn4b4Bkvaac52zGeQnyAUFWMB5LN
         t/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261178; x=1774865978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LzM6tXzzJeFaZBA5QZ0/60M4eJdHh0h1cI1z3A71Evc=;
        b=kROKacRdi4CQd4Vv2anZZje5lO7LAgoQiiYM2gdLa9Kc7aC5tsJz9uSOYTyyths14X
         7rxejwd1z4RkXNEFux1096DESlkYC/gAY/n3woSIUiQ2qzvbUVHGaFJ2v224v3zJ8KOB
         /7aFNEqfnT8pn78yiMgJwwui7M75lgwWG9TBDdhN4HSLzLIw3eS4OrhBp+S3Cft/c98s
         eDba7WWbCGtr6sKnwE/IJeycJGMpk4zW92K0j+flqIrlx5XXbdoO+VnS81Ze7B5zHIGX
         oYao3WdC6OvFyLhAeXmkO8UvQsUz7+T2d+FLcuNej8A9BsZhzK+LZY14pI2C7tj1+XIN
         kHOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcAUdU7trVfd1Dim3Dl0Bl2m2vkynxl1hIs5r8QNo1vi7tyrtfqyPbTUhJeIJmcu6hToCeQ1y3Ramhog==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFgTQTOo9no9KujpcywkxqEU8k8v9oKTKF4zVrThsxAm09VAB/
	S8f8Txk8EYarkTgeFlkrgPRa1IWIQXQIXKq/hC9iYHH4upVUNrCQByFh
X-Gm-Gg: ATEYQzxgEPDYlNx52B6w6A7LChWT+jtv8TkFiZ4EWuxs+YqhqGGZl3gAD9fykyTi9k4
	VaP/5fYGNLOTxiz2ThsPCToDhJPTJ742EXBoBETnfdRA0epnSmuLo5m0PjRsQBRQz6jBm5bqu/+
	GmHx7OpaN5EPIrQeC+sPfxubYuUISmKWTR5Yg2GhCXLa0DUHudjgbIKNlYxphli+eIDxRejS2b5
	WBPJUAb37Fym2EYgofL9c/d/wVDTen1/H5+lTtG5rB7Ef9DB1tREtX/54LuOXM9Wwxh0pYZh55f
	8OquNWTJhcA6YZqNSC80JaOcZ5Nc/rAxhc+ZkTRxghVZM1VZosDsulZybCALAtO1DU4DsyyP1Gz
	1qHm5zAWVzjJxTw8/jdukYGuek7+GTk9CcjtdYgR+VpR1lw9wnGV7yUHHBRvxzInC1ct95GJ1Mw
	fe2W09y5Qr1eaImS4asfJOTZzUcnzzg4SfkVHzo1tqJnAeqFcuVgqcUPKn68JzcaxGqFhAT4Nkt
	i8=
X-Received: by 2002:a05:600c:1e0d:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-486fe8efb0amr191701715e9.13.1774261177699;
        Mon, 23 Mar 2026 03:19:37 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:37 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Mar 2026 11:19:08 +0100
Subject: [PATCH v4 5/8] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and
 power infrastructure
MIME-Version: 1.0
Message-Id: <20260323-orangepi-sd-card-uhs-v4-5-567c9775fd0e@gmail.com>
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_031940_040627_16432800 
X-CRM114-Status: UNSURE (   9.09  )
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

Add Spacemit P1 PMIC configuration and board power infrastructure for
voltage regulation support.

- Add board power regulators (12V input, 4V rail)
- Enable I2C8 for PMIC communication
- Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
- Set up regulator constraints for SD card operation

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..9c417a483f6bad6e60617cf8d5400ca079588726 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -19,6 +19,25 @@ aliases {
 		ethernet1 = &eth1;
 	};
 
+	reg_dc_in: dc-in-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
 	chosen {
 		stdout-path = "serial0";
 	};
@@ -92,3 +111,32 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
+
+		regulators {
+			buck4: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
