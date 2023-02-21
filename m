Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1B9C6379F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8HCJfIefjzPHbI2VDC0KSRoy3ZfNXZtBjSe9eCkEDhs=; b=kYu3fuPnpEarf9
	PDdctZRjRSGEhR0DgU6puDhPewBlxLiudT6XB5G8nhpnPdc/jtOno6skA1d2nzbnkfGoorX0uPVGB
	oKJbYieZdYz+UQCf6lHH9lDQlnD8thbYKUVnEM7dZM4mOgTlsOHwELo/5lzee+yVFiIEB4EUwnTAR
	xYU2hNMbk/IvFWgflWOIrHIMAVBUplkYWKxVpn75+9GaBbSuNgsSPg71XEWitRoU0RPl0/SBVHUxT
	f/szKHpwAgfCGi+37Im0qQe0ZzbbvdI9MOuxzYkspmnjh+/NN8o0Ky58FOQgTpLPWJArsy+xY9jkM
	wrqqwuMNuYjrPQMmJwVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUOpy-007AaB-42; Tue, 21 Feb 2023 09:21:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUOpv-007AYF-6h
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 09:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676971283; x=1708507283;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Pmenu2GVkhSBQ5X5KgWqeKvBL7nngYZy4hgpQatRc4k=;
  b=SaGJr7sFhHYNSnZRnBRuSPdxmbxKybm18+/v20DUppHCrSaAo6yrd4n3
   vWR8WS9POOHR711Kp57oUOwLamKwPSxwxFAIrTSlcHKboz+YKrMKoVf7M
   0SVZhLbRKb/NUBdWLpkkfQCAVpwCk+SbM9rGq7DfLZrMv7vTsIHgxsp1n
   kF0+LrPx4wkfM2KAITPsqJdrtTNfUqCMs9UjAwuRVc5Vix7MZV+0kkgR9
   UV6bW9JGihvUj7ZiUpXw/ZTHE3ntxDONWj0TKB4yjiDaNVCJeGwzX4F8V
   J3mgp2y5KDVrErgPs46TxCw7lBIHtzGiVUPJAG4k7nE0UchCZeqaun0md
   g==;
X-IronPort-AV: E=Sophos;i="5.97,315,1669100400"; 
   d="scan'208";a="197955817"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Feb 2023 02:21:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 02:21:19 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 21 Feb 2023 02:21:08 -0700
From: Durai Manickam KR <durai.manickamkr@microchip.com>
To: <Hari.PrasathGE@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<manikandan.m@microchip.com>, <varshini.rajendran@microchip.com>,
	<dharma.b@microchip.com>, <nayabbasha.sayed@microchip.com>,
	<balakrishnan.s@microchip.com>, <claudiu.beznea@microchip.com>,
	<cristian.birsan@microchip.com>, <nicolas.ferre@microchip.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <richardcochran@gmail.com>, <linux@armlinux.org.uk>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Durai Manickam KR <durai.manickamkr@microchip.com>
Subject: [PATCH 0/2] Add PTP support for sama7g5
Date: Tue, 21 Feb 2023 14:51:02 +0530
Message-ID: <20230221092104.730504-1-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_012123_378745_DDF364D5 
X-CRM114-Status: UNSURE (   5.91  )
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
