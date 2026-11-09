Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71081606EE86
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 16:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rtX9W+OV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Ob1h9qiU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=caqD0ZTOJw8Z9jIFmLFfiuuAJBLCSv5B3Lw1k3Ibb0M=; b=rtX9W+OVLQTunDWMw1rFHf2Cki
	9Oqa32+OxbAFFGzBPioFw9ilKYmUifzX5bZw+cY8Gd5foN6zecP6Q1BvuFOE3uI3UUQW731kC2l8l
	frUlqhyVU7X2zpUXQnmWiDHRbRe1Mw3P+zRNZaAyEKNdsjOiPYE6TMMu2lo5tMLUb9yY5qEer0um/
	3bIMqvQnxvNAbQwEaGJKjkCrmySf7I1WLCIzSL4YVU7hdh6GJwz3FVaeO1b2ehppvjxv0jau1NBdj
	qEwgIuQkWnpxeYVB/3WzBD+a89aKlSRJeZ4IFyk+Dw3ExohYZVHpSBmzlBDcbTF6n7rQo+QRTewWH
	Edfml0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSaS-00000001F0S-1KSy;
	Mon, 09 Nov 2026 16:51:16 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSaG-00000001EpF-0Fyu;
	Mon, 09 Nov 2026 16:51:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 65749202831;
	Mon, 09 Nov 2026 17:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KHZPpXsmlkXJQiyTnz6djJiKsSdReXhtcFHMd210oqM=;
	b=Ob1h9qiUtTmmSMZofNte3UUeYz6H6zzUJBzoQTiReeZlEB37IB/cKscqJ2imEhzaFsXHyD
	Vs79SZjjxTnZdWgzAnhxlDbpDoOyWhjDcAJTQjLi6pA4tlZEUs+2mSTh1X4wD3kL19qamV
	FNj0HFqlkXJyik12z5gGwFv1rk9x2WAX5+7rTdusqtNhFGcQWmCr0UNU8XUOKEqSI18wvv
	fM5+0am6tlOJwqkkKtYj7Xr8tnFEci7DZyA774m4aZ++E3LnwUfYACBQYWE7T+rNMltFpf
	5EmsSfJZ7cTMto1o3GpC+MOkSdlLaOguMQ1P1isyPadY2O56EiixexfosqMUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KHZPpXsmlkXJQiyTnz6djJiKsSdReXhtcFHMd210oqM=;
	b=N9gDQB498FJn8vKu3eB8dlUHD66HAZxz57f+96QH/Ey67PxAN1K7fxMnbprTyFuPrIIskh
	6jxkriMW7BjS534Xf3EaJ7kaB4+EqHhjXhWbo6tEhYetL1yu7voXx0g/kEyyzgmlDkhCAd
	pHbFjm1fq5E5rvJkA0VYr0BfxxVK7OA3GExIeLuOdjJfXWLw//RG6E9mHb4hQcfQr/lxmO
	4giwcnTYU/OD35Icg/3Fh28KJv0SyERd6jMf7d+41YiFpdmIdQunT6NBdLB2s0HD15hk/O
	yZt8UPFXm3c5sM+hPDLx5AMmeLVOU9mAof+3EBMlbrmVFPUJe2M8sSj+IXMTRA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794243053; a=rsa-sha256;
	cv=none;
	b=L0qLM8QLV2UYduBZeq88qnviowN1FESdDq5veCmIvlETdYXhxiAaA7PN3jmanjbZRQEdn/
	4Lm5Q2m+uuq7xHbvl5OdcclNE+XETmuwsqvxp3/S72+ZzN/hSodCaL9i+OIyvJfr4FWxVk
	9oqWEvh4KeoYg+chKnvbmVQLv8uyOgAtPU0+awqbDBKAII568tBRAf9ZsNkl964T014fcf
	G98MVEpSK0mBo4ZytZ3NjtaSV9x5gZhU45L8Z1tNp/LkzSwsYFDL4AfXMX6JG3w8PM94xf
	RMeQmcvFKhXyi6Zk6ohLg4vY5lPShy3aAPd0EdW281Hr5DufM4th9BUeL3ucVw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xQSa5-003N3i-15;
	Mon, 09 Nov 2026 17:50:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 09 Nov 2026 17:50:47 +0100
Subject: [PATCH v2 5/8] reset: mpfs: Use regmap_test_bits in mpfs_status
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-reset-regmap-test-bits-v2-5-c886689bb85e@pengutronix.de>
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
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_085106_026541_7C39D287 
X-CRM114-Status: UNSURE (   9.49  )
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

Simplify mpfs_status() by using regmap_test_bits().
Now returns 1 if asserted for all bits and propagates errors.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-mpfs.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
index 8ffcc54ee6f6..ec61b4a1d753 100644
--- a/drivers/reset/reset-mpfs.c
+++ b/drivers/reset/reset-mpfs.c
@@ -63,15 +63,8 @@ static int mpfs_deassert(struct reset_controller_dev *rcdev, unsigned long id)
 static int mpfs_status(struct reset_controller_dev *rcdev, unsigned long id)
 {
 	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
-	u32 reg;
 
-	regmap_read(rst->regmap, REG_SUBBLK_RESET_CR, &reg);
-
-	/*
-	 * It is safe to return here as MPFS_NUM_RESETS makes sure the sign bit
-	 * is never hit.
-	 */
-	return (reg & BIT(id));
+	return regmap_test_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id));
 }
 
 static int mpfs_reset(struct reset_controller_dev *rcdev, unsigned long id)

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
