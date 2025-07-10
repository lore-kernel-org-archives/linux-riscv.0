Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B711C83F24
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 19:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25VqaM3KKL/GgH5Z4LPbr5HUj3wG8/LFEbyGIQiOiHs=; b=HUNAh/qmIT2Xei
	AH0Oj1txz8o8+jA5pGaVt2kKgTtDY1Mo/DwFSI1htCwZujuCeGWVMdIHWwY35e4a2URY7ORjgx9VT
	HmZg4T2vnrV3J30cXyQ5A3zkQrb1Zixbbo0CT+CsYDedoMyiA0Z9FZ6w7Ijex0tA9RuZhRRVQt1kj
	3c2JBouX8G10plpQQ1a8UlU9v4q5YzzOd2wbbRE3hYb59ejmtb1pWmG4G5C2cdBvNfeBh9viKJkLu
	04Z9S3uFL9x02pIfHbkwC7nL5KtgboRNMXkB3uVcYK00yGxSbPp34kDpZAFUW39ZYDtPqHBcovo/O
	A081yy28vX3KAiT5awig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxAQ-0000000CqE0-3n6Z;
	Thu, 10 Jul 2025 19:42:50 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvQW-0000000CdOW-2OXI
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 17:51:21 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4a9741b513eso17780891cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 10:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752169880; x=1752774680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5l92a0u3aEn5H5uLHNniuYjNUr1Z2m83Q9b51ZTAqs=;
        b=k4QtIQUpgEIliqBATgTvLu5V1GsfPqxaJrQIXT+Ma9nFs35Wqy188KaX+/eb0PbIDb
         +AJrnNwMipVC/ykkRBO2FBhZq5jH603snxXaZo1kLO/4hJ31SSKyfD7NztiN2dXzXpbS
         VLcjBTXr1wbWC/f1BqgMpac40qXfYAOg/jG4J/k6fJQGOp8ITSs76hBqF2n24ZD0SRCb
         7r6cyTG0m3+ZxYT2EQbZcHBarzO9GcOzEx3Iw6YF36aDgEQj/XUSUmHhh79z2oriJHxd
         0s+ameWivZhyT61Jeq3iwBUwd0XciwOFJ0w8CkE8EQmXFVVWxZoH7wa9m1iLdjeH6VlB
         fh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169880; x=1752774680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5l92a0u3aEn5H5uLHNniuYjNUr1Z2m83Q9b51ZTAqs=;
        b=ChhiU/PqRXZ9giqdGArSJqPfVED0YIF4a4EwmqXPBqPTYFTEnERPKFqh4hksirgAZb
         RxtVmoss2xyT+KGxFlGBQenO7hRRoL9gKM0UfWr2feusOKY/lPr/IVEcRWtoQFugh44n
         bg8BySGveTl8O36lD6JWUBt/HFu7b3fojTJA6fl6N+0aCEP6IFVqrXAGBO4HxCmszdi7
         J91+17zIVAs6fbKn717QRkKqZgvkqwRBQt5AqGMlH+nFuDTTCHxJC8qHhtzBTAs36f9R
         p4iY8yYAwM2SRc1gy1Vyq6DN+G9Vo71P0nmkVQOrZUFE3HLR7/4Qi5hAd6dbTYUPSCJe
         S8Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXENrp6Ao3yVImo7e6FmvCfBBhrXaMtH8MTUnoLDQePepOZ9OWCIeNRBq1V8vYdDnI20w/RDnq2fb47mg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLsAXUvWaDzzKNiA9fyRp9ympkcwo7hDqO4thT0nhlyz5tyhuo
	tFkX5g3+rUPk+2Ij11jqNXnwISTohd4G0fvNvKzAWt80PkaFYCT1SfSw0kHSgXTYRv0=
X-Gm-Gg: ASbGncsZmOhaiV4Bw/JzfJikmLsmKLXy9WYZnUwT/pBQC5SpQZMP21TjNzugqanl23+
	+HnprCk0EW392mrkcph+RuloEjxmzA2dmiMrO3As5F/twc43sVuBDEaSkPjf5dyEpWWXohR9Trl
	9zFiiSMoXZhChrdzi/ZZJevucPcWPQeg+6Vj08Q/1h3EyZmV9f3nMGVb8Mb091pakcpR5ISyhjU
	kv2twKeGXpipeD3CQIjGUPzftskBs+JWrX0PVWJi6DYdh3VJQhH0w+UT7+LbV5r7vHSXrc+iBwF
	bhAn974WOpH98Pi9oIcT9ZXoOO+0FQhCTgJ9mymODlUqVVN1xYoMlJcH2zAIXzXl6gzIHbThYNC
	PjYEL+3EOc+unRZL9Xv+Dsu/ijm5QJJZi2C4=
X-Google-Smtp-Source: AGHT+IG+gA6k2s44x2USnRDQuKJqGd3W7ZyAlmp/eZAKTxA53qYYitzNYMjkTmaqX9EZT28ElFOI6Q==
X-Received: by 2002:ac8:5d94:0:b0:4a4:3b41:916c with SMTP id d75a77b69052e-4a9fb88f9b7mr4651941cf.17.1752169879757;
        Thu, 10 Jul 2025 10:51:19 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee300sm11165941cf.73.2025.07.10.10.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:51:19 -0700 (PDT)
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
Subject: [PATCH v8 6/8] riscv: dts: spacemit: enable the i2c8 adapter
Date: Thu, 10 Jul 2025 12:51:04 -0500
Message-ID: <20250710175107.1280221-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710175107.1280221-1-elder@riscstar.com>
References: <20250710175107.1280221-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_105120_611017_6CBFAC8E 
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
index 3810557374228..96d7a46d4bf77 100644
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
index abde8bb07c95c..2a5a132d5a774 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -459,6 +459,17 @@ pwm7: pwm@d401bc00 {
 			status = "disabled";
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
