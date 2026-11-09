Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CEE606A338
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 16:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W+UVY02Y;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=I3zxrPXV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=eSUzICYL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=av1tkz2c63e3sK7PonEKV2RLvizqcwBCmbIlnGrNWLg=; b=W+UVY02Ym5pO05MeCf5F7urMW6
	k+VydsH9051N5DiA3/lJo4uoqEtLoqqcoxMue2yB+AiEoVltOamoSQlwjzqox5tLnJj7FX/PFMOKK
	EVJrMIoUXQmYtsdmiJ7elG9FQEFPHyCeo9aTuEAu3Tbkx1FdaV0xpZhld2YkfXSEVfPTZyHuJPnBp
	59YdeEag/uvL2E/twYPpheF4r9/bbufS8weygflPOK/YrQ4sU4PGLGHwP+XrLS5y6Okn95pSFr3Xa
	yLELXvqKxaSqL+UrG3Sq6oVnw2wGigEpqkWERwzRWFK4jYyZnbi3zKm9YCG1WOB8hRRgHQSJMHSje
	m/Irpnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSab-00000001FCN-37Ui;
	Mon, 09 Nov 2026 16:51:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSaM-00000001Et0-2nVa;
	Mon, 09 Nov 2026 16:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KWdwoMQXiTShR7rGuGU+FCAUlgJV+S6GbsCQM41btuc=; b=I3zxrPXVAByuD4urwHZgPIjPBE
	RZ3ugJGTilmgEfkd9fFsZ50RmmC4jD19Lr8fmrsLwSbAx/0o4ToaZrckZ69igrQOvUZmIFmxeYROu
	H4wYNyLQ/gc5D8qaYZ2m97M2Aleyd05msbwAZHUdLbABsCGfYOdFgx//GptemNgP8uhkDADnAzVp3
	vxX1NxzuCP55HCl6iBNtviJebkLZQLk/VsyJcaCuNDB7XeguwMkhag43ieykbmGY7+lJ9+YUmY6Fl
	FIsN00vo+8k+YGDMxVjrgp/MOYVsXFxmAKbGEPvmRRnE+lXZrolBywruORuIAh2DhhUku1GIBzTc/
	0XNYXnVQ==;
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSaH-00000006y47-3FaS;
	Mon, 09 Nov 2026 16:51:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 74B0A202929;
	Mon, 09 Nov 2026 17:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KWdwoMQXiTShR7rGuGU+FCAUlgJV+S6GbsCQM41btuc=;
	b=eSUzICYL5Pjk5juWywMwcLKqW/avcVWTQSGTuZ6byUyEY7lv6LcI+XvH5HriOPkAbNA7LH
	48IXJYxXNuuXi+5IQQQVzJ4JgXl+gtMl2RQb/a2D1jlN4IWHYTw2i8eTCHfeuTLlyo/dTR
	jxDUgg8I3/u8rxxS9bZ9bSEIZ+H5SzeX0GZbHUbyFlkdHMdPgDwpKKwPPMoDP1KvNjXkiP
	50ZzFzkCuqLQDAbeIkT9hLPlXxTr3wq/T2VsKPk2JC926Xifr/1YItvXHXFdgvpt3csDk0
	T865t82RVb36gp1cl4tHuCTmHClKkq+yvP6uXiwrfDF++Xn7lKWCtttwtvz9GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KWdwoMQXiTShR7rGuGU+FCAUlgJV+S6GbsCQM41btuc=;
	b=A4Ide3cnG/8S+uWkzS/DuvatL8yERG8LOJCBFypT+psvy5UFAldNjxBz2VlAzCQb2nfAJD
	y3LVhE8LxgxzbkZmo0zj++dwRC2siymLsQlAc7GoNbva9o0izxYL1PUcYcsKwvEhrF2KIJ
	swmmbLu7prAuNsMOuXVXFSz1I44VpL1WhqwFvT+BCdCDAcmnOVvVoJjKEDUBg8tCBZoSlb
	wEJ4f+QNowlRWOvyM91F3Uoap0PL4Id7ZeXhk6xzbyB8NO8+gw2wZgUP8rUZR8xU6icKnp
	THXrthwD1c7MMp1itZc1w4G3MDMgqotCGPU1qbqdDGYz+LhlOXel2w7sWemAFA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794243053; a=rsa-sha256;
	cv=none;
	b=cHobY6+Natq80bFXoWs2lwFO/M67RyxEYB91mL4LqjP2LiY+ayfVXvOUnYPGX0br2buHZH
	jXl/gQxv7kvRA2EWfR7TChYd81m8jEon+LBVN5GErEsLwkNToiUaf3D8YOjFJ0OY8ANWXk
	FRQ9vVcLuuX/K/fs5j6621sBCRygdNCtBTHPhWWyWbur0EBbL/cbRYvb31d1bDIwr0pmuL
	Z+sLUSjMK8I7eEpr1PSTkU5AWM2BOrsqVXUoDzjD7FjKpYLgeNfxYSKs5cabIcmxJK8b5O
	Fek0A7Nm5EE4LkZ+8TNn/Qa5EWJxUwUPZ3tZTXyS8uLgf8vQevPORtFbdplhaA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xQSa5-003N3i-1F;
	Mon, 09 Nov 2026 17:50:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 09 Nov 2026 17:50:48 +0100
Subject: [PATCH v2 6/8] reset: rzv2h-usb2phy: Use regmap_test_bits in
 rzv2h_usbphy_reset_status
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-reset-regmap-test-bits-v2-6-c886689bb85e@pengutronix.de>
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
X-CRM114-CacheID: sfid-20261109_165106_012545_0FDAF002 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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
Now propagates errors.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
