Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51549C433E6
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 16:17:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 801A464F47
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 16:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 801A464F47
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p/LKoyvBV8NLpOB2ewhmfX/BEz7S/4MNhj7cAKs34Yg=; b=HMMDwQrTcAGe8m3r39i4Nrhgs
	N+qODtMM86pH4yxJGuLj2nvUyze5PUNbllLC9s9WNuBVpdE7NHjLfS/+MRgPkS1sPNhkKFfO1vHF0
	dDv6vecl07Dr0hIiT0XgrzgGkCz7oR2AQ4q6BYCQgc5U7Zm/mmctq4BL66tUKCn3dPXpbF09zScht
	3Kx1bSA00xwoIsy6srYk0H06lrBoY8ZDyu3eC00MpatuAT5bQGLQmrkyT47uEW0gFvwOo1992bCma
	RrmIyGGv5P3C1TKoPLpS9R3bntUeZMNq5Q3j9Fi9BdKGsYkt18RRKSV15AcrR9qiP24KLjzqoydBP
	pLdM4d2nw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK1Wx-007DGb-I1; Wed, 10 Mar 2021 16:17:51 +0000
Received: from wtarreau.pck.nerim.net ([62.212.114.60] helo=1wt.eu)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lK1Ws-007DCC-Ud
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 16:17:50 +0000
Received: (from willy@localhost)
 by pcw.home.local (8.15.2/8.15.2/Submit) id 12AGHGuu019933;
 Wed, 10 Mar 2021 17:17:16 +0100
Date: Wed, 10 Mar 2021 17:17:16 +0100
From: Willy Tarreau <w@1wt.eu>
To: Claudiu.Beznea@microchip.com
Cc: schwab@linux-m68k.org, linux-riscv@lists.infradead.org,
 ckeepax@opensource.cirrus.com, andrew@lunn.ch,
 Nicolas.Ferre@microchip.com, daniel@0x0f.com,
 alexandre.belloni@bootlin.com, pthombar@cadence.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: macb broken on HiFive Unleashed
Message-ID: <20210310161716.GB17851@1wt.eu>
References: <87tupl30kl.fsf@igel.home>
 <04a7e801-9a55-c926-34ad-3a7665077a4e@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04a7e801-9a55-c926-34ad-3a7665077a4e@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_161747_410321_29759B4B 
X-CRM114-Status: GOOD (  15.08  )
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

Hi,

On Tue, Mar 09, 2021 at 08:55:10AM +0000, Claudiu.Beznea@microchip.com wrote:
> Hi Andreas,
> 
> On 08.03.2021 21:30, Andreas Schwab wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > One of the changes to the macb driver between 5.10 and 5.11 has broken
> > the SiFive HiFive Unleashed.  These are the last messages before the
> > system hangs:
> > 
> > [   12.468674] libphy: Fixed MDIO Bus: probed
> > [   12.746518] macb 10090000.ethernet: Registered clk switch 'sifive-gemgxl-mgmt'
> > [   12.753119] macb 10090000.ethernet: GEM doesn't support hardware ptp.
> > [   12.760178] libphy: MACB_mii_bus: probed
> > [   12.881792] MACsec IEEE 802.1AE
> > [   12.944426] macb 10090000.ethernet eth0: Cadence GEM rev 0x10070109 at 0x10090000 irq 16 (70:b3:d5:92:f1:07)
> > 
> 
> I don't have a SiFive HiFive Unleashed to investigate this. Can you check
> if reverting commits on macb driver b/w 5.10 and 5.11 solves your issues:
> 
> git log --oneline v5.10..v5.11 -- drivers/net/ethernet/cadence/
> 1d0d561ad1d7 net: macb: Correct usage of MACB_CAPS_CLK_HW_CHG flag
> 1d608d2e0d51 Revert "macb: support the two tx descriptors on at91rm9200"
> 700d566e8171 net: macb: add support for sama7g5 emac interface
> ec771de654e4 net: macb: add support for sama7g5 gem interface
> f4de93f03ed8 net: macb: unprepare clocks in case of failure
> 38493da4e6a8 net: macb: add function to disable all macb clocks
> daafa1d33cc9 net: macb: add capability to not set the clock rate
> edac63861db7 net: macb: add userio bits as platform configuration
> 9e6cad531c9d net: macb: Fix passing zero to 'PTR_ERR'
> 0012eeb370f8 net: macb: fix NULL dereference due to no pcs_config method
> e4e143e26ce8 net: macb: add support for high speed interface

In addition, it's worth mentioning that the driver has multiple rx/tx/irq
functions depending on the platforms or chip variants, and that based on
this it should be easy to further reduce this list.

Just my two cents,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
