Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A463DC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 17:31:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7601220656
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 17:31:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Io9X/GP5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7601220656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDjMmJv0qivMIvvOXKmpwsN4cxMZFccxNWT9CagbESg=; b=Io9X/GP51Nrmiw
	+onlifE+sOWG+bMbbjD7H97j2WK27BwQG2cLenN9wcjLdsKeleKD/uYzIUHBF/AJQxxIk6RnbqseM
	B0Dedj1d1aNhJZBOYDgWWHOiufsDoG2jJrcIkcAuKAW2Yi4Un0nMxPjV3GtuzafyfbWC8jMWnaRIX
	gEAEYe2XE52aZGrwHKtfSP44Lh0rXwVJrcPAP9TzsAKIGtoF61u49/bUJDNiWohkYL1tTiOujkmSJ
	wh5t9IzQ/06oTU1MwWwRi34mpSr5AYqfI7I+BjJtJie8ZhLuIrGqIwspNMZdCRIIJGeB2n8aqbmkn
	dKoPdEFZ57m6sWl/E1Xw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjSYI-0003k3-RC; Tue, 15 Jan 2019 17:31:02 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjSYG-0003jR-6V
 for linux-riscv@lists.infradead.org; Tue, 15 Jan 2019 17:31:01 +0000
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.89)
 (envelope-from <logang@deltatee.com>)
 id 1gjSY4-0000RU-LA; Tue, 15 Jan 2019 10:30:50 -0700
To: Christoph Hellwig <hch@infradead.org>
References: <20190109203911.7887-1-logang@deltatee.com>
 <20190109203911.7887-2-logang@deltatee.com>
 <20190115135819.GK28946@infradead.org>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <c5dee13b-3458-c195-eba9-c968db908a71@deltatee.com>
Date: Tue, 15 Jan 2019 10:30:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20190115135819.GK28946@infradead.org>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: dan.j.williams@intel.com, hch@lst.de,
 linux-riscv@lists.infradead.org, sbates@raithlin.com,
 linux-kernel@vger.kernel.org, palmer@sifive.com, ysato@users.sourceforge.jp,
 dalias@libc.org, robh@kernel.org, hch@infradead.org
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH v4 1/2] sh: mm: make use of new memblocks_present() helper
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_093100_572884_7C03FEDD 
X-CRM114-Status: GOOD (  10.10  )
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
Cc: Rob Herring <robh@kernel.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@sifive.com>, Dan Williams <dan.j.williams@intel.com>,
 linux-kernel@vger.kernel.org, Stephen Bates <sbates@raithlin.com>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 2019-01-15 6:58 a.m., Christoph Hellwig wrote:
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> Probably no need to keep this in a series with the RISC-V code, this can
> be queued up by the sh folks independently.

Oh, yeah, sorry, I obviously didn't pay enough attention to this when I
resent it. I sent the similar Arm changes to the appropriate list and,
yes, the sh ones should go to that maintainer.

@Palmer: if you can just look at taking the second patch, I'll resubmit
the first one to the appropriate list.

Thanks,

Logan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
