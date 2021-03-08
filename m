Return-Path: <SRS0=HQWJ=IG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2F1C433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 19:30:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FC30652AD
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 19:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FC30652AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:CC:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R2ScmCWgYOs7uYxWcImuty/f1OKI3s7xh7SeLi/A/V8=; b=ms9VrQhuQCGPAa3WnvDGIWgzup
	rulpw1a5vmYSZR9IvJCLfGl88W42MEDWlpR16cJ/VIe3atJd9W+sRRwra/SgQdvDl5kGp1qxTvfV0
	k7SF3a1LWYDwaKlSWIxtyfTD+Sn1lqYaQlkL9X4Kr4FEFvSawik5dtADUuvq+E+5Nh0uEyLS8kfZx
	+NopysjT0SLVOcxXzy3Hys8iysFN+3eClZHsy2roFqMLLJ77EwxGG4sPXduwrSxKcJtBeuMR1I3cZ
	9fO877FIT/DFtuwCFxNuCoazvka0HnAh7UkKIyIdWeHm/lJBfah6dYNB8HHKidAp70HQsxHZhPyH3
	PRxpU1Ew==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJLaV-0026ng-8i; Mon, 08 Mar 2021 19:30:43 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJLaR-0026mO-5l
 for linux-riscv@lists.infradead.org; Mon, 08 Mar 2021 19:30:41 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DvT2h6nBtz1qs0p;
 Mon,  8 Mar 2021 20:30:36 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DvT2h1kCGz1r1MM;
 Mon,  8 Mar 2021 20:30:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id cl5ab6GjaR9i; Mon,  8 Mar 2021 20:30:35 +0100 (CET)
X-Auth-Info: PggnRC1U8X6v26ElHBvfHF0XfyNGljdktgHw+hS7EGtM5kU/rPFSXSjx3wo4wT+l
Received: from igel.home (ppp-46-244-182-153.dynamic.mnet-online.de
 [46.244.182.153])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon,  8 Mar 2021 20:30:35 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 6E1FB2C37BA; Mon,  8 Mar 2021 20:30:34 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: linux-riscv@lists.infradead.org
Subject: macb broken on HiFive Unleashed
CC: Charles Keepax <ckeepax@opensource.cirrus.com>, Andrew Lunn
 <andrew@lunn.ch>, Willy Tarreau <w@1wt.eu>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Daniel Palmer <daniel@0x0f.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Parshuram Thombare
 <pthombar@cadence.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Yow: Who wants some OYSTERS with SEN-SEN an' COOL WHIP?
Date: Mon, 08 Mar 2021 20:30:34 +0100
Message-ID: <87tupl30kl.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_193039_322388_45EE39F1 
X-CRM114-Status: UNSURE (   7.74  )
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

One of the changes to the macb driver between 5.10 and 5.11 has broken
the SiFive HiFive Unleashed.  These are the last messages before the
system hangs:

[   12.468674] libphy: Fixed MDIO Bus: probed
[   12.746518] macb 10090000.ethernet: Registered clk switch 'sifive-gemgxl-mgmt'
[   12.753119] macb 10090000.ethernet: GEM doesn't support hardware ptp.
[   12.760178] libphy: MACB_mii_bus: probed
[   12.881792] MACsec IEEE 802.1AE
[   12.944426] macb 10090000.ethernet eth0: Cadence GEM rev 0x10070109 at 0x10090000 irq 16 (70:b3:d5:92:f1:07)

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
