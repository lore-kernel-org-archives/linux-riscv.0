Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0868B103E2FD
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 01:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BIuk52pqHmd2Vg4JOSB03GxPNxy4S+YChED2HV8C7mc=; b=O+VD3nBKcJTX31
	x2AI69ZuZ2/aiOISRcpgaZFI0c+Wz77lyIRu6wNw7WRhF1pxO5+dejRcEVpqTZdhRyBq3qYtCrJs+
	bk7jAlZkL54wDaXigU+X4xUXPKBIXuZLlZn4gi6mQvQSOUjQDIdTi4UpnbVdHtZW/8Lbpa2I1jdjH
	YXPpuTehIw4C5BcKtn+0X/uaY9sGaAyFe2EzNCrLyvqtri5faEo3d1uEXord0bCF5vu96p7xn+QJ3
	KDOQpWuzatzEcfb0bqjAhNu13H/U4kZ7d5BUQdwXunEQ5/076fNv+rwF4qFCN8+S6KHGMKiMU5WS+
	1SIpdBr3Ft4SO8RLNzqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ulu-0000000Czrj-2usk;
	Thu, 12 Mar 2026 01:23:30 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ulr-0000000Czq8-2hRd
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 01:23:28 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-50917e02472so5785591cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 18:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773278606; x=1773883406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67f6aplaQjeW67VXDX4TdCndW5aSx2/hPT60hva8Vws=;
        b=dd/HymQMsmOS1EAd2cS3FBaPFxGhe5fmyIL4uTGBdsqr/HVhKhF46R7jZu1v4lAvUl
         m72F7S8fDvtzCCL8WgLLatloauDBJltg5QdWybMR/TowdFh6eOi7J2WgXssmBh6KykJA
         sglF2cy4VnLB1W5l33XZy5lXDK+EnwrQrgeVg9HBE49NWBGqfC6wYwQDjoyiSaSb2xCS
         hqXV2do6Jo12Y/2Gkv5rrp026kiPBotYvxJUG/YLWwQOkR6QOcAshRscuoJWrKs6UF+g
         pssyvW0rn4/7nk3LaM1higfE5UBF4pLVLNwDjPphQDB5yDkoKE9N8LPdLzRv+eKLiPuR
         yk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773278606; x=1773883406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=67f6aplaQjeW67VXDX4TdCndW5aSx2/hPT60hva8Vws=;
        b=n4/sWayDsCfB437J7BC19RpeGVsV8pieCyj8MoQdBEHfgoPLTUcFco/Hcxxcp0pUTQ
         SqpLw8j9wDFTBrSoiUr7j3Rrbee+qBUyl4hVgaGE648qz8iE07drV5H+oMbxe1S9pPJn
         LFk+mNJhIhgfMT4y5tZoHt3bLOTFcSPQ6w/b3FeC/iFX7cRFP28H7v0HK+0whBdSJIPM
         Rz4Ss7HOLIbzEptPpi63TlFHsArevQkVA6f1l8Gwv+YQjRwhmOqaornDG/L4zxO5WpQ7
         aYfJSnnlTl6jcIulRh/Pf8im7xS9384i90JY/ZvMxzNzGRP2RYGvV4KbnIvA4IRLMb8Y
         oPrw==
X-Forwarded-Encrypted: i=1; AJvYcCVyI4Tua5AxbU887X5vBrZKLBJ9hH+jKUd+KQHrKKuUoi79Mp0nL1ra6iFE8l/C5MFduhPZf1auBIQZug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0UiKUl62TWZgHK47llJkdR5CVGKkD8psaiJaWCIQ/UJVyfG2p
	hStSLY3Rmf1Nc+Xm7EalocpPHx5m6tI50ven9jz4j9K6SgdLhcGnkaXX
X-Gm-Gg: ATEYQzxvTle4agdrlLwDgmH5pORFhnnQiRuh+LISYEeiJl2Pe/peeKH9iC6DZOokRJ0
	9USiVG9PCwahzFWv/fCn4sT7r0bXvsemuwk0f/edMtBAVkIQV4tjytUr6fpEQkxdIlw45QMekzJ
	Rg0bCi1BqUdSQEZcn9THSG/e8cK48yfpE4ynwfwAsvBkv6WRxqAceK375QcoBsQi6FiYRcJuVuV
	kAbhxFf/BeBijSeLqv6dRUFQQAjLaHmZtiGDzQQc7psvuHPKkYMhFqXuDoIIoOSDuSgWp8tPcPF
	n3tEiT+H6vN0SIUZqIoMtr3cGBUVVwbIb4C777D/CQXKlJa8M5nIybWDt8cip7ufbZzC4b9Z7pX
	PdAfB0F3KYI10tv7XLqmuTSgZDVDecs9/oBhpgzoY914hR1c67v0a8LifNS/kyqW/43VxSrr9D6
	EQJ80LQEvnqUyfF2IXBFaMNRA=
X-Received: by 2002:ac8:5914:0:b0:509:16a1:2033 with SMTP id d75a77b69052e-50939fc6e51mr61632471cf.26.1773278606210;
        Wed, 11 Mar 2026 18:23:26 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a0ea244sm23041871cf.16.2026.03.11.18.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 18:23:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
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
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v9 2/4] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Thu, 12 Mar 2026 09:22:24 +0800
Message-ID: <20260312012232.373713-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312012232.373713-1-inochiama@gmail.com>
References: <20260312012232.373713-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_182327_687999_B53A003F 
X-CRM114-Status: UNSURE (   9.22  )
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
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 5c9fd91a1db9..02303a808fb5 100644
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
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
