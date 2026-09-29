Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FD7CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 19:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfSsnSTHoJcf5/YMec4+WHny313kubiitoD4IRzIV5g=; b=m1q9Xwob0WZboG
	BDDtEfacy2YE/4/VdcjfUuI56fltlwYasZFEFq4SdrbCy4mmRJ7NrVC4cK0y2XM2LNzOg+Dyomrjg
	F4jGKluOLSwhQO+JmlcZ0VYaxk9oDRYw0z6W7G8gKUH+mBuNcj4U9Ko8T8kQpIbnGUGmTnaje+s+H
	ku3ae/WVfTNm8y5415+UP+9GM+k0ND+BwE3uuXT7EwKqYOOw6OQQp1HIJBRGaTOStpxf3c5ATyZUJ
	mZS9B7q1bFHTfnuf6XqSsC1LJigDIho5R2aemt+Z1mfdaFiKPPc9v0VnVDhOdYoVy94f/nyghy51d
	ydN3MrQ7JPjSJztWvEjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdwW-00000004RHr-0doW;
	Tue, 29 Sep 2026 19:56:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdwV-00000004RHX-0SMQ
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 19:56:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7884C4055F;
	Tue, 29 Sep 2026 19:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7E21F000FF;
	Tue, 29 Sep 2026 19:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790711806;
	bh=9vXn/nJiT5LKKdyToAfStxMmLBFCxAvb6D9CfPyFgbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k9rkNtyXPHFrNp6kSwmo6AgDL0sdzrW+21KTEpUcf/kNZGJqbE0m4mOCt+zRzSP8w
	 EAfLbY1Yu0MHVuaCKlZf7NYyNt04j2VzsTn10UwUYOGAUH72W4g4JwiS66rhqnJDXL
	 TVZeaq2Op9ALi0v+XPc8GV1QkfxuzLRrawsNC546cnP5zZ9zxsJVeBEN224EQYUJrx
	 ukemXUiCb3u0UGC8NCil3gjT3UFgmsiO3baj8kAtcxer9EBlhJjNMzo5Sd0gSKH0GA
	 VXerm/1pRrnw9GSAVwxbGn1ydzWA/HLo97cp6hMwIF08GO5zWbslcJsFQKLUDu9T09
	 kopAzkKn3oDhg==
Date: Tue, 29 Sep 2026 12:56:45 -0700
From: Drew Fustini <fustini@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Brian Masney <bmasney@redhat.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] clk: tenstorrent: Fix refcount leak on shared gate clk
 enable failure
Message-ID: <arwX/SguNGK3FhFm@x1>
References: <20260924-atlantis_gate_shared_enable_fix-v1-1-303f925b8a3d@oss.tenstorrent.com>
 <arXX3RkaFvEwTySN@thelio>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <arXX3RkaFvEwTySN@thelio>
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

On Thu, Sep 24, 2026 at 07:09:33PM -0700, Drew Fustini wrote:
> On Thu, Sep 24, 2026 at 10:31:51AM -0500, Anirudh Srinivasan wrote:
> > atlantis_clk_gate_shared_enable() increments the refcount for the number
> > of clks requesting the shared gate clk to be enabled always. It should
> > only do this when the enable for the gate took effect in hardware. It's
> > possible to end up in a situation where the gate enable failed, but the
> > refcount is incremented anyway, so subsequent requests by other clks
> > that share the same refcount get ignored and the gate enable is never
> > retried.
> > 
> > Update this function so that the refcount is not incremented when the
> > gate clk enable fails in hardware.
> > 
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Link: https://sashiko.dev/#/patchset/AS8P251MB00013BD9A093C06D2D60E10EC8B42%40AS8P251MB0001.EURP251.PROD.OUTLOOK.COM
> > Fixes: 23c8ebc95284 ("clk: tenstorrent: Add Atlantis clock controller driver")
> > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > ---
> >  drivers/clk/tenstorrent/atlantis-prcm.c | 19 +++++++++----------
> >  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> Reviewed-by: Drew Fustini (Tenstorrent) <fustini@kernel.org>
> 
> I will apply this to tenstorrent-clk-for-next.

Applied to tenstorrent-clk-for-next:

  3f0655b51eb0 clk: tenstorrent: Fix refcount leak on shared gate clk enable failure

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
