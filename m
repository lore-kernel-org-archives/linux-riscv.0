Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF8760A3827
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 16:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yASbsr8u;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=aFBKmAyM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S+tFupEU42SJSsr+4Dp4WiXCfIfVZEBz3QGjhnAGxBY=; b=yASbsr8uDt4E3c3vRW/dYDnCAW
	wf9VVwAJZaP2/NGoVQ+kEIopJ8zXIKg7Ipub+UdSXtrfvv8HcnEgssFbXtET3FOTZgDAcmOtiIDje
	MPh5BExkb6mrU2Fxc0TJF0ypIQI1YkB54LkMQq0pDxnied0Q5rJSgRRNojf++3omp3HHDVXB0nYca
	7NxDoi9vBAUn0oCUfD5Y6ql7cN8XSPLEeVgNT0um/hhYeCSfT1XHGL2tNtiAWmxTeIHv7PiPYQuK8
	Mv4NgkOPCmY51ls0i1ahDni4obmqpqQPgSQdNafaTxgF87dMNxhNPperFK4nLpgys9Cbrf7v5RK8k
	QyDtUw6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSaO-00000001EvI-0bCp;
	Mon, 09 Nov 2026 16:51:12 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSaC-00000001EnG-3c4e;
	Mon, 09 Nov 2026 16:51:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 40CAA202824;
	Mon, 09 Nov 2026 17:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9UCRkbWywFXal792BpnI8niySpwaDg5ce3RMCLxfdO0=;
	b=aFBKmAyMyqu4P5imJ12ehJWd/c0iiSfSlKEcCWlx+f/vaAmv65yJFSF13B1ifA2IT/aXxX
	EK/NxshP2cjPl8JhvsvWiRrVOmRnM1sAzv/nskG/4cGeekwj61fxp0yqCQ0sl6a/6rbnG8
	TzZVtLz8N1uuR2v+bvy/blw4Yb4TILPNpouxX/cw9r2Uo8xEC61Yc5kXaVStC0LPERdC2y
	baNw4c8VWszTso7RN3pCWamk6sgujdvysO2N3VHcs/j/IS27JOftyuHgC/dhUI6PbdlNn2
	FE8lQQVsuNambBYsssiZ7bg1CoBLidOnGYkwEHQjjYaBDhagUbgJWeCM1OBAIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9UCRkbWywFXal792BpnI8niySpwaDg5ce3RMCLxfdO0=;
	b=LzFIhhYpkKLd/pTfTzsTzZCV2Lm42HnELvjy+rhEuAdS7YaLmkvUzDNm7LgidWy5iDpcVP
	jcGiF4dh5HD1RhIu6k5/modtY11eD5TBD2RCZJkryba0HzrcOtRYyRxTStyU49dZhx3KFx
	Rfi8pnIQS3kHgQn4s2OAo1PyCQaQLIB8oo3V/KRAYbVN0RuuPfrczBZKX280KTw1jeL4cP
	0Sh0Fd8soSN9IKJTyx06SAGA5G4jWr9tLlDe7/UtLhr+VC6LtOdFyAT+GpQtIYLyjHKA8z
	ytpGtvvzo2UUveSw7wRn4+lmmVgPgdge6l7gocQqxIfxZIJReEMIpMsEnSJb6Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794243053; a=rsa-sha256;
	cv=none;
	b=Eie2k+eIbPW5skyQ6S29wYUND5YsF9kPP1hTS1cPr2Dyqjf8BJ/aB0bDOlr1qtpHAYa50s
	Mbt6l9PE2lKPv+ckH1EM3mUFg0hXUIlIZgc3/Po+B3/HyTVhgXPzpb/Wzm1ix0VooxAhgI
	ARLJjLVptlHrdHVJyyzZDyWKSwvXpG3Mkr72+9UZP9KSLtL3RaH0/PHD39GLggVmZ4JGci
	tzRmXtyRH/ccn3HLWWdcgncDuSYxlfbilA/RKOc676/UwjkfRPzCqq22rHtjOb2HXQY8Jz
	HBxcQVYq+2T5HcC5KdCQYGzpX/RazZzEgBABze4XBMksidhgEeGV/Gqex1oKqg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xQSa5-003N3i-0Y;
	Mon, 09 Nov 2026 17:50:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 09 Nov 2026 17:50:44 +0100
Subject: [PATCH v2 2/8] reset: reset-intel-gw: Use regmap_reset_bits in
 intel_reset_status
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-reset-regmap-test-bits-v2-2-c886689bb85e@pengutronix.de>
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
X-CRM114-CacheID: sfid-20261109_085101_082066_7D63242A 
X-CRM114-Status: UNSURE (   8.59  )
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

Simplify intel_reset_status() by using regmap_test_bits().
No functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-intel-gw.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-intel-gw.c b/drivers/reset/reset-intel-gw.c
index 0db64cc8a282..4cac2a8b0108 100644
--- a/drivers/reset/reset-intel-gw.c
+++ b/drivers/reset/reset-intel-gw.c
@@ -112,16 +112,11 @@ static int intel_reset_status(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
 	struct intel_reset_data *data = to_reset_data(rcdev);
-	u32 rst_req, req_bit, rst_stat, stat_bit, val;
-	int ret;
+	u32 rst_req, req_bit, rst_stat, stat_bit;
 
 	rst_stat = id_to_reg_and_bit_offsets(data, id, &rst_req,
 					     &req_bit, &stat_bit);
-	ret = regmap_read(data->regmap, rst_stat, &val);
-	if (ret)
-		return ret;
-
-	return !!(val & BIT(stat_bit));
+	return regmap_test_bits(data->regmap, rst_stat, BIT(stat_bit));
 }
 
 static const struct reset_control_ops intel_reset_ops = {

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
