Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5EBC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 10:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+ah9S6su9Kh3fMaQYFMw1EFziMESnu8ymOqfJf61rY=; b=YhXjzXBaz4wudW
	NQzVaVoHVde8MKO56I7U2rHBu7u3O3yfpLaERYOqySyGDnBtLcKyOsMn6HdgwORMpKZM0BwhhASaZ
	b/FHVY0pAR496PYRDrY1Lod10C3odg4pT3/tbTBWtToYnovQEcdai8vZ7fek0TZm4aiQBO4f4lQFG
	Bp+LUU5o3puKKiTdJXy7I9YYfO+AiqlKmIaxOh4UJjALMxKyCM3ya3oWAvoIDiewXUxvNi9dxpmgv
	R7gh13aPbVlWRWs4+xNJGHcI5N2ZNPupoG431mamjT7bXlTT8qmt2qTTECAdjqqiqZLWyhAVbU+bO
	+FL6K0cN0ebkJmDGonig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1outfJ-00AFuS-Vz; Tue, 15 Nov 2022 10:59:42 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1outXk-00AAjw-ID
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 10:51:54 +0000
Received: by mail-wm1-x331.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so12819676wmb.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 02:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyEqDf0zONZ5Fdec0EnXfdhTnIhb+Oxxv22zZ7JUl/c=;
        b=GW+bkA4PaazkuF/iApqAZFGTaz+gM0M/BOXwidlQjDa+es1IMB+JYc1p8jHjDBN5gk
         iDRAAOaAz6mVlZEZD6fC56HDJj0RxQy5tu2EVLY2sv/3BAbfC4uAuaoUURToyp410SWv
         H1GM+LIhN1MHkR5YqeGxAlXGURgaRRuAtxZDwG0a0FM6sqos4LaUnVVw0AKVg9/VxSl7
         xv+Vr1/3tlERzcmN9k66jaE2ktOrZF3dzEfjs12yJDnCt0oNuHxaSIipn3FXMmXF3Jfz
         tK4scW0ER5OIjdxYtyuIpsMjQn8qycGsYnI+WMcqrSoPedkTh9CdO1KtuwF4ccKHmbcH
         SWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HyEqDf0zONZ5Fdec0EnXfdhTnIhb+Oxxv22zZ7JUl/c=;
        b=acz8Ycwfv05bDtfP/yT5VcmT0bAkeSdSJ2ZLjaR2gH8R1JpUlBabtJDqYVfAYsh/xi
         vZfdAnD3pyF110UlWPGtBC6xTeljt0c2LrxZUykdtPcbWUpXZ3zWSVRnDtSBaHcRtm16
         CNZ+o7xUZwFVz7OOYpyA+JU+HIBjNS+Pk1w0bQUB9VvNZehM5PTZStg0XPnpysrhOVHR
         YjNRu8p/LTrplJ1/SrY1/ktLdcqhAb1IiNPiZCUYn88oAPyW/bPnE7RoHdWj7ZCeHOmK
         0ge0uom8wA3mqXTKiVv1+Ct+SCvj+LEfiW7J1WdoecibYEnMWiJtjgbttThQwYg/dCnF
         NKWA==
X-Gm-Message-State: ANoB5pl6HNlfOn5rISd1T2x1d8gw7lLhlZm02IAu5hPGV8ikA2LB5hOr
	1hqbmsNaA8QYBOEKz5N+tG0=
X-Google-Smtp-Source: AA0mqf6P/jewkEk8TdUrUxghgtMbiJTA5+rAtKhSEGvnHmqYTotT7ySyX0rI+nkKCFcMbt/LsC4Imw==
X-Received: by 2002:a05:600c:3586:b0:3cf:8e62:f907 with SMTP id p6-20020a05600c358600b003cf8e62f907mr1035263wmq.7.1668509509515;
        Tue, 15 Nov 2022 02:51:49 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:d94a:6345:c378:e255])
        by smtp.gmail.com with ESMTPSA id az9-20020adfe189000000b002367ad808a9sm12210528wrb.30.2022.11.15.02.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 02:51:48 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] riscv: dts: renesas: r9a07g043f/rzfive-smarc-som: Enable ADC/OPP/Thermal Zones/TSU
Date: Tue, 15 Nov 2022 10:51:34 +0000
Message-Id: <20221115105135.1180490-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_025152_664650_B153E8B3 
X-CRM114-Status: GOOD (  10.46  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable support for below blocks found on RZ/Five SMARC EVK SoC/SoM:
- ADC
- OPP
- Thermal Zones
- TSU

Note, these blocks are enabled in RZ/G2UL SMARC SoM DTSI [0] hence
deleting these disabled nodes from RZ/Five SMARC SoM DTSI enables them
here too as we include [0] in RZ/Five SMARC SoM DTSI.

[0] arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi       |  2 ++
 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi | 11 -----------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index 50134be548f5..6ec1c6f9a403 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -20,6 +20,7 @@ cpus {
 		cpu0: cpu@0 {
 			compatible = "andestech,ax45mp", "riscv";
 			device_type = "cpu";
+			#cooling-cells = <2>;
 			reg = <0x0>;
 			status = "okay";
 			riscv,isa = "rv64imafdc";
@@ -29,6 +30,7 @@ cpu0: cpu@0 {
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <0x40>;
 			clocks = <&cpg CPG_CORE R9A07G043_CLK_I>;
+			operating-points-v2 = <&cluster0_opp>;
 
 			cpu0_intc: interrupt-controller {
 				#interrupt-cells = <1>;
diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
index 45a182fa3b4b..2b7672bc4b52 100644
--- a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
@@ -16,13 +16,6 @@ aliases {
 	chosen {
 		bootargs = "ignore_loglevel";
 	};
-
-	/delete-node/opp-table-0;
-	/delete-node/thermal-zones;
-};
-
-&adc {
-	status = "disabled";
 };
 
 &dmac {
@@ -49,10 +42,6 @@ &sdhi0 {
 	status = "disabled";
 };
 
-&tsu {
-	status = "disabled";
-};
-
 &wdt0 {
 	status = "disabled";
 };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
