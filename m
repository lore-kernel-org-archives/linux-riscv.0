Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A648606EE8C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 16:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cCp4FxWo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=avtI7dnB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=saC+or3mlDBl324FNyaTmHrvdp4QExAwUyYKwJpfdNY=; b=cCp4FxWo/t51wfJnatx6G0ClR1
	Mkf6G+2Ej/EfHiyvXaAtbWmsMcgkWRP2YXEs7sB60fP/VE0Tfz6UdT9U7o/RHCRC0bnk6GwflBAQA
	sWFUSBdm2oAKeLRikuxgCU7qoikSrNzAAAYjHZRG8LvQIHQkW7h4A7/Z3GBh/UwNuk27GQdEM1QJt
	MzjDsHwa4/eDT8YOFHXh0DRc+tn1hjQDAOyGMM+VBICyK6WKewRakmqODHxI0sce4/U8vSlX0eZjn
	Szb0xfOh4Jxu9oDfWErW2jTeCGmyYGelcyxphy8CEablw4rzzW2TSOHkJn0YDFCEXVPxGGhckH0kn
	O/vU/FTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSaT-00000001F2U-0Qey;
	Mon, 09 Nov 2026 16:51:17 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSaK-00000001Epx-0TGO;
	Mon, 09 Nov 2026 16:51:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 90D2020296B;
	Mon, 09 Nov 2026 17:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DP6mwMrATChRECS6iH+LkcBySCfvUn9RliJv7XX0ATM=;
	b=avtI7dnBGB4Y7zQO3RLiAmO5cl9lbzxJFHx2rGto+3debRU7huFDnNhyaZc36uS/6bsMcV
	jl7q9IPLr9gVWBSqcfD3ZVbX33TgMOjLyNX5KixeUrPL4PLZd6Mp7wp/5Ma81khEWOGdQJ
	vIaGP+nynECz7cacS1ctwuyTKcItWRWQQqJ8cLZba2BXiyz7tAtXoTBgkVrOf15B3mTDlN
	KCtud1tcWfYJpRvW89p0w8+5IAU5GF1ynCTBgyvU/5t+jrl5lyKRC96OqmZuh2XUuUtD2K
	H9W8owVtnKTcKEUInA2FhqE3FejXvJLDBKvqxnjqL2dHwRz+hXIT0Gge9b1Z+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DP6mwMrATChRECS6iH+LkcBySCfvUn9RliJv7XX0ATM=;
	b=WDFGjWR3F3x5oShxY+2qh/Pvw0RW0U9M2oRDjlqF+9MNfVCYJEgs8oJQbEb0IzaySD0UvF
	a6Oxndrr60OMVxRENwmw5A0nckHEojWG43s5H0ImHvE15ha8BteCjLGzXG+es4KEEkKDG6
	NFB4ZbGlbdiJwKs9VZk2zQtgqDUhHIRfVmOVsuyyuwpAQy1VmblGg9PXF6w9P8bgtTndag
	CDLHJ70sszo3BHN3CGzVsNe9YpwAEALoaC7qJR5UJnyZlkVGwD1+SO+OKJyh+JgvHWg9yN
	ncUYuCmQFWD8/N8VffeyhJ/EsVn1WNGT54CsrPvJNiNURgWyZa0REtFXcsmqHA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794243053; a=rsa-sha256;
	cv=none;
	b=Xj5zCAS6O9olEyUjjoyZNuSmSxQ1bPZsLTRCKttho0NSkioWv+WxDuBV1XFJ4WySQqJp/E
	mwgERsgUYH+PM6ddhdVtRn5tdxOuHupW369rcaeJPRsJqDjPea9ppDAjATVMVEhRHeiw2c
	L4zXDuARmlUrA3TCgXVb4KvNQmUACopIIM69eH220QAd9lJgujrnGHi54LKa7eRFK/xjyH
	j+8uciF/yJbFeEf19S5Nom5pl229nv21aDCIG/8iMxtuS8mI5CUA1527bf2tj696RqHNwR
	g09RTCGEYoQLaeQI4CBlyNJt0I7pRV/rj2r/kc06scizIJi15AIuHaZn0nP11Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xQSa5-003N3i-1Y;
	Mon, 09 Nov 2026 17:50:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 09 Nov 2026 17:50:50 +0100
Subject: [PATCH v2 8/8] reset: tn48m: Use regmap_test_bits in
 tn48m_control_status
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-reset-regmap-test-bits-v2-8-c886689bb85e@pengutronix.de>
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
X-CRM114-CacheID: sfid-20261109_085108_763484_8387AE54 
X-CRM114-Status: GOOD (  10.52  )
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

Simplify tn48m_control_status() by using regmap_test_bits().
No functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-tn48m.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/reset/reset-tn48m.c b/drivers/reset/reset-tn48m.c
index 177ee5127a1e..4c7d7ef7c7a9 100644
--- a/drivers/reset/reset-tn48m.c
+++ b/drivers/reset/reset-tn48m.c
@@ -66,17 +66,13 @@ static int tn48m_control_status(struct reset_controller_dev *rcdev,
 				unsigned long id)
 {
 	struct tn48_reset_data *data = to_tn48_reset_data(rcdev);
-	unsigned int regval;
 	int ret;
 
-	ret = regmap_read(data->regmap, TN48M_RESET_REG, &regval);
+	ret = regmap_test_bits(data->regmap, TN48M_RESET_REG, BIT(tn48m_resets[id].bit));
 	if (ret < 0)
 		return ret;
 
-	if (BIT(tn48m_resets[id].bit) & regval)
-		return 0;
-	else
-		return 1;
+	return !ret;
 }
 
 static const struct reset_control_ops tn48_reset_ops = {

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
