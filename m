Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D88CD3439
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 16:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVvnk2wFw/7VbZRrKKWF1ZBQZ7vQi+euGO2NVgOsaXI=; b=2u6HymDtHj2XlZ
	c6xWU7x5VnTKxakWkIIj+42YlegAHNOZ7rePcwyBeKnmoJ5pmu7SLRon/OQgYnCs/3lwAyeECYo2f
	NtVDLVN9dez6m3XlWdFB2YtFJv97R78g27Lp7djVzyWt5ZWCLx+rqphqaYAel/6fe0V5HquoxT58s
	G9CCF1cT/PTERVGodAxL1ms5BYbz5l0banWr6XEo98wNkMf0MIcIoP5GrQhPKCgwvXNPTcj1ZxNwz
	gw5BemG+sZRPtI0QTgZENqcTrnma2aar1PlDPlLz9la52wmGWG1AHDVXlX5udYzRwRgXenNbd7fKW
	iVMs0X0fJlUVsA5wFnZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKII6-0000000GmJ0-2rP4;
	Tue, 05 May 2026 16:06:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKII3-0000000GmHU-2Me7
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 16:06:33 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-44e1860558fso1665481f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 May 2026 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997190; x=1778601990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJ541EuMVQQ1n/T8Bd5ppQrgaJbp2dn8HqZE862Y/v4=;
        b=CM9In8QtHZ+QJW/RAr+bKKyHROui7EzJf4WDPwqTl6DthsM+t77wgY0fnhVCfYFuOJ
         8dasvLUIq1kDYzR11HmZv/N0hMnR+jE5zDvf8LHS8tU42QpNwVm8t6DrSdIRAfru+JfB
         Y7hKtJPMIDY7WwMZMiQsFblIg1hfjaQmbIoF+QzQhf8D+h7EapJEapOd5EBLnug4RhUJ
         wA9d3kWJOvTHt1uKqtbNybZgUBzyZKsNjtBS2fKey/JuQzrZLIG61go9IQzuckwyiuy8
         JIIA5G0p7RPPsksPe69uM1LXzH0/QbEchSd2lDGpHI81WeIgy6talQc9dmgSnHQRnr+r
         Ta7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997190; x=1778601990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DJ541EuMVQQ1n/T8Bd5ppQrgaJbp2dn8HqZE862Y/v4=;
        b=IgmpLFtaZcoiFM0lfv7KbezskgoZ+WmHzYdiZ2jyZHYZcQ31+Yy+TthT2DsI4RxpjW
         z+dcifcOeQNE3jPR/9sVpBa9ZVxaXydrbgja8mG+cnZ1fSrji4s53ZTvK4t4DJCg0ryd
         eESdVPEK+G0/tePxfdmrv5wiVeS80aFBsIHNHOZoazdjEArW505/fDBYOwdJUmX7uhX4
         19avgMXTQJdL93L8dOjtr8TyKcJsc41zc7bcqcMtYflAUbuOLOO4uDME1iuCYjnXYqlb
         Q291TWt4uKRzdo03wEGYhhoT/w17qdfc1XYlA1OFUm+Mh3yZjVZm0gdr0wfauF+hvWy+
         eipw==
X-Forwarded-Encrypted: i=1; AFNElJ+oMEkJdVbegqCg7ne6QWcJTzmlV7Sgq1G97jOEZiKY+0g5HFKw4Ukx2q1vlB9JW06I53ljz9hnrmeWDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJbX8ShBervbmnyVLMcI5/nN+3l8e0bvJcV7nLlH/VGdDvZRAJ
	G8BP9c+tHxGujwnvSnWT4clzAZ2bQSRe3FWi2gkkzNhAHOoItR9cUrSH
X-Gm-Gg: AeBDieuaNpo5Itc+/5ZgDmdzeoRp7eqjDOn6KDbE2jQ2HUpScTaNVN9/ThQGOrmV0JA
	4k305twOhQaq4xTlSk03wHeyjCo2akJzSk3Dd/bupUI6qk49dW360+tXA+gGhWyoJctQMCwr5FJ
	7Rc4QTMg0tUob3//qYKbtX1EIAPucJP3Kgq2OwK1wM5TlvLVlVAf9qkMg9m7HkVoltlfindA4a0
	mAPutbfFMJ7nbVf+55jBGqnG/Sib6hdcVKvLU3hELkBH1i3LSmTFd0XlAPtM7UsLvWjvpPmaFFf
	uIO2YSXfMpK4/+rFFd1SRFqOZRWrxq7f7HYmaSyRSAk2vJ6RAoRgpai2wyi6dav0F/npcqTZdwJ
	nU/9huwVL8dkthiDvHGOheJMCTui7VnZQmX5mpuLksVcKHLzOjwlDnnWWNK5DOZ5kafcZAiqgly
	8+/y7AXGLGy0jExblqGOWdUqKaZsEsjz2ExBq0YScIcMllhAzjYfxIY5c8vuIq86HQ+RmIp+vfO
	0BeurI=
X-Received: by 2002:a05:6000:2088:b0:44a:b931:f32a with SMTP id ffacd0b85a97d-44bb586d065mr25568540f8f.27.1777997189628;
        Tue, 05 May 2026 09:06:29 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:29 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
Date: Tue,  5 May 2026 18:06:17 +0200
Message-ID: <20260505160623.1369347-4-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505160623.1369347-1-a.heider@gmail.com>
References: <20260505160623.1369347-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_090631_614775_0EC8601E 
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

Add the QSPI controller node and describe the attached SPI NOR flash
(Winbond W25Q64FWSSAQ).

Add a corresponding vendor flash partition layout.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 43 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 8bb85b5ba1943..32599082b3c36 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -166,7 +166,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4_3v3: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -249,6 +249,47 @@ dldo7 {
 	};
 };
 
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <26500000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		vcc-supply = <&buck4_3v3>; /* QSPI_VCC1833 */
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x10000>;
+			};
+			private@10000 {
+				reg = <0x10000 0x10000>;
+			};
+			fsbl@20000 {
+				reg = <0x20000 0x40000>;
+			};
+			env@60000 {
+				reg = <0x60000 0x10000>;
+			};
+			opensbi@70000 {
+				reg = <0x70000 0x30000>;
+			};
+			uboot@a00000 {
+				reg = <0xa0000 0x760000>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	pinctrl-names = "default";
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
