Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2252F606EE86
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 16:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2BIjJBW3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=OUEDMP3X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lJHLJYj2gpnpXB85Uvgfbo2rMCkvOcCVlU7U9np+rFc=; b=2BIjJBW3wgudHUKmuZh+fGllfa
	OxsBpGK1UKFWsGOpNBeUfhyvA+/HdHhDPGVmYEX/g6+YcYBzt9ACgBVxfOGfoGN/kNSemn5eAa79A
	i0tUMtnmBb31yL442omu43TTYh9VW9rhvzGO9BtrniZk6Xy+qWfhPVqzEW8CDZWF7CaZw7VAM1+l4
	TcOhbYibt5uHyJ+DQzRxGFmeLIqEke2UWaAT7eBvX32zgNIJunLitXMr4Ks1lICiI93KpHxV+cjmb
	55UT8knpvNZ0iA6F9E5bDD2cM/M9TAdxnJAW3kGwQI9ldC1Fd+6mh00gJNYo8lz1Kno0LaAsRD+AX
	S6oA6CCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSaR-00000001Eyq-4Bdx;
	Mon, 09 Nov 2026 16:51:16 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSaC-00000001EnI-3ZkE;
	Mon, 09 Nov 2026 16:51:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5910720282F;
	Mon, 09 Nov 2026 17:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LeYzTo+5wlknwYT2A1AiMm8a2kxcJTAnRlx8DbSHsAY=;
	b=OUEDMP3X+H7nBdctbWihUwJMWZ/UimvsNEVpxN+C5u7LLlC0barKq3fhLCTcuCZFPxG8+I
	ytl3yv3eD9jLUFWIdUrdz6nW2jc+Ayy/SDNp3AiM31287+jSvHdDUCcjkZjhg1g33WkOX4
	jU5YOzX12NHA6Sry7VRDIoxnooP3TQB7+QGbNWw2hME7uT5BH9JMTjhAWyAGbMbip1uDOY
	1aKE8EzO7JpNj3tJeSe0bpPfIR2+Hyp+yuLSaHD8uDIFxZDiTvaRh7tjz8bpwYajsjnGiR
	/AYdarse5u/kG2VGCp/AYh8pDMjPqYB7p4K6H3eQzvFGlECh8nfiO6gP3gzHvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LeYzTo+5wlknwYT2A1AiMm8a2kxcJTAnRlx8DbSHsAY=;
	b=fQl7v0NGFM7wgh4mXnglAEngFo6hANYgPniCBk8DGElGIsz5gWs7HHBGi1eCNDoVdIZq6S
	qVZMWX1pigcl8qQqw1LBoaGxHZe7JKsz1mxMwdZcmpbdT7ksBnFTxJxiM8fIDMG9peguvG
	QOtZPEqIrEeFYlna8mhqw+I76EW2RVrMxmVcKHe2201+nCzKgHb4IWv9wbg0ePU1L1gTJX
	T4vmiA3/i+InxJjftzRLnX8mAsCBbdw6pJfqyCkwaPqHqvO2y5YplMJmKupsP83QDkPTlo
	GLOySyxVkB7Pp2THtjY2xZnXl61h9/rsHiF35uNOywSZk/luKlkG3mz05gT6jA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794243053; a=rsa-sha256;
	cv=none;
	b=eEFP4y6BrgcSQazXwCx20JCFkXxSgI8dXu8Xl9GZUa4uB+6J38Fr1tWmm5uV963dnpuFOw
	FKP389PJsas9i+9SaLEwRFJSW0CI8MHubwk/TRpsOIMPmuJzewO5DhdhHd9QTRKmmCZPRl
	/C+mExfjC6yr7SW6cyMPy8zxqYv48Lar88uKMhi2Tcd2ltul7q57oNs/DNZ1o68kJZ3vz7
	1XptTuP8LOEuvuMkyqnfyE9DDlVbGMgU6k7mkCRZCnoM5PtP6dkLnIeY8l2ANxoBaPN62n
	J/0hoEWtbaYTYzlTRXSLyNqcbFntxECW7cRzYQIvgO6CHeJOWkgS8Ha67x756w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xQSa5-003N3i-0v;
	Mon, 09 Nov 2026 17:50:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 09 Nov 2026 17:50:46 +0100
Subject: [PATCH v2 4/8] reset: lantiq: Use regmap_test_bits in
 lantiq_rcu_reset_status
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-reset-regmap-test-bits-v2-4-c886689bb85e@pengutronix.de>
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
X-CRM114-CacheID: sfid-20261109_085101_064681_BA7E11BB 
X-CRM114-Status: UNSURE (   8.89  )
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

Simplify lantiq_rcu_reset_status() by using regmap_test_bits().
No functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-lantiq.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/reset/reset-lantiq.c b/drivers/reset/reset-lantiq.c
index 652a45890cb2..6d7200b17790 100644
--- a/drivers/reset/reset-lantiq.c
+++ b/drivers/reset/reset-lantiq.c
@@ -37,14 +37,8 @@ static int lantiq_rcu_reset_status(struct reset_controller_dev *rcdev,
 {
 	struct lantiq_rcu_reset_priv *priv = to_lantiq_rcu_reset_priv(rcdev);
 	unsigned int status = (id >> 8) & 0x1f;
-	u32 val;
-	int ret;
 
-	ret = regmap_read(priv->regmap, priv->status_offset, &val);
-	if (ret)
-		return ret;
-
-	return !!(val & BIT(status));
+	return regmap_test_bits(priv->regmap, priv->status_offset, BIT(status));
 }
 
 static int lantiq_rcu_reset_status_timeout(struct reset_controller_dev *rcdev,

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
