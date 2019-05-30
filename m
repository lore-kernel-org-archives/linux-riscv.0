Return-Path: <SRS0=X+rF=T6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDD7C28CC2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 May 2019 06:33:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4567325A34
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 May 2019 06:33:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E5kHXMHl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4567325A34
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ehdinP58txwkDdXAAuwumswG28horQKM0x1mFhZVDIo=; b=E5kHXMHlnFlufw
	8UoJI9Ni0m+deK57LKR+ccRUVRwMq9TcIMYVTNI5temdbPmoGwMV43nyPYy1Y9xQ0U2RJ5sQNkC1W
	AuSdLIyiJ9O+sLYqSnPURrUf+0v3NCRzdiyOAC98LazuMy/ta678IkRazvzfX61HTyxKEyE3zp4cU
	iuHbwOiFeChvvhQpqVJboAlarWtMdvxi59aeuBtceQmdy7YbzUrrSRdgOqY7buCDtLLWyap026GqD
	Hu4zogDT+4xGHGUjAINGk96UXvN2tPdLH9/DdykHGVvA3zQtbXT4WSfWzUr5ocpCa3bo5cvN3zNSc
	vRfvBrA/eBhHqTPfVLhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWEcY-0000WD-46; Thu, 30 May 2019 06:33:02 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWEcU-0000VN-EL
 for linux-riscv@lists.infradead.org; Thu, 30 May 2019 06:33:00 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x4U6QvwC058344;
 Thu, 30 May 2019 14:26:57 +0800 (GMT-8)
 (envelope-from nickhu@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Thu, 30 May 2019
 14:32:31 +0800
Date: Thu, 30 May 2019 14:32:32 +0800
From: Nick Hu <nickhu@andestech.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] riscv: Fix udelay in RV32.
Message-ID: <20190530063232.GA17102@andestech.com>
References: <381ee6950c84b868ca6a3c676eb981a1980889a3.1559035050.git.nickhu@andestech.com>
 <20190530055258.GA7170@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530055258.GA7170@infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x4U6QvwC058344
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190529_233258_735881_12792ECD 
X-CRM114-Status: GOOD (  11.61  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greentime Ying-Han =?utf-8?B?SHUo6IOh6Iux5ryiKQ==?= <greentime@andestech.com>,
 "green.hu@gmail.com" <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 30, 2019 at 01:52:58PM +0800, Christoph Hellwig wrote:
> On Tue, May 28, 2019 at 05:26:49PM +0800, Nick Hu wrote:
> > In RV32, udelay would delay the wrong cycle.
> > When it shifts right "UDELAY_SHITFT" bits, it
> > either delays 0 cycle or 1 cycle. It only works
> > correctly in RV64. Because the 'ucycles' always
> > needs to be 64 bits variable.
> 
> Please use up all your ~72 chars per line in the commit log.
>

OK, Thanks! 

> > diff --git a/arch/riscv/lib/delay.c b/arch/riscv/lib/delay.c
> > index dce8ae24c6d3..da847f49fb74 100644
> > --- a/arch/riscv/lib/delay.c
> > +++ b/arch/riscv/lib/delay.c
> > @@ -88,7 +88,7 @@ EXPORT_SYMBOL(__delay);
> >  
> >  void udelay(unsigned long usecs)
> >  {
> > -	unsigned long ucycles = usecs * lpj_fine * UDELAY_MULT;
> > +	unsigned long long ucycles = (unsigned long long)usecs * lpj_fine * UDELAY_MULT;
> 
> And this creates a way too long line.  Pleaase use u64 instead of
> unsigned long long to clarify the intention while also fixing the long
> lines.
>

Sure, I will fix it and send another patch. Thanks.

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
