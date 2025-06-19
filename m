Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66784C7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=leVC3lNKq9GrI8x3a+o37IhB5PAqCXAD/IqVN6J4ZnI=; b=gN/q4brLfsYfZd
	HqiEltAAEdvZEbqasoDTFfYT4DDxL6DedDSBTHLTUY9wJt8IP9NaLyztH4NoR67duj2AuuD6E+BTB
	pu+cuOi9bL9sHsi9irwPqbq7N3BiQGyFWBZIc8VNJN1MqpNEiWKcTWQmHuA79pHRqJHH0rUs8Lry2
	Jp1JB4cJJkB8axwaGcX3f5YepFMDJsJvp3kqjalDY2n9KbxXONZvrEKtaiKCood1xBrgslgLK6Gig
	aCIhOCk/wn+AiacPH8DzNjISpTJByHnnH0qFJ4PnFCcbEMIO2/z0fWCOLDDA4+eIHS7g+DqEatNjH
	rL6Xyyfti31C7B4UcJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIen-0000000Dewo-00iC;
	Thu, 19 Jun 2025 17:02:33 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFgR-0000000DDzV-2jRz
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 13:52:04 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-8760d31bd35so24175339f.2
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 06:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750341123; x=1750945923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=ZeQAec+tsnrAsd4EKTvOnxdPp1B04bH2TfqIt4t7ztKI4xRyLHlPwZ+AWvshGhBreB
         Du1Bcsm7+E1qhbXgOZPSKXwF0Dej3wrijdpOaH5FJWvFtCHhcE8Vtut/0TdVhZS9QHW1
         ES5Vk7wBrzaM0VUEZzydbXyCkhOnyYcB+B6rPu2myjsKOSKz8LpQaz74AZEaQ9R5CEno
         OFR+J/XKXbcIVy9VQzQ4+YDPS4yqKsEqfKmxFZmcgllsMU76T9t7GifmlfRSygqXsixI
         NBK5dovTFQHF4RNNXifmj5YXeE6NggZGtCc1OUGLy4zLezyZ5AQ186Bk0aHVbPg9pDwT
         IG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341123; x=1750945923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=H7V4p4Ec4M2OTJH2k55Sh/0b3ThStc1W8Lnno5EVLhPMn27fLuk/Szyz9IJ4O8838I
         kz3HKnXOXaYcqYSf6ZrshRU2YN2mf9hl/d0584n3F8mQLLTzxhRPq4hjtXkVhz3Z0J9U
         ISme5GflVvp18p7PlcneWv3GZDLvBpQHwO6tKEEfVoyINNvSynkqO5Qk++dZZlMeBPcU
         +LBX99dzcle8Pv3TapKDT+QJHtEUF6DTlUPLfEgrUhivCjvnLfqhPsCdnpF5iyH/jdR5
         eJbAsfThN6RSkUO9jtd0f68/WWqTWEi6iopw5sm2TF+GIYLuTfgD561np7Ck535v5DmL
         1j7g==
X-Forwarded-Encrypted: i=1; AJvYcCXppPSbHK4JRP5hO/hYS4EnFy1Fsse+KgTNHnzmmdh+YdrdW9QCtHGMnc8uhfJbLE2WxGLdcZi1pHSfsA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyObR1yxup+IE/65RM2Vjd++jRoGWScWGqe+/TO2nXl6DJyW+92
	j4PEcZxCOfaSZp5KgH3680oQ3djb+UKbolkYN5GpsX8TCOeY7Cj3wUOKAZeLchS3T6g=
X-Gm-Gg: ASbGncu4ut+hhYJh2i5mQBLkbXF72PTPvPz4kZ+0m+wbs6P99WPgjnY9VsdhowehjDZ
	TcCGyw0vigSrYLkCV1wI0/giJuqavT8GIS4ztk20RK+p4QS2vXwDB4brTvOF+VoxN2aI9fGGJzm
	ekcs505orZiUCz/oABfMMXeKLtF50M/hRkb3zi/ugT0667ceHX5BKh5uDKVfjw5XyFXk4nvKQuG
	yzHF6jT1vx5jRKqCtmUjT+4gl6o7a/XJpWRWWIGKdgaNM/QAp5PAOPoviyTLPOfbQ0A7EllQWHD
	3gdGg/iG9esDGlv7UxRjCwQCLfrTjwZtaTJNJ41ctz0f/t4ayWIh3D43mZV3v+iv1WqQK6k9rKx
	lIR12c6ePFyiSpiRJiOIEAvAYm8ka/l5w9RPZl67BuQ==
X-Google-Smtp-Source: AGHT+IExem0l4ezDbiC0YunjYTLQzP9AWFOBkBc8gw8zgbBmASiZICSB36WYhCAntpWfGoVKA6+PlQ==
X-Received: by 2002:a05:6e02:1a8a:b0:3dd:ebb4:bcd8 with SMTP id e9e14a558f8ab-3de07c5cc98mr247003285ab.9.1750341122994;
        Thu, 19 Jun 2025 06:52:02 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a453b4sm38246015ab.47.2025.06.19.06.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:52:02 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: wangruikang@iscas.ac.cn,
	dlan@gentoo.org,
	troymitchell988@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] riscv: dts: spacemit: define regulator constraints
Date: Thu, 19 Jun 2025 08:51:50 -0500
Message-ID: <20250619135151.3206258-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619135151.3206258-1-elder@riscstar.com>
References: <20250619135151.3206258-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_065203_688661_726A0F93 
X-CRM114-Status: UNSURE (   8.23  )
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
