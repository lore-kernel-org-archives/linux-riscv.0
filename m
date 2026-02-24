Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC0BE9B243
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kgYklJtaJw6Q0ylZAX6Aibjj+lHU20MZf30taaaNRVU=; b=Uc4JG/5d1wmE1x
	8fqiLaDPLV/e7TrhY0FYQLqe2IwiHMooJD4VvJy2G73VyOuJl3iUZwomQz8oIzh862DDRe1rZ7YgS
	x8r6O4belupIhYl6XNNN/IZrxMmEBeQ7MW23WYMnuJYPjsmPxyHbih0RFlRbQRl5cGImpZsYH2RdD
	nyzAv0J2fVd/i/SiPVZkOos86/pZjU32l3aTHyUyEtXHdn5YL3QCSEdB3HKxIvj2pnvqeswGjwozh
	iKAiTKS/jKXyJTwDH/Fn4FVsSKfUi5q8ok6DZTCGaQwUEoP/QGJSjxozuRKYX33nMx4ez4htHURxM
	NM9ChTMCb/BqIQASL+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoqK-00000001mID-3PRH;
	Tue, 24 Feb 2026 09:36:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoqI-00000001mHM-0yaC
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 09:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1771925792; x=1803461792;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iSe8V6XyfiQWAbZuq2LAZaMK748jdNxnXDIx3HLR36s=;
  b=COUHfP41qvjLpl/OZZVhfl/dV3rA6U3p07ksGxYKD4v5gPUjfHBp0ICw
   JB2sZtbKb9jrH4nOHkpEuOraW76NRKGIUh/njpdG5t50v/iey4LtHQlyp
   b3W3z6LsAe++lzis/EEOMu6sT4P5oajrqAD2+ic/kx90FeaUVhT1hf2Ia
   4DLgtZ/o7CoQ2e3BM6WszcdzIlFUect+8i04oIPcNToElUORDye1wackw
   2Jcg+j9341H15pSkPyCvr7H7nrIvnrkO63YtrkLyOqTFJ1hJstBHbQ37e
   awXNWQdVc/HBFI8KvAanGv3Y18L6EEp9GZiRkzE0WJnbtv3cr5zLPKjbj
   Q==;
X-CSE-ConnectionGUID: q+wjTlEOTWe2iGgzOhxVFA==
X-CSE-MsgGUID: D/CSFvWoRlePx4NNJMu55w==
X-IronPort-AV: E=Sophos;i="6.21,308,1763449200"; 
   d="scan'208";a="221050262"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 02:36:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 24 Feb 2026 02:35:55 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 24 Feb 2026 02:35:53 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-clk@vger.kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, <stable@vger.kernel.org>,
	"Daire McNamara" <daire.mcnamara@microchip.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1] clk: microchip: mpfs-ccc: fix out of bounds access during output registration
Date: Tue, 24 Feb 2026 09:35:25 +0000
Message-ID: <20260224-briskly-scholar-294d13464721@wendy>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1666; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=iSe8V6XyfiQWAbZuq2LAZaMK748jdNxnXDIx3HLR36s=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDJlzC+4f9/1tcWCXxMfJZysO3ll1oPXkIYntIsnzWC6mmj2f JJWX1FHKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJZHszMlz89CPnlFGJB1NfW8x3xq 27liqId/Smnt0Qax2tOdXT/gQjQ3uvyN/n4aZ3XZs7P+0uKTfZpxO/883EpsT5jLys87nf8wIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_013634_349239_E398C7F6 
X-CRM114-Status: GOOD (  12.51  )
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

UBSAN reported an out of bounds access during registration of the last
two outputs. This out of bounds access occurs because space is only
allocated in the hws array for two PLLs and the four output dividers
that each has, but the defined IDs contain two DLLS and their two
outputs each, which are not supported by the driver. The ID order is
PLLs -> DLLs -> PLL outputs -> DLL outputs. Decrement the PLL output IDs
by two while adding them to the array to avoid the problem.

Fixes: d39fb172760e ("clk: microchip: add PolarFire SoC fabric clock support")
CC: stable@vger.kernel.org
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: linux-riscv@lists.infradead.org
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/clk/microchip/clk-mpfs-ccc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-mpfs-ccc.c b/drivers/clk/microchip/clk-mpfs-ccc.c
index 3a3ea2d142f8a..54cfbb8be8ab5 100644
--- a/drivers/clk/microchip/clk-mpfs-ccc.c
+++ b/drivers/clk/microchip/clk-mpfs-ccc.c
@@ -178,7 +178,7 @@ static int mpfs_ccc_register_outputs(struct device *dev, struct mpfs_ccc_out_hw_
 			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
 					     out_hw->id);
 
-		data->hw_data.hws[out_hw->id] = &out_hw->divider.hw;
+		data->hw_data.hws[out_hw->id - 2] = &out_hw->divider.hw;
 	}
 
 	return 0;
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
