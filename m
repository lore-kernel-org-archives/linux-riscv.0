Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7DAC71148
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 21:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2LVTiCe8R4z1A9YDJoRCtokM0+bxqOhSJHB23/wSoi8=; b=rhRHuF4p9PxBuz
	+i50NYHs9ChhWiEnPwbE1vwXGFf3Fge/Y/v0dYzeC3RD3ridX8KmrKb+EwTFpAhoNXngSpO5OEgWc
	v1B0fsYWY6YPpriq0Nse0i5/RCYsUIYylMuOBkADbVkVutvu55x+q5SY/YyiHU+rISmkk2leOm10n
	pjpF7kJ/fK0+qRzjQwoL/40girBg0LqAQcFZrHrk+RC8YItIst2cWLz3FtpqfGpYpL/iOIwQyrunp
	pHSLoklNwUR/3pbiNFlavtMPX3mj7c5HZ40ALirkgnU/61u0WOWzD/qfeLtlm1DYCo80Xvy9/vCfk
	Mhe6sW02ChtQiIcWLLKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBaC-000000003wJ-1YfF;
	Fri, 13 Jun 2025 21:05:04 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBXG-000000003Ku-1fhK
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 21:02:03 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3de00ea2a57so10459785ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jun 2025 14:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749848521; x=1750453321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWQTiP7h7eL+v8/SbkMciwBHxZWg6y7ToncXXww7MfI=;
        b=Z3h2SZY/x4oA6AkYLho1lTzdZkJSss6sa+7UwRg8OSSRZjy1+WEh0WNfsy54Jdu0Gw
         eWGxNpCC8R+qbLWTUNmFTGk2Bcgidm2GcIhgg1jBI2CdIs0ujOGQck4/ml9ythg2bSn5
         TxN23hfaj8StBmnVaX7D9WrKwEK7EHcqCRIyOMg8CenSMA+g9cyYliOpujEOs40J7zKF
         cTCohMs7+nNLNzfIntzHoKzh9qCopGq1aIUkIi8+cRKykkL0uRdrgcpyNL8dRtmN0dGq
         vO1As6qsvWeYh1DbzA8ob7DhvNtmx2nLddPkgJglqIVY1bMpDdsDgTsrvInPP7/2c017
         SXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848521; x=1750453321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWQTiP7h7eL+v8/SbkMciwBHxZWg6y7ToncXXww7MfI=;
        b=Oj6r/FXiMdzK4fWreKCTsKnmC4ojnLTc6N6XNsUYzAlJprgod3hsdDwf7ftnC5AY3j
         FOXs93bQeMRDD0R0ifQTwg71kVpSwq7qlJ/fzI1ovyag1FR9g2LqZDRVRcC4PsYl2a0w
         Se5lYIqJDdp39/pA693tphlf9mubDKIEDLuC/98x9S+bFkT8MWYXvJLCF+DasKlU0U0Z
         UZXnnk6j+l1QqfpbgxAFuVqJ+/C0u63Lkehf8G7sF8wb/LlWNHDBqx9ms9Pg2hho8CBZ
         1iYyrdoqn75IAUVr81XWOlzsPOLA4raV/gxwCDd345GZkibqs4HChuq/scFpisk0fx4k
         xkpw==
X-Forwarded-Encrypted: i=1; AJvYcCWdtT1TmTg9GeRlaUjzpN53NOTULN52M7pBC4qtr3S+/h0LpXACVpyMFrhUnd8BNMEd/tDC6AfFx3uOeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+9N0JubxWHcz8sXf8e8a574ZsHJBhiZZx5Uf5uWY5Ouh5vA+1
	5ykbsN7XG5rJMojJ+/2y/Y+XCM7XqB0BbNm2pf2a7jhkLbj3U7mVRjTd8KbVhuXX1Vc=
X-Gm-Gg: ASbGncs5pHf4nfuPCQi1Om73idEAytn/qe7jdliLVx0Wk8KXAXxyN9trMvSyJcxdlOD
	30TANay1XSfGocuco8kbYAUZOCjeGvmwBL/G9b+49KPuCgZ5ci0b6F6Ey4pxU+IELiYG4ioNVmP
	ftutdbGKi7W9VQIzG4sNSO0JFaABmnrnazmxQVo4EZ6u6NXBHhS2EERxbJRZL3Ioxwx0egt9V4p
	cQueDQIjsXYMHQV7D+91os5WHsnLUzpvSL4o6lDv5wml4AvnnhUfmdueQgUrlPLXnzWcP6EYa4q
	iM7+x8010gnV6IN2Rw7kKsBsIkE0MzDaozeDHTnrGOAAx7iuoNdY2KUrn+wW3E1J3Ox9m7pfqNd
	2/51z8ShTioOZAOa6Fijj6bhFCO8XyOh9zA1HKI/jYw==
X-Google-Smtp-Source: AGHT+IEecP3cifD7NNtM4x0PtjYEOx4vfWTMQlcOrKZqxEcJodip8ZghPio2mgJZ/Wq7eeZstJYUaw==
X-Received: by 2002:a05:6e02:1f07:b0:3dd:88da:e7de with SMTP id e9e14a558f8ab-3de07cd355emr15624215ab.19.1749848521613;
        Fri, 13 Jun 2025 14:02:01 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b44b3sm4996315ab.10.2025.06.13.14.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 14:02:01 -0700 (PDT)
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
Subject: [PATCH 5/6] riscv: dts: spacemit: define fixed regulators
Date: Fri, 13 Jun 2025 16:01:48 -0500
Message-ID: <20250613210150.1468845-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613210150.1468845-1-elder@riscstar.com>
References: <20250613210150.1468845-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_140202_432536_41E011A6 
X-CRM114-Status: UNSURE (   7.89  )
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

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index f5d454937d300..8003c8173a2aa 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
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
 };
 
 &i2c8 {
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
