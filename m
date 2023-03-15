Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1707EC74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 09:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amaQzd7LKQEMLBaWS8KCz3h/EHYJ31HUwKQLKtPMou0=; b=MaeFUwJ5RRXKo0
	dBfVjfmp7U30x5JnR/t/A+VdKSylbqWjpWxvnLLY6P4nX5dUvRP5nFQLZmFZjo2Yz2XXEOZDRTAQc
	aBcMgMzqOWY1RrfpzWHm1BmEDQeIrC85vpcBbc5qgYfXMn3wwpCXjKz5YkKRWqM3x/Z+QZ4qiurHo
	8X1IRiz/G4v08dQPR4SIrjHKWCXM9h0a2j5XF4PBN8lf6OPWuvys5WasHSS5xS7tIgGIvtLY7V488
	hyIhYKvh4l3A3DbywWYD3fjNCbZzI1otkNwBlL5HV5q5zXT7rDv7hfFdTqWIHHKqTm+FhmmLnAuKl
	2Zl0GEQN5CP93DEu67WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcNnG-00CzK7-3D;
	Wed, 15 Mar 2023 09:51:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcNnE-00CzJL-0h
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 09:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678873897; x=1710409897;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0u+UdGgrstqHyAt6lfy9Z9fjXjmo2PxFj4o6q3qUG/k=;
  b=LeB6M948j/fN3Ai2eBNHvTt7SiejlkqGgxtCiVtwSXCCRiNlBVymncEJ
   QgKU6vGTzfSMxZE4r/NW1EbzJypKF+Cr8pVQ6vyYlhxBNAO4Dowj7sAUV
   A2z6wkUTRzTl506Yw/wIXY8kSKDpz4hGOWUyas5sxaW7Q/DfHxsM8RkxV
   8UxLLDzN2yDSn8h1Towf5rY2pHhdNVuz3M7f2nrZTByDmOGZy/C9L9ZVq
   jXHjqGcCi8Hvs2h73QfNNRErgKL8vRInLqvTNIATVhP8vAEYa7QkuDMq4
   KwP4l5GkeZ8TLHpdZjov8gIsHtcOccZexL1Nq1v8CThW/sIk6JON4NmPA
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,262,1673938800"; 
   d="scan'208";a="201732120"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Mar 2023 02:51:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 02:51:27 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 15 Mar 2023 02:51:19 -0700
From: Durai Manickam KR <durai.manickamkr@microchip.com>
To: <Hari.PrasathGE@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<manikandan.m@microchip.com>, <varshini.rajendran@microchip.com>,
	<dharma.b@microchip.com>, <nayabbasha.sayed@microchip.com>,
	<balakrishnan.s@microchip.com>, <claudiu.beznea@microchip.com>,
	<cristian.birsan@microchip.com>, <nicolas.ferre@microchip.com>,
	<davem@davemloft.net>, <linux-kernel@vger.kernel.org>, <edumazet@google.com>,
	<kuba@kernel.org>, <richardcochran@gmail.com>, <linux@armlinux.org.uk>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <netdev@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <pabeni@redhat.com>
CC: Durai Manickam KR <durai.manickamkr@microchip.com>
Subject: [PATCH 2/2] net: macb: Add PTP support to EMAC for sama7g5
Date: Wed, 15 Mar 2023 15:20:53 +0530
Message-ID: <20230315095053.53969-3-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230315095053.53969-1-durai.manickamkr@microchip.com>
References: <20230315095053.53969-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_025136_338805_5C673290 
X-CRM114-Status: UNSURE (   8.22  )
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

Add PTP capability to the Ethernet MAC.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 27fc6c903d25..1dbee16fe90a 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4853,7 +4853,8 @@ static const struct macb_config sama7g5_gem_config = {
 
 static const struct macb_config sama7g5_emac_config = {
 	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
-		MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_MIIONRGMII,
+		MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_MIIONRGMII |
+		MACB_CAPS_GEM_HAS_PTP,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
