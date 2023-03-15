Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E63C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 09:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qE5B6yj8mCnmpb7ONrBemI9xupkz2K9Qr0cydpICpKw=; b=wGLjlofucOLWPk
	zbf0WTKI2KDFeP1HbaXueMMarYbafFAjvSCJjEIyXKPalADfsllQfAOCOZ0z2b0ZwLxMjygbBJ8cH
	IpNDg7skZSOUwMlzdu1Zvjw6ffbEcZb3KXp8/MYXU5urECs8RmPXD/XXs0ZrCchIrk+orhbiCK8Eq
	ZSvvcgiJFkbGZH8MDdHIgwUdGjqKiy+G0WVx3WnBY/3leQXYDAchm3YSYfSOZf5JJvKTQlB6ZAdQv
	2b5/qLavHywwQWHCZcAKgFX+27/e1b1R6OxyVgBKlmYxUFWDmZvYcMsgzvwE0RxN/D5kwyJHgr4zP
	dzhJnwmy751GOg2aO4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcNn4-00CzHG-0F;
	Wed, 15 Mar 2023 09:51:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcNmz-00CzFt-0B
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 09:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678873881; x=1710409881;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nfbCz9FTpMLY06ZI7/EfisAD7xlhHf8Ry0R/DcJAXtY=;
  b=uzNXKAH6cj1F+PAKejRi84YMuPXjI61L9G+hPPm6ejVYsphoyByEELrP
   7uZHca1D5XtnUWVjW5m8eB+OeSZ+5AitXBSs0fI7N5xxaKHw67BsCy7bD
   hK6X7NWJ2n1OUia4ChKI1AjVfsdGjKU/7A26gT1wRw+HbiJzFFmrn0jFA
   yWMxzBNzIH+FbZuuzYEfMYMYBk3BT3rhnSrPK/UkJlwGasxq1VsfsgPuL
   o8MFCuUBi9ot9rK5qCGdfTa+yO6H50Uckv3C0Qj37S0HTklNv8OtqAp6F
   4doDH/RoLJMKpnpfL1+ReGrSZqwdxVCuZGmD3A7SZL9wsmpT828J+ZHD6
   A==;
X-IronPort-AV: E=Sophos;i="5.98,262,1673938800"; 
   d="scan'208";a="204854133"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Mar 2023 02:51:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 02:51:17 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 15 Mar 2023 02:51:10 -0700
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
Subject: [PATCH 1/2] net: macb: Add PTP support to GEM for sama7g5
Date: Wed, 15 Mar 2023 15:20:52 +0530
Message-ID: <20230315095053.53969-2-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230315095053.53969-1-durai.manickamkr@microchip.com>
References: <20230315095053.53969-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_025121_099089_208EC1C4 
X-CRM114-Status: UNSURE (   9.27  )
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

Add PTP capability to the Gigabit Ethernet MAC.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 6e141a8bbf43..27fc6c903d25 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4844,7 +4844,7 @@ static const struct macb_config mpfs_config = {
 
 static const struct macb_config sama7g5_gem_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_CLK_HW_CHG |
-		MACB_CAPS_MIIONRGMII,
+		MACB_CAPS_MIIONRGMII | MACB_CAPS_GEM_HAS_PTP,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
