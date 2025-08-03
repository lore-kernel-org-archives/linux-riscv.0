Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF5FCA0EC0
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Aug 2025 02:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjeRD0orUmP491zDMMmDZc+HX0DGM93xfYn3ja0cZFQ=; b=tD2uwANwzDci1C
	s5wResU6x6OezFOaRDd2c4OPLtRwAz41xnm/hayW6EuGxqSTBgd7OxPkwzgLhVPE8updKdM0YeAUe
	LRFnkzn1ogYWp3DrEJ08AczNZlZeo6J49G5sM1vVQV+MXaiI1mV4m7Vm+vQeD8jYqOZJwLKNPaiuK
	z7NRMbd2Hkc3BZD3c9ovupXGu2IyO7Rn7IZsj8m35C4Hvjn+7ZoeRanO1nRVPdSc/aHA2u0uvYngH
	2PlI1nd38/aUsf6N4hxMQatBZS/IE1aetqaESgBAny9f/nLs5/jaQG8jumDA1uy8Cu367GKQFMAPO
	Da+OJ2Ps+fRKcH54oFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiOvf-000000085YI-0JSI;
	Sun, 03 Aug 2025 02:58:31 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiOvd-000000085Vg-0tjr
	for linux-riscv@lists.infradead.org;
	Sun, 03 Aug 2025 02:58:30 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3e3dbda56a5so9838545ab.2
        for <linux-riscv@lists.infradead.org>; Sat, 02 Aug 2025 19:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754189908; x=1754794708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=IdusD6mqjoqy+kKzTDEcvEi6UkcLaZq1jFXWT3v5O3V0WFJ1Qj4I+TqIbYv11l5NWw
         EedAjFvjBoD6oKGHYoym+ICjD5K2EbkbzPtTfBQbSCqwmVa1VbgIJm8HqxbecWZc/pD5
         ECSVoeH3VtdvoXdbLkOEmJq5U5qconsg64MWYA1rU2KGkaStNjOAKRpzsTgPhnXr0TQz
         QJmMorSe2AQD+7hZ16JkRXuKkPpk7nnaP478+Tgts038C63P8kCR7xoF/EgMIAX6uLqn
         6lGN7FlMeZeXx4kXyfAkIDWU3oepYxAGDkvkYB2+cFjBtVdt1jp7H8ty9+mHBqiLCztS
         Ithg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754189908; x=1754794708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=EcTIbg8KDHwz8FbqjpmNVxZTdOCP3/NzTP82hbdDb6XiBHVGaEEfeY8XDReAdmq8zd
         qQiuWj9vY765EnDFsVeXNuxJk/7kkA3ERrarO3KoXdPkN9NV3Nwod7ES8WbYL2NihGj/
         iHO4Q1ANI4L3E0XFjhpzbOnYoFw/eYEwjdGQ2aKzVjOowyBdiF/u/FQ7cWmfY//VMnKD
         wxvpu4DrIrU06jtwnMyiIE8vZ+IhpOcXH/QjXYSPZdOanfVRYX0eOT99Kg/8lWse7SF/
         yruK/AfLGkMNJ5VuH7a88AAe4btu7ZSTcezsBB+jLmImPoARnajdyKUVPPHThm/hMVW8
         z5aw==
X-Forwarded-Encrypted: i=1; AJvYcCWY7UNsOdHLzKSqV4Her+20Ocpt03FfuxrGMntrDBiyiJmgkkraLvGcbPJnyTGcK1UEFWOcVP2YvNqfKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwP+iCTQ2v5A8BFB994+uR6ObkRQuROQhka2olhq8AetbbXZ11k
	qloJvYmyJMdb2gzuO0vRP8l//8xpv3NXMS7oXDb/FA4OLWSKXfHx48UxGN0fxgKj3Xo=
X-Gm-Gg: ASbGncuDxkZXEIL/uUCKI82oCDXoG8ewRlDLdU30XrzQUP7Z/0eH6vGVUSgMTTa0a6p
	WLkXWq5EHW4q+KdT/ud3QqT8030G+cWZJNlcydJ/XhZg8QFDreETJpd5dXhQUtaM4bP5IVbAy7r
	U0buaoF+a4By8xmYyao+LRUMgLzidbcpkG5QKcVcpS+KFUk7yi1I8N6aRIkKjEZZW0YwGgfMpuk
	y98ZQtLDr4y2I3ePTIst6/gBPj45XOB+5p6uXmPw0N2nig//URHTdDnp05D/qr/fGLRcmxpXflS
	dPaKTW48bfRlSW6NT4jMU/rEFiMhx0Ndd3+11TeBbO4yeUOuAgnn4AczY6P7ArvQ9w/2pkPsTmt
	op0D/8BHQJ1q81p3DPyrw2getNn3cOISzub3afkK3PTcZ0Gzh7hrJ10INVC6aTwUlkQ==
X-Google-Smtp-Source: AGHT+IFa00F5/dr/4CJjlueOFIA5pV3OJea5UsZuFhaXiwjw86cfQMhRrHQfFtqyDPs6JBYJR5sLdg==
X-Received: by 2002:a05:6e02:b:b0:3e2:aafc:a7f with SMTP id e9e14a558f8ab-3e416122d83mr105791125ab.7.1754189908398;
        Sat, 02 Aug 2025 19:58:28 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55b1ac2esm2251906173.1.2025.08.02.19.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 19:58:27 -0700 (PDT)
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
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 6/7] riscv: dts: spacemit: define fixed regulators
Date: Sat,  2 Aug 2025 21:58:10 -0500
Message-ID: <20250803025812.373029-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250803025812.373029-1-elder@riscstar.com>
References: <20250803025812.373029-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_195829_280848_5006C1BB 
X-CRM114-Status: UNSURE (   8.19  )
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
index ae9409fe398b2..a11a60b9f369b 100644
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
 
 &emmc {
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
