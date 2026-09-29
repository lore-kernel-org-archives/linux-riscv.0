Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E46CA5FA7
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 19:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wd3RXYX/deMSlyydRJEbZoHwm6ek7LOvLR2o9F/JZ4E=; b=w/jxA2mCFc8z5s
	iYzynV08rzitX0LRH2BPaiGUcTLXmOUNEhqXc+vX1Di7bUo6nbj39qL9qfRmDjW5akO4ycfngfzLC
	/HaMG9N0mxPCCj3DGyYz4bMnJ0MJY/bScn5uJ3gf72v6abQ5/yzThbsyPP0IDDi4OCX49kHyixqWO
	PT472NpOuwWsfyABM0AOMjDlTUeMRG82d3drcmafA4etWNWpHY7axs/k/mlY4tCRGUtgKBB8Bz4A9
	MziTcmS0ZdH2dAhUa/4zLJOGWrMO63VHcp/tdj1SX30j3XH6wK2M/FBCSB39RwsWZxytxWGT7n7tj
	p1SFV4yf56nv2iMX9UnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdvC-00000004QzU-1Zvr;
	Tue, 29 Sep 2026 19:55:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdvB-00000004QzB-2JZa
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 19:55:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A096F6022B;
	Tue, 29 Sep 2026 19:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC061F000FF;
	Tue, 29 Sep 2026 19:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790711724;
	bh=iB9OihUdNpovJy2l/Ipn5MetrsvjMVExaZ/AmkjE4LA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OOwkZk8EKiaZ4g55alEPL1ivnLz4sCKU0U2L7EdfvB3tUPTnqVDgjHkcxbgLTlrCk
	 hCvPCXdgKce/gCGULTuSJliOUBPdGK0KRQQkGE1OHqEyIgQ59SpDp83NqagfXtw90Y
	 uq8mXG5KRGRid3MjtA1SMExTAQLh8w9MF7pSXM811RyyU0eXTLDGXR2O5u3RV4Iyph
	 2gMBFM372a0O+ErgHQtvUNorN5RxhKw4vpcOMdULNCBKgZKp99J/TJr6GNVXiX1qXX
	 dcF0f3kffbKNSQF9HcePMw0OMBFjjotvrb+bs2K5/n6N99jdPLWbEeqQ2ZHq13KBho
	 BuOR8hqvmBXAg==
Date: Tue, 29 Sep 2026 12:55:22 -0700
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
Message-ID: <arwXqtNq63F9D9M6@x1>
References: <AS8P251MB00013BD9A093C06D2D60E10EC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
 <ce401b42-9dfb-4c8e-9051-7ba08c107382@embeddedor.com>
 <AS8P251MB000160067A8B595BB9D743E8C8BF2@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
 <arSHQglLv0FfAmiw@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <arSHQglLv0FfAmiw@x1>
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

On Wed, Sep 23, 2026 at 07:13:22PM -0700, Drew Fustini wrote:
> On Thu, Sep 10, 2026 at 01:47:31AM +0100, Aamir Ahmed wrote:
> > On Tue, Sep 08, 2026 at 11:56:12AM +0200, Gustavo A. R. Silva wrote:
> > > Looks like variable num_clks can be removed entirely, and just do:
> > >
> > > clk_data->num = data->num;
> > 
> > Yes - it is only read once and data is const.
> > 
> > Thanks for reviewing, and thanks Anirudh for testing. For the redundant
> > variable, since this has a stable Cc, perhaps we can keep the diff
> > minimal here and I can send the cleanup as a follow-up once it lands?
> > 
> > Kind Regards
> > 
> > Aamir A.
> 
> Thanks for sending the patch.
> 
> I would prefer a v2 with this change in order to avoid a trivial patch
> later. We are still in the process of upstreaming support for the
> Atlantis platform, so there are no users yet that would be affected by
> this issue.

Applied to tenstorrent-clk-for-next with that fixup so there is no need
for a v2:

  da9f1312b06e clk: tenstorrent: Assign .num before accessing .hws

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
