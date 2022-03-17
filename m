Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA0FC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gReC2yd+eFxXI7Bx0mRVNoTJi9bvnyRqdMdgK9TVnJI=; b=A0dhxTiSr9kCvU
	bTjaNN0O8WjLmp9/DW7u/AxBwgf0bG04+xOm8jMOcT6KPO6KVZs5IhmBTxNiu5cbgoetlqdfCcdLC
	dconPMJxfP0znHDVwkA/3OTKdyFh5BC+MHn1yBgm3d062wQ2A6Pz22iP6A0brYzY7QJC/nqlkOpQp
	qBbcFL6BzQRK+4qva9VbOcPhJuT9WVBNlp7zNZu3e3w3iSgTfRLLSXf5QXqnu9Zp+LUa6LjIMLHUr
	utIfelN34iqCeOPkqF6rJQa5WVTiLNG/seuLqe27/e56fEUdQ/ik8ILyUJ6gh8x161oqeFvnCnv1F
	adHpWkJcil/XKL9XZ0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUokq-00FsXm-OF; Thu, 17 Mar 2022 11:57:20 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUoko-00FsWM-OX
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 11:57:20 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BD41D3F603
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 11:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518236;
 bh=9zBbrIVySme8IHRcwhL+hzcd9fjni90AU02iDVUn98k=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=P6+3+KWL9eflVqltWNmCGM7ivWIN6vu97+FWCh0Ey+btMhHM3MOT+PSYV6RQ4oNCA
 e6GtjkxgSc3YtfPMxXRCmuPsQLXcCEprIS9gtHXJBSVG+cdFLSz9poYVJMC6PSC3bi
 1lgUujwz0pWHUAvB0z0ZslVuZhIl6rMCCqGw6wPzLeCe0E5Pe0UntaJgBhN7CHExfj
 PH9oymNdn57O/0mh+fMez3rMR/IZEKGGnXO8WTo53nPeXncz36j2W1Bn4rG7a0D7lK
 aJ0UdfleXRFzNljeDMbYM9V5Pg7my8QnCOTSyDkdKgagg+GVNPWo0A/S30tuEf9z04
 NBw16rAAjkVtg==
Received: by mail-wr1-f69.google.com with SMTP id
 a5-20020adfc445000000b00203dcb13954so1457194wrg.23
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 04:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9zBbrIVySme8IHRcwhL+hzcd9fjni90AU02iDVUn98k=;
 b=fNFncHqRBaGmR9PnQ/gOyQZXt7NPxPHlL4SyIM7cPOnJPtmn5OcHkENqWFELPhJvnF
 hil1vU6oU+RoiAjwhoX1BSJVHVNJxCcnAVOp4ebllnAqg5443ldFmi7p5Nv+HOj59TOg
 3S9cDQHcysSa491388V8LrDv4KLgA+GOzb63p/KWNPI9QcFYL0xUD157HHb6aA2hW7E5
 P0eD5KMMLMJDwcmm52tzpa6sqJxRzzAR248GtXPrSeIx2WnhT++yCFDzYXWv/s4RKrM2
 0cbi+sfigKMArm2LfaOP51LWIcWIKju3rNYLQUDNswN2IuemGffr7QBapR92w6uf0x50
 cLVw==
X-Gm-Message-State: AOAM533yjDASHGbAOC/NWTWkNwRUALjHvJ/c9UhyEMligpl8FXPbaNQX
 8U7LZ/xp33BuDR4L2hgNmE0mA8KxQWFqE61ht8lcM3O5UqlMYv4GuOlka4EmDQsRr2dXw52pWuc
 2I4KjvUw+xSfboAuTI9g5NpKxqp1bB2IDfld/K5iHPd3A1w==
X-Received: by 2002:a05:6000:1ac7:b0:1f1:f9ee:7c57 with SMTP id
 i7-20020a0560001ac700b001f1f9ee7c57mr3633450wry.52.1647518236423; 
 Thu, 17 Mar 2022 04:57:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRVHHUrn4Gc7Ji2R1ZLqLDKn0bipCiLCnFH300rCQjMQzGcy481HRPG22f9lNVTtX9qFN6oQ==
X-Received: by 2002:a05:6000:1ac7:b0:1f1:f9ee:7c57 with SMTP id
 i7-20020a0560001ac700b001f1f9ee7c57mr3633417wry.52.1647518236248; 
 Thu, 17 Mar 2022 04:57:16 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Michael Walle <michael@walle.cc>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Daniel Palmer <daniel@thingy.jp>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Birger Koblitz <mail@birger-koblitz.de>, Bert Vermeulen <bert@biot.com>,
 John Crispin <john@phrozen.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sagar Kadam <sagar.kadam@sifive.com>, Suman Anna <s-anna@ti.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-oxnas@groups.io
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 03/18] ARM: dts: socfpga: align interrupt controller node name
 with dtschema
Date: Thu, 17 Mar 2022 12:56:50 +0100
Message-Id: <20220317115705.450427-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_045718_944294_599F41C0 
X-CRM114-Status: GOOD (  12.47  )
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

Fixes dtbs_check warnings like:

  $nodename:0: 'intc@fffed000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/socfpga.dtsi         | 2 +-
 arch/arm/boot/dts/socfpga_arria10.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 7c1d6423d7f8..b8c5dd7860cb 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -46,7 +46,7 @@ pmu: pmu@ff111000 {
 		      <0xff113000 0x1000>;
 	};
 
-	intc: intc@fffed000 {
+	intc: interrupt-controller@fffed000 {
 		compatible = "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 3ba431dfa8c9..f1e50d2e623a 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -38,7 +38,7 @@ pmu: pmu@ff111000 {
 		      <0xff113000 0x1000>;
 	};
 
-	intc: intc@ffffd000 {
+	intc: interrupt-controller@ffffd000 {
 		compatible = "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
