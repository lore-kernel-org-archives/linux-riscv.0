Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6D3C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 01:29:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65DF1221E3
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 01:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65DF1221E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZhCNsUwyJJaXAuzAviC6TeUoGsJoDqQ/uRUePNhXNOA=; b=k92fQ5+FYGlaJpbvnKEQ153W6
	YOfoAia7iKJbBk4qSeB7EKt2vSuj9rXmk8o9D6vuA5ojgxsRB9T1D6/A+EZmjnHJGcoaZ319qU5Bd
	zMAFptBtibu28ARzJGgv3qHiFUpE0r6PoutJIjN6hRof1/uRhmXbcM5cHFoaknPdF7e8+Iy75weqB
	qFR2WDlki1S8U1/Ihu5S+uK2U62nW4FOOxnTD/pd16FofmruJ7pwOeglyi1e0sz0c9xmGUpPrkdJ0
	Te3Y+hr6R7WYeq+LH1it9C2FWz/b+u42uuuiVmXQKS1yC5EdD1rCLWsKruXXiNgTeFM+nmcn+pp7J
	v5sguyAAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l22In-0004AO-TB; Wed, 20 Jan 2021 01:28:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l22HE-0003CK-IB
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 01:27:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2767E233A1;
 Wed, 20 Jan 2021 01:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611106035;
 bh=g6IpG4eWGbmWOQ1Y69WDY67vRJiXh3rDqu11EkXtRAM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CVs31EpxD05GZkmMpyhzgtxBBIdZvJpRI7OVNtUtkWTybGX0d6QIUQ2qSmt+fM74F
 CDcNCxR9xt1la7QnkG9tw5cfZ/yCh11u9emdg2RrLPN64zAEbsE0ezPW6GIS1vGZIx
 62c3s+3UJjh8lZIy4eK6JeF5zv6GrlcuFCbU5BkOFLZwBLSpIlxVn4kPeXdp5Ha1f+
 I9MG98qpMq79ydVPNlNvViylzzrJ7uFRcgR3+U4tGoGO/PA8ACfhaAqB5RB2TU7ZzK
 tbHwffPwyKUWyj0LzjK9YN1zBw75x+gPBzj3VkTy3e4CKpUf4/8ebZmF+ze4QlS8ul
 gYY1O6eVMimdw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 08/26] riscv: Fix sifive serial driver
Date: Tue, 19 Jan 2021 20:26:45 -0500
Message-Id: <20210120012704.770095-8-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012704.770095-1-sashal@kernel.org>
References: <20210120012704.770095-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_202716_729868_CEDEAB15 
X-CRM114-Status: GOOD (  10.21  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-riscv@lists.infradead.org,
 linux-serial@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Damien Le Moal <damien.lemoal@wdc.com>

[ Upstream commit 1f1496a923b6ba16679074fe77100e1b53cdb880 ]

Setup the port uartclk in sifive_serial_probe() so that the base baud
rate is correctly printed during device probe instead of always showing
"0".  I.e. the probe message is changed from

38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1,
base_baud = 0) is a SiFive UART v0

to the correct:

38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1,
base_baud = 115200) is a SiFive UART v0

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/tty/serial/sifive.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index b4343c6aa6512..6a2dc823ea828 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -973,6 +973,7 @@ static int sifive_serial_probe(struct platform_device *pdev)
 	/* Set up clock divider */
 	ssp->clkin_rate = clk_get_rate(ssp->clk);
 	ssp->baud_rate = SIFIVE_DEFAULT_BAUD_RATE;
+	ssp->port.uartclk = ssp->baud_rate * 16;
 	__ssp_update_div(ssp);
 
 	platform_set_drvdata(pdev, ssp);
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
