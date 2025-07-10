Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7615DC83F17
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 19:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=leVC3lNKq9GrI8x3a+o37IhB5PAqCXAD/IqVN6J4ZnI=; b=Jry2gzkq4WtP5E
	5Ik84RgD4zQfgW4+z4BhLbC398KAsffrRpObP0CPxMub1llwbjC5Nd8/q/39Ua7kxo8D+hmhwsXPC
	gI8eSslQbVm4S8zT9HlLtQfi3g/vYBPVAFPzNJyyZrab9zlQ6MDVv33M9CFlg6MZGL1YZ+6YMWVGw
	Bwo25ugrlcaJ/o54OD05QsMJ1jftYxl23XBbfVI2GG+Kw+KunMPZk/1jChhaQyjv/dKiCV15xPw3u
	WnyY4S23UGZi4Dm7kUpfJIeiHb+k8M0buVHvg1nVd4ZIhBorTqO7sv2VXfQpDXw6I5o/Z0L+RtWd6
	azr3Hmm6R+UyZFRPPm4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxAS-0000000CqEt-0otM;
	Thu, 10 Jul 2025 19:42:52 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvQa-0000000CdQ4-0ClV
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 17:51:25 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7d9eac11358so132009785a.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 10:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752169883; x=1752774683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=1T1wc65c6hyn3IBLrRaSRJ/ccLSK96MRQlnEaC5/nnvjeLnPK9IanZBTPNCaIWzL+l
         cXCzODlx6joYmbjwC7vPZ1g6B9PPo0FBi0j560rmpMsjdTOV19RcNhotF8UgBGz1iUNr
         ma5XQ6zLkO7NZ8S3fVXPBleBw6KvDJtGD29ZiwKvX+Egnw+klSzqQA4hIVbbZ/pHZ527
         s07Z+ZgvHhL2KCzKveTLkje8BSgZjNm4eYRIfX4s3EF2coyVAgF0Pid+AjTzplQ5a4Mr
         HglNtz5IC7SLV5RWgp7/7ma2x7FAsR4taKN7EaJvv8XEMfz2pI3qahAHnOYjeydSKD51
         rh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169883; x=1752774683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=onBE41aI3bwfJYGeRlCHjYf38kyUp5XY41PuA7eyaEgBglnXtf+M18Ihx96KCT9upm
         YfAVjB8CPMLDxAmJSkoG07L/6M/wO2pJoHI3bXSbGXbD8j3/dfQ2dQXMnaCBP+/3/VlU
         IXVDNL6vdhqWSdM/JyQ2B2TbJCtsHemY3MK9mH+RT6VucvW+cdJC9wCZUwm5cGTBcDM4
         DOd1T0Mr8IG9e7ySqL/jlk+adHeewjjaHeLMts2Z0Ffyv4xzEfoZNZZo3T+ww5asCHs6
         7bNHzAfiRxAosy4tyiY32DJflE+P5hxyVl33jwNn3iLS45YqLw/95Z+QCzGf8PvnbsjM
         Uuuw==
X-Forwarded-Encrypted: i=1; AJvYcCVzQ/jnY66uub4U96Nnh2OzZQLAIBBfPgrlS9bTSA6yxxTdPJFlTRfaPZiJI2N5++ywF3a1PpoIVWYqqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtrrSRgt31EMdf4g77gDrNcy8LK2CgPhn+2BAQ0rlwcLKviw2A
	JLvt+aTtDgSLfIXcEnVJ+pInZPRdLu0+aNwD/i7YPbfl18T8HQOOjwZOZJEgukQ70As=
X-Gm-Gg: ASbGncvjUs232CnDo+k956rnxMOWPW8Gu7MNN/O4k0WGnXbSCHkVrFl7QUCum1qJH/K
	1LM0KDmWXqWVdBVnNIPK+Fi3EnhruzIDR1gTMSIVG9WU3e0PHheehblDayNdg5/fKyu3okGTwKk
	f/mSxQLqhEkyGmixECDLKXXyFpwqw3x3lzlw5I4hOQo6qtIvo9ktZmqX5cJ90YmC+DQKkr5Ojoe
	HeMt7rLWryjjQa3jog3ZbSjzC3zdvLhWpACggpt2QM6DFkNYWE8eiiqdAcYb3Up2f3+3OKCzE73
	uhsFfEsnAfB9Awc8cPWCyXJpbgWLldW/qBJa71rt38Pe3DAAYhl2NKWkNVzi5BByMSkIpXoWZky
	R5zIYb2di6FSkH8byJYegi4cxq4U8poXrSt5ylgrM4MQZTg==
X-Google-Smtp-Source: AGHT+IEoaJ/MKPD+CK7o2MydxVCmaO05jGvY7/XoDfctFPCiw8+3wLCGeJ2afHZxnC3BYh2lChbupQ==
X-Received: by 2002:a05:620a:4450:b0:7d6:f801:ed52 with SMTP id af79cd13be357-7dde9b5ef8amr61941285a.2.1752169882818;
        Thu, 10 Jul 2025 10:51:22 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee300sm11165941cf.73.2025.07.10.10.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:51:22 -0700 (PDT)
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
Subject: [PATCH v8 8/8] riscv: dts: spacemit: define regulator constraints
Date: Thu, 10 Jul 2025 12:51:06 -0500
Message-ID: <20250710175107.1280221-9-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710175107.1280221-1-elder@riscstar.com>
References: <20250710175107.1280221-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_105124_084346_5D7485B5 
X-CRM114-Status: UNSURE (   8.59  )
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
