Return-Path: <SRS0=jvqQ=W4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7DFC3A5A4
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  1 Sep 2019 08:01:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C99222CF7
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  1 Sep 2019 08:01:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J9stnoNV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C99222CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wol9NeoiCTp7g2TlSKie5dzBe7aolf9ROkOWKmw52fE=; b=J9stnoNVzRoAwa
	fU7rrc0166KrVxuHGZd7a1NUbjymxsepl8n39dVBxKLUYIVaibC1ttWFG0etHneEiSupmnqoW0F5D
	rQdIjtsBvJ6JC8a8pJguGB62AJEk6IcwFifSn4EDnbBHl2O/ecgK9s0Q7bi/Uvmz4Ec0uWIVMt7RR
	bA69dyukg7JYMGgaSNaPT8D8CYpJptFj0shT08iKEH8NDEeMzUGbIk3bnuu33ECY5QHkp9hFhVDlj
	a9PYLDP89udwhyxqXv7RSo9ocNow0gALDohbSDosi0N89qrxZcciatCNhCv6WCfrX7N9fYWVoamdr
	sOfeQ5MDsVyS/Ib9ZJdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4KnL-0004Mr-UL; Sun, 01 Sep 2019 08:01:07 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4KnI-0004Lv-9K
 for linux-riscv@lists.infradead.org; Sun, 01 Sep 2019 08:01:06 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id B3211227A8B; Sun,  1 Sep 2019 10:00:56 +0200 (CEST)
Date: Sun, 1 Sep 2019 10:00:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] riscv: move sifive_l2_cache.c to drivers/soc
Message-ID: <20190901080055.GA12035@lst.de>
References: <20190818082935.14869-1-hch@lst.de>
 <20190819060904.GA4841@zn.tnic> <20190819062619.GA20211@lst.de>
 <20190822062635.00f6e507@coco.lan>
 <alpine.DEB.2.21.9999.1908301951080.16731@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1908301951080.16731@viisi.sifive.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190901_010104_482370_F3B2CB02 
X-CRM114-Status: UNSURE (   7.58  )
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
Cc: palmer@sifive.com, linux-kernel@vger.kernel.org,
 Yash Shah <yash.shah@sifive.com>, Borislav Petkov <bp@alien8.de>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 30, 2019 at 07:53:17PM -0700, Paul Walmsley wrote:
> There's already a MAINTAINERS entry that should cover drivers/soc/sifive.  
> Probably it's not needed to add another one here.

So are you going to apply the original patch to the riscv tree?
I dont want to keep this file lingering around as a force built part
of the riscv build for another merge window.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
