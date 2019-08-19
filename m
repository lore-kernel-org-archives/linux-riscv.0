Return-Path: <SRS0=iyEb=WP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00131C3A59D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2019 10:17:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C71B4205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2019 10:17:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oGRxadaT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C71B4205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5PQvgXtMCCpn4Pju9mfn8mDZYdCUtw7IsBHuqZuG/U=; b=oGRxadaT1mCSlv
	aBfTIcqeTQRQUBjwltpCSqE5NWmiWYOX/+3VryQpxwt5e6cNVAhQ7C0Wu1DWMVHF8zMq131Fs0fSh
	RoG5y6Fj0izriWibbg0r5l1+RmgJh14IOssPUMWEmKs+zd3yU1XoSJaghiO6LlbqYtsWcNJamS0Bc
	vuj+dTckOaR+MiMu9kIW4IqxoEFxNO/ZUCeweKVfKFUnnh2hzc2VrNTP69qN+Rv5ndWtXluHq1QVs
	yzpn8OC3pcwFd6n6EGgSzuYhkAO2QPi+77fnpJFNFCAWCtlrCYeNKcdwC1ko/nHdQ4ncvw/YgK2Rk
	5sTBQBeG+selG44CbkBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzeie-0004bT-7E; Mon, 19 Aug 2019 10:16:56 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzeia-0004ai-Rp
 for linux-riscv@lists.infradead.org; Mon, 19 Aug 2019 10:16:54 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 86B43227A81; Mon, 19 Aug 2019 12:16:48 +0200 (CEST)
Date: Mon, 19 Aug 2019 12:16:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 08/15] riscv: provide native clint access for M-mode
Message-ID: <20190819101648.GA29645@lst.de>
References: <20190813154747.24256-1-hch@lst.de>
 <20190813154747.24256-9-hch@lst.de>
 <20190813162958.GA27821@lakrids.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813162958.GA27821@lakrids.cambridge.arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190819_031653_053037_45DD8F89 
X-CRM114-Status: GOOD (  10.61  )
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
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 13, 2019 at 05:29:58PM +0100, Mark Rutland wrote:
> > +	np = of_find_compatible_node(NULL, NULL, "riscv,clint0");
> 
> Since the MMIO layout is that of the SiFive clint, the compatible string
> should be specific to that. e.g. "sifive,clint". That way it will be
> possible to distinguish it from other implementations.
> 
> What exactly is the "0" suffix for? Is that a version number?
> 
> If that's a CPU index, then I don't think that's the right way to encode
> this unless the programming interface actually differs across CPUs. It
> would be better to use an explicit phandle to express the affinity.

It isn't a cpu index, I suspect a version number.  These show up
in a lot of the early RISC-V DTs coming from the UCB/SiFive sphere.
They've now spread everywhere unfortunately.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
