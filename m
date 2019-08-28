Return-Path: <SRS0=k0Aq=WY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4479AC3A5A1
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2019 21:07:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1437D22CF8
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2019 21:07:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mdMVyx7L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1437D22CF8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QMpR73iK4Q3Fjf4y1s+Uur5DNBFMVEeX9R4RNO0Md+s=; b=mdMVyx7LKcae1L
	Dbq0CHOEEhak0SrbGymD6sjZkisEhQs2EmRYWpPEkB9GhU/PWqjbxtOAIttk3Hn27sp13CjDUyjg7
	bXy/bK54IHs69zPzlQaLdcTNmkwUTNtnDlrZhkZhW2uTVYsdkRqbeynSinabmErZOxvlufGUAG0PM
	Vr+sPY/zbR8/nk7DAeOoQMzxahMyhsKJIgqieQ/t39qv9TCaq3qd1AyLV4KV7w8j4PYFq7jgopCMS
	A3KsGyEHAljIUfJhhTvgt39vuL21PxLUGBHT3pIVZUr+A6aW1zHJf2engWxGfXeSDF9KHPwqzUYDD
	P6QErkIyoDpNWeec+crQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i359b-000694-Go; Wed, 28 Aug 2019 21:06:55 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i359Z-00068i-2W
 for linux-riscv@lists.infradead.org; Wed, 28 Aug 2019 21:06:54 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 60C3C1539AF06;
 Wed, 28 Aug 2019 14:06:47 -0700 (PDT)
Date: Wed, 28 Aug 2019 14:06:44 -0700 (PDT)
Message-Id: <20190828.140644.534529249197568915.davem@davemloft.net>
To: yash.shah@sifive.com
Subject: Re: [PATCH v2 0/2] Update ethernet compatible string for SiFive FU540
From: David Miller <davem@davemloft.net>
In-Reply-To: <1566882364-23891-1-git-send-email-yash.shah@sifive.com>
References: <1566882364-23891-1-git-send-email-yash.shah@sifive.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 28 Aug 2019 14:06:47 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_140653_118869_CE366378 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 sachin.ghadi@sifive.com, robh+dt@kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, ynezz@true.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Yash Shah <yash.shah@sifive.com>
Date: Tue, 27 Aug 2019 10:36:02 +0530

> This patch series renames the compatible property to a more appropriate
> string. The patchset is based on Linux-5.3-rc6 and tested on SiFive
> Unleashed board

You should always base changes off of "net" or "net-next" and be explicitly
in your Subject lines which of those two trees your changes are for f.e.:

	Subject: [PATCH v2 net-next N/M] ...

> 
> Change history:
> Since v1:
> - Dropped PATCH3 because it's already merged
> - Change the reference url in the patch descriptions to point to a
>   'lore.kernel.org' link instead of 'lkml.org'

Series applied to 'net'.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
