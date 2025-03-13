Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7507DC282EC
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ENKeZj/s0uKXsxRUU2BivnOfg0nun2Qx2h5nc1+JERE=; b=TdBV07X/KFKLCE
	8ZoHw7jKcuOiyM0dDjQnntSniBD1W/2CEU4/R3kMmgGDNU9Pe9uPK16Un+jQHfJW+zLHZa++Vznxu
	7ZKNwGAed1j3JiKB3/18qowZclAMGj4wLS2ydu69ZO+HjXPuW6zC8PppS9zvvI1wvzZVzeEhEqSBe
	G4Fw9r+BX/tVhMVMoa25Mt8jSxmMULZnDaLUgMITHL/ui8VV9MrMeZk75eTDc9WPqyujsOdFbgJwN
	JjZtYv7GqSHoXN2LFvQ8ILDNPud5nwUGQisfXQviW/D3dFK/2LOQQBtV/jIXacExwrMN9uaqqheRT
	EVIzsl/cOh3c2kFihX3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiM9-0000000BLth-18uY;
	Thu, 13 Mar 2025 13:12:13 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiM7-0000000BLss-2GJE
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 13:12:12 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso1759355a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 06:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741871531; x=1742476331; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwYK1vtIGu8AKr7d5DZZujGnya4yaossipP8/xTscq4=;
        b=OPP4mW5yGMgnkGLAneDnGOqdbmeTu5y6hBNEjWvv/3rJteUIAopM0RKneWQ1hL9D26
         yvHmzr0ckjFMp3Q2Lbicc01b+SPf16AzAR4vyTCRh7K/YYlyiRF+/oXLPhsyPs1lmGPx
         ij77XTS01xF25xyznu31d8CUuaw6x6EVQV1IhgQ1XpWaSdwnnnQaKF3gbIa7dg+uVOOW
         nsgt36+4r9LJX6FycthxiZ4wxgYVzNAqTs/+MRgH/XkNSLoT1pSQoYtfr3npkTCZzh+U
         Njgkhc1SqnARznTQ4HMPRa4nuhCIe/OtiTu5EDLnKAlmAbcz13uT7+Q0tFsVPRyFKg9+
         5n7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871531; x=1742476331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwYK1vtIGu8AKr7d5DZZujGnya4yaossipP8/xTscq4=;
        b=QzXMycE6TltVJiBJTxWKTfDhlCrpV6DNzDUuFT1qxzC1HUaX2VBeUMD6ao2lWqV3en
         FXiMGW7Q9/SR/Tr3cjapQGrIgj20rDUapU+C40YjoFuguJBCMe+sItpk+QGgmFiYgHX0
         RBFTQ2d7FUZLBtnCFF5Xx+OuDauUIbyANYZjuGdM/UiZVQuMjD4PJ01zi02v1jgPOGZN
         qmgjCwWH42seaw7allHQK3+jnw89ZRMGTRFVwr1qKDZj8DvNQh4hnk090cPCnGHCX7aW
         CuoyGuMqnSzy11UNCoFThAmZP5LMODGEXehwjh27sgOjcfOj1v7OoXcufFuXSQHFj+kY
         DQNg==
X-Forwarded-Encrypted: i=1; AJvYcCVDazK0fiv/bGTIdKRKVdCCpkErmZvTlSMNoymHu9knhVdjk+wOEijo58pUHD/sMtTgmC2eFbaMuWWe/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpaHTyFwuoMX4EQ5jHrQEpU5gYWjQtkC/JTGaGW252CYD0DkNj
	aKt3bfXU0jv5XqRL5CxNofnGOEC014AQKbR5zBBM62gTGjFOpo85
X-Gm-Gg: ASbGncskOPQZbO/yJlDeyGaUUmRzWwXBx8n1YKngSdL0yvrCxPRF3EJwlAcybu85kiF
	Qbdt2Gd+oZD5Hv7XxaA0KT/6aehRzz7nGMAuRQ2NxrKaK+zmrzsxFfuA7nGekL24JesasiTw62C
	49E+vN9KY6HTtfCDk+xz2/AcMjxEXp9hbZdpyQfjErACdkFZtcA+dpz5NUXxN5QVtOlkWADVseY
	Cm5ZLBhjUgdb7ySkmptz+v9KNCB/2fR+ivZNjM4L8hqPRujim4S02w5EQkBytKK2GSLLmxKBSFs
	oooVsourQfA4y5VrVs7/cpI/hyspmjoy/OI=
X-Google-Smtp-Source: AGHT+IEgH0CG5aSgef06SzCJvmgMptc8klfdSuHRJlwjKBRgnlA8cLsLiRUzsG4uJ77t6uFQlEZL9Q==
X-Received: by 2002:a17:90b:4c48:b0:2fa:603e:905c with SMTP id 98e67ed59e1d1-30135e7dd3bmr3491447a91.2.1741871530193;
        Thu, 13 Mar 2025 06:12:10 -0700 (PDT)
Received: from [198.18.0.9] ([2a0f:7803:fac5:a7b6::1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d52sm12539615ad.116.2025.03.13.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 06:12:09 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Thu, 13 Mar 2025 21:11:50 +0800
Subject: [PATCH v3 2/2] riscv: sophgo: dts: Add spi controller for SG2042
MIME-Version: 1.0
Message-Id: <20250313-sfg-spi-v3-2-e686427314b2@gmail.com>
References: <20250313-sfg-spi-v3-0-e686427314b2@gmail.com>
In-Reply-To: <20250313-sfg-spi-v3-0-e686427314b2@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, chao.wei@sophgo.com, 
 xiaoguang.xing@sophgo.com, dlan@gentoo.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741871512; l=1436;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=9w1ScaeSlWhq6L0g6c/1U2BXB6YORXYaIQ7F9hz9/qY=;
 b=y6IxyvvuwFXWUchI1WelHOu7+mju3xNDsy3WvdI9VAq511ux6fzKK48wfDsf6hrr+pVYC/vJ3
 fD4fM4zDZdgAqOqp0ypkHLmYA1Iz+IPORpPRGe7/8lHkv6KavaPjD+5
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_061211_581488_64F5D7B8 
X-CRM114-Status: UNSURE (   7.32  )
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

Add spi controllers for SG2042.

SG2042 uses the upstreamed Synopsys DW SPI IP.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51ac55abd922b5ef796ba8c2196383850c4..9e0ec64e91a2330698aea202c8f0a2ca1f7e0919 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -545,5 +545,31 @@ sd: mmc@704002b000 {
 				      "timer";
 			status = "disabled";
 		};
+
+		spi0: spi@7040004000 {
+			compatible = "sophgo,sg2042-spi", "snps,dw-apb-ssi";
+			reg = <0x70 0x40004000 0x00 0x1000>;
+			clocks = <&clkgen GATE_CLK_APB_SPI>;
+			interrupt-parent = <&intc>;
+			interrupts = <110 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <2>;
+			resets = <&rstgen RST_SPI0>;
+			status = "disabled";
+		};
+
+		spi1: spi@7040005000 {
+			compatible = "sophgo,sg2042-spi", "snps,dw-apb-ssi";
+			reg = <0x70 0x40005000 0x00 0x1000>;
+			clocks = <&clkgen GATE_CLK_APB_SPI>;
+			interrupt-parent = <&intc>;
+			interrupts = <111 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <2>;
+			resets = <&rstgen RST_SPI1>;
+			status = "disabled";
+		};
 	};
 };

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
