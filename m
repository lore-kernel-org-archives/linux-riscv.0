Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F1BC83F07
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 11:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OwApAYe38iIMP769JFU2gU/5FamwaEn4T+X/e2N1wWU=; b=bOkP0nc+FsT6NF
	NRRWMo/xVe/swQlh+y6zPVTDU7bx3FP1mYHr0rkjHnlGAbn8bWSAvG5pqbfxQV+qBsZmn8damFuop
	9jW6Bnc3zHigChbFsUcVguksqboLOgTcd93pTH56HrvB3nf32YZ/DpxDXuw/SZgeBB5jq0oX/e5Pz
	EeJgfqH4GQ+90wyUefKAwyxFFT/MhOXWK0xn6n7zZHF6rGIgtWs8S4yfqinm/fb8aEE6Hhao9zd+j
	P3pgS1FyPzwZ9aC6LeRw2SKWiZafkyTNwjcAmLYxd/gTtMNzTiKAARsKwyDt5j5ShCcQMr/u7EpQM
	jVeXU5tPKemlY1fXFvUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjq4-00000002Ftp-2A9p;
	Mon, 07 Jul 2025 11:16:48 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjKY-00000002Bn3-3r3E
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 10:44:16 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CCFDA3410B7;
	Mon, 07 Jul 2025 10:44:12 +0000 (UTC)
Date: Mon, 7 Jul 2025 10:44:03 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Alex Elder <elder@riscstar.com>, linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Immutable tag between SpacemiT's reset and clock
 trees for v6.17
Message-ID: <20250707104403-GYA312629@gentoo>
References: <20250703151823-GYA312602@gentoo>
 <daf9ddad1aa24ee18abdc11a9b26ef03bdcbae16.camel@pengutronix.de>
 <20250706040646-GYA408198@gentoo>
 <3732050b6b756868543012c1a1cebbe7cce74d61.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3732050b6b756868543012c1a1cebbe7cce74d61.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_034414_976717_E221BFAD 
X-CRM114-Status: GOOD (  27.33  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Philipp,

On 11:46 Mon 07 Jul     , Philipp Zabel wrote:
> On So, 2025-07-06 at 04:06 +0000, Yixun Lan wrote:
> > Hi Philipp,
> > =

> > On 12:02 Fri 04 Jul     , Philipp Zabel wrote:
> > > On Do, 2025-07-03 at 15:18 +0000, Yixun Lan wrote:
> > > > Hi Philipp,
> > > > =

> > > > Please pull the following change into the reset tree. This
> > > > allows you to apply the patch 5 of the SpacemiT reset driver [1].
> > > > =

> > > > Thanks,
> > > > Yixun Lan
> > > > =

> > > > Link: https://lore.kernel.org/r/20250702113709.291748-6-elder@riscs=
tar.com [1]
> > > =

> > > Sorry I didn't notice before, this is missing k1-syscon.h from Patch =
2.
> > > =A0
> > no problem
> > =

> > > Can we get a clock maintainer ack to place patch 2 in the shared tag =
as
> > > well? Otherwise you could split patch 2 into soc and clk parts.
> > for the ack, I'd assume Stephen have no objection (Cc him explicitly)
> > =

> > technically, there is no problem to place more patches in the shared
> > tag, since the tag will be both sent(by me) to clock and reset tree,
> > so no conflicts in the end.
> > =

> > if you expect to at least pass compiling test with patch 5 in reset
> > branch only, then patch 1, 2, 3 should be included, otherwise need to
> > pull clk branch for additional dependency patches.
> =

> 3 as well? Oh, that's for struct spacemit_ccu_adev. IMHO this patch
> series is not well structured for applying across trees. This should
> have been a single patch that adds include/soc/spacemit/k1-syscon.h, to
> be shared by both clk and reset trees, and no other dependencies
> between clk and reset patches for this to work well.

I feel this is much difficult, e.g. the patch 2 touches both drivers/clk
and include/soc/spacemit/k1-syscon.h - moving definitions, and splitting
into two patches sounds weird

> =

> > I would propose to have shared tag to include patch 1-4, then you can
> > pick patch 5, in this way, it should both pass all tests (both
> > compile-time and run-time)would would =

> =

> Since this is a new driver, passing run-time tests is not a concern.
> Compile-time is, since that would break bisectability for everyone.
> =

make sense

> > what do you think?
> =

> I feel like it's easier and safer for the whole series to be merged via
> the clk tree. Since this adds a new reset driver, the only possible
> merge conflicts are trivial ones in drivers/reset/{Kconfig,Makefile}.
> =

ok, I agree, then let's route the whole series via clk tree, and I assume =

Stephen is fine with this, since it's indeed much simple.

thanks

-- =

Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
