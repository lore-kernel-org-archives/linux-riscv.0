Return-Path: <SRS0=jvqQ=W4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7439AC3A5A4
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  1 Sep 2019 08:03:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48E8122CF7
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  1 Sep 2019 08:03:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="avJ+u8qH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48E8122CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bABWF+ovT8hNRe5brpeuqsEs+087d52Msdkud9sO4sI=; b=avJ+u8qHvUp0u4
	p4FBCmnY5hArEF4VUIGAtqYXb0bwfVtDJR+Gy8LWQTcocgmvz12ACqRnQsNBI3NtlzPuU/MnUATGd
	Xd6AKF1LWDkWmqhCvSCd7lFARUsYjpgPcHUiikbl4SR9ZUpGNL/6UmWvneRfVHRyuF8inQw4mdV0+
	4prbwXdvWGTucZ/ROOArR1pEqtbXgTo4pMsiORl1YgTJ/Q3uC+mWepa//SalaKXhl0MocDDUg6/Yj
	PXeCpcXw2g4OhEotYYyTiZ7p8ud3HwuXpziSDlnKOK05is7UhhkqppZSZmSry8piELvnWFK5bZdmo
	M4wk2RnPq3UCUT+QarWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4Kpv-0004yX-7x; Sun, 01 Sep 2019 08:03:47 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4Kps-0004y7-GE
 for linux-riscv@lists.infradead.org; Sun, 01 Sep 2019 08:03:45 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id B83B9227A8A; Sun,  1 Sep 2019 10:03:41 +0200 (CEST)
Date: Sun, 1 Sep 2019 10:03:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 03/15] riscv: refactor the IPI code
Message-ID: <20190901080341.GC12035@lst.de>
References: <20190813154747.24256-1-hch@lst.de>
 <20190813154747.24256-4-hch@lst.de>
 <alpine.DEB.2.21.9999.1908132141350.18249@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1908132141350.18249@viisi.sifive.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190901_010344_685634_A443EA0A 
X-CRM114-Status: UNSURE (   7.43  )
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@lst.de>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 13, 2019 at 09:41:58PM -0700, Paul Walmsley wrote:
> On Tue, 13 Aug 2019, Christoph Hellwig wrote:
> 
> > This prepare for adding native non-SBI IPI code.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Thanks, queued for v5.4-rc1.

I still don't see it in any tree, so I'll resend it with the next
version.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
