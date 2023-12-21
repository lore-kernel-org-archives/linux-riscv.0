Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC8CC35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uA9oAAJ4WXe8TxgqIez6RFmabHXPwy3aZCKMGs3L8PM=; b=qJSKXvocwRv6CE
	egJhJ6ElhwdZ7spdF7NYLVZRejZMBob+oWJDdCXTlIh0ZMYridrw37NirfNPgidfUDaepd++VUEQ1
	jQhHyl/H5YoVqymM4Jag0k/OBpDUPGxIkGjenUkn61Q/fvOR9Fi2w+OEFVMYvFjBhaFAY2mHmGILE
	UXNRlWpQzzlBYdF3f9zpCA4Wff6Wz9Cjjb2aokbgs19ylbAew29OoiQJRtDrwvN1k6xo/DaC9Hqhg
	E9NtRDcqzNkM7V9qgNusS2xRF1//42LKNhb40QZVF69adq3a1lwbEHx+x5J+Kdsg0gVr29uK82cTG
	xODHoUUr36Q2Xj5cOAsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGG19-002Ntj-0T;
	Thu, 21 Dec 2023 10:11:03 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGG16-002Nrx-0d;
	Thu, 21 Dec 2023 10:11:01 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a2699ee30d1so48272666b.2;
        Thu, 21 Dec 2023 02:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703153458; x=1703758258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFf3Xy2cMnTXIbMlXJLnwk2HDFYZqTaJR84g5dBGsLI=;
        b=I6L/VSDCVIdQBMGXGOXbYyGSXdl7WcIbNoN8ww3Y+/7eCorZm9279hXsCRBT1S69Ki
         Dt85YyYtWN4fMjsqtxrwp7Bskpe770ssSlJ+yqtscoxljrYKRnhp2dNuKqs2tfn/qODY
         0Gu/4rCrB2jiSsqg/6M2Q+0eumyh3bhK6Ta3ZvA8IJmzYAxzk7DqSCmDwuESiJtedy4K
         KV6wCWTs8p6A0tXRCqz3emL9LpyYgZh2EJh4FjNu6sF6ezQusjsJOuELdF4hL7dzFX4V
         QjJzPrqanMh51EPm/+XaG7/orRryrm1A1IjXlnbWh9KRrce2afVoP/8nKrulwcg/Dgyk
         JaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703153458; x=1703758258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFf3Xy2cMnTXIbMlXJLnwk2HDFYZqTaJR84g5dBGsLI=;
        b=qej+eoF7WhCWLLNHZcsWuygKzYH5Dw5wEJvLcbxKEgzo5je39dWGIGIyfJIe3C+40W
         azwCdqP8XRF1GU1bl+eOaPM0fNYfEE+X7hdLnZadSywXJAYm6tnqgScmc/Ee0iwcT2vJ
         BGp46eJkGT2hqftfspL7NqgWaDAdlkXTl8/FTu3a8jkJ0gx2DV0k9hF6w1JZJ6Q98u7+
         F4w8R4VYZNPAa4lodtV08ytJy98T0ooBioBinaPlQzwVF/I9F54PL6PWCBECKWq7sWsB
         AAST9jZIb9vNgvo/ZlD+RcjomLiaJeTFcxEdHGfac1tsj9kM7+bywujdALgm6e3sRO/D
         c5BA==
X-Gm-Message-State: AOJu0YxsNgcSpDYO1aH7THwSMalWaXIF+/M78UiEwdBkIxfwnRyEj0BU
	jW8rpGnUdHw1YM7Yg5g0U7o=
X-Google-Smtp-Source: AGHT+IHdyV4OQDmEi6Na15vJj61uqzNpkif4Hepo9TNBl7sFfbA0b7Ola/s2/GZQujvgdIcyNME+FA==
X-Received: by 2002:a17:906:159:b0:a22:eae6:1657 with SMTP id 25-20020a170906015900b00a22eae61657mr8537126ejh.33.1703153458485;
        Thu, 21 Dec 2023 02:10:58 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.204])
        by smtp.gmail.com with ESMTPSA id x7-20020a170906b08700b00a25f5dba09dsm784928ejy.145.2023.12.21.02.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 02:10:57 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [RFC PATCH v2 3/3] riscv: dts: allwinner: Fill in OPPs
Date: Thu, 21 Dec 2023 11:10:13 +0100
Message-Id: <20231221101013.67204-4-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231221101013.67204-1-fusibrandon13@gmail.com>
References: <20231221101013.67204-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_021100_242565_4861E22C 
X-CRM114-Status: UNSURE (   9.49  )
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

Specify two voltage ranges, in order of increasing stability,
for each OPP.

Link: https://github.com/Tina-Linux/linux-5.4/blob/master/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi#L118-L133
Link: https://github.com/mangopi-sbc/tina-linux-5.4/blob/0d4903ebd9d2194ad914686d5b0fc1ddacf11a9d/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi#L118-L182

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6c..7e2e015e0 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -39,16 +39,23 @@ cpu0_intc: interrupt-controller {
 	};
 
 	opp_table_cpu: opp-table-cpu {
-		compatible = "operating-points-v2";
+		compatible = "allwinner,sun20i-d1-operating-points";
+		nvmem-cells = <&cpu_speed_grade>;
+		nvmem-cell-names = "speed";
+		opp-shared;
 
 		opp-408000000 {
 			opp-hz = /bits/ 64 <408000000>;
-			opp-microvolt = <900000 900000 1100000>;
+
+			opp-microvolt-speed0 = <950000 950000 1100000>;
+			opp-microvolt-speed1 = <900000 900000 1100000>;
 		};
 
 		opp-1080000000 {
 			opp-hz = /bits/ 64 <1008000000>;
-			opp-microvolt = <900000 900000 1100000>;
+
+			opp-microvolt-speed0 = <1100000>;
+			opp-microvolt-speed1 = <950000 950000 1100000>;
 		};
 	};
 
@@ -115,3 +122,9 @@ pmu {
 			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x00020000>;
 	};
 };
+
+&sid {
+	cpu_speed_grade: cpu-speed-grade@0 {
+		reg = <0x00 0x2>;
+	};
+};
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
