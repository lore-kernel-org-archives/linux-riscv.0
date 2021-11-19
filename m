Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53427C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 22:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vDC4sodXJtj1MpmjbGLi+hImkQEqgi1jpqj/16k/U54=; b=bcazO6wtFW60vr
	zfqoCr1K1vK8sNjVKCOFfsGjzwt8TvOWk/mlGpXvEcI9am4DbQVWsyWJq8KXnpDmGr0b1dS2lLUtf
	ZCU1LrUblrl7GVOzSV+qB+1gouUgvF6IUw8zIv3Xtz5UeuDhmdkKue4hw0xFEBZMIGV4UjqI0s27O
	NvzPHADni9u5hsfYprajePWigy3t/rzZjMm3oWdknIOehj60SHk4eSjgFo0xrrz9Be2PVNWGMyOp+
	7swECDE8fqJynkEf1ToJzkEllgHgWPnm5FbJDI/Gv83kLtB41xlJeRAv9xnyYVzn+4FFjdvfKb98d
	JXyqDp3GgXf+idh0kkJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moCnk-00BkPN-2s; Fri, 19 Nov 2021 22:56:12 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moCnW-00BkGN-Po
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 22:56:01 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so9959577pjb.5
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 14:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=go7zSbrsyOXEBuyqNxrQ/6jUwWHjYoKG+LWKw1i+E6U=;
 b=HvySC0K0umDm1DXDhvxM0rFxkVZQ3r6tKjYqA4AODO+c/I+dNu/ylBZ6HhsfUQ8skI
 6l+8+9Dbun5XLdwj3hllMbiHGv27VixY8RArOWhg9s9hR668K3J7MOwb0xxFHGvaVuEC
 saWIgChXSoFBSIT7pKfZQr5wuxwsgwrd2JE6SVsEYAcIiY3QkKimO3Vq8/gj3+RA4aje
 iBb3uXUBtzN0sMOFSPojLFinT0BxZfLZnpq5o7PpJlQksbQ5nt+G7VLdmffGkYPaHZh/
 r71f8v786+EBD1JfUD4BzoWwooi43CgJZqvdffINn9wonbjrYDgpZ4QR7nFsOiDlYTpP
 7Ylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=go7zSbrsyOXEBuyqNxrQ/6jUwWHjYoKG+LWKw1i+E6U=;
 b=p6vRDxnSg4zpajwgvAjl57osvsAWmzgqwIPXcKem5zYTVizrGQ+C0S25Ts37KTmPPq
 3r/6PLpVktwa9X9OKYxRfc9eWDmOUlqpADk1ocVifo/BPighSCUELdD21JMeywAejKXs
 ic9/WnnH5WEtF0yimaDGSN5P3Y+0LkbRg08tlgXOyiWi4aWYxEgJcMefb+Duuzm2sYMP
 QiUhk4Fa53NUPJtbR0ukHabbk/IERI4NeaRN+p/6mtWRfoSBcEia3fMjLHT4EHH7NCfc
 TbmX/04zfxeI0YE2oCcUUNXAJpm0/+5jZCkQK6OtRuOFTJb/MAbsj03QQXa55fuwapO5
 IISA==
X-Gm-Message-State: AOAM531GLMrVSLymw/vgaYrdmaP7uPSiHBmJ5txI22+LkFnqzb8iiMV6
 QCOm+v9Hu2yYTpYYO1y2WEE=
X-Google-Smtp-Source: ABdhPJzfOFU+bbHnZYLAdodVh2WkXT0FYb8ZQD/CVcLrJQd+C6mRVwmI8oPDelKD809eFdbkLowMjQ==
X-Received: by 2002:a17:90b:1c87:: with SMTP id
 oo7mr4046103pjb.159.1637362557779; 
 Fri, 19 Nov 2021 14:55:57 -0800 (PST)
Received: from localhost.lan (p4857108-ipngn27301marunouchi.tokyo.ocn.ne.jp.
 [114.164.215.108])
 by smtp.gmail.com with ESMTPSA id ep15sm8713349pjb.3.2021.11.19.14.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:55:57 -0800 (PST)
Received: from x2.lan (localhost [127.0.0.1])
 by localhost.lan (Postfix) with ESMTPSA id 488B8900959;
 Fri, 19 Nov 2021 22:55:55 +0000 (GMT)
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Subject: [PATCH v3 5/6] riscv: dts: sifive unmatched: Fix regulator for board
 rev3
Date: Fri, 19 Nov 2021 22:55:41 +0000
Message-Id: <537742e7af4a21baf79429469ba7c30947ddca7a.1637362542.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <378c64fb868b595430b0068a9af10fdbeceb8e12.1637362542.git.plr.vincent@gmail.com>
References: <378c64fb868b595430b0068a9af10fdbeceb8e12.1637362542.git.plr.vincent@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_145558_897259_95125DAA 
X-CRM114-Status: GOOD (  11.54  )
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

---
Changes since v2:
- Fix end-of-commit-message separator so change lists do not end up in them.
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
