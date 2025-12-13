Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0D9D59F6F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Dec 2025 07:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bh5KdXkassShT7lYwcD136PMq+53uURjhFgiMJsrNBA=; b=KvaW/mcAAjuZPw
	E4vJjhI+ENbQT/Csg7ROKHSdQTibPusGMY9w3I37O1H4GzCXQ2eRxpktKgo7Tp/89AIAB07ach9t+
	g4F2F7fjlTnLSSrm2LSMYj9kVT87PCPHN8f1QMyySnGTAv3QkadYxnRV73F6voKpzVL+cQJHgVzOI
	tbVpqeNmd2M5/dF+MbLeAnzD8/HqhH9Kn3ChtUVInFrAdH5VXi0SXlL22gc0X00KebO6BsHMiz4xM
	fg9RZ4aep5BWYyvaYwuX//pQxR588Wk7Bu7MMGNEoe0Aaui6wfnF2zd/pImQNH244la7mP8TpZW+N
	7+HEcbZeKQUjs3/PWp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUKNG-00000001Vc7-28wK;
	Sat, 13 Dec 2025 07:49:06 +0000
Received: from smtp-21.smtpout.orange.fr ([80.12.242.21] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUKNB-00000001Vbh-0jWr
	for linux-riscv@lists.infradead.org;
	Sat, 13 Dec 2025 07:49:05 +0000
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id UKN4vDVOgExqPUKN4vDE3L; Sat, 13 Dec 2025 08:48:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1765612136;
	bh=TmR7zwuEwzlgwCwE4av5VCifSpkN9NkXmUL/n0dw1EU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=l9AMgc2nXTMTYWOFBJ938avi7lltf9B3F3SY2CV+2HkXNbU1T2bAj8mHum36wV6QV
	 RTOp3e+DeKf5q7596u178aPfzDIHQXTw5AkosOJ0dHReiUOG7BDx/B62TIfimFtCBt
	 6AoE5gf6pFhkLhDH1Gltrsm0G4AUEujH8BFzDcITl0/grTjRkHU/0rtbE+BhQKQ1vZ
	 KQG2yyc9TvARE+YKTiOk9zKVSkG9SB2fZQmkTcDP/6vZSp2Yhpw6IyAkwr5gCZ/q48
	 yWUwhjx6d+NIiQF3B0V0EtWQdr8ofZVlc7lp/ekqaWT4R31Ar8UZP+vaxVZ/azgO4h
	 VQ2qM9GvgPhJQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 13 Dec 2025 08:48:56 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: [PATCH] spi: mpfs: Fix an error handling path in mpfs_spi_probe()
Date: Sat, 13 Dec 2025 08:48:51 +0100
Message-ID: <eb35f168517cc402ef7e78f26da02863e2f45c03.1765612110.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_234902_418368_9E9C5976 
X-CRM114-Status: UNSURE (   8.21  )
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

mpfs_spi_init() calls mpfs_spi_enable_ints(), so mpfs_spi_disable_ints()
should be called if an error occurs after calling mpfs_spi_init(), as
already done in the remove function.

Fixes: 9ac8d17694b6 ("spi: add support for microchip fpga spi controllers")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is compile tested only.

This patch is similar to commit 8cef9b451dc6 but for another driver.
---
 drivers/spi/spi-mpfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-mpfs.c b/drivers/spi/spi-mpfs.c
index 9a14d1732a15..7e9e64d8e6c8 100644
--- a/drivers/spi/spi-mpfs.c
+++ b/drivers/spi/spi-mpfs.c
@@ -577,6 +577,7 @@ static int mpfs_spi_probe(struct platform_device *pdev)
 
 	ret = devm_spi_register_controller(&pdev->dev, host);
 	if (ret) {
+		mpfs_spi_disable_ints(spi);
 		mpfs_spi_disable(spi);
 		return dev_err_probe(&pdev->dev, ret,
 				     "unable to register host for SPI controller\n");
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
