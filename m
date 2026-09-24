Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D1AC9830D
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 02:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Snp3EEE/Tp2zOvSEIDpjAoHFMNrcQ/27/VXpcMAgTL4=; b=zuTSlQuvY5ajwy
	o2nesGk7XcJO6tsFDXj0y7YOOGY2edpG7eQGX/68nlZ1AvZhTdCGVQOi0PgQm1wJK5QvST9U20bta
	M18wb4rAxqnoZbYKW9NPELe9e6sEYb4LBGynWHvbRP+4jZOc+Pluw97NpQB7c6yoxjxr/StgCoR1M
	yu4rNKhdspPAWaV+6ZcLBuVSguQp7/0eTEIBfT5EzDs6Qa+0cklLwKm6/W0Cluw4RvgVuJ3xu05OH
	hXVI6180ILw2jvzoHQEgeJtlrT+RTEEmlBOpOilbdDzdTJqz/7dvf4X6M0o7My18h0pZLfeVZ75AM
	uQ63+sca/m8sumPy2bzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Yxi-00000009qUF-2vAM;
	Thu, 24 Sep 2026 02:13:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Yxh-00000009qU7-1i6b
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 02:13:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 909A9408DE;
	Thu, 24 Sep 2026 02:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4737D1F000FF;
	Thu, 24 Sep 2026 02:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790216004;
	bh=FYlZeJoBP8nu9jdhbNtZm6ZtdlrHib8ZSDD/RuVVTow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xgb8nMOL7TxPeS+MjK8lWxnuZQF/r5a0/cysyuwwSFeDctLvI2GyAsotvrsX20KCt
	 4XiOqqBQiTsN/CsP2+2eK1GbosWMszT3J5na8iwNOurOa/fhQ2on9FPnMID+Km/C1p
	 zMeeNR5JTfOtwntdY7VEdH1LG6WS5PbEERvqYXKXeB+r6aFM06pPCpjqKO07ep3tBd
	 xkZLBGmkQ9oKwEIaJ7d33zeZrsbsGQrTFlTPUIKOxJIdPaqnF6lI8IEDaovICgqrGV
	 ziHZhJTst87KPRDvzdbkCwW/i2sQrHs1TMb1PfA8UZVUqUicO98QEqkIPOFrqLLju8
	 okwazLpRWR41g==
Date: Wed, 23 Sep 2026 19:13:22 -0700
From: Drew Fustini <fustini@kernel.org>
To: Aamir Ahmed <elb12345@hotmail.co.uk>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Kees Cook <kees@kernel.org>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: tenstorrent: Assign .num before accessing .hws
Message-ID: <arSHQglLv0FfAmiw@x1>
References: <AS8P251MB00013BD9A093C06D2D60E10EC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
 <ce401b42-9dfb-4c8e-9051-7ba08c107382@embeddedor.com>
 <AS8P251MB000160067A8B595BB9D743E8C8BF2@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS8P251MB000160067A8B595BB9D743E8C8BF2@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2026 at 01:47:31AM +0100, Aamir Ahmed wrote:
> On Tue, Sep 08, 2026 at 11:56:12AM +0200, Gustavo A. R. Silva wrote:
> > Looks like variable num_clks can be removed entirely, and just do:
> >
> > clk_data->num = data->num;
> 
> Yes - it is only read once and data is const.
> 
> Thanks for reviewing, and thanks Anirudh for testing. For the redundant
> variable, since this has a stable Cc, perhaps we can keep the diff
> minimal here and I can send the cleanup as a follow-up once it lands?
> 
> Kind Regards
> 
> Aamir A.

Thanks for sending the patch.

I would prefer a v2 with this change in order to avoid a trivial patch
later. We are still in the process of upstreaming support for the
Atlantis platform, so there are no users yet that would be affected by
this issue.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
