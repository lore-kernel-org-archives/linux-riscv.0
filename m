Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAE8C87FC5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 20:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jYMruVjrGpbj3m2Nh3dB83CSkNHjt1nJ/8DZqtzgrLA=; b=CTNLKNceICyV8f
	gmj+dawpDupiT4r87j9syc8+r0P5oKQyH5RsIIx8oNFCGpsenDKMEAU9hFA/JbLZvbBxmOmiRZpQi
	NkLaS71m+Z+OdufYBrIHV9XkQ5vpfssN+MyJeflGTqAarBlco87V0QLB5b8hF9Fs8gYPyFB4W+ZcV
	0fqK96uK8d4d7hqqoMwTyXXNtgbaVFbiitVzaVChS26o9F5iKFJ66RPMIn+1QgDcoCSIvGhOA+BY7
	rVsRwZZ1/3aMSQKIfrT+mELrLCcOf4wdDCoGpwvnj/CNjY1PJfsjFR2/eMhv9H4eQI5RsmkGNvqL9
	5Vne2LmskwUOYOuHlt7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2VR-00000008NyR-2qzg;
	Thu, 24 Jul 2025 20:25:33 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2VP-00000008NxG-3orI
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 20:25:33 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-879c7464843so30258739f.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 13:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388731; x=1753993531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEiPn0cbVvyWonyoHzSQ1laMwOj6/PCdxE3K2rEb90M=;
        b=OZmiEiI6t44ZR9v7nCcv763f/jX+yj1kbaArGtflBRsE8CuTQSR1wZut1Lw/CaKKLx
         eCyD2Z11ZCnWU1o3MFPfFL77mPNQysYTsY5BJVDSaBl6CPbE3v/WfO/NyxNTPyiQdl3d
         onP93ElBWzYZNXz5rmx7QZ8dCfp1GBBcleeV1WAX9XmvMDkRJ/KhLsPe2/qS/OKo4/wx
         H8OZjW9TZP6Of/fqMSXB2K5zA+t6Vlqu1qIT9UYVKeXT0JgPc3wyQi9qHDtcWS7PUQe/
         LEt4YKCglYMUnhcqDt11Q6sy76PtUUurflxn7uISGiVhJaVzzB5GAoBe4Ou98GoRTVYO
         HQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388731; x=1753993531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEiPn0cbVvyWonyoHzSQ1laMwOj6/PCdxE3K2rEb90M=;
        b=faJr0k2yriCZrGdHKX4d1uUp1UiYzahS0HmyBvmMW3ML9Zc8jFZ5oa11kidhP1LIfL
         eme+U66ZutbqexeCCh7SDWV8JNOq1MkQHlsne3vg2YumykZlBudBOCHD+ZDtHLKUrDlf
         3P7BzWyUy64diKwBSIyToDwbue0zVfPMKKja87IAehpgPQsLigGmxMNTop61gyceqyue
         7TjalWh7DAcTf01zcRvYv86fwyy6AED0MgrQXokpnSnXCueEn4y2tOqFsKoqJNaTpUgL
         VP9a15UqbP48Sjz/DczyGjeFjjDdq5qg9NR4rnxwXGtFIeVUDuvVn6ePfXH/vS8qutVh
         u+7g==
X-Forwarded-Encrypted: i=1; AJvYcCXQ7MtsOmRZg9rf2DTs7PNDkGxEnJkl5Z3urpsLtE61roDyEn96YAdpZl7GdqGYe6UjfCK/hvqH/cCMrg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+nf73Q2dQmoTyBc7MqEhK7F0tu6vcHefxBs1TNElLOMkH88VO
	p8Y8gXQiHTRoYC4epZNd17b1ny5WcsMQbCVple2fqzg6YBLN+8Nu0N3RJvCFz+txYlU=
X-Gm-Gg: ASbGnct840EfGLn3HXHIh7wsQVKauvfZwGpFOrktRMTZeIGfjJ2vYIIXB1jMFc4malx
	gM2b8gqWJtyLfvTgfDzJdAvqSUn5NHXejEXWXlv4eJA+ty22b2vwHTWZBiI3Goz5i8KaWSoLq8A
	nBfdrwbXX2vA/OrGB8TAQDNmK4WQhtMH6+/PnGt4xZxTwDLgJ5korajNmgn4aNEC0sdpMcaR3nn
	TSyv4iy0FZ2tSEvT1YLWW5q8h6U3pBnKLdAZIh175rCCkS+X43KCgt5hoe2o1I3bRl0xuK/cfb2
	B5B/y3d6vJCftql+1cZKVtLcRMZ/FL6Ui8wUrNYOiRrW0WN4gj3mBm9394shFQK70LSVJ2irYbn
	UPA2uwjsPL8SCeki45SVddwJO0Mc8NZaK7WbVFwAv
X-Google-Smtp-Source: AGHT+IEOCPJEmS++a59jxbnEfzm6BGBxv4jrcgvVSaZ5cgZIE4C2TYD/gzvOZX8xyz7qYVEph48/fQ==
X-Received: by 2002:a05:6602:3421:b0:87c:4496:329d with SMTP id ca18e2360f4ac-87c64f64aafmr1508845939f.5.1753388730846;
        Thu, 24 Jul 2025 13:25:30 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:30 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 8/8] riscv: dts: spacemit: define regulator constraints
Date: Thu, 24 Jul 2025 15:25:09 -0500
Message-ID: <20250724202511.499288-9-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724202511.499288-1-elder@riscstar.com>
References: <20250724202511.499288-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_132531_952886_A11D8DF2 
X-CRM114-Status: UNSURE (   8.03  )
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

Define basic constraints for the regulators in the SpacemiT P1 PMIC,
as implemented in the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index a1c184b814262..83907cc1d5ccf 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -70,7 +70,111 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
 		status = "okay";
+
+		regulators {
+			buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
 	};
 };
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
