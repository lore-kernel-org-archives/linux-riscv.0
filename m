Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7EF60A3815
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 16:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YoeSm8Cl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=GIYunKHL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XogcTBGlRZUlfzRf8zJpd8izsHSLPtfNhD4xu7WXRHY=; b=YoeSm8ClIeI90yadmrx7nhnNeq
	R9JzqgiSt+V+A0KmSBvkil6qNaL1raugaZwsN2fJ/wVS1NL4HGiNq8P2GqAKzphEN8vzfEJGPMF2J
	12xfXrw0M5GWY4x7rUjTRBTOloh1Eh+UMH+1G+byoBziojW4KfEKkowD8NVzoW0u+IYhaAuFNeZqh
	LQojwiyzHE4dPTPk6n/j4WqTHWFBIrIS7Wo7FFMi+FI55K/eTib3qB1de+5O8lC89tIe0H58RigjN
	OEgR4PVVwnwD3REtFLAKjBXyNMuIcOxjKoJ+FG2klrxrUUYmz2y/rzCnZj1e/uVk0AXnH9ukkZE+k
	aRJ4ZumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSaI-00000001EpY-0Q9v;
	Mon, 09 Nov 2026 16:51:06 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSaC-00000001EnF-36Jz;
	Mon, 09 Nov 2026 16:51:02 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 33AEC202335;
	Mon, 09 Nov 2026 17:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AsfDc2lIVdUkIBHGZ7oR8C/AevU19hN37f5vWQO7kw8=;
	b=GIYunKHLulVCrJisIbDAi4EgnTHvYtWLlHkPX2wGeadI1QOaJvT/WagUANwGzuq2YMjhCP
	EiEI+/Jf1gyKI9fz09oTyd2yeSGhDuOD89RwH9ViJOCK1ArPxbB2FOJzKrebxgN/aukBHm
	PxvPpvMWO6zQZ1oQI9+2ka7Wg3ufy2CfIKiDVEWQy/5KND5TRCMRObsFjYPHfhgV8fg3p6
	zJv3wVahDI8f57I9IYQf/bM/098/P5QJ4ZklhnbctmYsY7ZwNYEEBadKJyITpMWllKCT4v
	iKgvutno78KDi/aMc2PwvhDolDIjiv/xxUtx7HlqGywzM45L1a14hhX85OlVjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AsfDc2lIVdUkIBHGZ7oR8C/AevU19hN37f5vWQO7kw8=;
	b=MquShGxLVih1AfaCMaju54rdbb7kB7zD8V4hg5AfaMzmkgw572GKerfQwOvA9POY9Wd/h6
	E4tikOyFcPIF9DcRj4vxOJLYsuEjVILEiwfBrz+0cfgo1zRuOv9pM4RrQ7hbfxsZzHRpSq
	pb5GuasGLYLaskIKC3MK4OWYSgoWrM1YSz7nA1nMIU3zJPEiGPh4VZwIZgIwx6qKOgVOPH
	sNG7IcXNIuLlQSoUrnGXZYNPbISfa1nzz7J2Z06DK50oC5S0qhmJRObFmTofRGTm6gxYyO
	84cESm0sTQn4lxYW7qGYJoGrWKsneRTaiRoZO2J6WR0bwUuNMwrx5KFAiyCBUQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794243053; a=rsa-sha256;
	cv=none;
	b=bq8lj9uwqm/3Kn5NSmR43owmMSIWt9kl7pg1+j2sjaWz1FvoS2sewBtWhNVvAjOnBAJkZh
	bIevPRYvLEWF7+P8jw/jwgW3gk79e/xmfjWEMWENew1PdpbnUN/hsShTgpceCtujd6ZxaZ
	RqoiRp+PYI8csQQJC5M+P3Bp0ndGX76fMEXjqyxrQnIGdyNN/ljKvn6Rd9p10YMDlTvBNi
	mcCHTBR8SOlqikglX66RPfl7Yen/WoMNJpAB9B3g7k3teO0ziPpEg75xoKbugd/y1nN64O
	T5/b7e1yBOuBW6eOaNOz+YptTH02j0A6rPfzhipDXgYjGDSbqGOX2dBoXycXKQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xQSa5-003N3i-0P;
	Mon, 09 Nov 2026 17:50:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 09 Nov 2026 17:50:43 +0100
Subject: [PATCH v2 1/8] reset: a10sr: Use regmap_test_bits in
 a10sr_reset_status
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-reset-regmap-test-bits-v2-1-c886689bb85e@pengutronix.de>
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
X-CRM114-CacheID: sfid-20261109_085100_930612_083B3344 
X-CRM114-Status: UNSURE (   9.47  )
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

Simplify a10sr_reset_status() by using regmap_test_bits().
ALTR_A10SR_REG_BIT_MASK() is a single-bit mask, so no functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-a10sr.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/reset/reset-a10sr.c b/drivers/reset/reset-a10sr.c
index 99b3bc8382f3..3285f68a72fe 100644
--- a/drivers/reset/reset-a10sr.c
+++ b/drivers/reset/reset-a10sr.c
@@ -67,18 +67,12 @@ static int a10sr_reset_deassert(struct reset_controller_dev *rcdev,
 static int a10sr_reset_status(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
-	int ret;
 	struct a10sr_reset *a10r = to_a10sr_rst(rcdev);
 	int offset = a10sr_reset_shift(id);
 	u8 mask = ALTR_A10SR_REG_BIT_MASK(offset);
 	int index = ALTR_A10SR_HPS_RST_REG + ALTR_A10SR_REG_OFFSET(offset);
-	unsigned int value;
 
-	ret = regmap_read(a10r->regmap, index, &value);
-	if (ret < 0)
-		return ret;
-
-	return !!(value & mask);
+	return regmap_test_bits(a10r->regmap, index, mask);
 }
 
 static const struct reset_control_ops a10sr_reset_ops = {

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
