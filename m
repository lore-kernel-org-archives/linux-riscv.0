Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BE6D339BC
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=86oO/ToNgkXj6GYtPiJLHNJ2yENcixbhJYxdSzfolyI=; b=wiNVYlpYvXuyDM
	RkntAYsxG0zsvAY0IBokl3w2XEOVjPoQdj3XnHChDuhpb230hyAAtuxWLB0o6VTa9LL/NOtEb8l9q
	g3Ub18sD+E1/8NRDwESsw0A8dcB0/JCnkaNWNZ9Am9FZM8Mi6drv/vGc4rSLzlnAiMsbR1jXBN/JN
	3nCCj9dZ2LuZtllLsL61t/sysrk4I/7W2r/pML+QSpFR60k4Z5GxKejPOcZGhvfansOTMXwH2et/6
	H0yB8vK2oe0SlMg69qrToaIIiaXR8+LUgB+I2L1IXlNH1zyyEbtarq8y43oyEMYr375TfS3WnTbGH
	AUT1ul/1oHQha/OnoPdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRsbh-0000000Awoq-1fKG;
	Sat, 06 Dec 2025 13:45:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRsbe-0000000AwmZ-0czW
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 13:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765028749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zQ4xZKnyp8sg87QxSnLd/hZTKRSMrQkq8mkt/rnJ6PU=;
	b=RqqLiooX75NYNdBNZy3+CAVCBQL2NW1ecfwoMBHRl6esRQvsl/UNbPVfJvuwaPDJSEQ9IA
	B41x273ciMprZqSZGjKm3rxh8ox2kyzynM8iZc4fonvGoMDQQXfjVKrstNA95QGkbFEgh6
	K5XSVltO+6woEJPNDFrY2KGE4j+GiGw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-eIrkhq01NeiQMlL1gbDQ6Q-1; Sat, 06 Dec 2025 08:45:48 -0500
X-MC-Unique: eIrkhq01NeiQMlL1gbDQ6Q-1
X-Mimecast-MFC-AGG-ID: eIrkhq01NeiQMlL1gbDQ6Q_1765028747
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4779d8fd4ecso13267045e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 06 Dec 2025 05:45:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765028746; x=1765633546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zQ4xZKnyp8sg87QxSnLd/hZTKRSMrQkq8mkt/rnJ6PU=;
        b=RbHLod+VGj1pmZBbtQF0XGrlWrGMKrti1i91+Q4+R+62/xBN7/2AWxsXIzrwVNR0cl
         KSMGOF79ZXa2R0P6DkzzdfgiwY1D6V8DamYBH4G0xuJhLtcEj1aqyyNl9fmZbxdBolpp
         ZfpQhtq3ZauuswBxRpT7xVEQbq54BH3u+OoNgdF/CFrxSgq079jWIROLP0pu0QrgJGic
         CZeAwDajnd/PsAWlNzKwhRUV69gWNMEdXTh7Lv1RVxvFImiFgj/roA2ln0uHZq4jLK+T
         mahgnXZqgiO9A4Le/I2DDcNaPXNekvz9zqrq+ouynotT9D2okoXrYeKdOpIy+Mm/VbXW
         baMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcFdm+XDVzcX1VV1yopb3PcG7FcfGs4EaQdNi8UYfjfgZk46iHwRt4Eg5FEQDuoZ5zxlwS9PgJs7d9lQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOqxQnGpLLs0j4Y29GMN9VVOUjcthYLEbihizjit++nXXGrF9h
	RCMA/uzpVWyHkr17Mn3fxTJ7TnNMO9HS4L/uTnwX8z6kmxn/gFXK/bpgqLelngqMBob9BesGQ00
	jWKPoITc1Y9UM/rGDmDpkmiWpcEBBN/1iUUm+WFvnl3EWsPpBqVzGHN/PMXLoSQ3N5kll6bazKw
	/NqA==
X-Gm-Gg: ASbGncuy2lP2EMEUgzj6UHUZ376CRps8u5/dAlH7SELsvdgAVoGs6VsS7WhCUG7NlLT
	Q52bSbkxBSgSP0Jm7mL3tgJFhhBtz4usA9bURtCmeZGzcs6+Mufac75z6M534WvZ0/iwwEDm2sn
	aigsJLtkibotleaS4jdYLitWRzJLX3t/6UHf1JEGRVDw9sMtfncten5WIXaZ4ztqMCBj511EVIr
	93rJvqQGHQMxMDeI+99hci/Ct5kg0hhBkcvc6cRR8poBJOO8yx+5NuXD2f8exrm19r4Gtb4F9l7
	VqGFczL2u6ErBOqICmVN7tvYxf8qrYHnsj4N2DRHSdXVak2O5C0mijXDQDMBwazLdXjbX43AYQ6
	rfWAIncVaiAdaqHLkfdk+gf6nFGi1VzkPNFc=
X-Received: by 2002:a05:600c:1388:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-47939df12a9mr26315085e9.3.1765028746413;
        Sat, 06 Dec 2025 05:45:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBRzGilJnm+Z21pEmUUbYTk3gTJ9mW20e4RvI9FI44VoB+qQW6Xulgk1I7L3r+5rqwRgnb7g==
X-Received: by 2002:a05:600c:1388:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-47939df12a9mr26314745e9.3.1765028745989;
        Sat, 06 Dec 2025 05:45:45 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4793092ba4fsm143337315e9.4.2025.12.06.05.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 05:45:45 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Alex Elder <elder@riscstar.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 3/3] riscv: dts: spacemit: Define the P1 PMIC regulators for Milk-V Jupiter
Date: Sat,  6 Dec 2025 14:44:55 +0100
Message-ID: <20251206134532.1741648-4-javierm@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206134532.1741648-1-javierm@redhat.com>
References: <20251206134532.1741648-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ntg2sVZZyjBMdbPPK3ysw14-c8VLPiQg_0_k-ekC0WA_1765028747
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_054550_265129_596F9D96 
X-CRM114-Status: UNSURE (   9.16  )
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

Define the SpacemiT P1 PMIC voltage regulators and their constraints.

The power management hardware design on the Milk-V Jupiter is identical to
the Banana Pi BPI-F3, so the DT Nodes were taken from k1-bananapi-f3.dts.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 5babed4d7094..800a112d5d70 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -95,6 +95,116 @@ &i2c8 {
 	pinctrl-0 = <&i2c8_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
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
+			buck3_1v8: buck3 {
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
+	};
 };
 
 &uart0 {
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
