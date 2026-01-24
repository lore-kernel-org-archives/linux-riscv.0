Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7740D6CFB9
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 04:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FIeRId0GIhoVXEEEtN4H0B6KwmR5b+Dr5X+HXugTs0Q=; b=ode6mDOFeF+ELV
	DiUehqQc4XCopRzWmoZqut4lKlfTdFeMpcsFwidCYqZSrTemiUF7PMeAKHHQHXLWa8Rgr2vDWqG5R
	5uVu5a4wXWjtJylMLdotXDK1+qW5bhyZRrLx9+exmc2XPaEIVvfKQwtwGXsB+I5g1ETY6GrPDmBTC
	P3nls6xKchz8JmLRCXmMe/p8pxpeWXLh4yTV0Lfa3UvQxAe9rCkP14PLDsRvl60d3Lw9sIwG42ODT
	l87QEHoDkoNXx6S/08E4sqRuylnFB7aPQyihLRLHXu6pDS5dlS08JnTsn+fnLDtsodvsbqsyV6A+7
	IK2djd7v/NLamNIGTwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjVHc-00000009zAc-0W7N;
	Sat, 24 Jan 2026 04:30:00 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjVHa-00000009zA8-1WxT
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 04:29:59 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-352f00d0e83so1287637a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jan 2026 20:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769228997; x=1769833797; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kHUxJVDnOE3Q1iGBfN9Iw/8AeCEWqX6h3aa/GV7h/g=;
        b=QFqNFajB1pZoK7JQyjPDXGmefk2X5spSQ0wq3hSKRgsgHEztV7mzxTWdUI/p3eKL7B
         nHGSx5Ttox5PxHo3YiwEwtE9bPNow6fuGZMPGOaZlh61zhPhzFBLr9a+wnPstghO7JrC
         clJjrLmSdh1ZRXhxAfxQXG+OiSlx1mQ40sqvsOKadHvEXKlUtbfWBZK93AXudN9+f1I6
         1UUkA4JcmrCUtq/t2NPBuZniFlrEdgWwLP6hai4PR9dogxwTf/vUqITPtWf78YW68Hz6
         iGSpU5+ShakPj9gwkOwLDKMf4GxJi/C5qXC9xyf8kLb9GVHn9VkBA+LGth2IqABbRQmi
         NiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769228997; x=1769833797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9kHUxJVDnOE3Q1iGBfN9Iw/8AeCEWqX6h3aa/GV7h/g=;
        b=a3wRt92Xzba9CFdUc0CMVNyow9mf8aCMMEfZcZF/4kiqYeQX36a4lZ3p6zOAdzt//H
         I1n8/P3eSterRE8HsxqR3BCLYEJ+ReebXaHt8VdOkn7+XWX3Firtg8tYHLMsezNOLa9C
         x8viWguPLV+4Nxxh9SWfXQxLehJq5S6Erji9hLpxwQXHmDaAIZotLgO6Rz6uekBK2Svm
         YBH0xiQKIk9diAQHkftvELU6ZrGhP2U5Qe7sixeRlVwntcYbByf5ttwahvbTVzdPcOIX
         B1c9T9XJ8HqvK60F9O+vkjYTc25RTCTEZp4BDjAPBsYlz0DKN+bOH4ybZ1m27IP1L32K
         qKuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyI1LhntfbhDrAhymX2c1ybZmLn20vYg51pBMUmrcOULoy6Kot30eOrFkkVIE9gYz2GZ2Qustf9lXe3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlFYUwfMZBl13TR1YnG7rty73cMGBD9DVrwqSvfKZHg+oKYBHe
	VqN4nwGMijA69R8OKb882WwHdfhxP5J4xD5irhNZ18ySlSvIcur9UEtDz4Eaorg3LUw=
X-Gm-Gg: AZuq6aIjDbJv1tQMyxlpd3NWW2oacMuNDuv2fH226Y98MJhEXMI4qS6v/uLrqQmWx27
	p7xp/SG5pQJp13WOLOUqR4jFrBHoLXN/JJ1Q0QW9pOW7a3XMOA9DPiQ7HRL8erxwl+ug9l0/0zh
	J0K2lh0MhNFJHVg2ibeq05VwMO8TCFAGmTeLD4LE8635gdZjlsIMOIdCAHI9le9Ae33PNO19RZy
	KbsKAG6EJtKTybxh/aa0edTcF3rf4S3CpJ2Z+OaUuta43Ih24NK+OpwhPKIrIwyjB0Gu70BxuXI
	xVu6Rv+lYH/b8xwk9aHZTRg1BQFF5DtXfFQ9trWMPrw46Q9hR6umFKK7pnmTLpIKyvM+y6BtuWu
	SzDfQXS3g5250u/roKk4K+cC51e+DD76aIpqPz+k6tfeBmwYAbWQJAYJRrz4JQbx9Yz4uCAWpCX
	Gnf6UugKxreHfupJVDgqH7yXTTVhmZg60=
X-Received: by 2002:a17:90b:4c4b:b0:341:3ea2:b625 with SMTP id 98e67ed59e1d1-353670285a6mr4633408a91.12.1769228997559;
        Fri, 23 Jan 2026 20:29:57 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231871d51esm3469423b3a.38.2026.01.23.20.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 20:29:57 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 24 Jan 2026 08:20:19 +0800
Subject: [PATCH v2 4/4] riscv: dts: spacemit: Update PMIC supply properties
 for BPI-F3 and Jupiter
MIME-Version: 1.0
Message-Id: <20260124-spacemit-p1-v2-4-2c86b06694ba@riscstar.com>
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
In-Reply-To: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_202958_417724_E1AEEF4B 
X-CRM114-Status: UNSURE (   9.79  )
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

Update individual supply properties in pmic "spacemit,p1" node to specify
the board's power tree topology for BananaPi F3 and Milk-V Jupiter.

Previously these relationships were hardcoded in the driver; now they
are explicitly defined in the devicetree per the updated binding
document spacemit,p1.yaml.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Added the pmic supply properties for K1 Milkv Jupiter.
    Updated the commit message accordingly.
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 12 ++++++++++--
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 12 ++++++++++--
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5971605754b3..444c3b1e6f44 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -190,7 +190,15 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
-		vin-supply = <&reg_vcc_4v>;
+		vin1-supply = <&reg_vcc_4v>;
+		vin2-supply = <&reg_vcc_4v>;
+		vin3-supply = <&reg_vcc_4v>;
+		vin4-supply = <&reg_vcc_4v>;
+		vin5-supply = <&reg_vcc_4v>;
+		vin6-supply = <&reg_vcc_4v>;
+		aldoin-supply = <&reg_vcc_4v>;
+		dldoin1-supply = <&buck5>;
+		dldoin2-supply = <&buck5>;
 
 		regulators {
 			buck1 {
@@ -221,7 +229,7 @@ buck4 {
 				regulator-always-on;
 			};
 
-			buck5 {
+			buck5: buck5 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3450000>;
 				regulator-ramp-delay = <5000>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 800a112d5d70..e2702a781734 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -100,7 +100,15 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
-		vin-supply = <&reg_vcc_4v>;
+		vin1-supply = <&reg_vcc_4v>;
+		vin2-supply = <&reg_vcc_4v>;
+		vin3-supply = <&reg_vcc_4v>;
+		vin4-supply = <&reg_vcc_4v>;
+		vin5-supply = <&reg_vcc_4v>;
+		vin6-supply = <&reg_vcc_4v>;
+		aldoin-supply = <&reg_vcc_4v>;
+		dldoin1-supply = <&buck5>;
+		dldoin2-supply = <&buck5>;
 
 		regulators {
 			buck1 {
@@ -131,7 +139,7 @@ buck4 {
 				regulator-always-on;
 			};
 
-			buck5 {
+			buck5: buck5 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3450000>;
 				regulator-ramp-delay = <5000>;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
