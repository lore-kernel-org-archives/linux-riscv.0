Return-Path: <SRS0=0jWI=WJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B203C32750
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2019 16:43:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 208F120663
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2019 16:43:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TCS5DaDG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 208F120663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qo6U6IvSAjpWNnQpARPU91zDv9J8pCVcgvEpTzmYD0=; b=TCS5DaDG8H4AGN
	woiAp/In78bsiMrk+vuy3lDw78bsPgXZ+28nkQx8NuObVcKCgU7Q5Csg94ayapk8oMoe5QFUoFwvV
	/n7uB+Y3Sh8K2UVvlkYVgviKvYoaBcbA9T6zuUVxFfSEuu69UuVYBxWrRH1++PhHMRuhbdKexZDdi
	wmr5sIHwzwTJeGP4P6Un+qebuJL75EYSqO3LzEXYf2Ilb6IkfvY98EHxMpNoPXTJ+M6HhkAZ09gor
	XUL76Unl6K7yh91UzTTyny8F7mLysijI3OXBMIUS3j7EPNDxUYCSAIb+DzmVCEIpBREyxFz8A+pIe
	fJ+gnrtp4oMA7vOj6iIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxZt2-0001Qs-0F; Tue, 13 Aug 2019 16:43:04 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxZsz-0001QD-0J
 for linux-riscv@lists.infradead.org; Tue, 13 Aug 2019 16:43:02 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6435568B02; Tue, 13 Aug 2019 18:42:57 +0200 (CEST)
Date: Tue, 13 Aug 2019 18:42:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 02/15] riscv: use CSR_SATP instead of the legacy sptbr
 name in switch_mm
Message-ID: <20190813164257.GA10019@lst.de>
References: <20190813154747.24256-1-hch@lst.de>
 <20190813154747.24256-3-hch@lst.de>
 <alpine.DEB.2.21.9999.1908130935310.30024@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1908130935310.30024@viisi.sifive.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_094301_197885_1E9BA95E 
X-CRM114-Status: UNSURE (   9.51  )
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
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 13, 2019 at 09:36:23AM -0700, Paul Walmsley wrote:
> On Tue, 13 Aug 2019, Christoph Hellwig wrote:
> 
> > Switch to our own constant for the satp register instead of using
> > the old name from a legacy version of the privileged spec.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Reviewed-by: Atish Patra <atish.patra@wdc.com>
> 
> Didn't you want us to replace this with Bin Meng's patch?
> 
> https://lore.kernel.org/linux-riscv/20190807151316.GB16432@infradead.org/
> 
> If so, probably best just to drop this one and state a dependency.

Either way is fine with me.  But until you have a branch with
either one applied I'm going to keep resending my patch, as random
dependencies on uncommitted patches don't work.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
