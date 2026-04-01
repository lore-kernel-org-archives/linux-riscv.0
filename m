Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E97C1076386
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 16:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=umpl0uR+Afy4l3Yks8EzfP1CIi706xhOmtCvlZbmtO0=; b=1WUW31+6ghMI6x
	asH6Ke0lm1FGrY1ikCUXMCGHC2xWEq44wUl8b/GyEFbTKLra0L5lnYKrsk4Yxf05M6WTwALLFxXC5
	qpamv3PQkNQL/QwMxC8npDDpqQNVCfzroLuTBRS4mCkx94Xaer2kzuyX8k9GDT66bvHghJkjh3/3E
	YpVzofdy0T9mDTSpuIiWOSLSzi6LQMRusdMyRzB0WSxV636yh4jjDDYBQnu7h7e55fXne9nH+qY2C
	FFRtcLiuo4NpQPYZ/y4n5qj/g6o0+RZgIMkQ3RO6VC+x6YfxtJkCGO1Guy7v5B5XUWB8LEgto4z8D
	DphkBNdoDLoLvbmxCnHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7yrD-0000000Fm9M-1zzi;
	Wed, 01 Apr 2026 16:55:55 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7yrB-0000000Fm83-0VFZ
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 16:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=hkQuXIrDKyFIn1XxIaEC4SEoSONkzaq7cF9jpCjwrts=; b=DxwemFI+6+QOSlBXrjoK+lgyZT
	SYaFgZbO4scYryeCjgg8bkCy1/MxXNqY6M0aA1mhoI5+FbQd1qF6Eelu30CnhKKF6d+5fDwJksArR
	wxQ3ns7q/c9UsA9a8ZaLh/Am4qsGB8uZN7dEcO7dPRjcHRdfgXzK/P5XuQlUoTVYBi2BPu7Kxm9kC
	1tji59VHdcf6pPiEBLl7OTAVg7AXsBCe+PGSTtSXPWULH0PbA0clgrTkas2jWhzHIOvPDjjgtCh8a
	edeRcpOtIJlEmAhtKt3Kb1c9IUoZVMIPD5deZB/v37qnZeGVGO06xiahqL7wIxwtweEx7YB6ALoRx
	Do0AWKdQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w7yr7-00000006UOZ-2ULC;
	Wed, 01 Apr 2026 18:55:49 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit)
Cc: Aurelien Jarno <aurelien@aurel32.net>
Subject: [RESEND][PATCH v5] mfd: simple-mfd-i2c: add a reboot cell for the SpacemiT P1 chip
Date: Wed,  1 Apr 2026 18:50:37 +0200
Message-ID: <20260401165437.1048786-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_095553_258634_200A1040 
X-CRM114-Status: UNSURE (   9.94  )
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

Add a "spacemit-p1-reboot" cell for the SpacemiT P1 chip.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 drivers/mfd/simple-mfd-i2c.c | 1 +
 1 file changed, 1 insertion(+)

Note that the spacemit-p1-reboot driver requires PIO support in the
spacemit i2C driver [1]. This hasn't been merged despite being ready for
weeks.

That said it's not a hard dependency, in most cases reboot will just
work, which is an improvement over no reboot driver. The PIO supports
just makes the reboot driver reliable.

[1] https://lore.kernel.org/lkml/20260207-b4-k3-i2c-pio-v7-2-626942d94d91@linux.spacemit.com/

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 7315fad618e44..52c81b18750e1 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -105,6 +105,7 @@ static const struct regmap_config spacemit_p1_regmap_config = {
 };
 
 static const struct mfd_cell spacemit_p1_cells[] = {
+	{ .name = "spacemit-p1-reboot", },
 	{ .name = "spacemit-p1-regulator", },
 	{ .name = "spacemit-p1-rtc", },
 };
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
