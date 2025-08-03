Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE5BC87FD3
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Aug 2025 02:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLQOT3cRtegqdOZu4QetuOJyfZE2lwx1MO5fVzyBzHo=; b=Aw4yhyqZDtcRZa
	Y+trmvnceSi3y3UGao8qd+QEWzlJ0t8OPYlu2K8sKc6Khm8bT5FRbx+M8I6BQa59T+RC/o8tDIFKS
	FL+3Hg/lJrPnt/JVdbg/ov1xfjqzQ8p/FD3E9hxRDUIXLyFABV3Ed+CuFWqL9W6dxyt2Xz7pRizl8
	SEKUGDWdifu359TWURkH+jcut2V7icSFBYhI27EZV95VsGhufoE3tPMUKaQ6V6njDJrGCOkOqrXWa
	4lDs8HJ1uHcSVrqZuOBunkTlekbom2w6gxp1THYFD4jQbPE5CqS3b+r6r5aBksfFGwO7Bu65KF0EH
	Otv5mPhH4NIGnc50jO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiOvh-000000085cm-3C3y;
	Sun, 03 Aug 2025 02:58:33 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiOve-000000085XU-38Go
	for linux-riscv@lists.infradead.org;
	Sun, 03 Aug 2025 02:58:31 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3e3ff43383fso24443655ab.0
        for <linux-riscv@lists.infradead.org>; Sat, 02 Aug 2025 19:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754189910; x=1754794710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=VOWEn9dEJbKa1wQSCtj6qRDR6wLZtcAk1CEeDUPUWzpXVW4Qqg+UQvIxdA5cnRHGGv
         qlXyJ53Fkaj3t5Qf4p/mfUIB6emEJ1es0CERwE/iuLWbXkebUfs9WAur9E67ZBGNcr+F
         Fpx9sR/WC/+iqgS4rFEDEyacuKOsEofgba6QyDw6TdzDcBw/PnkGQw+XHV8H/QZ6ieFr
         MQEe4thp2TUhZu5W7WjKfLLcanT+rr1rr0u+5/1ZnGMdOlN390POcnF7eIDu3JIHd5oh
         82Av4Yxo5T1IxMAsnLxIH4g3ckqsaCITg0Hx2NPOnrVmENi6r5rJWxPMq+56xREVdm5/
         IY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754189910; x=1754794710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=KbZsaPr8hijcUx8MVvzzHJnY8V1BVoQAjOPjVpJzvyA6IEJydahBGZCrm8QBRtk5EB
         RxoYEKkibDFz4YrEk91NZrYvhILHjm0J7pIOV1MppyAaOdZ5Y4BFtSh46Uml2YMhK7cz
         835GkUnPcA6ihYtpEi3FOotp2m5BJyutgXQZSpY69VxIDKHfOeP85oA/jMSUVeLikvMi
         3dsj3dxr7Dxg9rDpmAToK+XhPbbIxYqEy0zmXKWyNEoCtI5P1kLtqF4g7oMQlj+3dlfx
         8uoRMWwUqytu2Whu2o7AazZCZxBoOfPp84EpkBKtjUlrXilydkXwOQ8M/apoYvZWS9ns
         PCOg==
X-Forwarded-Encrypted: i=1; AJvYcCWoIayj6IjW8oMJ9RiPmfj2JLtWHGAQrsaILpxEJa8ELPK+uG45+GMKnSNERqxaqCD4JsWfPIaTrIEIeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxtTtqRcrzUwTCTAEvJBiHZWjdUfM1zLT59JEQDiXTFiDm0luI
	eVAAF9RCC6Bsfv8toAv42j4AaLpSKPkNX1AFP21duUBnV841MUcW9xeu+7U9VFCKSzA=
X-Gm-Gg: ASbGncsb7Vgjhpci0SV3SnmWjqdW6HQzdQjc9pPMQiA5IV1G1+DxNqu+W9VHftnsgTd
	btXLQhuQO4GhNhtdm2SoQV3JfELmCXBrdZQn4il9rAUus+E8mLSQS0n/GT6+BcSTedGKu8J8ZRP
	ZLZbYvKe0MnUREf4FGcMkEdyWYV+ceJ5SGTfkedwLHBjAB0FAu5cP2HPUL3T/dgeUjVrmoctozv
	PUHdDD2VaErCcDgUxU3EUSmlRCk5mjGJJUlcAlFDQOkOSlw3Dg6rV8LPh+/D+ny9LqWhtRcpNkq
	+0+l+LOVB3o7rFBJOsluMlnbnNirsm41XKL2cWrswXYDybWpkFaidL9QWoHiYHI5wi0Y6M01VZd
	DGdMeWQmuV9zGv8lXvqL8KNM29CAan0MmrkH+OS2/wgAQm9k6LtPdklkJ9ZrbSqfZsg==
X-Google-Smtp-Source: AGHT+IF+PU1Ww8JQGqYmDAP1BywlMvxMvsGkL0JMtzACHATEhfoG3q29UZAUTYQ4U26WEgaiO5kgRg==
X-Received: by 2002:a05:6e02:32c1:b0:3e2:a749:252e with SMTP id e9e14a558f8ab-3e416109acdmr88472255ab.4.1754189910159;
        Sat, 02 Aug 2025 19:58:30 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55b1ac2esm2251906173.1.2025.08.02.19.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 19:58:29 -0700 (PDT)
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
Subject: [PATCH v11 7/7] riscv: dts: spacemit: define regulator constraints
Date: Sat,  2 Aug 2025 21:58:11 -0500
Message-ID: <20250803025812.373029-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250803025812.373029-1-elder@riscstar.com>
References: <20250803025812.373029-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_195830_792200_B6CC75D6 
X-CRM114-Status: UNSURE (   7.94  )
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
index a11a60b9f369b..a9a2596a94e89 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -68,6 +68,110 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
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
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
