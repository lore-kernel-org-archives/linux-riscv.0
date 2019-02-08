Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F7FC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 09:13:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9523B21917
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 09:13:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uhH1XBpf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9523B21917
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=biieW45Hj93v8oAqrD9+5qpjS6jHzDsAwzbi2CvAy68=; b=uhH1XBpfloEh2C
	/yBaPWtijOQoOC/vTqMd2I64Bbc+6lJXlclvU9Y9P/3Kak9kvKtoqoSY1H50ivCVtRq0FsFm7Vd20
	lEzFLB0vAS26rHsm0GvvF1ZSInmt986shzMOMD16vwNhdyi9t6wMPtLOWyb5s5QdHYPx6KjbI21/X
	tKiY6cdM9AeB96K9Uhqaq64qj7aTAey9uUK2g0VlpD+ZDvY6xAxepnq8T65bmCS1l+SkrY9TdZwAe
	NSgEce4VioZR9kAuKu05d17vwsCjTbSfU9o2Us/wGDmEby5eVv+KNMfdG0gXIW8O4LTsmfpSivucK
	MZSwe2DVTqL+yPq7Upwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs2Da-0000FL-TR; Fri, 08 Feb 2019 09:13:06 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gs2DZ-0000Ep-Be; Fri, 08 Feb 2019 09:13:05 +0000
Date: Fri, 8 Feb 2019 01:13:05 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: kernel after 5.0-rc2 may not boot using BBL
Message-ID: <20190208091305.GE16932@infradead.org>
References: <4b647c0d-86de-fed3-aca6-d248b9aff762@wdc.com>
 <20190208083206.GA4699@infradead.org>
 <CAAhSdy3GZHn9k7VvcUkM4s2SpU7SjtW3HmWcHVD342arWHYZLw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3GZHn9k7VvcUkM4s2SpU7SjtW3HmWcHVD342arWHYZLw@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Andreas Schwab <schwab@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 08, 2019 at 02:32:51PM +0530, Anup Patel wrote:
> It is a bug in BBL because it is not keeping sufficient gap between
> Linux kernel end and DTB. The change pointed by Atish actually
> reduced flat kernel binary size by almost 1MB.

And that is all great.  But it breaks peoples few existing RISC-V
setups, which is the best way to frustate every single of the few
users out there.  And that is best way to lose any interested in this
already hard to use mess.

> Here's my BBL pull request:
> https://github.com/riscv/riscv-pk/pull/144

And that isn't going to help anyone who doesn't want to update every
single fragile piece of crap involved in booting RISC-V every day..

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
