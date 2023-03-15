Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8040C7618B
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 09:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8HCJfIefjzPHbI2VDC0KSRoy3ZfNXZtBjSe9eCkEDhs=; b=KajW1Zv7gVkz7a
	E9kfPIfUf1jrUofXfH/p76cp0ch0b7XLQ4NcVuZmp7OOUMcF1IXCWUsqe0aVWWG5S5rPlev4HDrro
	SXtnR7FR/DpBO9Ik5Qss2lNlLZk2dc3P+mOR5Wt2uj0oIa4BHbDHO76IXFuIS0Qv2v5w94P2imxYk
	ffD2LLrrk8dHJA1wzkIpJn3z7z4vAICnnjX9L40Hr/rI5aTPbix9gdl6Xl/xm58RuGCYPL3xjw+jL
	69scrNbp+RYahCHauv19GMZ7CVw9jlOarsuzEFLpJ1efxV88ehJRmO8+pNW2rnYFskgRAf0MXsDmx
	Wk9cVKJcwZPTn6vx36Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcNmw-00CzFR-12;
	Wed, 15 Mar 2023 09:51:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcNms-00CzDr-2T
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 09:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678873874; x=1710409874;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Pmenu2GVkhSBQ5X5KgWqeKvBL7nngYZy4hgpQatRc4k=;
  b=JkbzlP+HKJdjL5BqipVTpE3er+8cQ9dt2TmdhsyefiGSVyqIEG3F2d0Z
   zQPJfS2wVgifVmnpUY36QACELqD7AMPvxVPJ1pKXGYjI2JD30NqiustJn
   DbQz5CStBW34d2br5Fx0r8GKNzNdvPXyXQ9KBuCcaMz1vHPSnMGoFtTkc
   ZnluofoWkqL2vhIcOSfbahju5enL1Zwlij50KMt6K2NdJejaQfcOkaiyA
   CYLBCngMqT5WBtX8J1OyPf1ZNx/Tz/m5fe+QjlupavPm0gtUll9yjFdiX
   Twgtvccy3sL2Q8EoNPAh3tfiAMzdmO0uf0fVlla/pmXPWVbwagIlnjkTT
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,262,1673938800"; 
   d="scan'208";a="205492233"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Mar 2023 02:51:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 02:51:08 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 15 Mar 2023 02:51:01 -0700
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
Subject: [PATCH 0/2] Add PTP support for sama7g5
Date: Wed, 15 Mar 2023 15:20:51 +0530
Message-ID: <20230315095053.53969-1-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_025114_872326_DFD16567 
X-CRM114-Status: UNSURE (   5.66  )
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

This patch series is intended to add PTP capability to the GEM and 
EMAC for sama7g5.

Durai Manickam KR (2):
  net: macb: Add PTP support to GEM for sama7g5
  net: macb: Add PTP support to EMAC for sama7g5

 drivers/net/ethernet/cadence/macb_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
