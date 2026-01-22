Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA675C44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 07:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UA7yPPxGIV4IDjX9zAoMfZXHAPZzbSTOgPfodUAh7NI=; b=2qF/RU4k2Gbmd1
	YHnboQJ6WK28cmaJ0m1RQeXFWQF9s5JYVr+G2HAv8XzzKEucJjFoF+uK2cNLD4agPdeVEoto8zq04
	1UKjRSAHn4rEYsjdq4T5hzeZWi9VFfNJ9it5/SXz4+RGxF6mF5njgiMDkV1D4AXYCrq9JveHU00sa
	AqYbxlXQxACFgbp+ITAMMLFCAYR3rsAeKIz9nXa1PqlZ9IlXV/AQxT3JVXm6+uH0cg8NYMEK/oUeJ
	rbm3b0OlK/JhEaUfvBCpsuw7s5A2oQP+a/oQISH8Z1fzaTjazv5XGl2/NY9L16JpKtq5q+5xbw/Bc
	9TdmzQiHodZV+zrHkZzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vip9P-00000006XjW-1c1V;
	Thu, 22 Jan 2026 07:30:43 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vip9N-00000006XiE-11z4
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 07:30:42 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-bd1ce1b35e7so398373a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 23:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769067040; x=1769671840; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/f7NGLJwOVQXgq1cgcrLkHsXysP/8ctDFHDwjeS7Sis=;
        b=x7v+FFKrvDwJ2WbwI2rz63AvvO83knpkeuO5Qz5n4R97vSGPBa9S42/oCUxMiblISL
         k6kKd0k54QYXBKb1J4LTSA7hJYrOh5E2J63ecRKS8RN28dh5drMvikiv5g9z8blqG3bC
         eELqhBxhpFoav4iRa75DyoDK7OMOydhE/0SKwBEYh8gaMHXRG5yrb2T7Yq20yVTDAoca
         YT1sb1IwzyssdtXVHuFAya/2ftST2zGm91c5sQucS+Zz89Hng13VTgoInYhxEj/xQxkd
         jZnPLetIDaqOsJVpT3pC9/3cWADUv8FQaluFm5cWQN762ozxHQ8+YCegGH3wo0lh7C1m
         o3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067040; x=1769671840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/f7NGLJwOVQXgq1cgcrLkHsXysP/8ctDFHDwjeS7Sis=;
        b=Bhv9a8UJdE0tNsFoUGSVXiBbGKU2Os7+IReIQVDoEZYw9obonKA074zFlU1k1QifHE
         i7llf51SbXvffP47/pcUyHz/hCjfaxe3U1h81FVdqhLCDVw9FD6ld0Tmled8FzW/0GFM
         kSF9csajl8XjGDPX/BP2jaPAXYvhj3R96FiB9VxUuS2/Bn85+QOl+lO7aHZH/xEZnPXO
         x951s326p5suutY46ZjgdCVlzLgax22AQkPivqofudQo63sNhuQ4U2uIXHag2AfrcXMz
         LgxkB8ohizYxQJoxlOWzChLClwlTyS4CW4U2H4Z9nqUF9ywNK0P+pvjobnWaB6l56Odi
         W32A==
X-Forwarded-Encrypted: i=1; AJvYcCVDJx8RQbidNJ0LpyIUpegarEtFutfUEE0tN5iR8Uxq3h6pXCmL1bqg7pmTaZwUf815+cD5Bb0OaNziiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQgBYRsVPfEDbTy0grDc1wtuyxPWjBXKTJ+dGZg41EkuIlRM5E
	o47TW6qDZRb15RH7wNziKFTLNeHfShRBvYy6OxWB6WbFmULKMDSw64tqzNfC7/9HX8o=
X-Gm-Gg: AZuq6aKS+sqbGcgZAEb+Az3jf2ljcT9x2voR3YVAHlTFZLiTjrlMIOAf8mIqZnxLJDX
	FCNjbCz0TtY3bbxkRHuuKvxAffVlmfkM1rmh6wJLRoXZzROstYd9uKPSKrz9pwbvdjP/6FaY6Fg
	gEV2L8jxenOrr7KkAiuqSo/5xJXMLg/J90vKsTu7xS/9u0iAAU5Dqp2oUfWAs1ZH+BXHQAaulyk
	i6qm3o6ftxIXuh5x1WI/JePg689Eup9qwC4Zwh6FKleUJJEP98zPdW6bVwb4JmbZMU1uBsIyWHW
	H+2RrWwkouAR6QhsTKIeYr5nVkZ+4TGctVarBzs0/91klxka/QyGjzdtrR6dQbw0ag87omFKEfW
	4wKBXTaYTmUAJ/F0mrwyPAHf1gHxoJm8ReBoed23ESXTWVsZ5O0klMHkj6FCvlkXM9FHyAT1hSI
	kVhM4/uPHxJW+NWt1Edxc966jYvd5uI/Q=
X-Received: by 2002:a17:903:11c5:b0:2a1:deb:c460 with SMTP id d9443c01a7336-2a7175a279bmr175677135ad.33.1769067040167;
        Wed, 21 Jan 2026 23:30:40 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9edesm171691845ad.23.2026.01.21.23.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 23:30:39 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 22 Jan 2026 17:43:45 +0800
Subject: [PATCH 4/4] riscv: dts: spacemit: k1-bananapi-f3: Update PMIC
 supply properties
MIME-Version: 1.0
Message-Id: <20260122-spacemit-p1-v1-4-309be27fbff9@riscstar.com>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
In-Reply-To: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
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
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_233041_292887_3B0CFCC6 
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

Update individual supply properties in pmic node to accurately specify
the board's power tree topology.

Previously these relationships were hardcoded in the driver; now they
are explicitly defined in the devicetree per the updated binding
document spacemit,p1.yaml.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 02f218a16318e5b6f512bcc37035fac37c25ee84..c30697732b627d764bdae9bc8ba44d7b503f0897 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -157,7 +157,15 @@ pmic@41 {
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
@@ -188,7 +196,7 @@ buck4 {
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
