Return-Path: <SRS0=kIcs=OI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41492C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Nov 2018 11:56:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 113C321479
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Nov 2018 11:56:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aGFm80qV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 113C321479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usiCaapqFw+Uvo0UUVo9JTxNbWHRRhQEX+bmOtq7BYY=; b=aGFm80qV+hcZNn
	sj5KQsxNp89XwDpz64zD7Kxt4wBdTUFtLN6ZG1/WKsvXRupxPlcudy/JBirjkL3mrYVLUAQb+x1Ng
	vZR+KQ3TzFOGuhC3zs4mgEmKVY2psKQS1HBcRnupu0Uej2TpZtyrlH+FKbrwcp7ZV0jjmesLEIkj3
	d8jms3CN6ScRJvgKjfarl04Z8+TxAh6Fs1m3DAkoqwwl45jXbs+mbUQIJBIhvJki+Na1PylxtUFFj
	bQITVF7UWZD2Ck3CmtA/fnqqa+iREEFxtmWGBnyLQhGHX94UIKfE/OX7EjxGswhPmx3lm2E32S2yV
	/d4dVDTS3+nFL3QiL0lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSKvJ-0007HF-Dn; Thu, 29 Nov 2018 11:56:01 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSKvG-0007Fk-2u
 for linux-riscv@lists.infradead.org; Thu, 29 Nov 2018 11:55:59 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 40324ACC8;
 Thu, 29 Nov 2018 11:55:44 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: macb: probe of 10090000.ethernet failed with error -110
References: <2e17bba6-d932-37b2-5dca-0963fc50f5e6@gmail.com>
 <mhng-0ddf5852-8900-4131-b3e0-81c5cc7de2eb@palmer-si-x1c4>
 <20181129055510.GB17675@lunn.ch>
X-Yow: Can you MAIL a BEAN CAKE?
Date: Thu, 29 Nov 2018 12:55:42 +0100
In-Reply-To: <20181129055510.GB17675@lunn.ch> (Andrew Lunn's message of "Thu, 
 29 Nov 2018 06:55:10 +0100")
Message-ID: <mvmtvk0drnl.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181129_035558_276445_6AF97BAC 
X-CRM114-Status: GOOD (  13.27  )
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
Cc: f.fainelli@gmail.com, sergei.shtylyov@cogentembedded.com,
 netdev@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
 nicolas.ferre@microchip.com, linux-kernel@vger.kernel.org, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, hkallweit1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Nov 29 2018, Andrew Lunn <andrew@lunn.ch> wrote:

> So if we assume you can identify the PHY using its ID registers, you
> can put this reset code into the soft_reset call. That gets called
> first before anything else. There is no need to add a new function to
> phy_driver.

I've tried the following, but it made things only worse, with the
probing not working at all.

Andreas.

diff --git a/drivers/net/phy/mscc.c b/drivers/net/phy/mscc.c
index 7cae175177..65baf31331 100644
--- a/drivers/net/phy/mscc.c
+++ b/drivers/net/phy/mscc.c
@@ -1822,6 +1822,23 @@ static int vsc85xx_probe(struct phy_device *phydev)
 	return vsc85xx_dt_led_modes_get(phydev, default_mode);
 }
 
+static int vsc8541_soft_reset(struct phy_device *phydev)
+{
+	/* The VSC8541 has an unexpected feature where a single reset
+	 * rising edge can only be used to enter managed mode.  For
+	 * unmanaged mode a pair of reset rising edges is necessary.
+	 */
+	mdio_device_reset(&phydev->mdio, 0);
+	mdio_device_reset(&phydev->mdio, 1);
+
+	/* After this pair of reset rising edges we must wait at least
+	 * 15ms before writing any phy registers.
+	 */
+	msleep(15);
+
+	return genphy_soft_reset(phydev);
+}
+
 /* Microsemi VSC85xx PHYs */
 static struct phy_driver vsc85xx_driver[] = {
 {
@@ -1908,7 +1925,7 @@ static struct phy_driver vsc85xx_driver[] = {
 	.phy_id_mask    = 0xfffffff0,
 	.features	= PHY_GBIT_FEATURES,
 	.flags		= PHY_HAS_INTERRUPT,
-	.soft_reset	= &genphy_soft_reset,
+	.soft_reset	= &vsc8541_soft_reset,
 	.config_init    = &vsc85xx_config_init,
 	.config_aneg    = &vsc85xx_config_aneg,
 	.aneg_done	= &genphy_aneg_done,
-- 
2.19.2


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
