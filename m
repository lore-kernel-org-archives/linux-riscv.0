Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BDFC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 05:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7l1ZpT0+W1dZrJDzNidMbG5GSua5bfjOlEJgGjWSPwY=; b=EP14/dMLZ2shlA
	cgsScjxHXBEgYqhTOrEA7KExHlU1qJpR9T6N1yh/DG/ey5crKjL0dmgxUCFh8BavzNk7U+rtvkddi
	Ti2XXauYvIVFXXTXgUEXrkw88VV2JpGj5y92L+OtrYf723/wEK029AjB0owuB5rzSfasQgSA8kFvH
	0aveeya2WWRSk6CYpy79+vOHXjMY2X24Xdb3xS3f5x+Nn7t0XtMf/Y/RQgJxVvl7ENPMxZ671rJFj
	cIufjrDyw+X8YVOn3WkW6zyP6+DiuIkxmhUqH1N4EIoBiUdoSnaH963Qb6s20sAtamWTE0yeWS8pK
	OCufsg9e/gvVlF2pnSgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhSM-000000014CU-17dt;
	Thu, 09 Jul 2026 05:37:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhSL-000000014CK-1Vd3
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 05:37:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CB686001A;
	Thu,  9 Jul 2026 05:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7B91F00A3A;
	Thu,  9 Jul 2026 05:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783575472;
	bh=y+pTLhn6W58N20DcjozQNEoPOUgwkKRkMV3SDzEHt9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MYm0qmuOrJD5dc7w5igG+Tn72c74/kARnY6HJlmu00Rv2rtDzOBeahWTPMuKqc4mh
	 iUKP1cwNv4v3dEg88xF6k+LLIWy4Y7se8R7XoexAIwWTJVw1Ki+lTTMoexpebMmZlU
	 oUMjf7SE/Pt7ZOc09Kb5sVNZjha9ge5u2T/vVw4zOj4KoUuRz1nZ/uxxQTnSg3v0uT
	 HJaWtWCeq3BRmKPkOyXHKON/17t62c4RTRxIGBBNGRq9MPhrhCONjlXwSOPYmPOQ2A
	 NFs8iFXTGZhzILU4Hdc5QYsbZG+FFTmNHWwsZswziVTB/g1wcXwBEkslHjgean8JJ3
	 vVCBZwZoaBUOQ==
Date: Wed, 8 Jul 2026 22:37:50 -0700
From: Drew Fustini <fustini@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Subject: Re: [PATCH v2] riscv: defconfig: thead: enable PCA953X GPIO driver
Message-ID: <ak8zrng11+wIHbJh@x1>
References: <CGME20260608074116eucas1p15c0f84c280d8645d778e42777bd238d1@eucas1p1.samsung.com>
 <20260608074104.2198409-1-m.szyprowski@samsung.com>
 <airfSHk5h/u/d2O/@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <airfSHk5h/u/d2O/@x1>
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

On Thu, Jun 11, 2026 at 09:16:08AM -0700, Drew Fustini wrote:
> On Mon, Jun 08, 2026 at 09:41:04AM +0200, Marek Szyprowski wrote:
> > Enable PCA953X GPIO driver to properly probe Wifi pwrseq driver on
> > LicheePi4a board.
> > 
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> > v2:
> > - copile GPIO_PCA953X as a module
> > v1:
> > https://lore.kernel.org/all/20260603082132.3200787-1-m.szyprowski@samsung.com/
> > ---
> >  arch/riscv/configs/defconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 08445df56006..a51a423d53f4 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -174,6 +174,8 @@ CONFIG_PINCTRL_SOPHGO_SG2002=y
> >  CONFIG_GPIO_DWAPB=y
> >  CONFIG_GPIO_SIFIVE=y
> >  CONFIG_GPIO_SPACEMIT_K1=y
> > +CONFIG_GPIO_PCA953X=m
> > +CONFIG_GPIO_PCA953X_IRQ=y
> >  CONFIG_POWER_RESET_GPIO_RESTART=y
> >  CONFIG_SENSORS_SFCTEMP=m
> >  CONFIG_CPU_THERMAL=y
> > -- 
> > 2.34.1
> > 
> 
> I have applied this to my riscv-config-for-next branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=riscv-config-for-next&id=fb266bbe9aef17d547db468a1a7187b59ed33e9a

My pull request was too late for 7.1 so I have rebased now on 7.2-rc1:

https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=riscv-config-for-next&id=fd52109054693750f38d6fae134cffd1ac8c9c74

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
