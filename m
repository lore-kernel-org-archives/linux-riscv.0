Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7849C43219
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 20:10:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB12220717
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 20:10:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P+fBFFCY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lUo4MbCS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB12220717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoU9HXLl5X6aXk0Qhv/Q4N8e4Q0GMwhZ/kM5+4+Rk8Y=; b=P+fBFFCY86njYg
	X5M+ZTYx1BH5ZVTC08082rKclJLjcIX1oCcUXAoW+u5nWaWs3C0m8kdYUEWHVTeBbW4IAjU2JezP7
	dMJ24/OhVQW1gU98igObJI7MMHnGIzIJSSchiLFRwhJ2u5WYBP/0eyvOmj4axVl/pgQBUq9gWdMkW
	4Z1/JPNGO+fISmEVh7rCdwj7DiYDZTCwp1gcB65nmI2XWADGjwsU1dzKJrKnfmQDe/yLidsAj1CWV
	VvDCaYC2GxCp4Irr3fawBI1pA9zellEN8TM+7L1dRyrOger/aStdY1bkG4pYl/NOmPvV6jktHRoQY
	FP3XskO4mmsYtLuUkF/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJkhB-0005HG-2U; Thu, 25 Apr 2019 20:10:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJkh9-0003ux-4c
 for linux-riscv@bombadil.infradead.org; Thu, 25 Apr 2019 20:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/r/3jjOHgrSwjsPNzOZRABB5TvzFUErJPXpTfl3JbFo=; b=lUo4MbCSW//yivsJQ9dD57XRL
 fvmgAnuomo1lm2tlz1Lze+Xpb9iGCCPxrjfxhyuRTIUWHxuBHWg6wn6UWFZ/Bfmb4iRp3EEaUNjrm
 YofJWbPCDygFg1BUdWFdDfHoxpuG+9LondqZOiVJtquzaIXKZWNMQuXt2zRSZA5YFyu4+P+NA2pmE
 B0vWcbYu1I0QCSXGUUamnLYbPtLA3hzusLfYjQ+p9NmdvIIJCxdx+bXtYCZTVhw/12M+hTjrmx6/J
 yPG2yGfC2kBn6PrQfWKk6MCtNaY5fSwjJHSjpeqCqappLWngZZ/QySY36UfKBwkWOGuWY1SJlG5da
 SoM2He8Ng==;
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJkSX-00081m-3V
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 19:55:06 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 02E9868C4E; Thu, 25 Apr 2019 21:54:47 +0200 (CEST)
Date: Thu, 25 Apr 2019 21:54:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 7/9] riscv: remove duplicate macros from ptrace.h
Message-ID: <20190425195447.GA22587@lst.de>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-8-hch@lst.de>
 <alpine.DEB.2.21.9999.1904251208140.17442@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1904251208140.17442@viisi.sifive.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_205505_190140_AD1A69E0 
X-CRM114-Status: GOOD (  16.97  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 25, 2019 at 12:13:18PM -0700, Paul Walmsley wrote:
> 
> 
> On Thu, 11 Apr 2019, Christoph Hellwig wrote:
> 
> > No need to have two names for the same thing.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> This is probably worth cleaning up across the entire tree.  
> 
> asm-{generic,x86,arm64,powerpc}/ptrace.h all define similar GET_IP/SET_IP
> macros - although it seems that arch/riscv is the only architecture that 
> uses them.

Yes, we had that discussion before.  I've started on a series for that,
but it is unlikely to touch riscv.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
