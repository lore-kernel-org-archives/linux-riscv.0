Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38B8C7EE2A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 20:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLnYd2l0SYd5PEBSyxG1BCWfIaWCYwvx90rgFUEeVLM=; b=ncVDSx26mDhV7p
	TOPHlcFxBvhwz4ymGzFbewuP2l1P7lek0SboAdlo9qFhKgwipMXj9mUHXjkXa9rUEG2/JY9JvKfAU
	DUiNBKxCvyhuuz2+EyyXzIpztiNBsxtWzRMhEKBZdpz/ELC3kysj1wzaqs56jAHuQcogsrXT7wgwD
	eMrldeuXLjXYHq2UUSdLJmlvDs7d4W6v2xQxnrMowD3UmuvvRo/suUnSYm3cVyVSmqmXEIk0hUbJp
	ubKGb0bU7annMQ+QIjh3OkcniRAW5wxuZPh4+A3dPg6ZKwOdBqDpfwUmMNTuAV+wwKs1Azj8QKzLq
	hGU5v3cJ/SlTsv309LyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWpd-00000009r2e-2nqC;
	Wed, 25 Jun 2025 20:34:57 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTBl-00000009KwG-1VOi
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 16:41:34 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7d402c901cbso4246285a.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 09:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869692; x=1751474492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=AuxAQBvR3pD+NSOy6okXInZ+HD2cy7Qs9waSDOlB2qUxGiFXH2R4trPks72DF+xD+0
         KDHagIIPjaMETrrGsNI3oEJwccA3CJP+06+NQBErm2wLZqiYvA+rh667H6SUldVvs3dy
         3P8kno9cCdxN8saMse8C+OJN7iwFwuEKdxXAmxRuPMTgaFJCQfBRSgxdC0Jg45j5lcXU
         1lkfE4QglKT0wmX47CvoyXqRtziaOv7J44NhVn1hr/iqG82js2UfW1qs7sxhEBAGE3TB
         +NSJiYx6bihsvNNjR+SmpMnUz+9veV2paHp1vv7McNNBLqG5Y0lH9N1bb06QDxJJ/YL+
         CqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869692; x=1751474492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=luuKbAgJpv1NRGyfVLtBgX3ys9jLxDjECTdJFbTPKUK8lw2hNBYndWpmHS7YrVPMOU
         43UWNtbfD+bhJ1xMUWWPH3nMmoQ7Lak3y68CkwXZ2F7qBFl1aCok75YAA0yAqhvTpqbE
         gaQJLFHn4wYkAHaPkyj59lQMZZmo35TFtMHWlryODSYxqxgrEtpEIvXHukw0aQ+Jv3x6
         46rWOVfaHgY0DJGsK/IfbpCy/WUyLw64moj2Fr8/HqfW6SqpH5/B48Fxkq+TTHnUItl4
         AkEKnq2kt+P4TRALZrUrLJqpomzsYzFbHDkBgLTZGdKlVvJpqh7egF6GqtNxQVF3oHBq
         NHHw==
X-Forwarded-Encrypted: i=1; AJvYcCXkTU/aOLWo32jFYkAcUCcHmksiz5DppXo3Z9DVi+04ppsXSyALqE9vAot5c9S4HVVOH4qjSNO36zbfHg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl+ATPHZt2DoyLckHORYzSxHLCAqLl9PnQFvn5dA3Lon+ZR0KW
	SesGLJ+CHIUHMSl9FHEpFg6y3LPXVysr6ateapddupW3zzCCmps5y/tb95lpFiKmuKE=
X-Gm-Gg: ASbGncv9of4E+4Br8YGVpkT1lUsNmXIuaEOIs6uIKi3Wq3pwW3FutxFju824wyvxOHo
	C2VsApAKz9rbhvzFk+uCBd1HlC+DXFPaJnF9ys7utIm1VvulGr7t8Yulo7+o/jub50JtYRfWfjT
	kk0ZpkgGssyuPV1zjJZ5iLOELFfcDdhKQXdzysv2nTiS1s1Xyjq+Epz2YQnST5hSxjeK1lHsU25
	rgQdY/ufFVcrADOBsT6d0dGBp4Z2Ky2qoKkd4xyxflyqaZB2ZxdDIK+J8WrPNcmyGhSLU5nfuXV
	Nto1+wFf6+zMfiS9dxxNZRLb/WyfG4GBCsCOUXsc3D5rcPbjgI+ow6L7jdAJ7VrGAGkZzHgDO4f
	xzS173XQqP6R1+2YnKhhqH6+Vbk1kcri+XYI=
X-Google-Smtp-Source: AGHT+IEwItQMBBDI1vzRkKuMV76VC7n5WgZIJe9oGLx0Xn+RTJyLSXPBEu2hmGxf93T+cVf1NqqyAw==
X-Received: by 2002:a05:620a:3186:b0:7d2:26e8:d186 with SMTP id af79cd13be357-7d42971d918mr638041085a.36.1750869692268;
        Wed, 25 Jun 2025 09:41:32 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:31 -0700 (PDT)
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
Subject: [PATCH v4 6/7] riscv: dts: spacemit: define fixed regulators
Date: Wed, 25 Jun 2025 11:41:17 -0500
Message-ID: <20250625164119.1068842-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250625164119.1068842-1-elder@riscstar.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_094133_394780_3C3780D9 
X-CRM114-Status: UNSURE (   8.68  )
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
index 7c9f91c88e01a..a1c184b814262 100644
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
