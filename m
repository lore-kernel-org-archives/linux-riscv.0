Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EB0C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 11:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hagzobeISDa5EAdVGwO2hicIIWYED20GW8215RJqq6k=; b=EG++5ypDGzfGDC
	xU2j8mQm+fNEN/M9GcciQYO20tEMmPfsJjj4waNfE+ti4j0aTSwpyyi+dBZPeGXoyhI9TJ1miTMfv
	gHcBiYyKYBQvZOcURDRg4Ss3aZNcw339sa0vOt6LA5FQuE0NY1eWBYRwNWiSPndfSzVK7pGb18jU8
	g2IuvUFtpVYrfqIdOR6Bodath0ITdOEbF1GT6bVvttLdbEfelUDsA8StiddaaqJQ9MzHiYtkS5Jza
	NvwzyRHrugJlPzv63HNAsqTAZ7De0w5+5xmbtg5pSc+fgU68m/pzP68LdXsLPtFhrlCog8/yxyn5e
	1XBb6H82Ncx7oePXaHEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUomI-00FtXD-3C; Thu, 17 Mar 2022 11:58:50 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUokz-00FscL-3a
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 11:57:31 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0BA473F614
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 11:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518246;
 bh=VChXuM8K4QoDWKbjkubBo2C7YS9EHl+r3kLe9dbaCgo=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=LKPUVBetATCqpTAZgDmQzCn4akz1d4uiWL4QprtmiJvB+kXgY3MQe7IWUD1m/SOSy
 zGGWSf5oqb3OjfFuc2HT6n8x8iZXg+51Uiou3ZGMfLozPwqBVtQ/qe2dLfygoBJp7A
 3xrqMW4YEooatga5fKael7EpOFGFUr5LQ25ANfKC3kWhUIG6wpCAhHIduXkefH/XI1
 Wo3FAkRBOuHXphhWnzaCDvYOqnU39env9ifzG/kyKLsbpMMlhgq5Ms0qLqONrX2R9n
 xFROO5Oz1WX7ae3RszUMyYppNBLkBCbCTM0STJWMOE4NTB/Afi7MnGMYDtcM1yU4pB
 yiFupVqwT+RgA==
Received: by mail-wm1-f69.google.com with SMTP id
 l1-20020a1c2501000000b00389c7b9254cso3141253wml.1
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 04:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VChXuM8K4QoDWKbjkubBo2C7YS9EHl+r3kLe9dbaCgo=;
 b=K0x0rF+ZwwByeIzooYM4aH5uODUqlGsm+WDu1d5yto+v0UORpPji+77PYddl7+q34Y
 cE9vA60Q0AmzroJMMjLl64IOkYn3CjTz86vndPt/qzGWYD0FFuaOGWabK85ExXB4cnJW
 KOxEovoKoR0Q9qhdsmBr4pz1TooFTqQ7g36QeqoHlq64O++vcB/Y/cwcbYGR8fzy2m1F
 ZGY6C/EwHs9RklazG8gcHFKM4QDcFofkYH/QNETWF7y0aJb8JflGayLbOBDucUXfcSyh
 iap7c+qVMD3Cy0hDGAgZhgzwJ/wF1mnEXWphZgh27MUd79zDqXMcyQXqrQNihNlvFsyT
 z6nw==
X-Gm-Message-State: AOAM53057bJAoWbUFqDW2S4xh02s3g+OXnlnXvVjWSjFOM5CpVYGNawf
 bEQOGvH4ix0RwDjS4yELPb/ZeN9RLeMWfCG42y9prG3zlHrhpJSlH++XBAsHDkT1dXm1XG6C7eZ
 9C8wh8JscL9VdDTHCk4AwSYVxUvF4cp9EK+mPrNGV5J7X/g==
X-Received: by 2002:a1c:7518:0:b0:381:c77:ceec with SMTP id
 o24-20020a1c7518000000b003810c77ceecmr3609325wmc.57.1647518234208; 
 Thu, 17 Mar 2022 04:57:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsiX6nbj0kfQADgRjJIDqdkJ617e7CvGmtStpgdMKD/NEmWTzdx19H/0Ce1BkkWrE8nM6zWw==
X-Received: by 2002:a1c:7518:0:b0:381:c77:ceec with SMTP id
 o24-20020a1c7518000000b003810c77ceecmr3609267wmc.57.1647518233902; 
 Thu, 17 Mar 2022 04:57:13 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:12 -0700 (PDT)
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
Subject: [PATCH 02/18] ARM: dts: ox820: align interrupt controller node name
 with dtschema
Date: Thu, 17 Mar 2022 12:56:49 +0100
Message-Id: <20220317115705.450427-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_045729_304334_AAA3E4A2 
X-CRM114-Status: GOOD (  12.28  )
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

  gic@1000: $nodename:0: 'gic@1000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/ox820.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ox820.dtsi b/arch/arm/boot/dts/ox820.dtsi
index 90846a7655b4..dde4364892bf 100644
--- a/arch/arm/boot/dts/ox820.dtsi
+++ b/arch/arm/boot/dts/ox820.dtsi
@@ -287,7 +287,7 @@ local-timer@600 {
 				clocks = <&armclk>;
 			};
 
-			gic: gic@1000 {
+			gic: interrupt-controller@1000 {
 				compatible = "arm,arm11mp-gic";
 				interrupt-controller;
 				#interrupt-cells = <3>;
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
