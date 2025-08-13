Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F712CA0EE5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 08:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6PDG6SCiUiH+spRbDsdlqlLyTQmj1xx/HU243bjCio=; b=4NNISD9AKOTQMU
	i5K/5hSRlIcl+3dSp4RYbe0c4/4JnkE0MIvGzxILawBdmU/3mlOYhSWDh7w/i+4W2q/92uYyIgxTr
	iWYBQPc2w6LTKgP91k6b5ln9TdF8ub15NLTQkTT+9y95aZDzEjn93kFVY8tUvqH77mu95BuVlGHn7
	i2KY5oaFCTvHVP7yejrqRfK7C4DJGCqZhoSrQC714rY6yFWQ+6dlO+KPUW0oEe402uUXf5EEGz5HD
	WWa1muyIVOMLbpbnfrkXpgk4sIefonsOim8ecKKtx/z9KEEH47+8Rk1MwbD9FsNuCthZzfLDiLTzr
	1RQkkTr9+W7Z873moGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6zq-0000000D7fG-3EI5;
	Wed, 13 Aug 2025 08:38:10 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6vm-0000000D75E-3i0u
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 08:33:59 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-76bfabdbef5so5294163b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 01:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755074038; x=1755678838; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMX2wwg5qxLiJB6Y+xH52K/4W3C0oAMt7T3m0sUQaiw=;
        b=VxQKf0W5x4JkmKEI7rslZ6kZpcvdDAzcvD1x8XBy64FA5j/UizDjEnJr97+Aa+Fjou
         1fKeeJnR46WovpaAznYNmjvha4kHRaCLxHAes1oeKdyrGE6HWYYZiDrxXjopsfvzMrqh
         HH0vIZCyLDkQSO15WSS9+gLOG29YH5oHT1kkYxCONVZEJHSFPYRLaSAC18seaowo11Pa
         CA1tK59B78MW9Xo/QiOQ4rSHK1FPQfjSjaoeFsec+N3qVHB33VhNLNxboyzPUrGpL0/9
         e8R9C4Aep2UfYsA7NhmjPk3pb2amBFC7WL1gK5i/iqGLcGro3u8SiiYPxDntRg4rJ5da
         BEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755074038; x=1755678838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMX2wwg5qxLiJB6Y+xH52K/4W3C0oAMt7T3m0sUQaiw=;
        b=gVEW9f7mn33iPdMANglJBcwAdP/WErO5dlCydY3koSE0OnxKdOsY7FXbSv60+dVLst
         hx2ke2dewWDoSlbGXzkgZ816RVQ9ZHgmAMLpOjumeHuCRvm5vOIgQ3wvfXmR0FiqGdcd
         5aMRrmr/tozcTKpqU1MXrlDKArPZXaTiHaFtlrhQx7+fYBJq3x3mJ56pN9dOumF4FIce
         jqZ9HZgwqNGwSaTJnHzu8VyYzIe9VwMWCfnQdpdtEy8Bz4GnYiVPGNkbj+4YRBiCtQ/y
         cUJnLZojFbFbmf4Cs13fCo1Sru6Ca6b/m88KV0aDgSVCY64uYtIh0FrLofmSMFGpwxmC
         d0hg==
X-Forwarded-Encrypted: i=1; AJvYcCWredI5nB3b17Qttepeb+jLBAxdhJtKo4+aa7Z6gfJm0xsTANPFV2BkbE6mEeNtsoEFeCgySTCLCFimjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYuTto9DbcEzNHLRsEgjwwgZarQjfbsacnJ3+lIEGYZA2l+369
	cd6uweH5fO1uYnBR7sG7+7bD202dhywl2VuXiKv32gvZSPxUbpX1/oKy
X-Gm-Gg: ASbGncuUtN5jkZmJ/Xqp5JW4zcgKROHaDzcEr2rNFahb5bYhLOEHYIOS5zRZWiE5X2X
	aheE7IPzpiz3uCrKz1XVv59RqKKpfVYBSO579VEzwSP2XldnH8vJ87pb+a3wHG5Yp5ue+cLUY+1
	fO4Lr7Qv4Qva0BVq2AKCU1vDdcmzA3x5BsGHMMreBEsJoAfW9bJ9b8pwI2CAjy2owx3axd7IoDG
	jyht+T8xPD/9kxfJodxqRj4lebp/Ey5yZeE5hh2/J1ioe866QH7h1PWrO/wPi/qNNAcifw29A5w
	VmBWI3Cvq+owghbnitkbFxRAsDnNErWBTVX/Dog78cynaY0xx8nQeGisvXWLDfPXRasPx8n2731
	z1l4T2bJGeS324IWKFySFLA==
X-Google-Smtp-Source: AGHT+IGj5o8hVlE+Dk8XrFfk3mVJEaO/uVdNHOJLV0qytV//OwbV2WeV+n5C+vKxx6Aq4gjkbNqqsw==
X-Received: by 2002:a05:6a00:1709:b0:748:fb7c:bbe0 with SMTP id d2e1a72fcca58-76e20fa8977mr3864511b3a.24.1755074037944;
        Wed, 13 Aug 2025 01:33:57 -0700 (PDT)
Received: from [127.0.0.1] ([36.255.193.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe50c8sm31307814b3a.120.2025.08.13.01.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 01:33:57 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Wed, 13 Aug 2025 16:33:19 +0800
Subject: [PATCH 3/4] riscv: dts: sophgo: Enable SPI NOR node for
 SG2042_EVB_V1
MIME-Version: 1.0
Message-Id: <20250813-sfg-spidts-v1-3-99b7e2be89d9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755074006; l=1133;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=mP87CQG19Zoa2RA1RPyhIuAVJaVjC1v+XuBf7j+Wzzc=;
 b=H7SatGJcG7eupDmrDjtbkNoJnu+FkRemjDVyIyvwmZ0prrLEES4hcDOwL0Tcf4eJqxlpuIAgB
 0BnI2mg9zdUAYkiWJ2yEduyUi06sieCxor0YOvHNP7lZwTTM5D777Im
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_013358_927861_7F00D9EE 
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

Enable SPI NOR node for SG2042_EVB_V1 device tree

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
index 3320bc1dd2c66ab1a77fce719f145070ad51f297..d447d66177ee5c66b12af2d8ca79a22cc920c666 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
@@ -238,6 +238,30 @@ &sd {
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
