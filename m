Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6E1C7EE39
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 20:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y56WcoUPPG1tcyFwmS2u+2bM7n1/SiEuqod/bBfDWVs=; b=sxudYMhKjdZQuY
	jBvAJFtaTxko8+ZbC7NUKqw7DcQzhr34ruMCLZMhcUeK3GDzqIG3O7q69B3exWWTcANEcMeeMHkv3
	DUDfoQ37RHV3rvdCQ0iM4d30hFp4oiwafJkLXsMLoJ52HPNvLHrRQJ0DIOFqMjzI9IHcIMb0zrirN
	OPjo+U5UzO6jDUHiWc3Jw5aP5ZzA/T7v3CjGvU3nDnre/2NHIVUxqUcVJRCd498es+835bipPqhyr
	wHWXa+rQoqY/LOydXkrCBd3s/RtXIYOXyaXN+8srK0x45BO2+oZgVzDWOBQXICmpID87m+J3emCK7
	q6r2AwnlWUs6u5W4hSHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWpc-00000009r26-3ice;
	Wed, 25 Jun 2025 20:34:56 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTBk-00000009Kvc-03NJ
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 16:41:33 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7d094ef02e5so138621185a.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 09:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869691; x=1751474491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=UuhQv6oBpud9svnMhB4nIbSzBZwNWAVDqYlwtgDgXrNmvzuLIDFXK/5V0K1d8ToIqe
         urTbFkdpJ5AslvofsXLvlwLAcsCjYWom9PV40LWLEKORm8cREOJyQd6I9dohqmXxu0vs
         ljHe8j4DgtLq4OOHSD6C4GtpUJSXq9txwnxWPlIEW227vCml017kEDhZQVmlwWPIGdXj
         R7JcaYF1V6E1dKkivGHF7GdROeKmtJ62RoQ5deVtY7dYKhuMj8qDFTT1sNTB4V/P8+hi
         3HftpiGh4qcxBiOyFwNJ0NnfLUEmBBs4y0AZrhmJm+3JFr1IrCCruoalGGQnhtNDgwnd
         vQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869691; x=1751474491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=r37e2Z+7KQTHdXJpIA83JtprcG1qT9XababfvaUik7LaN9kiYCp7U+qnbUYu+8obm/
         /+x6W+za4/bcO/N1cbPqnqkHP9Kf4gYDdclaXVMHzttRazfooZDTu8CZu/LF322bOIeH
         7vrSu5pWv6kR23t5/4YxTi/Qtwtk2NjjOG5FqYeGPWBWVoDsnOJillN5vYGpa4qcRVqA
         0RHCxPMQhIw7f+BWVM4g9H3nB4/hEJnqL7jnW/dOXeA9lP5mTvtyYkxYuWlf23iqHvTN
         miAICgecj0er04oSxyLtNPBJIsPWSn/EYhyC8ZZxWXIRpo/mwb8R/83jO0S1y9iImAPz
         wTQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYw/lMxdj6jZSMkw2kMckbRXd701LkH5nqaZcHiF9ieub/eeufdZRzogIwS1Lt4ahJAwsHvL/2mKDLwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUx6v5mLXcmr2Q2CV+3+0cU8wZAa9M5WZYbn0mJEOFhmfyJtNv
	JkdwnkweqlqEQ8XINsjMoR1E61jAZIUXrvMmA23xTibcahCoziY6xksS2/rKibVnV2Q=
X-Gm-Gg: ASbGncvqNL9G2dM5PO8tIiJ2YJwRLqav6fGqTG0OztOomjRpfZHWtR1omBJM20cSWjF
	xyC8B7DCNRkVvj7djZxOtNyl4+5xuc4JTMyJpAV0v+O6d1M7GzBFu9a2PK8CXyHhNs9whi2By5M
	1TFT/LjPveuXfvpy6eW1hv7hiSAyJ82zb5F8CIlE/2B73D1U3+Hl1drRiZSGZom0c7amvpMNOQt
	H54TwECgb1eVBHcq/tyXfBals8TyMwFZ01Uy74dsZMbzBnlchWIJaTU6ZdfKOAlD8u2HSQqEKi8
	Gu0t0FU+91cEKWxzRnYHUe0Y9Mb2UT4LM3bP07G5PIm9Z0NW6xPOgkkBVtXxd5+QOQ4QkY7gjPH
	j9xvUVyCWhRDTcAF/BOYfkYAKvA5E8B+XP0mwYxwK3OafiA==
X-Google-Smtp-Source: AGHT+IH4WBO33AQEU4daDUfdQCrNAmkqlpvMPDGNy9OxOBKPBp4zs4BCFmH0xBJiPH3X1thxaYnaIA==
X-Received: by 2002:a05:620a:40c3:b0:7d0:9a99:1bb1 with SMTP id af79cd13be357-7d43bbdd560mr26509885a.25.1750869690791;
        Wed, 25 Jun 2025 09:41:30 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:30 -0700 (PDT)
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
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/7] riscv: dts: spacemit: enable the i2c8 adapter
Date: Wed, 25 Jun 2025 11:41:16 -0500
Message-ID: <20250625164119.1068842-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250625164119.1068842-1-elder@riscstar.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_094132_050230_ECC9F918 
X-CRM114-Status: UNSURE (   9.98  )
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
