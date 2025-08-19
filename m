Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8877ECA0EFB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DwTLFBjxK3Pa3GygEwhm1MrpkOjSViuHDKYMU3M/Ti0=; b=w0HGNbNpMGDOCb
	i8kDfbn4rFeOjO1wmlZXkqvV22AMyr5x1XHsBgQFHYavvbFXVLEROxznyEa5lt2O1HLviK3vaZmBf
	jYlDkRHNp4HzAHw3jywHxphkWKGWc9KzDINpvK/bcHAoqUOip2vcBeORL5Xww0g9uHajnuTlne+7G
	RWNzLW1yxH79YK4Ws2c34ngzWPsPfSOpPswN59HzNgk6uHezEvol41erozs45yGndAgfqdBdq+/Ct
	sY20KCZ6TGfqPGBr++X9gtw29aiPgPaBkrkwWcOvGr8TsPMuBwRdNhMTJzG6Fbpsoc+Tt2iHtQkl4
	0878b2/SnY52Dt3qmJrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpZ-0000000BC2G-2KrY;
	Tue, 19 Aug 2025 18:13:09 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMBy-0000000AYt2-1dEQ
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 13:16:00 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-afcb7ab87ffso83168666b.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Aug 2025 06:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609356; x=1756214156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OE5+Il4drYFb68+K9H3WTtaiI5C7tn33MG/1x7pFl90=;
        b=PNrV94Osum/fKB7Zp0qVJ7MWVfwBeKfyQQ9QGfj2fWzYzCukhz3P3xzeOniU/Dr4ix
         TvLkOVwtZrEmTv0ZAhViBoqZBoUBMmnmBFSXlcDrp3YPp0kFnDK+09l8yf9BhPB73sge
         Mu7+CnXYtQWgYooSNFqkrYpk9/qaSGPMNAZ8GdT7siWmdCRuzBiRffe+FRfBQufWl2HU
         UuydW2Per/aJWeBY9p2Kg4WtbAYU3M+Hg19AiAAkVKzYJ4eBDwwiAPi74tLgKznZr/MH
         1pUOv8hfkxroiB4X1dI4KROIEsYwCVBUvNx3eng8NfwlFiIvRD6miQDU5+UY08JMNxoq
         Crhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609356; x=1756214156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OE5+Il4drYFb68+K9H3WTtaiI5C7tn33MG/1x7pFl90=;
        b=ZiY9J761mbgeAD0Uubp+UCFlf2hLzANFCp88Pj5QGCqJEA+ABszJHEkmGvknbu+puJ
         050wtWJBxfBk6KsVzz2sqEXlix4JsILE89Pguu/dwA4wFK6bNHeuc87vDPFFcqcunLVK
         g7kCQ5I3T6pVxmuhSPf53fL6mODqG1oG395IunF9HJPgcEVgZX1SX9hQCe1Z8Yzu7YZH
         oalSkN3Orwa0REUjocIvK9VlFT6VOJ3gSpVPyy1jJnP/AENIeNWlPnW+RCn1RtI455tZ
         eN5NcpSr/pgnYC4aa5RgLTWbQh0PU+IejvWLMu+P/2DI3briJ7oRcH53CzWkWqP063mS
         A1ow==
X-Forwarded-Encrypted: i=1; AJvYcCX3EhgJB/+CsvVMhSx3K0dVsdjDjfYXpkIniQO+J94CFYTonCwvhqzGxG71eUV64L6Sn0AtjxDuxHoUNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAeTGtqte98/rOybLVRNIlstFWrKj5b56H4cjAxVM4zCxTGVy4
	bO+8hEAj4frp/nwKjWAKu9S/IcXduJWEQW7pfKoYSA8LroE1mo+VUeUn5hih39k1wS8=
X-Gm-Gg: ASbGncuZN8uzJbj3jFFq8mU2HHkk96kLx+Nl3q/mWRYLx3/8a+l8mm4GKqEpFA49/mX
	0xywmRO/AV9gJ6RRUfFE6SlnL4B8A2JLxXvxA3lY5leSy0Vyi8dA7KFqKoI767QNOoUYbc6vWiE
	8EFUmvYkluK+Vun/8GmVlN1uvNUlk1tS8sW0JaPZaESATtQJfo0zT+fASrynxWD75JtBPsEqL6K
	hQ4lyISpRg/Lf9USuPEsHSOeaNew5FSoLCag67riAT3K1ouoRQj53+RK8+23LOW3sqRtvsS18w6
	I694em7OPgqryBj3P/7XXSiXXEWoRRwgUMZqYDrYQp1OFhRgVKeokpEXeZExUF1R9QZaEW3/4Ng
	uxKrcxgcao6Yh76tsDRwH8h4Dee+8bnqXkA==
X-Google-Smtp-Source: AGHT+IG4KTbZO8LcfQ30OvU9YlImtjjMx+/FQDo5HoX0RNFAy7RBraEUBzYhhrqCR+YvCl3Qva33qA==
X-Received: by 2002:a17:906:d54f:b0:afc:d540:add4 with SMTP id a640c23a62f3a-afddd241018mr115990366b.8.1755609356407;
        Tue, 19 Aug 2025 06:15:56 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a755f8a61sm1771773a12.14.2025.08.19.06.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:15:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] riscv: dts: microchip: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:15:50 +0200
Message-ID: <20250819131549.86279-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=951; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=hcciJ3JEjRJw2/6qsmBCQwKrAUZmXoESCyk80czkwi0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHkFB6KWZYNHKcB/PWHff8odXyHWo1X4hTKT+
 9yX28P0HP6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5BQAKCRDBN2bmhouD
 1w0ZD/0ZhRotOVRHIIlha+Ddf7VVmjL9AqsBqtw35BBCtjM/J1lBtJbZov664WjaD89YEJAqIm7
 1nDJAcrW8zyKPuGFZPkhgk7fS1W+e1lQys7mCiUHbT9gZaoEhhZ8QlRQTPEzmAOqjIZyRMqJKZj
 zJUKN69xKV5plTt0PSYoXZI5YXg6enLdYWu4WvAyMS4iCPw+zZQpbs47FE2iDS7i1GvfZVMb7iy
 1tFoY5YP76Z9gMnO6LnvES1ZXStyK3brSgpkaxwO/SxP2IrqHcV6yaOSh436BnnMAORn7YlRIMo
 Ooqq5rbcO8usuNli+NgYBu3Zn3Fmz5GlqQUPUG2ejNWG54mqlP8/GVW8zTb29LKa3uZtXOf2xlt
 3EmbX+6XTCeZNL4zvsMM915xv1yhREHodM1i8ibl+l/t9LOi71YIUIZ2zIxwOrkc0ak/4r+kiJo
 zQRRK03U9PBEGv/HGZeI+7AFB5A1DdLlU2MXm9EwJVvJ/JrtEdM/H+ngytiWEIDHe6/rP40QCzF
 v3lv+9QXttsQQlvkorfdMiX0KU2E8rlVufMAnnogVPd3T8ejG6jeEg/dhVJ+f8dYwvyq7eAcjvI
 8cFyAivH7Il/3SZGHOjGoJcRUnx+ByqzqHPIe3PI83XPdO7jKLerwGME6rnkniKa0oeUL8inC6Z Jjnz9NU7AfP7VyA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061558_436709_84396EC9 
X-CRM114-Status: UNSURE (   9.28  )
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

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
index 47cf693beb68..55e30f3636df 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
@@ -88,7 +88,7 @@ &gpio2 {
 		     <53>, <53>, <53>, <53>,
 		     <53>, <53>, <53>, <53>,
 		     <53>, <53>, <53>, <53>;
-	ngpios=<32>;
+	ngpios = <32>;
 	gpio-line-names = "P8_PIN3_USER_LED_0", "P8_PIN4_USER_LED_1", "P8_PIN5_USER_LED_2",
 			  "P8_PIN6_USER_LED_3", "P8_PIN7_USER_LED_4", "P8_PIN8_USER_LED_5",
 			  "P8_PIN9_USER_LED_6", "P8_PIN10_USER_LED_7", "P8_PIN11_USER_LED_8",
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
