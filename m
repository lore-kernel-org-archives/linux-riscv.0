Return-Path: <SRS0=0jWI=WJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E717AC433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2019 15:37:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B975A205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2019 15:37:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lbfK4t/F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B975A205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qb8TbZUwW87QVsAvVEFVJrdR+l4ztPVWMHqldkAhL9U=; b=lbfK4t/FLuNkJs
	S64OjX4RhV9GYI6CtT6n9w8t+knMrJ0jGL92r3OZPbZZMHcVPjYC0qU+fzYq26QKxPKO1NoJSzmZO
	0PAbBzOXxNfFmbrJhjYzCUAiBgW7IdzpTpb0ZZd5V+y4REIbC6yPMIabyUXoJplzYp7APF0x6/PhL
	iLmXO8oyMjVkA2fCVyhWGk7epW/WL32Nfg9W2r8FT3dCsCN/oJwfkCw650zu9J+7ZBikje2Isylt3
	Xpp5f52QHG3Upt/dH0LKIPFg3L5/ysDZcoMKQk6YDWWbJpLCXDWEVNdGQJM+ta4OLAikba9MjpSNS
	uzgbDi4308ZgVWIL1hvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxYrK-0000Ex-HT; Tue, 13 Aug 2019 15:37:14 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxYrH-0000Dm-By
 for linux-riscv@lists.infradead.org; Tue, 13 Aug 2019 15:37:12 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6FB1368B02; Tue, 13 Aug 2019 17:37:07 +0200 (CEST)
Date: Tue, 13 Aug 2019 17:37:07 +0200
From: "hch@lst.de" <hch@lst.de>
To: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: [PATCH 16/17] riscv: clear the instruction cache and all
 registers when booting
Message-ID: <20190813153707.GA8686@lst.de>
References: <20190624054311.30256-1-hch@lst.de>
 <20190624054311.30256-17-hch@lst.de>
 <78919862d11f6d56446f8fffd8a1a8c601ea5c32.camel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78919862d11f6d56446f8fffd8a1a8c601ea5c32.camel@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_083711_562864_0B58F56C 
X-CRM114-Status: UNSURE (   4.41  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "hch@lst.de" <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 01, 2019 at 09:26:18PM +0000, Atish Patra wrote:
> That means it should be done for S-mode as well. Right ?

For S-mode the bootloader/sbi should take care of it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
