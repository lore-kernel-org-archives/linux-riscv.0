Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA44C7EE2A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y56WcoUPPG1tcyFwmS2u+2bM7n1/SiEuqod/bBfDWVs=; b=VAFna73piEDq5S
	cx5CDZpoKuplzVb8QmBrStiacMRrF8AmgdpRxRvosqkKHrAitMgkiUC1yxp1P3YNYUBaO9u+t2bZH
	PMrDmsErPXH2vZ55+1/6qSTkZQWpm1/QIe8v6hVQFIGNSrDOKkJcFWueCWOZSQLL9IwGr+Mx4++Y6
	JOB7WSWnCvx+kunyL762p6gE1hxY4oxJi7tqQ+xed1JYTphbZlQNRarVVXaNVR2qSly2bEO2HO6XO
	bsdpeT46/SGxC7ueTm2jcrOQzanqUUO3I+EPDXcQZ/qTzuJj6Lg3Wu7/zOj4xakJb6i1G0uyHqHL7
	5nb+3nT1ZcIMz0cMDxyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIel-0000000Deup-1QFQ;
	Thu, 19 Jun 2025 17:02:31 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFgP-0000000DDyq-2ZQX
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 13:52:02 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-86efcef9194so22292039f.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750341121; x=1750945921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=supbaaqf3nesTqTLFJOuIcBx6d7B+2HHLBa+MWTVwXKf3xdqGhV6fhwnproLFhjNlr
         YjUKAN3P5eL3xsSfg9wdJJBdo0j0bjTy5Osa3fW3LIt0daMbolNMxmzW/jjoMyPdhWe5
         vatuxigD9Y+1ZkHmWcJWTKUhDY45wFHV3ZbhW3oBqdlob7aerhKtJLgsEDUzDrZGk/KB
         kreeXEAt3nCF+k9zIEDl1XxOn4Xp8rqELofiku8B1YGXraRcscDH3nwGDF070hLBLJkk
         ORc3GmND38MVMHiMxYsmNMVopX+duv/Dsdw/yr7lBFhYJmwik1921P57nAWmA8VSHLZ9
         dl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341121; x=1750945921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=KKV2UguwCxxYqJOg8Pv1G7C2ht7gfQTmddJd2B6m6os6N2V3tHIyNWiurxQl2sbgVb
         dQeXtU9zg4jvByOqRylw7zTnCc0Ds5dQ/Yft/5C2leQlwf0bfqC0kamRa4rLjRBXEDd6
         YywqY0AjY8DlfR2xbMtm20OMRcdTvOdZd3XkKJRGfJL/HcZtOeX/YWPgu32yC6ZOR5u7
         +Sp+ktLG+Z3b51HJCT54EKdS3ZeWamB4jMPu/Fr9Fz20rITDju1TLbpZjJjRu3Rto312
         XDEZtklTM527IzbGKEx+/B7ggGezig6xsAHALQWMjXbosQJg0qqRtP8dMTiMlng2hT21
         H19A==
X-Forwarded-Encrypted: i=1; AJvYcCUJOH/DeiTtBOwGJCtV5DjniYGCYSbilKvcfc8TS5A1Da6yYSp/OIYhOm0q1hjBeUUl14vvDCoH7DAw0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzadNUFxfKJxt26uFEipEvjDgwrcaWJZYEDofFxWHwilK7GmkE9
	eHjN1xvwUP2IU1Yp2LsYA+Vf6R8p8ego90pKRmOmCoNtxCpYlDvQ/6cGpDOxuKVPqzA=
X-Gm-Gg: ASbGncvDch9+QWkccuUQansx1vP15Im9Ih84ZEB4+33nA4+jRvrvyUlsHA4O9ci6Q8O
	uvSYTvffkCUubyn1Id7X+teZOLKcwH6KIOksaxHsl42C5HXLtNJ2kVZMoCZ2IjfDk48ycC8tQpq
	sv+FcVlitVMRJ/4RYK9753YGE3r/WLYrCwWObGxbKP1IqX4LkrnjrY4yUXdM+cFSu+ZlH18Lvno
	XJwF9p5VaBGzJQ9oBhnINhpnO2kVurGIKk1HGW9Fx2t+QAMP6xZIyS58qFFvZLQTbAH+wyih2cg
	Cr6xMW+pXhDOKUx5ynv37GHvu1h5iMTWZyQhv+cZRCujGOBec80/bl7NB3d7EUcsxq0rHS1nSjD
	JC6XCxYu5wn1l8AhXqIp2bUCg7DJ4JIc=
X-Google-Smtp-Source: AGHT+IHj8sY+G51cZweLxsNTuI+RcoQ3J14uLhguTkGCZ/n1ocvbZQ66NvjsIqkyJEywVvtJQ7ynrg==
X-Received: by 2002:a05:6e02:260e:b0:3dd:d18a:2d71 with SMTP id e9e14a558f8ab-3de07c4c33cmr286057795ab.2.1750341120674;
        Thu, 19 Jun 2025 06:52:00 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a453b4sm38246015ab.47.2025.06.19.06.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:52:00 -0700 (PDT)
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
Subject: [PATCH v2 4/6] riscv: dts: spacemit: enable the i2c8 adapter
Date: Thu, 19 Jun 2025 08:51:48 -0500
Message-ID: <20250619135151.3206258-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619135151.3206258-1-elder@riscstar.com>
References: <20250619135151.3206258-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_065201_649653_DDB0727F 
X-CRM114-Status: UNSURE (   9.50  )
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

Define properties for the I2C adapter that provides access to the
SpacemiT P1 PMIC.  Enable this adapter on the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 15 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 11 +++++++++++
 3 files changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012..7c9f91c88e01a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,21 @@ &emmc {
 	status = "okay";
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		status = "okay";
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 283663647a86f..9d6d4503fe751 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -11,6 +11,13 @@
 #define K1_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	i2c8_cfg: i2c8-cfg {
+		i2c8-0-pins {
+			pinmux = <K1_PADCONF(93, 0)>,	/* PWR_SCL */
+				 <K1_PADCONF(94, 0)>;	/* PWR_SDA */
+		};
+	};
+
 	uart0_2_cfg: uart0-2-cfg {
 		uart0-2-pins {
 			pinmux = <K1_PADCONF(68, 2)>,
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 14097f1f6f447..a85239e8e430b 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -483,6 +483,17 @@ gpio: gpio@d4019000 {
 				      <&pinctrl 3 0 96 32>;
 		};
 
+		i2c8: i2c@d401d800 {
+			compatible = "spacemit,k1-i2c";
+			reg = <0x0 0xd401d800 0x0 0x38>;
+			interrupts = <19>;
+			clocks = <&syscon_apbc CLK_TWSI8>,
+				 <&syscon_apbc CLK_TWSI8_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
