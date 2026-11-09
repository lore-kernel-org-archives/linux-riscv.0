Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6E660A3822
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 16:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=34Ddj7kg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=CS/ORvyn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/Z43wch8jYMgJlY597V7mjnKD13lcydX6wn5RAFIbvY=; b=34Ddj7kgB8VqlO93MpeSomaG5B
	g0QTroNxEgwyod4PmuIq0Fl3bfR0m6LTUvE8hv4r00e/s9LVgX3Hr4McdaoV8SaojSxK9xvSKBkNq
	V5YWjDsrYHDs/wxRE4MhTm4ctTNFucvJm62hVL740TYH+9tL6uvQosVw6yjFF3diyrH+sz9PFmtZA
	bZweV+xPHEeSKEYp9sIUhJbeaO3o/50yG45L7xPusudc22lQkl6tRg1Lo/VwOjltajBWScyXNPnOo
	NRmjGWucZcd4D5VX3dSPQhHOB7zpV9gYSoUySwF1dB4c30jI4MawOznVoAWibhsCyakLyiqmx1RLV
	RT8fwdyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSaO-00000001Eva-1G4c;
	Mon, 09 Nov 2026 16:51:12 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSaC-00000001EnH-3YBF;
	Mon, 09 Nov 2026 16:51:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4D90120282D;
	Mon, 09 Nov 2026 17:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lVgMJDLJX58FGOIw6UkQAA3RMYGX2BCLpb7/jWTZW50=;
	b=CS/ORvyn+5/F6dPFXZ9GqC8y4Z8+YhX8ksBoz6n8aaNft8rKXntmvoFPlf3iT48NtoM1W9
	P1Wce06BMa2B/1wToWihGslgbk15/cAruIQ9RuMzHSegGQAuBWRyZheD5aJsn5wfe25Gm+
	5a9S0UhRLFWbFzD9nbEVKyc3e0XN62etEt200qSNyEyWQBkfVcnLVagU6vN53DR+jKS2kA
	29mbgur4/JpeGv+67O4DHmm7gRcXbCSvTnOd+vPVlAJ7sXbbl90Xxeilga7rr2QEnL9hui
	GCD6DNki7F5Vx7OwhsATaUJ6jSpWKO4isx4i6wHFwNrB/mAQRz6IOcUvWGQBcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lVgMJDLJX58FGOIw6UkQAA3RMYGX2BCLpb7/jWTZW50=;
	b=PXgRLUKCuvfrQDA8vc2I42oOvG4L/zNBtfmD/avdDlj+A1qzqp9UhuAHJhaupB2TFt9u87
	wTQrOgAxK9xvLPFPUndnsEhXmQ8bGaULbegkB3D2DrR/FcMcRTNjvMBnPIoEJ8XIMYwBcG
	6a9WSrvwL9iYGmWFphjDGxJxz9eLa6pDYLBNXfPlR4PZKfgsvwIIB1rRfc9EdOyhfu4Z2O
	GDZesRnVi8nrE8D7gVTjRJ8cnRuFXnbqd5I7XF2ENOqVL9Xm+ixpzYcX3JmCumey3CyRbY
	Y/bknPpgyveUUkfvT67H/JTMNeinyPRJLKtvzbQoGYB78PaMLj2+ka5sIAqveg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794243053; a=rsa-sha256;
	cv=none;
	b=Ikl+eSriyuigOLb4tCvWi4ImZKaK1Fu92onltxBUFxSgbtLbMU9BwDYc46OF/+6WGhUMT6
	Z+GSA1P8GJymfVKs3aQ+7cO8aJp0Gn+/ucEq3xbWwVGFoB9jpp8nBNmChATXcR1GtLvQGc
	P3gNbgos3c6QS4sKvGdnYLART3z4tQP2CvAOYWbfqBowOr0gIi/5WOpx6VsrQJKifAmCMq
	DppcTb10xvF2m6pKmfQVVqzMNY35LP397siZTj7ruKRXvPwt7BzzR23J8sRlp88DGODGGA
	1OQdf1mYeexn7SBZEbd1/yl3QkN9Ab8w6mN8+uWDJXPyIb9rb58ocf8kP2QbYw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xQSa5-003N3i-0l;
	Mon, 09 Nov 2026 17:50:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 09 Nov 2026 17:50:45 +0100
Subject: [PATCH v2 3/8] reset: k210: Use regmap_test_bits in
 k210_rst_status
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-reset-regmap-test-bits-v2-3-c886689bb85e@pengutronix.de>
References: <20261109-reset-regmap-test-bits-v2-0-c886689bb85e@pengutronix.de>
In-Reply-To: <20261109-reset-regmap-test-bits-v2-0-c886689bb85e@pengutronix.de>
To: Damien Le Moal <dlemoal@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_085101_076097_9692F62D 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Simplify k210_rst_status() by using regmap_test_bits().
Now returns 1 if asserted for all bits.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-k210.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/reset/reset-k210.c b/drivers/reset/reset-k210.c
index e77e4cca377d..58ad8be18741 100644
--- a/drivers/reset/reset-k210.c
+++ b/drivers/reset/reset-k210.c
@@ -59,14 +59,8 @@ static int k210_rst_status(struct reset_controller_dev *rcdev,
 			   unsigned long id)
 {
 	struct k210_rst *ksr = to_k210_rst(rcdev);
-	u32 reg, bit = BIT(id);
-	int ret;
 
-	ret = regmap_read(ksr->map, K210_SYSCTL_PERI_RESET, &reg);
-	if (ret)
-		return ret;
-
-	return reg & bit;
+	return regmap_test_bits(ksr->map, K210_SYSCTL_PERI_RESET, BIT(id));
 }
 
 static int k210_rst_xlate(struct reset_controller_dev *rcdev,

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
