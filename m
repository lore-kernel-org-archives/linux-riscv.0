Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307E2C5CFC1
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 09:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DDoJ4ovcAzbHH+gtmuIe6aVRyxD8lp0i68S1Pd2GyGs=; b=0YUiAvumK/2Q37
	HxcKH4UAkZIF1Jf5qzqA1BWYpm5l0Ttw8G577cetTcTO0HfZ6HGtATL8dMSflBMvvrU6plnGZF6F6
	V4X0xnl2X4Yuvy1qtdgIMzwpMbdEJKUEBzzQZbgpU9iQh6bY29+d3z1e3H4qe/qVjBfP++RwB6U3F
	QnXyxaBF70vwnbRa9Q/1UVHa9pa9JiRoVoGCkmhek6WRgUAX094rN9C+cGzUGNetSvx3bp7SYTs8U
	gyUvGK0he1mciUcDLKGXJP2nZEUumV+o+uZNP7V5QE7sLBCNe4R1sp15aVp+E5omC12xbNrnXwgLA
	ALizwNCO+vKPNigQXptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuo99-00000002MzP-0k7E;
	Fri, 14 Aug 2026 09:24:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuo95-00000002MyC-36Na
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 09:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786699455; x=1818235455;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t4H4NDsVqvtOh1B8bIPxsZW4VdsUsKMmQ3HmPurbO7c=;
  b=CNRku1Ybak9aYNVO1RUUAylA9Cet58xCtiihn14naO9KD26Y3Iki3rvV
   Reqt3qIU37AmCxjula8+6xvGIZyYX9acQLYqLkPw/wmCqdplrkiKeZR0I
   mFMHJpgktHxDExpZQuYwy1WhaWwVuFBOBKoEt1FyIsGAzEaF+G7RIFIqP
   f+OZW5Zuet3dM6J6HTK7fApWBWEQuG3YyFFnqpUmmrOAk6zkd/jcwCwmt
   aNBMzQFkCV4tteM9orkbdvp8i8N+bL321RRKL2icEeu3Ct2byuCTCyUFk
   zpjig0jaHlXpo9T9w+h0dz8pgBWZO3kxun2AMZ2Wo7N7kdu7dyKt+2W8l
   Q==;
X-CSE-ConnectionGUID: aH9GwClsR3igNfp7TJnB4w==
X-CSE-MsgGUID: BYlb580uRUGqR0UKjiA5+A==
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="62140907"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Aug 2026 02:24:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 14 Aug 2026 02:24:10 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 14 Aug 2026 02:24:10 -0700
From: Pedro Kopper <pedro.kopper@microchip.com>
To: <linux-kernel@vger.kernel.org>
CC: <linux-riscv@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<daire.mcnamara@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <bmasney@redhat.com>,
	<valentina.fernandezalanis@microchip.com>, <conor.dooley@microchip.com>,
	<pedro.kopper@microchip.com>
Subject: [PATCH] clk: microchip: mpfs: fix regmap_update_bits() mask/val order
Date: Fri, 14 Aug 2026 10:22:13 +0100
Message-ID: <20260814092211.2158337-3-pedro.kopper@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_022412_079046_FF44666A 
X-CRM114-Status: GOOD (  10.75  )
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

mpfs_cfg_clk_set_rate() passes the mask and value arguments to
regmap_update_bits() in the wrong order. The resulting write becomes
reg = orig_reg | val, causing bits to not be cleared if the clock
divider changes.

Pass the arguments in the correct order so the divider field is updated
as intended.

Fixes: c6f2dddfa7f9 ("clk: microchip: mpfs: use regmap for clocks")
Signed-off-by: Pedro Kopper <pedro.kopper@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index ee58304913ef..7f044775aea8 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -285,7 +285,7 @@ static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned
 
 	mask = clk_div_mask(cfg->width) << cfg->shift;
 	val = divider_setting << cfg->shift;
-	regmap_update_bits(cfg->map, cfg->map_offset, val, mask);
+	regmap_update_bits(cfg->map, cfg->map_offset, mask, val);
 
 	return 0;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
