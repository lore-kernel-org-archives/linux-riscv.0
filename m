Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B51ECD13DA
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 05:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iuyndb0dNPc5E0U/lWhTDp/QsV0Zr3l92NYWw5GLRME=; b=jylSifoKn5wEYh
	uX/LI/Uc0jevvifL8YhY6zIhBVLBOWs8JPanDqeg3o2ePZ88CYBtryTLda+Pwa4X7J+jboz6jteaF
	w6iJrDduJgU+efhdngyvHRR+EW/mzlzkLiGW+bw1BhsbNL40AW2lnW1RyS40AFSQAkCA3ZTXnHS1e
	ug6sDl59BWHlG52XjzkjkUHPsKRPjT2OaTz7IrCi3OJfnmnY18r5maRnmcYIMweQu6MWdB/YQsGYf
	XMUMpjqyQKW26kC/yyZKLrtGlBhlskSuA6WKEEuQ2XxpFx9W2pLhowQDyGPf9lCCY95Qz4H3ILMLF
	IgMhoSBq3dcwwi6KqiGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ2lK-00000008KqG-2Hol;
	Sat, 02 May 2026 05:19:34 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ2lI-00000008Kpa-3nQp
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 05:19:33 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-82fb2d0c5d1so2328481b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 May 2026 22:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777699172; x=1778303972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjH11zgHDCyhbF50r0nTJm8SjfZvEtgEk3MpR/mQFEY=;
        b=NnXmmbY5hRi6X5CKiZcQLZxcIgv/hRPQYhVHACZE+ZCRDQ76hM6j3sfWY3j1gOR+ca
         F0Rnh4HlA2UP03u7r+eRVHB6V9FywouJmEY7BqgHe7YJfhAQDpG9U9TGcF3RpWlkdTuo
         55j3wVUO67zo4VBOp55ufxP1mL3bMhGTHdVEcO7SKp5M8GzXIDfQikI0TGLp0XuLwpME
         qj08Io7F1a0Pod3KgHzWfaGpV6nrrvPnMzEx4du+fU01BkPR4bNhRd5k5NieQEPPkD3K
         2DCIpOg6TMIorlMKNNmReY+EKTzb9gv/o0FaiE+p8WgDWYG+Sx5cIEFsRpsIOY5E4bBX
         ahyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777699172; x=1778303972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GjH11zgHDCyhbF50r0nTJm8SjfZvEtgEk3MpR/mQFEY=;
        b=l0Zj4pt0zihK2JHFcwYaEgw0UwUvyRE+urnHJfWvIFZqstpDVMAraibFr38W8fVDA0
         9arnGXrOEUTXEWYGpfjET80/S6O/gD8D73AmC587NKV+6EJOt6sjHJLAB32gn/93nUZe
         yCxizj9XzIrXMVMmZFwruBAehWzFzww9v4JxSl44YbBbGweVrvUXSs76ZNXhMhEZBqsR
         FkgXbdnZHbVjplqLybZ/6BqAFPGWCpOrXluLashqOfvN6sXBhAZSbpCsnMESMTZgLaJ5
         5owJNMcQGlDannPh0WpIP5vP+o14Tsl8aRnjMY9vfNGoRSSx/07l3M+JCwUcjxJ67XMB
         HHlw==
X-Forwarded-Encrypted: i=1; AFNElJ8j3BLpY/0Dzht/HpTsf+ntv6EXVXcEdZPUzKjifjdy4ZRE5jSKOkVnDdMXKZocNqbh6MRgs6Fs612NdA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq7pI3LiqCdgjAR/T4SEojS1q/R8i4jrJi8Luc3q5dmSzmfOX2
	tHbXUamifbfgREupvgvZezkXWVJqtlwmc6p3+2D8vE+X4YvJjIPnlCkA
X-Gm-Gg: AeBDievvAWsc+Sh4pZWeyDM3hkM3kCElez+IHXqMylcQMEYEDm1/5jDnh5JJefhpKXd
	4Iw6KovPDqHGkZDFfHGVmtlVXixeWWV6nhlpNRGp+gbrZX3wZsh+gXPznwusdBdlaV2cxsNVOrR
	096KVc7vrQsxjrgwk+QvGfC+5UghJQUAt4oGEpWVS++KCxV+qFzjkwQTr1aW/OYqJHzbVYV4yFf
	ohGF47O8yjW51ocoDTn9+x3CzZNJne/A03eaOH83HouFr595W9PAWi/9+rQMS9/8HdpRYwNGo40
	t5fMd0yrjllI18ttBlnl2pAQejjXwvXbcCa2zpCAKAxxGyIKCttuhXTeyP3e12JTdbojQBnJNXb
	Baa2DaWVQKruDhHo7LthqJHov0rWyI2Bv37juKtNe7s4J9AncEJ8rQyp7c6l4+TWf1iKQQZz1Me
	9EAzMMQ9W6Hvb0CXKIge6Ac6p4aGAlliqgJAqEHjSg
X-Received: by 2002:a05:6a20:be07:b0:3a3:128f:1c77 with SMTP id adf61e73a8af0-3a7f016aedbmr1363896637.12.1777699172056;
        Fri, 01 May 2026 22:19:32 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b4f7c1sm4224838b3a.51.2026.05.01.22.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 22:19:31 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/4] riscv: dts: spacemit: k1-bananapi-f3: Update USB regulator on onboard usb and label
Date: Sat,  2 May 2026 10:48:55 +0530
Message-ID: <20260502051906.8160-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260502051906.8160-1-linux.amoon@gmail.com>
References: <20260502051906.8160-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_221932_946979_D5ABC732 
X-CRM114-Status: GOOD (  12.55  )
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
Cc: Han Gao <gaohan@iscas.ac.cn>, Chukun Pan <amadeus@jmu.edu.cn>, Ze Huang <huang.ze@linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Update the USB regulator labels to align with the board schematics and
power hierarchy. This change renames the regulator to reg_5v_vbus and
its name to 5V_VBUS. Additionally, it fixes the vdd-supply references
for both the USB 2.0 and 3.0 hub nodes to ensure they correctly point
to the 5V_VBUS input source as per the board schematics.

Cc: Han Gao <gaohan@iscas.ac.cn>
Cc: Ze Huang <huang.ze@linux.dev>
Cc: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 9727ecdd9f6b..c35f4763c800 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -70,9 +70,9 @@ reg_vcc_4v: regulator-vcc-4v {
 		vin-supply = <&reg_dc_in>;
 	};
 
-	regulator-usb3-vbus-5v {
+	reg_5v_vbus: regulator-usb3-vbus-5v {
 		compatible = "regulator-fixed";
-		regulator-name = "USB30_VBUS";
+		regulator-name = "5V_VBUS";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
@@ -366,7 +366,7 @@ &usb_dwc3 {
 	hub_2_0: hub@1 {
 		compatible = "usb2109,2817";
 		reg = <0x1>;
-		vdd-supply = <&usb3_hub_5v>;
+		vdd-supply = <&reg_5v_vbus>;
 		peer-hub = <&hub_3_0>;
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
@@ -374,7 +374,7 @@ hub_2_0: hub@1 {
 	hub_3_0: hub@2 {
 		compatible = "usb2109,817";
 		reg = <0x2>;
-		vdd-supply = <&usb3_hub_5v>;
+		vdd-supply = <&reg_5v_vbus>;
 		peer-hub = <&hub_2_0>;
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
