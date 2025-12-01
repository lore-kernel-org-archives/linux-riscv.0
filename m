Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0066DD111A8
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 09:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rS9p9XA4jkFnOnWv1eyTDDG+XRqCXVnDgjgDaaqKdA4=; b=35+7AbeSsoREeV
	/XLyAuRV4qJjyoOKbEQbjOkQKfppFN0D6+wjiX0pBMyB5gYCDJHKwI2tU+glmFwNZHYqZbnO4kU7K
	GbaBMZ0I4Pal3pHDNXDRJ+Z3wCqtB/faaRYT6wAvgkv8Q9O6wF2z3Yv62DaOySVlWGdTAEJPKo3L9
	lP8YBAKoVnJIAfdE6RSr/ypRrsg/SEsTY/ah6RuV5Syr9L1jdXBIApJVVvtKPWCmwPZLJAOtvZOiS
	yyEpYeYoINbB0EOxfXn/0RFLhmdJXpuaHLiSth5hMq0wmaSuSANI0k+mXrfb66WY6bDj+xFMILs14
	6BGCP7yidfhk0BfVhc5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0Ko-00000003DsM-2QIr;
	Mon, 01 Dec 2025 09:36:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0Km-00000003DsC-2XYl
	for linux-riscv@lists.infradead.org;
	Mon, 01 Dec 2025 09:36:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 064916013A;
	Mon,  1 Dec 2025 09:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0273C4CEF1;
	Mon,  1 Dec 2025 09:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764581799;
	bh=h618OCT0dsA4JOdP2jkAByl5muSl3/ZEsap5hQUlqco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Db33BUQoh7ee//1/wTB4xB/pSwLjomWentmw747D9GjxH4NUvZ9/YzLB/dJCe35gI
	 A7ys/hl2yqmohC5PEowpJaTvCH2k4UEsM2uW4ojdID52FWJ+CzhWk5hcH1ZrFbEHOu
	 SLVt4Cflp5WuyslgdR1WrBDij8kYCwHvAGbZ7yX24/sHX0SMfNZMh72rL42BmdINKE
	 OfVP+BCuRGoP1ffIRpuDR/UqhblVjvN/2qTg2Fkj4+QhsLosQqdBindqB43QIqnaIU
	 Tvgp9fnw7Xm4CBrgn1tIMnalT/VcCYvV/N6UeBkqJbVyAXI2LJ10Ft4q7lkJkkrl6c
	 TQTGov54E3x5w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vQ0Kq-000000006Qs-0iR5;
	Mon, 01 Dec 2025 10:36:44 +0100
Date: Mon, 1 Dec 2025 10:36:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH] mailbox: th1520: fix clock imbalance on probe failure
Message-ID: <aS1hrDg4ZBXMDj2F@hovoldconsulting.com>
References: <20251017055414.7753-1-johan@kernel.org>
 <aRGswsgOmPGXMjMI@hovoldconsulting.com>
 <aScppcza9xwGwqn3@hovoldconsulting.com>
 <aSsjA9RimtLpQ0KF@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aSsjA9RimtLpQ0KF@x1>
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

On Sat, Nov 29, 2025 at 08:44:51AM -0800, Drew Fustini wrote:
> On Wed, Nov 26, 2025 at 05:24:05PM +0100, Johan Hovold wrote:
> > On Mon, Nov 10, 2025 at 10:13:38AM +0100, Johan Hovold wrote:
> > > On Fri, Oct 17, 2025 at 07:54:14AM +0200, Johan Hovold wrote:
> > > > The purpose of the devm_add_action_or_reset() helper is to call the
> > > > action function in case adding an action ever fails so drop the clock
> > > > disable from the error path to avoid disabling the clocks twice.
> > > > 
> > > > Fixes: 5d4d263e1c6b ("mailbox: Introduce support for T-head TH1520 Mailbox driver")
> > > > Cc: Michal Wilczynski <m.wilczynski@samsung.com>
> > > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > > ---
> > > 
> > > Can this one be picked up for 6.19?
> > 
> > It's been another month so sending another reminder. Can this one be
> > picked up for 6.19?

> It looks like this is now in the 6.18-rc7 PR from Jassi :)
> 
> https://lore.kernel.org/all/CABb+yY2GeWHWeASzemit8XvgvHg=Cse+46CqF3KJfsBXNPEBAw@mail.gmail.com/

Yes, indeed, it made it into 6.18. Thanks!

Johan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
