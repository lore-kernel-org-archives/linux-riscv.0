Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA53C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 23:58:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3482C61BFE
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 23:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3482C61BFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=snG4RRix0hIoGnIMu+ic1Pbf4frUGbOlLU15ljWXXAU=; b=f0kCHWo07VCLrp
	sZQ1BhUgc9P5TFKlAVn3LGNLKHhxIXR8U/6dkwNF9GZMkn4lk4mu0/xMGBPJUqOB1U0M2iajyiImL
	DpwizyqwuVH7SpyERNpR35Rn9PZvy5EcFkEJWzvC/0phL6aI1bWkij6uukLZwqAHRCcmbAD2fgOhZ
	ElJ5j4NxfcAeDTXVPAxRTn8f79ePY++4C6XUKAFtNeiERrVT8iv13EayarlOPD2OLSMRzO96dueKB
	M+0/w+8viCcjDrDyybB0wBD1cAOJUDIZkEhkJqYzcmkRaEO1j3ED75VhFL9oQv2QP+h5hU6OEaGdl
	vNpIF82Q2cZxgbpXKPXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn8Ks-00302V-ME; Tue, 16 Nov 2021 23:57:58 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn8Ki-002zw0-4M
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 23:57:50 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso890412pjb.2
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 15:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4RnFUnxfyHUhy4tSfteuuuFzNC68zU1zp+2bcst0AvM=;
 b=mtK6FejF5gDDC3Kdl2FWM/nJlfJWiHr1fz+/YcZ8xjSht/F9pICNna6qb8OWPeFRkg
 UF8PhJvQSZ+MAUwWZ1kDpQwxP9I+PVhZwXNLzcaAVfblnVDt3FKpStSzhy+6RwSIn6XZ
 b6vS1usgBDonjcDAEaENxfP2fW+v7vQVOe6DPE4StkthSIrjRbTie0hh4Ton2jAQYo/U
 XqNaH5RrgvmyH+uaZPsiAf/02pKBY4dgfhHwQGP8UXtcAqBRIj33HeAQlhZ9F+QIQczY
 WIVb6GpmAyg5vwi6YpNQYmofNIAohHPdD8dj8Df9TrjA1p2XBTzapbOCB1OLlhFzhE+z
 +27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4RnFUnxfyHUhy4tSfteuuuFzNC68zU1zp+2bcst0AvM=;
 b=1fdTnMpLke3pYdbGN39fYv0GgodOpweIwV4a8S7bSK2SCepV37Bi2sjx6QMeJYVRlx
 m0cC+Ky83eGSvzbc77hRz6c8zEKwvo4vWurKato70BHPA6AISW8Ztd1V9hFr/RtFWs6N
 Rk+bc/CsZbbLXy7N+yUYrniK6ZqfjyQn1DLXEbuakX17HPLtsaCjDMbRe+lVzjpE+KxU
 tuaWvRrrNYNSwYt9+qBMg237xVBnQYyPeEJxtjJmA0I6/bhZ0IaJGove0paGeVkMqmPP
 Tvq8cqRgP8ZkT9rj+WuwBWoTfb8Vajq8VSfGBMZunc4+5u2aCqN2JOAFMvd2Ihs4AGqZ
 K2Zg==
X-Gm-Message-State: AOAM533Ru9QmNayjokgFs1Gs2I+yxngbx8RQhVF+YO9hgNMSNcWRoNA7
 iH/PaDcu+U4RNHfSFQih8Sc=
X-Google-Smtp-Source: ABdhPJz9ehM2+2Q0tVAnzN2/KnBwkPBwfxgX3ToK8L5DmNzTK0gG1mue3l/ZAuv2z48HQuYJlpMPZA==
X-Received: by 2002:a17:90b:110a:: with SMTP id
 gi10mr4012168pjb.124.1637107067327; 
 Tue, 16 Nov 2021 15:57:47 -0800 (PST)
Received: from localhost.lan (p4899162-ipngn25301marunouchi.tokyo.ocn.ne.jp.
 [122.18.9.162])
 by smtp.gmail.com with ESMTPSA id u32sm21005751pfg.220.2021.11.16.15.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 15:57:46 -0800 (PST)
Received: from x2.lan (localhost [127.0.0.1])
 by localhost.lan (Postfix) with ESMTPSA id BE8DB900959;
 Tue, 16 Nov 2021 23:57:44 +0000 (GMT)
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Subject: [PATCH v2 5/6] riscv: dts: sifive unmatched: Fix regulator for board
 rev3
Date: Tue, 16 Nov 2021 23:57:41 +0000
Message-Id: <867fd3a362122eb2a370a7630df14977e29bad13.1637107062.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <bb7e8e36425a2c243cfbf03a23af525499268822.1637107062.git.plr.vincent@gmail.com>
References: <bb7e8e36425a2c243cfbf03a23af525499268822.1637107062.git.plr.vincent@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_155748_209172_9293CB40 
X-CRM114-Status: GOOD (  10.74  )
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

The existing values are rejected by the da9063 regulator driver, as they
are unachievable with the declared chip setup (non-merged vcore and bmem
are unable to provide the declared curent).

Fix voltages to match rev3 schematics, which also matches their boot-up
configuration within the chip's available precision.
Declare bcore1/bcore2 and bmem/bio as merged.
Set ldo09 and ldo10 as always-on as their consumers are not declared but
exist.
Drop ldo current limits as there is no current limit feature for these
regulators in the DA9063. Fixes warnings like:
  DA9063_LDO3: Operation of current configuration missing

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>

--
Changes since v1:
- Remove trailing "." on subject line.
---
 .../boot/dts/sifive/hifive-unmatched-a00.dts  | 84 ++++++-------------
 1 file changed, 24 insertions(+), 60 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 6e7775fdae32..1abad0eec02e 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -93,47 +93,31 @@ wdt {
 		};
 
 		regulators {
-			vdd_bcore1: bcore1 {
-				regulator-min-microvolt = <900000>;
-				regulator-max-microvolt = <900000>;
-				regulator-min-microamp = <5000000>;
-				regulator-max-microamp = <5000000>;
-				regulator-always-on;
-			};
-
-			vdd_bcore2: bcore2 {
-				regulator-min-microvolt = <900000>;
-				regulator-max-microvolt = <900000>;
-				regulator-min-microamp = <5000000>;
-				regulator-max-microamp = <5000000>;
+			vdd_bcore: bcores-merged {
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-min-microamp = <4800000>;
+				regulator-max-microamp = <4800000>;
 				regulator-always-on;
 			};
 
 			vdd_bpro: bpro {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				regulator-min-microamp = <2500000>;
-				regulator-max-microamp = <2500000>;
+				regulator-min-microamp = <2400000>;
+				regulator-max-microamp = <2400000>;
 				regulator-always-on;
 			};
 
 			vdd_bperi: bperi {
-				regulator-min-microvolt = <1050000>;
-				regulator-max-microvolt = <1050000>;
+				regulator-min-microvolt = <1060000>;
+				regulator-max-microvolt = <1060000>;
 				regulator-min-microamp = <1500000>;
 				regulator-max-microamp = <1500000>;
 				regulator-always-on;
 			};
 
-			vdd_bmem: bmem {
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1200000>;
-				regulator-min-microamp = <3000000>;
-				regulator-max-microamp = <3000000>;
-				regulator-always-on;
-			};
-
-			vdd_bio: bio {
+			vdd_bmem_bio: bmem-bio-merged {
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1200000>;
 				regulator-min-microamp = <3000000>;
@@ -144,86 +128,66 @@ vdd_bio: bio {
 			vdd_ldo1: ldo1 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				regulator-min-microamp = <100000>;
-				regulator-max-microamp = <100000>;
 				regulator-always-on;
 			};
 
 			vdd_ldo2: ldo2 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				regulator-min-microamp = <200000>;
-				regulator-max-microamp = <200000>;
 				regulator-always-on;
 			};
 
 			vdd_ldo3: ldo3 {
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-min-microamp = <200000>;
-				regulator-max-microamp = <200000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 			};
 
 			vdd_ldo4: ldo4 {
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-min-microamp = <200000>;
-				regulator-max-microamp = <200000>;
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
 				regulator-always-on;
 			};
 
 			vdd_ldo5: ldo5 {
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-min-microamp = <100000>;
-				regulator-max-microamp = <100000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 			};
 
 			vdd_ldo6: ldo6 {
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-min-microamp = <200000>;
-				regulator-max-microamp = <200000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 			};
 
 			vdd_ldo7: ldo7 {
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-min-microamp = <200000>;
-				regulator-max-microamp = <200000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 			};
 
 			vdd_ldo8: ldo8 {
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-min-microamp = <200000>;
-				regulator-max-microamp = <200000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 			};
 
 			vdd_ld09: ldo9 {
 				regulator-min-microvolt = <1050000>;
 				regulator-max-microvolt = <1050000>;
-				regulator-min-microamp = <200000>;
-				regulator-max-microamp = <200000>;
+				regulator-always-on;
 			};
 
 			vdd_ldo10: ldo10 {
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
-				regulator-min-microamp = <300000>;
-				regulator-max-microamp = <300000>;
+				regulator-always-on;
 			};
 
 			vdd_ldo11: ldo11 {
 				regulator-min-microvolt = <2500000>;
 				regulator-max-microvolt = <2500000>;
-				regulator-min-microamp = <300000>;
-				regulator-max-microamp = <300000>;
 				regulator-always-on;
 			};
 		};
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
