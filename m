Return-Path: <SRS0=kIcs=OI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8980EC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Nov 2018 05:55:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B96220834
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Nov 2018 05:55:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gmD6MpCt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="XQdIZ5f5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B96220834
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m5IdJNr/QW0q5ny9CJSgFg+fpG3/NYjtWGaxfFEYrns=; b=gmD6MpCtb2G0BF
	wxu/Rjg4Egp0lKg+gRLs9exS2dNaFGZGIDagVD1BsfPdqihcunofxfMuknxg2c4cwLe/P1Wyx1NC3
	Reu302YEIzAlWdrywi9vnu1MtjD1Uj1KvG73FHqq7PutHKTtZAjAyn8/nLD/rkQuB8pwf2efE726p
	VQDiGpq3SYYc8404ZXHi7mPRqKzzG1euh2blkaV6ZztqQuEFzT1pCiaTfKWfW0BC3OidYcGPgZSAx
	3KX2BlxExMtxu3g+5CErb/ECwSVd+ATzHnqZjpxpTw/s04+LLwFA6JFA6o7oXlFDwGkE82afoovHp
	4xiyWqKdyENxfdpD/cOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSFIW-0000RX-LG; Thu, 29 Nov 2018 05:55:36 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSFIT-0000Q7-6u
 for linux-riscv@lists.infradead.org; Thu, 29 Nov 2018 05:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=bxcTrYfwpWhtFlmCs28IZaAdRCUjjrf7qsMM7+kpdXI=; 
 b=XQdIZ5f5H02MfszM11eQyPsf3iBkc5Q/95nFcTexdO2Lp7TMy/UbV2KwMxdTVQqU/aUvSq9YciZ+TC+ILPnkbDOCHWX+XlcB70sNellkykBefwsjzZsMmpu2SyjqDD3AUTal7ABhvZJr0enEPHKN/zZFF6P3puSoaBQ/Z0N5+vg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.84_2)
 (envelope-from <andrew@lunn.ch>)
 id 1gSFI6-0004ic-O0; Thu, 29 Nov 2018 06:55:10 +0100
Date: Thu, 29 Nov 2018 06:55:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: macb: probe of 10090000.ethernet failed with error -110
Message-ID: <20181129055510.GB17675@lunn.ch>
References: <2e17bba6-d932-37b2-5dca-0963fc50f5e6@gmail.com>
 <mhng-0ddf5852-8900-4131-b3e0-81c5cc7de2eb@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-0ddf5852-8900-4131-b3e0-81c5cc7de2eb@palmer-si-x1c4>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181128_215533_400954_3BE24FD0 
X-CRM114-Status: GOOD (  12.87  )
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
 netdev@vger.kernel.org, nicolas.ferre@microchip.com,
 linux-kernel@vger.kernel.org, atish.patra@wdc.com, schwab@suse.de,
 linux-riscv@lists.infradead.org, hkallweit1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181129055510.XgXNyB_Ia__rW50sdEZu11c_MqSggyMqD_M7jK43uPM@z>

>    diff --git a/drivers/net/phy/mscc.c b/drivers/net/phy/mscc.c
>    index 7cae17517744..8e0a71ee6bab 100644
>    --- a/drivers/net/phy/mscc.c
>    +++ b/drivers/net/phy/mscc.c
>    @@ -1822,6 +1822,24 @@ static int vsc85xx_probe(struct phy_device *phydev)
>     	return vsc85xx_dt_led_modes_get(phydev, default_mode);
>     }
>    +static int vsc8541_reset(struct phy_device *phydev, int value)
>    +{
>    +	WARN_ON(value != 0 || value != 1);
>    +	mdio_device_reset(&phydev->mdio, value);
>    +	if (value == 1) {
>    +		/* The VSC8541 has an unexpected feature where a single reset
>    +		 * rising edge can only be used to enter managed mode.  For
>    +		 * unmanaged mode a pair of reset rising edges is necessary.
>    +		 * */
>    +		mdio_device_reset(&phydev_mdio, 0);
>    +		mdio_device_reset(&phydev_mdio, 1);
>    +
>    +		/* After this pair of reset rising edges we must wait at least
>    +		 * 15ms before writing any phy registers. */
>    +		msleep(15);
>    +	}
>    +}
>    +
>     /* Microsemi VSC85xx PHYs */
>     static struct phy_driver vsc85xx_driver[] = {
>     {
>    @@ -1927,6 +1945,7 @@ static struct phy_driver vsc85xx_driver[] = {
>     	.get_sset_count = &vsc85xx_get_sset_count,
>     	.get_strings    = &vsc85xx_get_strings,
>     	.get_stats      = &vsc85xx_get_stats,
>    +	.reset          = &vsc8541_reset,

So if we assume you can identify the PHY using its ID registers, you
can put this reset code into the soft_reset call. That gets called
first before anything else. There is no need to add a new function to
phy_driver.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
