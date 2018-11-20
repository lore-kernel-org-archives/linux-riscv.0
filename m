Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622B3C41536
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:05:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFE6420851
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:05:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cISaKW7Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KiSi9Hzu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFE6420851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5gH36qNYhm6pVfN0PjvBC5X+XWtKt7b05H/e7ghdks=; b=cISaKW7ZvO3Ba1
	F5SDcasIlwUx0PKF0HdP/d9eQxx0HqTJSykmcvI0LcjRcqrDEvZHRtF029tUEVCS4e2CV0vs9YDJ0
	nwuEuhdN9e8oiv8Gcpmia0Ggqcr8hZOi8a6S+w1G5F69b7iC+CUyshJQl782v5Hlzz2ADSdVAILOj
	aBtja4fAY7MxplJSuqyKHeIkxV4FiowjvGOZOnYnzs8hXnWO0zreYrxZ3/XYgHl58ugvQGH35RPOh
	vFn2J8/XoAZBcRQO+loJlldCKFYhQfL/eUU3VmEhk6A7n9Xf1ItPQUo9PlRPz8yZJ3GuYdmHeukAY
	9b2n3jvxDxBK1U7NGcmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gP8Ui-0000Fh-15; Tue, 20 Nov 2018 16:03:20 +0000
Received: from merlin.infradead.org ([205.233.59.134])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP8G0-0003nl-Qr
 for linux-riscv@bombadil.infradead.org; Tue, 20 Nov 2018 15:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2aDgQmmAki+1b6QuHGOOpLmZzJGNea2i3A2I+I8X+Ss=; b=KiSi9HzuD1flTNAkfQF8XoNR0
 cTrDmy89W2MzDACixSjbvKlPO9fSCrZe0dhrFRAL0ks5vuwt0NpcpjO1X2Kw0nhHV7OcWh30jwrzF
 XaoVFi5zN5R3NFtoZIQ/suqnPe3YD9pSIdiwiYgQlI2aVthMocAmNvZ+ajn0H6cf5uGqPhMo4PRY8
 mo+ZDQo/qkyBBPT3A4NFHefydhqKsQ6Ytyop5LUFqZ3WQ9zl2yFnNP10q5NqaxFq3ROx0xoAzQzC1
 xA0mXRxSwt7cBHEXX2Uu7VLCxY+cRvF+0Hc3/wzL2Q77vb9X5ISaQD7d0BxJve4Wh2NK5Um0rjBbx
 GY0YPiBzw==;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP6OY-0008Bz-Rw
 for linux-riscv@lists.infradead.org; Tue, 20 Nov 2018 13:48:51 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6FACDAFE5;
 Tue, 20 Nov 2018 13:48:38 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH] net: phy: mscc: fix locking in vsc85xx_default_config
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de>
X-Yow: Did you GAIN WEIGHT in th' past 5 MINUTES or am I just DREAMING of two
 BROCCOLI FLORETS lying in an empty GAS TANK?
Date: Tue, 20 Nov 2018 14:48:37 +0100
In-Reply-To: <mvm8t1pazea.fsf@suse.de> (Andreas Schwab's message of "Mon, 19
 Nov 2018 15:57:17 +0100")
Message-ID: <mvma7m3n9l6.fsf_-_@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_084851_030825_7C2C990A 
X-CRM114-Status: GOOD (  12.63  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: andrew@lunn.ch, alexandre.belloni@bootlin.com, f.fainelli@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 allan.nielsen@microchip.com, thomas.petazzoni@bootlin.com,
 linux-riscv@lists.infradead.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181120134837.pgkuQLwBDO4kPfnAnseaTtwTP-DQKbjbDA-H8-UJ74w@z>

Don't use locking phy_read/phy_write functions while inside
phy_select_patch/phy_restore_page region.

Fixes: 6a0bfbbe20 ("net: phy: mscc: migrate to phy_select/restore_page functions")
Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 drivers/net/phy/mscc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/mscc.c b/drivers/net/phy/mscc.c
index a2e59f4f6f..a398ab9410 100644
--- a/drivers/net/phy/mscc.c
+++ b/drivers/net/phy/mscc.c
@@ -814,10 +814,10 @@ static int vsc85xx_default_config(struct phy_device *phydev)
 	if (rc < 0)
 		goto out_unlock;
 
-	reg_val = phy_read(phydev, MSCC_PHY_RGMII_CNTL);
+	reg_val = __phy_read(phydev, MSCC_PHY_RGMII_CNTL);
 	reg_val &= ~(RGMII_RX_CLK_DELAY_MASK);
 	reg_val |= (RGMII_RX_CLK_DELAY_1_1_NS << RGMII_RX_CLK_DELAY_POS);
-	phy_write(phydev, MSCC_PHY_RGMII_CNTL, reg_val);
+	__phy_write(phydev, MSCC_PHY_RGMII_CNTL, reg_val);
 
 out_unlock:
 	rc = phy_restore_page(phydev, rc, rc > 0 ? 0 : rc);
-- 
2.19.1


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
