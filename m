Return-Path: <SRS0=6ibT=W7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA971C3A5A2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2019 02:06:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D64D21883
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2019 02:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UDv2ZNOz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D64D21883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3DmeVGAo4wMAHoiVF2xS+VoZp7pFyaavY0CLiI04YM=; b=UDv2ZNOzNLqBpK
	XcLpDyf5cmBz/mSW8EIvcUhi8ftnR4nC4yvb+v1qrCxAWEOF5iZkFKjhgDnUo+sCsP1kWdZMQdG2A
	DU7+vEdu8D9oUNhhh7qAbdplyn/KH8rQureshKpwFOTmj2Zsh1x/68eeMie3aAD3r0borxAltSyzN
	yjjnBHAtRNyR6BoRshasNQApBKYUlWXTYVOlSRMMOjDwrv0G20oZQjFVFNvSD+ODJsSQik+toiZdZ
	yShnI/c6NpeTDGhTZMYXiMXu36JKV5gwY03sBH8csU9doXr0xR8zvp2LuDE+RSL/xjcL2IGHSTdxq
	G/omt1iF6s8K0CqXXwaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5KgT-0005Mu-1d; Wed, 04 Sep 2019 02:06:09 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5KgO-0005MV-6N
 for linux-riscv@lists.infradead.org; Wed, 04 Sep 2019 02:06:07 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x841qSq9066455;
 Wed, 4 Sep 2019 09:52:28 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Wed, 4 Sep 2019
 10:05:39 +0800
Date: Wed, 4 Sep 2019 10:05:39 +0800
From: Alan Kao <alankao@andestech.com>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 08/15] riscv: provide native clint access for M-mode
Message-ID: <20190904020539.GA18202@andestech.com>
References: <20190828061146.GA21670@lst.de>
 <mhng-e03fb9a6-73ee-437e-aee1-e30427f5d644@palmer-si-x1e>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-e03fb9a6-73ee-437e-aee1-e30427f5d644@palmer-si-x1e>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x841qSq9066455
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_190604_498681_6300B3E5 
X-CRM114-Status: GOOD (  10.83  )
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
Cc: mark.rutland@arm.com, Damien Le Moal <Damien.LeMoal@wdc.com>,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 03, 2019 at 11:48:52AM -0700, Palmer Dabbelt wrote:
> On Tue, 27 Aug 2019 23:11:46 PDT (-0700), Christoph Hellwig wrote:
> >On Tue, Aug 27, 2019 at 04:37:16PM -0700, Palmer Dabbelt wrote:
> >>clint0 would be version 0 of the clint, with is the core-local interrupt
> >>controller in rocket chip.  It should be "sifive,clint-1.0.0", not
> >>"riscv,clint0", as it's a SiFive widget.  Unfortunately there are a lot of
> >>legacy device trees floating around, but I'm only considering what's been
> >>upstream to be actually part of the spec.
> >>
> >>In this case the code should match on a "sifive,clint-1.0.0", and the
> >>device trees should be fixed up to match.  We match on "riscv,plic0" for
> >>legacy systems, and I guess it makes sense to do something similar here.
> >
> >IFF we decided to change it I'd rather separate DT noes for the ipi
> >bank vs timecmp register vs timeval to support variable layouts.  The
> >downside is that we can't just boot on unmodified upstream qemu, which
> >has used the "riscv,clint0" for years.
> 
> Like I alluded to above, matching on "riscv,clint0" seems reasonable to me
> as it's a defacto standard -- we'll just have to make sure that if we ever
> end up with a RISC-V CLINT that the DT entry is something else.

De facto, but not mandatory.

> 
> As far as splitting the memory maps goes, I don't have a strong opinion but
> it seems like that'll introduce more complexity than it's worth.
> 

At least the splitting can keep reminding us and any new comers in the future
that CLINT is not (yet) a must in RISC-V landscape.  A previous discussion
FYI: ( https://lkml.org/lkml/2019/8/20/1361 )

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
