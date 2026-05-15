Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1B4CD4F25
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 10:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qpDGxYxRa0KRdxUuduwZXNu1vBorxrzkLqLLwwY7j7I=; b=Cj7eIP5PmTPrtO
	9YqqAbSKldcBEaqgK5pg//0HAC/nWbeUrT993nGd9rtv0/FBhh032Q1zKr16lMq+5lbUg/CksH7k3
	DE8OvDM+PmM56t6m6fWOESDpka44yPH2r0caPHr86d5K1PP58yjZ/NAn7rX1FPzEeQFkJjKH9Ot+W
	Jqd2rH3zDKrLU96CkFZUi/YTQKL35GCC9IQQCYBGv7u2wLCgHv25IXl2VpfNk/BFwdBQQz1RwpvsS
	bYwDF9mUzvLiZEj/+N55vHR1ybng+Iz7ie7tAztjROLth0ngXUrwgyK3NSZPWYio8zIxEjvfBZPof
	dvyq2rhqN/O7iZ85+Hog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNq6d-000000085l5-1O2t;
	Fri, 15 May 2026 10:49:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNq6c-000000085kW-1NYQ
	for linux-riscv@bombadil.infradead.org;
	Fri, 15 May 2026 10:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Gj+gGcawYCc+wqAPbdfgxnVj/lSmz4s1J3fKvDtI2Ic=; b=p+9p4Q5xcMvmNJ1JKSvzE6YcIq
	Hnl+dPbN+X+4wBnWNb+MGeSDTTm/n0CkQFFrNTCnnWW3Ozt+OUi+7K+SkrC17rbKRtPbIhRyJ+bwG
	NdZFZ9HscycCHtAJNvDZpObjhHBUuBAqs/PqCxjmjtkRVj537DO4XUEQkd2WoxjJCS23sM7g1t5W+
	BcLgtiydMFx/ooY8051KmKdCVCqYag428hgLFnQ9MrE7dNwWY4dvVfcscsXqS3eDUNrPSeK/Qpu50
	pPLEpQBug+3E/fXN6VzjoGvlUJbyzGgEqMoI4IB+ece9b+/SSZl5MDjKEfSIIYaGe3LfczSRluKJ6
	BZCGIxVQ==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNq6Y-00000004wnO-3osD
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 10:49:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so5398903f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 May 2026 03:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778842157; x=1779446957; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gj+gGcawYCc+wqAPbdfgxnVj/lSmz4s1J3fKvDtI2Ic=;
        b=A+IVNq9bzfOcYjOIzPz8WtyxRsnPuZH7Gw3e5tk+UGTOXbg/Q4c1zjKFYRdnkJz4W3
         JnEL/8t2yPTY8hb/ng9I51KUXGFmcFaBA7iUaQW5BTrrwwGp1RURsN2RU75q1Pr4NJiY
         /Leo0sJa6gMadyEHPpMyqduhhzW4OxUXXfx+Hhp1BUr9HE1jbZWozADfWohekDPSuu5P
         tq5AfkFzqV9ybNDpGB2qTvZXZDeB/usy+8JvLRLlIazrA4Na11oImwU19P5QX6pKgDu4
         dXmR/IRVMKeIH0+L6Y43xo7edOf2BOsplPBY+gbHbwpHb0CHt1FPAETEcShPwGXe9Te/
         ywLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842157; x=1779446957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gj+gGcawYCc+wqAPbdfgxnVj/lSmz4s1J3fKvDtI2Ic=;
        b=ewGyYQxGRu7a89TcK4x4PNEE2hj5sRoPYxnBKJKcKFthhyA6fMrUYQE8MXZZY0k4Xp
         mxJSan5bodR7FBrm6r9q1l4aF6RK30cSIHcQhzIlIGz6PWj0dj6u3LNayBWwYfwprbpc
         QfhS+ZfeZ6c/vKaBmkkE4NOQ8ya8z2EeNr7DjHQBrCoibBQE5DU1agoD5obA7f70NRSt
         eL3RubQ5N8inB/1q9bxd0fNa7XmyQe8eIvQEP4ViTucnYtuPZKl7iBww0nhUVEl7HDqD
         5ChFLPiHuhK0I4kjvI4GT1yQsFP11Fc4bMfUkg+JhQGLsUrB5pFWevrC278xGdvWVFDD
         55zg==
X-Forwarded-Encrypted: i=1; AFNElJ/GM1TDsS4CvCjP6CifQiaUsDE0YHljSH9NT4l5DoNNeB7NREtzWAn+Vq/L/iLEHsGYu363j0qknQxWrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5KpOmvw7f3icLb2G1oJ8xvwbz+1F7hTLvmla3xLRkih5KCfZu
	ZTIlu+95WRyd7Jo9V7zCw2qsrZ6xaNzVuHStN9K/i97UZ4BSPiIWqbFG
X-Gm-Gg: Acq92OFgWhabfEAndKFUJtz01YI8uld/ega12SA9PKSrkNkIquKHm1sDkBSwYiga3uO
	amcYRBpMk/E/JGQshyfFJoSzudcVr2GWl3unO/PZx/Mea+6XzZGB/Rkvh4fu9kfjRCX5KzK3/La
	df0sufZIJnTK9t4zTY17b29gIa63uFKNW/yBF/puVJFZm8BbARtDloNCmkz9DZFtlmlYpyYdrIZ
	ees0Coz19RoZmnVNadFHlWZIliQ/PO2WPN2bwDh9VWfM7/G0BtsW+Y38QzUdlqO5WsP82hzqCCI
	9JwG7aXyXttmsbcMsJld3eA6HCldy1vDc9YFSEJ9P1UpJz588ghsqvUKvFor39ffIRn+/eg4pwE
	tQEaJGta2ecmKgQR9dALf2N8Cz2qIkyuDmK8zvegnXVhcuDthYY0FaGeuLlGvP2vNGoPtSbx9Az
	nLCbniA6LSrYFHFtUqZabeItpv8HyKllHeNnWQuZQry8wVlLH7TvfhQ1Gy4nK9l9oi1mgfXMPuf
	8cM
X-Received: by 2002:a05:600c:34cf:b0:48e:5990:9698 with SMTP id 5b1f17b1804b1-48fe651588fmr49447535e9.24.1778842157464;
        Fri, 15 May 2026 03:49:17 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm13975602f8f.14.2026.05.15.03.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:49:17 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 15 May 2026 12:49:00 +0200
Subject: [PATCH v10 2/4] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260515-orangepi-sd-card-uhs-v10-2-094af27e310d@gmail.com>
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
In-Reply-To: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_114919_483535_784B504D 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: Trevor Gamblin <tgamblin@baylibre.com>, devicetree@vger.kernel.org, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, Vincent Legoll <legoll@online.fr>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with GPIO_ACTIVE_LOW logic
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes
- Add stable MMC device aliases (mmc0 = eMMC, mmc1 = SD card)

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index c95ca38e3d4a..bd40bc9011e2 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -17,6 +17,8 @@ aliases {
 		serial0 = &uart0;
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
+		mmc0 = &emmc;
+		mmc1 = &sdhci0;
 	};
 
 	chosen {
@@ -202,7 +204,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -319,3 +321,21 @@ hub_3_0: hub@2 {
 		vdd-supply = <&vcc_5v0>;
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4_3v3>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
