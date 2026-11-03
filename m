Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4B5606A335
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 14:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=20U5qVZm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Id1lym5F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=50tt5hLaeuAyquZ1a3AKYifSiSuZ1Y1PC/D113+/q7I=; b=20U5qVZm/idwb4vdPrvMlnZxL+
	TCaWVTZANycB6/Gpm4fHUETalfeJwPUL6C0XnNvrigdwBdyz/mH3KrLZpNwcIr4h20sCE4kDkslLe
	JlfN1t2n2AA6/wDQwVPbOnL7Y46r1JC7ErGaBt2g069tiamCrR7xkXjQP8irHNg6Tyo6LgZ/+QIi9
	9myhasAmmEwVNv+QInzfIMe6+IxPmrCc0AnyTjGHXfYT1G9ENcF8qcjAjZWcy42kH1+KOfU67jFN6
	LHazgUno+0+5Xvon1G+YoGrNzBMzctRVzq63ZHeZfiOwEUCdUOgPZAFAvY4LZolmP4gFwiPHgtYmT
	Y6tKt7qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFrU-00000002mt6-0bbG;
	Tue, 03 Nov 2026 14:51:44 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFrJ-00000002md8-13Q8;
	Tue, 03 Nov 2026 14:51:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id F14CA202BA6;
	Tue, 03 Nov 2026 15:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x+rKpDcUVvGPJr3bkDQyTK7gGqYh9JNlycfqo4e6K1c=;
	b=Id1lym5Fz7t+eMxpTMaZN+7TiHwPNmmcA6qeEbzBAkMVEeaHVZ3JpImn/a2ROI/47mmpvp
	/msZzxLCs6ndeABFb7Xrt7zQKHs/9I9hZRSaAJTsLZZFpwLmLRpSWd31Em8ES+xAgnH3I4
	Kczi2G3bBc6FZ0vBlVjFnm1/dqe7Am0PtW+ylRIPRsH1KjgitOuyoSwQuaPcor7B/ZDq13
	3oELqH3TzEbUPtEfkDLcEWCLqmWtmL+uKnxNJI9UqzqkluSZ7WcmZIyecl/kccWjy+2Vqs
	AbXxhx34cRD6fAkoS/wkynfubyvInx4VIMiddsE8aewOHKArK7Tkwh7qJqHrfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x+rKpDcUVvGPJr3bkDQyTK7gGqYh9JNlycfqo4e6K1c=;
	b=Az8RUpguMPpLhsGgRfw7RuOBgom3SCeAvy3SX6ktwYbDNVQCG+OHvE0/stwIdy0e5cSa80
	cggOlzAS01OZx5wBdOUScAFVIv98t9Z4lEINBBxuWhnA4+LpdinmgYcn2SO74z9OqtB2BE
	KSS9XWCcBkF618vDrRA7/wAy0Z26DX5kkXLdCIIGk/uDq+o1fGurtjl4E76jNBZ/B/g9cp
	gF8vXd7TiDKPvxW29DIZdx622XUumdr9N64BwozYgWSWcpUYARdeOYzwX7w7hf9GUnpMCq
	9+Vp4BBHE4vps5R3BbwALup6GMUPZBXgFukcHKRMNlqPxjF42+/5ktloEjeiXg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793717482; a=rsa-sha256;
	cv=none;
	b=Yj9e63n9Y+J42c/b32g509Z5AT2fUfSGYlMuTCi/FhHQf2d1AokcLvKFTAT62Jpg5NolWE
	k+pa/JoLiCRk+M/KNqvztHOgSKk3JKaI2+vfRYeACQ6txXYJyqTeJnKvlBQkmKCn+UYi/+
	jYNI/xxZMludtFA6y6Qh6BzV2R5rmdQ2FqMMVseibDD9n6SRskdWXOucFxVKD37QBEq9Pg
	wuUFN6fcm79j2s2pSsSoogznKozh30Ed0LI/5ecSCX8/7SRAlhZmrxiGWbOPMftvm/YJBd
	5CNSYOHcYy3j3O8frpHwmmWznaqArR3dqUaAoxKMOJlQFjkvMQaKrFitXGSTBg==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xOFr8-002SzQ-2p;
	Tue, 03 Nov 2026 15:51:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 03 Nov 2026 15:51:26 +0100
Subject: [PATCH 6/8] reset: rzv2h-usb2phy: Use regmap_test_bits in
 rzv2h_usbphy_reset_status
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261103-reset-regmap-test-bits-v1-6-1b33607a76b0@pengutronix.de>
References: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de>
In-Reply-To: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de>
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
X-CRM114-CacheID: sfid-20261103_065133_451701_A97DED28 
X-CRM114-Status: UNSURE (   8.31  )
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

Simplify rzv2h_usbphy_reset_status() by using regmap_test_bits().
No functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-rzv2h-usb2phy.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index d96042e28cd5..e644092cc2f7 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -68,11 +68,9 @@ static int rzv2h_usbphy_reset_status(struct reset_controller_dev *rcdev,
 				     unsigned long id)
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	u32 reg;
 
-	regmap_read(priv->regmap, priv->data->reset_reg, &reg);
-
-	return (reg & priv->data->reset_status_bits) == priv->data->reset_status_bits;
+	return regmap_test_bits(priv->regmap, priv->data->reset_reg,
+				priv->data->reset_status_bits);
 }
 
 static const struct reset_control_ops rzv2h_usbphy_reset_ops = {

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
