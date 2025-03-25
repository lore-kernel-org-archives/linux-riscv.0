Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED69C35FFC
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 14:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=brgbjnWk57GNdhuzEkzCerBxDAL+GjkybT1sgDxpAOA=; b=39DMJbXWw2Zfg3
	aYLVCFabyQzn4ygj3s66qBp4GdFajKMx+aj+VgDAmVOd4NLVltuWg5D/cIq7octYaatSKOPMsUzmH
	BjCFyr7k/iTmvmllr4nBagRP3PpBRoRvO8I+Mt56+XOYrY1GLfqFJlOqfy5YXjwxDZc0GAMVsM2ih
	y0ypNKHRw3vIjC6q6RhGVPg0Cc7iC6dhnfT4YiY6dN96NTd3KaIiBbwgg3efWBmErLjbAhkkYEPpe
	ttyKasi+V5o0ZGjvrtsx3BItw745X0KZvSdvI+RH/ETdwCDv5o/j/RyX4huycp0/bi1BWiS6JYSYU
	O2WGTkk/6MN6nW4CXPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx531-00000006AIg-2Ru1;
	Tue, 25 Mar 2025 14:14:31 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx51s-00000006AAS-0a57
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 14:13:21 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A8C893FE73
	for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 14:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742911998;
	bh=ruY4mx+ycuBPq+bKcBygbtDAkYa1zJT+mxxboy0e/q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=JSvOyZAFwiK1TO17Bmqawt5J6WLj+ESA6TLodVIFNqtdZD2Sl7PkBSnQEzb5KjHBL
	 sf3abF6lnrgTKG55dOLtDf5walwwLYfSKIKezZC5Xg414GnoC0mF7Zm3vE+4BcmJid
	 3GEm3KDTfxiaAzI0v3XdFRnEDtRwQiqCMbsvK2yJQia61CR7CXhjmgVK1Iz1sBLPN4
	 MVWctQuzkJ1FFLTc2HZkWm70V6uSq47qcy/zEpPx2t+NMkkyx+LV2Yo2BS1GStP3Lz
	 p0907vfpiO0iekTbI5dB1MdDyLh8cGrIcSNMZIm2YjlFNnqnmSrPLNYb/KXnrBRYhn
	 aCCPwiDoR/BmQ==
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3913d8d7c3eso2943146f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 07:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742911997; x=1743516797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ruY4mx+ycuBPq+bKcBygbtDAkYa1zJT+mxxboy0e/q8=;
        b=B3q1UwOK5hcrOamUVZQZgMg/v13w68UH0+PdiFAFERKu0qIKF0aNFTDJMvjuA0ekuP
         NuE3UepW7pYPEgC/wrZ2w6LSTEqFLrCbCMvAcWsmKJT7rX+ghlcvY5o87Z9pADzApxgS
         T1zSccrK6dpwiyDde8Io42+X+qM5g3q3T0b1QxWeFw0CNqjK9wqn/redSkpGmRkyYm0K
         KqVnYGyGuNldC651dwdsn8d36bK/Nq0JXpQkJUlfXBFWSDn/SZ6sO+wV2+WKxHN5Fk83
         jqUkFyMUHIVWm0XzeXjRTeOq8Agwwa9XHXsv2RpL8arOQrmdny5A9k/frFQdvkFqYQ3Y
         UeJw==
X-Forwarded-Encrypted: i=1; AJvYcCWRQLPIl1Jx5fhbYCq8xFeZKy4JghlxfiykGt7iUOhDkoezUCVg7yxCJxK40GgCPCst4R6OmutF6Ts9xA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx10LLbzgzA8SFGNhcaiwiRJoAGtMFOUnrNgmhChrlD8hoq/sRf
	Dj8EgWv2LKcvF/FEhS7M3KXefuMJNXyNYLzXyW1563QyKvAqrdOvnjiUeM2M+Wo1snxA0mxaNGm
	ESf+IT3nnOs9GiL8VjrNBCMhv63wIjVWhnvHm/TwayHkA0HP929TZNrmKldeea9ojKPtBWasyM0
	V7u2lrVw==
X-Gm-Gg: ASbGncujm6a5stFU49SQbmjgQbqAWx2/AociNNrzHSSJ67szcNYLafC2X+7cAA4l9Cx
	MKPi4p2UZYn/m0fcma1YusvrTx2edrtgLYs04/HpXHtXCoTyxzGxofSaIQfBCufm1otT4mD12V5
	UeQJz7H5d80WvYHjPSjnooakxcJEt06dE6OWlGtAZpwmDsGv7PfeumKxFQzLBlFpMjYG2OU3Kws
	02x/Z7oyDgoNeWTWATBWKUhvf9xFg+hvp7LZUPv7Uotw1trhig++n0zebhrUsJBoEyWC7FB2mkN
	jF0/6Y3b+EsQCtfrZ2S75MJn3KHfAw==
X-Received: by 2002:a05:6000:1a8d:b0:38f:2a32:abbb with SMTP id ffacd0b85a97d-3997f8f9d54mr13315757f8f.4.1742911997511;
        Tue, 25 Mar 2025 07:13:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIxyJ37OZghcxQ+a/pWrQYrdFkF1ltdT3GNn4+fygXg02/lhRChSV9UcnQAQLd+3Joudp+Ag==
X-Received: by 2002:a05:6000:1a8d:b0:38f:2a32:abbb with SMTP id ffacd0b85a97d-3997f8f9d54mr13315703f8f.4.1742911997011;
        Tue, 25 Mar 2025 07:13:17 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13532091f8f.29.2025.03.25.07.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 07:13:16 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 3/4] riscv: dts: Add EIC7700 pin controller node
Date: Tue, 25 Mar 2025 15:13:05 +0100
Message-ID: <20250325141311.758787-4-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
References: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_071320_436277_6C500425 
X-CRM114-Status: GOOD (  10.21  )
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

Add node for the pin controller on the ESWIN EIC7700 SoC and gpio-ranges
properties mapping GPIOs to pins.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/boot/dts/eswin/eic7700.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index 9cef940f07e4..7226647919b7 100644
--- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -312,6 +312,13 @@ porta: gpio-port@0 {
 					<324>, <325>, <326>, <327>, <328>, <329>, <330>,
 					<331>, <332>, <333>, <334>;
 				gpio-controller;
+				gpio-ranges = <&pinctrl  0 12  1>,
+					      <&pinctrl  1 14 12>,
+					      <&pinctrl 13  1  4>,
+					      <&pinctrl 17 32  1>,
+					      <&pinctrl 18 40  5>,
+					      <&pinctrl 23 51  7>,
+					      <&pinctrl 30 68  2>;
 				ngpios = <32>;
 				#gpio-cells = <2>;
 			};
@@ -320,6 +327,9 @@ portb: gpio-port@1 {
 				compatible = "snps,dw-apb-gpio-port";
 				reg = <1>;
 				gpio-controller;
+				gpio-ranges = <&pinctrl  0 70  3>,
+					      <&pinctrl  3 79  7>,
+					      <&pinctrl 10 89 22>;
 				ngpios = <32>;
 				#gpio-cells = <2>;
 			};
@@ -328,6 +338,7 @@ portc: gpio-port@2 {
 				compatible = "snps,dw-apb-gpio-port";
 				reg = <2>;
 				gpio-controller;
+				gpio-ranges = <&pinctrl 0 111 32>;
 				ngpios = <32>;
 				#gpio-cells = <2>;
 			};
@@ -336,9 +347,15 @@ portd: gpio-port@3 {
 				compatible = "snps,dw-apb-gpio-port";
 				reg = <3>;
 				gpio-controller;
+				gpio-ranges = <&pinctrl 0 143 16>;
 				ngpios = <16>;
 				#gpio-cells = <2>;
 			};
 		};
+
+		pinctrl: pinctrl@51600080 {
+			compatible = "eswin,eic7700-pinctrl";
+			reg = <0x0 0x51600080 0x0 0xff80>;
+		};
 	};
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
