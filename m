Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D30CAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 13:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzQUnHKre/8Ae4oMvtp8qjyLgyISipmu3+WvZ4kRGrs=; b=c7k5NVNq3/WnWE
	OYDBhntCwg8SJWQY2nbR1RxqJNeSUDZNyu4PhxelpyOcgBIF0akXEcCYMQ79kD3YXiTCdBc/wszov
	0+OwolH4CWFFswXF1SECuBVGfgdEdgpzU0M5vgg/Dzs/iAWX4nvnbpQW6y6TnsCsFx1+v2DPLiYj6
	T8/E3VgZ/4pOzokiaoXL0yHv/jqVLFZWHMRKvoeiQkLB3B8BSFbq9eoLMlwNJ+D4RvjJlNpk1+NHe
	jvTGc/VFAjUDqhz8WpuG7fpczT2BjfAzcNfH/tWtLEtSNLjbPEMKGX2Yfe3necwx6s8gO1yBAg9ib
	4qM2g0a83VX053fLVWVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVeL-00000007v95-3FVw;
	Tue, 16 Sep 2025 13:23:13 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVeI-00000007v7B-3D3G
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 13:23:12 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so4337734b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Sep 2025 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758028990; x=1758633790; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWMqq9LO02bLf8s/U6m0bmjKdBTSQTZetwyPUYJWXY4=;
        b=H0cXDX2dwDwA2Ti1o9rCx+KOvzwljMsbtqwvlSnylmucOYNVozC9SH8knwp4jk/o23
         c75c216KwcOWexvRicFI5VPExS3RiBjyI8LiRBFER29oBM0D17iojhYW49kZ1iZmqaju
         DXFd8u90hcisnI5TLo/JSib6UXUd0N6w1k+MI0UffmLvjLHO1yREWv5Ru7KifLqMaay6
         x5VTKDn+mnY7GowQT0QD513SaGJD9MCDUOUlgQCp785+1MhI16CIDrfKejHfqljeLmKX
         6zbi8gAfulX76UkN2CZuU6tbHTSCRIlyWxyC2ad5/mRQhD7PMgLZ/90AvSQzLX0yQ2dR
         7eZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758028990; x=1758633790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWMqq9LO02bLf8s/U6m0bmjKdBTSQTZetwyPUYJWXY4=;
        b=XNkBhdI0zHLX+GI86pCsy4Z4Fr/UiimZHfvdf7Ib0oeaSNvVJ5lSGmvrqLhvfufbE9
         iY0FmBWS7dDypLMu3SIM+oHJYDNwPKbkZ+qH4J7k4C9BM2V3nUoRzvVOOFehoFpqvJKh
         96RqvNKzqYAPLel8BYaLtSQqYUNUxaKKhDuxCNq/VyenBBZnqU0fns0GBOKenls851kQ
         YOGZ1ZJJqJg6TZfL5PMcDamF6RmRQt5MqbC3mukd+7fIm6Cuk3uCSO7Pw8UeVti0WleE
         1WHBxRsqsAww/fYpsLQ+w5f+wmL6h7mnEDZyUZORGMAPW1K2BtQfSYyrnXV9dvNE0bO9
         QBVg==
X-Forwarded-Encrypted: i=1; AJvYcCXBpM4gnCl9hkf0ROSMMV21V3SooFVUTxkP7f9eEv/GDsZDLJWTpVQMXUkJuBfBkmGCSioYxhWEcZ/STg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfUlSAlRoJgRSyhVt7RHccVg4DBJVqMuZSlSctRx8K/cfQLpmt
	94Y/JR0MdC8mTpaJo/VP1u3d0IYN5zzCY7jLlG0AlHOAAERuPYPHdrof
X-Gm-Gg: ASbGncsdyb07isj3MTrLnQrjZgOA4tvfO7fbG8W9S0yFMbJgXkqujAfN5cW7u3EWDZ1
	8hN0dh0iDseKSZPDonVrM5XBKjCzu96zOkc5YEjS8UveGpYTZk8SWSpsSt2UHUys0GdbS02gTqw
	ZJ9fYQz02wJo7svT6mVhpAzNrstHtCXuPt7/sTb+xm4Nh2Y4CFbCS0A9c7lGe7WAnaPEQhoSpLU
	eO4VzONSwVNNFGRnP5B43LeTT4m8n4WeTVYYV8Gl2L5oJvSuOLH+yy9pgTM4OvjXg8QAj4mVMzS
	VW/8+2yCJNfexcZFvP0rmP/X+l48HaQ7HVKDp37Zm68wkTzbhZq/2Iqt4K42GwAFBfAbKrR0XV5
	K/cro0BE++GPR9OaL8EKojlqzIuBcIw==
X-Google-Smtp-Source: AGHT+IFXpFj62OZ32vgpqEl0jm4rS+hTk4dVTJ7qY1Ii9cd3iLkjwoIHMHjRDgvG6v07+neosQb++A==
X-Received: by 2002:a05:6a00:a8a:b0:771:ec42:1c1e with SMTP id d2e1a72fcca58-77612168e3emr16052303b3a.16.1758028989635;
        Tue, 16 Sep 2025 06:23:09 -0700 (PDT)
Received: from [127.0.0.1] ([101.76.241.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7761562f25dsm13277310b3a.74.2025.09.16.06.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:23:09 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Tue, 16 Sep 2025 21:22:52 +0800
Subject: [PATCH v2 3/4] riscv: dts: sophgo: Enable SPI NOR node for
 SG2042_EVB_V1
MIME-Version: 1.0
Message-Id: <20250916-sfg-spidts-v2-3-b5d9024fe1c8@gmail.com>
References: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
In-Reply-To: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Longbin Li <looong.bin@gmail.com>, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758028972; l=1276;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=3DhmzJSYRDsFCvFry1NGwCNmIuQHA8Daa9KPGiMP4XY=;
 b=OLm66401v2Yc411lYVRBOoQ+/JCntUIWLk1Znyf/hX9gSFKbuT59M3tCILRkKSEjEaaHjGW2C
 dJTZ/jmXKq1Dwveckan4KcjmhHWTbAuLhHVnTO5XbTGuox/oBOZGp0P
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_062310_813044_CC2D2CC8 
X-CRM114-Status: UNSURE (   8.20  )
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

According to SG2042_EVB_V1 schematic, SPI-NOR Flash cannot support QSPI
due to hardware design. Thus spi-(tx|rx)-bus-width must be set to 1.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
index 3320bc1dd2c66ab1a77fce719f145070ad51f297..517943696eb464d54d42018825f02a48c6ca00b8 100644
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
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+};
+
+&spifmc1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_cfg>;
 	pinctrl-names = "default";

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
