Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A111CA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 08:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XF1yTuB+RYXFso074RkPBikfwdrQVpmeWk6L5bwgEMo=; b=QepqlaYDeVSzTJ
	p/rnJQT+RtaZNc0Ir93NM6zUFeJ/REyTA5CsAhUMJKyMRNoL7EdsIrJvvWwkS7Zfz9cHfMfesmGq3
	9v99T+NBNWEfEZ31IU1zJFxKTLcBdYsdhMo3pdibrgr8MG86/WT/WiPFAAExy8pbA+6FiBN/R67d/
	odlrbvnxnM1/ncDOb/008o9xx1ReYcY/Ss95wX/UA7Yn9+F0xmuqJO6nw3Fz5oR7to3uYZRt9hck4
	UVNYEr9QutGEBj6g4GZmgFd4yVgBKD8ZJ0nylww5AWT4SezRV4RTikVvAGIbHb15926QFQ/nDnIRS
	NTFq8cbvYTdZThCaa3/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6zq-0000000D7ef-0cok;
	Wed, 13 Aug 2025 08:38:10 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6ve-0000000D73b-38Bo
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 08:33:51 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-76bee58e01cso7541391b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 01:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755074030; x=1755678830; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wq2k+55Ab73eX2+RWOpVJZjXZGzL72LB3pCtHrAjwhQ=;
        b=Qd8KMS80tEQU5GAgy7luJkUKF9dzeeseci319wRE0E0RCIkbHmizlb4GCKxaNtUUvO
         GxlDi9u77LhKiOwx739fBxmshJV+3ZD/dWKg69kipFTQqVlUId3Qr25x9z7Wcffk1Be+
         HZyJzuHivTG3FGOJjKyz43iYwJrCp1ScJdDBdcMXwOVBMM2ZG5XL5SdrJko5O6FIhzge
         hEav4b1FjkJOnQXXDvQ03/IEq4pfhzdFOBXcMNHijBjI+5uyCc11GVuX2kM9MawBiqBg
         5U/2wSHvbU0AhTJY0NOgpkc/xasvU1mraw5eSliNSKZ/9xRhTtZ/kis06Jymqv2CHohe
         Svmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755074030; x=1755678830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wq2k+55Ab73eX2+RWOpVJZjXZGzL72LB3pCtHrAjwhQ=;
        b=b2caubrjpSg3xa1P36waE1/ROeIn+6129ptwZaIN830w1JZcF0kgSOvqBvyFofHu2d
         OkyMQN2TwLfUNxCf0WCzmiR8cxjgoX2YEqmj/STOv4CdTjwYUxsropShGnWLBVjCg4av
         1VR7/5KeXBaM/O+Lp0YMqJjyMgySvU4GMeDuKgW7fPAQXTjwptOb/BsIGi168yf0mK2c
         l7D+nT477sD6qcoNN61deJuS0Up86XR6kW5PVqglvDBThyH4CcvxJhTJChw9XvYbZ1DO
         HSUkx/cLc4c1KFlbtp3WEwPntVyg5ZE0cJH8v6kjIXaZMiGxxDYYXGb5J9MlTT1MfghB
         0DUA==
X-Forwarded-Encrypted: i=1; AJvYcCWhNNbEdJoEKWNQnGYigkIr0GP8OxZ3/H7a4PB8PVikztOyhEqGDmohUVE/wkABAkkxVNXKv4FlzUqlVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDrrADCOwaHt3I83Erh6UmPPPobGCWfSShIsjim6vJOB4U1UGR
	Z/euD6HN50OYexNilGisfovoyyfkEw5m7ftt6PSB2b5svWhCxhr2ao6n
X-Gm-Gg: ASbGncsi70ZPgdbkGiZsaFD0CCf1CzvSEYmaSxANXkidy9FraWMkffM5kIn/hmYX5WV
	qvwzMn9LWWiAyj2Fsdd4+x3+gdoh+ALMJrcM3BDdh6SnI7eGJlP3gvVlBHy8ImcBB94RtNckNnW
	eSmS1zbsxIOlTrn9uJzMG3CnuvAXGh58roABbWbsIFCLF50DePAkFMLBjeyxVDeTBnrAT3Bkcpz
	wuhCjStqZ0k8jmQB+V+NqARacyT+iyw1pCTAXLP30L6u4XDhOrnzg5+50Dwd+dhtJjZBPG3/WoI
	+8/RVvmlXPfEIr/r/5sKkIXIOm7nnV644dOJGJCaindC+aKsH4oKvv0AI0h7QwBfq8VVGGX1teA
	W2zOnPN1/394QT5SLWxd7c1wwMdYc8Wem
X-Google-Smtp-Source: AGHT+IEfk6doVGoDmRTH1HGierQdyb5DZdCYmbzXWdhql7JiBQuLlcrHvNdWPaOoLf3yIBMJIUCv3A==
X-Received: by 2002:a05:6a00:22d0:b0:748:ed51:1305 with SMTP id d2e1a72fcca58-76e20c9a175mr3054927b3a.5.1755074029634;
        Wed, 13 Aug 2025 01:33:49 -0700 (PDT)
Received: from [127.0.0.1] ([36.255.193.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe50c8sm31307814b3a.120.2025.08.13.01.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 01:33:49 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Wed, 13 Aug 2025 16:33:18 +0800
Subject: [PATCH 2/4] riscv: dts: sophgo: Enable SPI NOR node for PioneerBox
MIME-Version: 1.0
Message-Id: <20250813-sfg-spidts-v1-2-99b7e2be89d9@gmail.com>
References: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
In-Reply-To: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755074006; l=1215;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=XCcBhLdQCV5TovEOw9nFA0f1JDSfRAWiRcTxRItdr/c=;
 b=ntXtnj33yA6oSILDv+mHhzb0RrZs+vQ3X8WLAWJ2qXI8BbQZNK0ALxACU+7Yw5qjMlsGU4O9c
 BNYcHJXWHiAC43XNWIS/lhRbb00r/RfpONJEI2RksvXUk2DVRkUahPD
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_013350_789887_78795927 
X-CRM114-Status: UNSURE (   8.29  )
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

Enable SPI NOR node for PioneerBox device tree

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Tested-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index ef3a602172b1e5bf3dcf54a8cacdad5172b7f50e..554ec14d58453a44a02a82da40a7aedb80d61dc9 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -138,6 +138,30 @@ &sd {
 	status = "okay";
 };
 
+&spifmc0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&spifmc1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_cfg>;
 	pinctrl-names = "default";

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
