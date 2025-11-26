Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69009D10F28
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 16:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVfqwiRY0Qyzj/laVJZjnFCD3g8um55GLEFdu7gJ9wc=; b=cRatMjL/Gf9tEd
	D2JdsjzKYMk+oD/OYUfeWPR8u1j8kzOB6Uq6C1lEF5+504Kl7/tbYp1uaJudIOL0Qq90Ct+m9JzAy
	csUNhnzOaP3ljCCaNA+QJHlFjbSOimsoQB95tyGnb4IFbjul/PFGrGcO3B+vzYkj/d5oRe6SHVhmi
	KMRvgEXyTbokO1kWRyHm+I7wCFm3vIc0lBSCRBTjYKwFyyoJk/b84i5fzUe3E7r2OGIvTSbtBFYED
	uUIN5BD5YFDmVZBB2Qkp9u8KCrdCFNBNzIdaMfFeazokZs0Xssn8wUIsnT4rzaVljxNHZfJVRmJBT
	G2HPKTcEH0ouIx8Bhqfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIJK-0000000FIVT-0FLi;
	Wed, 26 Nov 2025 16:24:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIJJ-0000000FIVK-1R5J
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 16:24:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E96A601B2;
	Wed, 26 Nov 2025 16:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251B9C4CEF7;
	Wed, 26 Nov 2025 16:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764174244;
	bh=xkgwF078Wy7iyBarI+z1Q/5lGrdVNPXLHbM0vTEeQRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pivBNJQ0uIcxpd7mJi7OVhRQ1/s4KNNegcRY3Nk7u6oND9eQLWUU8JFbSW1c0UqqG
	 iJ9wgQmO1vBLvgbV9SrQjoSbEkepHpoY6G3KDJln2ozeZ2eVxX+h6TbYu3ZpWAXq88
	 eCURFu4u56NpC9ATLBqeTX0WwBH7pscqYEtctJbO0yLO8RGC0tTIvFsiPKftMVuAXt
	 8OjZd2fYQlq6YeHDz3T65OpBWfRhGlHU5vy9S5oAl/fFFAyeGlcoFDQfqCf5V2cwKS
	 ywE6aZ59NmlNUMSkz0f13JirqIX8O3zKI5DvKYuoVzdIgK++qRkx1g+xVP5n+TRdtZ
	 Ho6pN2w/iR8og==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vOIJJ-000000003G6-3LNN;
	Wed, 26 Nov 2025 17:24:05 +0100
Date: Wed, 26 Nov 2025 17:24:05 +0100
From: Johan Hovold <johan@kernel.org>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH] mailbox: th1520: fix clock imbalance on probe failure
Message-ID: <aScppcza9xwGwqn3@hovoldconsulting.com>
References: <20251017055414.7753-1-johan@kernel.org>
 <aRGswsgOmPGXMjMI@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aRGswsgOmPGXMjMI@hovoldconsulting.com>
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

On Mon, Nov 10, 2025 at 10:13:38AM +0100, Johan Hovold wrote:
> On Fri, Oct 17, 2025 at 07:54:14AM +0200, Johan Hovold wrote:
> > The purpose of the devm_add_action_or_reset() helper is to call the
> > action function in case adding an action ever fails so drop the clock
> > disable from the error path to avoid disabling the clocks twice.
> > 
> > Fixes: 5d4d263e1c6b ("mailbox: Introduce support for T-head TH1520 Mailbox driver")
> > Cc: Michal Wilczynski <m.wilczynski@samsung.com>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> 
> Can this one be picked up for 6.19?

It's been another month so sending another reminder. Can this one be
picked up for 6.19?

Johan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
