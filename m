Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E12C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 15:50:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 254A420851
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 15:50:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ciYT808a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hJ76UPQl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 254A420851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fMF7+PXgFO1kyVcHaFQfIQfZFEKKsHlXtubh5hK9ujI=; b=ciYT808a/y51+S
	QuVV1HPA8GWI9cwJ7+pfmyoULJSNJ+s45g8iXUg6PWr8yvBh7+EuspjBFaQZ0oEEEBQ2yqEJoB00D
	2r4Gf2pOKwVUixMJjCg0nTs2H8eqs3Qw3owDSkTEBaRZdey9uAf0G+qXcJxeOAu6ccUEsZv9ij14r
	+xcHP7AsZoqBN/kikajBHcQQqCGWRNYI70ulLH2DBucc/hvzm3GXXmgdkV7czInyqapPCXJpTwW5J
	zxAYzuw3UsdS+LWMjB0mFMWle3tECHTxhCOAa28DhH9rBEJnP0zdQbuYdNPuex18NwhFgxp2ZOoZL
	wmarP6RePWEOV/Uszq9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOlok-000813-SD; Mon, 19 Nov 2018 15:50:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOloj-00080S-Ac
 for linux-riscv@bombadil.infradead.org; Mon, 19 Nov 2018 15:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TuyigvSuwvzEmhhC/eNfnnz35IWyfoX7Tl/Dl8KzxD4=; b=hJ76UPQlYd7Rfu1QdduZHgbKB
 UztEq9+OV+3K5cMsLfPAkS1ZF3m8GvKgbKpj6weh/mugfEJasHdgXYNe0GYkDYvzms7KAEYqt2l65
 uP+yoPkxpEdBNIxwvRO40zRxrRwBy+wVzFTbxMD532SPuVbh7wpTQ8P3dEOOfa85MJ9x41wYvRbDw
 FS+crWnQ6+vs+PrRMbWaBzyki0l9YdwfxqX3rPMO95+7LWQlFosOfmbALWjq3obe4WCw6wiE0I8+i
 iYqSR+02jexBbYuj+rcEK42/o5YWiDl3q/+7K0he/92F3LgbmEXJ6RJq1Uo8rTNryvkn4V+NgSHEZ
 iQHxZ97Tw==;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOlog-00074A-HK
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 15:50:28 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3BD21AFF6;
 Mon, 19 Nov 2018 15:50:15 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH net-next v3 1/6] net: phy: mscc: migrate to
 phy_select/restore_page functions
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de> <20181119151057.GC26852@lunn.ch>
 <mvm4lcdaynt.fsf@suse.de> <20181119152830.GE26852@lunn.ch>
 <20181119154005.GA8367@piout.net>
X-Yow: YOW!!  What should the entire human race DO??  Consume a fifth
 of CHIVAS REGAL, ski NUDE down MT. EVEREST, and have a wild SEX WEEKEND!
Date: Mon, 19 Nov 2018 16:50:14 +0100
In-Reply-To: <20181119154005.GA8367@piout.net> (Alexandre Belloni's message of
 "Mon, 19 Nov 2018 16:40:05 +0100")
Message-ID: <mvmzhu59idl.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_155026_592047_4D5F7EC8 
X-CRM114-Status: UNSURE (   9.03  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, f.fainelli@gmail.com,
 Quentin Schulz <quentin.schulz@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, allan.nielsen@microchip.com,
 thomas.petazzoni@bootlin.com, linux-riscv@lists.infradead.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119155014.qJZFfdHpProFjOyoeJi0TXDwD0qDj5UlanCYKZLZCdI@z>

On Nov 19 2018, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> My first intuition is that he mac driver quentin is using does
> phy_connect when the interface is opened while macb is doing it at probe
> time. I didn't investigate but maybe this can help :)

The phy probing of macb is very unreliable, perhaps it needs to be
rewritten.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
