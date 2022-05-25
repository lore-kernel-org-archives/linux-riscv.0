Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4930EC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 11:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8CNOu8lYLDQxzcckMH7NmopWqPIC4HGNX7QmGctICA=; b=VPqIv+7nUD9S4O
	KDjZqfZR3IrbUGI21ZzwNuzVgu+CWGE83/5+1FdZWmyE66DK1nrptddPSSnFQRlYgyk2m+L5E8Qqm
	O4s1xtSwjq9hEoP3XAjzN94wOWvkuNxbDIxJJaOUnanKt9xaU48EeEPwXLDC5gptjATUQGpKayU2u
	2jkvU0HMcS1CqBNW1JQxsEbV219aDpSKqgVi90ldAk2XuBVjJAGd1fqpzBEcwzMJfm/gWmXqxSZVd
	nAxjC/X27dnoP+3EP8kA1k7t1L+zb05js9KxpIZKTx8KfyVxEYZpAq3M4s+r1W2BjB+T56IzrUdoA
	qzZXDegT4p/nNpdJfGlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntouL-00Aol6-Pb; Wed, 25 May 2022 11:10:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntouI-00AokO-JT; Wed, 25 May 2022 11:10:28 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1ntou5-0005Nh-BQ; Wed, 25 May 2022 13:10:13 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Guo Ren <guoren@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, linux-s390 <linux-s390@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Parisc List <linux-parisc@vger.kernel.org>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, the arch/x86 maintainers <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V9 20/20] riscv: compat: Add COMPAT Kbuild skeletal support
Date: Wed, 25 May 2022 13:10:12 +0200
Message-ID: <3418219.V25eIC5XRa@diego>
In-Reply-To: <6435704.4vTCxPXJkl@diego>
References: <20220322144003.2357128-1-guoren@kernel.org> <20220524220646.GA3990738@roeck-us.net> <6435704.4vTCxPXJkl@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_041026_673959_4814F1FE 
X-CRM114-Status: GOOD (  27.77  )
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

Am Mittwoch, 25. Mai 2022, 12:57:30 CEST schrieb Heiko St=FCbner:
> Am Mittwoch, 25. Mai 2022, 00:06:46 CEST schrieb Guenter Roeck:
> > On Wed, May 25, 2022 at 01:46:38AM +0800, Guo Ren wrote:
> > [ ... ]
> > =

> > > > The problem is come from "__dls3's vdso decode part in musl's
> > > > ldso/dynlink.c". The ehdr->e_phnum & ehdr->e_phentsize are wrong.
> > > >
> > > > I think the root cause is from musl's implementation with the wrong
> > > > elf parser. I would fix that soon.
> > > Not elf parser, it's "aux vector just past environ[]". I think I could
> > > solve this, but anyone who could help dig in is welcome.
> > > =

> > =

> > I am not sure I understand what you are saying here. Point is that my
> > root file system, generated with musl a year or so ago, crashes with
> > your patch set applied. That is a regression, even if there is a bug
> > in musl.
> =

> Also as I said in the other part of the thread, the rootfs seems innocent,
> as my completely-standard Debian riscv64 rootfs is also affected.
> =

> The merged version seems to be v12 [0] - not sure how we this discussion
> ended up in v9, but I just tested this revision in two variants:
> =

> - v5.17 + this v9 -> works nicely

I take that back ... now going back to that build I somehow also run into
that issue here ... will investigate more.


> - v5.18-rc6 + this v9 (rebased onto it) -> breaks the boot
>   The only rebase-conflict was with the introduction of restartable
>   sequences and removal of the tracehook include, but turning CONFIG_RSEQ
>   off doesn't seem to affect the breakage.
> =

> So it looks like something changed between 5.17 and 5.18 that causes the =
issue.
> =

> =

> Heiko
> =

> =

> [0] https://lore.kernel.org/all/20220405071314.3225832-1-guoren@kernel.or=
g/
> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
