Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04111C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:47:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F522206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:46:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jFqPKskA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qBGv8HtB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F522206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uc/spb+ly/OHrjSNhfrfCFp18Wm0wDyLePX9jyO0F2k=; b=jFqPKskA6wPCWz
	lnE8YBZyf1HHY/pC7QC8QAQHyY/fjfr/wzfOK6FdXkd3wmhY+gqQ0bVB8iz1lmajr0qSZ39RIYVX9
	kDdvt0VcasyihdQgiZcpukU4JLgGaJr0N0uZf823OHifRQt8uUiH1pxyZkNqsldapnSUClzMbXxTj
	moW+iXAEI6CjQusEQqzKisdWQPF1oA+jaTJ3I7ejm4AeEtq1wKpZW8AiUt08XkXMqEwpcrxM5/Y2T
	XnKxkpyosvNDflBuYvJMuTymioURiGT9z3KzvbFXoj7ZHGwHOkG9TNH8L3Zgc6KtTM9dLmik0+Z9H
	H3OkHU8OJfxZVY0RZXHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gP9An-000678-V9; Tue, 20 Nov 2018 16:46:49 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP8md-0001u1-UV
 for linux-riscv@bombadil.infradead.org; Tue, 20 Nov 2018 16:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ORe+nH7hy7EOoDsAK4AvH2Ij6KoItiFbughp1UrrN0o=; b=qBGv8HtB2EwPnJLDSuGZxr7JQ
 DMtVIYIDZrIPrB/si1dcPrDwHMR623QAgO2HAS58iZStiAUWiorfhxuIXNA1158605irtQdcrDi88
 sAvi2YU/zwXbLXF0b7AtHRuy0Cf0uJBBkZg2ZbmghUzSI28AcK7fL5RS6M/48RmowJHtgV+SYyQAz
 QeTKbHNnnSA1GPotkS1xXLgOXDYEo0LTN9+HUccfud5LQXg20DrcLyPFyDjUcyhpABvReV2P7XkSz
 1C9MFjaF9X/tIAv6xkNrB2GASldVxgD/N/Hp4C/VVj9iCNp3ba6jOf5pDpJ4xm8Gqzx27XbTrAeGG
 WebHEJL2g==;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP4Nx-00014c-9x
 for linux-riscv@lists.infradead.org; Tue, 20 Nov 2018 11:40:07 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6ECCDAEC0;
 Tue, 20 Nov 2018 11:39:53 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v3 1/6] net: phy: mscc: migrate to
 phy_select/restore_page functions
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de> <20181119151057.GC26852@lunn.ch>
 <mvm4lcdaynt.fsf@suse.de> <20181119152830.GE26852@lunn.ch>
 <20181119154005.GA8367@piout.net> <mvmzhu59idl.fsf@suse.de>
 <20181119161204.GC2393@lunn.ch>
X-Yow: Jesus is my POSTMASTER GENERAL..
Date: Tue, 20 Nov 2018 12:39:51 +0100
In-Reply-To: <20181119161204.GC2393@lunn.ch> (Andrew Lunn's message of "Mon,
 19 Nov 2018 17:12:04 +0100")
Message-ID: <mvmefbgm0zc.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_114005_373888_ADF721B8 
X-CRM114-Status: UNSURE (   5.80  )
X-CRM114-Notice: Please train this message.
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, f.fainelli@gmail.com,
 Quentin Schulz <quentin.schulz@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, allan.nielsen@microchip.com,
 thomas.petazzoni@bootlin.com, linux-riscv@lists.infradead.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181120113951.fq4z4MH6smBrubVL6zoFTShrnIAvpoOH3e2OxKw8PMs@z>

On Nov 19 2018, Andrew Lunn <andrew@lunn.ch> wrote:

> I still don't see why that would cause a hang.

[  996.370000] [<ffffffe0011d7324>] mutex_lock+0x22/0x2a
[  996.380000] [<ffffffe001039ba0>] mdiobus_read+0x36/0x60
[  996.380000] [<ffffffe00103b82c>] vsc85xx_config_init+0x4c/0x1e2

vsc85xx_config_init is calling mdiobus_read while holding the mdio_lock.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
