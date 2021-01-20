Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B081C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 01:26:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01D152242A
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 01:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01D152242A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JqJOf8P8s0I//mApZskt5Tu0KbM3Y58yf9p3b/I7Ygg=; b=z7oIiKCIw2ti9FP+jLUztlkWI
	SULKv4SAr0NmpINwqzE1WqjcfahQk8tphklr6R6B6nMX9GnisYsAdHdFQxAI+2Rq+TAHLriFdvGX7
	Uf5Wc6gKZkQDJVCZPTDF8M8et5qUixI3EyF4Wmhe9UgmEx4fqfBDWlHLE6M4pYBRg2KoclQrd8C/S
	3Xk3VoU8zBsndqtkS6NLVItxJCy1Sy5xYamY5RY07pJ3Ny+WNDnRmO7Kpc5i0+cQRVAphlR0yF1T8
	TMm+lkTRj9zHwQb3NUscGnUVSi/grZqYCyzgfEnjEEyhpJ78Tt7a9AKeZfT19iSw5h5o6Ep7NEFXI
	021QVmtUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l22GS-0002kV-B7; Wed, 20 Jan 2021 01:26:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l22GN-0002iX-2M
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 01:26:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7CBED23142;
 Wed, 20 Jan 2021 01:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611105982;
 bh=9uNivUSLfoWxjuidh93RwflJqr4GN2MeQteNSR8ysB0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RvEtW/kyeWNy07VwDWn9yIFBxALWmW/r4EMhT942rIFQ91QWUYDIDl5zf93bGTNF+
 RftuJUBifafmXgbnf3XLra+5kM3WQSe3Gb7nSN7I+xRkRnLORQwAs60vNMTrBWfYZ7
 DwPrzuOdNY4oRXwyaHKul1WttC+6K+bLb7XeoNBSxk2KrQjDTn9S65jz5iz2XPB7ZL
 GTNkKwwN+Hw8bWlSIXgI+XuHOlRLcqtsi1YzeqH7QU11Zoa1b5NvqCPsS92LvyouBp
 ImTxmr3tdZJrtbWXFijCqLuYmCmx4/Hd1YlwpdtcP6b6JrQqlLpmvn5vPsnmDwUJJU
 4EHOUE/z76S1w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 15/45] riscv: Fix sifive serial driver
Date: Tue, 19 Jan 2021 20:25:32 -0500
Message-Id: <20210120012602.769683-15-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012602.769683-1-sashal@kernel.org>
References: <20210120012602.769683-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_202623_341080_4FDDC75D 
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
index 13eadcb8aec4e..214bf3086c68a 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -999,6 +999,7 @@ static int sifive_serial_probe(struct platform_device *pdev)
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
