Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A10CA5FCF
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 16:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEGKxNpzHNMBqBQseXTnuf/Ma/fWEve7aXJw+ixwx7A=; b=hYtO1kiSQtj7b7KmpPeTsTj/Ye
	w9LgkupVMx1m29Rjs8nMAGTltAmQR78FDjbn9CVC6vtgg/ZjEUd+0afoPYQ2Jh+DosAtjVk0hyi5P
	nKILb85OCTv67WZgLDfVBKqYK+zgeOvRE45tfMdc4/sJOr8sgMgYUAS0B4+G4XXstACkzddHEPooM
	EzVeFCVt0EuOwRl6epwLf7Yud1Mm3np68L9YABrDHI+Tx3ATEpC9IHsEkzfZn0NjfmtVZ2PcAqzgq
	g6cv3LJVjehSa3Olkz2GnY2NxsOwLg0IsZFJFgRe5hgj6IDcuA8K25N9UkD4tD8frrg9XObiW4HYa
	iCHPTA3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJuF-00000009lGT-2pHk;
	Thu, 01 Oct 2026 16:45:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJuE-00000009lGM-3oSQ
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 16:45:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9032543584;
	Thu,  1 Oct 2026 16:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F941F00898;
	Thu,  1 Oct 2026 16:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790873114;
	bh=oiy1TAmPvuT7fLgnrKrdYEj5f+TvhnwsMZ7DNxp6rLQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=iT9Mtm6wRxYeDEIlw+cANrV8UaSNQf0lRzkY+mc7M4JJ/UisPozUXJ90qCFrebGQm
	 6G3DBn3zXNvHRgJexj/zsUqs0ZbFkPQm5R9jxnORayKqYHXuf5cGv4jEeOeGuNEiPj
	 eKHrDx2bLiBemd0nck2O3srd4zLlKouT2Et4F6cLGTgme0seXFx9s70l2LRexkykAi
	 /OyUOz2G8EP6NqaWOJPV7hQ6Q+39AdsPKxF3VUI100I5yUFmYxSfeLbnCkXHP2NjTv
	 jS3dtnCs6dvhRoiPprGFwgoc82qODCT0Ryp/6y1qV1YY1uAD7/wgEnTxULZcldugd3
	 k6WxzWqub6JXg==
Date: Thu, 1 Oct 2026 10:45:11 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Thorsten Blum <blum@kernel.org>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>, 
    Zong Li <zong.li@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
    Zishun Yi <vulab@iscas.ac.cn>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: process: Use str_supported_unsupported() in
 compat_mode_detect()
In-Reply-To: <aruH26spDeM8O9dh@kernel.org>
Message-ID: <7d4e8a05-4e4e-55be-2a9d-715c65787c38@kernel.org>
References: <20260924213256.122530-2-blum@kernel.org> <15d659fe-c9cb-fa65-5dd6-7182fb152317@kernel.org> <CAMuHMdVK-MzcnNgobviFf8rxkko_sBT43+gZdEG45fN+vyo1xA@mail.gmail.com> <aruH26spDeM8O9dh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-407165345-1790873114=:2885293"
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-407165345-1790873114=:2885293
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Tue, 29 Sep 2026, Thorsten Blum wrote:

> On Tue, Sep 29, 2026 at 11:11:55AM +0200, Geert Uytterhoeven wrote:
> > Hi Paul, Thorsten,
> > 
> > On Sat, 26 Sept 2026 at 01:48, Paul Walmsley <pjw@kernel.org> wrote:
> > > On Thu, 24 Sep 2026, Thorsten Blum wrote:
> > > > Replace hard-coded strings with the str_supported_unsupported() helper.
> > > > This unifies the output and helps the linker with deduplication, which
> > > > can result in a smaller binary.
> > > >
> > > > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > >
> > > Thanks, queued for v7.4.
> > 
> > Thanks for your patch, which is now commit a06776565b9e7351 ("riscv:
> > process: Use str_supported_unsupported() in compat_mode_detect()")
> > in riscv/for-next.
> > 
> > This fails to build:
> > 
> >     arch/riscv/kernel/process.c: In function ‘compat_mode_detect’:
> >     arch/riscv/kernel/process.c:138:17: error: implicit declaration of
> > function ‘str_supported_unsupported’
> > [-Werror=implicit-function-declaration]
> >       138 |                 str_supported_unsupported(compat_mode_supported));
> >           |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > as it has a hard dependency on commit 5383cf280ef4f00b
> > ("lib/string_choices: Add str_supported_unsupported()
> > helper"), which is only present in the for-next branch of
> > https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git.
> 
> Hi Geert,
> 
> It's also in linux-next:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5383cf280ef4f00b15f1d9e2a2886d0d02c0118b

I'm dropping this one until the dependency lands in mainline.  


- Paul
--8323329-407165345-1790873114=:2885293
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-407165345-1790873114=:2885293--

