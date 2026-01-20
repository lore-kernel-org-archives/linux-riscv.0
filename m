Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0A0D2ED12
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnNGwYec7ogz/bXFO6q7oRCpgmd9dEXJbS3/0r6dppI=; b=qZPfSIRRlehoLS
	HakR+QGd+riUBMgqkXGO7yp9L/vjbYhlFNa1f4Nh+LH5PK7GgaKbWq07UsRk4Ic055R30lN0d3FXF
	yCBJoRExoKDt6BcW9QCVAtcNtIJErJOprVe0tFZOU22LoR5c36UdYxC9rgdAZzHa+Vux79WQdyUUs
	2GkJg7KlHYf713TZgJMm9tPBTSdZYFpJlNaHZP7MrvE3WkTQ8KdGbRTEN2jrahjc74uP8aPPGQgzY
	MOwR+0idobrRn/Ik9k24Gfwd+tecDD/CofYYI24HUqHx83YAuw8BefNFCSw3hSjLs1bKpowBMKpJK
	DX/KJLXbDopGWJ8Vf8Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3Ty-00000003C3b-18Ot;
	Tue, 20 Jan 2026 04:36:46 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3Tj-00000003C0Z-04pr
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:36:38 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2b6f5a9cecaso948882eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 20:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768883790; x=1769488590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=b51fCfsYvhKsVdsgFVAz1c1Flqhyn5aLHxjyJez67IlGVb2AFxr/d20d+8B5La9Bo/
         RTnM57gVz2ReIF3jzOJhSvR9fJf3Ug8kqKRPfvPwO8JH/k2v9tkn/tJdD723katHX3g4
         2lGZP4kXPhvbRCXp0bjcMxuxQ5WCAPkO0mYPmGtLeayRwXfcbCwV/xrgc0LC0QNOb5+r
         RuXdtH2IibspFNthQF2XRtbk2MkfBATdzXSSnWaXopJBQucYaUGiTWb8JrWeSwn04pkU
         3qvRTMpLpuXcctz0ggkkNdGMVDaEam4vweMxygtTYeO7LW/NXv0yHaKsLhHdAZc6b3st
         q/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768883790; x=1769488590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=aWUuH+yczffo6v9mQhEzrAu9X+PWUR5kO1kzZo45GboPWhrE7QmlIRvY1uBWYtY7m3
         wdQb9wnPc+qCpciqdjBjphZdGDtzCRVP/U+HkCeey5OYLcgs3ZAOTEPD5nOCvtKIE93h
         sBlDS/VzzN1NIRrPx54XU6YfGrqZF/ZokpAenfO3A06v9JBmLIJ8kAhds6X9RBmEIjH/
         x/j8PeM/7RsaO/mQHeMG0/tVc9+AKjC9E5i3bl2jQSTdz39kNWjjgOlcrcFFltI31YSu
         15yaESpXtzb8zhRcNEOvw5BbplGjUi+479/5AWR4Q0P3AnNiKbnGmnxuq7P0cAseFdCD
         tu+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8otLyqA4V3fMlZaRwZ/0ezgagjE2wcVJRihgNGBQ8bB0VasoIb69NrJj3yqSqAm2ibFR9oYvDm8eBaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCS4b5czSoe63wE+6mhb8AuQhS2ATQAkvpuRw67d8kMThm2aOx
	Sv8ev0uOFAtOGE12Kci9N+r6dMBQgnS2zEBDUYHPbLWKDQfyVE/BADZ6
X-Gm-Gg: AZuq6aJZAbkVI57qycOaEzh9SUWi3XLVvxCT3z+uHkM1mght/qhCXtx9Bf92d1mVZfa
	yF7FzaRF7XcwihWI4S7RXRhDejPhpj0Ju+BzDnP/a+6hyhuoQ2X9RtN7SX2Yakew6OzNIRheAtR
	HjXVO8h7CUB//rpI8TPCWMHZ4GEow7otLiQ5TIGcOM6+oZyBdZZdXJGv9MQ7Sy/Zu2G/AUoWj32
	XUDkJUHdcObPJu332jOKwEtJJfM+45Q/GcXdJ7bOTj//XS0LkU8dlhCamry6BCOODCoqwnB48Cp
	huHO1Vv79qDxc2k8klUP0+arSDblOAo47tQ7/hsyT42zrWGzkQgaElCv8ME+EmfkdE/Q9//jmPj
	lUhTZNOCLH8TlqAYbK9ouDZSz46NVjpUv3mHargere2KEAgWcq6k/jhE4rKQONIiqfqJcGz5sFS
	G39drtwNDynnfwQtdBWLni
X-Received: by 2002:a05:7301:9f09:b0:2ae:5e93:b6d with SMTP id 5a478bee46e88-2b6fd7e55f9mr304430eec.38.1768883790053;
        Mon, 19 Jan 2026 20:36:30 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6fc2820a2sm1030314eec.35.2026.01.19.20.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 20:36:29 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Tue, 20 Jan 2026 12:36:07 +0800
Message-ID: <20260120043609.910302-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120043609.910302-1-inochiama@gmail.com>
References: <20260120043609.910302-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_203631_050775_B75FFE19 
X-CRM114-Status: UNSURE (   9.59  )
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

Add compatible string for 5.40a version that can avoid to define some
platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 8979a50b5507..54c7b1537ab9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -396,6 +396,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
 	"snps,dwmac-5.30a",
+	"snps,dwmac-5.40a",
 	NULL
 };
 
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
