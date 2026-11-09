Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E08A606EE8C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 16:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vdoeImSL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Wj7XabG9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B7yojjaIcRwFncsOOEDOdNe8E+5g61P0YmsgNFnNNck=; b=vdoeImSLsC0MYyTPFMqFaXyxLE
	mvxh3NTB9WyY4BESxVbPSjuu2kn8UgMEbEhyDh3HfWg8PxJDygOyFJaQE1V5uOQk6ekhd9ynrpM5s
	20KqCWrDaTnf18UCFZOpvj4uTUfuGoEtWsu6UVXFyG5c6CeD6hYxOtthuZrYFEAEmnLhIZav/Q7VV
	kH/Grfrl8kv7B34HhL7Mo0GWcp8uaUwZcBLDisg/s9Fntffjp7bd1iBrHvFwPUcyNX61B/bVIAa3K
	A/IfJUISb8IHSD3mmObjo7V4LzNCmSRt7h3+ctK0lR7Up/Mr/0mRD9AbJAF0Pn5F5a8EOLvvCFPu7
	opmc6VGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSaa-00000001F9w-1PBX;
	Mon, 09 Nov 2026 16:51:24 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSaK-00000001Epw-0TwZ;
	Mon, 09 Nov 2026 16:51:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7FF5A202963;
	Mon, 09 Nov 2026 17:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gSi9vg+Zm+TI4RLv53YhiJ1p0uh4O4FGeOvQj7BhF60=;
	b=Wj7XabG9itETPv1P9Cz7rDJLEPUor24FxBiE9GXM2RV+mIjQTfr9hcwQxFvu2ahWQvvo2b
	qOnKczooutbFr9u8l5akinEbfQE8xwJAyxx5DPZ6cJLgGtG5jkyMpdm3Hk/vo/7aApq59T
	66wl94joHYTFAOrNjg+VVq51cTEVv8ehcgaCiEVn3lud+mf5L0QyJdn35WDWv2lWqazMgq
	tJfTgkvBcHPnGYZRjqzmwOecsrtJay8ysawNUu4rxEF4CO67AoiFmzX1av+bwl632dfe6P
	eqO7zxVWgkqDbdH31PEoI59LROyAsnRvKx0/C3zTUttubbiAtnclsolqDyFeKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gSi9vg+Zm+TI4RLv53YhiJ1p0uh4O4FGeOvQj7BhF60=;
	b=d185OKM4sc/+dSIS/GzHYabIcB4QofV6lw7Qlqbx4X5i+xf8zLynmGLZO9aWWoCELcWw1M
	jhzXdNKyzoQic2Xf8VVve0KnzuTQ/ze6/4FdKCRn4wMXbT3A/9i0E0AbDpkFADIeyjHv6n
	kZnYWpDwTEqvRXFnAwzkFdO90rrAbSAuLBxpXBNiCH10qIPWimak28nKtrw49ohzAri4Ly
	MypG67NJNM4dmce9n5QGopXKp6woZ5Q5tYVrCzm6pV15jzS9cvw2UnxX5dh6kviKFzGJe+
	zdfsOfwt3ZbrGTqG4jgIFrjWkmRafUaaPPru4UCz3hZhl01FwX9cVNfeg24C0Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794243053; a=rsa-sha256;
	cv=none;
	b=LbucVMWAk32V6XDlyjSE3L0pH7uXqjjfTxOJhnSr/yUe0c3BctaunQYXL0w1S5HYuCeHLt
	zDOIYZX6CS/PnnbB1F+hBfO3vYWjbQGNTnqhXBXw43lAsPo8QgAwgts+E6fx6cDOK8NrhV
	M+rGXUP5iwp1axlFnxzGnXIxDmli3acVwKXOb/ZfMBLfQfvpKAm2XB09tC8GNCugMox2rJ
	ouhrGB3dyZt13h6H7aZI90aMzCcyitUofEkDQ3bsqtoYGyZfkATsyX3X17B21Cbp4cMt2r
	S6ImFd1jmWV8MrylPzKrHgYQ0FfRlLmBZxBV8DbVO3mj9wQNn7w4CjlVn+0tdg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xQSa5-003N3i-1P;
	Mon, 09 Nov 2026 17:50:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 09 Nov 2026 17:50:49 +0100
Subject: [PATCH v2 7/8] reset: zynq: Use regmap_test_bits in
 zynq_reset_status
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-reset-regmap-test-bits-v2-7-c886689bb85e@pengutronix.de>
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
X-CRM114-CacheID: sfid-20261109_085108_763307_6435EE9C 
X-CRM114-Status: UNSURE (   8.69  )
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

Simplify zynq_reset_status() by using regmap_test_bits().
No functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-zynq.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/reset/reset-zynq.c b/drivers/reset/reset-zynq.c
index 688b512882ec..b7a0445aafcf 100644
--- a/drivers/reset/reset-zynq.c
+++ b/drivers/reset/reset-zynq.c
@@ -67,17 +67,11 @@ static int zynq_reset_status(struct reset_controller_dev *rcdev,
 
 	int bank = id / BITS_PER_LONG;
 	int offset = id % BITS_PER_LONG;
-	int ret;
-	u32 reg;
 
 	pr_debug("%s: %s reset bank %u offset %u\n", KBUILD_MODNAME, __func__,
 		 bank, offset);
 
-	ret = regmap_read(priv->slcr, priv->offset + (bank * 4), &reg);
-	if (ret)
-		return ret;
-
-	return !!(reg & BIT(offset));
+	return regmap_test_bits(priv->slcr, priv->offset + (bank * 4), BIT(offset));
 }
 
 static const struct reset_control_ops zynq_reset_ops = {

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
