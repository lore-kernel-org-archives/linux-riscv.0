Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A10C83F09
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 21:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=leVC3lNKq9GrI8x3a+o37IhB5PAqCXAD/IqVN6J4ZnI=; b=RVNp00wsoQxITm
	T1FotHE86kVBn6j2BgJiQiuyHBRa33y7wKausnR9Hx/24bCfKPxwmQ1HvPItpUicpw2S+2LD5m6rz
	0fYM6fOhgbgXPdMbCH3gcijccLR2o+JYLQljtgODJyqhXsGIWYmce0jVFXB/rvma/2JvdLMlZkHA8
	BKijDvud7QuNHfwYOJICkY3fMlyXxnxv+phSDeYiTeTaewB2/gqPH3ODshc89t2o/dqyLy5NFooW+
	YoPeIdpQiTXzJVytygUC6CFJtDTswYD7P6k5T5OK/Fs3FotuqvMevMX1PH6BfzFrLkFyjAVOp/4ms
	Ikyre5hc7HTKt+gMDOFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX58q-00000009bgh-0UXz;
	Wed, 02 Jul 2025 21:37:20 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX58n-00000009beU-1Ehi
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 21:37:18 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso73517986d6.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 14:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492236; x=1752097036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=cIpfgANt6bJzdwdCf0ol6x6Ds+NxtSvDDHaJdSRJqSi5FH0m8iUTPh0nuXGwfIfUlk
         rKHnbIa9RiFbE8D6kZ/OsO4J8ADtHwdqGHzmJBp98aVQ06TO4ojuH04I/oTZYWCN40Fw
         w5RJqiS4ftRy2ae5RcU3y5ipCVzj2JYKiJWSxhk7M8PSTwuvSexa64TgNq8XaQTgFsMR
         Mwn1QSEGFFC7x6r9Ina8mvlrJRsX5A35DQQzDT0yo4y/m4H3AOsJ6AqUuEbqdeVHnFx4
         5QieIV1u5RUsUuS/zE+ksV6LSgOYUG8QB/HteK3uyFbWuUV1ppxA50pMARzvAV2SbcQx
         NxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492236; x=1752097036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=LiwVChwnVtfp8KEOliXWgIeOOXIm/TgvTbGm1fPyINgwQC9XWMF9TibEPNRZpvwH86
         dls/uhNqVBMfGDJGjatI6QekmY5fNEvYprT/w+G2vF22F6EVi2i8bQSNEmHn/oFXQPAE
         v4fDr4gxf+jlFlbFyaH/eSOzF91DPXudxuwressoByu+dqTS886l4a/QkuHjMZz477tj
         x2Eq+8kie1hZ8/a2C1LZlawIecvVF9yX4EcGcmVP7jBDFeWJzskCvgftdI/mr8mHEMYs
         jPelAGjVsMnfrHwBp54/X54dj2h384nLR/1U8zmG0MwhGYx/snWKRtdGcZd862q9gRcq
         pfXw==
X-Forwarded-Encrypted: i=1; AJvYcCV4DtkmqKRAiBALjL+zHPDJh8SqIYR+zNUld8y0BglvMc9l71yJY9yZ3J9VjeEXwDPIJtv/saDCd5dpLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKzRPn21PVT9eiEaol/kBE5kKNpivgENADRwWv03e284MX07bb
	CMSuoEVTj5/AhRz8fKsVQtdgdrElZz9APRI4KEjKvYza2Ve40EaaAuGE4PqC8PqX1T0=
X-Gm-Gg: ASbGncukGyUpI7RphTJyQ4cJxlqhKxwzYPKr+0Gi+Lg29kqJreKopGmANfTWeraX6xs
	mFj8/HoahXSpOvwcwBDqRmG8UPztBQW7LYqMs8kmI0qQTYJ8iIHM5jWmlNp+AsNzQsCQKll7kHP
	3jDAADbRw6+Fy45JyRZq7t5sed65ljbI/+bQ26JuHtKwdqYxW2pA2xI4rC234Mbmrun0K+aPqFH
	eS/BTd7IbjZPjqFY8WzUcom+z5pL/KzJfqqC2Srgw6/+WkyhbIT3G+xpwyOtf0nHETGebQ4iZ2H
	taI4L4iwCCSBV9itJk5ESteyS+4HalED4rW2611ivGwr11PqkgR+KIlC/BtgSQ/bLZGOFWlVdkq
	xDtCpAqQ0GTdBQ+Knb8rubPcH8SWDaix3GDo=
X-Google-Smtp-Source: AGHT+IFxV9+ZN7uJ4WMWxTezGcNNpASYTQcL8SVuNk4Fu4L3dpgWRu5GuHXUlmrOxNtWzLXL7lsjgg==
X-Received: by 2002:a05:6214:3da1:b0:6fa:c31a:af20 with SMTP id 6a1803df08f44-702b1a53271mr61275056d6.5.1751492236287;
        Wed, 02 Jul 2025 14:37:16 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:16 -0700 (PDT)
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
Subject: [PATCH v7 8/8] riscv: dts: spacemit: define regulator constraints
Date: Wed,  2 Jul 2025 16:36:57 -0500
Message-ID: <20250702213658.545163-9-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702213658.545163-1-elder@riscstar.com>
References: <20250702213658.545163-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_143717_332076_881C5090 
X-CRM114-Status: UNSURE (   9.00  )
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

Define basic constraints for the regulators in the SpacemiT P1 PMIC,
as implemented in the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index a1c184b814262..83907cc1d5ccf 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -70,7 +70,111 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
 		status = "okay";
+
+		regulators {
+			buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
 	};
 };
 
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
