Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA7CC71157
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 21:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KKhWWQxnoCX53FNTDtWeQlDN4vQP/g79kEuGechcthE=; b=0FpVLFuO/vj5fn
	RM10CwMMxYdb7AjevW3hI80oP1WQv//HdH8sKGvUDbYk2S+FhvExUp/WI1uRIyC29EIb3sUuSAEzh
	RvPhKyhW/z2WxzN5cMdbbKWcDUeqA9SaP/tShthC9QYUXe4Us4HHGZ0T5HL6W5C7J6i1PjB3gm7MQ
	CEYAZ4MGy3fOx8QoVGWA94p1gB/Gg2zw6X/mkrcssnJEfCjp421sB1COLyXjP4TUChYi3ye/KF/Jk
	RRGlsbmOGFx8Ulm9Qn9cYIU3Kr14VPnNGvYahZZzh1CSsv5oq3j01plM010ksiaHyGLtFqpQ0RSbh
	vDkj+UXmhgJ1hsFbvLKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBaC-000000003wx-49pK;
	Fri, 13 Jun 2025 21:05:04 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBXH-000000003LY-3fMG
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 21:02:04 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3dc6f653152so10503675ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jun 2025 14:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749848523; x=1750453323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gD7pkEGUFZ2r04BWnG63uJj9JKyQG3lB1lEXTm5IZo=;
        b=m2YaSRLblkSof3cozYis9WX7LIY6qbIkHrE5Rd63xZDHVYhlfcpWzKzloVaVk+6ZFW
         jE8f5iKt2oQuxokLA/0mYbPxFZWP8FeK/MKCKXiI2eMwLeEMsu/auqzlu5CSac8+hcrg
         pFcDK7cAW/e3W6Uo3/SzorRy2qSAtCLqlsxT7JB1qmQK1ytkHhnw8mHWM9NSIO0NvUWd
         UDlOGs0/CubrFYXvDWksLbPb+b2AzHEDn/60nXr2sw+6erzvBtlkcHMME61Cx0ASJ72j
         ZLATLJYau3phdbIHyTOrof+ZszxKpHO8RqLEKJ/AFe9iyvV1jPw55xTLjcDh9Pg3rapH
         gmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848523; x=1750453323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gD7pkEGUFZ2r04BWnG63uJj9JKyQG3lB1lEXTm5IZo=;
        b=JTN+79bgDPsy0fnJAFdVa5tRsPDU4Rj9m6b6MpBr34QzK918ehES2WvklcjJWGH0rb
         uUBM+HvUE0m6b8aY/x+/FCk35ammIIdDRJNotLPV8CNSYNZEjal/5mNfVpJOgkn5hntN
         opC9O/xTDLiZfwjR2ixS4IMjBMZY7y6j66qUMLwhtTzP7yIsgr65FW3IDCEJNvwObfns
         2gzn+Zeqe+l04a4UmNxhI/JDrVm27STJgjLIRBM09RM719tG7yilzrXXnhYvoeiL1qm0
         ZA/82B95n8kpLnrgogaykH26VBljmQTQMBCHKFu1wl8yQJ/1V45/zQQHdv2LtSXA2bwE
         ZwUg==
X-Forwarded-Encrypted: i=1; AJvYcCUIfdCobgDGdd7forIJK1AT6IZoVeFZ1yMBOXlGeP41v282DjPF9TmJ/2bKYY2f/P7ojHJPfR9cL0Nuzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwL8LFgN4eSivTcTQGizo4n/BvbUXXgZiJQ+5+g8Hbvvm4Rnv79
	yLmFOhPsK9GMHI7vSgPbDGdsxe7kXBFQlHtZ7eSaWqvqRNlWHSBo7Cr3etlyob6nAE8=
X-Gm-Gg: ASbGncuP7k3z0pDl1LJYYUzxiYxVTrnNiaSY1xbR5bQKeS9Y3WrOWlL4vS4bNM6Zp65
	cEPQSamYvDmZzc8DHs71cg0SmFk3yGvcNWdnn+oBO5C5MxkvKWmuNqNaz5T7bHoUWZ06U16xx3E
	ffbdxPz2mMZtToRH0eNXGNDgnh6/+57IFvw4435cVXelkqCa6f3ArGDUqVezqhqPEJhUzbn5KIf
	hqjkPGKMmg59SNOBKQO/bhk+c+fCks//qVYW9zyyPl0CCmqoyrAESASiyUFFhySSoz/SizfytBx
	3ZlhVdX+8MlUrXfgjDqdJwXVOMdTTawXo2iilqhb/N7MF5JMGQg2zoeI0trWn/zsbQfIWWHZ3bS
	Jau6xr9ljPGc7RKXHA1U4OQ68ljhNhCM=
X-Google-Smtp-Source: AGHT+IHXDat6NE+msKniBMkBKXzQ5OntQfEKX4Deb7fPFCE8SSfiXNxgPbBb3SmZKFUe07JWv37/DA==
X-Received: by 2002:a05:6e02:194f:b0:3dd:ebb5:5370 with SMTP id e9e14a558f8ab-3de07d3404bmr14113915ab.22.1749848523112;
        Fri, 13 Jun 2025 14:02:03 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b44b3sm4996315ab.10.2025.06.13.14.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 14:02:02 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] riscv: dts: spacemit: define regulator constraints
Date: Fri, 13 Jun 2025 16:01:49 -0500
Message-ID: <20250613210150.1468845-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613210150.1468845-1-elder@riscstar.com>
References: <20250613210150.1468845-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_140203_908903_4E3BF9A4 
X-CRM114-Status: UNSURE (   7.64  )
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
index 8003c8173a2aa..0f9a7f7a6c8b6 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -60,7 +60,111 @@ pmic@41 {
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
