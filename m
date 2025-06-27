Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A76C83027
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 14:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=leVC3lNKq9GrI8x3a+o37IhB5PAqCXAD/IqVN6J4ZnI=; b=YHY4xzd31ZLZqE
	O4q/OLffaHsNPRKCBxXGoAR9J+syM3julOlzSLru7r+v+cPRtJQ2sG+0sLDKN/YLH8FmRBxd6jBXV
	xQfXxBWhMWB5CKAFimssCPzyfYdR+FWkXR3lvOMTBhfqj481MeRPUt6T/8WvbLF2pcrIt6E2U/HnQ
	dv8aB2UiIhA3ZclLLA/QPXNpcHdbgvQIteQZX3uu3VO+qAbJ+2W9wDZJDjo44mUYZeDoc74ceLWty
	6/uSoMuarkJN3wNORyQzxDJVQWukP02Yek11smRAK0gZW56040LILINhIryX7ErDRTEyLQ0Wk/2sf
	OzFCI4kbUhP6fene8uhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAWK-0000000EyhX-2U9o;
	Fri, 27 Jun 2025 14:57:40 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9zB-0000000Etyl-1853
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 14:23:26 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7d40874b399so209576085a.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jun 2025 07:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034204; x=1751639004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=nOVnNu0L8vSH8sSw8MtxzwleR8HKg9dyYgG4vaJ5CDppQLdaewnaESvlHVx3ExSV3w
         OZF6flBfq/xuhKO1ipcs1on4nDGO9lKV5Sg1Rlb4wFYXTLarV/OcuySehmxrvwY2No9E
         a8Anxde3R/OHkSSr8qrtzUAi8dldB95Aq8Y+rgErTTDQyOUp1rqOPm5NAgFaYjPluJKm
         uUK/h81dGQnY5JrNr10s9AZUoH3Bpv1vZmaWv7eRMPOfKYjwOtoTzBto0uc0xfdv0OOr
         mE7J2TqPVPG/ByddcQtfICX4lI0FpUrnCagUSdBxHb56a84OD90cWw03xFsFLAYpDD1C
         3C6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034204; x=1751639004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=s/WKQJXxG3fPxrf8cc6e/eSHJ5SjsoEWQVJKqJAscx7VpKSv1QNKJnqyRL1Bd3sldH
         l+USeRL7b1+NqSLl5PmpLvfvi+LXF446Pq3VDQHNvtdS91Ja7tV598CS2U4UwV/eTRbm
         vWWKJRQSyc1v5nndsVIfN/TXKuW7QDLd82xidrsLje5iFAPbIUk60nQG2FMB99fi/eJI
         InFML4TTRE0DCQBMnM20M6pqJqckRFFiW1rhjqUoFec8s7X268i9BL3MS2Vg9xe7/pVH
         k1xYdx+QngUnsZBUYBf5Ixhy7YCg30dvXNon9SRU/u2CgD78kEtzDPYraXqPB7Yi8Vtu
         RfBg==
X-Forwarded-Encrypted: i=1; AJvYcCW8RU+nj4VM1fokdbj726ljlCJzZcEjzlVqQINtvD2K5mEHBK7J/6F6Nv8byOXKe8z/HAbbcs2/OGe1ZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/PdrLBzgEMB0jU52fgpUWkPdWx++6xBQXIodB5WFgGvbm/38g
	xrn4Y8tkkFrGG9nmw4Gww5lORa3JcFStNN3hmIDuKh9fRrqJ2cF0ByJv0bDPYTZguhA=
X-Gm-Gg: ASbGncvO+B3jKSr5ada6BB1nKjkPqeVYBO3wfFNGFKDV9DxKRI0cVZbZjLbStsExbip
	LxcdOtVDqOLHb/pcaFq1TIzZqtKt3WEBM4OgrgTIgr1BWbV4/VsA87l+nc+VexOa1514VaOKKkL
	IqLlpcwrVg3lDeYsqtrSBd2oje+39cLiNS4H4u8VeR6graSffqqCt8gs9SvwXkRrQTNFLMZrs68
	iMhaYpAsj3yuA+Pf2j752NLCyHnRr4HmsqaO4ltz88sOtxilW7qc0RV9ymeewUjkKnO7xUtVR0y
	eVrFRtOKOOgWvQPI8vMfCf9M1bcmKXSWKZOG46tZyVvi70LUlBPpcwD5gQZPmIx+Xj03dbMyBCp
	SDKm9XjpB5zEx9Ip4FbrcoFmCj/MWM6GpB7gsLL8uzyHLAw==
X-Google-Smtp-Source: AGHT+IEOMLIfoVtqd+xrDcmHNR6PL3WFi16wi4PjfJ1dVACxbcBTOICTcDqGxxibtiWpz5q9BS7ImA==
X-Received: by 2002:a05:620a:288c:b0:7d4:3d40:4a with SMTP id af79cd13be357-7d4439b8e6fmr452165885a.51.1751034204384;
        Fri, 27 Jun 2025 07:23:24 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:24 -0700 (PDT)
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
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 8/8] riscv: dts: spacemit: define regulator constraints
Date: Fri, 27 Jun 2025 09:23:07 -0500
Message-ID: <20250627142309.1444135-9-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627142309.1444135-1-elder@riscstar.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_072325_300287_77A6E495 
X-CRM114-Status: UNSURE (   8.52  )
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
