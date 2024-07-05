Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314ADC30658
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 13:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tl146BVs4E1Q29AtXPtG2rNCpcso/3k3OFaXN9Rxzjg=; b=1SE7fQAbRz2CWN
	XeeWCkCw4Ec9Pz7dUYfbtZ62yghAepSsetRIg2EvafTV64OqAt3qEd+ZN1BGtiqOQbNwBeu+6USIp
	h2iKC39InarX2dYjD8SSb/uuOeadnMTrjnkYakFKDztx+mA0dRXoGQjxBhew7ty2AtrqkuNP+ZPJb
	K8GnfoLULP7Nm3OGUX19/u5mGJDAm6iZglwLSncGJ0Uw5k3IZRIT9rdq24fLCFcmU/9hRzu+V14hS
	YApBVzFLZLU9XB3GwXR6p6YG4+c4gImV6JaA+c9guqApjIJ4oOzbXzUmm7zR4YwjWVs8srBQQZSiZ
	YzIV35LhNNvKu9UrqIHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPjD0-0000000G5n2-22hR;
	Fri, 05 Jul 2024 13:42:42 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPjCv-0000000G5jo-0Y9u
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 13:42:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DCD6240007;
	Fri,  5 Jul 2024 13:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720186953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9hUs3AjldaPNd5g+4FRGeGWP8GUZ22OX94EKEBMYwyY=;
	b=muw90pSEWZSWnblkVz/gg/x8PI/GcoRx6QeUa/OD5umHK0FNeEL0hZsq3qKV3oA0Rmzh8v
	k8vNhdJbrymeh508A89nKxUbytN0E0nwibE+ualXZtedYSXStP0jfxciDF0c5bXIWzGshu
	4QqjbN3Y9g4A26wAvlMtDmYR25ZcbMVlH+j4PnfacPT7PIbgcY6Nyym+CoiB5dPJ7MGGFT
	z89HnEW6zDWT7//lyyMSwptODE0w/aUz1g6ZLunSaKux0z6cRpxx/EGIyRsXLBMn7ypzhr
	4fkqUz0YDUClNzT5pry/435Ke4DYl6pXIbKNm81W/Ez/yDLqXY+iN8IOtcsYTA==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Fri, 05 Jul 2024 15:42:25 +0200
Subject: [PATCH v2 3/3] riscv: dts: sophgo: Add SARADC configuration
MIME-Version: 1.0
Message-Id: <20240705-sg2002-adc-v2-3-83428c20a9b2@bootlin.com>
References: <20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com>
In-Reply-To: <20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@outlook.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_064237_691369_8E9BEEA6 
X-CRM114-Status: UNSURE (   9.39  )
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

Adds SARADC nodes for the common Successive Approximation Analog to
Digital Converter used in Sophgo CV18xx series SoC.
This patch adds two nodes for the two controllers the board, one in
the Active domain and the other in the No-Die domain.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi |  8 ++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi  | 14 ++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index ec9530972ae2..73abbb6e5363 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -25,3 +25,11 @@ &clint {
 &clk {
 	compatible = "sophgo,cv1800-clk";
 };
+
+&saradc_active {
+	compatible = "sophgo,cv1800b-saradc", "sophgo,cv18xx-saradc";
+};
+
+&saradc_nodie {
+	compatible = "sophgo,cv1800b-saradc", "sophgo,cv18xx-saradc";
+};
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 891932ae470f..752e14fa3d0c 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -133,6 +133,14 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		saradc_active: adc@30f0000 {
+			compatible = "sophgo,cv18xx-saradc";
+			clocks = <&clk CLK_SARADC>;
+			interrupts = <100 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x030F0000 0x1000>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@4000000 {
 			compatible = "snps,designware-i2c";
 			reg = <0x04000000 0x10000>;
@@ -297,6 +305,12 @@ sdhci0: mmc@4310000 {
 			status = "disabled";
 		};
 
+		saradc_nodie: adc@502c000 {
+			compatible = "sophgo,cv18xx-saradc";
+			reg = <0x0502C000 0x1000>;
+			status = "disabled";
+		};
+
 		plic: interrupt-controller@70000000 {
 			reg = <0x70000000 0x4000000>;
 			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
